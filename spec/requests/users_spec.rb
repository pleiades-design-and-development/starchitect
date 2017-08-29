describe "User Signup" do
  context "/api/v1/signup" do
    let(:user) { FactoryGirl.build(:user) }
    let(:json_data) { {user: { firstname: user.firstname, lastname: user.lastname, callsign: user.callsign, email: user.email, password: user.password, password_confirmation: user.password_confirmation}} }

    it "returns 201 status code" do
      post "/api/v1/signup", params: json_data
      expect(response.code.to_i).to eql 201
    end
  end
end

context "User Login" do
  describe "/api/v1/login" do
    let(:logged_in_user) { FactoryGirl.create(:logged_in_user) }
    let(:json_data) {:logged_in_user}

    it "returns 201 status code" do
      post "/api/v1/login", params: json_data
      expect(response.code.to_i).to eql 201
    end

    it "returns a valid api token" do
      post "/api/v1/login", params: json_data
      json_response = JSON.parse(response.body)
      auth_token = json_response["api_token"]
      expect(auth_token).to_not be_nil

      headers = { format: :json,
                  "X-User-Token" => auth_token,
                  "X-User-callsign" => logged_in_user.callsign}
      get "/api/v1/users", nil, headers
      expect(response.code.to_i).to eql 200
    end

    context "when performing actions without an api token" do
      it "errors with a 401" do
        get "/api/v1/users"
        expect(response.code.to_i).to eql 401
      end
    end

    context "when performing actions with an invalid api token" do
      it "errors with a 401" do
        headers = { format: :json,
                    "X-User-Token" => 'adswflkjadsf',
                    "X-User-callsign" => logged_in_user.callsign}
        get "/api/v1/users", nil, headers
        expect(response.code.to_i).to eql 401
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
