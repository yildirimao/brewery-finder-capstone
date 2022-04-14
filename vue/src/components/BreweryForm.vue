<template>
  <div> 
      <button @click="toggleForm()">Show/Hide Brewery Form</button>
      <form class="brewery-form" v-show="this.showForm">
          <h1>New Brewery Form</h1>
          <label for="brewery-name">Name:</label> <br>
          <input type="text" name="brewery-name" v-model="brewery.name"/> <br>
          <label for="brewery-location">Location:</label><br>
          <input type="text" name="brewery-location" v-model="brewery.location"/><br>
          <button @click="submitBrewery">Submit</button>
      </form>
  </div>
</template>

<script>
import BreweryService from '@/services/BreweryService.js'
export default {
    data(){
        return {
            brewery: {
                id: -1,
                name: '',
                location: ''
            },
            showForm: 'false'
        }
    },
    methods: {
        submitBrewery(){
            BreweryService.createBrewery(this.brewery).then(response => {
                if(response.status == 201){
                    this.$router.push({name: 'Home'});
                }
                
            }).catch(error => {
                console.log(error);
            })
        },
        toggleForm(){
            this.showForm = !this.showForm;
        }
    }
}
</script>

<style>
    .hidden {
        display: none;
    }
</style>