<template>
  <div>
    <div class="toggle-form">
      <button class="toggle-buf" @click="toggleForm()">
        Brewery Update Form
      </button>
    </div>
    <form class="brewery-update-form" v-show="this.showForm">
      <div class="header">
        <h1>Brewery Update Form</h1>
      </div>
      <div class="brewery-phone">
        <label for="brewery-phone">Phone Number:</label><br />
        <input
          type="text"
          name="brewery-phone"
          value="phoneNumber"
          v-model="brewery.phoneNumber"
          required
        />
      </div>
      <br />
      <div class="brewery-hours">
        <label for="brewery-hours">Hours of Operation:</label><br />
        <input
          type="text"
          name="brewery-hours"
          v-model="brewery.hoursOfOperation"
          required
        />
      </div>
      <br />
      <div class="brewery-address">
        <label for="brewery-address">Address:</label><br />
        <input
          type="text"
          name="brewery-address"
          v-model="brewery.address"
          required
        />
      </div>
      <br />
      <div class="brewery-bio">
        <label for="brewery-bio">History:</label><br />
        <input type="text" name="brewery-bio" v-model="brewery.bio" required />
      </div>
      <br />
      <div class="brewery-images">
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
      </div>
      <br />
      <div class="brewery-status">
        <br />
        <!-- <label for="brewery-status">Brewery Status:</label> <br>
        <select name="brewery-status" id="brewery-status" @change="toggleActivity()">
          <option value="active" >Inactive</option>
          <option value="inactive" >Active</option>
        </select> -->
        <p>Brewery Status:</p>
        <label for="active">Active</label>
        <input
          type="checkbox"
          name="active"
          checked="Active"
          v-model="brewery.active"
          @click="toggleActivity()"
          required
        />
      </div>
      <div class="brewery-update">
        <button @click.prevent="changeBreweryInfo()">Update Brewery</button>
      </div>
      <div class="thanks">
        <p>Thank you for update, {{ $store.state.user.username }} !</p>
      </div>
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
  created() {
    if (this.brewery.id == this.$route.params.id) {
      BreweryService.getBrewery(this.$route.params.id).then((response) => {
        if (response.status == 200) {
          this.brewery = response.data;
        }
      });
    }
  },
  methods: {
    changeBreweryInfo() {
      BreweryService.updateBrewery(this.brewery.id, this.brewery)
        .then((response) => {
          if (response.status == 200) {
            console.log(response.status);
            alert("Brewery updated successfully!");
            this.$router.push({
              name: "brewery",
              params: { id: this.brewery.id },
            });
          }
        })
        .catch((error) => {
          console.log(error);
        });
    },
    toggleForm() {
      this.showForm = !this.showForm;
    },
    toggleActivity() {
      this.active = !this.active;
      console.log(this.$route.params.id);
    },
  },
};
</script>

<style>
.toggle-buf {
  margin: 10px;
  padding: 7px;
}
.header > h1 {
  margin: 15px;
  font-size: 25px;
}
.brewery-phone > label {
  margin: 5px;
}
.brewery-hours > label {
  margin: 5px;
}
.brewery-address > label {
  margin: 5px;
}
.brewery-bio > label {
  margin: 5px;
}
.brewery-images > label {
  margin: 5px;
}
.brewery-status > p {
  margin-bottom: 0px;
}
.brewery-update-form {
  background-color: #ffffff80;
  border-radius: 15px;
  display: grid;
  color: black;
  grid-template-areas:
    "head"
    "phone "
    "hours"
    "address"
    "history"
    "images"
    "status"
    "update";
}
.header {
  grid-area: head;
}
.brewery-phone {
  grid-area: phone;
}
.brewery-hours {
  grid-area: hours;
}
.brewery-address {
  grid-area: address;
}
.brewery-bio {
  grid-area: history;
}
.brewery-images {
  grid-area: images;
}
.brewery-status {
  grid-area: status;
}
.brewery-update {
  grid-area: update;
  padding: 20px;
}
</style>