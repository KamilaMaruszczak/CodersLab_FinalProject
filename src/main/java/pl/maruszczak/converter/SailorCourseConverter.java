package pl.maruszczak.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.maruszczak.model.SailorCourse;
import pl.maruszczak.repository.SailorCourseRepository;


public class SailorCourseConverter implements Converter<String, SailorCourse> {
    @Autowired
    SailorCourseRepository sailorCourseRepository;

    @Override
    public SailorCourse convert(String s) {

        return sailorCourseRepository.findOne(Long.parseLong(s));
    }
}
