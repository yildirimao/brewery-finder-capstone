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
  },
  
  updateBrewery(id, brewery) {
    return axios.put(`/breweries/${id}`, brewery)
  },

  searchForBreweries(searchTerms){
    return axios.post(`/breweries/search/${searchTerms}`)
  }
}