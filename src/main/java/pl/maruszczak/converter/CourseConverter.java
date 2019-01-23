package pl.maruszczak.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.maruszczak.model.Course;
import pl.maruszczak.repository.CourseRepository;


public class CourseConverter implements Converter<String, Course> {
    @Autowired
    CourseRepository courseRepository;

    @Override
    public Course convert(String s) {

        return courseRepository.findOne(Long.parseLong(s));
    }
}
