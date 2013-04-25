Template['transactions/delete'].transaction= ->
	Session.get('deleteTransaction')

Template['transactions/delete'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['transactions/delete'].events=
	'click button.delete': (event)->    			
    transaction = Session.get('deleteTransaction')
    Meteor.call 'Transactions.delete', {_id: transaction._id}, (error, transaction)->
      $('.modal.transactions.delete').modal 'hide'
      Meteor.Router.to('/transactions')
      Session.set('deleteTransaction', transaction)
	'click button.cancel': (event)->    	
		$('.modal.transactions.delete').modal 'hide'
		Meteor.Router.to('/transactions');
    
Template['transactions/delete'].helpers
	messages: ->
  	Session.get('deleteTransaction').messages
        