Template['categories/new'].category= ->
	Session.get('newCategory')

Template['categories/new'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['categories/new'].events=
	'click button.save': (event)->    			
    Meteor.call 'Categories.create', {name: $('#category_name').val(), description: $('#category_description').val(), type: $('#category_type[type=radio]:checked').val()}, (error, category)->						
      if category.isValid
        $('.modal.categories.new').modal 'hide'
        Meteor.Router.to('/categories');
      Session.set('newCategory', category)
	'click button.cancel': (event)->    	
		$('.modal.categories.new').modal 'hide'
		Meteor.Router.to('/categories');
    
Template['categories/new'].helpers
	messages: ->
  	Session.get('newCategory').messages
        