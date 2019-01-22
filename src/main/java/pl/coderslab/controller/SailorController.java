package pl.coderslab.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.model.Sailor;
import pl.coderslab.repository.SailorRepository;

@Controller
@RequestMapping("/sailor")
public class SailorController {

    @Autowired
    private SailorRepository sailorRepository;


    @RequestMapping(value = "/confirm/{id}", produces = "text/html; charset=utf-8")
    public String confirmSailor(@PathVariable Long id) {
        Sailor sailor = sailorRepository.findOne(id);
        sailor.setConfirmed(true);
        sailorRepository.save(sailor);
        return "redirect:/course/all";
    }
}
