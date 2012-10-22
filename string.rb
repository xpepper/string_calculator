class String
  def addition
    delimiter = ","
    string_of_numbers = self

    if has_custom_delimiters?
      matching_groups = scan(/\/\/(.+)\n(.+)/).flatten
      delimiter, string_of_numbers = matching_groups
      
      if delimiter.start_with? "["
        delimiter = delimiter[1..-2]
      end
    end

    numbers = string_of_numbers.sub("\n", delimiter).split(delimiter).as_numbers
    numbers.reject! {|number| number > 1000}

    if numbers.any?(&:negative?)
      negatives = numbers.select(&:negative?)
      raise Exception.new("negatives not allowed: #{negatives.join(',')}")
    else
      numbers.sum
    end
  end

  private
  
  def has_custom_delimiters?
    start_with? "//"
  end
end

class Fixnum
  def negative?
    self < 0
  end
end

class Array
  def sum
    inject(0, :+)
  end

  def as_numbers
    map(&:to_i)
  end
end
