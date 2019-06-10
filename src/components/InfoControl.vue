<template>
    <div></div>
</template>

<script>
import { addThousandComma } from "../util"

export default {
  props: {
    /**
     * `item` is an object containing:
     * - title
     * - array of values (with `value` and `metric`)
     * 
     */
    item: Object,
    placeholder: {
      type: String,
      default: ""
    },
    title: String,
    position: {
      type: String,
      default: "bottomleft"
    },
    type: Number
  },
  mounted() {
    const { title, placeholder, position, type } = this;
    
    // eslint-disable-next-line
    this.mapObject = L.control({
      position: position
    })

    // eslint-disable-next-line
    this.mapObject.onAdd = function(map) {
      // eslint-disable-next-line
      this._div = L.DomUtil.create("div", "info") // create a div with a class "info"
      this.update({ name: "", values: 0, placeholder, title, type});
      return this._div
    }

    this.mapObject.update = function({
      name,
      values,
      title,
      placeholder,
      type
    }) {
      if (name.length > 0) {
        let sign = '';

        switch (type) {
          case 1:
            /**
            * Type 1:
            *  % Jokowi
            *  % Prabowo
            *  % difference
            */

            this._div.innerHTML = `<h4> ${title} </h4> <b> ${name} </b>`;
            values.forEach( d => {
              this._div.innerHTML = this._div.innerHTML + `<br/> ${d.value} ${d.metric}`;
            });

            break;

          case 2:
            /**
             * Type 2:
             *  2019: (num)
             *  2014: (num)
             *  (arrow) (num) difference
             */
            this._div.innerHTML = `<h4> ${title} </h4> <b> ${name} </b>`;

            this._div.innerHTML = this._div.innerHTML + `<br/> ${addThousandComma(values[0].value)} ${values[0].metric}`;
            this._div.innerHTML = this._div.innerHTML + `<br/> <strong>2019:</strong> ${addThousandComma(values[1].value)}`;
            this._div.innerHTML = this._div.innerHTML + `<br/> <strong>2014:</strong> ${addThousandComma(values[2].value)}`;

            break;

          case 3: 
            /**
             * Type 3:
             *  (num) increase
             *  (arrow) (num) Jokowi 
             *  (arrow) (num) Prabowo
             */

            this._div.innerHTML = `<h4> ${title} </h4> <b> ${name} </b>`;

            this._div.innerHTML = this._div.innerHTML + `<br/> ${addThousandComma(values[0].value)} increase`;

            if (values[1].value > 0 ) sign = '+';
            this._div.innerHTML = this._div.innerHTML + `<br/> ${sign}${addThousandComma(values[1].value)} ${values[1].metric}`;

            if (values[2].value > 0 ) sign = '+';
            else sign = '';
            this._div.innerHTML = this._div.innerHTML + `<br/> ${sign}${addThousandComma(values[2].value)} ${values[2].metric}`;

            break;

          default:
            // this._div.innerHTML = `<h4> ${title} </h4>
            //             <b> ${name} </b><br /> ${value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")} ${metric}`
            // if (extraValues) {
            //   for (let x of extraValues) {
            //     this._div.innerHTML =
            //       this._div.innerHTML + `<br /> ${x.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")}${x.value} ${x.metric}`
            //   }
            // }
            break;
        }

        
      } else {
        this._div.innerHTML = `<h4> ${title} </h4> <b> ${placeholder} </b>`
      }
    }

    if (this.$parent._isMounted) {
      this.deferredMountedTo(this.$parent.mapObject)
    }
  },
  methods: {
    deferredMountedTo(parent) {
      this.parent = parent
      this.mapObject.addTo(parent)
    }
  },
  watch: {
    item: function(newValue) {
      this.mapObject.update({
        ...newValue,
        title: this.title,
        placeholder: this.placeholder,
        type: this.type
      })
    }
  },
  beforeDestroy() {
    if (this.parent) {
      this.parent.removeLayer(this.mapObject)
    }
    this.mapObject.remove();
  }
}
</script>
<style>
.info {
  padding: 6px 8px;
  font: 18px/20px sans-serif;
  background: white;
  background: rgba(255, 255, 255, 0.8);
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
  border-radius: 5px;
}

.info h4 {
  margin: 0 0 5px;
  color: #777;
}
</style>
