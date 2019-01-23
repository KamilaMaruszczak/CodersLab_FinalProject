package pl.maruszczak.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.maruszczak.model.Sailor;


public interface SailorRepository extends JpaRepository<Sailor, Long> {


}
