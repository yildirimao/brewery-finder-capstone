import axios from 'axios';

export default {

  getListBreweries() {
    return axios.get('/brewery')
  },

  getBrewery(id) {
    return axios.get(`/brewery/${id}`)
  }

  

}