class @AppTree.Views.UserAuth extends Backbone.View
  el: '#modal-background .modal-dialog'

  initialize: ->
    @userAuthTemplate = HandlebarsTemplates['users/user_auth']
    @errorTemplate = HandlebarsTemplates['layouts/error']

  events:
    'click .form-button button': 'signUpOrSignIn'

  render: ->
    @$el.html @userAuthTemplate()

  signUpOrSignIn: ->
    event.preventDefault()
    @$('.form-group').removeClass 'has-error'

    if $(event.target).hasClass 'create-account'
      userData = user: @getSignUpData()
      url = '/users'
      passCheck = @checkSignUpData userData.user
    else if $(event.target).hasClass 'signin'
      userData = @getSignInData();
      url = '/session'
      passCheck = @checkSignInData userData

    if passCheck
      $.ajax
        url: url,
        type: 'POST'
        data: userData
        success: (response) ->
          $('#modal-background').modal 'hide'
          AppTree.Models.currentUser.set response
        error: (response) =>
          error = response.responseText
          if url == '/users'
            $error = @$ '#signup-form .error'
          else if url == '/sessions'
            $error = @$ '#signin-form .error'

          $error.html(@errorTemplate error: error)

  getSignUpData: ->
    $form = @$ '#signup-form'

    first_name: $form.find('#signup-first-name').val()
    last_name: $form.find('#signup-last-name').val()
    email: $form.find('#signup-email').val()
    password: $form.find('#signup-password').val()
    password_confirmation: $form.find('#signup-password-confirmation').val()
    phone_number: $form.find('#signup-phone-number').val()


  getSignInData: ->
    $signin = @$ '#signin-form'

    email: $signin.find('#signin-email').val()
    password: $signin.find('#signin-password').val()

  checkSignUpData: (data) ->
    pass = true
    emailRegEx = /^\w+@\w+\.[A-Za-z]+$/
    $signup = @$ '#signup-form'

    if !data.first_name || !data.last_name
      error = "First and last name are required."
      $signup.find('.name').addClass 'has-error'
      pass = false
    else if !emailRegEx.test data.email
      error = "Must use a valid email address."
      $signup.find('.email').addClass('has-error');
      pass = false;
    else if !data.password || data.password.length < 8
      $signup.find('.password').addClass 'has-error'
      error = "Password must be at least 8 characters long."
      pass = false
    else if !data.password_confirmation || data.password_confirmation != data.password
      $signup.find('.password-confirmation').addClass 'has-error'
      error = "Password confirmation must match the password."
      pass = false

    unless pass
      $signup.find('.error').html(@errorTemplate error: error)

    pass

  checkSignInData: (data) ->
    pass = true
    emailRegEx = /^\w+@\w+\.[A-Za-z]+$/
    $signin = @$ '#signin-form'

    if !emailRegEx.test data.email || data.password.length < 8
      error = "Incorrect email or password. Try again."
      $signin.find('.email').addClass('has-error')
      $signin.find('.password').addClass 'has-error'
      pass = false

    unless pass
      $signin.find('.error').html(@errorTemplate error: error)

    pass
