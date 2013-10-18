require 'spec_helper'

describe "Applicants" do
  before(:each) { visit applicants_path }
  it "works!" do
    page.should have_content('Applicants')
  end

  it "have button New" do
    click_on('New')
  end

  it "allow to create new" do
    click_on('New')
    check('Looking for job?')
    fill_in('Name', with: 'Иванов Иван Иванович')
    fill_in('Salary', with: '100000')
    fill_in('Contacts', with: 'email@email.com')
    fill_in('skills_names', with: 'all')
    click_on('Create Applicant')
    page.should have_content('Иванов Иван Иванович')
  end

end