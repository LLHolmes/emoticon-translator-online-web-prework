# require modules here
require "yaml"

def load_library(path)
  YAML.load_file(path)
end

def get_japanese_emoticon
  library = load_library
  
end

def get_english_meaning
  # code goes here
end

#puts YAML.load_file('lib/emoticons.yml')