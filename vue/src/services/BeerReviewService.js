import axios from 'axios';

export default { 
    getReviewsByBeer(id){
        return axios.get(`beers/${id}/reviews`)
    },
    createBeerReview(review) {
        return axios.post('/reviews', review)
    }
}