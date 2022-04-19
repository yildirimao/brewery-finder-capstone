package com.techelevator.dao;

import com.techelevator.model.Review;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao {

    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @ Override
    public List<Review> getReviewsByBeer(int beerId){
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT review, rating, beer_id, reviewer_id " +
                "FROM reviews " +
                "WHERE beer_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, beerId);
        while(results.next()){
            Review review = mapReviewToRow(results);
            reviewList.add(review);
        }
        return reviewList;
    }

    @Override
    public List<Review> getReviewsByUser(int userId){
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT review, rating, beer_id, reviewer_id " +
                "FROM reviews " +
                "WHERE user_Id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while(results.next()){
            Review review = mapReviewToRow(results);
            reviewList.add(review);
        }
        return reviewList;
    }

    @Override
    public List<Review> getReviewsByBrewery(String brewery){
        List<Review> reviewList = new ArrayList<>();
        String sql = "SELECT review, rating, reviews.beer_id, reviewer_id " +
        "FROM reviews " +
        "JOIN beers ON beers.beer_id = reviews.beer_id " +
        "JOIN breweries ON breweries.brewery_id = beers.brewery_id " +
        "WHERE  breweries.brewery_name = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, brewery);
        while(results.next()){
            Review review = mapReviewToRow(results);
            reviewList.add(review);
        }
        return reviewList;
    }

    @Override
    public Review getReviewByReviewId(int id) {
        String sql = "SELECT review, rating, beer_id, reviewer_id " +
                "FROM reviews " +
                "WHERE review_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        if (results.next()) {
            return mapReviewToRow(results);
        } else {
            throw new RuntimeException("ReviewId " + id + "not found");
        }
    }

    public Review mapReviewToRow(SqlRowSet rs) {
        Review review = new Review();
        review.setId(rs.getInt("review_id"));
        review.setReview(rs.getString("review"));
        review.setRating(rs.getInt("rating"));
        review.setBeerId(rs.getInt("beer_id"));
        review.setUserId(rs.getInt("reviewer_id"));
        return review;
    }
}
