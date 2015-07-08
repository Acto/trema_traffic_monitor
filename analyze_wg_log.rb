class WgLog
    attr_accessor :log, :log_arr, :seq, :msg

  def initialize(text)
    @log = text
    @log_arr = @log.split(" ")
    @seq = @log_arr[0].match(%r{seq=(\d+)})[1].to_i
    @msg = @log_arr[4].match(%r{msg="(\w+)"})
  end
end

# Creatureクラスのnewメソッドでオブジェクトを生成する
wl = WgLog.new('seq=20000 2015-01-02 01:02:11 Deny msg="DDoS"')
puts wl.seq
puts wl.msg