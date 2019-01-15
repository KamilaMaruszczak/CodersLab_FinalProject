package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.model.User;

import java.awt.print.Book;
import java.util.List;


public interface UserRepository extends JpaRepository<User, Long> {

    @Query("select u from User u where u.instructor = true")
    List<User> queryFindInstructors();

    User findUserByEmail(String email);
}
