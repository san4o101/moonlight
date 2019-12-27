module Employee

  class BillsController < EmployeeController
    before_action :set_user
    before_action :my_bill?, only: %i[show edit update destroy]
    before_action :set_bill, only: %i[show edit update destroy]

    def index
      @bills = Bill.my_bills @current_user.id
    end

    # GET /bills/1
    # GET /bills/1.json
    def show; end

    # GET /bills/new
    def new
      @bill = Bill.new
    end

    # GET /bills/1/edit
    def edit; end

    # POST /bills
    # POST /bills.json
    def create
      @bill = Bill.new(bill_params)

      respond_to do |format|
        if @bill.save
          format.html { redirect_to employee_bills_path, notice: t('user.message.successCreateBill') }
          format.json { render :show, status: :created, location: employee_bills_path }
        else
          format.html { render :new }
          format.json { render json: @bill.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /bills/1
    # PATCH/PUT /bills/1.json
    def update
      respond_to do |format|
        if @bill.update(bill_params)
          format.html { redirect_to employee_bills_path, notice: t('user.message.successUpdateBill') }
          format.json { render :show, status: :ok, location: employee_bills_path }
        else
          format.html { render :edit }
          format.json { render json: @bill.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /bills/1
    # DELETE /bills/1.json
    def destroy
      @bill.destroy
      respond_to do |format|
        format.html { redirect_to employee_bills_url, notice: t('user.message.successDestroyBill') }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bill_params
      params[:bill][:users_id] = pundit_user.id
      params.require(:bill).permit(:bill_type, :users_id)
    end
  end

end