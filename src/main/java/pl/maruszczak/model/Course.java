package pl.maruszczak.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Future;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "courses")
@Getter
@Setter

public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String type;

    @Column(name = "number_of_boats")
    private int numberOfBoats;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Future
    private Date startDate;


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Future
    private Date endDate;

    @OneToOne
    private User instructor;

    @ManyToMany
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Sailor> sailors;

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", type='" + type + '\'' +
                ", numberOfBoats=" + numberOfBoats +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}
