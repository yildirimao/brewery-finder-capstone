<template>
  <div id="brewery-grid" >
    <router-link  v-for="brewery in this.$store.state.breweries" :key="brewery.id" v-bind:to="{ name: 'brewery', params:{id:brewery.id}}">
      <brewery-card  v-if="brewery.active" v-bind:brewery="brewery"/>
      <brewery-card v-else v-bind:brewery="brewery" style="filter: grayscale(100%);" v-text="brewery.name + ' is inactive'"/>
    </router-link>
  </div>
</template>

<script>
import BreweryCard from './BreweryCard.vue'

export default {
  components: { BreweryCard },
  search_page:false,
  created(){
    if(!this.search_page){
      this.$store.commit("GET_LIST_BREWERY");
    }
  }
}
</script>

<style>
#brewery-grid{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-rows: fit-content;
    gap: 1em;
}

</style>