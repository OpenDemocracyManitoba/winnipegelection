namespace :json do
  desc "Export all data to JSON files"
  task :export => :environment do
    Rails.application.eager_load!

    ActiveRecord::Base.descendants.each do |model|
      file = File.open(File.join(Rails.root, "db", "export", "#{model.table_name}.json"), 'w')
      file.write model.all.to_json
      file.close
    end
  end

  desc "Import all data from JSON files"
  task :import => :environment do
    Dir["./db/export/*.json"].each do |file|

      table_name = file.split('/').last.split('.').first
      class_type = table_name.classify.constantize
      models = JSON.parse(File.read(file))
      models.each do |model|
        model_var = class_type.new(model)
        model_var.save
      end
      ActiveRecord::Base.connection.reset_pk_sequence!(table_name)
    end
  end

end
