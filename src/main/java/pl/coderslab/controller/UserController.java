package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.Course;
import pl.coderslab.model.Sailor;
import pl.coderslab.model.User;
import pl.coderslab.repository.CourseRepository;
import pl.coderslab.repository.SailorRepository;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private SailorRepository sailorRepository;


    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "/user/add";
    }

    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = {RequestMethod.POST})
    public String add(@Valid User user, BindingResult result, @RequestParam String repeatPassword) {


        if (result.hasErrors()) {
            return "/user/add";
        }
        if (!user.getPassword().equals(repeatPassword)) {
            result.addError(new FieldError("user", "password", "Hasła się nie zgadzają"));
            return "/user/add";
        }
        userService.save(user);
        return "redirect:/";

    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpSession session) {
        if (session.getAttribute("email") == null) {
            return "/user/login";
        } else {
            return "/user/logout";
        }
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {


        if (userService.login(email, password)) {
            session.setAttribute("email", email);
            User user = userRepository.findUserByEmail(email);
            session.setAttribute("name", user.getName());
            session.setAttribute("instructor", user.isInstructor());
            return "redirect:/";
        } else {
            model.addAttribute("error", "Błędny adres email lub hasło");
            return "/user/login";
        }

    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/course/{id}", method = RequestMethod.GET)
    public String addUserToCourse(@PathVariable Long id, Model model, @SessionAttribute(required = false) String email) {

        if (email == null) {
            return "redirect:/user/login";
        } else {
            return "redirect:/user/course-confirm/" + id;
        }

    }

    @RequestMapping(value = "/course-confirm/{id}", method = RequestMethod.GET)
    public String course(@PathVariable Long id, Model model, @SessionAttribute String email) {
        Course course = courseRepository.findOne(id);
        User user = userRepository.findUserByEmail(email);
        model.addAttribute("userSailors", user.getSailors());
        model.addAttribute("course", course);
        model.addAttribute("sailor", new Sailor());
        return "/user/confirm";
    }

    @RequestMapping(value = "/course-confirm/existing/{courseId}", method = RequestMethod.POST)
    public String courseUpdate(Sailor sailor, @PathVariable Long courseId, Model model, @SessionAttribute String email) {

        sailor = sailorRepository.findOne(sailor.getId());

        return addSailor(email, sailor, courseId, model);

    }

    @RequestMapping(value = "/course-confirm/new/{courseId}", method = RequestMethod.POST)
    public String courseUpdate(@Valid Sailor sailor, BindingResult result, @PathVariable Long courseId, Model model, @SessionAttribute String email) {

        if (result.hasErrors()) {
            Course course = courseRepository.findOne(courseId);
            model.addAttribute("course", course);
            return "/user/confirm";
        } else {
            User user = userRepository.findUserByEmail(email);
            sailor.setUser(user);
            sailorRepository.save(sailor);
            return addSailor(email, sailor, courseId, model);
        }
    }

    private String addSailor(String email, Sailor sailor, Long courseId, Model model) {

        Course course = courseRepository.findOne(courseId);
        List<Sailor> list = course.getSailors();
        list.add(sailor);
        course.setSailors(list);
        courseRepository.save(course);
        model.addAttribute("course", course);
        return "redirect:/";
    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String all(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "/user/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model) {
        User user = userRepository.findOne(id);
        model.addAttribute("user", user);
        return "/user/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid User user, BindingResult result) {

        if (result.hasErrors()) {
            return "/user/add";
        }
        userRepository.save(user);
        return "redirect:/user/all";

    }


    @RequestMapping(value = "/delete/{id}", produces = "text/html; charset=utf-8")
    public String delete(@PathVariable Long id) {
        userRepository.delete(id);
        return "redirect:/user/all";
    }


}
