<template>
        <div class="hello">
                <h2>HOME</h2>
                <button @click="buttonClicked">CLIGG</button>
        </div>
</template>

<script>
import { mapGetters, mapState } from 'vuex'

export default {
        name: 'Home',
        props: {
        },
        computed: {
                ...mapState({
                        checkoutStatus: state => state.cart.checkoutStatus
                }),
                ...mapGetters('cart', {
                        products: 'cartProducts',
                        total: 'cartTotalPrice'
                })
        },
        methods: {
                checkout (products) {
                        this.$store.dispatch('cart/checkout', products)
                },
        }

}
</script>

<style scoped>
h3 {
        margin: 40px 0 0;
}
ul {
        list-style-type: none;
        padding: 0;
}
li {
        display: inline-block;
        margin: 0 10px;
}
a {
        color: #42b983;
}
</style>
