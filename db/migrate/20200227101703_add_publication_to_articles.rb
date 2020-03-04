# frozen_string_literal: true

class AddPublicationToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :publication, :boolean, default: false
  end
end
