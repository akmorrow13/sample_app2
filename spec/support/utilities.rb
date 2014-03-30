include ApplicationHelper
def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end


def valid_example_signin(user)
  fill_in "Name",         with: user
  fill_in "Email",        with: "user@example.com"
  fill_in "Password",     with: "foobar"
  fill_in "Confirmation", with: "foobar"
end

RSpec::Matchers.define :have_page_items do |ctext|
  match do |page|
    expect(page).to have_content(ctext)
    expect(page).to have_title(full_title(ctext))
  end
end

RSpec::Matchers.define :have_signout do |link|
  match do |page|
    expect(page).to have_link(link)
  end
end


RSpec::Matchers.define :have_successful_login do |user|
  match do |page|
     expect(page).to have_title(user.name) 
     expect(page).to have_link('Profile',     href: user_path(user))
     expect(page).to have_link('Sign out',    href: signout_path) 
  end
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text: message)
  end
end
