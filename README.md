# xplorE

xplorE Application is a Super-App built with flutter that intends to separately develop various modules that cut across different businesses while allowing the said businesses to upload micro-apps that perform their specific domain services.

## Project Initial Scope

Project Version 1 Scope:

    - [ ] Onboarding: (FirebaseAuth (Phone + OTP + PIN Auth))
        - [ ] Cut across platforms `Android`, `iOS` and Web
        - [ ] Manages User Identity and Authentication
        - [ ] Phone + OTP + PIN &/or [Biometrics] + PIN
        - [ ] RBAC: Should manage default user + business + business agents + admin/superuser


    - [ ] Dashboard: (FireStoreDB)
        - [ ] Allow businesses to see their dashboard with the following: 
            - [ ] Allow businesses to create and upload Inventory
            - [ ] Allow businesses to create categories for these inventory if needed
            - [ ] Allow businesses to create orders
            - [ ] Allow businesses to  mark orders as fulfilled, verify payment and(or) reject/ignore orders
            - [ ] Allow businesses to see a simplified data visualization on their dashboard homepage of hottest product, most profitable products, items low on, items with more demand than supply, minimal customer metrics
            - [ ] Payment profile (Version 2: allow businesses to add payment info (mPesa))

    - Core(Homepage): which in V1 includes [Catalogue Module]: (FireStoreDB)
        - [ ] Should allow for grid view of supported businesses and actions(pay, order-fulfillment(delivery), verify-payment, scan etc)
        - [ ] Should showcase grid of business products + detail views
        - [ ] Should showcase promoted business-carousel-cards with adStories
        - [ ] Should showcase quick actions/businesses/most-used-modules
        - [ ] Should engage users with available businesses xplore/Explore (Like a feed of ads)
        - [ ] Should have global search
        - [ ] Drawer to manage roles + accountProfile(Profile) + Logout + Logout SideDarkDrawer

    - [ ] Payment: (mPesa, FlutterWave & FireStoreDB) -  Version 2 (miniml in v1)
        - [ ] mPesa Powered default primary payment 
        - [ ] FlutterWave secondary payment (card, bank, etc)
        - [ ] Post Payment verification with verify-payment-QR-module
        - [ ] Scan QR Checkout

The secondary modules include:

    - Delivery Module (GoogleMaps + FireStoreDB)
    - ChatModule / Communications (Video, Call) (VideoChatSaaS - Agora/Twillio)



