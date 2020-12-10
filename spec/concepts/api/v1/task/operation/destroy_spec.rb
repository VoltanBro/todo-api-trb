RSpec.describe Api::V1::Task::Operation::Destroy do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project) }

  context 'when user destroys his task' do
    let(:params) { { project_id: project.id, id: task.id } }

    it { expect { result }.to change(Task, :count).from(1).to(0) }
    it { expect(result).to be_success }
  end

  context 'when user destroys foreign task' do
    let(:project) { create(:project) }
    let(:params) { { project_id: project.id, id: task.id } }

    it { expect { result }.not_to change(Task, :count) }
    it { expect(result).to be_failure }
  end
end
