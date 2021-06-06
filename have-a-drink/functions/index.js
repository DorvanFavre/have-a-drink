
const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserCreated = functions.auth.user().onCreate(
    (user) => {
        console.log('New user created, attempt to create a new identity...');
        const uid = user.uid;
        const email = user.email;
        //admin.firestore().collection('identities').add({email: email});
        return admin.firestore().collection('identities').doc(uid).create({email: email});
    }
);

exports.onUserDeleted = functions.auth.user().onDelete(
    (user) => {
        console.log('User deleted, attempt to delete user s identity...');
        const uid = user.uid;
        return admin.firestore().collection('identities').doc(uid).delete();
    }
);



