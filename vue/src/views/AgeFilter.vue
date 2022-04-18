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
@import url('https://fonts.googleapis.com/css2?family=Kanit:wght@100;200;300;400;500;600;700&display=swap');
div {
    font-family: 'Kanit', sans-serif;
}

</style>