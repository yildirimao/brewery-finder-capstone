<template>
  <div>
    <div id="beer-picture" v-bind:style="`background:url(${beer.picture}); background-position:center;`">
      <div id="contrast">
        <h1>{{beer.name}} {{this.$route.params.id}}</h1>
        <p>Type: {{beer.type}}</p>
        <p>ABV: {{beer.abv}}%</p>
        <p>IBU: {{beer.ibu}}</p>
        <p>Hops: {{beer.hops}}</p>
        <p>{{beer.description}}</p>
      </div>
    </div>
    <h1>reviews go here!</h1>
    <review/>
    <review/>
    <review/>
    <review/>
  </div>
</template>

<script>
import Review from './Review.vue'
export default {
  components: { Review },
  data(){
    return {
      beer:{
        name: "Ahmets tea",
        abv: "100",
        type: "tea",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      }
    }
  }
}
</script>

<style>
#beer-picture{
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