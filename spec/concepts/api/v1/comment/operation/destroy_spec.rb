RSpec.describe Api::V1::Comment::Operation::Destroy do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let(:task) { create(:task, project: project) }
  let!(:comment) { create(:comment, task: task) }

  context 'when user destroys comment' do
    let(:params) { { task_id: task.id, id: comment.id } }

    it { expect(result).to be_success }
    it { expect { result }.to change(Comment, :count).from(1).to(0) }
  end

  context 'when user destroys foreign comment' do
    let(:task) { create(:task) }
    let(:params) { { task_id: task.id, id: comment.id } }

    it { expect(result).to be_failure }
    it { expect { result }.not_to change(Comment, :count) }
  end
end
