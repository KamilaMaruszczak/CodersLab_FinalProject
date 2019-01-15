package pl.coderslab.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.coderslab.model.User;
import pl.coderslab.repository.UserRepository;

@Component
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public void save(User user) {
        String password = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(password);
        userRepository.save(user);
    }

    public Boolean login(String email, String password) {
        User user = userRepository.findUserByEmail(email);
        if (user != null) {
            String hashed = user.getPassword();
            if (BCrypt.checkpw(password, hashed)) {
                return true;
            }
        }
        return false;
    }
}
