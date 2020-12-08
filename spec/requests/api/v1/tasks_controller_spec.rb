RSpec.describe Api::V1::TasksController, type: :request do
  let(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user: user) }
  let(:payload) { { user_id: user.id } }
  let(:session) { JWTSessions::Session.new(payload: payload) }
  let!(:tasks) { create_list(:task, 3, project: projects.first, user: user) }

  describe 'GET #create' do
    let(:task) { attributes_for(:task) }

    it 'create new project' do
      post api_v1_project_tasks_path(projects.first.id), headers: session.login, params: task
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('task')
    end
  end

  describe 'GET #index' do
    it 'return project`s tasks' do
      get api_v1_project_tasks_path(projects.first.id), headers: session.login
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('tasks')
    end
  end

  describe 'GET #show' do
    it 'show project`s tasks' do
      get api_v1_project_task_path(projects.first.id, tasks.first.id), headers: session.login
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('task')
    end
  end

  describe 'GET #update' do
    let(:params) { { name: 'New task name' } }

    it 'update project`s task' do
      put api_v1_project_task_path(projects.first.id, tasks.first.id), headers: session.login, params: params
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('task')
    end
  end

  describe 'GET #destroy' do
    it 'delete task' do
      delete api_v1_project_task_path(projects.first.id, tasks.first.id), headers: session.login
      expect(response.status).to eq(200)
    end
  end
end
