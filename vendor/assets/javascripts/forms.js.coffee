formBuilder =
  add: (element, settings, message) ->
    if element.data("valid") isnt false
      element.data "valid", false
      element.parent().parent().addClass "error"
      element.parent().find(".message").addClass "error help-inline"
      $('<span/>').addClass('help-inline').text(message).appendTo(element.parent())

  remove: (element, settings) ->
    element.parent().parent().removeClass('error')
    element.parent().find(".message").removeClass "error help-inline"
    element.parent().find('span.help-inline').remove()
    element.data "valid", true


window.Rails4ClientSideValidations.formBuilders["GakuForms::FormBuilders::ValidateFormBuilder"] = formBuilder

$ ->

  window.Rails4ClientSideValidations.callbacks.element.fail = (element, message, callback) ->
    callback()
    if element.data("valid") isnt false
      element.parent().parent().addClass "error"
      element.parent().find(".message").addClass "error help-inline"
