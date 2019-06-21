<template>
    <div class="analysis-container">
        <h2>Analysis</h2>
        <section v-if="type==0">
            <ol>
                <li>
                    The province with the highest percentage of support for Jokowi is <strong>Bali</strong>. Bali is well known as the base for PDI-P party, the party that backs Jokowi.
                </li>
                <li>
                    <strong>Papua</strong> is the 2nd highest of Jokowi supporters in terms of percentage. This might be mainly because Jokowi has been developing Papua by building infrastructures and such.
                </li>
                <li>
                    Top 3 Prabowo's supporters in terms of percentage are <strong>West Sumatra</strong>, <strong>Aceh</strong>, and <strong>West Nusa Tenggara</strong>, of whom the population mostly consists of religious Muslims.
                </li>
                <li>
                    In terms of the number of votes, the top 3 for both Jokowi and Prabowo are: <strong>Central Java</strong>, <strong>East Java</strong>, and <strong>West Java</strong>. This emphasizes the fact that Java island houses most of Indonesia population.
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
                    In 2019, Jokowi managed to strengthen his position in <strong>Bali</strong> and <strong>Papua</strong>, increasing his vote percentage from ~70% to ~90% in those two provinces.
                </li>
                <li>
                    According to the news and opinion, <strong>North Sulawesi</strong>'s increase in support for Jokowi is because during Jokowi's term, the development of the area can be felt by the citizens<sup>[1][2]</sup>.
                    We can also take note that North Sulawesi is well-known as the base for PDI-P and Golkar, who back Jokowi this time.
                </li>
                <li>
                    Jokowi has a huge decrease of support in <strong>Aceh</strong>. Aceh is one of the provinces with the highest number of radical Muslims. 
                    On the other hand, there's a huge increase of support for Jokowi in East Nusa Tenggara, a province with Christian majority.
                </li>
                <li>
                    Jokowi's decrease of support in <strong>South Sulawesi</strong> is mainly because he was never that popular in South Sulawesi. 
                    In the previous election, the people voted for him because his running mate, Jusuf Kalla, was from the province <sup>[3]</sup>. 
                    Interestingly, even though Jusuf Kalla declared his support for Jokowi for the 2019 election, there is still huge decrease of votes from South Sulawesi. 
                    The biggest reason for the voters' swing to Prabowo might be because his running mate, Sandiaga Uno, is a descendant of the Bugis tribe, one of the tribes in South Sulawesi <sup>[4]</sup>.
                </li>
                <li>
                    Overall, it seems that places with the most number of radical Muslims (Aceh, West Sumatra, Riau) has lesser support for Jokowi. On the other hand, places with higher number of religious minorities (Bali, North Sulawesi, East Nusa Tenggara) tend to have more support for Jokowi.
                </li>
            </ol>
            <p id="note-1">[1]: <a href="http://manado.tribunnews.com/2019/04/18/suara-jokowi-di-sulut-capai-85-persen-warga-miangas-antusias-pilih-capres-01" target="_blank" rel="noreferrer noopener">http://manado.tribunnews.com/2019/04/18/suara-jokowi-di-sulut-capai-85-persen-warga-miangas-antusias-pilih-capres-01</a></p>
            <p id="note-2">[2]: <a href="https://www.kompasiana.com/marhaenaputra/5cbaed2acc52831efd32b3c2/mengapa-rakyat-sulawesi-utara-memilih-jokowi-ma-ruf-di-pilpres-2019" target="_blank" rel="noreferrer noopener">https://www.kompasiana.com/marhaenaputra/5cbaed2acc52831efd32b3c2/mengapa-rakyat-sulawesi-utara-memilih-jokowi-ma-ruf-di-pilpres-2019</a></p>
            <p id="note-3">[3]: <a href="https://beritagar.id/artikel/berita/magnet-jk-bagi-suara-jokowi-di-makassar" target="_blank" rel="noreferrer noopener">https://beritagar.id/artikel/berita/magnet-jk-bagi-suara-jokowi-di-makassar</a></p>
            <p id="note-4">[4]: <a href="https://regional.kompas.com/jeo/sulsel-peta-tak-terprediksi-jokowi-maruf-vs-prabowo-sandiaga" target="_blank" rel="noreferrer noopener">https://regional.kompas.com/jeo/sulsel-peta-tak-terprediksi-jokowi-maruf-vs-prabowo-sandiaga</a></p>
        </section>
        <section v-if="type==2">
            <ol>
                <li>
                    Overall, the provinces with radical Muslims majority (Aceh, South Sulawesi, Southeast Sulawesi) has increase support for Prabowo, despite South Sulawesi's governor claim of supporting Jokowi.
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
                    The highest increase in the number of voters can be seen from provinces with the biggest population: <strong>provinces in Java island</strong> and <strong>North Sumatra</strong>.
                </li>
                <li>
                    Jokowi gained a lot of supporters in <strong>East Java</strong> and <strong>Central Java</strong>, which are the base of PDI-P. This can be seen as the key to his victory.
                </li>
            </ol>
        </section>
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
    padding-top: 0;
    margin-bottom: 60px;
}

li {
    margin-bottom: 20px;
}

a {
    word-break: break-all;
}

#note-1, #note-2, #note-3, #note-4 {
    font-size: 12px;
}

#note-1 {
    margin-top: 30px;
}

</style>