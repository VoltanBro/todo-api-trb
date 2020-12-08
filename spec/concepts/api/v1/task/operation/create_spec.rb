RSpec.describe Api::V1::Task::Operation::Create do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:params) { { project_id: project.id }.merge(attributes_for(:task)) }

  context 'when params is valid' do
    it 'create new project`s task' do
      expect { result }.to change(Task, :count).by(1)
      expect(result).to be_success
    end
  end

  context 'when params is invalid' do
    let(:params) { { project_id: project.id }.merge(attributes_for(:task, name: '')) }

    it 'create new project`s task' do
      expect { result }.not_to change(Task, :count)
      expect(result).to be_failure
    end
  end
end
