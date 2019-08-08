require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create'do
    let(:user) { create(:user) }

    context 'when credentials are valid' do
      it 'should flash a success message and set session id' do
        post :create, params: { user: { username: "new_user", password: "default_pass" } }
        
        expect(flash[:success]).to eq "Welcome to MessageMe! new_user"
        expect(session[:user_id]).to eq 1
      end
    end

    context 'when user already exists' do
      it 'should flash an error message and render new template' do
        post :create, params: { user: { username: user.username, password: user.password } }
        
        expect(flash[:error]).to eq "Invalid credentials"
        expect(response).to render_template :new
      end
    end

    context 'when user username and/or password is empty' do
      it 'should flash an error message and render new template' do
        post :create, params: { user: { username: " ", password: " " } }
        
        expect(flash[:error]).to eq "Invalid credentials"
        expect(response).to render_template :new
      end
    end
  end
end
