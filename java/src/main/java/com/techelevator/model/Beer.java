package com.techelevator.model;

import java.util.Objects;

public class Beer {

    private int id;
    private String name;
    private String imgURL;
    private String description;
    private float abv;
    private String type;
    private int breweryID;

    public Beer(){

    }

    public Beer(int id, String name, String imgURL, String description, float abv, String type) {
        this.id = id;
        this.name = name;
        this.imgURL = imgURL;
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

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Beer beer = (Beer) o;
        return id == beer.id &&
                Objects.equals(name, beer.name) &&
                Objects.equals(imgURL, beer.imgURL) &&
                Objects.equals(description, beer.description) &&
                Objects.equals(abv, beer.abv) &&
                Objects.equals(type, beer.type);
    }
}
