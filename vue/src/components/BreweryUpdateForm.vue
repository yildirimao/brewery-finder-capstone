<template>
  <div>
    <button @click="toggleForm()">Show/Hide Form</button>
    <form class="brewery-update-form" v-show="this.showForm">
      <h1>Brewery Update Form</h1>
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
    name: "update-brewery",
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
        changeBreweryInfo(){
            const  brewery = {
                brewery_id: this.brewery_id,
                brewery_name: this.brewery_name,
                brewery_location: this.brewery_location,
                phone_number: this.phone_number,
                hours_of_operation: this.hours_of_operation,
                address: this.address,
                bio: this.bio,
                brewery_img: this.brewery_img,
                active: this.active
            };
            BreweryService.updateBrewery(brewery.brewery_id, brewery).then(response => {
                if(response.status == 200){
                    this.$router.push({name: 'Brewery', params: {id: brewery.brewery_id}});
                }
                
            }).catch(error => {
                console.log(error);
            })
        },
        toggleForm(){
            this.showForm = !this.showForm;
        }
    }
};
</script>

<style>
</style>