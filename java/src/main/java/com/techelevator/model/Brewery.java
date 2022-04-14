package com.techelevator.model;

import java.util.Objects;

public class Brewery {

    private int id;
    private String name;
    private String location;
    private String phoneNumber;
    private String hoursOfOperation;
    private String address;
    private String bio;
    private String imgUrl;
    private boolean isActive;

    public Brewery() {

    }

    public Brewery(int id, String name, String location, String phoneNumber, String hoursOfOperation, String address,
                   String bio, String imgUrl, boolean isActive) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.phoneNumber = phoneNumber;
        this.hoursOfOperation = hoursOfOperation;
        this.address = address;
        this.bio = bio;
        this.imgUrl = imgUrl;
        this.isActive = isActive;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getHoursOfOperation() {
        return hoursOfOperation;
    }

    public void setHoursOfOperation(String hoursOfOperation) {
        this.hoursOfOperation = hoursOfOperation;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Brewery brewery = (Brewery) o;
        return id == brewery.id &&
                Objects.equals(name, brewery.name) &&
                Objects.equals(location, brewery.location) &&
                Objects.equals(phoneNumber, brewery.phoneNumber) &&
                Objects.equals(hoursOfOperation, brewery.hoursOfOperation) &&
                Objects.equals(address, brewery.address) &&
                Objects.equals(bio, brewery.bio) &&
                Objects.equals(imgUrl, brewery.imgUrl) &&
                Objects.equals(isActive, brewery.isActive);
    }
}
