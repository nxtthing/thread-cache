module ThreadCache
  module ActiveJob
    extend ActiveSupport::Concern

    included do
      around_perform do |_job, block|
        ThreadCache.clear
        block.call
        ThreadCache.clear
      end
    end
  end
end
