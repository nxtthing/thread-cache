module ThreadCache
  module_function

  KEY = :thread_cache.freeze

  def clear
    ::Thread.current[KEY] = {}
  end

  def fetch(key, id, &block)
    fetch_key(key)[id] ||= block.call(id)
  end

  def fetch_key(key)
    ::Thread.current[KEY][key] ||= {}
  end
end
