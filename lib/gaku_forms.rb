require 'gaku_forms/helper'
require 'gaku_forms/engine'
require 'gaku_forms/form_builders/validate_form_builder'
require 'gaku_forms/form_builders/validate_nested_form_builder'

module GakuForms
end

ActionView::Base.send :include, GakuForms::Helper
