# ✅ Database Normalization to 3NF

This document describes the process of applying normalization principles to ensure that the Airbnb Clone database schema is in **Third Normal Form (3NF)**.

---

## 📘 Overview of Normalization

Normalization is a process to eliminate data redundancy and ensure data integrity. The steps are:

### 🔹 1NF (First Normal Form)
- Eliminate repeating groups.
- Ensure atomic (indivisible) values in each cell.

### 🔹 2NF (Second Normal Form)
- Be in 1NF.
- Remove partial dependencies (non-key attributes depend on the entire primary key).

### 🔹 3NF (Third Normal Form)
- Be in 2NF.
- Remove transitive dependencies (non-key attributes depend only on the primary key).

---

## 🔍 Step-by-Step Normalization

### 🧑‍💼 **User Table**

**Current Design:**
- Already in 3NF.
- No repeating groups, partial, or transitive dependencies.

**Notes:**
- `email` is unique.
- `role` is atomic (ENUM).
- No derived fields (like full_name).

✅ **No changes required.**

---

### 🏠 **Property Table**

**Current Design:**
- Depends fully on `property_id`.
- All fields are atomic.

**Potential Issue:**
- `host_id` is a foreign key — valid.
- `location` is a simple string (not normalized).


✅ **3NF-compliant as is**, but can be further normalized if geographical granularity is needed.

---

### 📅 **Booking Table**

**Current Design:**

* Composite keys are not used; each booking has a unique `booking_id`.
* All attributes depend solely on the primary key.

✅ **3NF-compliant**

---

### 💳 **Payment Table**

**Current Design:**

* All fields are atomic and depend on `payment_id`.

**Notes:**

* `payment_method` is atomic (ENUM).
* Booking is uniquely referenced.

✅ **No normalization issues.**

---

### 🌟 **Review Table**

**Current Design:**

* All fields atomic.
* No derived or repeating data.

✅ **Already in 3NF.**

---

### 💬 **Message Table**

**Current Design:**

* All fields are atomic and relate directly to `message_id`.

**No transitive or partial dependencies.**

✅ **3NF-compliant.**

---

## 🔚 Summary

The current schema meets 3NF requirements. Optional changes (like extracting `location` or removing `total_price`) depend on performance vs. redundancy tradeoffs.
