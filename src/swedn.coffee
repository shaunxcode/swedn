jsedn = require "jsedn"

prelex = (string) ->
	result = ""
	lines = string.trim().split "\n"
	for line, i in lines
		continue if line[0] is ";"
		
		words = []
		token = ''
		for char, ci in line
			if char is '"' and not escaping?
				if in_string?
					words.push "\"#{in_string}\""
					in_string = undefined
				else
					in_string = ''
				continue

			if in_string?
				if char is '\\' and not escaping?
					escaping = true
					in_string += char 
					continue

				if escaping? 
					escaping = undefined

				in_string += char
			else if char is ";"
				if token.length
					words.push token 
				break
			else if char in " \t"
				if token.length
					words.push token
				token = ""
			else 
				token += char
		
		if token.length
			words.push token
		
		curIndent = line.replace /^([ \t]*).*$/, '$1'

		if not oldIndent
			oldIndent = curIndent
		
		if words.length is 1
			#we expect a nested hash
			indentRE = new RegExp '^' + curIndent.replace(/\t/g, '\\t') + '[ \t]'
			indentedLines = ""
			j = i + 1
			while j < lines.length and indentRE.test lines[j]
				indentedLines += "\n" + lines[j].replace indentRE, ""
				lines[j] = ""
				j++

			result += "#{words[0]} #{prelex indentedLines}\n"

		else if words.length is 2
			result += "#{words[0]} #{words[1]}\n"
		else if words.length > 1
			result += "#{words[0]} [#{words[1..-1].join " "}]\n"

	"{#{result}}"

ogparse = jsedn.parse
jsedn.parse = (string) -> ogparse prelex string
module.exports = jsedn 