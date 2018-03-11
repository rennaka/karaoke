class Numeric

  def to_non_negative
    [self,0].max
  end
end
