module PhantomForms
  module Helper

    def remote_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:remote] = true
      content_tag :div, class: "col-md-12" do
        content_tag :div, class: "well" do
          form_for(object, options, &block)
        end
      end
    end

    def remote_form_panel_for(object, panel_title = nil, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:remote] = true
      content_tag :div, class: "panel panel-primary" do
        [
          if panel_title
            content_tag :div, class: "panel-heading" do
              content_tag :h3, class: "panel-title" do
                panel_title
              end
            end
          end,
          content_tag(:div, class: "panel-body") do
            form_for(object, options, &block)
          end,
          content_tag(:div, class: "panel-footer") do
            buttons_for object
          end
        ].join.html_safe
      end
    end

    def normal_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:html] = {:class => 'normal-form form'}
      content_tag :div, class: "row" do
        content_tag :div, class: "span12 well" do
          form_for(object, options, &block)
        end
      end
    end

    def modal_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:html] = {:'data-type' => 'script', :class => 'remote-form'}
      options[:remote] = true
      form_for(object, options, &block)
    end

    def normal_modal_form_for(object, options = {}, &block)
      options[:validate] = true
      options[:builder] = PhantomForms::FormBuilders::ValidateFormBuilder
      options[:html] = {:'data-type' => 'script', :class => 'normal-form'}
      form_for(object, options, &block)
    end

    def buttons_for(object, options = {})
      object_name = get_class(object)
      object_class = options[:nested_id] ||  object_name

      locale_name =  object_name.underscore
      locale = options[:label] || t("#{locale_name}.save")

      content_tag :div, :class => 'row' do
        [
          content_tag(:div, :class => 'col-md-9') do
            concat submit_button( locale , :id => "submit-#{object_class}-button")
          end,
          content_tag(:div, :class => 'col-md-3') do
            concat link_to_cancel( :id => "cancel-#{object_class}-link")
          end
        ].join.html_safe
      end
    end

    def modal_buttons_for(object, options = {})
      object_name = get_class(object)
      object_class = options[:nested_id] ||  object_name

      locale_name =  object_name.underscore
      locale = options[:label] || t("#{locale_name}.save")

      content_tag :div, :class => 'row' do
        content_tag :div, :class => 'col-md-12' do
          concat submit_button( locale , :id => "submit-#{object_class}-button")
          concat link_to_modal_cancel( :id => "cancel-#{object_class}-link")
        end
      end
    end


    private

    def get_class(object)
      object_class_name = object.class.to_s.underscore.dasherize.split('/').last
      if object_class_name.include? '-decorator'
        object_class_name.split('-decorator').first
      else
        object_class_name
      end
    end

  end
end
