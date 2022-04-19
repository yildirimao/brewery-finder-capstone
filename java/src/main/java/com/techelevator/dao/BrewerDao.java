package com.techelevator.dao;

import com.techelevator.model.Brewer;

import java.util.List;

public interface BrewerDao {

    List<Brewer> listAll();
    Brewer getBrewerByBrewerId(int brewerId);
    List<Brewer> listBrewersByBreweryId(int breweryId);
    Brewer createBrewer(int brewerId, int breweryId);
     void updateRole(int id);
}
