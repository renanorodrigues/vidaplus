module Audit
  class Presenter
    def initialize(event)
      @event = event
    end

    def as_json(*)
      {
        identificador: @event.id,
        entidade: @event.item_type,
        evento: @event.event,
        usuario_id: @event.whodunnit,
        data_criacao: @event.created_at,
        conteudo: @event&.object
      }
    end

    private

    def render_conteudo
      @event.object || {}
    end
  end
end
