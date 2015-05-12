Vue = require "vue" # 8.5k cloc
{Router} = require "director" # 1k cloc

app = new Vue require "./vues/app.vue"
router = new Router

app.$mount "#app"
