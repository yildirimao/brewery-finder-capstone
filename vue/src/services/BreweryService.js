import axios from 'axios';

export default {

  getListBreweries() {
    return axios.get('/breweries')
  },

  getBrewery(id) {
    return axios.get(`/breweries/${id}`)
  },

  createBrewery(brewery){
      return axios.post('/breweries', brewery)
  }
  
}