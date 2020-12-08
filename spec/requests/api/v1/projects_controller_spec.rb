RSpec.describe Api::V1::ProjectsController, type: :request do
  let(:user) { create(:user) }
  let!(:projects) { create_list(:project, 3, user: user) }
  let(:payload) { { user_id: user.id } }
  let(:session) { JWTSessions::Session.new(payload: payload) }

  describe 'GET #create' do
    let(:project) { attributes_for(:project) }

    it 'create new project' do
      post api_v1_projects_path, headers: session.login, params: project
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('project')
    end
  end

  describe 'GET #index' do
    it 'return user`s projects' do
      get api_v1_projects_path, headers: session.login
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('projects')
      expect(JSON.parse(response.body)['data'].size).to eq(projects.count)
    end
  end

  describe 'GET #show' do
    it 'show user`s project' do
      get api_v1_project_path(projects.first.id), headers: session.login
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('project')
    end
  end

  describe 'GET #update' do
    let(:params) { { title: 'New project name' } }

    it 'update user`s project' do
      put api_v1_project_path(projects.first.id), headers: session.login, params: params
      expect(response.status).to eq(200)
      expect(response).to match_json_schema('project')
    end
  end

  describe 'GET #destroy' do
    it 'delete project' do
      delete api_v1_project_path(projects.first.id), headers: session.login
      expect(response.status).to eq(200)
    end
  end
end
