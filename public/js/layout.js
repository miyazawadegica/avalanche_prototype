(function() {
  $(function() {
    var switchSidebar;
    switchSidebar = function() {
      $(".navbar-header").toggleClass("navbar-header-hidden");
      $(".sidebar").toggleClass("sidebar-hidden");
      $(".navbar-brand").toggleClass("navbar-brand-sm");
      return $(".sidebar").toggleClass("sidebar-sm");
    };
    return $("#js-switch-side-bar").click(switchSidebar);
  });

}).call(this);
