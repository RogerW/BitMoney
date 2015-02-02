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
    fill_in I18n.t('simple_form.labels.account.title') , :with => name
    fill_in 'Description', :with => 'test'
    click_button "Submit"
end

def create_account_by_email_and_title(email, title)
    user ||= User.where( :email => email ).first
    FactoryGirl.create(:account, { user_id: user.id, title: title })
end

def create_account_by_email_and_title_and_balance(email, title, balance)
    user ||= User.where( :email => email ).first
    FactoryGirl.create(:account, { user_id: user.id, title: title, balance: balance })
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
    expect(page).to have_content "Account was created successful"
end

Допустим(/^созданы счета$/) do |table|
    table.hashes.each do |row|
        create_account_by_email_and_title(row[:email], row[:title])
    end
end

Допустим(/^созданы счета c балансом$/) do |table|
    table.hashes.each do |row|
        create_account_by_email_and_title_and_balance(row[:email], row[:title], row[:balance])
    end
end

Допустим(/^пользователь ([\d\w\.@]+) хочет получить доступ к счету ([\w\d\.']+)$/) do |email, title|
    sign_in_by_email(email)
    account ||= Account.where( :title => title ).first
    visit "/accounts/#{account.id}"
end

То(/^видит сообщение ([\d\w\.@'\s]+)$/) do |message|
    expect(page).to have_content message
end

Допустим(/^пользователь ([\d\w\.@]+) хочет переименовать счет ([\d\w\.@]+)$/) do |email, title|
    sign_in_by_email(email)
    account ||= Account.where( :title => title ).first
    visit "/accounts/#{account.id}/edit"
    
    begin
        fill_in I18n.t('simple_form.labels.account.title') , :with => name
        fill_in I18n.t('simple_form.labels.account.description'), :with => 'test_edited'
        click_button "Submit"
    rescue Capybara::ElementNotFound
        true
    end
end

Допустим(/^пользователь ([\d\w\.@]+) хочет внести на счет ([\d\w\.@]+) ([\d\.]+) рублей$/) do |email, title, amount|
    sign_in_by_email(email)
    account ||= Account.where( :title => title ).first
    visit "/accounts/#{account.id}"
    
    fill_in "Amount Fu" , :with => amount
    click_button "Add Fund"

end

Допустим(/^пользователь ([\d\w\.@]+) хочет перенести с счета ([\d\w]+) на счет ([\d\w]+) ([\d\.]+) рублей$/) do |email, title_source, title_destination, amount|
  sign_in_by_email(email)
  account_source ||= Account.where( :title => title_source ).first
  account_destination ||= Account.where( :title => title_destination ).first
  
  visit "/accounts/#{account_source.id}"
  fill_in "Transfer Amount" , :with => amount
  select(title_destination, :from => 'account_transfer[destination_id]')
  click_button "Transfer"
end

Допустим(/^пользователь вносит расход ([\d\w\.:;]+) на счет ([\d\w\.@]+)$/) do |basket, title|
  
end

То(/^видит остаток ([\d\.]+)$/) do |balance|
  expect(page).to have_content "Balance: #{balance}"
end
