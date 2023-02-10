require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    # it { is_expected.to validate_presence_of(:name) }
    # it { is_expected.to validate_presence_of(:email) }
    # it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    # it { is_expected.to validate_presence_of(:password) }
    # it { is_expected.to validate_length_of(:password).is_at_least(3) }
    # it { is_expected.to validate_inclusion_of(:gender).in_array(User::VALID_GENDERS) }
    # it { is_expected.to validate_inclusion_of(:role).in_array(User::VALID_ROLES) }
    # it { should allow_value("test@gmail.com").for(:email)}

    it "requires a user" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end
  end
end


