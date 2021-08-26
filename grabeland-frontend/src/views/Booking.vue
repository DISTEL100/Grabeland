<template>
    <div id="booking" class="smallMargin">
       <el-card class="box-card">
            <template #header>
                <div class="card-header">
                    <span>Wähle einen Tag</span>
                </div>
            </template>
            <BookingSelectDay/>
        </el-card>
        <el-card class="box-card">
            <template #header>
                <div class="card-header">
                    <span>Wähle eine Uhrzeit</span>
                </div>
            </template>
                <BookingSelectSlot/>
        </el-card>
        <el-card v-if="$store.getters.date != ''" class="box-card">
            <template #header>
                <div class="card-header">
                    <span>Kontaktdaten</span>
                </div>
            </template>
            <BookingCredentials/>
        </el-card>

    </div>
</template>

<script>
import { mapGetters } from 'vuex'
import BookingSelectDay from '../components/BookingSelectDay.vue'
import BookingSelectSlot from '../components/BookingSelectSlot.vue'
import BookingCredentials from '../components/BookingCredentials.vue'
import {ElCard } from 'element-plus'

export default {
    name: 'Booking',
    components: {
        BookingSelectDay,
        ElCard,
        BookingSelectSlot,
        BookingCredentials
    },
    data() {
        return {
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
        window.scrollTo(0,0)
    }
}
</script>

<style scoped>
#booking {
    margin: 0 auto;
    box-sizing: border-box;
}
span {
    font-family: 'IBM Plex Title';
    font-size: 2rem;
}
.control {
    position:absolute;
    left: 0;
    top: 0;
    background: green;
}
.el-card {
    margin: 1em 0;
}
</style>
