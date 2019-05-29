<template>
  <div>
    <l-geo-json :geojson="geojsonData.geojson" :options="geojsonOptions" :options-style="styleFunction" ref="geolayer"></l-geo-json>
    <slot :currentItem="currentItem" :unit="value.metric" :min="percentageMinJokowi" :max="percentageMaxJokowi"></slot>
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
  let item = this.geojsonData.data.find(
    x => x[this.idKey] === (geojsonItem[this.geojsonIdKey])
  )
  if (item) {
    let tempItem = { name: item[this.titleKey], value: getValue(item, this.value.key), color: target.options.fillColor };

    target.setStyle({
      weight: this.currentStrokeWidth,
      color: `#${this.currentStrokeColor}`,
      dashArray: "",
      fillOpacity: 0.7,
      // fillColor: "#FFFFC0"
    })
    
    
    if (this.extraValues) {
      let tempValues = []
      for (let x of this.extraValues) {
        tempValues.push({
          value: getValue(item, x.key),
          metric: x.metric
        })
      }
      tempItem = { ...tempItem, extraValues: tempValues }
    }
    this.currentItem = tempItem
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

function getTwoColors(param, colorScale1, colorScale2, min1, max1, min2, max2) {
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
    colorScale: Array,
    colorScale1: Array,
    colorScale2: Array,
    titleKey: String,
    idKey: String,
    value: Object,
    extraValues: Array,
    geojsonIdKey: String,
    twoColor: Boolean,
    mapStyle: Object,
    zoom: Number,
    mapOptions: Object,
    strokeColor: {type: String, default: 'fff'},
    currentStrokeColor: {type: String, default:'666'},
    strokeWidth: {type: Number, default: 1},
    currentStrokeWidth: {type: Number, default: 3}
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
    percentageMinJokowi() {
      const result = Math.min(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.value.key)) && getValue(x, this.value.key) > 50).map(x => Number(getValue(x, this.value.key))));
      return result;
    },
    percentageMaxJokowi() {
      const result = Math.max(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.value.key)) && getValue(x, this.value.key) > 50).map(x => Number(getValue(x, this.value.key))));
      return result;
    },
    percentageMinPrabowo() {
      const result = Math.min(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.extraValues[0].key)) && getValue(x, this.extraValues[0].key) > 50).map(x => Number(getValue(x, this.extraValues[0].key))));
      return result;
    },
    percentageMaxPrabowo() {
      const result = Math.max(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.extraValues[0].key)) && getValue(x, this.extraValues[0].key) > 50).map(x => Number(getValue(x, this.extraValues[0].key))));
      return result;
    },
    min() {
      const data = this.geojsonData.data.map(x => Number(getValue(x, this.value.key)));
      const result = Math.min(...data);
      return result;
    },
    max() {
      const data = this.geojsonData.data.map(x => Number(getValue(x, this.value.key)));
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
        let valueParam = Number(getValue(item, this.value.key));
        if (!validNumber(valueParam)) {
          return {
            color: "white",
            weight: this.strokeWidth
          }
        }
        const { percentageMinJokowi, percentageMaxJokowi, percentageMinPrabowo, percentageMaxPrabowo, min, max } = this;

        // console.log('this.twoColor :', this.twoColor);
        if (this.twoColor) {
          fillColor = getTwoColors(valueParam, this.colorScale1, this.colorScale2, percentageMinJokowi, percentageMaxJokowi, percentageMinPrabowo, percentageMaxPrabowo);
        }
        else {
          fillColor = getOneColor(valueParam, this.colorScale, min, max);
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
