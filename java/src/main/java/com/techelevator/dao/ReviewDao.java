package com.techelevator.dao;

import com.techelevator.model.Review;

import java.util.List;

public interface ReviewDao {
    Review getReviewByReviewId(int id);

    List <Review> getReviewsByBeer(int beerId);

    List<Review> getReviewsByUser(int userId);

    List<Review> getReviewsByBrewery(String brewery);

    Review createReview(String review, int rating, int beerId, int reviewerId);
}
