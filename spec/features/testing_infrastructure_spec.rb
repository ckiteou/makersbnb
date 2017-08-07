feature 'Testing infrastructure' do

  scenario 'can run app' do
    visit('/')
    expect(page).to have_content 'infrastructure working'
    expect(page.status_code).to eq 200
  end
end
