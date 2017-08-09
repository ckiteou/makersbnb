feature 'Testing infrastructure' do

  scenario 'can run app' do
    visit('/')
    expect(page.status_code).to eq 200
  end
end
