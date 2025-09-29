module Audit
  class ListEvents
    def initialize(params)
      @params = params
    end

    def call
      # Retorna a lista de eventos via PaperTrail
      # Pode adicionar filtros aqui se necessário
    end
  end
end