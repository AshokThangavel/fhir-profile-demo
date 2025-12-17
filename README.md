# FHIR Profile Demo

This repository demonstrates how to create, load, and validate **FHIR Profiles** using **InterSystems IRIS for Health**.
It includes a sample FHIR repository and a **Patient FHIR profile**, along with example requests to validate resources against the profile.

The project is containerized using **Docker Compose** for easy setup and execution.


## 📌 Features

- Sample FHIR repository configuration
- Patient FHIR profile loaded into IRIS for Health
- Validation of FHIR resources against profiles
- Ready-to-use `.http` request files
- Fully Dockerized environment

## ⚙️ Prerequisites

Before starting, ensure you have the following installed:

- **REST Client extension for VS Code**


## ⚙️ Installation

### 1. Clone the Repository

```bash
git clone https://github.com/AshokThangavel/fhir-profile-demo.git
cd fhir-profile-demo
````

## 🐳 Running the Application with Docker

Build and start the application using Docker Compose:

```bash
docker-compose up --build
```

This will:

* Start InterSystems IRIS for Health
* Configure the FHIR repository
* Load the Patient FHIR profile automatically

⏳ Initial startup take a few minutes.

## 🛑 Stopping the Application

To stop and remove all running containers:

```bash
docker-compose down
```

## 🔧 Technical Details

Once InterSystems IRIS is up and running:

* The FHIR repository is initialized
* The Patient FHIR profile is loaded into the repository
* Validation endpoints become available

## 📄 Sample Request Files

Navigate to the `requests` directory to find validation examples:

### 1. ValidateCorrectPatientProfile.http

* Sends a valid Patient resource
* Confirms successful validation against the profile

### 2. ValidateFailedPatientProfile.http

* Sends an invalid Patient resource
* Demonstrates validation failure and error messages

---

## 🧪 Using the `.http` Files

These `.http` files can be executed directly from **Visual Studio Code**.

### Step 1: Install REST Client Extension

Install the **REST Client** extension:

* Extension ID: `humao.rest-client`

### Step 2: Run Requests

1. Open any `.http` file in VS Code
2. Click **Send Request** above the HTTP request
3. Review the response in the VS Code output pane

---

## 🌐 Accessing InterSystems IRIS

Open the **InterSystems IRIS Management Portal** in your browser:

```
http://localhost:52773/csp/sys/UtilHome.csp
```