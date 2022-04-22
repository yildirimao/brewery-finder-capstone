<template>
  <div>
    <section id="review" style="padding-right: 100px; padding-left: 100px;">
      <div id="reviewer">
        <div id="info">
          <h2 style="font-size: 30px">
            {{ this.review.username }}
          </h2>
          <img
            src="https://image.shutterstock.com/image-photo/brewery-concept-happy-smiling-man-600w-1379996219.jpg"
            alt="beer drinker"
            style="width: 200px; border-radius: 70%; margin-bottom: 15px"
            v-if="review.rating == 5"
          />
          <img
            src="https://image.shutterstock.com/image-photo/happy-handsome-bearded-man-smiling-600w-1568270938.jpg"
            alt="beer drinker"
            style="width: 200px; border-radius: 70%; margin-bottom: 15px"
            v-else-if="review.rating > 2 && review.rating < 5"
          />
          <img
            src="https://image.shutterstock.com/image-photo/upset-young-man-sit-bar-600w-1299448255.jpg"
            alt="beer drinker"
            style="width: 180px; border-radius: 70%; margin-bottom: 15px"
            v-if="review.rating < 3"
          />
          <p style="font-size: 15px">
            <strong> review date: </strong> {{ this.review.reviewDate }}
          </p>
        </div>
      </div>

      <p id="rating" style="width: 119px">
        <span v-for="n in this.review.rating" :key="n">🍺</span>
      </p>

      <p id="review-text" style="font-size: 20px; width: 400px; word-wrap: break-word;">
        {{ this.review.review }}
      </p>
    </section>
  </div>
</template>

<script>
export default {
  props: ["review"],
};
</script>

<style scoped>
#review {
  display: grid;
  grid-template-areas:
    "reviewer rating"
    "text text";
  grid-template-columns: auto 1fr;
  color: rgb(247, 243, 243);
  background-color: #24222280;
  width: fit-content;
  height: fit-content;
  border-radius: 15px;
  margin: 1em 20vw;
  padding: 1em;
}

#reviewer {
  grid-area: reviewer;
}

#reviewer #info {
  margin-left: 1em;
}

#rating {
  grid-area: rating;
  font-size: 3em;
  margin: 0;
}
#review-text {
  border-top: black 1px solid;
  padding-top: 1em;
  grid-area: text;
}
</style>