@Plans = new Meteor.Collection 'plans'

@PlanCategories = new Meteor.Collection 'plan_categories',
	transform: (doc) ->
		plan = Plans.findOne(_id: doc.plan_id)
		console.log 'plan', plan, 'plan_id', doc.plan_id
		if plan
			transactions = Transactions.find(
				when: 
					$gt: plan.from
					$lt: plan.to
				category_id: doc.category_id
			).fetch()
			doc.actual = _.reduce(_.pluck(transactions, 'amount'), 
				(memo, num) -> memo+new Number(num)
			, 0)
		doc