# frozen_string_literal: true

class PostBarleySerializer < Barley::Serializer
  attributes :id,
             :title, :body,
             :created_at, :updated_at

  #one :user#, serializer: UserBarleySerializer
  many :comments#, serializer: CommentBarleySerializer
end
