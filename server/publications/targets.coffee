Meteor.publish 'targets', ->	
  targets = Targets.find()