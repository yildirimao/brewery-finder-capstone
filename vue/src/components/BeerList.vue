<template>
    <div id="beer-grid">
    <router-link v-for="n in 10" :key="n" v-bind:to="{ name: 'beer', params:{id:n}}">
      <beer-card/>
    </router-link>
  </div>
</template>

<script>
import BeerCard from './BeerCard.vue'
export default {
  components: { BeerCard },

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