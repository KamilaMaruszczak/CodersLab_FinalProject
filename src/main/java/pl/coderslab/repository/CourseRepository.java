package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Course;

import java.util.List;


public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findAllByOrderByStartDate();
}
