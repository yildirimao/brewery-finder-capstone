<template>
  <div> 
    <button @click="toggleForm()" style="border-radius: 10px">Share your opinion about that beer with other beer lovers!</button>
    <form class="beer-review-form" style="color: white" v-show="this.showForm">
      <div class="rating">
        <label for="rating"> Rate that beer:</label> <br>
        <select name="rating" id="rating" style="width: 100px; border-radius: 10px ">
          <option value="5">5</option>
          <option value="4">4</option>
          <option value="3">3</option>
          <option value="2">2</option>
          <option value="1">1</option>
        </select>
      </div>
      <br />
      <div class="reviewText" >
        <label for="reviewText" style="padding: 10px"> Review: </label> <br>
        <textarea name="reviewText" id="reviewText" cols="30" rows="5" style="border-radius: 10px"></textarea>
      </div>
      <button class="submit" style="margin-top: 20px">Submit Review</button>
    </form>
  </div>
</template>

<script>
import BeerReviewService from '@/services/BeerReviewService.js'
export default {
  data() {
    return {
      reviewer: this.$store.state.user.username,
      newReview: {
        id: -1,
        review: "",
        rating: -1,
        beerId: this.$route.params.beerId,
        userId: this.$store.state.user.id,
        date: new Date()
      },
      showForm: false
    };
  },
  methods: {
    submitBeerReview() {
      BeerReviewService.createReview(this.newReview).then(response => {
        if(response.status == 201) {
          this.$router.push({name: 'beer', params:{id: this.$route.params.id}})
        }
      })
    },
    toggleForm(){
      this.showForm = !this.showForm
      console.log(this.showForm)
    }
  }
};
</script>

<style>
</style>