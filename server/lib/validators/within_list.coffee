unless @Validator
	@Validator = {}
@Validator.isWithinList= (collection, object, field, list) ->
	if object.isValid != false
  	object.isValid = true
  unless object.messages
    object.messages = []
    test = object[field]
    if _.indexOf(list, test) == -1
      object.isValid = false
      message = name: field, message: "#{field}.is_not_within_list"
      object.messages.push  message
  object

@Validator.isNotWithinList= (collection, object, field, list) ->
	if object.isValid != false
  	object.isValid = true
  unless object.messages
    object.messages = []
    test = object[field]
    if _.indexOf(list, test) != -1
      object.isValid = false
      message = name: field, message: "#{field}.is_within_list"
      object.messages.push  message
  object  