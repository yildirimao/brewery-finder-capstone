import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import BreweryService from '@/services/BreweryService.js'
import BeerService from '../services/BeerService'
import AuthService from '../services/AuthService.js'
import BeerReviewService from '@/services/BeerReviewService.js'
Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));
if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    users:[],
    breweries: [],
    brewers: [],
    beers:[],
    reviews:[]
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    GET_LIST_USER(state){
      AuthService.getListUsers().then(response => {
        if(response.status === 200){
          state.users = response.data;
        }
      })
      .catch(error => {
        console.log(error);
      })
    },
    GET_LIST_BREWERY(state){
      BreweryService.getListBreweries().then(response => {
        if(response.status === 200){
          state.breweries = response.data;
        }
      })
      .catch(error => {
        if(error.response){
          console.log("response error");
        } else if(error.request){
          console.log("request error");
        } else {
          console.log("other error");
        }
      })
    },
    GET_REVIEWS_BY_BEER(state, id){
      BeerReviewService.getReviewsByBeer(id).then(response => {
        if(response.status === 200){
          state.reviews = response.data;
        }
      })
      .catch(error => {
        if(error.response){
          console.log("response error");
        } else if(error.request){
          console.log("request error");
        } else {
          console.log("other error");
        }
      })
    },

    GET_LIST_BEERS_FROM_BREWERY(state, breweryId){
      BeerService.getBeerByBreweryId(breweryId).then(response => {
        if(response.status === 200){
          state.beers = response.data;
        }
      })
      .catch(error => {
        if(error.response){
          console.log("response error");
        } else if(error.request){
          console.log("request error");
        } else {
          console.log("other error");
        }
      }).then(() => {
        //this sorts the unavailable beers to the bottom of the array.
        state.beers.sort(function(a,b){
          if(a.available ^ b.available){
            return a.available ? -1 : 1;
          } 
          return 0;
        });
      });
      
    },

    TOGGLE_BEER_AVAILABILITY(state, beerId){
      let foundBeer = this.state.beers.find(b => {
        return b.id == beerId;
      })
      foundBeer.available = !foundBeer.available;
    }
  }
})
