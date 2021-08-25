<template>
    <div id="bookingSelect">
        <div class="tableContainer">
            <div class="rowContainer ausgabe1 ">
                <p>Ausgabe I</p>
                <div class="row woche1 ">
                    <div @click="select('2021-09-16')" class="slot" :class="{ selected: date == '2021-09-16', zero: freeSeatsByDate('16.09') =='0' }">
                        <p class="date"> 16.09. </p>
                        <p class="empty">{{ freeSeatsByDate('16.09') }}  {{$t('booking.seats')}}</p>
                    </div>
                    <div @click="select('2021-09-17')" class="slot" :class="{ selected: date == '2021-09-17', zero: freeSeatsByDate('17.09') =='0' }">
                        <p class="date"> 17.09. </p>
                        <p class="empty">{{ freeSeatsByDate('17.09') }}  {{$t('booking.seats')}}</p>
                    </div>
                    <div @click="select('2021-09-18')" class="slot" :class="{ selected: date == '2021-09-18', zero: freeSeatsByDate('18.09') =='0' }">
                        <p class="date"> 18.09. </p>
                        <p class="empty">{{ freeSeatsByDate('18.09') }}  {{$t('booking.seats')}}</p>
                    </div>
                </div>
                <div class="row woche2 ">
                    <div class="non slot" style="cursor:unset"></div>
                    <div @click="select('2021-09-24')" class="slot" :class="{ selected: date == '2021-09-24', zero: freeSeatsByDate('24.09') =='0' }">
                        <p class="date" >24.09. </p>
                        <p class="empty">{{ freeSeatsByDate('24.09') }}  {{$t('booking.seats')}}</p>
                    </div>
                    <div @click="select('2021-09-25')" class="slot" :class="{ selected: date == '2021-09-25', zero: freeSeatsByDate('25.09') =='0' }">
                        <p class="date"> 25.09.</p> 
                        <p class="empty">{{ freeSeatsByDate('25.09') }}  {{$t('booking.seats')}}</p>
                    </div>
                </div>
            </div>
            <br>
            <div class="rowContainer ausgabe2 ">
                <p>Ausgabe II</p>
                <div class="row woche1 ">
                    <div @click="select('2021-09-30')" class="slot" :class="{ selected: date == '2021-09-30', zero: freeSeatsByDate('30.09') =='0' }">
                        <p class="date" >30.09.</p>
                        <p class="empty">{{ freeSeatsByDate('30.09') }}  {{$t('booking.seats')}}</p>
                    </div>
                    <div @click="select('2021-10-01')" class="slot" :class="{ selected: date == '2021-10-01', zero: freeSeatsByDate('01.10') =='0' }">
                        <p class="date" >01.10.</p>
                        <p class="empty">{{ freeSeatsByDate('01.10') }}  {{$t('booking.seats')}}</p>
                    </div>
                    <div @click="select('2021-10-02')" class="slot" :class="{ selected: date == '2021-10-02', zero: freeSeatsByDate('02.10') =='0' }">
                        <p class="date" >02.10.</p>
                        <p class="empty">{{ freeSeatsByDate('02.10') }}  {{$t('booking.seats')}}</p>
                    </div>
                </div>
                <div class="row woche2 ">
                    <div class="slot " style="cursor:unset">
                    </div>
                    <div @click="select('2021-10-08')" class="slot" :class="{ selected: date == '2021-10-08', zero: freeSeatsByDate('08.10') =='0' }">
                        <p class="date" >08.10.</p>
                        <p class="empty">{{ freeSeatsByDate('08.10') }}  {{$t('booking.seats')}}</p>
                    </div>
                    <div @click="select('2021-10-09')" class="slot" :class="{ selected: date == '2021-10-09', zero: freeSeatsByDate('09.10') =='0' }">
                        <p class="date" >09.10.</p>
                        <p class="empty">{{ freeSeatsByDate('09.10') }}  {{$t('booking.seats')}}</p>
                    </div>

                </div>
            </div>
        </div> 
    </div>
</template>

<script>
import axios from 'axios'

export default {
    name: 'BookingSelectDay',
    data() {
        return {
            freeSeats: []
        }
    },
    methods: {
        getFreeSeats() {
            axios
                .get('booking/freeseats')
                .then(response => (this.freeSeats = response.data))
        },
        select(date) {
            let dateFormatted = date.split('-');
            let dateFormatted2 = dateFormatted[2] + '.' +  dateFormatted[1]
            console.log(dateFormatted2)
            if ( this.freeSeatsByDate(dateFormatted2) != '0') {
                this.$store.commit('date', date)
            }
        },
        freeSeatsByDate(date) {
            let filtered = this.freeSeats.filter(entry => entry.Date === date)
            if (filtered.length === 1 ) {
                return filtered[0].Sum
            } else {
                return '0'
            }
        }
    },
    computed: {
        date() {
            return this.$store.getters.date
        }
    },
    mounted() {
        this.getFreeSeats();
    }
}
</script>

<style scoped>
#booking {
    width: 100%;
    box-sizing: border-box;
}
.tableContainer {
    justify-content: space-evenly;
    display: flex;
    flex-direction: column;
}
.rowContainer {
    display: flex;
    flex-direction: column;
}
.row {
    display: flex;
    flex-direction: row;
    flex: 1;
}
.non {
    cursor: unset;
}
.slot {
    flex: 1;
    border: 1px solid grey;
    margin: 0.2em;
    padding: 0.2em;
    cursor: pointer;
}
p{
    margin: 0.0em;
}
.empty {
    font-size: smaller;
}
.selected {
    background: lightgreen;
}
.zero {
    color: red;
    cursor: default;
}
</style>
