
module OBD
  class Connection
    def serial_port
      @serial_port
    end
  end
end

require 'obd'

obd, err = OBD.connect '/dev/tty.Bluetooth-Incoming-Port', 9600

puts obd.inspect

if err
  puts err
else
  OBD::Command.pids.keys.each do |k|
    puts obd[k.to_sym]
  end
end
