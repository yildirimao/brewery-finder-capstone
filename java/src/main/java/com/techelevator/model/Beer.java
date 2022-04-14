package com.techelevator.model;

import java.util.Objects;

public class Beer {

    private int id;
    private String name;
    private float abv;
    private String type;
    private int ibu;
    private String hops;
    private String description;
    private String beer_img;
    private String malts;
    private boolean available;
    private int brewery_id;

    private int breweryID;

    public Beer(){

    }

    public Beer(int id, String name, String imgURL, String description, float abv, String type) {
        this.id = id;
        this.name = name;
        this.beer_img = imgURL;
        this.description = description;
        this.abv = abv;
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBeer_img() {
        return beer_img;
    }

    public void setBeer_img(String beer_img) {
        this.beer_img = beer_img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getAbv() {
        return abv;
    }

    public void setAbv(float abv) {
        this.abv = abv;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getBreweryID() {
        return breweryID;
    }

    public void setBreweryID(int breweryID) {
        this.breweryID = breweryID;
    }

    public int getIbu() {
        return ibu;
    }

    public void setIbu(int ibu) {
        this.ibu = ibu;
    }

    public String getHops() {
        return hops;
    }

    public void setHops(String hops) {
        this.hops = hops;
    }

    public String getMalts() {
        return malts;
    }

    public void setMalts(String malts) {
        this.malts = malts;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public int getBrewery_id() {
        return brewery_id;
    }

    public void setBrewery_id(int brewery_id) {
        this.brewery_id = brewery_id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Beer beer = (Beer) o;
        return id == beer.id &&
                Objects.equals(name, beer.name) &&
                Objects.equals(beer_img, beer.beer_img) &&
                Objects.equals(description, beer.description) &&
                Objects.equals(abv, beer.abv) &&
                Objects.equals(type, beer.type);
    }
}
