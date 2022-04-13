package com.techelevator.dao;

import com.techelevator.model.Brewery;
import org.springframework.stereotype.Component;

import java.util.List;
@Component
public interface BreweryDao {

    List<Brewery> listAll();

    Brewery getBreweryById(int breweryId);

    Brewery findByName(String name);

    List<Brewery> findByLocation(String location);

    Brewery create(String name, String location);

}
