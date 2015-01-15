module Formats
  class DZAP < Format
    def initialize(file)
      @config             = {}
      @file               = file
      @pattern            = /^([a-zA-Z_-]+)\s*=\s*["']?(.+)["']?$/
      @comment_characters = ['#']
    end

    def parse!
      File.open(@file).each_line do |line|
        next if @comment_characters.include?(line[0])
        if line.match(@pattern)
          key, value = line.match(@pattern)[1,2]
          typed_value = case value
            when /^[0-9]+$/
              Integer(value)
            when /^[0-9]+\.[0-9]+$/
              Float(value)
            when /^([Tt]rue|[Yy]es|[Oo]n)$/
              true
            when /^([Ff]alse|[Nn]o|[Oo]ff)$/
              false
            else
              value
            end 
          @config[key] = typed_value
        else
          puts "Unable to parse line: #{line}"
        end
      end
    end
  end
end