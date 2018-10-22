require 'yaml'
require 'pry'


def load_library(file_path)
  emoticons = {"get_emoticon" => {}, "get_meaning" => {}}
  hash = YAML.load_file(file_path)
  hash.each do |meaning, emo|
    #binding.pry
    emoticons["get_meaning"][emo[1]] = meaning
    emoticons["get_emoticon"][emo[0]] = emo[1]
  end
  emoticons
end

#binding.pry

def get_japanese_emoticon(file_path, eng_emo)
  emoticons = load_library(file_path)
  emoticons["get_emoticon"].each do |eng, jp|
    #binding.pry
    if eng == eng_emo
      return jp
    elsif !(emoticons["get_emoticon"].keys.include?(eng_emo))
      return "Sorry, that emoticon was not found"
    end
  end
end

def get_english_meaning(file_path, jp_emo)
  emoticons = load_library(file_path)
  emoticons["get_meaning"].each do |jp, meaning|
    if jp == jp_emo
      return meaning
    elsif !(emoticons["get_meaning"].keys.include?(jp_emo))
      return "Sorry, that emoticon was not found"
    end
  end
end
