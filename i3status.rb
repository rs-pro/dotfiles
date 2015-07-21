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
smart = Cocaine::CommandLine.new('sudo', "hddtemp -q -n :disk")

disks = {}

IO.popen("i3status --config ~/.i3status.conf") do |io|
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
        print "," if comma
        puts Yajl.dump(data)
        sleep 0.2
        comma = true
      end
    end
  end
end

