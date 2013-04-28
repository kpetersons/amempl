unless @Validator
	@Validator = {}
@Validator.is_empty= (collection, object, field) ->
  unless object.messages
    object.messages = []
  if not object[field] or _.isEmpty(object[field])
    object.isValid = false
    message = name: field, message: "#{field}.is_empty"
    object.messages.push  message
  object