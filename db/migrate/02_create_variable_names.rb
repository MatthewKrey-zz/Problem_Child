class CreateVariableNames < ActiveRecord::Migration
  def change
    create_table :variable_names do |t|
      t.string :name
    end
  end
end
