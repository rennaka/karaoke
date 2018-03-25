class TimeRange < Range

  def cover_range?(time_range)
    return false if time_range.first.nil? || time_range.last.nil?
    self.has_time_in(time_range) > 0
  end

  def cover_ranges?(time_ranges)
    time_ranges.map{|time_range| cover_range?(time_range)}.include?(true)
  end

  def has_time_in(time_range)
    ([time_range.last,self.last].compact.min - [time_range.first,self.first].compact.max).to_non_negative / 1800
  end
end
