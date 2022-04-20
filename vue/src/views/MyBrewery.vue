<template>
  <div>
      <div id="brewery-grid" >
    <router-link  v-for="brewery in this.$store.state.breweries" :key="brewery.id" v-bind:to="{ name: 'brewery', params:{id:brewery.id}}">
      <brewery-card  v-if="brewery.active" v-bind:brewery="brewery"/>
      <brewery-card v-else v-bind:brewery="brewery" style="filter: grayscale(100%);" v-text="brewery.name + ' is inactive'"/>
    </router-link>
  </div>
      <brewery-page v-bind:key="brewery.id"/>
  </div>
</template>

<script>
import BreweryCard from '@/components/BreweryCard.vue'
import BreweryPage from '../components/BreweryPage.vue'
import BreweryService from '../services/BreweryService'
export default {
  components: { BreweryPage, BreweryCard },
    data(){
        return {
            brewery: {}
        }
    },
    created(){
        BreweryService.getBrewery(this.$route.params.id).then((response) => {
        if (response.status == 200) {
          this.brewery = response.data;
        }
      });
    }
}
</script>

<style>

</style>