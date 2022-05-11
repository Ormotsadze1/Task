# frozen_string_literal: true

require_relative 'file_writer'

# Prefix tree (Node class)
class Node
  attr_reader :value, :next
  attr_accessor :word

  def initialize(value)
    @value = value
    @word = false
    @next = []
  end
end

# Prefix tree (Trie class)
class PreTree
  def initialize
    @root = Node.new('root')
    @csv_box = CSVWrite.new
  end
  
  def csv_write(word)
    @csv_box.write(word)
  end

  def csv_read
    @csv_box.read
  end

  def add_node(character, trie)
    Node.new(character).tap { |new_node| trie << new_node }
  end

  def add_character(character, trie)
    trie.find { |n| n.value == character } || add_node(character, trie)
  end

  def find_character(character, trie)
    trie.find { |n| n.value == character }
  end

  def add_word(word)
    csv_write(word)
    letters = word.chars
    base = @root
    letters.each { |letter| base = add_character(letter, base.next) }
    base.word = true
  end

  def find_word(word)
    letters = word.chars
    base = @root
    word_found = letters.all? { |letter| base = find_character(letter, base.next) }
    yield word_found, base if block_given?
    base
  end

  def find?(word)
    find_word(word) { |found, base| return found && base.word }
  end

  def include?(word)
    find_word(word) { |found| return found }
  end

  def delete(word)
    find_word(word) do |found, base|
      base.word = false if found == true
    end
  end

  def list(prefix = nil)
    return @dictionary if prefix.nil?

    @stack = []
    @dictionary = []
    @prefix_stack = []
    @stack << find_word(prefix)
    @prefix_stack << prefix.chars.take(prefix.size - 1)
    return [] unless @stack.first

    empty_stack
    @dictionary
  end

  def empty_stack
    until @stack.empty?
      node = @stack.pop
      @prefix_stack.pop and next if node == :guard_node

      @prefix_stack << node.value
      @stack        << :guard_node
      @dictionary << @prefix_stack.join if node.word
      node.next.each { |n| @stack << n }
    end
  end
end