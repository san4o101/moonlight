module Employee
  class HomeController < EmployeeController

    def index
      flash[:success] = 'Employee page!'
      render :index
    end

  end
end