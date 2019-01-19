package pl.coderslab.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.validator.constraints.NotBlank;
import pl.coderslab.validator.YearOfBirth;

import javax.persistence.*;

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
