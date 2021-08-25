<template>
  <div id="artists">
      <h2>Mit Arbeiten von</h2>
      <img id="artists_img" src="../assets/typ5.png" />
 </div>
</template>

<script>
export default {
  name: 'Artists',
}
</script>

<style scoped>
#artists {
    position: relative;
    box-sizing: border-box;
    width: 100%;
    height: 100vh;
}

#artists_img {
    width: 100%;
/*
filter: drop-shadow( 2px 2px red);
*/
}
</style>
