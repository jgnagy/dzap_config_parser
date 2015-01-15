# The Parser class is the entry point to the gem. Use it to access config files.
class Parser
  # All the work is done here. This class method is just used to perform some simple sanity checks on the input and return a config.
  # @param file [String] The path to the config file to parse
  # @param format [Class] The config file format class to use in parsing. Must be a subclass on {Format}.
  # @raise [StandardError] Raises an exception if the specified format is invalid.
  # @return [Format] The parsed config file, represented as an instance of the {Format} class specified.
  def self.parse(file, format)
    raise StandardError, "Invalid Format" unless format.instance_of? Class and format.ancestors.include?(Format)
    config_data = format.new(file)
    config_data.parse! # real work is handed off to Format class
    return config_data
  end
end