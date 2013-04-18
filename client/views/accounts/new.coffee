Template['accounts/new'].account= ->
	Session.get('newAccount')

Template['accounts/new'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['accounts/new'].events=
	'click button.save': (event)->    			
    Meteor.call 'Accounts.create', {name: $('#account_name').val(), description: $('#account_description').val()}, (error, account)->						
      if account.isValid
        $('.modal.accounts.new').modal 'hide'
        Meteor.Router.to('/accounts');
      Session.set('newAccount', account)
	'click button.cancel': (event)->    	
		$('.modal.accounts.new').modal 'hide'
		Meteor.Router.to('/accounts');
    
Template['accounts/new'].helpers
	messages: ->
  	Session.get('newAccount').messages
        