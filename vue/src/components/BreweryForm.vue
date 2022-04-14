<template>
  <div> 
      <button @click="toggleForm()">Show/Hide Brewery Form</button>
      <form class="brewery-form" v-show="this.showForm">
          <h1>New Brewery Form</h1>
          <label for="brewery-name">Name:</label> <br>
          <input type="text" name="brewery-name" v-model="brewery.name"/> <br>
          <label for="brewery-location">Location:</label><br>
          <input type="text" name="brewery-location" v-model="brewery.location"/><br>
          <label for="brewery-phone">Phone Number:</label><br>
          <input type="text" name="brewery-phone" v-model="brewery.phone_number"/><br>
          <label for="brewery-hours">Hours of Operation:</label><br>
          <input type="text" name="brewery-hours" v-model="brewery.hours_of_operation"/><br>
          <label for="brewery-address">Address:</label><br>
          <input type="text" name="brewery-address" v-model="brewery.address"/><br>
          <label for="brewery-bio">History:</label><br>
          <input type="text" name="brewery-bio" v-model="brewery.bio"/><br>
          <label for="brewery-images">Enter an https:// URL for images:</label> <br />
          <input type="url" name="brewery-img" placeholder="https://exampleimg.com"  pattern="https://.*" size="20"
       required v-model="brewery.brewery_img" /> <br />
          <p>Brewery Status:</p>
          <label for="active">Active</label>
          <input type="checkbox" name="active" checked="Active" v-model="brewery.active"/>
          <label for="active">Inactive</label>
          <input type="checkbox" name="inactive" checked="Inactive" v-model="brewery.active"/><br>
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
                brewery_id: -1,
                brewery_name: '',
                brewery_location: '',
                phone_number: '',
                hours_of_operation: '',
                address: '',
                bio: '',
                brewery_img: '',
                active: false
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