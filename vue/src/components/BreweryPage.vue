<template>
  <div>
    <div
      class="brewery-picture"
      v-bind:style="`background:no-repeat url(${
        brewery.imgUrl.split(';')[0]
      }); background-position:center; background-size:cover`"
    >
      <div class="contrast">
        <div id="inf">
          <div id="b-name">
            <h1 style="margin-bottom: 0">{{ brewery.name }}</h1>
            <p style="margin-top: 0">{{ brewery.location }}</p>
          </div>

          <p id="b-bio" style="line-height: 1.8;">{{ brewery.bio }}</p>

          <div id="b-info">
            <ul id="b-hours">
              <li v-for="day in brewery.hoursOfOperation.split(';')" :key="day">
                {{ day }}
              </li>
            </ul>

            <div id="b-contact">
              <p>{{ brewery.address }}</p>
              <p>{{ brewery.phoneNumber }}</p>
            </div>
          </div>
          


        </div>
      </div>
    </div>

    <brewery-pictures
      v-if="brewery.imgUrl.includes(';')"
      v-bind:pics="brewery.imgUrl"
    />

    <div>
      <beer-list v-bind:id="this.$route.params.id" />
    </div>
    <div class="forms" v-if="isBrewer()">
      <brewery-update-form id="brewery-form" />
      <beer-form v-bind:b_id="this.$route.params.id" id="beer-form" />
    </div>
  </div>
</template>

<script>
import BeerList from "./BeerList.vue";
import BreweryService from "@/services/BreweryService.js";
import BreweryPictures from "./BreweryPictures.vue";
import BreweryUpdateForm from "../components/BreweryUpdateForm.vue";
import BeerForm from "../components/BeerForm.vue";
// import BrewerService from "@/services/BrewerService";
export default {
  components: { BeerList, BreweryPictures, BreweryUpdateForm, BeerForm },
  data() {
    return {
      brewery: {},
    };
  },
  created() {
    if (this.$store.state.breweries.length > 0) {
      this.brewery = this.$store.state.breweries.find((b) => {
        return b.id == this.$route.params.id;
      });
    } else {
      BreweryService.getBrewery(this.$route.params.id).then((response) => {
        if (response.status == 200) {
          this.brewery = response.data;
        }
      });
    }

  
  },
  methods: {
    ifBrewer() {
      if(this.$store.state.user.authorities == undefined){
        return false;
      }else if(this.$store.state.user.authorities[0].name == "ROLE_BREWER"){
        return true;
      } else {
        return false;
      }

    },
    isBrewer(){
      let cuser = this.$store.state.user
        if(cuser.breweryId != undefined){
        // renamed the user because user was overwritten in somewhere else
        return cuser.authorities.some(a => a.name == "ROLE_BREWER") &&
              cuser.breweryId == this.$route.params.id;
      }
    }
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Kanit:wght@100;200;300;400;500;600;700&display=swap");

.brewery-picture {
  background-image: url("https://media.istockphoto.com/photos/draught-beer-in-glasses-picture-id1040303026");
  display: flex;
  justify-content: center;
  width: fit-content;
  margin: 0 auto;
  margin-bottom: 1em;
  padding: 1em 3em;
  border-radius: 15px;
}

.contrast {
  font-family: "Kanit", sans-serif;
  background-color: #000000c0;
  color: white;
  width: fit-content;
  height: fit-content;
  border-radius: 15px;
  margin: 1em;
  padding: 1em;
  animation: colorin 1s;
}

#inf {
  display: grid;
  grid-template-areas:
    "name name name"
    "info bio bio"
    "info bio bio";
  animation: fadein 3s;
}

@keyframes fadein {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

@keyframes colorin {
  from {
    background-color: transparent;
  }
  to {
    background-color: #000000c0;
  }
}

#b-name {
  grid-area: name;
}

#b-name h1 {
  margin-bottom: 0;
  border-bottom: 1px white solid;
}

#b-name p {
  margin-top: 0;
}

#b-info {
  grid-area: info;
  padding-right: 2em;
  margin-right: 0;
  margin-bottom: 2em;
  border-right: white 1px solid;
}

#b-bio {
  grid-area: bio;
  padding-left: 2em;
  margin-left: 0;
}

#b-hours {
  text-align: left;
}

.forms {
  margin-top: 1em;
  display: flex;
  justify-content: space-evenly;
}
</style>