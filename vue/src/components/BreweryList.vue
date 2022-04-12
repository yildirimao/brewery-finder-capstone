<template>
  <div id="brewery-grid">
    <router-link v-for="n in 10" :key="n" v-bind:to="{ name: 'brewery', params:{id:n}}">
      <brewery-card/>
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