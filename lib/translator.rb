# require modules here
require "yaml"

def load_library(path)
  library = { "get_meaning" => {}, "get_emoticon" => {} }
  YAML.load_file(path).each do |name, emos|
    emos.each do |english, japanese|
      library["get_meaning"][japanese] = name
      library["get_emoticon"][english] = japanese
    end
  end
  return library
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  if library["get_emoticon"].has_key?(emoticon)
    return library["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library.each do |name, emos|
    if emos[1] = emoticon
      return emos[0]
    end
  end
  return "Sorry, that emoticon was not found"
  # code goes here
end

=begin
puts YAML.load_file('lib/emoticons.yml')
{"angel"=>["O:)", "☜(⌒▽⌒)☞"], "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], "bored"=>[":O", "(ΘεΘ;)"], "confused"=>["%)", "(゜.゜)"], "embarrased"=>[":$", "(#^.^#)"], "fish"=>["><>", ">゜))))彡"], "glasses"=>["8D", "(^0_0^)"], "grinning"=>["=D", "(￣ー￣)"], "happy"=>[":)", "(＾ｖ＾)"], "kiss"=>[":*", "(*^3^)/~☆"], "sad"=>[":'(", "(Ｔ▽Ｔ)"], "surprised"=>[":o", "o_O"], "wink"=>[";)", "(^_-)"]}
=end