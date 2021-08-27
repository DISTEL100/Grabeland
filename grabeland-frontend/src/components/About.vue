<template>
    <div id="about" class="smallMargin">
        <p> {{ $t('about.text1') }} </p>
        <p> {{ $t('about.text2') }} </p>
    </div>
</template>

<script>
export default {
    name: 'About',
    data () {
        return { }
    },
    mounted() {
    }
}
</script>

<style scoped>
p {
    margin:2rem 0.6rem;
}
#about {
    box-sizing: border-box;
    margin: 3rem auto;
}
</style>
