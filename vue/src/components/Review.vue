<template>
  <div>
        <section id="review">
            <div id="reviewer">
                <img src="https://pbs.twimg.com/profile_images/630942591333310464/4gyqQe_h_400x400.jpg" alt="">
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
    data(){
        return {
            review:{
                reviewer:"Bob",
                rating:5,
                date:"04/20/2022",
                review:"Aliqua nisi ullamco reprehenderit adipisicing amet eiusmod deserunt occaecat aliqua fugiat cupidatat culpa culpa culpa. Incididunt non in in officia eu nisi sunt. Quis voluptate nisi mollit voluptate qui laboris quis dolore. Cillum consequat voluptate veniam dolore adipisicing mollit."
            }
            
        }
    }
}
</script>

<style scoped>
#review{
    display: grid;
    grid-template-areas: "reviewer rating" 
                         "text text";
    grid-template-columns: auto 1fr;
    background-color: chocolate;
    width: fit-content;
    height: fit-content;
    border-radius: 15px;
    margin: 1em 20vw;
    padding: 1em;
}

#reviewer{
    grid-area: reviewer;
    display: grid;
    grid-template-areas: "left right";
}

#reviewer img{
    border-radius: 100%;
    height: 5em;
    width: auto;
    grid-area: left;
}

#reviewer #info{
    grid-area: right;
    justify-self: left;
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