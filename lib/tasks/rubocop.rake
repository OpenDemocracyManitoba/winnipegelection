namespace :rubocop do
  desc "Runs the Rubocop static code analyzer."
  task :all do
    sh "rubocop -R -c config/rubocop.yml"
  end
end
