OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

namespace :sync do
  task rss_feeds: [:environment] do
    RssFeed.all.each do |feed|
      begin
        Feedjira::Feed.add_common_feed_element("image")
        content = Feedjira::Feed.fetch_and_parse feed.url
        content.entries.each do |entry|
          local_entry = feed.entries.where(title: entry.title).first_or_initialize
          feed_content = entry.content.nil? ? entry.summary : entry.content
          feed_content.gsub!('display: none', 'display: true')
          local_entry.update_attributes(content: feed_content, author: entry.author, 
                                        url: entry.url, published: entry.published, 
                                        image: entry.image, categories: entry.categories)
          p "Synced Entry - #{entry.title}"
        end
        p "Synced Feed - #{feed.name}"
        feed.update_attributes(name: content.title, description: content.description, status: 'Updated')
      rescue Feedjira::NoParserAvailable
        feed.update_attributes(status: 'Error Updating')
      end
    end
  end
end

# OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
# require 'rss'
# require 'open-uri'
#   rss_entrys = []
 
# namespace :sync do
#   task rss_feeds: [:environment] do
#     RssFeed.all.each do |feed|

#       rss = RSS::Parser.parse(open(feed.url).read, false).items
#       rss.each do |entry|
#         local_entry = feed.entries.where(title: entry.title).first_or_initialize
#         local_entry.update_attributes(content: entry.description, author: entry.author, url: entry.link, published: entry.pubDate)
#         p "Synced Entry - #{entry.title}"
#       end
#       p "Synced Feed - #{feed.name}"
#     end
#   end
# end
