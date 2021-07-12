require 'rails_helper'

RSpec.describe Visible, type: :helper do
  let(:user) { create :user }
  let(:article) { create :article, user: user }
  let(:validate) { Article::VALID_STATUSES }

  context 'test module' do
    it 'VALID_STATUSES' do
      expect(validate).to eq(["public", "private", "archived"])
    end

    it 'archived?' do
      expect(archived?).to eq(false)
      
    end
    
    it 'public_count' do
      expect(Article.public_count).to eq 0
    end

  end
end
