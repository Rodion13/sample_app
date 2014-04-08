require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit root_path }
    it "should have the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'Home'" do
      expect(page).to have_title("CS 232 Rails Development | Home")

      it "should not have a custom page title" do
        expect(page).not_to have_title('| Home')
      end
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title("CS 232 Rails Development | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title("CS 232 Rails Development | About Us")
    end
  end

  describe "Contact Page" do

    it "should have the content 'Contact Page'" do
      visit contact_path
      expect(page).to have_content('CS 232 Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title("CS 232 Rails Development | Contact")
    end

    it "should contain <h1 class=\"page-title\"> element" do
      visit contact_path
      expect(page).to have_css("h1.page-title")
    end

    it "should contain a definition list element" do
      visit contact_path
      expect(page).to have_css("dl")
    end

    it "should contain an HTML element <dt> element" do
      visit contact_path
      expect(page).to have_css("dt")
    end

    it "should contain an HTML element <dd> element" do
      visit contact_path
      expect(page).to have_css("dd")
    end

    it "should contain <section class=\"main\"> element" do
      visit contact_path
      expect(page).to have_css("section.main")
    end

    it "css should contain h1.page-title selector" do
      visit contact_path
      expect(page).to have_selector('h1.page-title')
    end

    it "css should contain .main selector" do
      visit contact_path
      page.should have_selector('.main')
    end


  end
end
