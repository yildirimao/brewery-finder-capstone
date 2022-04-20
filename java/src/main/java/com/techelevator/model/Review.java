package com.techelevator.model;

public class Review {
    private int id;
    private String review;
    private int rating;
    private int beerId;
    private int userId;
    private String reviewDate;


    public Review(){

    }



    public Review(int id, String review, int rating, int beerId, int userId, String reviewDate){
        this.id = id;
        this.review = review;
        this.rating = rating;
        this.beerId = beerId;
        this.userId = userId;
        this.reviewDate = reviewDate;
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

    public String getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(String reviewDate) {
        this.reviewDate = reviewDate;
    }

    public Review(String reviewDate) {
        this.reviewDate = reviewDate;
    }
}


