package pl.maruszczak.model;


import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;

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

    @ColumnDefault("false")
    private boolean confirmed;

    private String paid;

    @Column(name = "bench_warmer")
    private Boolean isBenchWarmer;

    public SailorCourse() {
    }

    public SailorCourse(Sailor sailor, Course course, Date entryDate, Boolean isBenchWarmer) {
        this.sailor = sailor;
        this.course = course;
        this.entryDate = entryDate;
        this.isBenchWarmer = isBenchWarmer;
    }
}
