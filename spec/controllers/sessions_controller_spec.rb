describe SessionsController, type: :controller do

    let!(:sessions_user) { FactoryGirl.build_stubbed(:sessions_user) }
    let!(:session_data) { { callsign: sessions_user.callsign, password: sessions_user.password} }

  describe "session actions" do
    before(:each) do
      @sessions_user = FactoryGirl.build_stubbed(:sessions_user)
      @sessions_data = { callsign: @sessions_user.callsign, password: @sessions_user.password}
    end
    it 'creates session' do
      post :create, params: @sessions_data
      binding.pry
      expect(response).to have_http_status(201)
    end

    it 'destroys session' do
      post :destroy
      expect(@response.code.to_i).to eql 200
    end
  end
end
