<template>
  <div id="background" v-bind:style="`background-image: url(${beer.beer_img}; background-size: cover`">
      <div id="text">
          <ul id="beer">
            <li id="name">{{beer.name}} </li>
            <li>Type: {{beer.type}} </li>
            <li>ABV: {{beer.abv}}% </li>
            <li>IBU: {{beer.ibu}} </li>
            <li>Hops: {{beer.hops}} </li>
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
    color: rgb(0, 0, 0);
    background-color: #ffffff80;
    padding: 1em;
    margin: 1em;
    border-radius: 15px;
}
#background:hover, #text:hover{
    cursor: pointer;
}
</style>