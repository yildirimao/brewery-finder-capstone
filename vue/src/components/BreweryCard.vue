<template>
<!--   this is for when/if we add custom pictures per brewery-->
  <div id="background" v-bind:style="`background-image: url(${brewery.imgUrl}); ${brewery.active ? '' : 'filter: grayscale(100%);'}`">
      <div id="text">
          <p style="font-size:0.75em; margin:0;" v-if="!brewery.active">Inactive 😢</p>
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
#background{
    background-image: url("https://media.istockphoto.com/photos/draught-beer-in-glasses-picture-id1040303026");
    background-size: cover;
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
    color: rgb(247, 243, 243);
    background-color: #24222280;
    padding: 1em;
    border-radius: 15px;
    text-transform: uppercase;
    margin-top: auto;
}

#background:hover, #text:hover{
    cursor: pointer;
}

</style>