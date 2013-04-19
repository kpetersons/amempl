Template['categories/categories_item'].helpers
	category_name: ->
  	@category.name
    
	category_description: ->
  	@category.description
    
	category_balance: ->
  	accounting.formatMoney(@category.balance, '', 2)
    
	category_type: ->
		@category.type	

	category_selected: ->
		if @category.selected == true
			'success'		
		
Template['categories/categories_item'].events
	'click .delete': ->
  	console.log 'delete category', @category    
	'click a.details': (evt) ->
		Meteor.call 'Categories.update_selected', @category, (error, category)->
			Meteor.Router.to("/categories/#{category._id}/details");