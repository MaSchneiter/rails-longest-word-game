require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    return json['found']
    # Transformer en :
    # url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    # flats = JSON.parse(open(url).read)

    if json['found'] == "true"
      @answer = "Congratulations! #{@word} is a valid English word!"
    else
      @answer = "Sorry but #{@word} does not seem to be a valid English word…"
    end
  end
end
