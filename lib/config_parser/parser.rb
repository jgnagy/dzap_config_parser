class Parser
  def self.parse(file, format)
    config_data = format.new(file)
    config_data.parse!
    return config_data
  end
end