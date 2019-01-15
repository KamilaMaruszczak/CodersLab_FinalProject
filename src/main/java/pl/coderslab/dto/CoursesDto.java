package pl.coderslab.dto;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CoursesDto {

    public List<String> getType() {
        List<String> type = new ArrayList<String>();
        type.add("OPTYMIST");
        type.add("EUROPA");
        return type;
    }
}
