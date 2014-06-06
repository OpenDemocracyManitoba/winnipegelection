require 'spec_helper'

shared_examples_for FriendlyURL do
  context 'class methods' do
    it 'can find an object by id and slug' do
      object = described_class.friendly_find(id: object_of_described_class,
                                             slug: 'test-slug')
      expect(object).to be_a described_class
    end

    it 'raises an error when finding an object when slug is incorrect' do
      expect {
        described_class.friendly_find(id: object_of_described_class.id,
                                      slug: 'wrong-slug')
      }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'raises an error when finding an object when slug is missing' do
      expect {
        described_class.friendly_find(id: object_of_described_class.id)
      }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
