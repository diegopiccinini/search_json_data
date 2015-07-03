module SearchJsonData
  class DataArray
    attr_reader :data_array
    def initialize(file_path = File.join(File.dirname(__FILE__),'data.json'))
        @data_array= JSON.parse File.read(file_path)
    end
    def search_by(words)
        phrases =words.split(/\"/)
        exactly_phrases = []

        words.scan(/\".*?\"/).each {|exactly| exactly_phrases << exactly.tr('"','') }

        non_exactly_phrases =  phrases - exactly_phrases
        words_to_match = non_exactly_phrases.join(' ').split(' ').uniq

        results = []
        self.data_array.each  do |data_hash|
            match = is_match words_to_match, data_hash
            match = is_match exactly_phrases, data_hash unless match
            results << data_hash if match
        end
        results
    end
  end
  private
    def is_match(collection, data_hash)
        match = false
        collection.each do |text|
            data_hash.each_value { |value| match = true if value.include? text }
        end
        match
    end
end
