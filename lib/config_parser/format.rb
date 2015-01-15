# The basic methods used to interact with a config file are contained here. Subclasses *must* override 
# the #initialize and #parse! methods.
class Format
  def initialize
    @config = {}
    @pattern = // # needs to be overridden
    @comment_characters = []
  end

  # Handy way to check if this config contains a property
  # @param key [String,Symbol] The property to check for.
  # @return [Boolean] Does this config contain this property?
  def include?(key)
    @config.key?(key.to_s)
  end

  # This method allows reading from the config like a Hash
  # @param key [String,Symbol] The property to read.
  # @return [Object] Value for this property (or nil if it doesn't exist)
  def [](key)
    if include?(key.to_s)
      @config[key.to_s]
    else
      nil
    end
  end

  # Returns all the keys available in this config, as an Array
  # @return [Array] All the available properties.
  def keys
    @config.keys
  end

  # This method *must* be overridden, as most work should happen here.
  def parse!
    false
  end

  # This allows interacting with the configuration as a Struct, passing methods for property names.
  def method_missing(method_name, *args, &block)
    include?(method_name.to_s) ? @config[method_name.to_s] : super
  end

  def respond_to?(method_name)
    include?(method_name.to_s) ? true : super
  end
end