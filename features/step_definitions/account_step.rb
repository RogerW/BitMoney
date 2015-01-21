def create_user_by_email_and_password_and_role(email, pass, role)
    user ||= User.where( :email => email ).first
    user.destroy unless user.nil?
    FactoryGirl.create(:user, {email: email, password: pass, role: role,  confirmed_at: Time.now })
end

def sign_in_by_email(email)
    visit '/users/sign_out'
    visit '/users/sign_in'
    fill_in "Email", :with => email
    fill_in "Password", :with => '12345678'
    click_button I18n.t(:sign_in_button_text)
end

def create_account(name)
    visit 'accounts/new'
    fill_in 'Title', :with => name
    fill_in 'Description', :with => 'test'
    click_button "Submit"
end


Допустим(/^созданы пользователи$/) do |table|
    table.hashes.each do |row|
        create_user_by_email_and_password_and_role(row['email'], row['password'], row['role'])
    end
end

Допустим(/^пользователь ([\d\w\.@]+) авторизован в системе$/) do |email|
    sign_in_by_email(email)
end

Допустим(/^создает себе счет с именем (\w+)$/) do |title|
    create_account(title)
end

Тогда(/^видит сообщение об успешном создании счета$/) do
  pending # express the regexp above with the code you wish you had
end
