json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :name, :upto, :salary, :contacts
  json.url vacancy_url(vacancy, format: :json)
end
