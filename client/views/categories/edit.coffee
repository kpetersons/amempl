Template['categories/edit'].category= ->
	Session.get('editCategory')

Template['categories/edit'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['categories/edit'].events=
	'click button.save': (event)->    			
    category = Session.get('editCategory')
    Meteor.call 'Categories.update', {_id: category._id, name: $('#category_name').val(), description: $('#category_description').val(), type: $('#category_type[type=radio]:checked').val()}, (error, category)->						
      if category.isValid
        $('.modal.categories.edit').modal 'hide'
        Meteor.Router.to('/categories');
      Session.set('editCategory', category)
	'click button.cancel': (event)->    	
		$('.modal.categories.edit').modal 'hide'
		Meteor.Router.to('/categories');
    
Template['categories/edit'].helpers
	messages: ->
  	Session.get('editCategory').messages
        