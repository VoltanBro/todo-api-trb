RSpec.describe Api::V1::Task::Operation::Show do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }

  context 'when user tries to get his task' do
    let(:params) { { id: task.id, project_id: project.id } }

    it 'returns user`s task' do
      expect(result[:model]).to eq(task)
      expect(result).to be_success
    end
  end

  context 'when user tries to get foreign task' do
    let(:project) { create(:project) }
    let(:task) { create(:task) }
    let(:params) { { id: task.id, project_id: project.id } }

    it 'returns user`s task' do
      expect(result).to be_failure
    end
  end
end
