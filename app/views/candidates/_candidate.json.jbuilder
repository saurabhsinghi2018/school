json.extract! candidate, :id, :section, :candidatename, :education, :passportsizephoto, :fathername, :mothername, :contactaddress, :fathercontactnumber, :mothercontactnumber, :previousgrademarksheet, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)
