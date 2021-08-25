<template>
    <div id="bookingCredentials">
        <el-form :rules="rules" :model="personalData" ref="personalData">
            <el-form-item label-position="left" :label-width="labelWidth" label="Vor- und Nachname" prop="name">
                <el-input type="text" v-model="personalData.name" >
                </el-input>
            </el-form-item>
            <el-form-item label-position="left" :label-width="labelWidth" label="E-Mail" prop="email">
                <el-input type="email" v-model="personalData.email" >
                </el-input>
            </el-form-item>
            <el-form-item label-position="left" :label-width="labelWidth" label="Telefonnummer" prop="phone">
                <el-input type="tel" v-model="personalData.phone" >
                </el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="submitForm('personalData')">Buchen!</el-button>
            </el-form-item>
        </el-form>
    </div>
</template>

<script>
import {ElForm,ElFormItem, ElMessageBox, ElInput, ElButton} from 'element-plus'
import { mapGetters } from 'vuex'

export default {
    name: 'BookingCredentials',
    components: {
        ElForm,
        ElFormItem,
        ElInput,
        ElButton
    },
    data() {
        return {
            labelWidth: "12em",
            personalData: {
                name: '',
                email: '',
                phone: '',
                adress: {
                    street: '',
                    plz: '',
                    city: '',
                }
            },
            rules: {
                name: [
                    { required: true, message: 'Bitte Namen Eingeben', trigger: 'blur'},
                    { min: 3, message: 'Bitte Namen Eingeben', trigger: 'blur'}
                ],
                email: [
                    { required: true, message: 'Bitte eine gültige E-Mail Adresse eingeben', type: 'email', trigger: 'blur'},
                    { min: 4, message: 'Bitte eine gültige E-Mail Adresse eingeben', trigger: 'blur'}
                ],
                phone: [
                    { required: true, message: 'Bitte eine gültige Telefonnummer eingeben', trigger: 'blur'},
                    { min: 6, message: 'Bitte eine gültige Telefonnummer eingeben', trigger: 'blur'}
                ]

            }
        }
    },
    methods: {
        sendToStore() {
            this.$store.commit('name', this.personalData.name)
            this.$store.commit('email', this.personalData.email)
            this.$store.commit('phone', this.personalData.phone)
},
        submitForm(formName) {
            this.sendToStore();
            this.$refs[formName].validate((valid) => {
                console.log(this.time)
                if (valid && this.date != '' && this.time != '') {
                    ElMessageBox.alert(
'<p style="font-family:\'IBM Plex\'">Vielen Dank für die Buchung! Wir haben dir eine E-Mail geschickt.</p>',
                        {
                            confirmButtonText: 'OK',
                            dangerouslyUseHTMLString: true,
                            callback: () => {
                                this.$router.push('/')
                                this.$store.commit('reset')
                            }
                        });
                } else {
                    ElMessageBox.alert(
'<p style="font-family:\'IBM Plex\'">Fehler! Bitte Datum und Uhrzeit auswählen und Kontaktdaten eingeben.</p>',
                        {
                            confirmButtonText: 'OK',
                            dangerouslyUseHTMLString: true,
                            callback: () => {
                            }
                        });
                    console.log('error submit!!');
                    return false;
                }
            });
        },
    },
    computed: {
        ...mapGetters([
'name',
            'date',
            'time',
            'email',
            'phone'
        ])
    },
    mounted() {
    }
}
</script>

<style scoped>

#bookingCredentials {
}
.div {
    font-family: 'IBM Plex';
    color: black;
}
.el-form-item {
    font-family: 'IBM Plex';
    color: black;
}
.el-button {
    font-family: 'IBM Plex';
}
.el-input {
    font-family: 'IBM Plex';
}
p{
    text-align: left;
    margin-bottom: 0;
}
.left {
    margin-right: 1em;
    flex: 2;
}
.right {
    flex: 3;
}
.plzContainer{
    margin: 0.3em 0em;
    display: flex;
    flex-direction: row;

}
</style>
