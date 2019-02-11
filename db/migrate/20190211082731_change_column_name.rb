class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
     rename_column :candidates, :candidatename, :candidate_name
     rename_column :candidates, :passportsizephoto, :photo
     rename_column :candidates, :fathername, :father_name
     rename_column :candidates, :mothername, :mother_name
     rename_column :candidates, :contactaddress, :contact_address
     rename_column :candidates, :fathercontactnumber, :contact_father
     rename_column :candidates, :mothercontactnumber, :contact_mother
     rename_column :candidates, :previousgrademarksheet, :previous_grade_marksheet
     rename_column :candidates, :applicationstatus, :application_status
     rename_column :eligibilities, :dateofbirthtill, :date_of_birth_till
     rename_column :eligibilities, :dateason, :date_as_on
     rename_column :notices, :shortlisting, :title
     rename_column :notices, :interview, :details
  end
end
