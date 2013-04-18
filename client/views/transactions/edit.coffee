Template['transactions/edit'].transaction= ->
	Session.get('editTransaction')

Template['transactions/edit'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['transactions/edit'].events=
	'click button.save': (event)->    			
    transaction = Session.get('editTransaction')
    Meteor.call 'Transactions.update', {_id: transaction._id, transaction_account: $('#transaction_account').val(), transaction_category: $('#transaction_category').val(), transaction_amount: $('#transaction_amount').val(), transaction_when: $('#transaction_when').val()}, (error, transaction)->
      if transaction.isValid
        $('.modal.transactions.edit').modal 'hide'
        Meteor.Router.to('/transactions');
      Session.set('editTransaction', transaction)
	'click button.cancel': (event)->    	
		$('.modal.transactions.edit').modal 'hide'
		Meteor.Router.to('/transactions');
    
Template['transactions/edit'].helpers
	messages: ->
  	Session.get('editTransaction').messages