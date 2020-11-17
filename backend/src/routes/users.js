const { Router } = require('express');
const bodyParse = require('body-parser');
const router = Router();
const admin = require('../database');
const UserDetail = require('../models/user-details');

router.use(bodyParse());

const db = admin.database();

router.post('/api/users', async (req, res) => {

    const { email } = req.body;
    
    await admin.auth().getUserByEmail(email)
        .then(function(userRecord) {
            // See the UserRecord reference doc for the contents of userRecord.
            db.ref('user-details').once('value', (snapshot) => {
                var hasDirection = snapshot.child(userRecord.uid+"/direction").val();
                var hasPhoneNumber = snapshot.child(userRecord.uid+"/phoneNumber").val();

                const userInf = {
                    uid: userRecord.uid,
                    email: userRecord.email,
                    displayName: userRecord.displayName,
                    photoURL: userRecord.photoURL,
                    phoneNumber: hasPhoneNumber,
                    direction: hasDirection
                }

                res.json(userInf);
            });
        })
        .catch(function(error) {
            console.log('Error fetching user data:', error);
        });
});

router.get('/api/users/store', async (req, res) => {

    var listStore = [];
    var query = await admin.database().ref("user-details").orderByKey();
    query.once("value")
    .then(function(snapshot) {
        snapshot.forEach(function(childSnapshot) {
        // childData will be the actual contents of the child
        var childData = childSnapshot.val();
        if(childData.type == 'Tienda'){
            listStore.push(childData);
        }
    });
    res.json(listStore);
    });
});

router.post('/api/users/auth', async (req, res) => {

    const { email } = req.body;
    
    await admin.auth().getUserByEmail(email)
        .then(function(userRecord) {
            // See the UserRecord reference doc for the contents of userRecord.
            db.ref('user-details').once('value', (snapshot) => {
                var hasType = snapshot.child(userRecord.uid+"/type").val();

                const userInf = {
                    type: hasType,
                }

                res.json(userInf);
            });
        })
        .catch(function(error) {
            console.log('Error fetching user data:', error);
        });
});

router.post('/api/users/create', async (req, res) => {

    res.json('CREATE USAER');
    
    const { 
        email,
        phoneNumber,
        password,
        displayName,
        photoURL,
        direction,
        type
    } = req.body;
    
    await admin.auth().createUser({
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        displayName: displayName,
        photoURL: photoURL
    })
    .then(function(userRecord) {
        // See the UserRecord reference doc for the contents of userRecord.
        console.log('Successfully created new user:', userRecord.uid);

        const ud = new UserDetail(userRecord.phoneNumber, userRecord.displayName, userRecord.photoURL, direction, type, userRecord.uid);
        db.ref('user-details').child(userRecord.uid).set(ud.usarDet);
    })
    .catch(function(error) {
        console.log('Error creating new user:', error);
    });
});

router.post('/api/users/update', async (req, res) => {

    const { 
        uid,
        email,
        phoneNumber,
        displayName,
        direction,
        photoURL,
        
    } = req.body;
    
    await admin.auth().updateUser(uid, {
        email: email,
        displayName: displayName
      })
        .then(function(userRecord) {
          // See the UserRecord reference doc for the contents of userRecord.
          const userInf =  {
            phoneNumber: phoneNumber,
            displayName: displayName,
            photoURL: photoURL,
            direction: direction,
            type: 'Persona',
            uid: uid
        }
    
        db.ref('user-details').child(userRecord.uid).set(userInf);

        res.json('UPDATE USAER');

        })
        .catch(function(error) {
          console.log('Error updating user:', error);
    });
});

router.post('/api/users/delete', async (req, res) => {

    const { 
        uid
    } = req.body;
    
    await admin.auth().deleteUser(uid)
    .then(function() {
      console.log('Successfully deleted user');

      db.ref('user-details').child(uid).remove();
    })
    .catch(function(error) {
      console.log('Error deleting user:', error);
    });
});

module.exports = router;