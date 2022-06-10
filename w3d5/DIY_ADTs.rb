class Stack
    attr_reader :array
    def initialize
      # create ivar to store stack here!
      @array = []
    end

    def push(el)
      # adds an element to the stack
      @array << el
    end

    def pop
      # removes one element from the stack
      @array.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      @array[-1]
    end
  end

class Queue
    attr_reader :array
    def initialize
        @array = []
    end

    def enqueue(el)
        @array << el
    end

    def dequeue
        @array.shift
    end

    def peek
        @array[0]
    end
end

class Map
    def initialize
        @array = []
    end

    def set(key,value)
        @array.each_with_index do |ele, idx|
            if ele[0] == key
                @array[idx] = value
                return
            end
        end
        @array << [key, value]
    end

    def get(key)
        @array.each {|ele| return ele[1] if ele[0] == key}
        nil
    end
    
    def delete(key)
        @array = @array.select {|ele| ele[0] != key}
    end

    def show
        deep_dup(@array)
    end

    private 
    def deep_dup(arr)
        arr.map {|ele| ele.is_a?(Array) ? deep_dup(ele) : ele}
    end
end

