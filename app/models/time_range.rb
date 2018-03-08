class TimeRange < Range

  def cover_range?(time_range)
    return false if time_range.first.nil? || time_range.last.nil?
    self.cover?(time_range.first) || self.cover?(time_range.last) || (time_range.first < self.first && self.last < time_range.last)
  end

end
