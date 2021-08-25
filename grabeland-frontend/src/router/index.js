import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Home.vue'),
    },
    {
        path: '/booking',
        name: 'Booking',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Booking.vue'),
/*        children: [
            {
                path: '',
                component: () => import( '../components/BookingSelect.vue' )
            },
            {
                path: ':date',
                component: () => import( '../components/BookingSelectSlot.vue' ),
                props: true,
            },
            {
                path: ':date/:time',
                component: () => import( '../components/BookingCredentials.vue'),
                props: true
            }
        ]
        */
    },
    {
        path: '/impressum',
        name: 'Impressum',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Impressum.vue')
    }
]

const router = createRouter({
    mode: 'history',
    /*
    scrollBehavior: function(to) {
        if (to.hash) {
            return {el: to.hash}
        } else {
            return { x: 0, y: 0 }
        }
    },
    */
    history: createWebHistory(process.env.BASE_URL),
    routes
})

export default router
