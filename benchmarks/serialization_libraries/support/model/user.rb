# frozen_string_literal: true

class User
  include Barley::Serializable

  serializer UserBarleySerializer
end
