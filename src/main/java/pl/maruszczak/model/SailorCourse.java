package pl.maruszczak.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "sailor_course")
@Getter
@Setter

public class SailorCourse {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private Sailor sailor;

    @ManyToOne
    private Course course;

    private Date entryDate;

    private boolean confirmed;

    private Integer paid;

}
