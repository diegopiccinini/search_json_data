require "search_json_data/version"
require 'json'

module SearchJsonData
  class Data
    attr_reader :data_array
    def initialize(file_path = File.join(File.dirname(__FILE__),'search_json_data','data.json'))
        @data_array= JSON.parse File.read(file_path)
    end

  end
end
