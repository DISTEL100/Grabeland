<template>
  <div id="intro">
 INTRO
 </div>
</template>

<script>
export default {
  name: 'Intro',
    data() {
        return {
        }
    },
    mounted() {
        console.log(process.env.VUE_APP_BASE_URL)
   }
}
</script>

<style scoped>
#intro {
    border: 2px solid blue;
    width: 100%;
    box-sizing: border-box;
    height: 70vh;
}
</style>
