# robotframework-saucedemo-automation-tests

Automated web testing project for SauceDemo using Robot Framework + Browser (Playwright) + Robocop. Covers login, add-to-cart, and checkout flows.

### Prerequisites

- Python >= 3.x
- pip >= 21.x
- Node >= 16.x

### Installation

1. **Create a virtual environment:**

   ```sh
   python -m venv .venv
   ```

2. **Activate the virtual environment:**

   **On Windows:**

   ```sh
   .\.venv\Scripts\activate
   ```

   **On macOS and Linux:**

   ```sh
   source .venv/bin/activate
   ```

3. **Install the required dependencies:**

   ```sh
   pip install -r requirements.txt
   ```

4. **Initialize Robot Framework Browser:**

   ```sh
   rfbrowser init
   ```

### Command Run Test

**Dryrun**

```sh
robot --dryrun -d reports/dryrun .
```

**Test**

```sh
robot -d reports/results -i <tag> .
```

### Testcase

- F_0001 - Login with all username
- F_0002 - Sorting product
- F_0002 - Cart
  - Add 1 item to cart
  - Add multiple items and verify cart count
  - Remove item from cart
  - Open cart with empty cart
- F_0003 - Checkout
  - Order of 1 item completed successfully
  - Order all items completed successfully
  - Checkout with missing first name
  - Checkout with missing postal code
  - Cancel checkout process
