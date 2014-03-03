require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("CS 232 Rails Development | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("CS 232 Rails Development | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("CS 232 Rails Development | About Us")
    end
  end

  describe "Contact Page" do

    it "should have the content 'Contact Page'" do
      visit '/static_pages/contact'
      expect(page).to have_content('CS 232 Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title("CS 232 Rails Development | Contact")
    end

    it "should contain <h1 class=\"page-title\"> element" do
      visit '/static_pages/contact'
      expect(page).to have_css("h1.page-title")
    end

    it "should contain a definition list element" do
      visit '/static_pages/contact'
      expect(page).to have_css("dl")
    end

    it "should contain an HTML element <dt> element" do
      visit '/static_pages/contact'
      expect(page).to have_css("dt")
    end

    it "should contain an HTML element <dd> element" do
      visit '/static_pages/contact'
      expect(page).to have_css("dd")
    end

    it "should contain <section class=\"main\"> element" do
      visit '/static_pages/contact'
      expect(page).to have_css("section.main")
    end

    it "css should contain h1.page-title selector" do
      visit '/static_pages/contact'
      expect(page).to have_selector('h1.page-title')
    end

    it "css should contain .main selector" do
      visit '/static_pages/contact'
      expect(page).to have_selector('.main')
    end


  end
end
