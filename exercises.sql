-- #1
-- INSERT INTO rental_records (veh_reg_no, customer_id, start_date, end_date, lastUpdated)
-- VALUES
--    (
--     'SBA1111A', 
--     (SELECT customer_id FROM customers WHERE name='Angel'),
--     CURDATE(),
--     DATE_ADD(CURDATE(), INTERVAL 10 DAY),
--     NULL
--     );

-- #2
-- INSERT INTO rental_records (veh_reg_no, customer_id, start_date, end_date, lastUpdated)
-- VALUES
--    (
--     'GA5555E', 
--     (SELECT customer_id FROM customers WHERE name='Kumar'),
--     CURDATE(),
--     DATE_ADD(CURDATE(), INTERVAL 3 MONTH),
--     NULL
--     );

-- #3
-- SELECT r.start_date 'Start Date', r.end_date 'End Date', r.veh_reg_no 'Vehicle Reg. Number', v.brand 'Brand', c.name 'Customer Name'
-- FROM (rental_records r INNER JOIN vehicles v USING (veh_reg_no)) INNER JOIN customers c USING (customer_id)
-- ORDER BY v.category, r.start_date;

-- #4
-- SELECT r.start_date 'Start Date', r.end_date 'End Date', r.veh_reg_no 'Vehicle Reg. Number', v.brand 'Brand', c.name 'Customer Name'
-- FROM (rental_records r INNER JOIN vehicles v USING (veh_reg_no)) INNER JOIN customers c USING (customer_id)
-- WHERE r.end_date < CURDATE()
-- ORDER BY v.category, r.start_date;

-- #5
-- SELECT v.veh_reg_no 'Vehicle Reg. Number', c.name 'Customer Name', r.start_date 'Start Date', r.end_date 'End Date'
-- FROM (rental_records r INNER JOIN vehicles v USING (veh_reg_no)) INNER JOIN customers c USING (customer_id)
-- WHERE '2012-01-10' BETWEEN r.start_date AND r.end_date;

-- #6
-- SELECT v.veh_reg_no 'Vehicle Reg. Number', c.name 'Customer Name', r.start_date 'Start Date', r.end_date 'End Date'
-- FROM (rental_records r INNER JOIN vehicles v USING (veh_reg_no)) INNER JOIN customers c USING (customer_id)
-- WHERE CURDATE() BETWEEN r.start_date AND r.end_date;

-- #7
-- SELECT v.veh_reg_no 'Vehicle Reg. Number', c.name 'Customer Name', r.start_date 'Start Date', r.end_date 'End Date'
-- FROM (rental_records r INNER JOIN vehicles v USING (veh_reg_no)) INNER JOIN customers c USING (customer_id)
-- WHERE (r.start_date BETWEEN '2012-01-03' AND '2012-01-18')
-- OR (r.end_date BETWEEN '2012-01-03' AND '2012-01-18')
-- OR (r.start_date < '2012-01-03' AND r.end_date > '2012-01-18');

-- #8
-- SELECT v.veh_reg_no 'Vehicle Reg. Number', v.brand 'Brand', v.desc 'Description'
-- FROM vehicles v LEFT JOIN rental_records r ON v.veh_reg_no = r.veh_reg_no
-- WHERE v.veh_reg_no NOT IN (
-- SELECT veh_reg_no
-- FROM rental_records
-- WHERE start_date < '2012-01-10'
-- AND end_date > '2012-01-10'
-- );

-- #9
-- SELECT v.veh_reg_no 'Vehicle Reg. Number', v.brand 'Brand', v.desc 'Description'
-- FROM vehicles v
-- WHERE v.veh_reg_no NOT IN (
-- SELECT v.veh_reg_no
-- FROM vehicles v LEFT JOIN rental_records r USING (veh_reg_no)
-- WHERE (r.start_date BETWEEN '2012-01-03' AND '2012-01-18')
-- OR (r.end_date BETWEEN '2012-01-03' AND '2012-01-18')
-- OR (r.start_date < '2012-01-03' AND r.end_date > '2012-01-18')
-- );

-- #10
-- SELECT v.veh_reg_no 'Vehicle Reg. Number', v.brand 'Brand', v.desc 'Description'
-- FROM vehicles v
-- WHERE v.veh_reg_no NOT IN (
-- SELECT v.veh_reg_no
-- FROM vehicles v LEFT JOIN rental_records r USING (veh_reg_no)
-- WHERE (r.start_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 10 DAY))
-- OR (r.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 10 DAY))
-- OR (r.start_date < CURDATE() AND r.end_date > DATE_ADD(CURDATE(), INTERVAL 10 DAY))
-- );