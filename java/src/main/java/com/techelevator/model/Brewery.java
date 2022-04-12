package com.techelevator.model;

import java.util.Objects;

public class Brewery {

    private int id;
    private String name;
    private String location;

    public Brewery() {

    }

    public Brewery(int id, String name, String location) {
        this.id = id;
        this.name = name;
        this.location = location;
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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Brewery brewery = (Brewery) o;
        return id == brewery.id &&
                Objects.equals(name, brewery.name) &&
                Objects.equals(location, brewery.location);
    }
}
