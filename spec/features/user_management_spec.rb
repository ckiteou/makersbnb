feature 'User sign up' do
  scenario 'can sign up as a new user' do
    expect { sign_up }.to change(User, :count)
    expect(page).to have_content('Hello, Coasters')
    expect(User.first.email).to eq('coasters@kiteou.com')
  end
end
