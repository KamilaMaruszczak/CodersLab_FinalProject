package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.model.Course;
import pl.coderslab.model.Sailor;

import java.util.List;

public interface SailorRepository extends JpaRepository<Sailor, Long> {


}
