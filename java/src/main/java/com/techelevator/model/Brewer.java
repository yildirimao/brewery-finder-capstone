package com.techelevator.model;

public class Brewer {
    private int brewerId;
    private int breweryId;

    public Brewer() {

    }

    public Brewer(int brewerId, int breweryId){
        this.brewerId = brewerId;
        this.breweryId = breweryId;
    }

    public int getBrewerId() {
        return brewerId;
    }

    public void setBrewerId(int brewerId) {
        this.brewerId = brewerId;
    }

    public int getBreweryId() {
        return breweryId;
    }

    public void setBreweryId(int breweryId) {
        this.breweryId = breweryId;
    }
}
