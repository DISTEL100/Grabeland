
// initial state
// shape: [{ id, quantity }]
const state = () => ({
  items: [],
  checkoutStatus: null
})

// getters
const getters = {
  cartProducts: (state, getters, rootState) => {
    return state.items.map(({ id, quantity }) => {
      const product = rootState.products.all.find(product => product.id === id)
      return {
        title: product.title,
        price: product.price,
        quantity
      }
    })
  },
}

// actions
const actions = {
  checkout ({ commit, state }, products) {
    commit('setCheckoutStatus', null)
    commit('setCartItems', { items: products })
    console.log(state)
 },
}

// mutations
const mutations = {
  pushProductToCart (state, { id }) {
    state.items.push({
      id,
      quantity: 1
    })
  },
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
