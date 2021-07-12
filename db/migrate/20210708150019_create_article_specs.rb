class CreateArticleSpecs < ActiveRecord::Migration[6.1]
  def change
    create_table :article_specs do |t|
      t.string :name

      t.timestamps
    end
  end
end
