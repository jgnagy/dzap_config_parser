class Format
  def initialize
    @config = {}
    @pattern = // # needs to be overridden
    @comment_characters = []
  end

  def include?(key)
    @config.key?(key)
  end

  def [](key)
    if include?(key.to_s)
      @config[key.to_s]
    else
      nil
    end
  end

  def keys
    @config.keys
  end

  def parse!
    false
  end

  def method_missing(method_name, *args, &block)
    include?(method_name.to_s) ? @config[method_name.to_s] : super
  end

  def respond_to?(method_name)
    include?(method_name.to_s) ? true : super
  end
end