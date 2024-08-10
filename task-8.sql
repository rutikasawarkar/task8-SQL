--1)find if we can do insert,update,alter,delete on veiw

select * from product

create view product_data as
select p.product_id,product_name,p.category,sum(sales),avg(sales) from sales as s
  inner join product as p
   on p.product_id=s.product_id
   group by p.product_id,product_name,p.category

select * from product_data

--insert

insert into product_data(product_name,category) values (wireless bluetooth headphones,Electronics)---it gives Error

--Update

update product_data set product_name= 'dining table' where product_id='OFF-AR-10002833'--it gives Error


--alter

alter table product_data add column Price double precision---it gives error

--delete

delete from product_data where product_id='OFF-LA-10000262'  --it gives error


--2) Having Subquery

select * from customer

select customer_id from customer where customer_id in(
	 select customer_id
	 from sales
 	group by customer_id 
	having sum(sales)>4000)

