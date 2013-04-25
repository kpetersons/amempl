Template['categories/delete'].category= ->
	Session.get('deleteCategory')

Template['categories/delete'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['categories/delete'].events=
	'click button.delete': (event)->    			
    category = Session.get('deleteCategory')
    Meteor.call 'Categories.delete', {_id: category._id}, (error, category)->
      $('.modal.categories.delete').modal 'hide'
      Meteor.Router.to('/categories')
      Session.set('deleteCategory', category)
	'click button.cancel': (event)->    	
		$('.modal.categories.delete').modal 'hide'
		Meteor.Router.to('/categories');
    
Template['categories/delete'].helpers
	messages: ->
  	Session.get('deleteCategory').messages
        