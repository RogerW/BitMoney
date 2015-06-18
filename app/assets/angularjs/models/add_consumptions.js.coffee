angular.module('MoneyBit').factory "AccountAddConsumption", [
	'railsResourceFactory'
	(railsResourceFactory) ->
		railsResourceFactory
			url: "/account/add_consumptions"
			name: "account_add_consumption"
]