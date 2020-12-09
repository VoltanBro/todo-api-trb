RSpec.describe User, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
    it { is_expected.to have_many(:tasks).through(:projects) }
    it { is_expected.to have_many(:comments).through(:tasks) }
  end
end
