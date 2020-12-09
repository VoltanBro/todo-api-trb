RSpec.describe Api::V1::RegistrationsController, type: :request do
  let(:params) { attributes_for(:user) }

  describe 'POST #create' do
    context 'when user input valid params' do
      it 'create new user' do
        post api_v1_registration_path, params: params
        expect(response.status).to eq(200)
        expect(response).to match_json_schema('user')
      end
    end

    context 'when user input invalid params' do
      it 'create new user' do
        post api_v1_registration_path, params: params[email: '']
        expect(response.status).to eq(422)
        expect { response }.not_to change(User, :count)
      end
    end
  end
end
