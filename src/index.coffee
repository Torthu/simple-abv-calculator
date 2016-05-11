mbformulas = require 'microbrewit-formulas'

# Get elements
ogElement = document.getElementById 'og'
fgElement = document.getElementById 'fg'
resultElement = document.getElementById 'results'

updateABV = ->

	og = ogElement.value
	fg = fgElement.value

	htmlString = '<tr>
		<th>Formula</th>
		<th>Value</th>
	</tr>'

	for formula in mbformulas.abv.available()
		value = mbformulas.abv.calc og, fg, formula

		htmlString += "<tr>
			<td>#{formula}</td>
			<td>#{value.toFixed(2)}%</td>
		</tr>"

	resultElement.innerHTML = htmlString

	updateUrl og, fg

updateUrl = (og, fg) ->
	window.history.pushState {}, '', "?og=#{og}&fg=#{fg}"

# thune.io/abv?og=1070&fg=1006
readUrlParams = ->
	vars = {}
	window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, (m,key,value) -> vars[key] = value)

	if vars.og
		if vars.og > 1000
			vars.og = vars.og / 1000
		ogElement.value = vars.og

	if vars.fg
		if vars.fg > 1000
			vars.fg = vars.fg / 1000
		fgElement.value = vars.fg

readUrlParams()
updateABV()

ogElement.addEventListener 'change', updateABV, false
fgElement.addEventListener 'change', updateABV, false
document.addEventListener 'keyup', updateABV, false