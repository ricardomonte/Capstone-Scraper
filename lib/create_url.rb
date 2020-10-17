require './lib/scraper'

class CreateUrl

  def create_url (num_title, minecraft)
    minecraft[num_title-1][1][4]
  end
end