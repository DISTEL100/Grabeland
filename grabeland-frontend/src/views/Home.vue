<template>
    <div id="Home">
        <Intro/>
        <About/>
        <BookATour/>
        <Artists/>
    </div>
</template>

<script>
import Intro from '../components/Intro.vue'
import About from '../components/About.vue'
import Artists from '../components/Artists.vue'
import BookATour from '../components/BookATour.vue'
export default {
    name: 'Home',
    components: {
        Intro,
        About,
        Artists,
        BookATour
    },
    data () {
        return {
        }
    },
}
</script>

<style scoped> 
#Home {
} 
</style>
