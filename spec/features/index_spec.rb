require 'feature_spec_helper'

describe 'index', type: :feature do
  before do
    visit 'en/'
  end

  it 'has the correct title header' do
    expect(page).to have_selector 'h1'
    within 'h1' do
      expect(page).to have_content(/Free Fest Total/i)
    end
  end

  it 'has a bootstrap table for schedule' do
    expect(page).to have_selector 'div.col-12.text-center'
  end

  it 'renders the home section' do
    expect(page).to have_content(/My friend Mező/i)
  end
end
