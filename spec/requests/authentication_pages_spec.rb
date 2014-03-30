require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }


 describe "signin" do
   before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_title('Sign in') }
      it { should have_error_message('Invalid') }

      describe "after visiting another page" do
        before { click_link "Home" }
        it { should_not have_error_message('Invalid') }
      end
    end

  describe "signin page" do
    before { visit signin_path }
    describe "with invalid information" do
      let(:user) { FactoryGirl.create(:user) }
       before { valid_signin(user) }
      
	describe "successful login" do
	  it {should have_successful_login(user) }
	  it {should_not have_link('Sign in', href: signin_path)} 

	end

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_signout('Sign in') }
      end
    end

  end
 end
end
