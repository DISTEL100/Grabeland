import { createStore } from "vuex"
import booking from './modules/booking'

const debug = process.env.NODE_ENV !== 'production'

export default createStore({
  modules: {
    booking
  },
  strict: debug,
})
