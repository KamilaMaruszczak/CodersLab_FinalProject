package pl.maruszczak.model;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import pl.maruszczak.validator.YearOfBirth;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "sailors")
@Getter
@Setter

public class Sailor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    private String name;

    @Column(name = "year_of_birth")
    @YearOfBirth
    private Integer yearOfBirth;

    @ManyToOne
    private User user;

//    @ManyToMany(mappedBy = "sailors")
//    @LazyCollection(LazyCollectionOption.FALSE)
//    private List<Course> course;

    @OneToMany(mappedBy = "sailor")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<SailorCourse> sailorCourses;


    @Override
    public String toString() {
        return "Sailor{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", yearOfBirth=" + yearOfBirth +
                '}';
    }

    public boolean equals(Object o) {
        Sailor sailor = (Sailor) o;
        return this.id.equals(sailor.id);
    }
}
