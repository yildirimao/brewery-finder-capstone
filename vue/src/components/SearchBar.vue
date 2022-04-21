<template>
  <div id="search-bar">
      <form action="" id="search-form">
        <select name="" id="search-for" v-model="searchFor">
          <option value="breweries">Search for Breweries</option>
          <option value="beers">Search for Beers</option>
        </select>
        <input type="text" placeholder="Search for something!" id="search-text" v-model="searchTerms">
        <button id="search-btn" @click.prevent="performSearch()">🔎</button>
      </form>
  </div>
</template>

<script>
export default {
  data(){
    return {
      searchFor:"breweries",
      searchTerms:""
    }
  },
  methods:{
    performSearch(){
      //put search terms into query string
      this.$router.push({name:"Search", query:{for:this.searchFor, terms:this.searchTerms}})
    }
  }
}
</script>

<style>
#search-bar{
  width: 100%;
}

#search-form{
  width: 60%;
  margin:auto;
  display: flex;
}

#search-text{
  flex-grow: 1;
}

#search-for{
  border-top-left-radius: 15px;
  border-bottom-left-radius: 15px;
}

#search-btn{
  border-top-right-radius: 15px;
  border-bottom-right-radius: 15px;
  background-color: white;
  border: 1px black solid;
  transition: background-color 0.5s;
}

#search-btn:hover{
  background-color: grey;
}
</style>