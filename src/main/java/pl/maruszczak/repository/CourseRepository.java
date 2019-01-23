package pl.maruszczak.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.maruszczak.model.Course;

import java.util.List;


public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findAllByOrderByStartDate();

}
