require 'open-uri'
require 'nokogiri'

class Scraper
  def display
    map_news
  end

  private

  def parse
    url = 'https://www.minecraftglobal.com/minecraft-news/'
    response = URI.open(url)
    parsed_page = Nokogiri::HTML(response)
  end

  def all_news
    news = parse
    all_news_length = news.css('div.entry-header').length
    all_news_length
  end

  def loop_over_news
    loop_over = parse
    times = all_news
    arr = []
    arr2 = []
    (0...times). each do |x|
      arr << loop_over.css('div.entry-header h2')[x].text
      arr << loop_over.css('div.entry-meta span.entry-author')[x].text
      arr << loop_over.css('div.entry-header span.entry-date')[x].text
      arr << loop_over.css('div.entry-summary > text()')[x].text.strip
      arr << loop_over.css('div.entry-summary a')[x].attributes['href'].value
      arr2 << arr
      arr = []
    end
    arr2
  end

  def map_news
    loop_over_news.map.with_index(1) { |x, i| [i, x] }
  end
end
