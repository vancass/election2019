<template>
    <div/>
</template>
<script>
export default {
  props: {
    color1: String,
    color2: String,
    title1: String,
    title2: String,
    position: {
      type: String,
      default: "topright"
    }
  },
  mounted() {
    const { color1, color2, title1, title2, position } = this;
    // Put the object to the position
    // eslint-disable-next-line
    this.mapObject = L.control({
      position: position
    })

    this.mapObject.onAdd = function() {
      // eslint-disable-next-line
      this._div = L.DomUtil.create("div", "info"); // create a div with a class "info"
      this.update({color1, color2, title1, title2});
      return this._div
    }

    this.mapObject.update = function({color1, color2, title1, title2}) {
      
      // this._div.innerHTML = `<span>${title}</span><br>` + gradiente
      this._div.innerHTML = `<div><span class="block" style="background-color: ${color1}"></span><span>${title1}</span></div>`;

      if (color2 !== "") {
        this._div.innerHTML += `<div><span class="block" style="background-color: ${color2}"></span><span>${title2}</span></div>`;
      }
    }

    if (this.$parent._isMounted) {
      this.deferredMountedTo(this.$parent.mapObject);
    }
  },
  methods: {
    deferredMountedTo(parent) {
      this.parent = parent;
      this.mapObject.addTo(parent);
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
.info.legend span {
  display: block;
}

.block {
  width: 10px;
  height: 10px;
  display: inline-block;
  margin-right: 10px;
}

</style>
