require 'spec_helper'

describe "Vacancies" do
  before(:each) { visit vacancies_path }
  it "works!" do
    page.should have_content('Vacancies')
  end

  it "have button New" do
    click_on('New')
  end

  it "allow to create new" do
    click_on('New')
    fill_in('Name', with: 'Супер вакансия')
    select('2013', from: "vacancy_upto_1i")
    select('December', from: "vacancy_upto_2i")
    select('10', from: "vacancy_upto_3i")
    fill_in('Salary', with: '100000')
    fill_in('Contacts', with: 'email@email.com')
    fill_in('skills_names', with: 'all')
    click_on('Create Vacancy')
    page.should have_content('Супер вакансия')
  end

end