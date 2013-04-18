unless @Validator
  @Validator = {}
@Validator.reference_exists= (collection, object, sourceField, targetField) ->
  unless object.messages
    object.messages = []
  query = {}
  query[targetField] = object[sourceField]
  test = collection.find(query).count()
  if test == 0
    object.isValid = false
    message = name: sourceField, message: "#{sourceField}.reference_not_exists"
    object.messages.push  message
  object
	