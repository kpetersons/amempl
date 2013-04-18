Template['accounts/edit'].account= ->
	Session.get('editAccount')

Template['accounts/edit'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['accounts/edit'].events=
	'click button.save': (event)->    			
    account = Session.get('editAccount')
    Meteor.call 'Accounts.update', {_id: account._id, name: $('#account_name').val(), description: $('#account_description').val()}, (error, account)->						
      if account.isValid
        $('.modal.accounts.edit').modal 'hide'
        Meteor.Router.to('/accounts');
      Session.set('editAccount', account)
	'click button.cancel': (event)->    	
		$('.modal.accounts.edit').modal 'hide'
		Meteor.Router.to('/accounts');
    
Template['accounts/edit'].helpers
	messages: ->
  	Session.get('editAccount').messages
        