@commands=[]
@path="#{Dir.home}/.jared/plugins"
log.info "Plugin count: #{@plugins.count}"
@plugins.each do |plugin|
  puts "Plugin for '#{ARGV[0]}' not found." unless plugin[:command].downcase == ARGV[0].downcase
  next unless plugin[:command].downcase == ARGV[0].downcase
  if plugin[:command].downcase == ARGV[0].downcase
    require_relative "#{@path}/#{plugin[:name]}/#{plugin[:main_require]}"
  end
end