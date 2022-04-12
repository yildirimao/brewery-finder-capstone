<template>
  <div class="home">
    <h1>The Brewery Finder 🍻</h1>
    <!-- <p>You must be authenticated to see this</p> -->
    <brewery-list />
  </div>
</template>

<script>
import BreweryList from "../components/BreweryList.vue";
export default {
  components: { BreweryList },
  name: "home",
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&display=swap');
.home {
  font-family: "Playfair Display", serif;
}
</style>

