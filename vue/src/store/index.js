import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

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
    breweries: [
      {
        id:0,
        name:"Ahmet's Tea house",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/huts-in-the-trees-picture-id178826547?s=612x612"
      },
      {
        id:1,
        name:"Joseph's Coffee house",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/cup-of-espresso-with-coffee-beans-picture-id1177900338?s=612x612"
      },
      {
        id:2,
        name:"Zach's Beer",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/male-worker-operating-machinery-in-brewery-picture-id641999270?s=612x612"
      },
      {
        id:3,
        name:"Madeline's 21 and young",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/beer-flight-in-summer-sunlight-picture-id1125087566?s=612x612"
      },
      {
        id:4,
        name:"Dave's brewery",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/ruined-shed-picture-id538509975?s=612x612"
      },
    ],
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
    
  }
})
