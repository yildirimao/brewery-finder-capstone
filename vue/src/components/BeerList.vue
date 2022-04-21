<template>
  <div id="beer-grid">
    <router-link v-for="beer in this.$store.state.beers" :key="beer.id" v-bind:to="{ name: 'beer', params:{id:beer.id}}">
      <beer-card v-show="beer.available" v-bind:beer="beer"/>
      <beer-card v-show="isBrewer() && !beer.available" v-bind:beer="beer" style="filter: grayscale(100%)"/>
      <button v-show="isBrewer()" @click.prevent="toggleAvail(beer.id)">Mark {{beer.available ? "unavailable" : "available"}}</button>
    </router-link>
  </div>
</template>

<script>
import BeerService from '@/services/BeerService';
import BeerCard from './BeerCard.vue'
export default {
  components: { BeerCard },
  search_page:false,
  props:['id'],
  created(){
    if(!this.search_page){
      this.$store.commit("GET_LIST_BEERS_FROM_BREWERY", this.id);
    }
  },
  methods:{
    isBrewer(){
      let u = this.$store.state.user
        if(u.breweryId != undefined){
        return u.authorities.some(a => a.name == "ROLE_BREWER") &&
              u.breweryId == this.$route.params.id;
      }
    },
    toggleAvail(beerId){
      //update beer on server side
      BeerService.toggleAvailability(beerId).then(response => {
        if(response.status == 200){
          this.$store.commit("TOGGLE_BEER_AVAILABILITY", beerId);
        } else{
          console.log(response.status);
        }
      });
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

#beer-grid a{
  text-decoration: none !important;
}
</style>