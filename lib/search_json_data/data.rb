module SearchJsonData
  class Data
    attr_reader :data_array
    def initialize(file_path = File.join(File.dirname(__FILE__),'data.json'))
        @data_array= JSON.parse File.read(file_path)
    end

  end
end
