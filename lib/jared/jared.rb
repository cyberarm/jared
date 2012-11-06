@commands=[]
@path="#{Dir.home}/.jared/plugins"
log.info "Plugin count: #{@plugins.count}"
@found=false
@plugins.each do |plugin|
  next unless plugin[:command].downcase == ARGV[0].downcase
  if plugin[:command].downcase == ARGV[0].downcase
    begin
      require_relative "#{@path}/#{plugin[:name]}/#{plugin[:main_require]}"
    rescue LoadError
      require_relative "#{Dir.pwd}/jared/core/#{plugin[:name].downcase}/#{plugin[:main_require]}"
    end
    @found=true
  end
end

puts "Plugin for '#{ARGV[0]}' not found." unless @found