use houseofleather;

#question 01
# return all transactions for a specific week

SELECT * FROM sales where trans_date
between '2016-07-19' and '2016-07-21' ;


#question 02
#create trigger that updates stock levels once a sale takes place

create table Stock_update
(
pro_id

DELIMITER $$
CREATE TRIGGER Customer_update
BEFORE UPDATE ON customers
FOR EACH ROW BEGIN
INSERT INTO Customer_History
SET update_action = 'update',
cus_id= OLD.cus_id,
cus_fname=OLD.cus_fname,
cus_lname = OLD.cus_lname,
cus_add=OLD.cus_add,
cus_tel= OLD.cus_tel,
cus_city=OLD.cus_city,
cust_email=OLD.cust_email,
changedate = NOW(); 
END 
$$ DELIMITER ;


# question 3 create a view of all stock grouped by supplier
use houseofleather;

select * from products;
select * from suppliers;

drop view Stock_details;
create view Stock_details as
select * from products right join suppliers on products.pro_id=suppliers.sup_id group by sup_id;

select * from Stock_details;

#q8
DELIMITER //
create procedure CustomerSales()
begin
select * from customers left join sales on customers.cus_id = sales.trans_id;
end //
#



#
#
#
#
#
#

# question 9
# create trigger that update customer history once customer contact details are updated

drop table Customer_Contact_History;
CREATE TABLE Customer_Contact_History 
( 
cus_id int(11) not null ,
cus_add varchar(50),
cus_city varchar(30),
cus_tel varchar(30),
cust_email varchar(50),
change_date_time datetime default null,
update_action varchar(50) DEFAULT NULL
);
drop trigger Customer_update;
DELIMITER $$
CREATE TRIGGER Customer_update
BEFORE UPDATE ON customers
FOR EACH ROW BEGIN
INSERT INTO Customer_Contact_History
SET update_action = 'update',
cus_id= OLD.cus_id,
cus_add=OLD.cus_add ,
cus_tel= OLD.cus_tel  ,
cus_city=OLD.cus_city ,
cust_email=OLD.cust_email,
change_date_time = NOW(); 
END 
$$ DELIMITER ;

update customers
set cus_tel = 0123344534 where cus_id= 1004;

select  * from Customer_Contact_History;





