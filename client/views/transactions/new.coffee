Template['transactions/new'].transaction= ->
	Session.get('newTransaction')

Template['transactions/new'].rendered= ()->
	$(@lastNode).modal
		backdrop: 'static'
		keyboard: false	
    
Template['transactions/new'].events=
	'click button.save': (event)->    			
		Meteor.call 'Transactions.create', {transaction_account: $('#transaction_account').val(), transaction_category: $('#transaction_category').val(), transaction_amount: $('#transaction_amount').val(), transaction_when: $('#transaction_when').val()}, (error, transaction)->						
			if transaction.isValid
				$('.modal.transactions.new').modal 'hide'
				url_return = Session.get('url_return')
				unless url_return
					url_return = '/transactions'
				Meteor.Router.to(url_return)
				Session.set('url_return', null)
			Session.set('newTransaction', transaction)
	'click button.cancel': (event)->    	
		$('.modal.transactions.new').modal 'hide'
		url_return = Session.get('url_return')
		unless url_return
			url_return = '/transactions'
			Meteor.Router.to(url_return)
			Session.set('url_return', null)
			
Template['transactions/new'].helpers
	messages: ->
  	Session.get('newTransaction').messages
        