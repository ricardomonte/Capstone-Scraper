require 'open-uri'
require 'nokogiri'

class Scraper
  def initialize(url)
    @url = url
  end

  def content
    map_news
  end

  def complete_content
    complete_news
  end

  private

  def parse
    response = URI.open(@url)
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

  def complete_news
    content = parse
    arr = []
    arr << content.css('h1.entry-title').text
    arr << content.css('span.entry-author').text
    arr << content.css('span.entry-date').text
    arr << content.css('div.entry-content p').text
    arr
  end
end
