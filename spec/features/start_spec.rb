require 'spec_helper'


describe "Site root" do
  describe "GET /start" do
    let(:vacancies) { I18n.t('menu.vacancies', default: 'Vacancies') }
    let(:applicants) { I18n.t('menu.applicants', default: 'Applicants') }
    before(:each) { visit root_path }

    it "works!" do
      page.should have_content(vacancies)
      page.should have_content(applicants)
    end

    it "link_to vacancies is work" do
      click_on(vacancies)
    end

    it "link_to applicants is work" do
      click_on(applicants)
    end
  end
end