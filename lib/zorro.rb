require 'bundler/setup'
require 'httparty'

require_relative "zorro/version"
require_relative "zorro/base"
require_relative "zorro/request"
require_relative "zorro/gem"

module Zorro
  module Messages
    GEM_NOT_FOUND = 'Gem not found'
    SEARCHING_GEM = 'Searching info for %s...'
  end
end
