RSpec.describe Api::V1::Project::Operation::Index do
  subject(:result) { described_class.call(current_user: user) }

  let(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user: user) }

  context 'when user gets all projects' do
    it 'return all user`s projects' do
      expect(result[:projects].count).to eq(3)
      expect(result[:projects].ids).to eq(projects.pluck(:id))
    end
  end
end
