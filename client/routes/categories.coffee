Meteor.Router.add
	'/categories/:id/edit': (_id)->
		editCategory = Categories.findOne(_id: _id)
		if editCategory
			Session.set('editCategory', editCategory)
			'categories/edit'
	'/categories/new': ->
		Session.set('newCategory', {name: 'untitled', description: ''})
		'categories/new'
	'/categories': ->
  	'categories/categories'