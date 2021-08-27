<template>
    <div id="bookingSelectSlot">
        <div class="slotContainer">
            <div v-if="$store.getters.date == ''" class="warn">
                <p class="warn" > Bitte zuerst ein Datum auswählen </p>
            </div>
            <div
                @click="selectSlot(slot.ID, slot.Time)"
                v-for="slot in freeSlots"
                v-bind:key="slot.Time" 
                class="slot"
                :class="{selected: selectedTime == slot.ID, zero: slot.FreeTickets == '0'}" >
                <p> {{ slot.Time }} </p>
                <p class="tickets"> {{ slot.FreeTickets }} {{$t('booking.seats')}}</p>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'BookingSelectSlot',
    data() {
        return {
            freeSlots: []
        }
    },
    computed: {
        selectedDate() {
            return this.$store.getters.date
        },
        selectedTime() {
            return this.$store.getters.timeID
        }
    },
    props: {
        date: String
    },
    watch: {
        selectedDate: function () {
            this.getFreeSlots(this.selectedDate)

        }
    },
    async beforeRouteEnter(to, from, next) {
        next(vm => {
            vm.getFreeSlots(vm.date)
        })
    },
    methods: {
        getFreeSlots(date) {
            axios
                .get('booking/slots', {params:{date: date} } )
                .then(res => (this.freeSlots = res.data))
        },
        selectSlot(id, time) {
            let slot = this.freeSlots.filter(s => s.ID == id)[0]
            console.log(slot)
            console.log(id)
            console.log(time)
            if ( slot.FreeTickets != '0' ) {
            this.$store.commit('timeID', id)
            this.$store.commit('time', time)
            }
        },
        mounted() {
        }
    }
}
</script>

<style scoped>
.slotContainer {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.warn {
    font-size: small;
    color: red;
}
p{
    margin: 0.3em;
}
.slot {
    border: 1px solid grey;
    margin: 0.3em;
    padding: 0.3em;
    text-align: left;
    cursor: url('../assets/Cursor/Ameise_hover_kleiner.png'), auto;
}
.tickets {
    font-size: smaller;
}
.selected {
    background: yellow;
}
.zero {
    color: red;
    cursor: url('../assets/Cursor/Ameise_kleiner.png'), auto;
}
</style>
