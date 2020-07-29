# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Customer, type: :model do
  # facrory botが存在するかのテスト
  it 'has a valid factory bot' do
    expect(build(:customer)).to be_valid
  end
  # バリデーションのテスト
  describe 'validations' do
    describe 'validate presence of password' do
      it 'is invalid with a blank password' do
        user = build(:user, password: ' ' * 6)
        expect(user).to_not be_valid
      end
    end
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_length_of(:name).is_at_most(50) }
    it { is_expected.to validate_length_of(:email).is_at_most(255) }
    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it do
      is_expected.to allow_values('user.example@example.jp',
                                  'user@example.com',
                                  'USER@example.com',
                                  'E_XA-MPLE@example.org',
                                  'exam+ple@ok.jp').for(:email)
    end
    it do
      is_expected.to_not allow_values('user.example@example,jp',
                                      'user_example.com',
                                      'user@example.',
                                      'user@aaa_aaa.com',
                                      'user@aaa+aaa.com').for(:email)
    end

    describe 'validate unqueness of email' do
      let!(:customer) { create(:customer, email: 'original@example.com') }
      it 'is invalid with a duplicate email' do
        customer = build(:customer, email: 'original@example.com')
        expect(customer).to_not be_valid
      end
      it 'is case insensitive in email' do
        customer = build(:customer, email: 'ORIGINAL@EXAMPLE.COM')
        expect(customer).to_not be_valid
      end
    end

    # before_saveのテスト
    describe 'before_save' do
      describe '#email_downcase' do
        let!(:user) { create(:user, email: 'ORIGINAL@EXAMPLE.COM') }
        it 'makes email to low case' do
          expect(user.reload.email).to eq 'original@example.com'
        end
      end
    end
  end
end
