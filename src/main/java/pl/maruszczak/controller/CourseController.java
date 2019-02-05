package pl.maruszczak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.maruszczak.model.Course;
import pl.maruszczak.model.Sailor;
import pl.maruszczak.model.SailorCourse;
import pl.maruszczak.model.User;
import pl.maruszczak.repository.CourseRepository;
import pl.maruszczak.repository.SailorCourseRepository;
import pl.maruszczak.repository.SailorRepository;
import pl.maruszczak.repository.UserRepository;


import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SailorRepository sailorRepository;

    @Autowired
    private SailorCourseRepository sailorCourseRepository;

    @ModelAttribute("coursesType")
    public List<String> type() {
        List<String> type = new ArrayList<String>();
        type.add("OPTYMIST");
        type.add("EUROPA");
        type.add("OMEGA");
        return type;
    }

    @ModelAttribute("instructor")
    public List<User> instructor() {
        return userRepository.queryFindInstructors();
    }


    @RequestMapping(value = "/add", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String add(Model model) {
        model.addAttribute("course", new Course());
        model.addAttribute("type", "Dodaj");
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
        int year = Calendar.getInstance().get(Calendar.YEAR);
        List<Course> courses = courseRepository.queryfindAllByYear(year);
        model.addAttribute("courses", courses);

        return "/course/all";
    }

    @RequestMapping(value = "/edit/{id}", produces = "text/html; charset=utf-8", method = RequestMethod.GET)
    public String edit(@PathVariable Long id, Model model) {
        Course course = courseRepository.findOne(id);
        model.addAttribute("course", course);
        model.addAttribute("type", "Edytuj");
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

    @RequestMapping(value = "/print", produces = "text/html; charset=utf-8")
    public String print(Model model) {

        int year = Calendar.getInstance().get(Calendar.YEAR);
        List<Course> courses = courseRepository.queryfindAllByYear(year);
        model.addAttribute("courses", courses);
        return "/course/print";
    }

    @RequestMapping(value = "/history", produces = "text/html; charset=utf-8")
    public String history(Model model) {

        List<Course> courses = courseRepository.findAllByOrderByStartDateDesc();
        model.addAttribute("courses", courses);

        return "/course/history";
    }

}
