require "coding_ch_oct_nine/version"
require "coding_ch_oct_nine/world"
require "coding_ch_oct_nine/piece"

require 'pry'

module CodingChOctNine

  def self.main
    world = World.new
    world.parse_map("../../config/map")

    world.print_state
    world.tick
    world.print_state
  end

end
