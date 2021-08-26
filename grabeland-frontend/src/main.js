import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import i18n from './i18n'

axios.defaults.baseURL = process.env.VUE_APP_AXIOS_BASE_URL

const app = createApp(App)
app.use(i18n).use(store).use(router)
app.mount('#app')
