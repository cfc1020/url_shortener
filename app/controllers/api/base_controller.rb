module Api
  class BaseController < ActionController::Base
    protect_from_forgery with: :exception

    protected

    def respond_resource(resource, status = nil)
      resource ||= OpenStruct.new(errors: ['Something went wrong'])

      if resource.errors.blank? && resource.valid?
        respond_success(resource, status)
      else
        respond_failure(resource)
      end
    end

    def respond_success(resource, status = :ok)
      # We do not follow json api soecification here
      render json: resource, status: status
    end

    def respond_failure(resource, status = :bad_request)
      # We do not follow json api soecification here
      render json: { errors: resource.errors }, status: status
    end
  end
end
