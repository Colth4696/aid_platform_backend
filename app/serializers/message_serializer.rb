class MessageSerializer < ActiveModel::Serializer
  attributes :id, :chatroom_id, :body, :created_at
end
