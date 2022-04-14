<template>
  <div>
    <button @click="toggleForm()">Show/Hide Form</button>
    <form class="brewery-update-form" v-show="this.showForm">
      <h1>Brewery Update Form</h1>
      <label for="brewery-time">Days/hours of operation:</label> <br />
      <input type="text" name="brewery-time" v-model="brewery.time" /> <br />
      <label for="brewery-contact">Contact Information:</label> <br />
      <input type="text" name="brewery-contact" v-model="brewery.contact" /> <br />
      <label for="brewery-location">Location:</label><br />
      <input
        type="text"
        name="brewery-location"
        v-model="brewery.location"
      /><br />
      <label for="brewery-history">History:</label> <br />
      <input type="text" name="brewery-history" v-model="brewery.history" /> <br />
      <label for="brewery-images">Enter an https:// URL for images:</label> <br />
      <input type="url" name="brewery-images" placeholder="https://exampleimg.com"  pattern="https://.*" size="20"
       required v-model="brewery.images" /> <br />
      <label for="brewery-status">Status:</label> <br />
      <select name="brewery-status" v-model="brewery.status"> 
          <option value="active">Active</option>
          <option value="inactive">Inactive</option>
      </select> <br />
      <button @click="changeBreweryInfo">Submit</button>
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
                time: '',
                contact: '',
                location: '',
                history: '',
                images:'',
                status: ''
            },
            showForm: 'false'
        }
    },
    methods: {
        changeBreweryInfo(){
            const brewery = {
                
            }
            BreweryService.updateBrewery(this.brewery).then(response => {
                if(response.status == 200){
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
};
</script>

<style>
</style>