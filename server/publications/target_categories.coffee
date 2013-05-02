Meteor.publish 'target_categories', ->	
  targetCategories = TargetCategories.find()