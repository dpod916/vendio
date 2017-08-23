load 'config/environment.rb'
Rails.application.eager_load!
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir'

urls = []
switches = %W[--user-data-dir=c:\\chrome]
# switches = %W[--user-data-dir=/chrome]  => Linux or Mac


prefs = {
    :download => {
        :prompt_for_download => false,
        :default_directory => "c:\\downloads"
    }
}



browser = Watir::Browser.new :chrome, :prefs => prefs, switches: switches

('a'..'z').each do |letter|
  url = "https://www.linkedin.com/directory/topics-#{letter}/"
  browser.goto(url)
  page = Nokogiri::HTML(browser.html)
  topics_range = page.css("li[class=content]")
  topics_range.each do |topic_range|
    urls << topic_range.css('a')[0]["href"]
    puts topic_range.css('a')[0]["href"]
  end
end


urls.each do |url|
  if url.include?('directory')
    browser.goto(url)
    page = Nokogiri::HTML(browser.html)
    topics = page.css("li[class=content]")
    topics.each do |topic|
      s = topic.text.strip
      skill = Skill.where(name: s).first_or_initialize
      skill.update_attributes(name: s)
    end
  end
end



