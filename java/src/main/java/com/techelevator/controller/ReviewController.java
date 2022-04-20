package com.techelevator.controller;

import com.techelevator.dao.ReviewDao;
import com.techelevator.model.Review;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@CrossOrigin
public class ReviewController {

    private ReviewDao reviewDao;

    public ReviewController(ReviewDao reviewDao){
        this.reviewDao = reviewDao;
    }

    @ResponseStatus(code = HttpStatus.CREATED)
    @RequestMapping(path = "/reviews", method = RequestMethod.POST)
    public Review createReview(@Valid @RequestBody Review review){
        return this.reviewDao.createReview(review.getReview(), review.getRating(), review.getBeerId(),
                review.getUserId());
    }

    @RequestMapping(path = "/beers/{beer_id}/reviews", method = RequestMethod.GET)
    public List<Review> getBeerReviews(@PathVariable int beer_id){
        return reviewDao.getReviewsByBeer(beer_id);
    }


}
