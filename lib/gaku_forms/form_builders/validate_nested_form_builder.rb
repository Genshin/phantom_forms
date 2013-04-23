require 'nested_form/builder_mixin'

module GakuForms
  module FormBuilders

    class ValidateNestedFormBuilder < ValidateFormBuilder
      include ::NestedForm::BuilderMixin
    end

  end
end
