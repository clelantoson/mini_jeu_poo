require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

binding.pry

player1 = Player.new("Josiane")
player2 = Player.new("José")
