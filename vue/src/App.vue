<template>
  <div id="app">
    <div id="nav">
      <div id="home">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;&nbsp;
      </div>
      <div id="admin">
        <router-link v-bind:to="{ name: 'admin' }" v-if="ifAdmin()">Admin</router-link>
      </div>  
      <div id="nav-login">
        <router-link v-bind:to="{ name: 'register' }" v-if="$store.state.token == ''">Register</router-link>
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
        <router-link v-bind:to="{ name: 'login' }" v-if="$store.state.token == ''">Login</router-link>
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
    position: sticky;
    display: grid;
    top: 0;
    /* background-color: white; */
    grid-template: " home admin login";
    font-family: 'Playfair Display', serif;
    font-weight: 1000;
  }
  #nav a {
    padding: 1em;
    background-color: #ffffff80;
    padding: 1em;
    border-radius: 15px;
  }
  #home{
    display: flex;
    justify-content: flex-start;
    grid-area:"home";
    padding-left: 2em;
  }

  #admin{
    display: flex;
    justify-content: flex-start;
    grid-area: "admin";
  }

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