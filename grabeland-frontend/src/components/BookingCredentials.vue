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
import { ElMessage, ElLoading, ElForm,ElFormItem,ElInput, ElButton} from 'element-plus'
import { mapGetters } from 'vuex'
import axios from 'axios'

export default {
    name: 'BookingCredentials',
    components: {
        ElForm,
        ElFormItem,
        ElInput,
        ElButton,
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
                if (valid && this.date != '' && this.time != '') {
                    this.valid()
                } else {
                    this.invalid()
                }
            });
        },
        async valid() {
            let loadingInstance = ElLoading.service({ fullscreen: true });
            let result = await this.bookTour()
            if (result === 'success') {
                //ERFOLG
                console.log(result)
                loadingInstance.close()
                ElMessage.success({
                    message: this.$t('booking.book1')
                })
                this.$router.push('/')
                this.$store.commit('reset')
            } else {
                loadingInstance.close()
                ElMessage.error({message: this.$t('booking.book3')})
                this.$store.commit('reset')
            }
        },
        invalid() {
            ElMessage.error({message: this.$t('booking.book2')})
        },
        async bookTour() {
            let res = await axios
                .get('booking/confirm', { params: { 
                    name: this.name,
                    email: this.email,
                    phone: this.phone,
                    date: this.date,
                    time: this.time,
                    timeID: this.timeID,
                    lang: this.$i18n.locale
                } })
            if (res.data.affectedRows === 1) {
                return 'success'
            } else {
                return null
            }
        }
    },
    computed: {
        ...mapGetters([
'name',
            'date',
            'time',
            'timeID',
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
