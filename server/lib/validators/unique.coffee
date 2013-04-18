unless @Validator
	@Validator = {}
@Validator.uniqueness= (collection, object, field) ->
	query = {}  
	query[field] = object[field]
	console.log 'object._id', object._id
	if object._id
		query['_id'] = $ne: object._id
	console.log 'query', query
	test = collection.findOne query
	console.log test
	messages = {}
	if object.isValid != false
  	object.isValid = true
	unless object.messages
		object.messages = []
	if test	
    object.isValid = false
		message = name: field, message: "#{field}.not_unique"
		object.messages.push  message
	object