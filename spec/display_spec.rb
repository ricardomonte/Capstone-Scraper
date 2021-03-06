require_relative '../lib/display'

describe Display do
  let(:url) { 'https://www.minecraftglobal.com/' }
  let(:display) { Display.new }
  let(:element1) { ["\e[32mhttps://www.minecraftglobal.com/\e[0m", "\e[35mb\e[0m", ['c', "\n", 'hello world']] }
  let(:element2) { ["\e[32mhttps://www.minecraftglobal.com/\e[0m", "\e[35mb\e[0m", %W[c \n d]] }
  let(:element4) { [["\e[32mhttps://www.minecraftglobal.com/\e[0m", "\e[35mb\e[0m", %w[c d], "\n"]] }
  let(:element3) { [["\e[32mhttps://www.minecraftglobal.com/\e[0m", "\e[35mb\e[0m", %w[c hello], "\n"]] }
  let(:all) { element3 + element4 }
  let(:all2) { [["\e[32mh\e[0m", "\e[35me\e[0m", %w[l lo], "\n"], ["\e[32mw\e[0m", "\e[35mo\e[0m", %w[r ld], "\n"]] }

  describe '#display_titles' do
    context 'will return an array with specific elements from an array' do
      it 'will return a number and the url from the array' do
        dbl = double('some scraper', minecraft: [[1, [url, 'b', 'c', 'd', 'e']]])
        mine = dbl.minecraft
        expect(display.display_titles(mine)).to eq(["1-\e[32mhttps://www.minecraftglobal.com/\e[0m"])
      end
      it 'will not return a number an the url from the array' do
        dbl = double('some scraper', minecraft: [[1, ['a', url, 'c', 'd', 'hello world']]])
        mine = dbl.minecraft
        expect(display.display_titles(mine)).not_to eq(["1-\e[32mhttps://www.minecraftglobal.com/\e[0m"])
      end
    end
  end

  describe '#display_specific' do
    context 'will return an array with one specific element from the collection' do
      it 'will return the second element in the collection' do
        dbl = double('some scraper', minecraft: [[1, [url, 'b', 'c', 'd', 'e']], [2, [url, 'b', 'c', 'd', 'e']]])
        mine = dbl.minecraft
        expect(display.display_specific(2, mine)).to eq(element2)
      end
      it 'will not return the first element in the collection' do
        dbl = double('some scraper', minecraft: [[1, [url, 'b', 'c', 'hello', 'd']], [2, [url, 'b', 'c', 'd', 'e']]])
        mine = dbl.minecraft
        expect(display.display_specific(2, mine)).not_to eq(element1)
      end
    end
  end
  describe '#all_post' do
    context 'will return an array with all specific elements from the collection' do
      it 'will return first element and second element' do
        dbl = double('some scraper', minecraft: [[1, [url, 'b', 'c', 'hello', 'd']], [2, [url, 'b', 'c', 'd', 'e']]])
        mine = dbl.minecraft
        expect(display.all_post(mine)).to eq(all)
      end
      it 'will return first element and second element' do
        dbl = double('some scraper', minecraft: [[1, %w[h e l lo d]], [2, %w[w o r ld e]]])
        mine = dbl.minecraft
        expect(display.all_post(mine)).to eq(all2)
      end
    end
  end
  describe '#full_specific' do
    context 'will return an array with all the elements from the collection' do
      it 'will return the first and second element in color and the rest without color ' do
        dbl = double('some scraper', minecraft: %w[hi im r m])
        mine = dbl.minecraft
        expect(display.full_specific(mine)).to eq(["\n", "\e[32mhi\e[0m", "\e[35mim\e[0m", 'r', "\n", 'm', "\n"])
      end
    end
  end
end
