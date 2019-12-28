module Admin
  module Settings

    class CountriesController < AdminController
      before_action :set_country, only: [:show, :edit, :update, :destroy]
      add_breadcrumb I18n.t('breadcrumbs.country.index'),
                     :admin_settings_countries_path

      # GET /countries
      # GET /countries.json
      def index
        @countries = Country.order(:name).page(params[:page])
      end

      # GET /countries/1
      # GET /countries/1.json
      def show
        render_breadcrumbs
      end

      # GET /countries/new
      def new
        add_breadcrumb I18n.t('breadcrumbs.country.new'),
                       :new_admin_settings_country_path
        @country = Country.new
      end

      # GET /countries/1/edit
      def edit
        render_breadcrumbs
        add_breadcrumb I18n.t('breadcrumbs.country.edit'),
                       :edit_admin_settings_country_path
      end

      # POST /countries
      # POST /countries.json
      def create
        @country = Country.new(country_params)

        respond_to do |format|
          if @country.save
            format.html do
              redirect_to admin_settings_country_path(@country),
                          notice: t('country.successCreate')
            end
            format.json do
              render :show, status: :created,
                     location: admin_settings_country_path(@country)
            end
          else
            format.html { render :new }
            format.json { render json: @country.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /countries/1
      # PATCH/PUT /countries/1.json
      def update
        respond_to do |format|
          if @country.update(country_params)
            format.html do
              redirect_to admin_settings_country_path(@country),
                          notice: t('country.successUpdate')
            end
            format.json do
              render :show, status: :ok,
                     location: admin_settings_contry_path(@country)
            end
          else
            format.html { render :edit }
            format.json { render json: @country.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /countries/1
      # DELETE /countries/1.json
      def destroy
        @country.destroy
        respond_to do |format|
          format.html do
            redirect_to admin_settings_contries_path,
                        notice: t('country.successDestroy')
          end
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_country
        @country = Country.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def country_params
        params.require(:country).permit(:name, :short_code, :phone_code,
                                        :nickname)
      end

      def render_breadcrumbs
        add_breadcrumb I18n.t('breadcrumbs.country.show', country: @country.name),
                       :admin_settings_country_path
      end
    end

  end
end