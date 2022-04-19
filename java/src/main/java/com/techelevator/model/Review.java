package com.techelevator.model;

public class Review {
    private int id;
    private String review;
    private int rating;
    private int beerId;
    private int userId;


    public Review(){

    }

    public Review(int id, String review, int rating, int beerId, int userId){
        this.id = id;
        this.review = review;
        this. rating = rating;
        this.beerId = beerId;
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getBeerId() {
        return beerId;
    }

    public void setBeerId(int beerId) {
        this.beerId = beerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}


