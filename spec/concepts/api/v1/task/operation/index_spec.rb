RSpec.describe Api::V1::Task::Operation::Index do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let!(:tasks) { create_list(:task, 3, project: project) }

  context 'when user gets his project`s tasks' do
    let(:params) { { project_id: project.id } }

    it 'returns project`s tasks' do
      expect(result[:tasks].count).to eq(3)
      expect(result[:tasks].ids).to eq(tasks.pluck(:id))
      expect(result[:tasks]).to eq(tasks)
      expect(result).to be_success
    end
  end

  context 'when user gets foreign project`s tasks' do
    let(:project) { create(:project) }
    let(:params) { { project_id: project.id } }

    it 'does not return project`s tasks' do
      expect(result[:tasks]).to be_nil
      expect(result).to be_failure
    end
  end
end
