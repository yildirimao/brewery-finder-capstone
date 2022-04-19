import axios from 'axios';

export default { 
    createReview(review) {
        return axios.post('/reviews', review)
    }
}