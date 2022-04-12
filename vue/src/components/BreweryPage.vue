<template>
  <div>
      <h1>{{brewery.name}} {{this.$route.params.id}}</h1>
      <p>{{brewery.address}}</p>
      <p>{{brewery.phone}}</p>
  </div>
</template>

<script>
export default {
  data(){
    return {
      brewery:{
        name: "Brewery Name",
        address: "1234 main street, city, state, 55555",
        phone: "(513) 555-1234"
      }
    }
  }
}
</script>

<style>

</style>