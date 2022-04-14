package com.techelevator.dao;

import com.techelevator.model.Brewery;

import java.util.List;

public interface BreweryDao {

    List<Brewery> listAll();

    Brewery getBreweryById(int breweryId);

    Brewery findByName(String name);

    List<Brewery> findByLocation(String location);

    Brewery create(String name, String location, String phoneNumber, String hoursOfOperation, String address,
                   String bio, String imgUrl, boolean active);

}
