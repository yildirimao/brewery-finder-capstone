<template>
<!--   this is for when/if we add custom pictures per brewery-->
  <div id="background" v-bind:style="`background-image: url(${brewery.imgUrl}); background-size: cover`">
      <div id="text">
          <h1>{{brewery.name}}</h1>
          <p>{{brewery.location}}</p>
          
      </div>
  </div>
</template>

<script>
export default {
    name:'brewery-card',
    props:['brewery']
}
</script>

<style scoped>
/*I don't think this does anything*/
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

#text{
    color: black;
    background-color: #ffffff80;
    padding: 1em;
    border-radius: 15px;
}
#background:hover, #text:hover{
    cursor: pointer;
    
}
</style>