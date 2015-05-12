<style lang="stylus">

.rotate-90
	transform rotate(90deg)

.bottom-44
	margin-bottom 44px

.image-row
	height: 196px

</style>



<template>

	<div class="row image-row">
		<div class="col offset-s5 s2">
			<img
				v-if="found"
				class="responsive-img circle"
				v-attr="src : user.avatar_url"
				alt="Avatar"
			>
		</div>
	</div>


	<div class="row">
		<div class="col offset-s3 s6 input-field">
			<input id="username" type="text" v-model="userField" lazy>
			<label for="username" class="active indigo-text text-darken-3">Username</label>
		</div>
	</div>

	<div class="row">
		<div class="col offset-s3 s6 right-align">
			<a href="{{user.html_url}}">
				@{{user.login}}
			</a>
		</div>
	</div>

	<div class="row">
		<div
			v-if="!found && initialized"
			class="col offset-s3 s6 card-panel red white-text flow-text"
		>
			Not Found
		</div>
	</div>


	<div class="row">
		<div class="col offset-s3 s6">
			<div class="collection">
				<a
					v-repeat="repo : repos"
					class="collection-item indigo-text text-darken-3"
					href="{{repo.html_url}}"
				>
					{{repo.name}}
				</a>
			</div>
		</div>
	</div>





</template>

<script lang="coffee">
store = require "./../store"


module.exports =

	data: ->
		user:
			name: "Anonymous"
			avatar_url: "none"
		repos: []
		userField: ""
		found: false
		initialized: false


	watch:
		userField: ->
			@initialized = true
			@getInfos()


	methods:
		getInfos: ->
			store.getUserInfos(@userField)
				.fail =>
					@found = false
				.then (infos) =>
					@found = true
					@user = infos
					@getRepos()

		getRepos: ->
			store.getReposList(@userField).then (list) =>
				@repos = list.sort (a, b) ->
					Date.parse(b.updated_at) - Date.parse(a.updated_at)


	created: ->
</script>
