<template>
  <div id="app">
    <div id="nav" class="text-uppercase">
      <div id="home"> 
        <router-link v-bind:to="{ name: 'home' }"><img src="../public/img/home.png" width="15" height="15">Home</router-link>&nbsp;&nbsp;
      </div>
      <div></div>  
      <div id="nav-login">
        <router-link v-bind:to="{ name: 'admin' }" v-if="ifAdmin()"><img src="../public/img/admin.png" width="15" height="15">Admin </router-link>
        <router-link v-bind:to="{ name: 'register' }" v-if="$store.state.token == ''"><img src="../public/img/register.png" width="15" height="15">Register</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''"><img src="../public/img/logout.png" width="15" height="15">Logout</router-link>
        <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''"><img src="../public/img/user.png" width="15" height="15">Login</router-link>
      </div>
     
    </div>
    <router-view />
  </div>
</template>

<script>
export default {
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
}
</script>


<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&display=swap');
  html{
    text-align: center;
    background-color: #DEB887;
  }
  #nav{
    margin: 0;
    margin-bottom: 8px;
    position: sticky;
    display: grid;
    background-color: rgba(61, 37, 4, 0.63);
    top: 0;
    grid-template: " home admin login";
    font-family: 'Playfair Display', serif;
    font-weight: 1000;
  }
  #nav a {
    padding: 1em;
    /* background-color: #ffffff80; */
    padding: 1em;
    text-decoration: none;
    color: white;
    font-weight: 450;
    border-radius: 15px;
  }
  #home{
    display: flex;
    justify-content: flex-start;
    grid-area:"home";
    padding-left: 2em;
  }
  #nav img {
    filter: invert(100%);
    margin-right: 10px;
    padding-bottom: 2px;
  }
  /* #admin{
    display: flex;
    justify-content: flex-end;
    grid-area: "admin";
  } */

  #nav-login{
    display: flex;
    justify-content: flex-end;
    grid-area: "login";
    padding-right: 2em;
  }

  #nav-login a{
    margin-left: 1em;
  }
 
</style>