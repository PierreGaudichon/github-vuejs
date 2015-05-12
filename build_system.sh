mkdir -p build
mkdir -p build/css

node_modules/.bin/browserify \
	-t vueify \
	-t coffeeify \
		--extension=".coffee" \
	-e src/index.coffee \
	-o build/app.js

cp src/index.html build/
# cp -r src/db build
cp node_modules/materialize-css/bin/materialize.css build/css/
cp -r node_modules/materialize-css/font build/
