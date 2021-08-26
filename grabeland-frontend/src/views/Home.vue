<template>
    <div id="Home">
        <Intro/>
        <About/>
        <Artists/>
        <BookATour/>
        <Contact/>
        <Impressum/>
    </div>
</template>

<script>
import Intro from '../components/Intro.vue'
import About from '../components/About.vue'
import Artists from '../components/Artists.vue'
import BookATour from '../components/BookATour.vue'
import Contact from '../components/Contact.vue'
import Impressum from '../components/Impressum.vue'

export default {
    name: 'Home',
    components: {
        Intro,
        About,
        Artists,
        BookATour,
        Contact,
        Impressum
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
