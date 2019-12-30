module ApplicationHelper

  def datepicker(form, field, user)
    form.text_field(field, class: "form-control #{if user.errors[:birthday].any?
                                                    ' is-invalid '
                                                  end }",
                           placeholder: t('placeholders.birthday'),
                           data: { provide: 'datepicker',
                                   'date-format': 'dd.mm.yyyy' }).html_safe
  end

  def redirect_to_role_route(user)
    return info_path(user) if user.full_name?
    return admin_home_path if user.admin_role?
    employee_home_path if user.user_role?
  end

end
