angular.module('MoneyBit').factory "AccountTransfer", [
	'railsResourceFactory'
	(railsResourceFactory) ->
		railsResourceFactory
			url: "/account/transfers"
			name: "account_transfer"
]