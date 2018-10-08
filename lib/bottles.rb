# -*- coding: utf-8 -*-
require 'erb'

class Bottles

  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    verses = Array.new
    return traverseVerses(starting, ending, verses).join("\n");
  end

  def verse(number)
    @numBottles = number

    if File.exist?('./verse' + number.to_s + '.erb')
      template = File.read('./verse' + number.to_s + '.erb')
    else
      template = File.read('./verse.erb')
    end

    return ERB.new(template, 0).result(binding)
  end

  private
    def traverseVerses(starting, ending, verses)
      # insert validation here
      verses << verse(starting)

      if starting != ending
        traverseVerses(starting - 1, ending, verses)
      end

      return verses
    end

end
