package pl.coderslab.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;

public class YearOfBirthValidator implements ConstraintValidator<YearOfBirth, Integer> {
    @Override
    public void initialize(YearOfBirth yearOfBirth) {

    }

    @Override
    public boolean isValid(Integer s, ConstraintValidatorContext constraintValidatorContext) {

        try {
            int nowYear = LocalDate.now().getYear();
            return (nowYear - s) >= 7;
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
    }
}
