class CreateDummyModels < ActiveRecord::Migration
  def change
    create_table :dummy_models do |t|
      t.datetime :time
      t.date :date
      t.boolean :boolean

      t.timestamps
    end
  end
end
