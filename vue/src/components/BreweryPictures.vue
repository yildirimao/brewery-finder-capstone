<template>
  <div id="brwry-pic-dis">
        <button id="prev-btn" @click="previousPicture()">previous</button>
        
        <div id="image-container">
            <img v-for="n in pics.length" :key="n"
            v-bind:src="pics[n]" 
            v-show="currentSlide == n - 1">
        </div>
        
        <button id="prev-btn" @click="nextPicture()">next</button>

        <span class="badge badge-light" style="color: pink">New</span>
  </div>
</template>

<script>
export default {
    name:"brewery-pictures",
    //props:["pics"],
    data(){
        return {
            currentSlide:0,
            pics:[
                "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Un1.svg/180px-Un1.svg.png",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Deux.svg/180px-Deux.svg.png",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Trois.svg/800px-Trois.svg.png",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/Quatre.svg/180px-Quatre.svg.png",
                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Cinq.svg/180px-Cinq.svg.png"
            ]
        }
    },
    methods:{
        nextPicture(){
            //iterate
            this.currentSlide++;

            //clamp
            if(this.currentSlide > this.pics.length - 1){
                this.currentSlide = 0;
            }
        },
        previousPicture(){
            //iterate
            this.currentSlide--;

            //clamp
            if(this.currentSlide < 0){
                this.currentSlide = this.pics.length - 1;
            }
        }
    }
}
</script>

<style>
#brwry-pic-dis{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    margin-bottom: 2em;
}
</style>