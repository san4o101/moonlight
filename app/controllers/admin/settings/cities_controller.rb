module Admin
  module Settings
    class CitiesController < AdminController
      before_action :set_city, only: %i[show edit update destroy]
      add_breadcrumb I18n.t('breadcrumbs.city.index'),
                     :admin_settings_cities_path

      # GET /cities
      # GET /cities.json
      def index
        @cities = City.order(:name).page(params[:page])
      end

      # GET /cities/1
      # GET /cities/1.json
      def show
        render_breadcrumbs
      end

      # GET /cities/new
      def new
        add_breadcrumb I18n.t('breadcrumbs.city.new'),
                       :new_admin_settings_city_path
        @city = City.new
      end

      # GET /cities/1/edit
      def edit
        render_breadcrumbs
        add_breadcrumb I18n.t('breadcrumbs.city.edit'),
                       :edit_admin_settings_city_path
      end

      # POST /cities
      # POST /cities.json
      def create
        @city = City.new(city_params)

        respond_to do |format|
          if @city.save
            format.html do
              redirect_to admin_settings_city_path(@city),
                          notice: t('city.successCreate')
            end
            format.json do
              render :show, status: :created,
                            location: admin_settings_city_path(@city)
            end
          else
            format.html { render :new }
            format.json { render json: @city.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /cities/1
      # PATCH/PUT /cities/1.json
      def update
        respond_to do |format|
          if @city.update(city_params)
            format.html do
              redirect_to admin_settings_city_path(@city),
                          notice: t('city.successUpdate')
            end
            format.json do
              render :show, status: :ok,
                            location: admin_settings_city_path(@city)
            end
          else
            format.html { render :edit }
            format.json { render json: @city.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /cities/1
      # DELETE /cities/1.json
      def destroy
        @city.destroy
        respond_to do |format|
          format.html do
            redirect_to admin_settings_cities_url,
                        notice: t('city.successDestroy')
          end
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_city
        @city = City.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def city_params
        params.require(:city).permit(:name, :country_id)
      end

      def render_breadcrumbs
        add_breadcrumb I18n.t('breadcrumbs.city.show', city: @city.name),
                       :admin_settings_city_path
      end
    end
  end
end