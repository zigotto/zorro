module Zorro
  class Gem < Base
    class NotFound < StandardError; end

    attr_accessor :name, :version, :valid
    alias_method :valid?, :valid

    def initialize(response)
      @name     = response['name']
      @version  = response['version']
      @valid    = response['valid']
    end

    def self.info(gem_name)
      url = "/gems/%s.json" % CGI.escape(gem_name)
      response = Request.get(url)

      case response.code
      when 200 then Gem.new(response.merge!('valid' => true))
      when 404 then raise NotFound
      end
    rescue NotFound
      Gem.new('valid' => false)
    end

    def to_stdout
      return say Messages::GEM_NOT_FOUND if !valid?

      say Messages::SEARCHING_GEM % name
      say to_gemfile
    end

    def to_gemfile
      "gem \'#{name}\', \'~> #{version}\'" if valid?
    end
  end
end
