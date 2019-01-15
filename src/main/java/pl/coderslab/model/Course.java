package pl.coderslab.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

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


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;

    @OneToOne
    private User instructor;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private List<User> users;


}
