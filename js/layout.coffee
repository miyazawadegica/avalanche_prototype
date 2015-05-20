$ ->
  switchSidebar = ->
    # if small media query, sidebar disappears.
    # if not small, no effect.
    $(".navbar-header").toggleClass("navbar-header-hidden")
    $(".sidebar").toggleClass("sidebar-hidden")

    $(".navbar-brand").toggleClass("navbar-brand-sm")
    $(".sidebar").toggleClass("sidebar-sm")

  $("#js-switch-side-bar").click(switchSidebar)
