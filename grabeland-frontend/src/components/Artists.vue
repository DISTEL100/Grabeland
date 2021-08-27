<template>
    <div id="artists" class="smallMargin">
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
    margin: 0 auto;
    position: relative;
    box-sizing: border-box;
}
p {
    position: relative;
    margin:2rem 0.6rem;
}
#artists_img {
    width: 100%;
}
@media(max-width: 1000px) {
    #artists {
    }
}


</style>
