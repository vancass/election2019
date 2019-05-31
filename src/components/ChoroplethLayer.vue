<template>
  <div>
    <l-geo-json :geojson="geojsonData.geojson" :options="geojsonOptions" :options-style="styleFunction" ref="geolayer"></l-geo-json>
    <slot :currentItem="currentItem" :min="percentageMin1" :max="percentageMax1"></slot>
  </div>
</template>
<script>

import {LGeoJson} from "vue2-leaflet"
import chroma from "chroma-js"
import { normalizeValue, validNumber } from "../util"

function mouseover({ target }) {
  // eslint-disable-next-line
  if (!L.Browser.ie && !L.Browser.opera) {
    target.bringToFront()
  }

  let geojsonItem = target.feature.properties;
  
  // Find the mouseover country in the data
  let item = this.geojsonData.data.find(
    x => x[this.idKey] === (geojsonItem[this.geojsonIdKey])
  )

  if (item) {
    // Change the style of the selected area
    target.setStyle({
      weight: this.currentStrokeWidth,
      color: `#${this.currentStrokeColor}`,
      dashArray: "",
      fillOpacity: 0.7,
      // fillColor: "#FFFFC0"
    })

    // let tempItem = { name: item[this.titleKey], value: getValue(item, this.value.key), color: target.options.fillColor };

    let tempItem = { name: item[this.titleKey], color: target.options.fillColor};
    let tempValues = [];

    this.values.forEach(d => {
      tempValues.push({
        value: getValue(item, d.key),
        metric: d.metric
      })
    })

    tempItem = { ...tempItem, values: tempValues };
    this.currentItem = tempItem;
  }
}

function mouseout({ target }) {
  target.setStyle({
    weight: this.strokeWidth,
    color: `#${this.strokeColor}`,
    dashArray: "",
    fillColor: this.currentItem.color
  })
  this.currentItem = { name: "", value: 0, color: '' }
}

function getValue(obj, key) {
  const keys = key.split('.');
  let result = obj;
  keys.forEach(key => {
    result = result[key];
  })

  return result;
}

function getTwoColorsPercentage(param, colorScale1, colorScale2, min1, max1, min2, max2) {
  let colorScale = colorScale1, realMin = min1, realMax = max1, realParam = param;

  if (realParam > 50) {
    colorScale = colorScale2;
    realMin = min2;
    realMax = max2;
  }
  else {
    realParam = 100 - param;
  }
  
  let test = chroma
    .scale(colorScale)
    .mode("lch")(normalizeValue(realParam, realMin, realMax))
    .hex();

  return test;
}

function getTwoColors(param, colorScale1, colorScale2, min1, max1, min2, max2) {
  
  let colorScale = colorScale1, realMin = min1, realMax = max1, realParam = param;
  if (realParam < 0) {
    colorScale = colorScale2;
    realMin = min2;
    realMax = max2;
    realParam = param*-1;
  }
  
  let test = chroma
    .scale(colorScale)
    .mode("lch")(normalizeValue(realParam, realMin, realMax))
    .hex();


  return test;
}

function getOneColor(param, colorScale, min, max) {
  // console.log(`param: ${param} min: ${min} max: ${max}`);
  return chroma
    .scale(colorScale)
    .mode("lch")(normalizeValue(param, min, max))
    .hex();
}

