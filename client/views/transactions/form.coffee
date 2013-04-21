Template['transactions/form'].rendered= ()->
	$('#transaction_account').typeahead(
		source: (typeahead, query)->
			Accounts.find().map (item) ->
				item.name
	)
	$('#transaction_category').typeahead(
		source: (typeahead, query)->
			Categories.find().map (item) ->
				item.name
	)
	$('#transaction_when').datepicker().on('changeDate', (evt)->
		$('#transaction_when').datepicker('hide')
	)
	
Template['transactions/form'].helpers
  accountError: ->
    field = _.find(@transaction.messages, (field) ->
      field.name == 'account_id'
    )
    console.log field, @transaction.messages
    if field
      return 'error'
		
  categoryError: ->
    field = _.find(@transaction.messages, (field) ->
      field.name == 'category_id'
    )
    if field
      return 'error'
		
  amountError: ->
    field = _.find(@transaction.messages, (field) ->
      field.name == 'amount'
    )
    if field
      return 'error'		

  whenError: ->
    field = _.find(@transaction.messages, (field) ->
      field.name == 'when'
    )
    if field
      return 'error'		
		
		
Template['transactions/form'].helpers
	transaction_account: ->
		_.extend({}, Accounts.findOne(_id: @transaction.account_id)).name
	
	transaction_category: ->
		_.extend({}, Categories.findOne(_id: @transaction.category_id)).name		

	transaction_when: ->
		@transaction.when
		
	transaction_amount: ->
		accounting.formatMoney(@transaction.amount, '', 2)