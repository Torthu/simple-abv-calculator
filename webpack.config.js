module.exports = {
	entry: './src/index.coffee',
	output: {
		filename: 'build/bundle.js'
	},
	module: {
		loaders: [
			{ test: /\.coffee$/, loader: "coffee" }
		]
	},
	resolve: {
		extensions: ["", ".coffee", ".js"]
	}
};