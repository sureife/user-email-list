require 'rails_helper'

describe User, 'validation' do
  it 'has a valid factory' do
    expect(create(:user)).to be_valid
  end

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it { expect(create(:user)).to validate_uniqueness_of(:email).ignoring_case_sensitivity }
end

describe User, 'methods' do
  describe '.customer?' do
    context "when is_admin is true" do
      let (:user) { build(:user, is_admin: true) }

      it 'returns false' do
        expect(user.customer?).to eq(false)
      end
    end

    context "when is_admin is false" do
      let (:user) { build(:user, is_admin: false) }

      it 'returns true' do
        expect(user.customer?).to eq(true)
      end
    end
  end

  describe '.admin?' do
    context "when is_admin is true" do
      let (:user) { build(:user, is_admin: true) }

      it 'returns true' do
        expect(user.admin?).to eq(true)
      end
    end

    context "when is_admin is false" do
      let (:user) { build(:user, is_admin: false) }

      it 'returns false' do
        expect(user.admin?).to eq(false)
      end
    end
  end

  describe 'email handling' do
    let(:email) { Faker::Internet.unique.email.downcase }
    let (:user) { build(:user, email: email) }

    context 'when email contains capital letters' do
      let (:user) { build(:user, email: email.upcase) }
      
      it 'converts to lowercase' do
        expect(user.email).to eq(email)
      end
    end

    context 'when email does not contain capital letters' do
      it 'does nothing' do
        expect(user.email).to eq(email)
      end
    end

    context 'when email is nil' do
      let(:email) { nil }
      it 'does nothing' do
        expect(user.email).to eq(nil)
      end
    end
  end

end

