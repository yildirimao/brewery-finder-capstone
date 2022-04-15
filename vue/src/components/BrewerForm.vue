<template>
    <div>
        <button @click="toggleForm()">Show/Hide Brewer Form</button>
        <form class="brewer-form" v-show="this.showForm">
            <h1>Add Brewer Form</h1>
            <label for="user">Username:</label><br>
            <input type="text" name="user"><br>
            <label for="brewery">Brewery Name:</label><br>
            <input type="text" name="brewery"><br>
            <button >Submit</button>
        </form>    
    </div>    
</template>

<script>


// TO-DO:
// -check for valid username entry
// -check for valid brewery name entry

// update user role to brewer
// add userid and breweryid to brewer table



export default {
    data(){
        return {
            showForm: false
        }
    },
    methods: {
        toggleForm() {
            this.showForm = !this.showForm;
        }
    }
}
</script>
