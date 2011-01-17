#!/usr/bin/env ruby
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'robustthread'
require 'mycroft'

rt = RobustThread.new do
  Mycroft::Server.start()
end

