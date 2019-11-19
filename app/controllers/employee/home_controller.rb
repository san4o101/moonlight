module Employee
  class HomeController < EmployeeController

    def index
      flash[:success] = t('controllers.employee.homePage')
      render :index
    end

  end
end