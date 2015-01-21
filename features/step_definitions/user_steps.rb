def create_visitor
  @visitor ||= { :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme", :confirmed_at => Time.now }
end

def find_user
  @user ||= User.where(:email => @visitor[:email]).first
end

def create_unconfirmed_user
  create_visitor
  delete_user
  sign_up
  visit '/users/sign_out'
end

def create_user
  create_visitor
  delete_user
  @user = FactoryGirl.create(:user, {email: @visitor[:email], password: @visitor[:password],  confirmed_at: @visitor[:confirmed_at]})
end

def delete_user
  @user ||= User.where( :email => @visitor[:email]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "Email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  find_user
end

def press_sign_up_button
  click_button "Sign up"
end

def sign_in
  visit '/users/sign_in'
  fill_in "Email", :with => @visitor[:email]
  fill_in "Password", :with => @visitor[:password]
  click_button I18n.t(:sign_in_button_text)
end


Допустим(/^пользователь не зарегистрирован$/) do
  create_visitor
end

Допустим(/^вводит корректные регистрационные данные$/) do
  sign_up
end

Если(/^нажимает кнопку Регистрации$/) do
  press_sign_up_button
end

То(/^видит сообщение об успешной регистрации$/) do
  expect(page).to have_content "A message with a confirmation link has been sent to your email address."
end

Допустим(/^вводит регистрационными данными, но вводит неверный email$/) do
  @visitor[:email] = 's@sss'
  sign_up
end

Допустим(/^вводит регистрационными данными, но не вводит подтверждение пароля$/) do
  @visitor[:password_confirmation] = ''
  sign_up
end

То(/^видит сообщение о не верном email$/) do
  expect(page).to have_content "Sign up 1 error prohibited this user from being saved: Email is invalid"
end

Допустим(/^пользователь уже есть в системе$/) do
  create_user
end

То(/^видит сообщение о том, что пользователь уже существует\.$/) do
  expect(page).not_to have_content "A message with a confirmation link has been sent to your email address."
end

То(/^видит сообщение о том, что пароли не совпадают$/) do
  expect(page).to have_content "Sign up 1 error prohibited this user from being saved: Password confirmation doesn't match"
end

Допустим(/^пользователь зарегистрирован в системе$/) do
  create_user
end

Допустим(/^вводит правильные учетные данные$/) do
  create_visitor
  sign_in 
end

Тогда(/^видидит сообщение об успешном входе в систему$/) do
  expect(page).to have_content "Signed in successfully"
end

Допустим(/^вводит неверные ученые данные$/) do
  create_visitor
  @visitor[:password] = "12344"
  sign_in 
end

Тогда(/^видит сообщение об ошибке входа$/) do
  expect(page).to have_content "Invalid email or password"
end