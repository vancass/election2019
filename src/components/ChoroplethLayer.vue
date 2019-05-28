<template>
  <div>
    <l-geo-json :geojson="geojsonData.geojson" :options="geojsonOptions" :options-style="styleFunction" ref="geolayer"></l-geo-json>
    <slot :currentItem="currentItem" :unit="value.metric" :min="min1" :max="max1"></slot>
  </div>
</template>
<script>

import {LGeoJson} from "vue2-leaflet"
import chroma from "chroma-js"
import { getMin, getMax, normalizeValue, validNumber } from "../util"

function mouseover({ target }) {
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
      fillColor: "#FFFFC0"
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

function getColor(param, colorScale1, colorScale2, min1, max1, min2, max2) {
  let colorScale = colorScale1, realMin = min1, realMax = max1, realParam = param;

  if (realParam > 50) {
    colorScale = colorScale2;
    realMin = min2;
    realMax = max2;
  }
  else {
    realParam = 100 - param;
  }
  
  console.log(`realParam: ${realParam}, min: ${realMin}, max: ${realMax}`);
  let test = chroma
    .scale(colorScale)
    .mode("lch")(normalizeValue(realParam, realMin, realMax))
    .hex();

  console.log('test :', test);
  return test;
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
    value: Object,
    extraValues: Array,
    geojsonIdKey: String,
    mapStyle: Object,
    zoom: Number,
    mapOptions: Object,
    strokeColor: {type: String, default: 'fff'},
    currentStrokeColor: {type: String, default:'666'},
    strokeWidth: {type: Number, default: 1},
    currentStrokeWidth: {type: Number, default: 1}
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
    min1() {
      const result = Math.min(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.value.key))).map(x => Number(getValue(x, this.value.key))));
      return result;
    },
    max1() {
      const result = Math.max(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.value.key))).map(x => Number(getValue(x, this.value.key))));
      return result;
    },
    min2() {
      const result = Math.min(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.value.key))).map(x => Number(100-getValue(x, this.value.key))));
      return result;
    },
    max2() {
      const result = Math.max(...this.geojsonData.data.filter(x => validNumber(getValue(x, this.value.key))).map(x => Number(100-getValue(x, this.value.key))));
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
        let color = "NONE";
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
        const { min1, max1, min2, max2 } = this;

        return {
          weight: this.strokeWidth,
          opacity: 1,
          color: `#${this.strokeColor}`,
          dashArray: "3",
          fillOpacity: 0.7,
          fillColor: getColor(valueParam, this.colorScale1, this.colorScale2, min1, max1, min2, max2)
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
