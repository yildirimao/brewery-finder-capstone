<template>
  <div>
    <form class="beer-review-form">
      <div class="reviewer">
        <h2>{{ newReview.reviewer }}}</h2>
      </div>
      <div class="rating">
        <select name="rating" id="rating">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select>
      </div>
      <br />
      <div class="date">
         <p>{{review.date}}</p>
      </div>
    </form>
  </div>
</template>

<script>
import BeerReviewService from '@/services/BeerReviewService.js'
export default {
  data() {
    return {
      newReview: {
        reviewId: -1,
        review: "",
        rating: -1,
        beerId: this.$route.params.beerId,
        reviewerId: this.$store.state.user.id
      },
    };
  },
  methods: {
    submitBeerReview() {
      BeerReviewService.createReview(this.newReview).then(response => {
        if(response.status == 201) {
          this.$router.push({name: 'beer', params:{id: this.$route.params.id}})
        }
      })
    }
  }
};
</script>

<style>
</style>