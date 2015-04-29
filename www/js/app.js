// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
angular.module('starter', ['ionic'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)

    if (ionic.Platform.isIOS()) {
      applewatch.init(function() {

        var data = {"data": "test"};
        applewatch.sendMessage(JSON.stringify(data), "inbox", function() {
          console.log('IT SENT!!', JSON.stringify(data));
        }, function(err) {
          console.log('err sending dat message', err)
        });

      }, function(err) {
        console.log('twas a fail on christmas eve', err);
      }, "group.unbill.watchkit");   

    }

  });
  
})
