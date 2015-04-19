angular.module('MoneyBit').factory "ConsumptionType", [
	'railsResourceFactory'
	(railsResourceFactory) ->
		railsResourceFactory
			url: "consumption_types"
			name: "consumption_type"
]