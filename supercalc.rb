class Calculator
  def splitit(input)
    input = input.split.join
    numbers = []
    operators = []
    index = -1
    newnum = true

    input.each_char do |char|
      if char == char.to_i.to_s || char == "."
        if newnum
          index = index + 1
          numbers[index] = ''
          operators[index] = ''
          newnum = false
        end
        numbers[index] << char
      else
        operators[index] << char
        newnum = true
      end
    end
    [cleannum(numbers), cleanops(operators)]
  end

  def cleannum(array)
    array.map { |n| n.to_f}
  end

  def cleanops(array)
    array.delete_if { |n| n == ''}
    array.map! do |n|
      case n
      when 'plus' then n = '+'
      when 'minus' then n = '-'
      when 'times' then n = '*'
      when 'dividedby' then n = '/'
      when 'tothepowerof' then n = '**'
      end 
      n.to_sym
    end
  end
end