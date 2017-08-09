feature 'User sign up' do
  scenario 'can sign up as a new user' do
    expect { sign_up }.to change(User, :count)
    expect(page).to have_content('Hello, Coasters')
    expect(User.first.email).to eq('coasters@kiteou.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content 'Password and confirmation password do not match!'
  end
end
