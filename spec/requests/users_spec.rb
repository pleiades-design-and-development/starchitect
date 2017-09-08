describe 'Users' do
  let!(:user) { FactoryGirl.build_stubbed(:user) }
  let!(:json_data) { { firstname: user.firstname,
                       lastname: user.lastname,
                       callsign: user.callsign,
                       email: user.email,
                       password: user.password,
                       password_confirmation: user.password_confirmation } }

  context '/api/v1/signup' do
    it 'returns 201 status code' do
      post '/api/v1/signup', params: json_data
      user_json = JSON.parse(response.body)
      user.api_token = user_json['data']['attributes']['api-token']
      expect(response).to have_http_status(201)
    end
  end

  context '/api/v1/login' do
    before(:each) do
      @user = FactoryGirl.build_stubbed(:user)
      @json_data = { firstname: user.firstname,
                     lastname: @user.lastname,
                     callsign: @user.callsign,
                     email: @user.email,
                     password: @user.password,
                     password_confirmation: @user.password_confirmation }
      post '/api/v1/signup', params: @json_data
      @user_json = JSON.parse(response.body)
      @user.api_token = @user_json['data']['attributes']['api-token']
    end
    # let!(:user) { FactoryGirl.build_stubbed(:user) }
    # let!(:json_data) { { user: {callsign: user.callsign, password: user.password}}}
    # logged_in_user = FactoryGirl.build_stubbed(:logged_in_user)
    # json_data = logged_in_user.to_json

    it 'returns 201 status code' do
      post '/api/v1/login', params: { callsign: @user.callsign,
                                      password: @user.password }
      expect(response).to have_http_status(201)
    end

    it 'returns a valid api token' do
      post '/api/v1/login', params: { callsign: @user.callsign,
                                      password: @user.password }
      expect(@user.api_token).to_not be_nil

      headers = { Authorization: 'Token token=' + @user.api_token,
                  callsign: @user.callsign }
      get '/api/v1/users', headers: headers
        binding.pry
      expect(response).to have_http_status(200)
    end

    context 'when performing actions without an api token' do
      it 'errors with a 401' do
        get '/api/v1/users'
        expect(response).to have_http_status(401)
      end
    end

    context 'when performing actions with an invalid api token' do
      it 'errors with a 401' do
        headers = { format: :json,
                    'X-User-Token' => 'adswflkjadsf',
                    'X-User-callsign' => @user.callsign }
        get '/api/v1/users', params: headers
        expect(response).to have_http_status(401)
      end
    end
  end
end

# context "User Sign Out (Renew Token)" do
#   describe "api/v1/users/sign_in" do
#     context "when a user is already signed in" do
#       let(:user) { FactoryGirl.create(:confirmed_user) }
#       let(:json_data) { {user: { callsign: user.callsign, password: user.password}} }
#
#       before do
#         post "/api/v1/users/sign_in", json_data, format: :json
#         json_response = JSON.parse(response.body)
#         @auth_token = json_response["authentication_token"]
#         assert @auth_token != nil
#       end
#
#       it "invalidates the old auth token" do
#         #Sign out
#         headers = { format: :json,"X-User-Token" => @auth_token, "X-User-callsign" => user.callsign}
#         delete 'api/v1/users/sign_out', nil, headers
#
#         # Attempt an action using the old auth token
#         headers = { format: :json,
#                     "X-User-Token" => @auth_token,
#                     "X-User-callsign" => user.callsign}
#         get "api/v1/example", nil, headers
#         expect(response.code.to_i).to eql 401
#         json_response = JSON.parse(response.body)
#         expect(json_response["error"]).
#           to eql "You need to sign in or sign up before continuing."
#       end
#     end
#
#     context "when not signed in" do
#       it 'returns a 401' do
#         delete 'api/v1/users/sign_out', nil, headers
#         expect(response.code.to_i).to eql 401
#       end
#     end
#   end
# end
