User {
    collectionID
    userID
    phoneNUmber,
    smsCode,
    Role()
    BusinessStatus()
    pinCode
}

BusinessStatus {
    nill
    Business()
}

Role {
    default
    business
    admin
    employee
}

Business {
    collectionID
    businessID
    businessName,
    businessAvatar,
    businessLocation,
    Inventory(Categories(), Products()),
    Orders(Products())
    Transactions(Orders.withFulfilledStatus)
    Employees
}

Categories {
    category
}
