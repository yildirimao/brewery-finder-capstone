<template>
  <div>
    <button @click="toggleForm()">Add New Brewery</button>
    <form class="brewery-form" v-show="this.showForm">
      <h1>New Brewery Form</h1>
      <label for="brewery-name">Name:</label> <br />
      <input type="text" name="brewery-name" v-model="brewery.name" /> <br />
      <label for="brewery-location">Location:</label><br />
      <input
        type="text"
        name="brewery-location"
        v-model="brewery.location"
      /><br />
      <label for="brewery-phone">Phone Number:</label><br />
      <input
        type="text"
        name="brewery-phone"
        v-model="brewery.phoneNumber"
      /><br />
      <label for="brewery-hours">Hours of Operation:<br>
        <span style="font-size:14px">Note: Separate days by a semi-colon. (;)</span>
      </label><br />
      <input
        type="text"
        name="brewery-hours"
        v-model="brewery.hoursOfOperation"
      /><br />
      <label for="brewery-address">Address:</label><br />
      <input
        type="text"
        name="brewery-address"
        v-model="brewery.address"
      /><br />
      <label for="brewery-bio">History:</label><br />
      <input type="text" name="brewery-bio" v-model="brewery.bio" /><br />
      <label for="brewery-images">Enter an https:// URL for images: <br>
        <span style="font-size:14px">Note: Separate extra images by a semi-colon. (;)</span>
      </label>
      <br />
      <input
        type="url"
        name="brewery-img"
        placeholder="https://exampleimg.com"
        pattern="https://.*"
        size="20"
        required
        v-model="brewery.imgUrl"
      />
      <br />
      <!-- server side doesn't set brewery actively -->
      <p>Brewery Status:</p>
      <label for="active">Active</label>
      <input
        type="checkbox"
        name="active"
        checked="Active"
        v-model="brewery.active"
        @click="toggleActivity()"
      /> <br>
      <button @click="submitBrewery">Submit</button>
    </form>
  </div>
</template>

<script>
import BreweryService from "@/services/BreweryService.js";
export default {
  data() {
    return {
      brewery: {
        id: -1,
        name: "",
        location: "",
        phoneNumber: "",
        hoursOfOperation: "",
        address: "",
        bio: "",
        imgUrl: "",
        active: true,
      },
      showForm: false,
    };
  },
  methods: {
    submitBrewery() {
      BreweryService.createBrewery(this.brewery)
        .then((response) => {
          if (response.status == 201) {
            this.$router.push({ name: "Home" });
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
        console.log(this.active);
        this.active = !this.active;
    }
  
  },
};
</script>

<style>
.hidden {
  display: none;
}
</style>