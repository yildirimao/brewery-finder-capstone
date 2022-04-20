<template>
    <div>
        <button @click="toggleForm()">Add Beer Form</button>
        <form class="beer-form" v-show="this.showForm">
            <h1>Add Beer Form</h1>
            <label for="beer-name">Name:</label><br>
            <input type="text" name="beer-name" v-model="beer.name"><br>
            <label for="abv">ABV:</label><br>
            <input type="number" name="abv" v-model="beer.abv"><br>
            <label for="beer-type">Type:</label><br>
            <input type="text" name="beer-type" v-model="beer.type"><br>
            <label for="ibu">IBU:</label><br>
            <input type="number" name="ibu" v-model="beer.ibu"><br>
            <label for="hops">Hops:</label><br>
            <input type="text" name="hops" v-model="beer.hops"><br>
            <label for="description">Description:</label><br>
            <input type="text" name="description" v-model="beer.description"><br>
            <label for="beer-img">Image URL:</label><br>
            <input type="url" name="beer-img" v-model="beer.beer_img"><br>
            <label for="brewery-id">Brewery Id:</label><br>
            <input type="number" name="brewery-id" v-model="beer.breweryID"><br>
            <label for="beer-available">Available: </label>
            <input type="checkbox" name="beer-available" checked="Available" v-model="beer.available" @click="toggleActivity()"><br>
            <button @click="submitBeer">Submit</button>
        </form>
    </div>    
</template>

<script>
import BeerService from "../services/BeerService"
export default {
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
                available: true
            },
            showForm: false,
        };
    },
    methods: {
        submitBeer() {
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
        }
    }
}
</script>

<style>
    .beer-form {
        background-color:#ffffff80;
        border-radius: 15px;
        padding: 1em;
    }
</style>