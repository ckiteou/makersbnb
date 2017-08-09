feature 'User sign up' do
  scenario 'can sign up as a new user' do
    expect { sign_up }.to change(User, :count)
    expect(page).to have_content('Hello, Coasters')
    expect(User.first.email).to eq('coasters@kiteou.com')
  end
end

feature 'User log in' do
  let!(:user) do
    User.create(first_name: 'Fred',
                last_name: 'Bloggs',
                email: 'user@example.com',
                password: 'secret1234')
                # password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hello, #{user.first_name}"
  end

  def sign_in(email:, password:)
    visit '/users/login'
    fill_in :email, with: email
    fill_in :password, with: password
    # fill_in :password_confirmation, with password_confirmation
    click_button 'Log in'
  end
end
