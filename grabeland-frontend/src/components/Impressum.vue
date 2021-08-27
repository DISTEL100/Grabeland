<template>
 <div id="impressum" class="smallMargin">
     <router-link to="/impressum">
         <p class="impressum">Impressum</p>
     </router-link>
 </div>
</template>

<script>
export default {
  name: 'Impressum',
}
</script>

<style scoped>
#impressum {
    margin: 0 auto;
    text-align: right;
    cursor: url('../assets/Cursor/Ameise_hover_kleiner.png'), auto;
}
a {
    cursor: url('../assets/Cursor/Ameise_hover_kleiner.png'), auto;
    text-decoration: none;
    color: black;
}
p {
    cursor: url('../assets/Cursor/Ameise_hover_kleiner.png'), auto;
}

</style>
