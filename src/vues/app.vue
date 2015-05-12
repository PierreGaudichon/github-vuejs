
<style lang="stylus">


.top-bar
	height 10px


</style>



<template>

<div class="contener">
	<div class="top-bar row indigo darken-4"></div>
	<div v-component="user"></div>
</div>

</template>



<script lang="coffee">

module.exports =

	components:
		user: require "./user.vue"

</script>
