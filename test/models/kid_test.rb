require 'minitest_helper'

describe Kid do
  describe 'validations' do
    subject { Kid.new }

    it { must have_valid(:name).when("1234567890", "1") }
    it { wont have_valid(:name).when("12345678901", "", nil) }
  end
end
