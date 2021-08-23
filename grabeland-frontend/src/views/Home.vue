<template>
    <div id="Home">
        <Intro/>
        <About/>
        <Artists/>
    </div>
</template>

<script>
import axios from 'axios'
import Intro from '../components/Intro.vue'
import About from '../components/About.vue'
import Artists from '../components/Artists.vue'


export default {
    name: 'Home',
    components: {
        Intro,
        About,
        Artists
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

<style scoped> 
#Home {
    border: solid 2px grey;
    width: 100%;
    box-sizing: border-box;
    margin : 0 auto;
} 
</style>
