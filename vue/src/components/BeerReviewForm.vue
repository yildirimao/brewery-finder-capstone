<template>
  <div> 
    <button class="toggle-review-form" @click="toggleForm()">Review this Beer!</button>
    <form class="beer-review-form" style="color: white">
      <div class="rating">
        <label for="rating"> Rating:</label> <br>
        <select name="rating" id="rating">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </div>
      <br />
      <div class="reviewText">
        <label for="reviewText" style="padding: 10px"> Review: </label> <br>
        <input type="text" style="width: 400px; height: 100px">
      </div>
      <button class="submit" style="margin-top: 20px">Submit</button>
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
        reviewId: -1,
        review: "",
        rating: -1,
        beerId: this.$route.params.beerId,
        reviewerId: this.$store.state.user.id,
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
    }
  }
};
</script>

<style>
</style>