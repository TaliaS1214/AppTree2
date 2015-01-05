AppTree.Views.UserAuth = Backbone.View.extend({
  el: '#modal-background .modal-dialog',
  initialize: function() {
    this.userAuthTemplate = HandlebarsTemplates['users/user_auth'];
    this.errorTemplate = HandlebarsTemplates['layouts/error'];
  },

  events: {
    'click .form-button button': 'signUpOrSignIn'
  },

  render: function() {
    this.$el.html(this.userAuthTemplate());
  },

  signUpOrSignIn: function() {
    event.preventDefault();
    this.$('.form-group').removeClass('has-error');

    if ($(event.target).hasClass('create-account')) {
      var userData = { user: this.getSignUpData() };
      var url = '/users';
      var passCheck = this.checkSignUpData(userData.user);
    } else if ($(event.target).hasClass('signin')) {
      var userData = this.getSignInData();
      var url = '/session';
      var passCheck = this.checkSignInData(userData);
    }

    if (passCheck) {
      $.ajax({
        url: url,
        type: 'POST',
        data: userData,
        success: function(response) {
          $('#modal-background').modal('hide');
          AppTree.Models.currentUser.set(response);
        },
        error: function(response) {
          var error = response.responseText;
          if (url === '/users') {
            var $error = this.$('#signup-form .error');
          } else if (url === '/sessions') {
            var $error = this.$('#signin-form .error');
          }
          $error.html(this.errorTemplate({error: error}));
        }.bind(this)
      });
    }
  },

  getSignUpData: function() {
    var $form = this.$('#signup-form');

    data = {
      first_name: $form.find('#signup-first-name').val(),
      last_name: $form.find('#signup-last-name').val(),
      email: $form.find('#signup-email').val(),
      password: $form.find('#signup-password').val(),
      password_confirmation: $form.find('#signup-password-confirmation').val(),
      phone_number: $form.find('#signup-phone-number').val()
    }

    return data;
  },

  getSignInData: function() {
    var $signin = this.$('#signin-form');

    data = {
      email: $signin.find('#signin-email').val(),
      password: $signin.find('#signin-password').val()
    }

    return data;
  },

  checkSignUpData: function(data) {
    var pass = true;
    var emailRegEx = /^\w+@\w+\.[A-Za-z]+$/;
    var $signup = this.$('#signup-form');

    if (!data.first_name || !data.last_name) {
      debugger;
      var error = "First and last name are required."
      $signup.find('.name').addClass('has-error')
      pass = false;
    } else if (!emailRegEx.test(data.email)) {
      var error = "Must use a valid email address."
      $signup.find('.email').addClass('has-error');
      pass = false;
    } else if (!data.password || data.password.length < 8) {
      $signup.find('.password').addClass('has-error');
      var error = "Password must be at least 8 characters long."
      pass = false;
    } else if (!data.password_confirmation || data.password_confirmation != data.password) {
      $signup.find('.password-confirmation').addClass('has-error');
      var error = "Password confirmation must match the password."
      pass = false;
    }

    if (!pass) {
      $signup.find('.error').html(this.errorTemplate({error: error}));
    }

    return pass;
  },

  checkSignInData: function(data) {
    var pass = true;
    var emailRegEx = /^\w+@\w+\.[A-Za-z]+$/;
    var $signin = this.$('#signin-form');

    if (!emailRegEx.test(data.email) || data.password.length < 8) {
      var error = "Incorrect email or password. Try again.";
      $signin.find('.email').addClass('has-error');
      $signin.find('.password').addClass('has-error');
      pass = false;
    } else if (!data.password) {
      $signin.find('.password').addClass('has-error');
      var error = "You must provide a password."
      pass = false;
    }

    if (!pass) {
      $signin.find('.error').html(this.errorTemplate({error: error}));
    }

    return pass;
  }
});
