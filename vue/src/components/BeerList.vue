<template>
  <div id="beer-grid">
    <router-link v-for="beer in this.$store.state.beers" :key="beer.id" v-bind:to="{ name: 'beer', params:{id:beer.id}}">
      <beer-card v-if="beer.available" v-bind:beer="beer"/>
      <beer-card v-else-if="isBrewer()" v-bind:beer="beer" style="filter: grayscale(100%)" v-text="beer.name + ' is unavailable'"/>
    </router-link>
  </div>
</template>

<script>
import BeerCard from './BeerCard.vue'
export default {
  components: { BeerCard },
  props:['id'],
  created(){
    this.$store.commit("GET_LIST_BEERS_FROM_BREWERY", this.id);
  },
  methods:{
    isBrewer(){
      let user = this.$store.state.user
      return user.authorities.some(a => a.name == "ROLE_BREWER") &&
             user.breweryId == this.id;
    }
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