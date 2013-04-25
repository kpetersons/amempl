Meteor.publish 'plans', ->	
  plans = Plans.find()