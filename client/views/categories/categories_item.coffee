Template['categories/categories_item'].helpers
	category_name: ->
  	@category.name
    
	category_description: ->
  	@category.description
    
	category_balance: ->
  	accounting.formatMoney(@category.balance, '', 2)
    
	category_type: ->
		@category.type	
    
Template['categories/categories_item'].events
	'click .delete': ->
  	console.log 'delete category', @category