module SearchJsonData
  # @author Diego Piccinini Lagos
  class DataArray
    attr_reader :data_array, :results

    # read the Json file and dump to array
    # @param file_path [Pathname] path to a json file
    def initialize(file_path = File.join(File.dirname(__FILE__),'data.json'))
        @data_array= JSON.parse File.read(file_path)
        @results = []
    end

    # search words in a collection
    #
    # @param words [String] words to search, when are quoted must match exactly
    # @param field [String] the name of the field, is nil by default in this case search in all fields
    # @param condition [String, nil] the condition to search, by default nil to add results to the before search,
    # otherwise AND return only the results in both searches
    # @param precision [Boolean, false] false by default, true is case sensitive
    # @return [Array] collection of matching results
    def search_by(words, field = nil, condition = nil, precision = false)

        # to include negative searchs
        negative = words.scan(/-.*?$/).first
        # erase the negative argument
        words = words.sub(negative,'') if negative

        # when the search have exactly presition search quoted text
        phrases =words.split(/\"/)

        # exactly phrases are quoted
        exactly_phrases = []
        words.scan(/\".*?\"/).each {|exactly| exactly_phrases << exactly.tr('"','') }

        # non exactly prhases the difference of
        non_exactly_phrases =  phrases - exactly_phrases

        # array of all words to match
        words_to_match = non_exactly_phrases.join(' ').split(' ').uniq

        results = []

        self.data_array.each  do |data_hash|

            data_for_search = data_hash
            # if field is not nil the data_for_search has only the field
            data_for_search = data_hash.select { |k,v| k == field } if field

            # if match one or more words
            match = is_match words_to_match, data_for_search, nil, precision
            # if match one or more exactly phrases
            match = is_match exactly_phrases, data_for_search, nil, precision unless match

            # when match is true add the data_hash to the results
            results << data_hash if match
        end

        if condition == "AND"
            # if has contition AND only considate the values in both collections
            @results = results.uniq & @results
        elsif condition == "-"
            # when condition is "-" rest to the previos matches the finded values
            @results = @results - results.uniq
        else
            # add all matching values in this search to @result instance collection
            @results = @results | results.uniq
        end
        # when the phrase has a negative value search for this value
        self.search_by(negative[1 .. -1],field,"-", precision) if negative and negative.length > 1
        @results
    end

    # to clean the result collection
    def clean_results
        @results = []
    end
  end

  private

    # return true when one or more values include one or more words or phrases
    # @param collection [Array] words or phrases to search
    # @param data_hash [Hash] a hash that contain values to search in its
    # @param condition [String, nil] condition for negatives matches
    # @param precision [Boolean, false] false by default, true is case sensitive
    # @return [Boolean] true is any value or phrase match, otherwise false
    def is_match(collection, data_hash, condition = nil, precision = false)
        match = false

        collection.each do |text|
            data_hash.each_value do |value|
                if precision
                    match = true if value.include? text
                else
                    match = true if value.downcase.include? text.downcase
                end
                # to exclude array in negative search
                match = false if condition == "-" and value.include? ',' and text=='array'
            end
        end
        match
    end
end
