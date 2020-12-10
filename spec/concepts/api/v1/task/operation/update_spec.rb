RSpec.describe Api::V1::Task::Operation::Update do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let!(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }

  context 'when params is valid' do
    let(:params) { { project_id: project.id, id: task.id, name: 'New task name' } }

    it 'rename task' do
      expect(result).to be_success
      expect(result[:model].name).to eq(params[:name])
    end
  end

  context 'when params is invalid' do
    let(:params) { { project_id: project.id, id: task.id, name: '' } }

    it 'rename task' do
      expect(result).to be_failure
      expect(result[:model].name).not_to eq(params[:name])
    end
  end
end
