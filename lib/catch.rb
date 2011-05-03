require 'faraday'

module Catch

  class << self
    attr_accessor :username
    attr_accessor :password

    def configure
      yield self
      true
    end
  end
end
