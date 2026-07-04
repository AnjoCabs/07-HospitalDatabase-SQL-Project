-- DISCLAIMER:
-- This data analysis is conducted solely for educational and training purposes. It does not represent or reflect the
-- operations, performance, or practices of any real hospital, healthcare institution, or affiliated organization. All
-- data used is fictional or anonymized and intended for SQL learning and analytical skill development only.

-- DATA SOURCE: https://www.youtube.com/watch?v=euBb9x7kom4&t=8417s



USE hospital_database;

CREATE TABLE appointment
(`id` INT NOT NULL,
  `appointment_id` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `doctor_id` varchar(255) DEFAULT NULL,
  `appointment_date` DATE DEFAULT NULL,
  `appointment_time` TIME DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `suggest` varchar(255) DEFAULT NULL,
  `fees` INT DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `discount` INT DEFAULT NULL,
  `diagnosis` varchar(255) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
  );
  
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/appoinment1.csv'
INTO TABLE appointment
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE beds 
(	`id` INT NOT NULL,
	`bed_id` varchar(255) DEFAULT NULL,
	`room_id` varchar(255) DEFAULT NULL,
	`status` varchar(255) DEFAULT NULL,
	`patient_id` varchar(255) DEFAULT NULL,
	`occupied_from` DATE DEFAULT NULL,
	`occupied_till` DATE DEFAULT NULL,
	`upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/beds.csv'
INTO TABLE beds
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE departments 
(
	`id` INT NOT NULL,
  `department_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `floor` INT DEFAULT NULL,
  `head_doctor_id` varchar(255) DEFAULT NULL,
  `total_staff` INT DEFAULT NULL,
  `phone_extension` varchar(255) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/department.csv'
INTO TABLE departments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE doctors 
(
	`id` INT NOT NULL,
  `doctor_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `specialization` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `salary` INT DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `availability` varchar(255) DEFAULT NULL,
  `joining_date` DATE DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `experience_years` INT DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `Img` varchar(255) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/doctor.csv'
INTO TABLE doctors
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE hospital_bills 
(
	`id` INT NOT NULL,
  `bill_id` varchar(255) DEFAULT NULL,
  `patient_id` varchar(255) DEFAULT NULL,
  `admission_date` DATE DEFAULT NULL,
  `discharge_date` DATE DEFAULT NULL,
  `room_charges` INT DEFAULT NULL,
  `surgery_charges` INT DEFAULT NULL,
  `medicine_charges` INT DEFAULT NULL,
  `test_charges` INT DEFAULT NULL,
  `doctor_fees` INT DEFAULT NULL,
  `other_charges` INT DEFAULT NULL,
  `total_amount` INT DEFAULT NULL,
  `discount` INT DEFAULT NULL,
  `paid_amount` INT DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/hospital_bills.csv'
INTO TABLE hospital_bills
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE medical_stock
(
	`id` INT NOT NULL,
	`medicine_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `cost_price` DECIMAL(8,1) DEFAULT NULL,
  `unit_price` INT DEFAULT NULL,
  `stock_qty` INT DEFAULT NULL,
  `expiry_date` DATE DEFAULT NULL,
  `manufacture_date` DATE DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `reorder_level` INT DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/Medical_Stock.csv'
INTO TABLE medical_stock
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE medical_tests 
(
	`id` INT NOT NULL,
  `test_id` varchar(50) DEFAULT NULL,
  `test_name` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `department_id` varchar(50) DEFAULT NULL,
  `cost` INT DEFAULT NULL,
  `duration_minutes` INT DEFAULT NULL,
  `fasting_required` varchar(50) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/medical_test.csv'
INTO TABLE medical_tests
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE medicine_patient
(
  `id` int NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `medicine_id` varchar(50) DEFAULT NULL,
  `qty` INT DEFAULT NULL,
  `date` DATE DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/medicine_patient.csv'
INTO TABLE medicine_patient
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE patient 
(
  `id` INT NOT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` INT DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `weight` INT DEFAULT NULL,
  `blood_group` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `admission_date` DATE DEFAULT NULL,
  `discharge_date` DATE,
  `status` varchar(50) DEFAULT NULL,
  `Img` varchar(255) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/patient.csv'
INTO TABLE patient
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE patient_tests 
(
  `id` int NOT NULL,
  `patient_test_id` varchar(50) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `test_id` varchar(50) DEFAULT NULL,
  `doctor_id` varchar(50) DEFAULT NULL,
  `test_date` DATE DEFAULT NULL,
  `result_date` DATE DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `result` varchar(50) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `amount` INT DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `discount` INT DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/Patient_Tests.csv'
INTO TABLE patient_tests
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE rooms 
(
  `id` int NOT NULL,
  `room_id` varchar(50) DEFAULT NULL,
  `department_id` varchar(50) DEFAULT NULL,
  `room_type` varchar(50) DEFAULT NULL,
  `floor` INT DEFAULT NULL,
  `capacity` INT DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `daily_charge` INT DEFAULT NULL,
  `avgmontlymaintenancecost` INT DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/Rooms.csv'
INTO TABLE rooms
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE satisfaction_score 
(
  `id` int NOT NULL,
  `satisfaction_id` varchar(50) DEFAULT NULL,
  `patient_id` varchar(50) DEFAULT NULL,
  `doctor_id` varchar(50) DEFAULT NULL,
  `rating` INT DEFAULT NULL,
  `feedback` varchar(255) DEFAULT NULL,
  `date` DATE DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);


LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/satisfaction_score.csv'
INTO TABLE satisfaction_score
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE staff 
(
  `id` int NOT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `department_id` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `salary` INT DEFAULT NULL,
  `joining_date` DATE DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/staff.csv'
INTO TABLE staff
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

CREATE TABLE supplier 
(
  `id` int NOT NULL,
  `supplier_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `pincode` varchar(50) DEFAULT NULL,
  `state1` varchar(50) DEFAULT NULL,
  `contract_start_date` DATE DEFAULT NULL,
  `contract_end_date` DATE DEFAULT NULL,
  `upload_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

LOAD DATA LOCAL INFILE 'C:/Users/billy/Desktop/DataSets/HospitalDataBase/supplier.csv'
INTO TABLE supplier
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- PATIENT AND TREATMENT INSIGHTS
-- 1. How many patients are currently admitted vs. discharged?
SELECT
	SUM(CASE WHEN
			status = 'Discharged' THEN 1 END) AS numberDischarged,
	SUM(CASE WHEN
			status = 'Admitted' THEN 1 END) AS numberAdmitted
FROM patient;


-- 2. What are the most common diagnosis?
SELECT
	diagnosis,
    COUNT(*) AS count
FROM appointment
GROUP BY diagnosis 
ORDER BY count DESC;


-- 3. Which patients had the longest hospital stays?
SELECT
	patient_id,
    name,
    age,
    gender,
    weight,
    blood_group,
    (discharge_date - admission_date) AS numberDays
FROM patient
ORDER BY numberDays DESC
LIMIT 1;

-- 4. How many patients were admitted each month this year?
SELECT
    MONTH(admission_date) AS month_number,
    MONTHNAME(admission_date) AS month_name,
    COUNT(*) AS patient_count
FROM 
    patient
GROUP BY 
    month_number,
    month_name
ORDER BY 
    month_number;
    
-- 5. Which department has the highest patient count?
SELECT
    dp.department_id,
    COUNT(a.patient_id) AS patient_count
FROM appointment a
JOIN doctors d
    ON a.doctor_id = d.doctor_id 
JOIN departments dp
    ON d.department = dp.name
GROUP BY dp.department_id
ORDER BY patient_count DESC;

-- 6. Which blood group is most common among admitted patients?
SELECT
	blood_group,
    COUNT(*) AS blood_count
FROM patient
GROUP BY blood_group
ORDER BY blood_count DESC;

-- 7. Which doctor treated the most patients?
SELECT
	a.doctor_id,
    d.name,
    specialization,
    COUNT(a.patient_id) AS patient_count
FROM appointment a
JOIN doctors d
	ON a.doctor_id = d.doctor_id
GROUP BY
	a.doctor_id,
    d.name,
    specialization
ORDER BY patient_count DESC;

-- 8. How many patients have been prescribed medication this month?
SELECT
    COUNT(suggest) AS suggest_medication
FROM appointment
WHERE suggest LIKE '%medication%';

-- MEDICAL STOCK AND INVENTORY
-- 9.Which supplier provides the most types of medicines?
SELECT
	ms.supplier_id,
    s.name,
    COUNT(medicine_id) AS supply_count
FROM medical_stock ms
JOIN supplier s
	ON ms.supplier_id = s.supplier_id
GROUP BY
	ms.supplier_id,
    s.name;
    
-- 10. What is the total value of current medical stock?
SELECT
	SUM(stock_qty * cost_price) AS total_value
FROM medical_stock;

-- 11. What medicines were gonna be expired in February 2025?
SELECT
	medicine_id,
    name,
    category
FROM medical_stock
WHERE
	YEAR(expiry_date) = 2025
    AND MONTHNAME(expiry_date) = 'February';
    
-- 12. What is the average cost and markup for each category of medicine?
SELECT
	name,
    (unit_price - cost_price) AS markupValue
FROM medical_stock
GROUP BY 
	name,
    unit_price,
    cost_price
ORDER BY markupValue DESC; 

-- FINANCIAL AND BILLING REPORT
-- 13. What is the total revenue generated per month?
SELECT
    MONTHNAME(admission_date) AS monthName,
    SUM(paid_amount) AS total_revenue
FROM hospital_bills
WHERE payment_status = 'Paid'
GROUP BY MONTHNAME(admission_date);

-- 14. Which patients have unpaid bills or partial payments?
SELECT
    hb.patient_id,
    p.name,
    hb.total_amount
FROM hospital_bills hb
JOIN patient p
    ON hb.patient_id = p.patient_id
WHERE hb.payment_status = 'Unpaid';


-- 15. Which payment method is most commonly used?
SELECT
	payment_method,
    COUNT(*) AS payment_count
FROM hospital_bills
GROUP BY payment_method
ORDER BY payment_count DESC;

-- 16. How much was spent on room charges vs. doctor fees?
SELECT
	SUM(doctor_fees) AS total_doctorfees,
    SUM(room_charges) AS total_roomCharges
FROM hospital_bills;

-- 17. What is the average hospital bill?
SELECT
	AVG(paid_amount) AS average_bill
FROM hospital_bills;

-- 18. Which department generates the most revenue?
SELECT
    dt.department_id,
    dt.name AS department_name,
    SUM(hb.paid_amount) AS total_bill
FROM hospital_bills hb
JOIN appointment a
    ON hb.patient_id = a.patient_id
JOIN doctors d
    ON a.doctor_id = d.doctor_id
JOIN departments dt
    ON d.department = dt.name
GROUP BY
    dt.department_id,
    dt.name
ORDER BY dt.department_id,
	total_bill DESC;

-- DOCTORS AND STAFF MANAGEMENT
-- 19. Which doctors are currently available?
SELECT
	doctor_id,
    name,
    specialization,
    department,
    status,
    qualification,
    experience_years
FROM doctors
WHERE availability = 'Available';

-- 20. What is the average experience (in years) per specialization?
SELECT 
	specialization,
    ROUND(AVG(experience_years),2) AS average_yearsExperience
FROM doctors
GROUP BY specialization
ORDER BY average_yearsExperience DESC;

-- 21. Who is the highest paid doctor and in which department?
SELECT
    doctor_id,
    name,
    specialization,
    department,
    salary
FROM doctors
WHERE salary = (SELECT MAX(salary) FROM doctors);

-- 22. What is the staff distribution by role and department?
SELECT
    d.department_id,
    d.name AS department_name,
    s.role,
    COUNT(*) AS staff_count
FROM staff s
JOIN departments d ON s.department_id = d.department_id
GROUP BY d.department_id, d.name, s.role
ORDER BY d.department_id, s.role;

-- 23. Which doctor has the highest satisfaction rating?
SELECT
    sc.doctor_id,
    d.name,
    AVG(sc.rating) AS avg_rating
FROM satisfaction_score sc
JOIN doctors d ON sc.doctor_id = d.doctor_id
GROUP BY sc.doctor_id, d.name
HAVING AVG(sc.rating) = (
    SELECT MAX(avg_rating)
    FROM (
        SELECT doctor_id, AVG(rating) AS avg_rating
        FROM satisfaction_score
        GROUP BY doctor_id
    ) AS avg_subquery
);

-- ROOMS AND BEDS UTILIZATION 
-- 24. Which rooms are currently occupied?
SELECT
	room_id,
    department_id,
    room_type,
    status,
    daily_charge
FROM rooms
WHERE status = 'Occupied';

-- 25. How many beds are available right now per floor?
SELECT
    floor,
    SUM(CASE WHEN 
			status = 'Available' THEN 1 ELSE 0 END) AS available_rooms,
    COUNT(*) AS total_rooms,    
    ROUND(SUM(CASE WHEN status = 'Available' THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),2) AS availability_ratePercentage                      
FROM rooms
GROUP BY floor
ORDER BY floor;

-- 26. Which rooms require the most maintenance cost?
SELECT
    room_id,
    room_type,
    avgmontlymaintenancecost
FROM rooms
WHERE avgmontlymaintenancecost = (
    SELECT MAX(avgmontlymaintenancecost)
    FROM rooms);


-- TEST AND DIAGNOSTIC TRENDS
-- 27. Which tests are most frequently performed?
SELECT
	pt.test_id,
    mt.test_name,
    COUNT(patient_test_id) AS count_test
FROM patient_tests pt
JOIN medical_tests mt
	ON pt.test_id = mt.test_id
GROUP BY 	
	pt.test_id,
    mt.test_name
ORDER BY count_test DESC;

-- 28. How many tests required fasting?
SELECT
	COUNT(*)
FROM medical_tests
WHERE fasting_required LIKE '%Yes%';

-- 29. Which doctor prescribed the highest number of tests?
SELECT
	pt.doctor_id,
    name,
    specialization,
    department,
    COUNT(test_id) AS total_count
FROM patient_tests pt
JOIN doctors d
	ON pt.doctor_id = d.doctor_id
GROUP BY
	pt.doctor_id,
    name,
	specialization,
    department
ORDER BY total_count DESC;

-- 30. How much revenue is generated from tests monthly?
SELECT
	MONTH(test_date) AS monthNum,
    MONTHNAME(test_date) AS month_name,
    SUM(amount) AS total_amount
FROM patient_tests
GROUP BY 
	MONTH(test_date),
    MONTHNAME(test_date)
    
-- PATIENT SATISFACTION INSIGHTS
-- 31. What is the average satisfaction rating per department?
SELECT
	department,
    ROUND(AVG(rating),2) AS average_rating
FROM satisfaction_score
GROUP BY department
ORDER BY average_rating DESC;

-- DISCLAIMER:
-- This data analysis is conducted solely for educational and training purposes. It does not represent or reflect the
-- operations, performance, or practices of any real hospital, healthcare institution, or affiliated organization. All
-- data used is fictional or anonymized and intended for SQL learning and analytical skill development only.

-- DATA SOURCE: https://www.youtube.com/watch?v=euBb9x7kom4&t=8417s


