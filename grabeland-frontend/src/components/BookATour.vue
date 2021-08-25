<template>
  <div id="bookATour">
      <router-link to="/booking">
      <img src='../assets/Book.png' />
      </router-link >
 </div>
</template>

<script>
export default {
  name: 'BookATour',
}
</script>

<style scoped>
#bookATour {
    position: relative;
    box-sizing: border-box;
    width: 100%;
}
img {
    position: relative;
    left: -30%;
}
</style>
