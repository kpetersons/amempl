Template['accounts/form'].helpers
  nameError: ->
    field = _.find(@account.messages, (field) ->
      field.name == 'name'
    )
    if field
      return 'error'