require "rails_helper"

RSpec.describe Author, type: :model do

  describe "validations" do
    it { should validate_presence_of(:name) }

    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { is_expected.to have_many(:books).dependent(:restrict_with_error) }
  end

end