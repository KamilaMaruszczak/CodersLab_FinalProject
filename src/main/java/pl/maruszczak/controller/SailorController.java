package pl.maruszczak.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.maruszczak.model.SailorCourse;
import pl.maruszczak.repository.SailorCourseRepository;
import pl.maruszczak.repository.SailorRepository;

@Controller
@RequestMapping("/sailor")
public class SailorController {

    @Autowired
    private SailorRepository sailorRepository;

    @Autowired
    private SailorCourseRepository sailorCourseRepository;


    @RequestMapping(value = "/confirm/{sailorCourseId}", produces = "text/html; charset=utf-8")
    public String confirmSailor(@PathVariable Long sailorCourseId) {
        SailorCourse sc = sailorCourseRepository.findOne(sailorCourseId);
        sc.setConfirmed(true);
        sailorCourseRepository.save(sc);
        return "redirect:/course/all";
    }

    @RequestMapping(value = "/delete/{sailorCourseId}", produces = "text/html; charset=utf-8")
    public String deleteSailor(@PathVariable Long sailorCourseId) {
        SailorCourse sc = sailorCourseRepository.findOne(sailorCourseId);
        sailorCourseRepository.delete(sc);
        return "redirect:/";
    }
}
