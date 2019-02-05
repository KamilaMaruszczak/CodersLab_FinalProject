package pl.maruszczak.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.maruszczak.model.Course;
import pl.maruszczak.model.Sailor;
import pl.maruszczak.model.SailorCourse;

import java.util.Date;
import java.util.List;

public interface SailorCourseRepository extends JpaRepository<SailorCourse, Long> {

    List<SailorCourse> findAllBySailor(Sailor sailor);

    List<SailorCourse> findAllByCourse(Course course);


    @Query("select sc.sailor from SailorCourse sc where sc.course=?1")
    List<Sailor> queryFindSailorsOnCourse(Course course);

    @Query("select sc.course from SailorCourse sc where sc.sailor=?1 ")
    List<Course> queryFindCoursesBySailor(Sailor sailor);

    @Query("select sc from SailorCourse sc where sc.sailor=?1 and sc.course=?2")
    SailorCourse queryFindBySailorAndCourse(Sailor sailor, Course course);

    @Query("select sc from SailorCourse sc where sc.sailor=?1 and sc.course.startDate>?2 order by sc.course.startDate")
    List<SailorCourse> queryFindBySailorOrdered(Sailor sailor, Date date);


}
