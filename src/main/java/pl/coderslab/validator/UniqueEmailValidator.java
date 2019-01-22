package pl.coderslab.validator;

import org.springframework.beans.factory.annotation.Autowired;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.List;

public class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void initialize(UniqueEmail uniqueEmail) {

    }

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        List<String> emailList = userRepository.queryFindAllEmails();

        return !emailList.contains(email);
    }
}
