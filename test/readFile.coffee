swedn = require "../src/swedn"

for file in ["example", "readme-example"]
	example = swedn.readFileSync "./#{file}.swedn"
	console.log JSON.stringify (swedn.toJS example), null, 4
