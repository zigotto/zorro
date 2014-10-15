module Zorro
  module Request
    include HTTParty

    base_uri 'https://rubygems.org/api/v1'
  end
end
