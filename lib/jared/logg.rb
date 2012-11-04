module Logg
  def log
    Logg.logger
  end

  # Global, memoized, lazy initialized instance of a logger
  def self.logger
    @logger ||= Logger.new("#{Dir.home}/.jared/logs/#{Time.new.strftime('%I-%M-%S')}-debug.log")
  end
end