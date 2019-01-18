package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.coderslab.model.Sailor;


public interface SailorRepository extends JpaRepository<Sailor, Long> {


}
