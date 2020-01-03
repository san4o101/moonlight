module ApplicationHelper

  def datepicker(form, field, model)
    form.text_field(field, class: "date form-control #{if model.errors[field].any?
                                                         ' is-invalid '
                                                       end }",
                           data: { provide: 'datepicker',
                                   'date-format': 'dd.mm.yyyy' }).html_safe
  end

  def redirect_to_role_route(user)
    return info_path(user) if user.full_name?
    return admin_home_path if user.admin_role?
    employee_home_path if user.user_role?
  end

  def random_admin
    User.admins.sample
  end

end
