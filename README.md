# Canteen Management System (API Application)

An API Application that manages canteen orders for you.

Things cover in this application:
* There will be a menu for each day and will have the following sections. 
  
  Breakfast 
  Lunch 
  Dinner
  Today's Special 
  
 * Users can order food as a guest or registered user. 
  
 * The order can be canceled before serving.
  
 * Record the payment status for each order.
 
 Versions:
 
  * Rails version: 6.0.3.4
 
  * Ruby version: ruby 2.6.6p146 (2020-03-31 revision 67876) [x64-mingw32]
  
first Api is user registration api which is a GET api and follows the following json format

GET domain.com/api/users/sign_up

{

    "user":{
    "username": "userexample",
    "email": "emailexample@jsj.com",
    "password": "some_ramdom_password",
    "password_confirmation": "some_ramdom_password"
    }
}

Expected output:

{

    "message": "User registered",
    "status": 200
}

User sign_in api goes as follows:

domain.com/api/users/login

API accepts params as follows:

 {
 
    "email": "useremail@jsj.com",
    "password": "some_random_password"
     
}

expected output:

{

    "user": {
        "id": 1,
        "email": "useremail@jsj.com",
        "username": "your_username",
        "token": "fiuhsdfidfsnfdkjfdnskjndsfjkdfsjdfsjkdjfskjkdsfnjdsjkfjdskjdsfjkdfs"
    }
}

API will generate the token which then can be use as a sign user.
