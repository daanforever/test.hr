json.array!(@applicants) do |applicant|
  json.extract! applicant, :name, :contacts, :status, :salary
  json.url applicant_url(applicant, format: :json)
end
