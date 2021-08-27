<template>
  <div id="bookATour">
      <router-link to="/booking">
      <img src='../assets/TourButton.png' />
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
    box-sizing: border-box;
    padding-top: 5rem;
    margin: 0 auto;
    width: 24rem;
    cursor: url('../assets/Cursor/Ameise_hover_kleiner.png'), auto;
}

a {
    cursor: url('../assets/Cursor/Ameise_hover_kleiner.png'), auto;
}


img {
    display: block;
    width: 100%;
    margin: 0 auto;
    z-index: 10000;
    filter: drop-shadow(0rem 0rem 0.5rem white);
}


@media(max-width: 1000px) {
    img {
    }
#bookATour {
    width: 12rem;
}
}

</style>
