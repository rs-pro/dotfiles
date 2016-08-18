#!/usr/bin/ruby

require 'rubygems'
require 'yajl'
require 'io/wait'
require 'cocaine'
require 'thread'
require 'timeout'

lang_colors = {'us' => '009E00', 'ru' => 'C60101'}

LED_STATUSES_CMD = 'xset q | grep "LED mask"'
LED_MASKS = [
    ['caps',   0000000001,   'CAPS',   '#DC322F'],
    #['num',    0b0000000010,    'NUM',   '#859900'],
    #['scroll', 0b0000000100, 'SCROLL',   '#2AA198'],
    #['altgr',  0b1111101000,  'ALTGR',   '#B58900']
]

Thread.abort_on_exception = true

cmd = Cocaine::CommandLine.new('df', '-P -l -k :disk')
#smart = Cocaine::CommandLine.new('sudo', "smartctl -A -d sat :disk | grep Temperature_Cels | awk '{ print $10 }'")
smart = Cocaine::CommandLine.new('sudo', "hddtemp -q -n :disk")

disks = {}

# Thread.new do
#   loop do
#     disks.each_pair do |k, v|
#       # next if !v.nil? && v == ''
#       begin
#         Timeout::timeout(5) do
#           rval = cmd.run(disk: k.to_s)
#           rval.split(/\r?\n/).each do |line|
#             next unless line =~ /^(.+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(.+)\s+(.+)$/
#             device = $1.strip.gsub(/[0-9]/, '')
#             # puts smart.command(disk: device.to_s)
#             temp = smart.run(disk: device.to_s).strip
#             disks[k] = temp
#           end
#         end
#       rescue Exception => e
#         puts "#{e.class.name}: #{e.message}"
#         puts e.backtrace.join("\n")
#       end
#     end
#     sleep 120 unless disks.empty?
#   end
# end

IO.popen("i3status --config ~/.i3/status.conf") do |io|
  loop do
    raw = io.gets
    next if raw.nil?
    #p raw
    if raw.strip == "[" || raw[0] == '{'
      puts raw
    else
      if raw[0] == ','
        raw[0] = ''
        comma = true
      else
        comma = false
      end
      orig_data = Yajl.load(raw)
      orig_data.each do |d|
        next if d['full_text'].nil?
	
	
# 	if d['name'] == 'disk_info'
#           if disks[d['instance']].nil?
#             disks[d['instance']] = '-'
#           end
#           temp = disks[d['instance']]
#           if temp != '0'
#             temp = temp.to_i if temp != '-'
#             if temp != '-' && temp > 45
#               d['color'] = '#FF0000'
#             end
#             d['full_text'] += ", #{temp}°"
#           end
#         end
        
        d['full_text'].gsub!(': yes', '')
        d['full_text'].gsub!(': no', '')
      end

      100.times do
        break if io.ready?
        
        data = orig_data.clone
        lang = `xkblayout-state print "%s"`
        data.unshift({full_text: lang.upcase, color: "##{lang_colors[lang]}"})

        leds = `#{LED_STATUSES_CMD}`
        led_data = leds.match(/[0-9]{8}/)
        unless led_data.nil?
          ld = led_data[0].to_i
          LED_MASKS.each do |lm|
            if ld & lm[1] > 0
              data.unshift({full_text: lm[2], color: lm[3]})
            end
          end
        end
        data.push({name: "tztime", full_text: Time.now.to_s})
	# data.push({full_text: $unread.to_s, color: $unread > 0 ? '#FF0000' : '#00FF00'})

        print "," if comma
        puts Yajl.dump(data)
        sleep 0.2
        comma = true
      end
    end
  end
end

