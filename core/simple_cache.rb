module SimpleCache
  @cache = {}
  class << self
    def store_in_cache(key, value)
      @cache[key] = value
    end

    def retrieve(key)
      return @cache[key] unless @cache[key].nil?
      value = yield
      store_in_cache(key, value)
    end
  end
end
