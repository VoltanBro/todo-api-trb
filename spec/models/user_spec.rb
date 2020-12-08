RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end
end
