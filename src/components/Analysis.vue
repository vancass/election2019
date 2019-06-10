<template>
    <div class="analysis-container">
        <h2>Analysis</h2>
        <section v-if="type==0">
            <ol>
                <li>
                    The province with the highest percentage of support for Jokowi is Bali. This might be mainly because Bali has the highest number of supporters for PDI-P party and the Hindu majority in Bali are not fond of Prabowo and the radicalism that supports him.
                </li>
                <li>
                    Papua is the 2nd highest of Jokowi supporters in terms of percentage. This might be mainly because Jokowi has been developing Papua by building infrastructures and such.
                    Moreover, in Papua, the tribe will follow the tribe leader's choice. This leads to vote result that can be lopsided. 
                </li>
                <li>
                    Top 3 Prabowo's supporters in terms of percentage are West Sumatra, Aceh, and West Nusa Tenggara, whom population are mostly religious Muslims.
                </li>
                <li>
                    In terms of the number of votes, the top 3 for both Jokowi and Prabowo are: Central Java, East Java, and West Java. This emphasizes the fact that Java island houses most of Indonesia population.
                    Getting all the votes in Java alone can get you to the top even if the other provinces vote against you.
                </li>
                <li>
                    Unlike US, Indonesia's election result is determined by the raw number of votes across the country. Technically, if the person can win the whole population in Java, he can be certain to win.
                </li>
            </ol>
        </section>
        <section v-if="type==1">
            <ol>
                <li>
                    In 2019, Jokowi managed to strengthen his position in Bali and Papua, increasing his vote percentage from ~70% to ~90% in those two provinces.
                </li>
                <li>
                    According to the news and opinion, North Sulawesi's increase in support for Jokowi is because during Jokowi's term, the development of the area can be felt by the citizens.[1][2] 
                    We can also take note that the majority in North Sulawesi is Christian.
                </li>
                <li>
                    Jokowi has a huge decrease of support in Aceh. Aceh is one of the provinces with the highest number of radical Muslims. 
                    On the other hand, there's a huge increase of support for Jokowi in East Nusa Tenggara, a province with Christian majority.
                </li>
                <li>
                    Jokowi's decrease of support in South Sulawesi is mainly because he was never that popular in South Sulawesi. 
                    In the previous election, the people voted for him because his running mate, Jusuf Kalla, was from the province. [3]
                    Interestingly, even though Jusuf Kalla declared his support for Jokowi for the 2019 election, there is still huge decrease of votes from South Sulawesi. 
                    We can also take note that South Sulawesi has a lot of Muslim population, although it's not certain how big is the influence of religion here. 
                    The biggest reason for the voters' swing to Prabowo might be because his running mate, Sandiaga Uno, is a descendant of the Bugis tribe, one of the tribes in South Sulawesi.[4]
                </li>
                <li>
                    Overall, it seems that places with the most number of radical Muslims (Aceh, West Sumatra, Riau) has lesser support for Jokowi. On the other hand, places with higher number of religious minorities (Bali, North Sulawesi, East Nusa Tenggara) tend to have more support for Jokowi.
                </li>
            </ol>
            [1]: http://manado.tribunnews.com/2019/04/18/suara-jokowi-di-sulut-capai-85-persen-warga-miangas-antusias-pilih-capres-01
            [2]: https://www.kompasiana.com/marhaenaputra/5cbaed2acc52831efd32b3c2/mengapa-rakyat-sulawesi-utara-memilih-jokowi-ma-ruf-di-pilpres-2019
            [3]: https://beritagar.id/artikel/berita/magnet-jk-bagi-suara-jokowi-di-makassar
            [4]: https://regional.kompas.com/jeo/sulsel-peta-tak-terprediksi-jokowi-maruf-vs-prabowo-sandiaga
        </section>
        <section v-if="type==2">
            <ol>
                <li>
                    Overall, the provinces with radical Muslims majority (Aceh, South Sulawesi, Southeast Sulawesi) has increase support for Prabowo.
                </li>
                <li>
                    On the other hand, provinces with non-Muslim majority (North Sulawesi, East Nusa Tenggara, Bali) has lesser support for Prabowo.
                </li>
            </ol>
        </section>
        <section v-if="type==3">
            <ol>
                <li>
                    Overall, there is an increase in the number of voters compared to the 2014 election. This may be due to more people who came of age, or those who didn't vote before are now voting.
                </li>
                <li>
                    The highest increase in the number of voters can be seen from provinces with the biggest population: provinces in Java island and North Sumatra.
                </li>
                <li>
                    Out of the 1,197,952 vote increase in North Sumatra, +37% goes to Jokowi and +63% goes to Prabowo. Overall, North Sumatra is won by Jokowi by a small margin (52.3%).
                </li>
                <li>
                    Out of the 3,130,318 vote increase in West Java, 39% goes to Jokowi and 41% goes to Prabowo. Overall, Prabowo receives 59.9% of total votes in West Java. 
                    West Java is interesting because it has been the base of PKS (Social Justice Party), which is the supporter of Prabowo. 
                    On the other hand, West Java governor, Ridwan Kamil, is the supporter of Jokowi.
                </li>
                <li>
                    In East Java, there's an increase of 2,726,514 in votes, and we see a rise in votes for Jokowi by +4,562,355 while Prabowo lost -1,835,841 votes.
                </li>
                <li>
                    In Central Java, there's an increase of 2,324,698 in votes, and we see a rise in votes for Jokowi by +3,865,971 while Prabowo lost -1,541,273 votes. 
                </li>
                <li>
                    Thus, we can see Jokowi gained a lot more supporters in East Java and Central Java. This can be seen as the key to his victory.
                </li>
            </ol>
        </section>
        <p class="footnote">If you want to contribute for the analysis, please contact me on <a href="https://twitter.com/vancassa">Twitter</a>.</p>
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
    margin-bottom: 40px;
}

li {
    margin-bottom: 20px;
}

.footnote {
    font-size: 14px;
    font-style: italic;
    margin-top: 60px;
}
</style>