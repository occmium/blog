# frozen_string_literal: true

class AddAvatarToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :avatar, :string
  end
end
