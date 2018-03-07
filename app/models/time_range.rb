class TimeRange < Range

  def cover_range?(time_range)
    self.cover?(time_range.first) || self.cover?(time_range.last)
  end

end
