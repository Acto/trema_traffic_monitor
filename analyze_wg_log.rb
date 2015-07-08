require 'json'

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

log_id = 1

current_data = {
    id: 1,
    data1: 500,
    data2: 0
}

bef_data = current_data.clone
offset_data = current_data.clone

File.foreach("wg_pipe") {|x|

    print "GOT ", x
    arr = x.split(",")

    log_id += 1

    current_data[:id] = log_id
    current_data[:data1] = arr[1].to_i
    current_data[:data2] = arr[2].to_i

    current_data.each{|key, current_value|
        if key != :id
            offset_data[key] = current_value > bef_data[key] ? current_value - bef_data[key] : current_value
        else
            offset_data[key] = current_value + 1
        end
    }

    File.open("data.json", "wb") {|f| f.write JSON.generate(offset_data) }
}
