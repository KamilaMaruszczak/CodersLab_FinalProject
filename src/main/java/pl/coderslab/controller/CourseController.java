package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.dto.CoursesDto;
import pl.coderslab.model.Course;
import pl.coderslab.model.User;
import pl.coderslab.repository.CourseRepository;
import pl.coderslab.repository.UserRepository;


import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CoursesDto coursesDto;

    @ModelAttribute("coursesType")
    public List<String> type() {

        return coursesDto.getType();
    }

    @ModelAttribute("instructor")
    public List<User> instructor() {
        return userRepository.queryFindInstructors();
    }



    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("course", new Course());
        return "/course/add";
    }

    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = {RequestMethod.POST})
    public String add(@Valid Course course, BindingResult result) {


        if (result.hasErrors()) {
            return "/course/add";
        }
        courseRepository.save(course);
        return "redirect:/";

    }

    @RequestMapping(value = "/all", produces = "text/html; charset=utf-8")
    public String all(Model model) {
        List<Course> courses = courseRepository.findAllByOrderByStartDate();
        model.addAttribute("courses", courses);
        return "/course/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model) {
        Course course = courseRepository.findOne(id);
        model.addAttribute("courses", course);
        return "/course/add";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.POST)
    public String update(@Valid Course course, BindingResult result) {

        if (result.hasErrors()) {
            return "/course/add";
        }
        courseRepository.save(course);
        return "redirect:/course/all";

    }


    @RequestMapping(value = "/delete/{id}", produces = "text/html; charset=utf-8")
    public String delete(@PathVariable Long id) {
        courseRepository.delete(id);
        return "redirect:/course/all";
    }

}
