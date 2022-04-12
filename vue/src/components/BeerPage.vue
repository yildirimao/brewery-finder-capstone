<template>
  <div>
    <div id="beer-picture" v-bind:style="`background:url(${beer.picture}); background-position:center;`">
      <div id="contrast">
        <h1>{{beer.name}} {{this.$route.params.id}}</h1>
        <p>{{beer.abv}}</p>
        <p>{{beer.type}}</p>
      </div>
    </div>
    <div>
        <h1>reviews go here!</h1>
        <section>
            <h2>review title</h2>
            <p>Sunt est minim proident magna tempor anim aliquip deserunt. Voluptate aliqua nulla aute velit ut ex consequat. Velit consectetur elit ad aute officia et. Adipisicing exercitation ut laborum elit ut sit sit. Aliqua fugiat proident dolor sit ad officia pariatur sint veniam aliqua. Tempor nostrud pariatur excepteur dolore et proident velit ut non eiusmod sint voluptate nisi aliquip.</p>
        </section>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      beer:{
        name: "Ahmets tea",
        abv: "100%",
        type: "tea",
        picture: "https://media.istockphoto.com/photos/glass-of-fresh-and-cold-beer-on-dark-background-picture-id1058117688?s=612x612"
      }
    }
  }
}
</script>

<style>
#beer-picture{
  display: flex;
  justify-content: center;
  width: fit-content;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em 5em;
  border-radius: 15px;
}
#contrast{
  background-color: #ffffff80;
  width: fit-content;
  height: fit-content;
  border-radius: 15px;
  margin: 1em;
  padding: 1em;
}
</style>