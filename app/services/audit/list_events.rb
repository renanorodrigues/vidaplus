module Audit
  class ListEvents
    def initialize(params)
      @params = params
    end

    def call
      events = service.order(created_at: :desc)
      events.map { |event| presenter(event) }
    end

    private

    def service
      PaperTrail::Version
    end

    def presenter(event)
      Presenter.new(event).as_json
    end
  end
end