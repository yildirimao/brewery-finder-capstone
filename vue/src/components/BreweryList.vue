<template>
  <div id="brewery-grid">
    <router-link v-for="brewery in this.$store.state.breweries" :key="brewery.id" v-bind:to="{ name: 'brewery', params:{id:brewery.id}}">
      <brewery-card v-bind:brewery="brewery"/>
    </router-link>
  </div>
</template>

<script>
import BreweryCard from './BreweryCard.vue'
import BreweryService from '@/services/BreweryService.js'
export default {
  components: { BreweryCard },
  data(){
    return {
      breweries: [
      {
        id:0,
        name:"Ahmet's Tea house",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/huts-in-the-trees-picture-id178826547?s=612x612"
      },
      {
        id:1,
        name:"Joseph's Coffee house",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/cup-of-espresso-with-coffee-beans-picture-id1177900338?s=612x612"
      },
      {
        id:2,
        name:"Zach's Beer",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/male-worker-operating-machinery-in-brewery-picture-id641999270?s=612x612"
      },
      {
        id:3,
        name:"Madeline's 21 and young",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/beer-flight-in-summer-sunlight-picture-id1125087566?s=612x612"
      },
      {
        id:4,
        name:"Dave's brewery",
        address:"1234 main street, city, state, 55555",
        phone: "(513) 555-1234",
        picture: "https://media.istockphoto.com/photos/ruined-shed-picture-id538509975?s=612x612"
      },
    ],
    }
  },
  created(){
      BreweryService.getListBreweries().then(response => {
        if(response.status == 200){
          this.breweries = response.body;
          
        }
      })
  }
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