class EorzeaTime
  def self.now
    from_time Time.now
  end

  def self.from_time(t)
    new(t.to_f * 1440 / 70) # ET 1440m (24h) in LT is 70m
  end

  def initialize(i)
    @epoch = i % 86400
    @time = Time.at(@epoch).utc
  end

  def to_i
    @epoch
  end

  def +(o)
    self.class.new @epoch + o
  end

  def -(o)
    self.class.new @epoch - o
  end

  def hour
    @time.hour
  end

  def min
    @time.min
  end

  def sec
    @time.sec
  end

  def usec
    @time.usec
  end


  def inspect
    "#<EorzeaTime #{to_s}>"
  end

  def to_s
    "%02d:%02d:%02d" % [hour, min, sec]
  end

  def to_h
    {
      i: @epoch,
      hour: hour,
      min: min,
      sec: sec,
    }
  end
end

require "eorzea_time/version"
