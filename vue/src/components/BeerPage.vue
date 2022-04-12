<template>
  <div>
    <div>
      <h1>{{beer.name}} {{this.$route.params.id}}</h1>
      <p>{{beer.abv}}</p>
      <p>{{beer.type}}</p>
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
        type: "tea"
      }
    }
  }
}
</script>

<style>

</style>