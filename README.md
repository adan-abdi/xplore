# xplorE

xplorE Application is a Super-App built with flutter that intends to separately delevelop various modules that cut across different businesses while allowing the said bussinesses to upload micro-apps that perform their specific domain services.

The base modules include:

    - Onboarding: (FirebaseAuth)
        - Cut across platforms `Android`, `iOS` and Web
        - Manages User Identity and Authentication
        - Should include app security management like `biometric-login`, `PIN` and OTPs
        - Should have social logins including at least: 
            - Anonymous
            - Email & Password & PIN or [Biometrics]
            - Phone + OTP + PIN &/or [Biometrics]
        - Should also have Google+, Facebook, Twitter, Instagram
        - Should manage defaut user + business + employee agents + admin/superuser


    - Dashboard: (FireStoreDB)
        - Should contain business dashboards
        - Allow for business account details (Location, PaymentProfile)
        - Allow for inventory uploading
        - Allow for managing orders and tracking deliveries with delivery module [Primary BusinessType]
        - Allow businesses to upload microApp Programmes following our code-guidelines [Secondary BusinessType]
        - Allow business to register agents (agents to manage: orders/delivery, inventory)

    - Core: which in V1 includes [Catalogue Module]: (FireStoreDB)
        - Should allow for grid view of supported businesses and actions(pay, order-fulfilemt(delivery), verify-payment, scan etc)
        - Should showcase grid of business products + detail views
        - Should showcase promoted bussineses-carousel-cards with adStories
        - Should showcase quick actions/businesses/most-used-modules
        - Should engage users with available businesses xplore/Explore
        - Should have global search
        - Drawer to manage roles + accountProfile(Profile) + Logout
        - Feed

    - Payment: (mPesa, FlutterWave & FireStoreDB)
        - mPesa Powered default primary payment 
        - FlutterWave secondary payment (card, bank, etc)
        - Post Payment verification with verify-payment-QR-module
        - Scan QR Checkout

The secondary modules include:

    - Delivery Module (GoogleMaps + FireStoreDB)
    - ChatModule / Comms (Video, Call) (VideoChatSaaS - Agora/Twillio)


v1 Release Date: August 21st 2022
