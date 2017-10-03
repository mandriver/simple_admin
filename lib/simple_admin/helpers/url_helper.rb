module SimpleAdmin
  module Helpers
    module UrlHelper
      include Rails.application.routes.url_helpers

      def resource_link(resource, method, namespace=:admin)
        singular_name = resource.class.model_name.element
        plural_name = singular_name.pluralize

        postfix = :path

        case method
        when :index
          resource_path = "#{namespace}_#{plural_name}_#{postfix}"
        when :new
          resource_path = "#{method}_#{namespace}_#{singular_name}_#{postfix}"
        when :create
          resource_path = "#{namespace}_#{plural_name}_#{postfix}"
        when :edit
          resource_path = "#{method}_#{namespace}_#{singular_name}_#{postfix}"
        when :update
          resource_path = "#{namespace}_#{singular_name}_#{postfix}"
        when :destroy
          resource_path = "#{namespace}_#{singular_name}_#{postfix}"
        end

        public_send(resource_path, resource)
      end
    end
  end
end
