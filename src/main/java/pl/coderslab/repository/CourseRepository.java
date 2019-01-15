package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Course;


public interface CourseRepository extends JpaRepository<Course, Long> {
}
