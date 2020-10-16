require './lib/scraper'

class DisplayForms
  def display_titles(titles)
    (0...titles.length).map do |x|
      [titles[x][0], titles[x][1][0]]
    end
  end

  def display_specific(num_title, title_minecraft)
    title_minecraft[num_title.to_i - 1]
  end
end
