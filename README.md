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
It accepts the token in header as Authorization value. 

APIs from below can either be access through the token as user or without the token as guest user

One can create the menu by passing the post API as follows:

POST domain.com/api/menus

It accepts params as follows

{

    "menu":[
    {    "name": "candy2",
        "menu_type": "breakfast",
        "price": 20
    },
    {
        "name": "chicken handi 2",
        "menu_type": "today_special",
        "price": 500
    }
    ]
}

Expected output as follows:

{

    "message": "menu saved succesfully",
    "status": 200
}


Menu type can only be accepted if is 

[ breakfast ,lunch ,dinner ,today_special]


To display today's menu following API  is used:

GET domain.com/api/menus

expected output as follows:

{

    "menu": [
        {
            "id": 9,
            "name": "candy2",
            "menu_type": "breakfast",
            "price": 20
        },
        {
            "id": 10,
            "name": "chicken handi 2",
            "menu_type": "today_special",
            "price": 500
        }
    ]
}

To adding and create order items and order following API is used:

POST domain.com/api/order_items

params can be as follows:

{

    "order_items":[
        {
            "menu_id": 1,
            "name" : "chicken tika"
        },
        {
            "menu_id": 2,
            "name" : "palak paneer"
        }
    ]
    
}

Expected output :

{

    "message": "items added sucessfully",
    "status": 200
}

Payement:

Payment status can be as follows:

[PAID , UNPAID]

API to update payment status will goes as follow:

POST domain.com/api/orders/update_payment_status

Parameter intake are as follows:

{

    "id": 5,
    "payment_status": "PAID"
}

Expected output will be as follows:

{

    "message": "status updated succesfully",
    "status": 200
}

Order:

Order status can be as follows:

[INKITCHEN , PERPARING  . SERVED]

To update the order status following API can be use:

POST /api/orders/update_order_status

Parameter accpeted are as follows:

{

    "id": 5,
    "order_status": "PERPARING"
}

Expected output are as follows:

{

    "message": "status updated succesfully",
    "status": 200
}

To cancel the order following API is used:

POST domain.com/api/orders/cancel_order

params accepted are:

{

    "id": 5
}

Expected output

{

    "message": "order cancelled succesfully",
    "status": 200
} 

Display all order:

Following api is use:

GET domain.com/api/orders 

Expected output:

{

    "orders": [
        {
            "id": 3,
            "order_number": 103,
            "order_status": "SERVED",
            "order_amount": 520,
            "order_item_list": [
                {
                    "id": 5,
                    "name": "chicken tika"
                },
                {
                    "id": 6,
                    "name": "palak paneer"
                }
            ]
        }
    ],
    "status": 200
}

