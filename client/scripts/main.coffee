###
    The main entry point for the client side of the app
###

# Create the main app object
@App = {}

# Create the needed collections on the client side
@Colors = new Meteor.Collection("colors")
@Cars = new Meteor.Collection("cars")

# Subscribe to the publishes in server/collections
Meteor.subscribe("colors")
Meteor.subscribe("cars")

# Method to get the current user's email that won't ever throw an undefined error!
Meteor.users.getActiveEmail = () ->
    email = Meteor.user()?.emails?[0]?.address if Meteor.userId()
    return email ? ""

Meteor.startup () ->
    $ ->
        # Create the backbone router
        App.router = new Router()
        Backbone.history.start({pushState: true})

