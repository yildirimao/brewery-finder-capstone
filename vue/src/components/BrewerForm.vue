<template>
    <div>
        <button @click="toggleForm()">Show/Hide Brewer Form</button>
        <form class="brewer-form" v-show="this.showForm">
            <h1>Add Brewer Form</h1>

            <label for="username">Username:</label><br>
            <select name="username" id="username">
                <option :value="user" v-for="user
                    in this.$store.state.users" :key="user.id">
                        {{ user.username }}
                </option>
            </select><br>

            <label for="brewery">Brewery Name:</label><br>
            <select name="brewery" id="brewery">
                <option :value="brewery.id" v-for="brewery 
                    in this.$store.state.breweries" :key="brewery.id">
                        {{ brewery.name }}
                </option>
            </select><br>

            <button @click="submitBrewer">Submit</button>
        </form>    
    </div>    
</template>

<script>

// update user role to brewer
// add userid and breweryid to brewer table

export default {
    created() {
        this.$store.commit("GET_LIST_BREWERY");
        this.$store.commit("GET_LIST_USER")
    },
    data(){
        return {
            showForm: false
        }
    },
    methods: {
        submitBrewer(){
            
        },
        toggleForm() {
            this.showForm = !this.showForm;
        }
    }
}
</script>
