feature 'User sign up' do
  scenario 'can sign up as a new user' do
    expect { sign_up }.to change(User, :count)
    expect(page).to have_content('Hello, Coasters')
    expect(User.first.email).to eq('coasters@kiteou.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'user cant sign up without and email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'email address must be in valid format' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with and existing email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

feature 'User log in' do
  let!(:user) do
    User.create(first_name: 'Fred',
                last_name: 'Bloggs',
                email: 'user@example.com',
                password: 'secret1234',
                password_confirmation: 'secret1234')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Hello, #{user.first_name}"
  end

  def sign_in(email:, password:)
    visit '/users/login'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end
end
