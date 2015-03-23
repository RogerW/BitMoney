Polymer 'app-shadow',
  publish:
    z: 1
    animated: false
  setZ: (newZ) ->
    if @z != newZ
      @$['shadow-bottom'].classList.remove 'app-shadow-bottom-z-' + @z
      @$['shadow-bottom'].classList.add 'app-shadow-bottom-z-' + newZ
      @$['shadow-top'].classList.remove 'app-shadow-top-z-' + @z
      @$['shadow-top'].classList.add 'app-shadow-top-z-' + newZ
      @z = newZ
    return