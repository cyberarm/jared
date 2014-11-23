module Logg
  def log
    Logg.logger
  end

  def self.logger
    if File.exists?("#{Dir.home}/.jared/logs/#{Time.new.strftime('%m-%d-%y-%H')}-debug.log")
      @file = File.open("#{Dir.home}/.jared/logs/#{Time.new.strftime('%m-%d-%y-%H')}-debug.log", 'a')
      @logger ||= Logger.new(@file)
    else
      @logger ||= Logger.new("#{Dir.home}/.jared/logs/#{Time.new.strftime('%m-%d-%y-%H')}-debug.log")
    end
  end
end