export default {
  props: {
    geojson: Object,
    data: Array,
    center: Array,
    colorScale1: Array,
    colorScale2: Array,
    titleKey: String,
    idKey: String,
    values: Array,
    extraValues: Array,
    geojsonIdKey: String,
    twoColor: Boolean,
    mapStyle: Object,
    zoom: Number,
    mapOptions: Object,
    strokeColor: {type: String, default: 'fff'},
    currentStrokeColor: {type: String, default:'666'},
    strokeWidth: {type: Number, default: 1},
    currentStrokeWidth: {type: Number, default: 3},
    compareTwoValues: Boolean
  },
  mounted() {
    if (this.$parent._isMounted) {
      this.deferredMountedTo(this.$parent.mapObject)
    }
  },
  data() {
    return {
      currentItem: { name: "", value: 0, color: "" },
      fillColor: "#e4ce7f"
    }  
  },
  computed: {
    positiveData() {
      return this.geojsonData.data.filter(x => validNumber(getValue(x, this.values[0].key)) && getValue(x, this.values[0].key) > 0).map(x => Number(getValue(x, this.values[0].key)));
    },
    negativeData() {
      return this.geojsonData.data.filter(x => validNumber(getValue(x, this.values[0].key)) && getValue(x, this.values[0].key) < 0).map(x => Number(getValue(x, this.values[0].key))*-1);
    },
    percentageData1() {
      return this.geojsonData.data.filter(x => validNumber(getValue(x, this.values[0].key)) && getValue(x, this.values[0].key) > 50).map(x => Number(getValue(x, this.values[0].key)));
    },
    percentageData2() {
      return this.geojsonData.data.filter(x => validNumber(getValue(x, this.values[1].key)) && getValue(x, this.values[1].key) > 50).map(x => Number(getValue(x, this.values[1].key)));
    },
    positiveMin() {
      return Math.min(...this.positiveData);
    },
    positiveMax() {
      return Math.max(...this.positiveData);
    },
    negativeMin() {
      return Math.min(...this.negativeData);
    },
    negativeMax() {
      return Math.max(...this.negativeData);
    },
    percentageMin1() {
      return Math.min(...this.percentageData1);
    },
    percentageMax1() {
      return Math.max(...this.percentageData1);
    },
    percentageMin2() {
      return Math.min(...this.percentageData2);
    },
    percentageMax2() {
      return Math.max(...this.percentageData2);
    },
    min() {
      const data = this.geojsonData.data.map(x => Number(getValue(x, this.values[0].key)));
      const result = Math.min(...data);
      return result;
    },
    max() {
      const data = this.geojsonData.data.map(x => Number(getValue(x, this.values[0].key)));
      const result = Math.max(...data);
      return result;
    },
    geojsonData() {
      return {geojson: {...this.geojson}, data: this.data};
    },
    geojsonOptions() {
      return {
        onEachFeature: (feature, layer) => {
          layer.on({
            mouseover: mouseover.bind(this),
            mouseout: mouseout.bind(this)
          })
        }
      }
    },
    styleFunction() {
      return (feature) => {
        let itemGeoJSONID = feature.properties[this.geojsonIdKey];
        let fillColor = '';
        const {data} = this.geojsonData;
        let item = data.find(x => x[this.idKey] === itemGeoJSONID);

        if (!item) {
          return {
            color: "white",
            weight: this.strokeWidth
          }
        }
        let valueParam = Number(getValue(item, this.values[0].key));
        if (!validNumber(valueParam)) {
          return {
            color: "white",
            weight: this.strokeWidth
          }
        }
        const { percentageMin1, percentageMax1, percentageMin2, percentageMax2, min, max, positiveMin, positiveMax, negativeMin, negativeMax } = this;

        if (this.compareTwoValues) {
          fillColor = getTwoColorsPercentage(valueParam, this.colorScale1, this.colorScale2, percentageMin1, percentageMax1, percentageMin2, percentageMax2);
        }
        else if (this.twoColor) {
          fillColor = getTwoColors(valueParam, this.colorScale1, this.colorScale2, positiveMin, positiveMax, negativeMin, negativeMax);
        }
        else {
          fillColor = getOneColor(valueParam, this.colorScale1, min, max);
        }

        return {
          weight: this.strokeWidth,
          opacity: 1,
          color: `#${this.strokeColor}`,
          dashArray: "3",
          fillOpacity: 0.7,
          fillColor: fillColor
        }
      };
    },
  },
  components: {
    LGeoJson
  },
  methods: {
    deferredMountedTo(parent) {
      this.parent = parent
      for (var i = 0; i < this.$children.length; i++) {
        if (typeof this.$children[i].deferredMountedTo === "function") {
          this.$children[i].deferredMountedTo(parent)
        }
      }
    }
  }
}
</script>
