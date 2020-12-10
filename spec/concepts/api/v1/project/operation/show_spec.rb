RSpec.describe Api::V1::Project::Operation::Show do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  context 'when user show own project' do
    let(:params) { { id: project.id } }

    it 'returns user`s project' do
      expect(result[:model]).to eq(project)
      expect(result).to be_success
    end
  end

  context 'when user try to get foreign project' do
    let(:project) { create(:project) }
    let(:params) { { id: project.id } }

    it 'returns user`s project' do
      expect(result[:model]).to be_nil
      expect(result).to be_failure
    end
  end
end
