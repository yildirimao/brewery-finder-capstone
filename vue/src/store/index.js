import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import BreweryService from '@/services/BreweryService.js'

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
    breweries: [],
    beers:[
      {
        id:0,
        name: "beer 0",
        abv: "100%",
        type: "beer",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      },
      {
        id:1,
        name: "beer 1",
        abv: "100%",
        type: "beer",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      },
      {
        id:2,
        name: "beer 2",
        abv: "100%",
        type: "beer",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      },
      {
        id:3,
        name: "beer 3",
        abv: "100%",
        type: "beer",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      },
      {
        id:4,
        name: "beer 4",
        abv: "100%",
        type: "beer",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      },
      {
        id:5,
        name: "beer 5",
        abv: "100%",
        type: "beer",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      },
    ]
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
    }
  }
})
