angular.module('MoneyBit').directive 'accountDublicate', ->
  require: 'ngModel'
  restrict: 'A'
  scope: {source: '@'}
  link: (scope, elm, attrs, ctrl) ->
    source = attrs.source
    ctrl.$validators.accountDublicate = (modelValue, viewValue) ->
      console.log viewValue + source
      
      if ctrl.$isEmpty(modelValue)
        return true
      
      if parseInt(modelValue, 10) != parseInt(source,10)
        return true
      
      return false