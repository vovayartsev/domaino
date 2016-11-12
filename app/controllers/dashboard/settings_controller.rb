module Dashboard
  class SettingsController < BaseController
    def edit
      form Settings::Update, params: {portal_id: current_portal.id}
      render html: concept(cell_class, @form)
    end

    def update
      run Settings::Update, params: {portal_id: current_portal.id, settings: params.require(:reform)} do
        render(json: {status: 'ok'}) and return
      end

      # operation failed...
      render html: concept(cell_class, @form), status: :unprocessable_entity
    end

    private

    def cell_class
       "Settings::Cell::#{params[:id].titlecase}".constantize
    end
  end
end
