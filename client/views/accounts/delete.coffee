Template['accounts/delete'].account= ->
	Session.get('deleteAccount')

Template['accounts/delete'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['accounts/delete'].events=
	'click button.delete': (event)->    			
    account = Session.get('deleteAccount')
    Meteor.call 'Accounts.delete', {_id: account._id}, (error, account)->
      $('.modal.accounts.delete').modal 'hide'
      Meteor.Router.to('/accounts')
      Session.set('deleteAccount', account)
	'click button.cancel': (event)->    	
		$('.modal.accounts.delete').modal 'hide'
		Meteor.Router.to('/accounts');
    
Template['accounts/delete'].helpers
	messages: ->
  	Session.get('deleteAccount').messages
        