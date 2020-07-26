#!/usr/bin/env ruby

SCRIPT_ROOT = File.dirname(File.expand_path(__FILE__))
require "pp"

files = Dir.glob(SCRIPT_ROOT + "/*.txt").select{|blist| not blist.include?("combined") }


ret = "# created at: #{Time.now.to_s}\n" + files.inject(""){|m, f| m << File.readlines(f).grep(/^[^\#]/).join && m}

File.open(File.join(SCRIPT_ROOT, "combined.txt"), "w+"){|fp| fp.puts(ret)}
