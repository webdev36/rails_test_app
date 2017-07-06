require 'rails_helper.rb'

RSpec.feature 'Charge List' do
  scenario 'can see all charges list' do
    visit '/'

    expect(page).to have_selector('div.failed-charges', count: 1)
    expect(page).to have_selector('div.disputed-charges', count: 1)
    expect(page).to have_selector('div.succed-charges', count: 1)

    expect(page).to have_css 'div.failed-charges h1', text: 'Failed Charges'
    expect(page).to have_css 'div.disputed-charges h1', text: 'Disputed Charges'
    expect(page).to have_css 'div.succed-charges h1', text: 'Successful Charges'

    within('div.failed-charges') do
      expect( all('div.row').count ).to eq(2)
    end
    # expect(page).to have_xpath('//div[@class="failed-charges"]/div', count: 4)
    within("div.failed-charges") do
      find("div.transaction", 1).text.should match("Hugo")
    end

    failed_list = page.find(:css, 'div.failed-charges.transaction')
    p '--------'
    p failed_list.count

    page.has_css?('.disputed-charges .transaction', count: 8)
    page.has_css?('.succed-charges .transaction', count: 10)
    # page.assert_selector('.failed-charges .transaction', :count => 5)
    # expect(page).to have_css('.failed-charges .transaction', count: 5)
    # expect(page).to have_css('.disputed-charges .transaction', count: 5)
    # expect(page).to have_css('.succed-charges .transaction', count: 10)

  end
end
