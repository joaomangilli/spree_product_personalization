# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_personalization'
  s.version     = '3.0.0'
  s.summary     = 'Product Personalization'
  s.description = 'Allow adding personalization to product'
  s.required_ruby_version = '>= 2.1.1'

  s.author    = 'Irvin Fan'
  s.email     = 'ifan@godaddy.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.0'

  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'simplecov-rcov'
  s.add_development_dependency 'sqlite3', '~> 1.3.1'
  s.add_development_dependency 'yarjuf'
  s.add_development_dependency 'require_all'
end
