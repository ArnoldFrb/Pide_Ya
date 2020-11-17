$env:GOOGLE_APPLICATION_CREDENTIALS="D:\WORLD\FLUTTER\pideya\backend\pide-ya-db-firebase-adminsdk-b7qzn-129a8bb56b.json"

listar
admin.auth().listUsers()
    .then(function(listUsersResult) {
      listUsersResult.users.forEach(function(userRecord) {
        console.log('user', userRecord.toJSON());
      });
      if (listUsersResult.pageToken) {
        // List next batch of users.
        listAllUsers(listUsersResult.pageToken);
      }
    })
    .catch(function(error) {
      console.log('Error listing users:', error);
    });