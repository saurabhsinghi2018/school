class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :section
      t.string :candidatename
      t.string :education
      t.string :passportsizephoto
      t.string :fathername
      t.string :mothername
      t.string :contactaddress
      t.string :fathercontactnumber
      t.string :mothercontactnumber
      t.string :previousgrademarksheet

      t.timestamps
    end
  end
end
