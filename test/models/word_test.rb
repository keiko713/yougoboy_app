require 'minitest_helper'

describe Word do
  describe 'validations' do
    subject { Word.new }

    it { must have_valid(:name).when("Apple") }
    it { wont have_valid(:name).when("") }
    it { must have_valid(:level).when(1, 2, 3, 4, 5) }
    it { wont have_valid(:level).when(0, 6) }
    it { must have_valid(:group).when("Fruits", "Vegetables", "Colors") }
    it { wont have_valid(:group).when("Something") }
  end
end
