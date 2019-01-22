package pl.coderslab.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.NotBlank;
import pl.coderslab.validator.YearOfBirth;

import javax.persistence.*;
import java.util.Calendar;
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

    @ManyToMany(mappedBy = "sailors")
    @LazyCollection(LazyCollectionOption.FALSE)
    private List<Course> course;

    private boolean confirmed;

    private Integer paid;


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
