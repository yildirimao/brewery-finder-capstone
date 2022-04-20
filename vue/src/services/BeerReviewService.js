import axios from 'axios';

export default { 
    getReviewsByBeer(beer_id){
        return axios.get(`beers/${beer_id}/reviews`)
    },
    createBeerReview(review) {
        return axios.post('/reviews', review)
    }
}