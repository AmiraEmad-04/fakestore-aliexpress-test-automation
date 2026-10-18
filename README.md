# FakeStore API & AliExpress Test Automation

Two test suites from a software testing course:

- **API testing** with **Postman** against the public [Fake Store API](https://fakestoreapi.com/) (users, products, carts, login), with valid and negative scenarios and automated test scripts.
- **Web UI testing** with **Robot Framework + SeleniumLibrary** on AliExpress (search, cart, category and price filters, language and region, login, image zoom).

## Project structure

```
api-tests-postman/
└── FakeStoreAPI.postman_collection.json   # 9 requests with test scripts
ui-tests-robot/
├── cart_category_price_tests.robot        # Scenario 1-3: add to cart, category filter, price range
├── language_and_login_tests.robot         # sen4-sen6: language change, login flow
└── image_zoom_and_region_tests.robot      # Scenario 7-8: image zoom, ship-to country
```

## API tests (Postman)

Requests in the collection: Get All Products, Get Product by ID, Create Cart, Create User, Get All Users, Login User, Get a Single Cart by ID, Delete a Cart, Get All Carts.

**How to run:** import the collection in Postman, then run it with the Collection Runner or send each request and check the *Test Results* tab.

### Bugs found in the API

| Endpoint | Test | Expected | Actual |
|---|---|---|---|
| `POST /users` | only a username sent | 400 / 500 | 200 OK |
| `GET /products/9944` | non-existing product | 404 or empty object | 200 |
| `POST /carts` | valid cart | 201 | 200 |
| `POST /carts` | quantity = 0 | 400 | 200 |
| `GET /carts/9999` | non-existing cart | 404 or empty object | 200 |
| `DELETE /carts/9999` | non-existing cart | 404 or 400 | 200 |

## UI tests (Robot Framework)

**Requirements:** Python 3, Chrome + matching ChromeDriver

```bash
pip install robotframework robotframework-seleniumlibrary
robot ui-tests-robot/
```

Notes:

- The tests target the Arabic AliExpress site, and some locators are auto-generated class names that AliExpress changes often, so they may need updating.
- AliExpress may show a CAPTCHA, which has to be solved manually.
- For the login test, set `${LOGIN_USER}` and `${LOGIN_PASSWORD}` in `language_and_login_tests.robot` to your own test account. Do not commit real credentials.

## Tools

Postman, Fake Store API, Robot Framework, SeleniumLibrary, Chrome

## Authors

Basant Hatem Hassan Mohamed, Emy Ihab, Amira Emad
