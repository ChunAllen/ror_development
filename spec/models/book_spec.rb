require "rails_helper"

RSpec.describe Book, type: :model do 

  describe "validations" do
    it { should validate_presence_of(:title) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:author) }
  end

end