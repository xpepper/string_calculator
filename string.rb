class String
  def addition
    delimiter = ","
    string_of_numbers = self

    if start_with? "//"
      delimiter = self[2,1]
      string_of_numbers = self[4..-1]
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
