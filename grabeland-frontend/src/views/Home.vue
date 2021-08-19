<template>
    <div class="home">
        <HelloWorld msg="Welcome to Your Vue.js App"/>
        <button @click=getGardens> GÄRTEN </button>
        {{gardens}}
    </div>
</template>

<script>
import HelloWorld from '@/components/HelloWorld.vue'
import axios from 'axios'

export default {
    name: 'Home',
    components: {
        HelloWorld
    },
    data () {
        return {
            gardens: []
        }
    },
    methods: {
        getGardens() {
            axios
                .get('gardens')
                .then( response => {
                    this.gardens = response.data
                })
        }
    }
}
</script>
