module Admin
  class EntitiesController < BaseController
    include SimpleAdmin::CrudControllerHelper

    before_action only: [:new, :edit] do
      Rails.application.eager_load!
    end

    def model_klass
      SimpleAdmin::Entity
    end

    def redirect_path
      admin_entities_path
    end

    private

    def resource_params
      params.require(:simple_admin_entity).permit(:name)
    end
  end
end
