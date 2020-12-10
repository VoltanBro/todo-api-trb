RSpec.describe Api::V1::CommentsController, type: :request do
  let(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user: user) }
  let(:session) { JWTSessions::Session.new(payload: { user_id: user.id }) }
  let(:tasks) { create_list(:task, 3, project: projects.first) }
  let!(:comment) { create(:comment, task: tasks.first) }

  describe 'POST #create' do
    let!(:comment) { attributes_for(:comment) }

    it 'create new project' do
      post api_v1_project_task_comments_path(projects.first.id, tasks.first.id), headers: session.login, params: comment
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('comment')
    end
  end

  describe 'GET #show' do
    it 'show comment' do
      get api_v1_project_task_comment_path(projects.first.id, tasks.first.id, comment.id), headers: session.login
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('comment')
    end

    it 'does not show comment' do
      get api_v1_project_task_comment_path(projects.first.id, tasks.first.id, comment.id + 1), headers: session.login
      expect(response.status).to eq(404)
      expect(response).to match_json_schema('error')
    end
  end

  describe 'POST #destroy' do
    it 'delete comment' do
      delete api_v1_project_task_comment_path(projects.first.id, tasks.first.id, comment.id), headers: session.login
      expect(response.status).to eq(200)
    end
  end
end
