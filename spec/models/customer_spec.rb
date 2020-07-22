# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Signin of Customer', type: :model do
  it 'responds successfully' do
    visit customers_path
    expect(page).to have_css('h1', text: 'お客様情報登録ページ')
  end
end
