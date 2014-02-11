Cardboard.setup do |config|

  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the Cardboard pages.
  #
  config.site_title = 'Dummy'

  # == Admin User Class
  #
  # Cardboard will associate actions with the current
  # user performing them.
  config.user_class = 'AdminUser'

  # == Current User
  #
  # Cardboard will associate actions with the current
  # user performing them.
  #
  # This setting changes the method which Cardboard calls
  # to return the currently logged in user.
  config.current_admin_user_method = :current_admin_user

  # == User Authentication
  #
  # Cardboard will automatically call an authentication
  # method in a before filter of all controller actions to
  # ensure that there is a currently logged in admin user.
  #
  # This setting changes the method which Cardboard calls
  # within the controller.
  config.authentication_method = :authenticate_admin_user!

  # == Logging Out
  #
  # Cardboard displays a logout link on each screen. These
  # settings configure the location and method used for the link.
  #
  # This setting changes the path where the link points to. If it's
  # a string, the strings is used as the path. If it's a Symbol, we
  # will call the method to return the path.
  #
  # Default:
  config.logout_link_path = :destroy_admin_user_session_path

  # This setting changes the http method used when rendering the
  # link. For example :get, :delete, :put, etc..
  #
  # Default:
  # config.logout_link_method = :get

end