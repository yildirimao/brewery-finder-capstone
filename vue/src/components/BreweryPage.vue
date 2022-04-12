<template>
  <div>
    <div id="brewery-picture" v-bind:style="`background:no-repeat url(${brewery.picture}); background-position:center;`">
      <div id="contrast">
        <h1>{{brewery.name}} {{this.$route.params.id}}</h1>
        <p>{{brewery.address}}</p>
        <p>{{brewery.phone}}</p>
      </div>
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
#brewery-picture{
  display: flex;
  justify-content: center;
  width: fit-content;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em 5em;
  border-radius: 15px;
}
#contrast{
  background-color: #ffffff80;
  width: fit-content;
  height: fit-content;
  border-radius: 15px;
  margin: 1em;
  padding: 1em;
}
</style>