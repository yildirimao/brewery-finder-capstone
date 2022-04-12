<template>
  <div id="background">
      <div id="text">
          Beer
      </div>
  </div>
</template>

<script>
export default {

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