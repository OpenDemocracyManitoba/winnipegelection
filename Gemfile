source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '~> 4.1.0'
# Locked sprockets to set version because asset_path helper was throwing an error.
gem 'sprockets-rails', '2.1.3'
gem 'pg', '~> 0.17.1'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails', '~> 3.1.0'
# gem 'turbolinks', '~> 2.3.0' Removed while static caching site.
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',         group: :doc

gem 'spring', '~> 1.1.2',       group: :development

# Our WinnipegElection specific gems:

gem 'activeadmin', github: 'activeadmin'
gem 'devise', '~> 3.3.0'
gem 'kaminari'

gem 'sass-rails', '~> 4.0.3'
gem 'slim-rails', '~> 2.1.5'
gem 'tilt', '~> 1.4.1' # Old version of tilt used due to sass and slim dependency error
gem 'redcarpet', '~> 3.1.2'
gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 3.8.1'
gem 'validate_url', '~> 0.2.2'
gem 'nokogiri', '~> 1.6.3'
gem 'feed-normalizer', '~> 1.5.2'
gem 'sitemap_generator', '~> 5.0.5'
gem 'actionpack-page_caching'

group :development, :test do
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec', '>= 3.1.0'
  gem 'rspec-collection_matchers', '~> 1.0.0'
  gem 'guard-rspec', '~> 4.3.1'
  gem 'capybara', '~> 2.4.3'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'railroady'
  gem 'rubocop', github: 'bbatsov/rubocop', branch: 'master'
  gem 'guard-rubocop'
  gem 'timecop'
end
