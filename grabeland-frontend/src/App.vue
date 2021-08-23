<template>
    <div>
        <NavigationMenu/>
        <router-view/>
    </div>
</template>

<script>
import NavigationMenu from './components/NavigationMenu.vue'

export default {
    name: 'App',
    components: {
        NavigationMenu
    }
}
</script>
<style>
body {
    margin: 0;
    margin: 0;
    padding: 0;
    height: 100vh;
    width: 100vw;
    overflow: hidden;
}
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin: 0 auto;
    padding: 0;
    height: 100vh;
    width: 50vw;
    box-sizing: border-box;
    overflow: auto;
    border: 2px solid orange;
}
</style>
