package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Course;
import pl.coderslab.repository.CourseRepository;


public class CourseConverter implements Converter<String, Course> {
    @Autowired
    CourseRepository courseRepository;

    @Override
    public Course convert(String s) {
        return courseRepository.findOne(Long.parseLong(s));
    }
}
