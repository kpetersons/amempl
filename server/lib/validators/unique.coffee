unless @Validator
	@Validator = {}
@Validator.uniqueness= (collection, object, field) ->
	query = {}  
	query[field] = object[field]
	if object._id
		query['_id'] = $ne: object._id
	test = collection.findOne query
	messages = {}
	unless object.messages
		object.messages = []
	if test	
    object.isValid = false
		message = name: field, message: "#{field}.not_unique"
		object.messages.push  message
	object