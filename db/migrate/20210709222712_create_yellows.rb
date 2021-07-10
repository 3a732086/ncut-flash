class CreateYellows < ActiveRecord::Migration[5.2]
  def change
    create_table :yellows do |t|
      t.text :Verb
      t.text :Noun
      t.text :Adjective
      t.text :Adverb
      t.string :Count
      t.timestamps
    end
  end
end
