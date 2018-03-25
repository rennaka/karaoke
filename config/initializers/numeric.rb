class Numeric

  def to_non_negative
    [self,0].max
  end

  def notzero?
    self != 0 ? self : false
  end
end
