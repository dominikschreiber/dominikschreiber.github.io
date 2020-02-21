clean:
	cp src.html index.html

replace-css:
	perl -pe 's!<link rel="stylesheet" href="mustardseed/styles/([^\.]+)\.css">!<style>/* mustardseed/styles/$$1.css */</style>!' index.html > tmp.html
	perl -pe 's!/\* mustardseed/styles/([^\.]+)\.css \*/!`cat mustardseed/styles/$$1.css`!e' tmp.html > index.html
	rm tmp.html

replace-js:
	perl -pe 's!<script src="mustardseed/scripts/([^\.]+)\.js"></script>!<script>/* mustardseed/scripts/$$1.js */</script>!' index.html > tmp.html
	perl -pe 's!/\* mustardseed/scripts/([^\.]+)\.js \*/!`cat mustardseed/scripts/$$1.js`!e' tmp.html > index.html
	rm tmp.html

replace: replace-css replace-js

serve:
	python -m SimpleHTTPServer