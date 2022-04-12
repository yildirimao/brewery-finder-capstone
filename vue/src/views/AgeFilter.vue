<template>
  <div>
      <h1>
          Are you 21 years old?
      </h1>
      <button @click="setIs21">
          Yes, I am at least 21 years old.
      </button>
  </div>
</template>

<script>
export default {
    methods:{
        setIs21(){
            localStorage.setItem("is21","true");
            this.$router.push("/");
        }
    }
}
</script>

<style>

</style>