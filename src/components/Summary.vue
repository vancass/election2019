<template>
    <!-- <section class="summary-container">
        <h2>Summary</h2>
        <div class="summary-content">
            <section class="summary-block">
                <h3>Top 5 Jokowi supporters (%):</h3>
                <ol>
                    <li v-for="summary in summary.top5jokowi.percentage" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num}}%
                        
                    </li>
                </ol>
            </section>
            <section class="summary-block">
                <h3>Top 5 Jokowi supporters (votes):</h3>
                <ol>
                    <li v-for="summary in summary.top5jokowi.votes" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}} votes
                    </li> 
                </ol>
            </section>
        </div>
        <div class="summary-content">
            <section class="summary-block">
                <h3>Top 5 Prabowo supporters (%):</h3>
                <ol>
                    <li v-for="summary in summary.top5prabowo.percentage" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num}}%
                        
                    </li>
                </ol>
            </section>
            <section class="summary-block">
                <h3>Top 5 Prabowo supporters (votes):</h3>
                <ol>
                    <li v-for="summary in summary.top5prabowo.votes" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}} votes
                    </li> 
                </ol>
            </section>
        </div>
    </section> -->
    <section class="summary-container">
        <h2>Summary</h2>
        <div class="summary-content">
            <section class="summary-block">
                <h3>Top 5 Jokowi supporters (%):</h3>
                <ol>
                    <li v-for="summary in summary.top5jokowi.percentage" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num}}%
                        
                    </li>
                </ol>
            </section>
            <section class="summary-block">
                <h3>Top 5 Jokowi supporters (votes):</h3>
                <ol>
                    <li v-for="summary in summary.top5jokowi.votes" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}} votes
                    </li> 
                </ol>
            </section>
        </div>
        <div class="summary-content">
            <section class="summary-block">
                <h3>Top 5 Prabowo supporters (%):</h3>
                <ol>
                    <li v-for="summary in summary.top5prabowo.percentage" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num}}%
                        
                    </li>
                </ol>
            </section>
            <section class="summary-block">
                <h3>Top 5 Prabowo supporters (votes):</h3>
                <ol>
                    <li v-for="summary in summary.top5prabowo.votes" :key="summary">
                        <strong>{{summary.provinceNameEn}}</strong> {{summary.num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}} votes
                    </li> 
                </ol>
            </section>
        </div>
    </section>
</template>

<script>
import summary from '../data/summary.json'


export default {
    data() {
        return {
            summary
        }
    }
}
</script>

<style scoped>
h2 {
    /* margin-top: 10px; */
    margin: 0;
    text-align: center;
}
.summary-container {
    padding: 10px;
    
}
.summary-content {
    display: flex;
    flex-direction: row;
    margin-bottom: 20px;
}

.summary-block {
    margin-right: 40px;
}

</style>