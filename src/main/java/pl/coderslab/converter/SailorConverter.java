package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.model.Sailor;
import pl.coderslab.repository.SailorRepository;


public class SailorConverter implements Converter<String, Sailor> {
    @Autowired
    SailorRepository sailorRepository;

    @Override
    public Sailor convert(String s) {

        return sailorRepository.findOne(Long.parseLong(s));
    }
}