<template>
    <div id="NavigationMenu">
        <a v-bind:href="baseURL">HOME</a>  
        <a v-bind:href="baseURL + '/home#about'">ABOUT</a>   
        <a v-bind:href="baseURL + '/home#artists'">ARTISTS</a>   
        <router-link to="/booking">BOOK A TOUR</router-link>  
        <router-link to="/impressum">IMPRESSUM</router-link>
        <span id="langSwitch" @click="switchLocale">{{ localeLabel }} </span>

    </div>
</template>

<script>
export default {
    name: 'NavigationMenu',
    computed: {
        baseURL() {
            return process.env.VUE_APP_BASE_URL;
        },
        localeLabel() {
                if ( this.$i18n.locale === 'de' ){
                    return 'EN'
                } else {
                    return 'DE'
                }
        },
    },
        methods: {
            switchLocale() {
                if ( this.$i18n.locale === 'de' ){
                    this.$i18n.locale = 'en'
                } else {
                    this.$i18n.locale = 'de'
                }
            }
        
    }
}
</script>

<style scoped>
a {
    margin: 1em;
    text-decoration: none;
    color: black;
}

#langSwitch {
    cursor: pointer;
    background: none;
    border: none;
}

#NavigationMenu {
    z-index: 111111111;
    padding: 30px;
    position: absolute;
    top: 2vh;
    right: 2vh;
    height: 10vh;
    font-weight: bold;
}

</style>
