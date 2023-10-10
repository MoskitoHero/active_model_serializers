# frozen_string_literal: true

class UserBarleySerializer < Barley::Serializer
  attributes :id,
             :first_name, :last_name, :birthday,
             :created_at, :updated_at

  many :posts, serializer: PostBarleySerializer
end
