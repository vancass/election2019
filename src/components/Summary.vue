<template>
    <div>
        <section class="summary-container" v-if="type==0">
            <h2>Summary</h2>
            <div class="summary-content">
                <section class="summary-block jokowi-info">
                    <h3>Top 5 Jokowi  supporters (%):</h3>
                    <ol>
                        <li v-for="summary in summary.jokowi.percentage" :key="summary">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                        </li>
                    </ol>
                </section>
                <section class="summary-block jokowi-info">
                    <h3>Top 5 Jokowi supporters (votes):</h3>
                    <ol>
                        <li v-for="summary in summary.jokowi.votes" :key="summary">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
                <section class="summary-block prabowo-info">
                    <h3>Top 5 Prabowo supporters (%):</h3>
                    <ol>
                        <li v-for="summary in summary.prabowo.percentage" :key="summary">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                        </li>
                    </ol>
                </section>
                <section class="summary-block prabowo-info">
                    <h3>Top 5 Prabowo supporters (votes):</h3>
                    <ol>
                        <li v-for="summary in summary.prabowo.votes" :key="summary">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
            </div>
        </section>
        <section class="summary-container" v-if="type==1">
            <h2>Jokowi 2014-2019 Summary</h2>
            <div class="summary-content">
                <section class="summary-block">
                    <h3>Top 5 increase (%):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.jokowi.percentageIncrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                            
                        </li>
                    </ol>
                </section>
                <section class="summary-block">
                    <h3>Top 5 increase (votes):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.jokowi.voteIncrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>

                        </li> 
                    </ol>
                </section>
            </div>
            <div class="summary-content">
                <section class="summary-block">
                    <h3>Top 5 decrease (%):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.jokowi.percentageDecrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                            
                        </li>
                    </ol>
                </section>
                <section class="summary-block">
                    <h3>Top 5 decrease (votes):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.jokowi.voteDecrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
            </div>
        </section>
        <section class="summary-container" v-if="type==2">
            <h2>Prabowo 2014-2019 Summary</h2>
            <div class="summary-content">
                <section class="summary-block">
                    <h3>Top 5 increase (%):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.percentageIncrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                            
                        </li>
                    </ol>
                </section>
                <section class="summary-block">
                    <h3>Top 5 increase (votes):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.voteIncrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
            </div>
            <div class="summary-content">
                <section class="summary-block">
                    <h3>Top 5 decrease (%):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.percentageDecrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="'-' + summary.num + '%'"/>
                            
                        </li>
                    </ol>
                </section>
                <section class="summary-block">
                    <h3>Top 5 decrease (votes):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.voteDecrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
            </div>
        </section>
        <section class="summary-container" v-if="type==3">
            <h2>2014-2019 Overall Summary</h2>
            <div class="summary-content">
                <section class="summary-block">
                    <h3>Top 5 increase (%):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.percentageIncrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                            
                        </li>
                    </ol>
                </section>
                <section class="summary-block">
                    <h3>Top 5 increase (votes):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.voteIncrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
            </div>
            <div class="summary-content">
                <section class="summary-block">
                    <h3>Top 5 decrease (%):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.percentageDecrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="summary.num + '%'"/>
                            
                        </li>
                    </ol>
                </section>
                <section class="summary-block">
                    <h3>Top 5 decrease (votes):</h3>
                    <ol>
                        <li v-for="(summary, index) in summary.prabowo.voteDecrease" :key="index">
                            <SummaryValue :name="summary.provinceNameEn" :value="addThousandComma(summary.num)"/>
                        </li> 
                    </ol>
                </section>
            </div>
        </section>
    </div>
</template>

<script>
import summary from '../data/summary.json';
import { addThousandComma } from '../util';
import SummaryValue from './SummaryValue';

export default {
    props: {
        type: Number
    },
    components: {
        SummaryValue
    },
    data() {
        return {
            summary
        }
    },
    computed: {
        numWithComma() {
            return this.summary.num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
        }
    },
    methods: {
        addThousandComma(num) {
            return addThousandComma(num);
        }
    }
}
</script>

<style scoped>
h2 {
    margin: 0;
    /* text-align: center; */
}

ol {
    padding-inline-start: 30px;
}
.summary-container {
    display: flex;
    flex-direction: column;
    padding: 20px;
    margin: auto;
    /* max-width: 700px; */
}
.summary-content {
    display: inline-flex;
    flex-direction: row;
    flex-wrap: wrap;
    margin: auto;
    margin-bottom: 20px;
}

.summary-block {
    margin-right: 40px;
}

.jokowi-info {
    color: #850000;
}

.prabowo-info {
    color: #00007e;
}

</style>