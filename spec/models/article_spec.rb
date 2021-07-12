require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'Validate BD' do
    it { should have_db_column(:id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:body).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime).with_options(null: false) }
    it { should have_db_column(:updated_at).of_type(:datetime).with_options(null: false) }
  end

  describe 'associations' do
    it { should have_many(:comments).dependent(:destroy) }
    it { should belong_to(:user) }
  end

  describe 'model attributes' do
    it { should respond_to(:title) }
    it { should respond_to(:body) }

    it { is_expected.to validate_length_of(:body).is_at_least(10) }
    it { is_expected.to validate_inclusion_of(:status).in_array(Article::VALID_STATUSES) }
  end
end
