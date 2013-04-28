unless @Validator
	@Validator = {}
@Validator.is_number= (collection, object, field) ->
  unless object.messages
    object.messages = []
  if _.isNumber(object[field])
    object.isValid = false
    message = name: field, message: "#{field}.is_not_number"
    object.messages.push  message
  object