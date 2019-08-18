require 'rails_helper'
require_relative '../helpers/sessions_helper.rb'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }
  include SessionsHelper

  describe 'GET #new' do
    context 'when user is not logged in' do
      it 'should load the new template' do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'when user is logged in' do
      before do
        login(user)  
      end

      it 'should redirect to root path' do
        get :new
        expect(response).to redirect_to root_path
        expect(flash[:error]).to eq "You're already logged in" 
      end
    end
  end

  describe 'POST #create' do
    context 'when credentials are invalid' do
      it 'should flash an error message' do
        post :create, params: { session: { username: user.username, password: " " } }
  
        expect(flash[:error]).to eq "Invalid credentials"
        expect(response).to render_template :new
      end
    end

    context 'when credentials are valid' do
      it 'should redirect to the user page' do
        post :create, params: { session: { username: user.username, password: user.password } }

        expect(session[:user_id]).to eq user.id
        expect(flash[:success]).to eq "Welcome back! #{user.username}"
        expect(response).to redirect_to root_path
      end
    end
  end
end