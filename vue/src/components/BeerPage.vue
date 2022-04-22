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
    <review v-for="review in reviews" :key="review.id" v-bind:review="review" style/>
    <beer-review-form v-if="this.$store.state.user.id != undefined"/>
  </div>
</template>

<script>
import Review from './Review.vue'
import BeerService from '@/services/BeerService.js'
import BeerReviewForm from './BeerReviewForm.vue'
import BeerReviewService from '@/services/BeerReviewService.js'
export default {
  components: { Review, BeerReviewForm },
  data(){
    return {
      beer:{},
      reviews: { }
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
    BeerReviewService.getReviewsByBeer(this.$route.params.id).then(response => {
        if(response.status === 200){
          this.reviews = response.data;
          this.$router.push({name: 'beer', params: { id: this.$route.params.id}})
        }
      })
      .catch(error => {
        if(error.response){
          console.log("response error");
        } else if(error.request){
          console.log("request error");
        } else {
          console.log("other error");
        }
      })
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
  background-color: #000000c0;
  color: white;
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
  border-bottom: 1px white solid;
  }
#contrast > div{
  grid-area: info;
  padding-right: 1em;
  border-right:1px white solid
  }
#contrast > #beer_description{
  grid-area: desc;
  padding-left:1em;
  align-self: center;
  text-align: center;
  }
</style>