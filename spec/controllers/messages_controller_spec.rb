require 'rails_helper'
require_relative '../helpers/sessions_helper.rb'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:another_user) { create(:another_user) }
  include SessionsHelper

  describe 'POST #create' do
    context 'when a user is not logged in' do
      it 'should render the login template' do
        post :create, params: { message: { body: "Hey", recipient_id: another_user.id, sender_id: user.id } }
        
        expect(response).to redirect_to login_path
      end
    end
  end
end