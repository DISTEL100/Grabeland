<template>
    <div id="about">
        <p> {{ $t('about.text') }} </p>
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
#about {
    box-sizing: border-box;
    width: 100%;
    padding:3em  1em;

}
</style>
