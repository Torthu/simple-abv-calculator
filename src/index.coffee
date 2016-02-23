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

updateABV()

ogElement.addEventListener 'change', updateABV, false
fgElement.addEventListener 'change', updateABV, false
document.addEventListener 'keyup', updateABV, false