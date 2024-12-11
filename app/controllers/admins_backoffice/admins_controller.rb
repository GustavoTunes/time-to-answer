class AdminsBackoffice::AdminsController < AdminsBackofficeController
  before_action :set_admin, only: [:edit, :update]
  before_action :verify_password, only: [:update]

  def index
    @admins = Admin.all
  end

  def edit
  end

  def update
    if @admin.update(params_admin)
      redirect_to admins_backoffice_admins_path, notice:"Administrator sucessfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end     
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def params_admin
    params_admin = params.require(:admin).permit(:email, :password, :password_confirmation)
  end

  def verify_password
    if params[:admin][:password].blank? && params[:admin][:password_confirmation].blank?
      params[:admin].extract!(:password, :password_confirmation)
    end
  end

end
