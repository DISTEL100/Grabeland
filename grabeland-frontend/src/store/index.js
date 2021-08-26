import { createStore } from 'vuex'

export default createStore({
  state: {
    date: '',
      timeID: '',
      time: '',
      name: '',
      email: '',
      phone: ''
  },
    getters: {
        date: (state) => {
            return state.date
        },
        time: (state) => {
            return state.time
        },
        timeID: (state) => {
            return state.timeID
        },
        name: (state) => {
            return state.name
        },
        email: (state) => {
            return state.email
        },
        phone: (state) => {
            return state.phone
        },
    },
  mutations: {
      reset (state) {
          state.date = '';
          state.time = '';
          state.timeID = '';
          state.name = '';
          state.email = '';
          state.phone = '';
      },
      date (state, payload) {
          state.time = '';
          state.date = payload
      },
      timeID (state, payload) {
          state.timeID = payload
      },
      time (state, payload) {
          state.time = payload
      },
      name (state, payload) {
          state.name = payload
      },
      email (state, payload) {
          state.email= payload
      },
      phone (state, payload) {
          state.phone = payload
      },
  },
  actions: {
  },
  modules: {
  }
})
