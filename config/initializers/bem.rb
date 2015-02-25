BEM.configure do |config|
  config.technologies = [
    { :group => 'stylesheets', :extension => '.css.scss', :name => 'scss',
      :css_directive => '@import', :css_prefix => "'", :css_postfix => "';" },
    { :group => 'javascripts', :extension => '.js.coffee', :name => 'coffee' }
  ]
end