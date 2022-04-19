<template>
  <div>
    <div id="beer-picture" v-bind:style="`background:url(${beer.beer_img});`">
      <div id="contrast">
        <h1>{{beer.name}}</h1>
        <div>
          <p v-if="beer.type">
            Type: {{beer.type}}
          </p>
          <p v-if="beer.abv">
            ABV: {{beer.abv}}%
          </p>
          <p v-if="beer.ibu">
            IBU: {{beer.ibu}}
          </p>
          <p v-if="beer.hops">
            Hops: {{beer.hops}}
          </p>
          <p v-if="beer.malts">
            Malts: {{beer.malts}}
          </p>
        </div>
        
        <p id="beer_description">{{beer.description}}</p>
      </div>
    </div>
    <review/>
    <review/>
    <review/>
    <review/>
  </div>
</template>

<script>
import Review from './Review.vue'
import BeerService from '@/services/BeerService.js'

export default {
  components: { Review },
  data(){
    return {
      beer:{}
    }
  },
  created(){
    if(this.beer.id == undefined){
      BeerService.getBeerById(this.$route.params.id).then((response) => {
        if(response.status == 200){
          this.beer = response.data;
        }
      });
    }
    
  }
}
</script>

<style>
#beer-picture{
  background-size: cover !important;
  background-position:center !important;
  display: flex;
  justify-content: center;
  width: 100%;
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

  display: grid;
  grid-template-areas: 
  "name name"
  "info desc";
}
#contrast > h1{
  grid-area: name;
  border-bottom: 1px black solid;
  }
#contrast > div{
  grid-area: info;
  padding-right: 1em;
  border-right:1px black solid
  }
#contrast > #beer_description{
  grid-area: desc;
  padding-left:1em;
  align-self: center;
  text-align: center;
  }
</style>