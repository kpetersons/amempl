Template['accounts/account'].account= ->
	Session.get('detailsAccount')
  
Template['accounts/account'].transactions= ->
	Transactions.find(account_id: Session.get('detailsAccount')._id)

Template['accounts/account'].helpers
	url_prefix: ->
		"/accounts/#{Session.get('detailsAccount')._id}"

Template['accounts/account'].events
	'click a.cancel':->
		account = Session.get('detailsAccount')
		Session.set('detailsAccount', null)
		Meteor.call 'Accounts.update_unselected', account, (error, account)->
			Meteor.Router.to("/accounts");