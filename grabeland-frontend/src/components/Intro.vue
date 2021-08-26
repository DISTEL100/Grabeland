<template>
    <div id="intro" class="smallMargin">
        <img
                id="title"
                src="../assets/grabeland-logo.png" />
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
    }
}
</script>

<style scoped>
#intro {
    margin: 0  auto;
    box-sizing: border-box;
}

#title {
    width: 100%;
}

@media(max-width: 1000px) {
    #title {
        width: 100%;
    }
}
</style>
