Meteor.publish 'categories', ->	
  categories = Categories.find()