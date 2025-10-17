module Auditoria
  class SearchEventos
    def initialize(params)
      @params = params
    end

    def call
      if @params[:action] == default_action
        events = service.order(created_at: :desc).limit(10)
        events.map { |event| presenter(event) }
      else
        event = service.find(@params[:id])
        presenter(event)
      end
    end

    private

    def service
      PaperTrail::Version
    end

    def presenter(event)
      Presenter.new(event).as_json
    end

    def default_action
      "index"
    end
  end
end
