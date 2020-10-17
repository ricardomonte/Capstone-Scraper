require './lib/scraper'
require 'rainbow'

class DisplayForms
  def display_titles(titles)
    (0...titles.length).map do |x|
      [titles[x][0], Rainbow(titles[x][1][0]).green].join('-')
    end
  end

  def display_specific(num, minecraft)
    [Rainbow(minecraft[num.to_i - 1][1][0]).green, Rainbow(minecraft[num.to_i - 1][1][1]).magenta, minecraft[num.to_i - 1][1][2], "\n",  minecraft[num.to_i - 1][1][3]]
  end

  def all_post(minecraft)
    (0...minecraft.length).map do |x|
      [Rainbow(minecraft[x][1][0]).green, Rainbow(minecraft[x][1][1]).magenta, minecraft[x][1].slice(2, 2), "\n"]
    end
  end
  
  def full_specific(minecraft)
    ["\n", Rainbow(minecraft[0]).green, Rainbow(minecraft[1]).magenta, minecraft[2], "\n", minecraft[3], "\n"]
  end
end
