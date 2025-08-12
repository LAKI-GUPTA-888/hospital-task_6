-- Task 6: Subqueries and Nested Queries for Hospital Database

use Hospital;

-- 1. Scalar subquery in WHERE clause: Patient with the highest total bill

SELECT patient_id, first_name, last_name
FROM Patients
WHERE patient_id = (
    SELECT patient_id
    FROM Bills
    ORDER BY total_amount DESC
    LIMIT 1
);


-- 2. Scalar subquery in SELECT clause: Show each bill and the average bill amount
SELECT bill_id, patient_id, total_amount,
    (SELECT ROUND(AVG(total_amount), 2) FROM Bills) AS avg_bill_amount
FROM Bills;


-- 3. Correlated subquery in WHERE clause: Patients who have bills above their own average
SELECT p.patient_id, p.first_name, p.last_name
FROM Patients p
WHERE EXISTS (
    SELECT 1
    FROM Bills b
    WHERE b.patient_id = p.patient_id
    AND b.total_amount > (
        SELECT AVG(total_amount)
        FROM Bills b2
        WHERE b2.patient_id = p.patient_id
    )
);


-- 4. Subquery with IN: Patients who have appointments with cardiologists
SELECT patient_id, first_name, last_name
FROM Patients
WHERE patient_id IN (
    SELECT a.patient_id
    FROM Appointments a
    JOIN Doctors d ON a.doctor_id = d.doctor_id
    WHERE d.specialization = 'Cardiology'
);


-- 5. Subquery in FROM clause: Average stay duration per department
SELECT room_id,  dept_avg.avg_stay_days
FROM (
    SELECT r.room_id, ROUND(AVG(DATEDIFF(COALESCE(discharged_on, NOW()), admitted_on)), 2) AS avg_stay_days
    FROM Admissions a
    JOIN Rooms r ON a.room_id = r.room_id
    GROUP BY r.room_id
) AS dept_avg;


-- 6. Subquery with NOT IN: Doctors who have never had an appointment
SELECT doctor_id, first_name, last_name
FROM Doctors
WHERE doctor_id NOT IN (
    SELECT DISTINCT doctor_id
    FROM Appointments
);


-- 7. Subquery with ANY: Patients with a bill greater than any Neurology patient
SELECT patient_id, first_name, last_name
FROM Patients
WHERE patient_id IN (
    SELECT b.patient_id
    FROM Bills b
    WHERE b.total_amount > ANY (
        SELECT total_amount
        FROM Bills b2
        JOIN Admissions a2 ON b2.admission_id = a2.admission_id
        JOIN Rooms r2 ON a2.room_id = r2.room_id
        JOIN Departments d2 ON r2.room_id = d2.department_id
        WHERE d2.name = 'Neurology'
    )
);
