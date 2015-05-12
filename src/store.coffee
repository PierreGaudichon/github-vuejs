reqwest = require "reqwest" # 600 cloc



module.exports =

	get: (url) ->
		reqwest
			url: url
			type: "json"
			contentType: "application/json"
			method: "get"


	getUserInfos: (user) ->
		@get "./db/github-pierregaudichon.json"
		# @get "https://api.github.com/users/#{user}"


	getReposList: (user) ->
		@get "./db/github-pierregaudichon-repos.json"
		# @get "https://api.github.com/users/#{user}/repos"
