package pl.maruszczak.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.maruszczak.model.Course;

import java.util.Date;
import java.util.List;


public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findAllByOrderByStartDateDesc();

    @Query(value = "select * from courses where YEAR(startDate)=?1 order by startDate", nativeQuery = true)
    List<Course> queryfindAllByYear(int year);

}
