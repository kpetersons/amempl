Template['categories/form'].helpers
	category_is_income: ->
  	if @category.type == 'income'
      true
	category_is_expense: ->
  	if @category.type == 'expense'
      true
    
Template['categories/form'].helpers
  nameError: ->
    field = _.find(@category.messages, (field) ->
      field.name == 'name' 
    )
    if field
      return 'error'
    
  typeError: ->
    field = _.find(@category.messages, (field) ->
      field.name == 'type' 
    )
    if field
      return 'error'
        