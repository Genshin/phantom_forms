require 'phantom_forms/helper'
require 'phantom_forms/engine'
require 'phantom_forms/form_builders/validate_form_builder'

module PhantomForms
end

ActionView::Base.send :include, PhantomForms::Helper
