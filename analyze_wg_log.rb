class WgLog
    attr_accessor :log, :log_arr, :seq

  def initialize(text)
    @log = text
    @log_arr = @log.split(" ")
    @seq = @log_arr[0].match(%r{seq=(\d+)})[1].to_i
  end
end

# Creatureクラスのnewメソッドでオブジェクトを生成する
wl = WgLog.new('seq=20000 2015-01-02 01:02:11 Deny')
puts wl.seq
