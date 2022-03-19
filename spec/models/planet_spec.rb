require 'rails_helper'

RSpec.describe Planet, type: :model do
  subject(:planet) { build :planet }

  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
