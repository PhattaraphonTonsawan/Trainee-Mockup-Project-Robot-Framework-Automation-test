# robotframework-automation-tests

Automated testing project for **GoDev Trainee** using **Robot Framework**.
This project covers:
- **Web Automation:** SauceDemo using SeleniumLibrary + Robocop
- **Mobile Automation:** Shopee mobile application using AppiumLibrary (Android)

### Prerequisites

- Python >= 3.x
- pip >= 21.x

### For Mobile Testing (Appium)
- Node.js >= 18.x
- Java JDK = 17
- Android Studio & Android SDK

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

4. **Appium Setup (For Mobile Testing):**

   **4.1 Install Appium Server:**
   ```sh
   npm install appium
   ```

   **4.2 Install Android Driver (UiAutomator2):**
   ```sh
   appium driver install uiautomator2
   ```

   **4.3 Setup Environment Variables:**
   **Windows :**
   1. Add System Variables 
      1.1 JAVA_HOME => Path to JDK (e.g., C:\Program Files\Java\jdk-17)
      1.2 ANDROID_HOME => Path to Android SDK (e.g., C:\Users\<User>\AppData\Local\Android\Sdk)
   2. Update Path variable, append: 1.%JAVA_HOME%\bin 2.%ANDROID_HOME%\platform-tools 3.%ANDROID_HOME%\cmdline-tools\latest\bin

   **macOS/Linux :**
   Add these lines to ~/.zshrc or ~/.bash_profile and Run source ~/.zshrc after saving.
   ```sh
   export JAVA_HOME=$(/usr/libexec/java_home)
   export ANDROID_HOME=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
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

**Appium command:**
1. Open a new terminal and run:
```sh
appium
```
2. Open another terminal (ensure venv is activated) and run:
```sh
robot -d reports/results -i <tag> .
```
Make sure your emulator is running or a real device is connected via USB


### SauceDemo Testcase

- F_0001 - Login with all username
- F_0002 - Sorting product
- F_0003 - Cart
  - Add 1 item to cart
  - Add multiple items and verify cart count
  - Remove item from cart
  - Open cart with empty cart
- F_0004 - Checkout
  - Order of 1 item completed successfully
  - Order all items completed successfully
  - Checkout with missing first name
  - Checkout with missing postal code
  - Cancel checkout process

### Shopee Testcase
- F_0001 - Add product to cart
  - Buy product and checkout
  - Add product to cart then checkout
- F_0002 - Verify cart empty and cannot checkout
- F_0003 - Verify cart state