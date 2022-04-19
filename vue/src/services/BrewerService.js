import axios from 'axios';

export default {

    getListBrewers() {
        return axios.get('/brewers')
    },

    getBrewersByBrewery(id) {
        return axios.get(`/breweries/brewers/${id}`)
    },

    getBrewer(id) {
        return axios.get(`/brewers/${id}`)
    },

    createBrewer(brewer) {
        return axios.post('/brewers', brewer)
    },
}