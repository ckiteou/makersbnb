def sign_up(first_name: 'Coasters',
            last_name: 'Kiteou',
            email: 'coasters@kiteou.com',
            password: 'percy1234',
            password_confirmation: 'percy1234')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :first_name,  with: first_name
  fill_in :last_name,   with: last_name
  fill_in :email,       with: email
  fill_in :password,    with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/users/login'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end

def create_listing(name: "Cong's Pad", description: "Cambridge bachelorette pad",price: 100)
  visit '/listings/new'
  fill_in :name, with: name
  fill_in :description, with: description
  fill_in :price, with: price
  click_button 'Create listing'
