<template>
  <div>
    <div class="brewery-picture" v-bind:style="`background:no-repeat url(${brewery.imgUrl.split(';')[0]}); background-position:center; background-size:cover`">
      <div class="contrast">        
        <div id="inf">
          <div id="b-name">
            <h1 style="margin-bottom:0;">{{brewery.name}}</h1>
            <p style="margin-top:0;">{{brewery.location}}</p>
          </div>
          
          <div id="b-contact">
            <p>{{brewery.address}}</p>
            <p>{{brewery.phoneNumber}}</p>
          </div>

          <p id="b-bio">{{brewery.bio}}</p>

          <ul id="b-hours">
            <li v-for="day in brewery.hoursOfOperation.split(';')" :key="day">
              {{day}}
            </li>
          </ul>
          
        </div>
        
      </div>
    </div>

    <brewery-pictures v-if="brewery.imgUrl.includes(';')" v-bind:pics="brewery.imgUrl"/>
    
    <div>
      <beer-list v-bind:id="this.$route.params.id"/>
    </div>
    <div class="forms">
      <brewery-update-form v-if="ifBrewer()" id="brewery-form"/>
      <beer-form v-if="ifBrewer()" id="beer-form"/>
    </div>
  </div>
</template>

<script>
import BeerList from './BeerList.vue'
import BreweryService from '@/services/BreweryService.js'
import BreweryPictures from './BreweryPictures.vue'
import BreweryUpdateForm from "../components/BreweryUpdateForm.vue";
import BeerForm from "../components/BeerForm.vue"
import BrewerService from "@/services/BrewerService"
export default {
  components: { BeerList, BreweryPictures, BreweryUpdateForm, BeerForm},
  data(){
    return {
      brewery:{},
      brewer:{
        brewerId: -1,
        breweryId: -1
      }
    }
  },
  created(){
    if(this.$store.state.breweries.length > 0){
      this.brewery = this.$store.state.breweries.find(b => {
        return b.id == this.$route.params.id;
      });
    } else {
      BreweryService.getBrewery(this.$route.params.id).then((response) => {
        if(response.status == 200){
          this.brewery = response.data;
        }
      });
    }

     
        BrewerService.getBrewer(this.$store.state.user.id).then(response => {
          if(response.status == 200){
            this.brewer = response.data
            this.brewerId = response.data.brewerId
            console.log(response.data)
          }
        })
  
      console.log(this.brewer)
  },
  methods: {
        ifBrewer() {
      if (this.$store.state.user.authorities == undefined) {
        return false;
      }
      if (this.$store.state.user.authorities[0].name == "ROLE_BREWER") {
        return true;
      } else {
        return false;
      }
    },
  }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@100;200;300;400;500;600;700&display=swap');

.brewery-picture{
  background-image: url("https://media.istockphoto.com/photos/draught-beer-in-glasses-picture-id1040303026");
  display: flex;
  justify-content: center;
  width: fit-content;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em 3em;
  border-radius: 15px;
}

.contrast{
  font-family: 'Kanit', sans-serif;
  background-color: #ffffffc0;
  width: fit-content;
  height: fit-content;
  border-radius: 15px;
  margin: 1em;
  padding: 1em;
  animation: colorin 1s;
}

#inf{
  display: grid;
  grid-template-areas: 
  "name name name"
  "hours bio bio"
  "hours bio bio"
  "contact contact contact";
  animation: fadein 3s;
}

@keyframes fadein{
  from {opacity: 0;}
  to {opacity: 1;}
}

@keyframes colorin{
  from {background-color: transparent;}
  to {background-color: #ffffffc0;}
}

#b-name{
  grid-area:name;
}

#b-name h1{
  margin-bottom: 0;
  border-bottom: 1px black solid;
}

#b-name p{
  margin-top: 0;
}

#b-contact{
  grid-area:contact;
}

#b-bio{
  grid-area:bio;
  padding-left: 2em;
  margin-left: 0;
}

#b-hours{
  grid-area:hours;
  padding-right: 2em;
  margin-right: 0;
  border-right: black 1px solid;
}

.forms{
  margin-top: 1em;
  display: flex;
  justify-content: space-evenly;
}


</style>