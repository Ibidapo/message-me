require 'rails_helper'
require_relative '../helpers/sessions_helper.rb'

RSpec.describe "ChatroomController", type: :controller do
  let(:user) { create(:user) }
  let(:another_user) { create(:another_user) }
  let(:message) { create(:message, sender_id: user.id, recipient_id: another_user.id) }
  let(:another_message) { create(:another_message, sender_id: another_user.id, recipient_id: user.id) }
  include SessionsHelper

  describe 'GET #index' do
    context 'when user is logged in' do
      before do
        login(user)
        @controller = MessagesController.new
        post :create, params: { message: { body: message.body, sender_id: message.sender_id, recipient_id: message.recipient_id } }
        post :create, params: { message: { body: another_message.body, sender_id: another_message.sender_id, recipient_id: another_message.recipient_id } }
      end

      it 'should return all the users chatroom guest' do
        @controller = ChatroomController.new
        get :index

        expect(response.body).to include "#{another_user.username}"
        expect(response.body).to include "#{another_user.interest}"
      end
    end

    context 'when user is not logged in' do
      it 'should redirect to login page' do
        @controller = ChatroomController.new
        get :index

        expect(response).to redirect_to login_path
      end
    end
  end

  # describe 'GET #show' do
  #   context 'when user is logged in' do
  #     before do
  #       login(user)
  #     end

  #     it 'should return chatroom with guests' do
  #       @controller = ChatroomController.new
  #       get :show, params: { id: another_user.id }

  #       # expect(response).to render_template :show
  #       # expect(response.body).to include "Hi, are you online?"
  #       # expect(response.body).to include "Hey, Yes! Welcome to MessageMe"
  #     end
  #   end
  # end
end