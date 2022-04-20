package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {
    List<Beer> listAll();

    List<Beer> getListByBrewery(int breweryId);

    Beer getBeerById(int beerId);

    Beer getBeerByName(String name);

    Beer toggleBeerAvailability(int beerId);

    Beer create(Beer beerToCreate);

    void deleteBeer(int beerId);
}
