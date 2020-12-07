RSpec.describe Api::V1::Project::Operation::Create do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:params) { attributes_for(:project) }

  context 'when params is valid' do
    it 'create new user`s project' do
      expect { result }.to change(Project, :count).by(1)
      expect(result).to be_success
    end
  end

  context 'when params is invalid' do
    let(:params) { attributes_for(:project, title: '') }

    it 'does not create new user`s project' do
      expect { result }.not_to change(Project, :count)
      expect(result).not_to be_success
    end
  end
end
