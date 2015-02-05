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


window.ClientSideValidations.formBuilders["PhantomForms::FormBuilders::ValidateFormBuilder"] = formBuilder

manage_form_hiding = (resource) ->
  console.log resource
  resource_new_link = "#new-" + resource + "-link"
  resource_form = "#new-" + resource
  console.log 'resource_new_link: ' + resource_new_link
  console.log 'resource_form: ' + resource_form
  $(resource_new_link).show()
  $(resource_form).slide()


ready = ->

  window.ClientSideValidations.callbacks.element.fail = (element, message, callback) ->
    callback()
    if element.data("valid") isnt false
      element.parent().parent().addClass "error"
      element.parent().find(".message").addClass "error help-inline"


  $(document).off('click', '.cancel-link').on "click",".cancel-link", (e) ->
    e.preventDefault()
    if $(e.target).parents('.modal-body').length is 0
      resource = $(this).attr("id").replace("cancel-", "").replace("-link", "")
      manage_form_hiding(resource)

  $(document).off('click', '.close').on "click",".close", (e) ->
    e.preventDefault()
    if $(e.target).parents('.modal').length is 0
      resource = $(this).attr("id").replace("close-", "").replace("-button", "")
      manage_form_hiding(resource)

  $(document).off('click', '.close-form').on "click",".close-form", (e) ->
    console.log 'close-form click'
    e.preventDefault()
    resource = $(this).attr("id").replace("close-", "").replace("-button", "")
    manage_form_hiding(resource)

$(document).ready(ready)
$(window).bind('page:change', ready)