import { createRouter, createWebHistory } from 'vue-router'

const routes = [
    {
        path: '/',
        name: 'Home',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Home.vue'),
    },
     {
         path: '/storno/:ticketNo',
        name: 'Storno',
        component: () => import(/* webpackChunkName: "booking" */ '../views/Storno.vue'),
         props: true
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
   history: createWebHistory(process.env.BASE_URL),
    routes
})
router.afterEach(() => {
    setTimeout( () => {
        window.scrollTo(0, 0)
        document.getElementById('app').scrollTo(0,0)
    },100)
})

export default router
