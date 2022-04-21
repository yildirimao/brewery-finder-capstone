<template>
  <div id="background" v-bind:style="`background-image: url(${beer.beer_img}; background-size: cover`">
      <div id="text">
          <ul id="beer">
            <li id="name">{{beer.name}} </li>
            <li>Type: {{beer.type}} </li>
            <li>ABV: {{beer.abv}}% </li>
            <li v-if="beer.ibu > 0">IBU: {{beer.ibu}} </li>
            <li v-if="beer.hops !== ''">Hops: {{beer.hops}} </li>
          </ul>  
      </div>
  </div>
</template>

<script>
export default {
    name:'beer-card',
    props:['beer']
}
</script>

<style>
#background{
    background-image: url("https://media.istockphoto.com/photos/draught-beer-in-glasses-picture-id1040303026");
    background-repeat: no-repeat;
    background-position: center;
    height: 20em;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 1em;
}

#beer{
    list-style-type: none;
    padding: 1em;
    font-weight: 600;
    font-size: 15px;
}

#name {
    font-size: 20px;
    font-weight: 700;
}

#text{
    color: rgb(247, 243, 243);
    height: 55%;
    width: 90%;
    background-color: #24222280;
    padding: 1em;
    border-radius: 15px;
    text-transform: uppercase;
    margin-top: 35%;
    transition: padding 1s, margin-top 1s, width 1s, height 1s;
}

#background:hover #text, #text:hover{
    padding: 30% 0 0 0;
    margin-top: 0;
    width: 100%;
    height: 100%;
    cursor: pointer;
}
</style>