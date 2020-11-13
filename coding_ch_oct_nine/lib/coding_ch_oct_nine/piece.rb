module CodingChOctNine
  class Piece
    attr_accessor :x, :y, :char, :kind, :life, :ticks_before_next_move, :visitations,
      :momentum, :destination, :path

    def initialize(obj = {})
      @obj = obj
      @x = obj[:x]
      @y = obj[:y]
      @char = obj[:char]
      @kind = obj[:kind]
      @path = obj[:path]
      @life = obj[:life] ? obj[:life] : 0
      @ticks_before_next_move = 0
      @visitations = []
      @momentum = @obj[:kind] == :backward_tricker_treater ? -1 : 1
    end

    def [](key)
      self.send(key)
    end

    def perform_tick_for_piece!
      self.life += 1
      # When we're visiting a house, we'll have ticks to burn down before we can move
      if self.ticks_before_next_move > 0
        self.perform_tick_burndown_for_piece!
      else
        # Otherwise we perform a movement
        self.perform_movement_for_piece!
      end
    end

    def perform_tick_burndown_for_piece!
      self.ticks_before_next_move -= 1
    end

    def perform_movement_for_piece!
      destination_point = self.path.shift
      self.x = destination_point[:x]
      self.y = destination_point[:y]
    end

  end

end
