<template>
  <div id="app">
    <div class="map-type">
      <div class="map-type--choice" v-for="(type, index) in mapTypes" :key="index" :class="{'type-selected' : typeSelected === index}">
        <input type="radio" name="nav" :id="type" :value="index" v-model="typeSelected"/>
        <label class="map-type--label" :for="type" >{{type}}</label>
      </div>
    </div>
    
    <l-map :center="[-0.7893, 113.9213]" :zoom="5" style="height: 500px;margin-top: 10px;" :options="mapOptions">
      <l-choropleth-layer 
        v-if="typeSelected == 0"
        :key=0
        :data="electionResult" 
        titleKey="provinceName" 
        idKey="provinceIso" 
        geojsonIdKey="code_hasc" 
        :value="value[0]" 
        :extraValues="extraValues" 
        :geojson="indonesiaGeoJson"
        :colorScale="colorScale1"
        :colorScale1="colorScale1" 
        :colorScale2="colorScale2"
        :twoColor="twoColor"
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" :unit="props.unit" title="" placeholder="Hover for more info"/>
          <!-- <l-reference-chart title="Girls school enrolment" :colorScale="colorScale" :min="props.min" :max="props.max" position="topright"/> -->
        </template>
      </l-choropleth-layer>
      <l-choropleth-layer 
        v-if="typeSelected == 1"
        :key=1
        :data="electionResult" 
        titleKey="provinceName" 
        idKey="provinceIso" 
        :value="value[1]" 
        :extraValues="extraValues" 
        geojsonIdKey="code_hasc" 
        :geojson="indonesiaGeoJson"
        :colorScale="colorScale2"
        :colorScale1="colorScale1" 
        :colorScale2="colorScale2"
        :twoColor="twoColor"
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" :unit="props.unit" title="" placeholder="Hover for more info"/>
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
      type: 0,
      electionResult,
      indonesiaGeoJson,
      colorScale: ["00FF00", "008000", "008000"],
      colorScale1: ["FFBFBF", "FF3030", "400000"],
      colorScale2: ["BFBFFF", "3030FF", "000040"],
      colorScaleJokowi: ["BFBFFF", "BFBFFF", "000040"],
      mapOptions: {
        attributionControl: false
      },
      // currentStrokeColor: '3d3213',
      mapTypes: [
        '2019 overall percentage',
        '2019 Jokowi',
        '2014-2019 Jokowi\'s vote differences',
        '2014-2019 Prabowo\'s vote differences',
        '2014-2019 overall difference'
      ],
      typeSelected: 0,
      twoColor: false,
      value: [
        {
          key: 'result2019.prabowo.votes',
          metric: 'votes'
        },
        {
          key: 'result2019.jokowi.votes',
          metric: 'votes'
        },
        {
          key: 'result2019.prabowo.votes',
          metric: 'votes'
        },
      ],
      value2: {
        key: 'result2019.jokowi.votes',
        metric: 'votes'
      }
    }
  },
  computed: {
    // value() {
    //   let key = '', metric = '';

    //   switch(this.typeSelected){
    //     case 0:
    //       key = 'result2019.prabowo.votes';
    //       metric = 'votes';
    //     break;

    //     case 1:
    //       key = 'result2019.jokowi.votes';
    //       metric = ' votes';
    //     break;

    //     case 2:
    //       key= 'voteDifference.overall';
    //       metric = '';
    //     break;
    //   }
    //   return {
    //     key: key,
    //     metric: metric
    //   }
    // },
    extraValues() {
      return [{
        key: "result2014.prabowo.percentage",
        metric: "% Prabowo"
      }]
    }
  }
}
</script>
<style>
@import "../node_modules/leaflet/dist/leaflet.css";
body {
  background-color: #e7d090;
  font-family: 'Lato', sans-serif;
}

#map {
  background-color: #eee;
}

.map-type {
  display: flex;
  flex-direction: row;
  justify-content: center;
}

.map-type--choice {
  min-height: 100%;
  max-width: 250px;
  display: inline-block;
  margin-right: 10px;
  text-align: center;
  background-color: white;
  color: #212b36;
}

.map-type--label {
  height: 100%;
  padding: 12px;
  font-size: 16px;
  line-height: 22px;
  display: block;
}

.map-type--label {
  cursor: pointer;
}

.map-type--choice:hover {
  background-color: #800080;
  color: white;
  transition-property: background-color;
  transition-duration: 0.3s;
}

input[type='radio'] {
  display: none;
}

.type-selected {
  background-color: #800080;
  color: white;
  transition-property: background-color;
  transition-duration: 0.3s;
}
</style>
