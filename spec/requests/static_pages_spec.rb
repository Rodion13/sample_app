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

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "for signed-in users" do
        let(:user) { FactoryGirl.create(:user) }
        before do
          FactoryGirl.create(:micropost, user: user, content: "Lorem")
          FactoryGirl.create(:micropost, user: user, content: "Ipsum")
          sign_in user
          visit root_path
        end

        it "should render the user's feed" do
          user.feed.each do |item|
            expect(page).to have_selector("li##{item.id}", text: item.content)
          end
        end

        describe "follower/following counts" do
          let(:other_user) { FactoryGirl.create(:user) }
          before do
            other_user.follow!(user)
            visit root_path
          end

          it { should have_link("0 following", href: following_user_path(user)) }
          it { should have_link("1 followers", href: followers_user_path(user)) }
        end
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
