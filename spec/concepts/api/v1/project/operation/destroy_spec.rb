RSpec.describe Api::V1::Project::Operation::Destroy do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }

  context 'when user destroys his project' do
    let(:params) { { id: project.id } }

    it { expect { result }.to change(Project, :count).from(1).to(0) }
    it { expect(result).to be_success }
  end

  context 'when user wants to destroy foreign project' do
    let(:project) { create(:project) }
    let(:params) { { id: project.id } }

    it { expect { result }.not_to change(Project, :count) }
    it { expect(result).to be_failure }
  end
end
