<template>
  <div>
        <section id="review" style="padding-right:100px; padding-left: 100px">
            <div id="reviewer">
                <div id="info">
                    <h2 style="margin:0;">
                        {{this.review.username}}
                    </h2>
                    <img src="https://image.shutterstock.com/image-photo/brewery-concept-happy-smiling-man-600w-1379996219.jpg" alt="beer drinker" style="width: 200px; border-radius: 70%">
                    <p>review date: {{this.review.reviewDate}}</p>
                </div>
            </div>
            
            <p id="rating">
                <span v-for="n in this.review.rating" :key="n">🍺</span>
            </p>
            
            <p id="review-text" style="font-size: 20px">
                {{this.review.review}}
            </p>
        </section>
    </div>
</template>

<script>
export default {
    props:["review"],
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