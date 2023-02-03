class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request
  before_action :check_access

  def current_user
    current_user = $current_user
  end

  def check_access
    default_roles = YAML.load(File.read(Rails.root.to_s + '/config/roles.yml'))
    permission = default_roles[current_user.role][params[:controller]]
    unless permission.include?(params[:action])
       render json: {error: "You are not seller" }, status: :unauthorized
    end
  end

  private

  def authenticate_request
    header = request.headers["token"]
    header = header.split(" ").last if header 
    decoded = jwt_decode(header)
    $current_user = User.find(decoded[:user_id])
  end 
end
