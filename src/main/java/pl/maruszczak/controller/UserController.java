package pl.maruszczak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.maruszczak.model.Course;
import pl.maruszczak.model.Sailor;
import pl.maruszczak.model.SailorCourse;
import pl.maruszczak.model.User;
import pl.maruszczak.repository.CourseRepository;
import pl.maruszczak.repository.SailorCourseRepository;
import pl.maruszczak.repository.SailorRepository;
import pl.maruszczak.repository.UserRepository;
import pl.maruszczak.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.*;

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

    @Autowired
    private SailorCourseRepository sailorCourseRepository;


    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "/user/add";
    }

    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = {RequestMethod.POST})
    public String add(@Valid User user, BindingResult result, @RequestParam String repeatPassword, HttpSession session) {


        if (result.hasErrors() || !user.getPassword().equals(repeatPassword)) {
            result.addError(new FieldError("user", "password", "hasła się nie zgadzają"));
            return "/user/add";
        }

        userService.save(user);
        sessionSet(user, session);
        return "redirect:/";

    }

    private void sessionSet(User user, HttpSession session) {
        session.setAttribute("email", user.getEmail());
        session.setAttribute("name", user.getName());
        session.setAttribute("instructor", user.isInstructor());
        session.setAttribute("admin", user.isAdmin());

    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {


        if (userService.login(email, password)) {
            User user = userRepository.findUserByEmail(email);
            sessionSet(user, session);

            if (user.isInstructor()) {
                return "redirect:/course/all";
            } else {
                return "redirect:/";
            }

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
        List<Sailor> courseList = sailorCourseRepository.queryFindSailorsOnCourse(course);
        List<Sailor> userList = user.getSailors();
        courseList.retainAll(userList);
        userList.removeAll(courseList);
        model.addAttribute("userSailors", userList);
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
        int numberOfSailorsOnCourse = sailorCourseRepository.findAllByCourse(course).size();
        if (numberOfSailorsOnCourse < course.getNumberOfBoats()) {
            SailorCourse sailorCourse = new SailorCourse(sailor, course, Calendar.getInstance().getTime());
            sailorCourseRepository.save(sailorCourse);
            model.addAttribute("course", course);
        }

        return "redirect:/user/courses";
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
        return "/user/edit";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@PathVariable Long id, @RequestParam(defaultValue = "false") Boolean instructor, @RequestParam(defaultValue = "false") Boolean admin, @RequestParam String phone, @RequestParam String name) {
        User user = userRepository.findOne(id);

        user.setInstructor(instructor);
        user.setAdmin(admin);

        if (!user.getPhone().equals(phone)) {
            user.setPhone(phone);
        }
        if (!user.getName().equals(name)) {
            user.setName(name);
        }

        userRepository.save(user);
        return "redirect:/user/all";

    }

    @RequestMapping(value = "/resetpassword/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String reset(@PathVariable Long id, Model model) {
        User user = userRepository.findOne(id);
        model.addAttribute("user", user);
        return "/user/resetpassword";
    }

    @RequestMapping(value = "/resetpassword/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String reset(@PathVariable Long id, @RequestParam String password, @RequestParam String repeatPassword, Model model) {
        User user = userRepository.findOne(id);
        if (!password.equals(repeatPassword)) {
            model.addAttribute("error", "hasła się nie zgadzają");
            model.addAttribute("user", user);
            return "/user/resetpassword";
        } else if (password.isEmpty() || repeatPassword.isEmpty()) {
            model.addAttribute("error", "pola nie mogą być puste");
            model.addAttribute("user", user);
            return "/user/resetpassword";
        }

        user.setPassword(password);
        userService.save(user);
        return "redirect: /user/all";
    }



    @RequestMapping(value = "/delete/{id}", produces = "text/html; charset=utf-8")
    public String delete(@PathVariable Long id) {
        userRepository.delete(id);
        return "redirect:/user/all";
    }

    @RequestMapping(value = "/courses", produces = "text/html; charset=utf-8")
    public String courses(@SessionAttribute String email, Model model) {
        User user = userRepository.findUserByEmail(email);
        Date date = new Date();
        date.setDate(1);
        date.setMonth(0);
        List<Sailor> sailors = user.getSailors();
        List<SailorCourse> list = new ArrayList<>();
        for (Sailor sailor : sailors) {
            list.addAll(sailorCourseRepository.queryFindBySailorOrdered(sailor, date));
        }
        model.addAttribute("sailorCourseList", list);
        return "/user/courses";
    }


}
