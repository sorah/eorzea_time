class EorzeaTime
  HOUR = 175 # ET 1h = LT 175s
  DAY = HOUR * 24

  RATIO = 1440/70r # ET 1440m (24h) in LT is 70m

  def self.now
    from_time Time.now
  end

  def self.from_time(t)
    new(t.to_f * RATIO) # ET 1440m (24h) in LT is 70m
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

  def occurrence(time = Time.now)
    last_midnight = time.to_i / DAY * DAY
    seconds_passed_in_local = (@epoch / RATIO).to_i
    Time.at(last_midnight + seconds_passed_in_local).utc
  end

  def last_occurrence(time: Time.now, count: 1)
    o = occurrence(time)
    if o < time
      o - ((count - 1) * DAY)
    else
      o - (count * DAY)
    end
  end

  def next_occurrence(time: Time.now, count: 1)
    o = occurrence(time)
    if o > time
      o + ((count - 1) * DAY)
    else
      o + (count * DAY)
    end
  end
end

require "eorzea_time/version"
