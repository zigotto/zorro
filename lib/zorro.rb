require 'commander/import'
require 'yaml'
require 'httparty'

require_relative "zorro/version"

module Zorro
  module Request
    include HTTParty
  end

  class Gem
    attr_accessor :name, :version

    def initialize(response)
      @name = response['name']
      @version = response['version']
    end

    def self.info(gem_name)
      api_url = "https://rubygems.org/api/v1/gems/%s.json" % CGI.escape(gem_name)
      response = Request.get(api_url)

      case response.code
      when 200
        Gem.new(response)
      else
        puts "Ops! #{response.code} #{response.message}"
      end
    end

    def to_gemfile
      "gem \'#{name}\', \'~> #{version}\'"
    end
  end
end
