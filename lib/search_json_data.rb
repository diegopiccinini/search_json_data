Dir[File.join(File.dirname(__FILE__),'search_json_data','*.rb')].each {|file| require file }
require 'json'
include SearchJsonData
