<template>
  <div>
    <div class="toggle-beer-form">
      <button class="toggle-abf" @click="toggleForm()">Add Beer Form</button>
    </div>
    <form class="beer-form" v-show="this.showForm">
      <div class="header-beer">
        <h1>Add Beer Form</h1>
      </div>
      <div class="beer-name">
        <label for="beer-name">Name:</label><br />
        <input type="text" name="beer-name" v-model="beer.name" required />
      </div>
      <br />
      <div class="abv">
        <label for="abv">ABV:</label><br />
        <input type="number" name="abv" v-model="beer.abv" />
      </div>
      <br />
      <div class="beer-type">
        <label for="beer-type">Type:</label><br />
        <input type="text" name="beer-type" v-model="beer.type" />
      </div>
      <br />
      <div class="ibu">
        <label for="ibu">IBU:</label><br />
        <input type="number" name="ibu" v-model="beer.ibu" />
      </div>
      <br />
      <div class="hops">
        <label for="hops">Hops:</label><br />
        <input type="text" name="hops" v-model="beer.hops" />
      </div>
      <br />
      <div class="description">
        <label for="description">Description:</label><br />
        <input type="text" name="description" v-model="beer.description" />
      </div>
      <br />
      <div class="beer-img">
        <label for="beer-img">Image URL:</label><br />
        <input type="url" name="beer-img" v-model="beer.beer_img" />
      </div>
      <br />
      <div class="beer-available">
        <label for="beer-available">Available: </label>
        <input
          type="checkbox"
          name="beer-available"
          checked="Available"
          v-model="beer.available"
          @click="toggleActivity()"
        />
      </div>
      <br />
      <div class="submit-beer">
        <button @click="submitBeer">Add Beer</button>
      </div>
    </form>
  </div>
</template>

<script>
import BeerService from "../services/BeerService";
export default {
  props: ["b_id"],
  data() {
    return {
      beer: {
        id: -1,
        name: "",
        abv: 0,
        type: "",
        ibu: 0,
        hops: "",
        description: "",
        beer_img: "",
        malts: "",
        breweryID: -1,
        available: true,
      },
      showForm: false,
    };
  },
  methods: {
    submitBeer() {
      this.beer.breweryID = this.b_id;
      BeerService.createBeer(this.beer)
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
    toggleAvailability() {
      this.available = !this.available;
    },
  },
};
</script>

<style>
.toggle-abf {
  margin: 10px;
  border-radius: 15px;
}
.header-beer > h1 {
  margin: 15px;
  font-size: 25px;
}
.beer-form {
  background-color: #ffffff80;
  border-radius: 15px;
  padding: 1em;
}
</style>