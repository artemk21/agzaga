module CheckoutHelper
  def shipment_method_icon name
    case name
    when 'UPS Ground'
      'shipping/Truck.svg'
    when 'UPS Two Day'
      'shipping/Airplane.svg'
    when 'UPS One Day'
      'shipping/RocketLaunch.svg'
    when 'Standard Shipping'
      'shipping/standard.svg'
    when 'Expedited Max 3 days'
      'shipping/expedited.svg'
    else
      'shipping/bicycle.svg'
    end
  end

  def show_svg path
    File.open("app/assets/images/#{path}", "rb") do |file|
      raw file.read
    end
  end

  def ag_text_field(form, field_name, label_text, options={})
    is_required_field = options[:required] == true

    content_tag :label, class: "poppins-text-16 custom-field #{options[:class]}", id: options[:id] do
      form.text_field(field_name, class: "form-control custom-field-input #{'required' if is_required_field}", autocomplete: options[:autocomplete], required: is_required_field, id: "#{options[:id]}-field") +
      content_tag(:span, label_text, class: 'placeholder') +
      content_tag(:div, (is_required_field ? "This field is required" : ''), class: 'invalid-feedback text-left')
    end
  end

  def ag_email_field(form, field_name, label_text, options={})
    is_required_field = options[:required] == true

    content_tag :label, class: "poppins-text-16 custom-field #{options[:class]}", id: options[:id] do
      form.email_field(field_name, class: "form-control custom-field-input #{'required' if is_required_field}", autocomplete: options[:autocomplete], required: is_required_field, id: "#{field_name}-field") +
      content_tag(:span, label_text, class: 'placeholder') +
      content_tag(:div, (is_required_field ? "Please enter a valid email address." : ''), class: 'invalid-feedback email-field-error text-left')
    end
  end
end

# touched on 2025-07-09T19:46:07.142740Z
# touched on 2025-07-09T20:36:11.221931Z
# touched on 2025-07-09T20:40:57.328522Z