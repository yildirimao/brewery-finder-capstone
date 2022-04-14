<template>
  <div class="home">
    <h1>The Brewery Finder 🍻</h1>
    <button id="bl-btn">This button is for Beer lovers</button>
    <button id="b-btn">This button is for Brewers</button>
    <button id="a-btn">This button is for Admins</button>
    <!-- <p>You must be authenticated to see this</p> -->
    <brewery-list />
    <div></div>
    <brewery-form v-if="ifAdmin()"/>
    <brewery-update-form v-if="ifBrewer()"/>
  </div>
</template>

<script>
import BreweryForm from '../components/BreweryForm.vue';
import BreweryList from "../components/BreweryList.vue";
import BreweryUpdateForm from '../components/BreweryUpdateForm.vue';
export default {
  components: { BreweryList, BreweryForm, BreweryUpdateForm },
  name: "home",
  mounted(){
    let user = this.$store.state.user;
    
    if(user.authorities === undefined){
      document.querySelector("#a-btn").disabled = true;
      document.querySelector("#b-btn").disabled = true;
      document.querySelector("#bl-btn").disabled = true;
    } else if(user.authorities[0].name == "ROLE_USER"){
      document.querySelector("#a-btn").disabled = true;
      document.querySelector("#b-btn").disabled = true;
    }
    else if(user.authorities[0].name == "ROLE_BREWER"){
      document.querySelector("#a-btn").disabled = true;
    }
  },
  methods: {
    ifAdmin(){
      if(this.$store.state.user.authorities == undefined){
        return false;
      }
      if(this.$store.state.user.authorities[0].name == 'ROLE_ADMIN'){
        return true;
      }else {
        return false;
      }
    },
    ifBrewer(){
      if(this.$store.state.user.authorities == undefined){
        return false;
      }
      if(this.$store.state.user.authorities[0].name == 'ROLE_BREWER'){
        return true;
      }else {
        return false;
      }
    }
  }
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&display=swap');
.home {
  font-family: "Playfair Display", serif;
}
button{
  margin: 1em;
}
</style>

