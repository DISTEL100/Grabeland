<template>
    <el-card class="box-card">
        <template #header>
            <div class="card-header">
                <span> {{ $t('storno.confirm') }}</span>
            </div>
        </template>
        <el-button @click="storno" type="danger">{{ $t('ja') }}!</el-button>
    </el-card>
</template>

<script>
import { mapGetters } from 'vuex'
import { ElCard, ElLoading, ElMessage, ElButton } from 'element-plus'
import axios from 'axios'

export default {
    name: 'Storno',
    components: {
        ElCard,
        ElButton
    },
    props: {
        ticketNo: String
    },
    data() {
        return {
        }
    },
    methods: {
        async storno() {
            let loadingInstance = ElLoading.service({ fullscreen: true });
            await axios
                .get('/booking/storno', {params: {ticketNo: this.ticketNo}})
                .then( res => {
                    if ( res.data.affectedRows == 1 ) {
                        console.log ( '1 affected Row')
                        ElMessage.success({
                            message: this.$t('storno.success')
                        })
                    } else {
                        ElMessage.error({
                            message: this.$t('storno.fail')
                        })
                    }
                    loadingInstance.close();
                    this.$router.push('/')
                })
        }
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
button {
    display: block;
    margin: 0 auto;
    padding: 0 5rem;
}
.el-card {
    text-align: center;
    margin: 2em auto;
    width: 23rem;
}
</style>
