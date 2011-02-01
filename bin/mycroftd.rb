#!/usr/bin/env ruby
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'robustthread'
require 'mycroft' 
require 'thor'

class Mycroft::Engine < RobustThread
end                 
             
class Mycroft::Daemon < Thor
  
  map "-D" => :daemonize
  default_task :start
           
  desc 'start', "Start"
  def start
    rt = Mycroft::Engine.new(:label => "the Mycroft Server Manager") do
      Mycroft::Server.start()
    end
  end
  
  desc 'daemonize', "Daemonize"
  def daemonize
    pid = fork do
      start
    end
    Process.detach pid          
    File.open(File.expand_path("~/.mycroftd_pid"), 'w+') {|f| f.write(pid) }
  end                                                                
  
  desc 'stop', "Stop Daemon"
  def stop  
      if File.exist? File.expand_path("~/.mycroftd_pid")
        pid = IO.read(File.expand_path("~/.mycroftd_pid")).to_i
        Process.kill "HUP", pid
        if File.writable? File.expand_path("~/.mycroftd_pid")
          File.delete File.expand_path("~/.mycroftd_pid")
        else
          raise "Mycroftd was terminated but its pidfile couldn't be deleted."
        end
      else
        raise "Either mycroftd isn't running or no pidfile exists at ~/.mycroft_pid"
      end
  end
               
end                   

Mycroft::Daemon.start