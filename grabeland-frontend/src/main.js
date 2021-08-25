import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import i18n from './i18n'

import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

axios.defaults.baseURL = 'http://localhost:3001'

createApp(App).use(i18n).use(ElementPlus).use(store).use(router).mount('#app')
