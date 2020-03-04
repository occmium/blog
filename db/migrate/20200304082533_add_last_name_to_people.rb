# frozen_string_literal: true

class AddLastNameToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :last_name, :string
  end
end
