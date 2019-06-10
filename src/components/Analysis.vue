<template>
    <div class="analysis-container">
        <h2>Analysis</h2>
        <section v-if="type==0">
            <ol>
                <li>
                    Bali supports Jokowi. This might be mainly Bali is the base of PDI-P and the Hindu majority in Bali might not favour the radicalism of Prabowo's supporters.
                </li>
                <li>
                    Papua is the highest percentage of Jokowi supporters. This might be mainly because Jokowi has been building infrastructures and developing Papua.
                    It's also because in Papua, the tribe follows the tribe leader. As long as the tribe leader chooses one person, the rest will follow.
                </li>
                <li>
                    In terms of the number of votes, the top 3 are: Central Java, East Java, and West Java. This is because most of Indonesia's population is in Java island.
                    Getting all the votes in Java alone can get you to the top even if the other provinces are against you.
                </li>
                <li>
                    Prabowo's supporters in terms of percentage are West Sumatra, Aceh, and West Nusa Tenggara, which have prominent Islamic power.
                </li>
                <li>
                    Again, the top 3 Prabowo supporters in terms of number of votes come from Java. This just shows how huge the population in Java island is.
                </li>
                <li>
                    Unlike US, Indonesia's election result is determined by the raw number of votes across the country. Technically, if the person can win the whole population in Java, he can be certain to win.
                </li>
            </ol>
        </section>
        <section v-if="type==1">
            <ol>
                <li>
                    Looking at the increase in %, Jokowi managed to strengthen his position in Bali and Papua.
                </li>
                <li>
                    Why does he has more supporters in North Sulawesi and East Nusa Tenggara?
                </li>
                <li>
                    Jokowi has a huge decrease in Aceh, due to rise in radical Muslims?
                </li>
                <li>
                    Jokowi's decrease of support in South Sulawesi is mainly because he was never that popular in South Sulawesi. In the previous election, the people voted for him because his running mate, Jusuf Kalla, was from the province.
                </li>
                <li>
                    Overall, it seems that places with the most number of radical Muslims (Aceh, West Sumatra, Riau) has lesser support for Jokowi.
                </li>
            </ol>
        </section>
        <section v-if="type==2">
            <ol>
                <li>
                    Overall, the provinces with the most number of radical Muslims (Aceh, South Sulawesi, Riau) has increase support for Prabowo.
                </li>
                <li>
                    On the other hand, provinces with the least number of radical Muslims (Bali, Papua) decrease their support for Prabowo.
                </li>
            </ol>
        </section>
        <section v-if="type==3">
            <ol>
                <li>
                    Overall, there is an increase in the number of voters compared to 2014 election. This may be due to more people are coming of age, or those who didn't vote before are now voting.
                </li>
                <li>
                    Highest increase in the number of voters are from the places with the biggest population: provinces in Java island and North Sumatra.
                </li>
                <li>
                    Out of the 3,130,318 vote increase in West Java, +1,220,253 (+39%) goes to Jokowi and +1,910,065 (+41%) goes to Prabowo. Overall, Prabowo receives 59.9% of total votes in West Java.
                </li>
                <li>
                    In East Java, there's an increase of 2,726,514 in votes, and we see a rise in votes for Jokowi by +4,562,355. Here, Prabowo lost -1,835,841 votes.
                </li>
                <li>
                    In Central Java, there's an increase of 2,324,698 in votes, and we see a rise in votes for Jokowi by +3,865,971. Here, Prabowo lost -1,541,273 votes. Thus, Jokowi gained a lot more supporters in East Java and Central Java. This can be seen as the key to his winning.
                </li>
                <li>
                    Out of the 1,197,952 vote increase in West Java, +441,680 (+37%) goes to Jokowi and +756,272 (+63%) goes to Prabowo. Overall, North Sumatra is won by Jokowi by a small margin (52.3%).
                </li>
            </ol>
        </section>
        <p class="footnote">If you want to contribute more analysis, please contact me on <a href="https://twitter.com/vancassa">Twitter</a>.</p>
    </div>
</template>

<script>
export default {
    props: {
        type: Number
    },
}
</script>

<style scoped>
.analysis-container {
    padding: 20px;
}

li {
    margin-bottom: 20px;
}

.footnote {
    font-style: italic;
}
</style>