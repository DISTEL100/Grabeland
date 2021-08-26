<template>
 <div id="contact">
     <a href="https://www.instagram.com/graeserner_handschuh/" target="_blank" rel="noopener noreferrer">
         <img id="insta"  src="../assets/Buttons/Insta.png" />
     </a>
     <a href="mailto:mail@future-splendors.eu">
         <img id="mail" src="../assets/Buttons/Mail.png" />
     </a>
         <p @click="switchLocale" >{{ locale }}</p>
 </div>
</template>

<script>
export default {
  name: 'Contact',
   computed: {
       locale() {
           if ( this.$i18n.locale === 'de' ) {
               return 'EN'
           } else {
               return 'DE'
           }
       }
   },
    methods: {
        switchLocale() {
 if ( this.$i18n.locale === 'de' ) {
             this.$i18n.locale = 'en'
           } else {
             this.$i18n.locale = 'de'
           }

        }
    }

}
</script>

<style scoped>
#contact {
    position: absolute;
    top: 1rem;
    right: 1rem;
    box-sizing: border-box;
    display: flex;
    justify-content: flex-end;
    align-items: center
}
p {
    font-size: 3.6rem;
    cursor: pointer;
    margin: 0 0.3rem; 
    line-height: 0;
    margin-bottom: 1.0rem;
   text-shadow: none; 
}
img {
    padding: 0rem 0.5rem;
}
#mail {
    flex:1;
    height:3rem;
}
#insta {
    flex: 1;
    height:3rem;
}
.impressum {
    flex: 1;
    width:6rem;
}
a {
    text-decoration: unset;
    color: black;
}

@media(max-width: 1000px) {
    #contact {
        right: 0.1rem;
    }
#mail {
    flex:1;
    height:1.8rem;
}
#insta {
    flex: 1;
    height:1.8rem;
}
.impressum {
    flex: 1;
    width:3rem;
}
p {
    font-size: 2rem;
}
}
</style>
