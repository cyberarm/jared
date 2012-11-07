@commands=[]
@path="#{Dir.home}/.jared/plugins"
log.info "Plugin count: #{@plugins.count}"
@found=false
@plugins.each do |plugin|
  next unless defined?(ARGV[0].length)
  next unless plugin[:command].downcase == ARGV[0].downcase
  if plugin[:command].downcase == ARGV[0].downcase
    begin
      require_relative "#{@path}/#{plugin[:name]}/#{plugin[:main_require]}"
    rescue LoadError
      spec=Gem::Specification.find_by_name("jared")
      require_relative "#{spec.gem_dir}/lib/jared/core/#{plugin[:name].downcase}/#{plugin[:main_require]}"
    end
    @found=true
  end
end

if ARGV[0] && ARGV[0].length <= 1
  require_relative "core/greeting/lib/greeting"
  Action::Greet.greet
else
  puts "Plugin for '#{ARGV[0]}' not found." unless @found
end