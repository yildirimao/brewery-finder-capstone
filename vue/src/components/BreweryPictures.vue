<template>
  <div id="carousel-wrapper">
    <b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="4000"
      controls
      indicators
      img-width="500"
      img-height="200"
      style="text-shadow: 1px 1px 2px #333"
      @sliding-start="onSlideStart"
      @sliding-end="onSlideEnd"
    >
      <b-carousel-slide
        v-for="pic in pics.split(';')" :key="pic"
        v-bind:img-src="pic"
        class="slide-custom"
      ></b-carousel-slide>
    </b-carousel>
  </div>
</template>

<script>
  export default {
    name: "brewery-pictures",
    props:["pics"],
    data() {
      return {
        slide: 0,
        sliding: null
      }
    },
    methods: {
      onSlideStart() {
        this.sliding = true
      },
      onSlideEnd() {
        this.sliding = false
      }
    }
  }
</script>

<style>
#carousel-wrapper{
    height: 50vh;
    margin: 0 16em 2em;
}

.slide-custom img{
    height: 50vh;
    max-width: min-content;
    margin:0 auto;
    border-radius: 15px;
}

#carousel-1{
    border-radius: 15px;
}
</style>