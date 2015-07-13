require 'date'
require 'json'
require 'clockwork'
include Clockwork

every(30.seconds, 'koko') do
    date = nil

    File.foreach("date.json") {|x|
        print "GOT ", x
        datea = JSON.parse(x).date
        date = DateTime.parse(datea)
    }

    File.open("date.json", "wb") {|f|
        new_sec = date.to_time.to_s + 30
        new_datetime = DateTime.parse(new_sec)
        f.write JSON.generate({date: new_datetime.to_s})
    }
end
