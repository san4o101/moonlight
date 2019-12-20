module Admin
  module Settings
    class UsersController < AdminController
      before_action :set_user, only: %i[show edit update destroy password password_change]

      # GET /users
      # GET /users.json
      def index
        @users = User.order(:id).page(params[:page])
      end

      # GET /users/1
      # GET /users/1.json
      def show; end

      # GET /users/new
      #def new
      #  @user = User.new
      #end

      # GET /users/1/edit
      def edit; end

      # POST /users
      # POST /users.json
      #def create
      #  @user = User.new(user_params)
      #
      #  respond_to do |format|
      #    if @user.save
      #      format.html do
      #        redirect_to admin_settings_user_path(@user),
      #                    notice: t('user.message.successCreate')
      #      end
      #      format.json do
      #        render :show, status: :created,
      #                      location: admin_settings_user_path(@user)
      #      end
      #    else
      #      format.html { render :new }
      #      format.json { render json: @user.errors, status: :unprocessable_entity }
      #    end
      #  end
      #end

      # PATCH/PUT /users/1
      # PATCH/PUT /users/1.json
      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html do
              redirect_to admin_settings_user_path(@user),
                          notice: t('user.message.successUpdate')
            end
            format.json do
              render :show, status: :ok,
                            location: admin_settings_user_path(@user)
            end
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /users/1
      # DELETE /users/1.json
      def destroy
        @user.destroy
        respond_to do |format|
          format.html do
            redirect_to admin_settings_users_url,
                        notice: t('user.message.successDestroy')
          end
          format.json { head :no_content }
        end
      end

      # GET /users/1/password
      def password; end

      # POST /users/1/password
      def password_change
        if @user.update(password_params)
          if InfoService.new.check_users(@user.id, session[:user_id])
            flash[:warning] = "Enter you new password"
            session.clear
            redirect_to root_path
          else
            flash[:success] = "Password updated!"
            redirect_to admin_settings_user_path(@user)
          end
        else
          render 'admin/settings/users/password'
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:first_name, :last_name, :second_name,
                                     :birthday, :gender, :role, :cities_id,
                                     :phone)
      end

      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end
    end
  end
end