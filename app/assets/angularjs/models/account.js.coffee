App.factory "Account", ['railsResourceFactory', 'railsSerializer', (railsResourceFactory, railsSerializer) ->
  resource = railsResourceFactory
    url: "/accounts"
    name: "account"
]