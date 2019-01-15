package pl.coderslab.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "courses")
@Getter
@Setter
@ToString
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type;

    @Column(name = "number_of_boats")
    private int numberOfBoats;

    private Date startDate;

    private Date endDate;

    @Column(name = "instructor")
    private String instructorName;

    @ManyToMany(cascade = CascadeType.MERGE)
    private List<User> users;


}
