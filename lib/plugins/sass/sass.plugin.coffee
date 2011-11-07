# Requires
DocpadPlugin = require "#{__dirname}/../../plugin.coffee"
sass = require 'sass'

# Define Plugin
class SassPlugin extends DocpadPlugin
	# Plugin name
	name: 'sass'

	# Plugin priority
	priority: 725

	# Render some content
	render: ({inExtension,outExtension,templateData,file}, next) ->
		try
			if inExtension in ['sass','scss'] and outExtension is 'css'
				file.content = sass.render file.content, filename: file.fullPath
				next()
			else
				next()
		catch err
			return next err

# Export Plugin
module.exports = SassPlugin