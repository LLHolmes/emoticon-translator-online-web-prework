# require modules here
require "yaml"

def load_library(path)
  yaml_library = YAML.load_file(path)
  library = { "get_meaning" => {}, "get_emoticon" => {} }
  yaml_library.each do |name, emos|
    library["get_meaning"][emos[1]] = name
    library["get_emoticon"][emos[0]] = emos[1]
=begin
    emos.each do |english, japanese|
      library["get_meaning"][japanese] = name
      library["get_emoticon"][english] = japanese
    end
=end
  end
  puts library
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
  if library["get_meaning"].has_key?(emoticon)
    return library["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

=begin
puts YAML.load_file('lib/emoticons.yml')
{"angel"=>["O:)", "☜(⌒▽⌒)☞"], "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"], "bored"=>[":O", "(ΘεΘ;)"], "confused"=>["%)", "(゜.゜)"], "embarrased"=>[":$", "(#^.^#)"], "fish"=>["><>", ">゜))))彡"], "glasses"=>["8D", "(^0_0^)"], "grinning"=>["=D", "(￣ー￣)"], "happy"=>[":)", "(＾ｖ＾)"], "kiss"=>[":*", "(*^3^)/~☆"], "sad"=>[":'(", "(Ｔ▽Ｔ)"], "surprised"=>[":o", "o_O"], "wink"=>[";)", "(^_-)"]}
=end