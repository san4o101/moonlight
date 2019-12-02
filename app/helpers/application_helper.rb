module ApplicationHelper

  def datepicker(form, field, user)
    form.text_field(field, class: "form-control #{if user.errors[:birthday].any?
                                                    ' is-invalid '
                                                  end }",
                           placeholder: 'dd.mm.yyyy',
                           data: { provide: 'datepicker',
                                   'date-format': 'dd.mm.yyyy' }).html_safe
  end

end
