require 'rails_helper'

RSpec.describe 'Articlecontroller', type: :request do
  context 'test not authenticated' do
    let(:article) { Article.create(title: 'test', body: 'test', status: 'public', user_id: 100) }

    describe 'GET index' do
      subject { get articles_path }

      it { is_expected.to equal 200 }
      it { is_expected.not_to equal 401 }
      it { is_expected.to render_template 'index' }
    end

    describe 'GET show' do
      subject { get articles_path id: article.id }

      it { is_expected.to equal 200 }
      it { is_expected.not_to equal 401 }
      it { is_expected.to render_template 'index' }
    end
  end

  context 'test authentiacted' do
    let(:user) { create :user }
    let(:article) { create :article, user: user }
    before(:example) do
      get login_path, params: {
        email: user.email,
        password: user.password,
        previous_url: root_path
      }
    end
    describe 'GET new' do
      subject { get new_article_path }

      it { is_expected.to equal 200 }
      it { is_expected.to render_template 'new' }
    end

    describe 'GET create' do
      subject { post articles_path(article: article.instance_values) }

      it { is_expected.to equal 200 }
      it 'article not saved' do
        subject { post articles_path(article: { title: nil, body: nil }) }
        is_expected.to render_template 'new'
      end
    end

    describe 'GET update' do
      let(:article_updated) { build :article }
      subject do
        put article_path(article),
            params: { article: article_updated.instance_values }
      end

      it { is_expected.to equal 302 }
      it { is_expected.to redirect_to article_path(article) }
      it 'article not updated' do
        put article_path(article),
            params: { article: { title: nil, body: nil } }
        expect(response).to render_template 'edit'
      end
    end

    describe 'GET destroy' do
      subject { delete article_path(article) }

      it { is_expected.to eq 302 }
      it { is_expected.to redirect_to root_path }
    end
  end
end
