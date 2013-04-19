Meteor.Router.add
	'/categories/:category_id/transactions/new': (category_id)->
		category = Categories.findOne _id: category_id
		if category
			Session.set('newTransaction', category_id: category._id)
			Session.set('url_return', "/categories/#{category._id}/details")      
			'transactions/new'
	'/categories/:category_id/transactions/:transaction_id/edit': (category_id, transaction_id)->
		editTransaction = Transactions.findOne(
			_id: transaction_id
			category_id: category_id
		)
		if editTransaction
			Session.set('editTransaction', editTransaction)
			Session.set('url_return', "/categories/#{category_id}/details")      			
		'transactions/edit'
	'/categories/:id/details': (_id)->
		detailsCategory = Categories.findOne(_id: _id)
		if detailsCategory
			Session.set('detailsCategory', detailsCategory)
			'categories/category'

	'/categories/:id/edit': (_id)->
		editCategory = Categories.findOne(_id: _id)
		if editCategory
			Session.set('editCategory', editCategory)
			'categories/edit'
	'/categories/new': ->
		Session.set('newCategory', {name: 'untitled', description: ''})
		'categories/new'
	'/categories': ->
		detailsCategory = Categories.findOne selected: true
		if detailsCategory
			Meteor.Router.to("/categories/#{detailsCategory._id}/details");
			return 'categories/category'
		'accounts/accounts'