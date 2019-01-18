package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.coderslab.model.Course;
import pl.coderslab.repository.CourseRepository;

import java.util.List;


@Controller
public class HomeController {

    @Autowired
    private CourseRepository courseRepository;

    @ModelAttribute("courses")
    public List<Course> getCourses() {
        return courseRepository.findAllByOrderByStartDate();
    }


    @RequestMapping(value = "/", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String home() {

        return "/home";
    }

    @RequestMapping(value = "/course/description", produces = "text/html; charset=utf-8")
    public String desc() {

        return "/course/description";
    }

}
