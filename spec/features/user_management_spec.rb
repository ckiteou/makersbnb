feature 'Host sign up' do
  scenario 'A potential host can sign up as a new user' do
    expect { sign_up_host }.to change(Host, :count)
    expect(page).to have_content('Hello, Coasters')
    expect(Host.first.email).to eq('coasters@kiteou.com')
  end
end
