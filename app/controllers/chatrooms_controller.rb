class ChatroomsController < ApplicationController

    def index
        @chatrooms = Chatroom.all
        render json: chatrooms
      end
    
      def show
        @chatroom = Chatroom.find(params[:id])
      end
      def create
        @chatroom = Chatroom.new(chatroom_params)
            if @chatroom.save
                serialized_data = ActiveModelSerializers::Adapter::Json.new(
                    ChatroomSerializer.new(chatroom)
                ).serializable_hash
                ActionCable.server.broadcast 'chatroom_channel', serialized_data
                head :ok
          end
    end

    private
      
    def chatroom_params
      params.require(:chatroom).permit(:name, :request_id, :volunteer_id)
    end
  end

