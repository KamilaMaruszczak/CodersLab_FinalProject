package pl.maruszczak.validator;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Constraint(validatedBy = YearOfBirthValidator.class)
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface YearOfBirth {
    String message() default "Żeglarz jest zbyt młody. Zapraszamy, gdy skończy 7 lat :)";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
