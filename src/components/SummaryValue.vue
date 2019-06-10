<template>
    <div>
        <strong>{{name}}  </strong>
        <span class="value">{{value}}</span>
    </div>
</template>

<script>
    export default {
        props: {
            name: String,
            value: String
        }
    }
</script>

<style scoped>
.value {
    color: #4a5960;
}
</style>