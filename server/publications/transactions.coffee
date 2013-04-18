Meteor.publish 'transactions', ->	
  transactions = Transactions.find()