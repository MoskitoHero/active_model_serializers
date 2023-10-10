# frozen_string_literal: true

class Comment
  include Barley::Serializable

  serializer CommentBarleySerializer
end
