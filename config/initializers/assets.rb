# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( body.js home.js home.css )
Rails.application.config.assets.precompile += %w( templates/* )

Rails.application.assets.register_engine('.haml', Tilt::HamlTemplate)
# Rails.application.assets.register_engine('.scss', Sass::Template)

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
