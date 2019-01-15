package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;
import pl.coderslab.service.UserService;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@SessionAttributes
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("user", new User());
        return "/user/add";
    }

    @RequestMapping(value = "/register", produces = "text/html; charset=utf-8", method = {RequestMethod.POST})
    public String add(@Valid User user, BindingResult result) {


        if (result.hasErrors()) {
            return "/user/add";
        }
        userService.save(user);
        return "redirect:/";

    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String all(Model model) {
        List<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "/user/all";
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "/user/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
        if (userService.login(email, password)) {
            session.setAttribute("email", email);
            return "redirect:/";
        } else {
            model.addAttribute("error", "Błędny adres email lub hasło");
            return "/user/login";
        }
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
