# frozen_string_literal: true

class Post
  include Barley::Serializable

  serializer PostBarleySerializer
end
