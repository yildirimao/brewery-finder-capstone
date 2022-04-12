<template>
  <div>
    <div>
      <h1>{{brewery.name}} {{this.$route.params.id}}</h1>
      <p>{{brewery.address}}</p>
      <p>{{brewery.phone}}</p>
    </div>
    <div>
      <beer-list/>
    </div>

  </div>
</template>

<script>
import BeerList from './BeerList.vue'
export default {
  components: { BeerList },
  data(){
    return {
      brewery:{}
    }
  },
  created(){
    this.brewery = this.$store.state.breweries[this.$route.params.id];
  }
}
</script>

<style>

</style>