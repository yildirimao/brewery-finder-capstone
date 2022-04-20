<template>
  <div>
        <section id="review">
            <div id="reviewer">
                <div id="info">
                    <h2 style="margin:0;">
                        {{this.review.reviewer}}
                    </h2>
                    <p>{{this.review.date}}</p>
                </div>
            </div>
            
            <p id="rating">
                <span v-for="n in this.review.rating" :key="n">🍺</span>
            </p>
            
            <p id="review-text">
                {{this.review.review}}
            </p>
        </section>
    </div>
</template>

<script>
export default {
    props:["review"],
    // created(){
    //     this.$store.commit('GET_REVIEWS_BY_BEER', this.$route.params.id)
    //     console.log(this.$route.params.id)
    // }
}
</script>

<style scoped>
#review{
    display: grid;
    grid-template-areas: "reviewer rating" 
                         "text text";
    grid-template-columns: auto 1fr;
    background-color: #ffffff80;
    width: fit-content;
    height: fit-content;
    border-radius: 15px;
    margin: 1em 20vw;
    padding: 1em;
}

#reviewer{
    grid-area: reviewer;
}

#reviewer #info{
    margin-left: 1em;;
}

#rating{
    grid-area: rating;
    font-size: 3em;
    margin:0;
}
#review-text{
    border-top: black 1px solid;
    padding-top: 1em;
    grid-area: text;
}
</style>