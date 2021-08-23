import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: Home,
    },
    {
        path: '/booking',
        name: 'Booking',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Booking.vue')
    },
    {
        path: '/impressum',
        name: 'Impressum',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Impressum.vue')
    }
]

const router = createRouter({
    mode: 'history',
    scrollBehavior: function(to) {
        if (to.hash) {
            return {selector: to.hash}
        } else {
            return { x: 0, y: 0 }
        }
    },
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
