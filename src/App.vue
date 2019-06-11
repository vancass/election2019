<template>
  <div id="app">
    <h2 class="title">Indonesian Presidential Election 2019</h2>
    <h5 class="subtitle">Interactive summary and analysis</h5>
    <div class="map-type">
      <div class="map-type--choice" v-for="(type, index) in mapTypes" :key="index" :class="{'type-selected' : typeSelected === index}">
        <input type="radio" name="nav" :id="type" :value="index" v-model="typeSelected"/>
        <label class="map-type--label" :for="type" >{{type}}</label>
      </div>
    </div>
    
    <l-map :center="[-0.7893, 113.9213]" :zoom="5" style="height: 400px;margin-top: 10px;" :options="mapOptions">
      <l-choropleth-layer 
        v-if="typeSelected == 0"
        :key=0
        :data="electionResult" 
        titleKey="provinceNameEn" 
        idKey="provinceIso" 
        geojsonIdKey="code_hasc" 
        :values="values[0]" 
        :geojson="indonesiaGeoJson"
        :colorScale1="colorScaleRed" 
        :colorScale2="colorScaleBlue"
        :twoColor=true
        :compareTwoValues=true
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" title="" placeholder="Hover for more info" :type="1"/>
          <!-- <l-reference-chart title="Girls school enrolment" :colorScale="colorScale" :min="props.min" :max="props.max" position="topright"/> -->
        </template>
      </l-choropleth-layer>
      <l-choropleth-layer 
        v-if="typeSelected == 1"
        :key=1
        :data="electionResult" 
        titleKey="provinceNameEn" 
        idKey="provinceIso" 
        :values="values[1]" 
        geojsonIdKey="code_hasc" 
        :geojson="indonesiaGeoJson"
        :colorScale1="colorScaleGreen" 
        :colorScale2="colorScaleRed"
        :twoColor=true
        :compareTwoValues=false
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" title="" placeholder="Hover for more info" :type="2"/>
          <!-- <l-reference-chart title="Girls school enrolment" :colorScale="colorScale" :min="props.min" :max="props.max" position="topright"/> -->
        </template>
      </l-choropleth-layer>
      <l-choropleth-layer 
        v-if="typeSelected == 2"
        :key=2
        :data="electionResult" 
        titleKey="provinceNameEn" 
        idKey="provinceIso" 
        :values="values[2]" 
        geojsonIdKey="code_hasc" 
        :geojson="indonesiaGeoJson"
        :colorScale1="colorScaleGreen" 
        :colorScale2="colorScaleRed"
        :twoColor=true
        :compareTwoValues=false
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" title="" placeholder="Hover for more info" :type="2"/>
          <!-- <l-reference-chart title="Girls school enrolment" :colorScale="colorScale" :min="props.min" :max="props.max" position="topright"/> -->
        </template>
      </l-choropleth-layer>
      <l-choropleth-layer 
        v-if="typeSelected == 3"
        :key=3
        :data="electionResult" 
        titleKey="provinceNameEn" 
        idKey="provinceIso" 
        :values="values[3]" 
        geojsonIdKey="code_hasc" 
        :geojson="indonesiaGeoJson"
        :colorScale1="colorScaleGreen" 
        :colorScale2="colorScaleRed"
        :twoColor=true
        :compareTwoValues=false
      >
        <template slot-scope="props">
          <l-info-control :item="props.currentItem" title="" placeholder="Hover for more info" :type="3"/>
          <!-- <l-reference-chart title="Girls school enrolment" :colorScale="colorScale" :min="props.min" :max="props.max" position="topright"/> -->
        </template>
      </l-choropleth-layer>
    </l-map>
    <Summary :type="typeSelected"/>
    <Analysis :type="typeSelected" />
  </div>
</template>

<script>
import InfoControl from './components/InfoControl';
// import ReferenceChart from './components/ReferenceChart';
import ChoroplethLayer from './components/ChoroplethLayer';
import Summary from './components/Summary';
import Analysis from './components/Analysis';

import indonesiaGeoJson from './data/indonesia.json';
import electionResult from './data/election_result.json';
import {LMap} from 'vue2-leaflet';

export default {
  name: "app",
  components: { 
    LMap,
    'l-info-control': InfoControl, 
    // 'l-reference-chart': ReferenceChart, 
    'l-choropleth-layer': ChoroplethLayer ,
    Summary,
    Analysis
  },
  data() {
    return {
      type: 0,
      electionResult,
      indonesiaGeoJson,
      colorScaleGreen: ["00FF00", "008000", "008000"],
      colorScaleGreen2: ["BFFFBF", "00FF00", "008000"],
      colorScaleRed: ["FFBFBF", "FF3030", "400000"],
      colorScaleBlue: ["BFBFFF", "3030FF", "000040"],
      colorScaleJokowi: ["BFBFFF", "BFBFFF", "000040"],
      mapOptions: {
        attributionControl: false
      },
      // currentStrokeColor: '3d3213',
      mapTypes: [
        '2019 Jokowi & Prabowo overall',
        // '2019 Jokowi',
        '2014-2019 Jokowi\'s votes difference',
        '2014-2019 Prabowo\'s votes difference',
        '2014-2019 overall votes increase'
      ],
      typeSelected: 0,
      values: [
          [
          {
            key: 'result2019.jokowi.percentage',
            metric: '% Jokowi'
          },
          {
            key: 'result2019.prabowo.percentage',
            metric: '% Prabowo'
          },
          {
            key: 'result2019.difference.percentage',
            metric: '% margin'
          },
        ],
        [
          {
            key: 'voteDifference.jokowi',
            metric: ' votes margin'
          },
          {
            key: 'result2019.jokowi.votes',
            metric: 'votes'
          },
          {
            key: 'result2014.jokowi.votes',
            metric: ' votes'
          }
        ],
        [
          {
            key: 'voteDifference.prabowo',
            metric: ' votes margin'
          },
          {
            key: 'result2019.prabowo.votes',
            metric: ' votes'
          },
          {
            key: 'result2014.prabowo.votes',
            metric: ' votes'
          }
        ],
        [
          {
            key: 'voteDifference.overall',
            metric: ' votes'
          },
          {
            key: 'voteDifference.jokowi',
            metric: ' Jokowi 2019'
          },
          {
            key: 'voteDifference.prabowo',
            metric: ' Prabowo 2019'
          }
        ]
      ]
    }
  },
  computed: {
  }
}
</script>
<style>
@import "../node_modules/leaflet/dist/leaflet.css";
body {
  background-color: #fdeece;
  font-family: 'Lato', sans-serif;
}

.title, .subtitle {
  text-align: center;
  font-family: 'Lustria', sans-serif;
}

.title {
  margin-bottom: 0;
}

.subtitle {
  margin-top: 0;
}

#map {
  background-color: #eee;
}

.map-type {
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;
  /* padding: 0 20px; */
  flex-wrap: wrap;
}

.map-type--choice {
  min-height: 100%;
  max-width: 200px;
  display: inline-block;
  margin-right: 10px;
  margin-bottom: 10px;
  text-align: center;
  background-color: white;
  color: #212b36;
}

.map-type--label {
  height: 100%;
  padding: 12px;
  font-size: 14px;
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
