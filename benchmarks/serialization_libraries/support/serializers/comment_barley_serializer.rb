# frozen_string_literal: true

class CommentBarleySerializer < Barley::Serializer
  attributes :id, :author, :comment

  #one :post#, serializer: ::PostBarleySerializer
end
