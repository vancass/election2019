<template>
  <div id="app">
    <l-map :center="[-0.7893, 113.9213]" :zoom="5" style="height: 500px;" :options="mapOptions">
      <l-choropleth-layer 
        :data="electionResult" 
        titleKey="provinceName" 
        idKey="provinceIso" 
        :value="value" 
        :extraValues="extraValues" 
        geojsonIdKey="code_hasc" 
        :geojson="indonesiaGeoJson" 
        :colorScale1="colorScale1" 
        :colorScale2="colorScale2"
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" :unit="props.unit" title="Department" placeholder="Hover over a department"/>
          <!-- <l-reference-chart title="Girls school enrolment" :colorScale="colorScale" :min="props.min" :max="props.max" position="topright"/> -->
        </template>
      </l-choropleth-layer>
    </l-map>
  </div>
</template>

<script>
import InfoControl from './components/InfoControl';
// import ReferenceChart from './components/ReferenceChart';
import ChoroplethLayer from './components/ChoroplethLayer';

import indonesiaGeoJson from './data/indonesia.json'
import electionResult from './data/election_result.json'
import {LMap} from 'vue2-leaflet';

export default {
  name: "app",
  components: { 
    LMap,
    'l-info-control': InfoControl, 
    // 'l-reference-chart': ReferenceChart, 
    'l-choropleth-layer': ChoroplethLayer 
  },
  data() {
    return {
      electionResult,
      indonesiaGeoJson,
      colorScale1: ["FFBFBF", "FF3030", "400000"],
      colorScale2: ["BFBFFF", "3030FF", "000040"],
      value: {
        key: "result2014.jokowi.percentage",
        metric: "% Jokowi"
      },
      extraValues: [{
        key: "result2014.prabowo.percentage",
        metric: "% Prabowo"
      }],
      mapOptions: {
        attributionControl: false
      },
      currentStrokeColor: '3d3213'
    }
  },
}
</script>
<style>
@import "../node_modules/leaflet/dist/leaflet.css";
body {
  background-color: #e7d090;
  /* margin-left: 100px;
  margin-right: 100px; */
  /* width: 100%; */
}

#map {
  background-color: #eee;
}
</style>
