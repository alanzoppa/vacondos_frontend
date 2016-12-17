Rails.application.config.browserify_rails.commandline_options = "-t [ babelify --presets es2015,react --extensions .jsx ]"
Rails.application.config.assets.precompile += %w( application.js )
