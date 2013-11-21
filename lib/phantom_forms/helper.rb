module PhantomForms
  module Helper

    def remote_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:remote] = true
      options[:html] = {:class => 'remote-form form'}

      object_name = get_class(extract_object(object))
      object_class = options[:resource] || object_name
      label = options[:label] || t("#{object_name.underscore}.singular")

      content_tag :div, class: "panel panel-primary" do
        concat(panel_title(label, slide_form_close_button(object_class)))
        concat(content_tag(:div, class: "panel-body") { form_for(object, options, &block) })
      end
    end

    def normal_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:html] = {:class => 'normal-form form'}

      object_name = get_class(extract_object(object))
      object_class = options[:resource] || object_name
      label = options[:label] || t("#{object_name.underscore}.singular")

      content_tag :div, class: "panel panel-primary" do
        concat(panel_title(label, slide_form_close_button(object_class))) unless label == 'nil'
        concat(content_tag(:div, class: "panel-body") { form_for(object, options, &block) })
      end
    end

    def modal_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:html] = {:'data-type' => 'script', :class => 'remote-form'}
      options[:remote] = true

      object_name = get_class(extract_object(object))
      object_class = options[:resource] || object_name
      label = options[:label] || t("#{object_name.underscore}.singular")

      content_tag :div, class: "col-md-12 alert-dismissable" do
        content_tag :div, class: "panel panel-primary" do
          concat(panel_title(label, modal_close_button))
          concat(content_tag(:div, class: "panel-body") { form_for(object, options, &block) })
        end
      end
    end

    def normal_modal_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:html] = {:'data-type' => 'script', :class => 'normal-form'}

      object_name = get_class(extract_object(object))
      object_class = options[:resource] || object_name
      label = options[:label] || t("#{object_name.underscore}.singular")

      content_tag :div, class: "panel panel-primary" do
        concat(panel_title(label, modal_close_button))
        concat(content_tag(:div, class: "panel-body") { form_for(object, options, &block) })
      end
    end

    def buttons_for(object, options = {})
      object_name = get_class(object)
      object_class = options[:resource] || object_name

      locale_name =  object_name.underscore
      locale = options[:label] || t("#{locale_name}.save")
      content_tag :div, class: 'row' do
        content_tag :div, class: 'col-xs-12' do
          submit_button(locale, :id => "submit-#{object_class}-button")
        end
      end
    end

    def modal_form_error(id)
      content_tag :div, nil, :id => id
    end

    def get_class(object)
      object_class_name = object.class.to_s.underscore.dasherize.split('/').last
      if object_class_name.include? '-decorator'
        object_class_name.split('-decorator').first
      else
        object_class_name
      end
    end

    private

    def extract_object(object)
      if object.kind_of?(Array)
        object.last
      else
        object
      end
    end

    def slide_form_close_button(object_class)
      content_tag :button, id: "close-#{object_class}-button", :class => 'close-form' do
        "&times".html_safe
      end
    end

  end
end
