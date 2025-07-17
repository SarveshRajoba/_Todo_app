# Todo App - Setup Guide

This guide provides the essential steps to get this application running on your local machine.

---

### **1. Requirements**

The following software versions are recommended for optimal performance and security. While slightly older versions may also work, it's best to use the latest stable releases.

* **Git:** v2.46 or newer
* **Ruby:** v3.4.2 or newer
* **Rails:** v8.0.1 or newer
* **Node.js:** v22.4.0 (LTS) or newer
* **PostgreSQL:** v17 or newer

---

### **2. Setup and Run Instructions**

Follow these steps in your terminal to set up and run the project.

**a. Clone the Project**
```sh
git clone [https://github.com/SarveshRajoba/_Todo_app.git](https://github.com/SarveshRajoba/_Todo_app.git)
cd _Todo_app
```

**b. Set Up the Back-End**
Navigate to the back-end (Rails) directory and run the following commands:
```sh
# Install required gems
bundle install

# Create and migrate the database
rails db:create
rails db:migrate
```

**c. Set Up the Front-End**
Navigate to the front-end (React/Vite) directory and run:
```sh
# Install required packages
npm install
```

**d. Run the Application**
You need to run the back-end and front-end servers simultaneously in **two separate terminals**.

* **In Terminal 1 (for the Back-End):**
    ```sh
    # From the Rails directory
    rails s
    ```
    > The API will now be running at `http://localhost:3000`.

* **In Terminal 2 (for the Front-End):**
    ```sh
    # From the front-end directory
    npm start
    ```
    > The app will now be running at the address shown in your terminal (e.g., `http://localhost:3001`).

**e. View the App**
Open your browser and navigate to the front-end address (e.g., `http://localhost:3001`) to use the application.
