# frozen_string_literal: true

# Repdigit Number Algorithm
class RepDigitsService
    class AttributeError < StandardError; end
    ALPHABETICS = '^0-9'
    EDGE = 1
  
    def initialize(number)
      @number = number.to_s
    end
  
    def call
      validate_parameters
      repdigit?
    rescue AttributeError => e
      e.message
    end
  
    private
  
    def validate_parameters
      return unless @number.count(ALPHABETICS).positive? || @number.empty?
  
      raise AttributeError, 'Input must include only numbers'
    end
  
    def repdigit?
      if @number.split('').uniq.size > EDGE
        'This isn\'t repdigit number'
      else
        'This is repdigit number.'
      end
    end
  end
  
  puts RepDigitsService.new('1111').call

  