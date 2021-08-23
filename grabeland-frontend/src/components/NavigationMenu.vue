<template>
    <div id="NavigationMenu">
        <a v-bind:href="baseURL + '/#intro'">INTRO</a> | 
        <a v-bind:href="baseURL + '/#about'">ABOUT</a> | 
        <a v-bind:href="baseURL + '/#artists'">ARTISTS</a> | 
        <router-link to="/booking">BOOK A TOUR</router-link> |
        <router-link to="/impressum">IMPRESSUM</router-link>
    </div>
</template>

<script>
export default {
    name: 'NavigationMenu',
    computed: {
        baseURL() {
            return process.env.VUE_APP_BASE_URL;
        }
    }
}
</script>

<style scoped>
#NavigationMenu {
    padding: 30px;
    position: absolute;
    top: 2vh;
    left: 2vh;
    height: 10vh;
    font-weight: bold;
}

</style>
