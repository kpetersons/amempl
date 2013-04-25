Meteor.publish 'plan_categories', ->	
  planCategories = PlanCategories.find()