<template>
  <div>
        <h1>searching for {{$route.query.for}} that contain {{this.$route.query.terms}}</h1>
        <h2>Results</h2>
        <brewery-list v-if="breweries" v-bind:search_page="true" />
        <beer-list v-if="beers" v-bind:search_page="true" />
  </div>
</template>

<script>
import BreweryList from '../components/BreweryList.vue'
import BeerList from '../components/BreweryList.vue'
export default {
    components: { BreweryList, BeerList },
    data(){
        return {
            breweries:false,
            beers:false
        }
    },
    created(){
        let f = this.$route.query.for;
        this.breweries = f == "breweries";
        this.beers = f == "beers";
        this.$store.commit("SEARCH", {for:this.$route.query.for, terms:this.$route.query.terms});
    }
}
</script>

<style>

</style>