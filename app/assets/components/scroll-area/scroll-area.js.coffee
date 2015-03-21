do ->

  onScroll_ = ->
    @previousScrollY = @latestKnownScrollY

    ### IE10 only supports pageYOffset ###

    @latestKnownScrollY = window.scrollY or window.pageYOffset
    requestTick_.bind(this)()
    return

  requestTick_ = ->
    if !@ticking
      window.requestAnimationFrame update_.bind(this)
    @ticking = true
    return

  update_ = ->
    @ticking = false
    # Reset the tick so we can capture the next onScroll.
    currentScrollY = @latestKnownScrollY
    # var previousScrollY = this.previousScrollY;
    @smallBannerSizeReached = @siteBannerHeight - currentScrollY < @appBarHeight
    #80px;
    if @smallBannerSizeReached
      @classList.add 'scrolling'
      @header and @header.classList.add('shrink')
    else
      @classList.remove 'scrolling'
      @header and @header.classList.remove('shrink')
      # Fix and shrink header when it hits the top of the page.
      if @header and @header.offsetTop - currentScrollY <= 0
        @header.classList.add 'shrink'
    return

  Polymer "scroll-area",
    latestKnownScrollY: 0
    previousScrollY: 0
    smallBannerSizeReached: false
    ticking: false
    fancyheader: true
    publish: sidebar:
      value: false
      reflect: true
    attached: ->
      @init()
      return
    init: ->
      siteBanner = @querySelector('site-banner')
      @appBar = siteBanner.querySelector('app-bar')
      @header = siteBanner.querySelector('header')
      # Give DOM some time to do layout.
      @async ->
        @siteBannerHeight = siteBanner.offsetHeight
        @appBarHeight = @appBar.offsetHeight
        return
      # For testing.
      # this.siteBannerHeight = 286;
      # this.appBarHeight = 80;
      # bind() returns new function. Save named reference.
      @onscroll = onScroll_.bind(this)
      @fancyheaderChanged()
      # Handle pageload in middle of page.
      if (window.scrollY or window.pageYOffset) and @fancyheader
        @onscroll()
      return
    fancyheaderChanged: ->
      if @fancyheader
        window.addEventListener 'scroll', @onscroll, false
      else
        window.removeEventListener 'scroll', @onscroll, false
        @classList.remove 'scrolling'
        @header and @header.classList.remove('shrink')
      return
  return
