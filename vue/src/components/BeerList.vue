<template>
  <div id="beer-grid">
    <router-link v-for="beer in this.$store.state.beers" :key="beer.id" v-bind:to="{ name: 'beer', params:{id:beer.id}}">
      <beer-card v-bind:beer="beer"/>
    </router-link>
  </div>
</template>

<script>
import BeerCard from './BeerCard.vue'
export default {
  components: { BeerCard },
  props:['id'],
  created(){
    console.log("id is: " + this.id)
    this.$store.commit("GET_LIST_BEERS_FROM_BREWERY", this.id);
  }
}
</script>

<style>
#beer-grid{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: fit-content;
    gap: 1em;
}
</style>