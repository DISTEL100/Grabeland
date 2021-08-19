import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'

require('dotenv').config();

axios.defaults.baseURL = 'http://localhost:3001'

createApp(App).use(store).use(router).mount('#app')
