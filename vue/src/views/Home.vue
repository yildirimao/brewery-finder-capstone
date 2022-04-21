<template>
  <div class="home">
    <div id="welcome-text">
      <h3>Hello{{$store.state.user.username != undefined ? " " + $store.state.user.username : ""}}, welcome to</h3>
      <h1>The Brewery Finder <img src="../../public/Icon.png" style="height:1em; width:1em"></h1>
    </div>

    <search-bar/> <br>

    <!-- <p>You must be authenticated to see this</p> -->
    <brewery-list  />
  </div>
</template>

<script>
import BreweryList from "../components/BreweryList.vue";
import SearchBar from '../components/SearchBar.vue';
export default {
  components: { BreweryList, SearchBar},
  name: "home",
  methods: {
    ifAdmin() {
      if (this.$store.state.user.authorities[0].name == "ROLE_ADMIN") {
        return true;
      } else {
        return false;
      }
    }

  },
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@100;200;300;400;500;600;700&display=swap');
.home {
  font-family: 'Kanit', sans-serif;
}
button {
  margin: 1em;
}

#welcome-text{
  text-shadow: 1px 1px white;
}

</style>

