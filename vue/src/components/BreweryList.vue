<template>
  <div id="brewery-grid">
      <brewery-card
      v-for="n in 10" :key="n"/>
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