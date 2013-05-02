Template['categories/categories_item'].helpers
	category_name: ->
  	@category.name
    
	category_description: ->
  	@category.description
    
	category_balance: ->
  	accounting.formatMoney(@category.balance, '', 2)
    
	category_balance_class: ->
		if @category.type == 'income'
			'text-success'
		else
			'text-error'
	
	category_type: ->
		@category.type	

	category_selected: ->
		if @category.selected == true
			'success'		

	target_category_amount: ->
		cat = _.find(Session.get('detailsTarget').categories, (item) ->
			item._id = @category._id
		, @)
		if cat
			accounting.formatMoney(cat.amount, '', 2)
Template['categories/categories_item'].events
	'click .delete': ->
  	console.log 'delete category', @category    
	'click a.details': (evt) ->
		@category.selected = true
		href = $(evt.target).attr('data-href')
		Meteor.call 'Categories.update_selected', @category, (error, category)->
			console.log 'href', href
			Meteor.Router.to(href);