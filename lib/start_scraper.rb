require_relative 'scraper'
require_relative 'display'
require_relative 'create_url'
require_relative 'interaction'

class StartScraper
  include InteractionUser
  def display_start
    start
  end

  private

  def start
    url = 'https://www.minecraftglobal.com/minecraft-news/'
    minecraft = Scraper.new(url).content
    minecraft_news = Display.new
    welcome
    anwser = getting_anwser(minecraft, minecraft_news)
    anwser_title, title = titles(anwser, minecraft, minecraft_news)
    num, anwser_selection = selection(anwser_title, minecraft, minecraft_news)
    page_url = CreateUrl.new.create_url(num, minecraft)
    full_content = Scraper.new(page_url).complete_content
    full_news(anwser_selection, full_content, minecraft_news)
  end
end
