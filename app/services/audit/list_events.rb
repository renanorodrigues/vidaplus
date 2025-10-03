module Audit
  class ListEvents
    def initialize(params)
      @params = params
      @service = PaperTrail::Version
    end

    def call
      @service.order(created_at: :desc)
    end
  end
end