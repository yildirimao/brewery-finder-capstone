<template>
  <div>
        <h1>searching for {{this.$route.query.for}} with {{this.$route.query.terms}}</h1>
        <h2>Results</h2>
        <brewery-list v-bind:search_page="true" />
  </div>
</template>

<script>
import BreweryList from '../components/BreweryList.vue'
export default {
  components: { BreweryList },
    created(){

    }
}
</script>

<style>

</style>