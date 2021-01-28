class ChatroomChannel < ApplicationCable::Channel
  def subscribed
  stream_from "chatroom_channel"
  end
  
def unsubcribed
  raise NotImplementedError
end
end
