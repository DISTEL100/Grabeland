<template>
    <div id="Booking"> 
        BOOKING
    </div>
    </template>

    <script>
    import axios from 'axios'

    export default {
        name: 'Booking',
        components: {
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
#p1 {
    border: 1px solid red;
    background: green;
    height: 300px;
    width: 300px;
    mask-image: url('../assets/logo.png') ;
    -webkit-mask-mode: alpha;
    filter: drop-shadow(2px 2px 5px rgb(0 0 0 / 0.5));
}
#p2 {
    position: absolute;
    border: 1px solid red;
    background: green;
    clip-path:url(#Parzelle4);
    height: 300px;
}
</style>
