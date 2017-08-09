def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :first_name,  with: 'Coasters'
  fill_in :last_name,   with: 'Kiteou'
  fill_in :email,       with: 'coasters@kiteou.com'
  fill_in :password,    with: 'percy1234'
  click_button 'Sign up'
end
