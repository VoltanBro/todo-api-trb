RSpec.describe Task, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:project) }
  end
end
