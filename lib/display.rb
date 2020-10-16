require './lib/scraper'

class DisplayForms
  
  def display_titles(titles)
    (0...titles.length).map { |x| [titles[x][0],titles[x][1][0]]}
  end

  def display_specific(num_title, title_minecraft)
    puts 'aaaa'
  end
end

