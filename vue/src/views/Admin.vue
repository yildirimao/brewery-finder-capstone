<template>
    <div class="admin">
        <h1>Admin Functions</h1>
        <div class="forms">
            <div class="brewery">
                <brewery-form/>
            </div>
            <div class="brewer">    
                <brewer-form/>
            </div>
        </div>
    </div>    
</template>

<script>
import BrewerForm from '../components/BrewerForm.vue'
import BreweryForm from '../components/BreweryForm.vue'
export default {
  components: { BreweryForm, BrewerForm },

}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@900&display=swap');
.admin {
  font-family: "Playfair Display", serif;
}
.forms{
    display: grid;
    grid-template: "brewery brewer";
    gap: 3em;
}
.brewery{
    grid-area: "brewery";
}
.brewer{
    grid-area: "brewer";
}

.forms > div{
    background-color:#ffffff80;
    border-radius: 15px;
}

</style>
