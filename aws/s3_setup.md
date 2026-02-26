# s3_setup
---

# 📦 AWS S3 Setup – Landing Zone

## 📌 Overview

This document describes the initial Amazon S3 setup for the Data Lake landing layer.

---

## 1️⃣ Bucket Created

* **Bucket Name:** `landing-zone-<account>-ap-south-1`
* **Region:** ap-south-1 (Mumbai)
* **Purpose:** Raw data ingestion (Landing Zone)
* **Storage Class:** Standard
* **Block Public Access:** Enabled

---

## 2️⃣ Folder (Object Key Prefix) Created

Inside the bucket, the following folder (prefix) was created:

```
data-lake-airbnb/
```

---

## 3️⃣ Files Uploaded

The following CSV files were ingested into:

```
s3://landing-zone-<account>-ap-south-1/data-lake-airbnb/
```

| Name         | Type | 
| ------------ | ---- | 
| bookings.csv | csv  | 
| hosts.csv    | csv  | 
| listings.csv | csv  | 

---

## 📂 Final S3 Structure

```
landing-zone-<account>-ap-south-1/
│
└── data-lake-airbnb/
      ├── bookings.csv
      ├── hosts.csv
      └── listings.csv
```

---

## 🎯 Purpose of This Setup

* Store raw dataset files
* Act as Landing Layer for downstream processing ( Snowflake / DBT/ ETL)
* Maintain structured folder-based organization
