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
    private int breweryId;
    private boolean available;


    public Beer(){

    }

    public Beer(int id, String name, float abv, String type, int ibu, String hops, String description, String beer_img, String malts, int breweryId, boolean available) {
        this.id = id;
        this.name = name;
        this.abv = abv;
        this.type = type;
        this.ibu = ibu;
        this.hops = hops;
        this.description = description;
        this.beer_img = beer_img;
        this.malts = malts;
        this.breweryId = breweryId;
        this.available = available;
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
        return breweryId;
    }

    public void setBreweryID(int breweryId) {
        this.breweryId = breweryId;
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

    @Override
    public String toString() {
        return "id: " + id + ", name: " + name + ", abu: " + abv + ", type: " + type + ", ibu: " + ibu + ", hops: " + hops + ", description: " + description + ", beer_img: " + beer_img + ", malts: " + malts + ", breweryId: " + breweryId;
    }
}
