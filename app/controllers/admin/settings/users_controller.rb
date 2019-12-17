module Admin
  module Settings
    class UsersController < AdminController
      before_action :set_user, only: %i[show edit update destroy]

      # GET /cities
      # GET /cities.json
      def index
        @users = User.order(:id).page(params[:page])
      end

      # GET /cities/1
      # GET /cities/1.json
      def show; end

      # GET /cities/new
      #def new
      #  @user = User.new
      #end

      # GET /cities/1/edit
      def edit; end

      # POST /cities
      # POST /cities.json
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

      # PATCH/PUT /cities/1
      # PATCH/PUT /cities/1.json
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

      # DELETE /cities/1
      # DELETE /cities/1.json
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
    end
  end
end