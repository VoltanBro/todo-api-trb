RSpec.describe Api::V1::Comment::Operation::Create do
  subject(:result) { described_class.call(current_user: user, params: params) }

  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }
  let!(:task) { create(:task, project: project) }
  let(:params) { attributes_for(:comment).merge(task_id: task.id) }

  context 'when params is valid' do
    it 'create new comment' do
      expect { result }.to change(Comment, :count).by(1)
      expect(result).to be_success
    end
  end

  context 'when params is invalid' do
    let(:params) { attributes_for(:comment, body: '').merge(task_id: task.id) }

    it 'does not create new comment' do
      expect { result }.not_to change(Comment, :count)
      expect(result).to be_failure
    end
  end
end
