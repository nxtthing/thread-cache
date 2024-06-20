module ThreadCache
  class RackMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      ThreadCache.clear
      @app.call(env)
    ensure
      ThreadCache.clear
    end
  end
end
