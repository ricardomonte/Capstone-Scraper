require_relative 'scraper'
require_relative 'display'
require_relative 'create_url'

module InteractionUser
  def welcome
    puts 'Welcome to Minecraft News from'
    puts 'minecraftglobal.com'
  end

  private

  def looping(ask)
    loop do
      puts ask
      anwser = gets.chomp.upcase
      break anwser if anwser == 'Y'
      break anwser if anwser == 'N'

      puts 'wrong input try again'
    end
  end

  def looping_selection(ask)
    loop do
      puts ask
      anwser = gets.chomp.to_i
      break anwser if anwser.positive? && anwser < 11

      puts 'wrong input try again'
    end
  end

  public

  def getting_anwser(arr, mine_news)
    question = 'Do you want all the post?(y/n):'
    anwser = looping(question)
    case anwser
    when 'Y'
      puts 'Here you have'
      sleep 2
      puts mine_news.all_post(arr)
      sleep 1
      anwser
    when 'N'
      anwser
    end
  end

  def titles(title, arr, mine_news)
    if title == 'Y'
      question = 'Would you like choose a post?(y/n)'
      anwser = looping(question)
      case anwser
      when 'Y'
        puts 'Here you have a list with the titles'
        sleep 2
        puts mine_news.display_titles(arr)
        sleep 1
        return anwser.upcase, mine_news.display_titles(arr)
      when 'N'
        return anwser.upcase
      end
    end
    puts 'Thanks come back soon'
    sleep 1
    exit
  end

  def selection(title, arr, mine_news)
    if title == 'Y'
      question = 'Would you like to read an specific post?(y/n)'
      specific_new = looping(question)
      case specific_new
      when 'Y'
        question_num = 'Select post from 1 to 10'
        number = looping_selection(question_num)
        puts 'Here you have'
        sleep 2
        puts mine_news.display_specific(number, arr)
        [number, specific_new]
      when 'N'
        puts 'Thanks come back soon'
        exit
      end
    else
      puts 'Thanks come back soon'
      sleep 1
      exit
    end
  end

  def full_news(title, arr, mine_news)
    if title == 'Y'
      question = 'Would you like to read the entire post that you selected?(y/n)'
      full_news = looping(question)
      case full_news
      when 'Y'
        puts 'Here you have'
        sleep 2
        puts mine_news.full_specific(arr)
        puts 'Thank you for prefer us'
      when 'N'
        puts 'Thanks come back soon'
      end
    else
      puts 'Thanks come back soon'
      sleep 1
      exit
    end
  end
end
