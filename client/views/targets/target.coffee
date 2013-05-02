Template['targets/target'].target= ->
	Session.get('detailsTarget')
  
Template['targets/target'].transactions= ->
	detailsCategory = Categories.findOne selected: true, _id: $in: _.pluck(Session.get('detailsTarget').categories, '_id')
	if detailsCategory
		Transactions.forCategoryWithinRange({_id: detailsCategory._id}, {from: Session.get('detailsTarget').from, to: Session.get('detailsTarget').to},Transactions.full_transform).fetch()	
	else
		Transactions.forCategoriesWithinRange({_ids: _.pluck(Session.get('detailsTarget').categories, '_id')}, {from: Session.get('detailsTarget').from, to: Session.get('detailsTarget').to}, Transactions.full_transform).fetch()	

Template['targets/target'].categories= ->
	Categories.forTarget(Session.get('detailsTarget'), Categories.full_transform_range).fetch()

Template['targets/target'].helpers  
	url_prefix: ->
		"/targets/#{Session.get('detailsTarget')._id}"

Template['targets/target'].events		
	'click a.clear': (evt) ->
		Meteor.call 'Categories.update_unselected', {}