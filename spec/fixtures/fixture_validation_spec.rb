require 'spec_helper'

describe 'fixtures' do
  it 'should be valid' do
    ActiveRecord::FixtureSet.create_fixtures(fixture_path, all_fixture_tables)
    all_fixture_tables.each do |table_name|
      begin
        klass = table_name.to_s.classify.constantize

        klass.send(:all).each do |object|
          unless object.valid?
            puts "#{klass.name} #{object} is invalid: "\
                 "#{object.errors.full_messages.join(', ')}"
            puts(object.inspect)
          end
          expect(object).to be_valid
        end
      rescue NameError
        # Probably a has and belongs to many mapping table
        # with no ActiveRecord model
      end
    end
  end
end

def fixture_path
  Spec::Runner.configuration.fixture_path
end

def all_fixture_tables
  Dir[File.join(fixture_path, '*.yml')].map do |file|
    File.basename(file[/^(.+)\.[^.]+?$/, 1])
  end
end
