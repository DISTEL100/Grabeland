<template>
  <div id="bookATour">
      <router-link to="/booking">
      <img src='../assets/bookTour.png' />
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
}

img {
    display: block;
    margin: 0 auto;
    z-index: 10000;
    filter: drop-shadow(1em 1em 0.3em black);
}


@media(max-width: 1000px) {
    img {
        width: 30%;
    }
}

</style>
