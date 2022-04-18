<template>
  <div>
    <button @click="toggleForm()">Brewery Update Form</button>
    <form class="brewery-update-form" v-show="this.showForm">
      <h1>Brewery Update Form</h1>
      <label for="brewery-phone">Phone Number:</label><br />
      <input
        type="text"
        name="brewery-phone"
        v-model="brewery.phoneNumber"
        required
      /><br />
      <label for="brewery-hours">Hours of Operation:</label><br />
      <input
        type="text"
        name="brewery-hours"
        v-model="brewery.hoursOfOperation"
        required
      /><br />
      <label for="brewery-address">Address:</label><br />
      <input
        type="text"
        name="brewery-address"
        v-model="brewery.address"
        required
      /><br />
      <label for="brewery-bio">History:</label><br />
      <input type="text" name="brewery-bio" v-model="brewery.bio" required/><br />
      <label for="brewery-images">Enter an https:// URL for images:</label>
      <br />
      <input
        type="url"
        name="brewery-img"
        placeholder="https://exampleimg.com"
        pattern="https://.*"
        size="20"
        v-model="brewery.imgUrl"
        required
      />
      <br />
      <p>Brewery Status:</p>
      <label for="active">Active</label>
      <input
        type="checkbox"
        name="active"
        checked="Active"
        v-model="brewery.active"
        @click="toggleActivity()"
        required
      /> <br>
      
      <button @click="changeBreweryInfo()">Update</button>
    </form>
  </div>
</template>

<script>
import BreweryService from "@/services/BreweryService.js";
export default {
  name: "update-brewery",
  data() {
    return {
      brewery: {
        id: this.$route.params.id,
        name: "",
        location: "",
        phoneNumber: "",
        hoursOfOperation: "",
        address: "",
        bio: "",
        imgUrl: "",
        active: false,
      },
      showForm: false,
    };
  },
  methods: {
    changeBreweryInfo() {
      BreweryService.updateBrewery(this.brewery.id, this.brewery)
        .then((response) => {
          if (response.status == 200) {
              console.log(response.status)
              alert("Brewery updated successfully!")
            this.$router.push({ name: "brewery", params: {id: this.brewery.id} });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    toggleForm() {
      this.showForm = !this.showForm;
    },
    toggleActivity(){
        this.active = !this.active;
        console.log(this.active);
    }
  },
};
</script>

<style>
</style>