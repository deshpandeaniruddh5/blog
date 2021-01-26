ActiveAdmin.register User do
  permit_params :email
  action_item :index , only: :show do
  	link_to "Articles" ,params[:id]+'/articles'
  end

  controller do
    def create
      @user = User.new(permitted_params[:user])
      @user.save
    end
  end
end
