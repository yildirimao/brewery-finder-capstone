<template>
  <div id="brewery-grid">
    <router-link v-for="brewery in this.$store.state.breweries" :key="brewery.id" v-bind:to="{ name: 'brewery', params:{id:brewery.id}}">
      <brewery-card v-bind:brewery="brewery"/>
    </router-link>
  </div>
</template>

<script>
import BreweryCard from './BreweryCard.vue'
export default {
  components: { BreweryCard },

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