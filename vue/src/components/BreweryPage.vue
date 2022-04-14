<template>
  <div>
    <!-- v-bind:style="`background:no-repeat url(${brewery.picture}); background-position:center;`" -->
    <div id="brewery-picture" >
      <div id="contrast">
        <div>
            <h1>{{brewery.name}} {{this.$route.params.id}}</h1>
        </div>
        
        <div id="info">
          <p>{{brewery.phone}}</p>
          <dl>{{brewery.bio}}</dl>
          <p>{{brewery.brewery_img}}brewery imagery</p>
          <p>{{brewery.hours_of_operation}}4PM-9PM</p>
          <p>555 main street {{brewery.location}}</p>
          <p></p>
          <p></p>
        </div>
        
      </div>
    </div>
    <div>
      <beer-list/>
    </div>

  </div>
</template>

<script>
import BeerList from './BeerList.vue'
import BreweryService from '@/services/BreweryService.js'

export default {
  components: { BeerList },
  data(){
    return {
      brewery:{}
    }
  },
  created(){
    this.brewery = this.$store.state.breweries[this.$route.params.id];

    if(this.brewery.id == undefined){
      BreweryService.getBrewery(this.$route.params.id).then((response) => {
        if(response.status == 200){
          this.brewery = response.data;
        }
      });
    }
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&display=swap');

#brewery-picture{
  background-image: url("https://media.istockphoto.com/photos/draught-beer-in-glasses-picture-id1040303026");
  display: flex;
  justify-content: center;
  width: fit-content;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em 5em;
  border-radius: 15px;
}
#contrast{
  font-family: "Playfair Display", serif;
  background-color: #ffffff80;
  width: fit-content;
  height: fit-content;
  border-radius: 15px;
  margin: 1em;
  padding: 1em;
}
#info{
  opacity: 0;
  transition: opacity 2s ease 0s;
}
#info:hover{
  opacity: 1;
}
</style>