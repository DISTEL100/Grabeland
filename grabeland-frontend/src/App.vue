<template>
    <div> 
        <router-view/>
    </div>
</template>

<script>

export default {
    name: 'App',
    components: {
    }
}
</script>
<style>
body {
    margin: 0;
    margin: 0;
    padding: 0;
    height: 100vh;
    width: 100vw;
    overflow: hidden;
    background: url('./assets/Hintergrund/1.jpg') no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
    cursor: url('./assets/Cursor/Ameise_kleiner.png'), auto;
}
.smallMargin{
    width: 60rem;
}
a {
    cursor: url('./assets/Cursor/Ameise_hover_kleiner.png'), auto;
}
#app {
    margin: 0 auto;
    cursor: url('./assets/Cursor/Ameise_kleiner.png'), auto;
    padding: 0;
    height: 100vh;
    max-width: 1300px;
    overflow: auto;
    font-family: 'IBM Plex';
    font-size: 1.4em;
    text-align: justify;
    line-height: 1.8;
    text-shadow: 3px 0  5px #FFF, 0 3px  5px #FFF, -3px 0  5px #FFF, 0 -3px  5px #FFF;
    box-sizing: border-box;
    scrollbar-width: none;
    -ms-overflow-style:none;
}
::-webkit-scrollbar {
    display: none;
}

@media(max-width: 1000px) {
    #app {
    font-size: 1em;
}
.smallMargin{
    width: 88vw;
}
}

@font-face {
  font-family: 'IBM Plex';
  font-style: normal;
  src: url('assets/font/IBMPlexSans-Regular.woff') format('woff')
}
@font-face {
  font-family: 'IBM Plex Title';
  font-style: normal;
  src: url('assets/font/IBMPlexSans-Regular.woff') format('woff')
}

</style>
