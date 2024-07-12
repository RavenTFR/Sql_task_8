select * from sales where order_id ~ 'CA-201(5|6)'


select order_id, product_id, sales::varchar from sales
where product_id ~* '^(t|0)[a-z](c|r|t|a)-[a-z]{2}-[0-9]{8}$'
and sales::varchar ~ '^[0-6]{3}.[0-9]{3}'
order by sales::varchar DESC;

select * from sales;

select s.order_id,s.order_date,s.sales,s.profit::varchar from sales as s
where s.order_id ~* '[A-Z]{2}-201(5|6)'
and s.profit::varchar ~* '[0-9]{2}.[0-9]{4}'
group by s.order_id,s.order_date,s.sales,s.profit::varchar;

select * from customer;

select customer_id, customer_name , age ,region ,postal_code::varchar from customer 
where customer_id ~*'^[A-Z]{2}-(1|2|6)[0-9]{4}' 
and postal_code::varchar ~* '(3|5|7)[0-9]{4}'

select s.order_id,s.customer_id,c.customer_name,s.ship_mode,c.city,c.postal_code,s.sales::varchar,s.discount from sales as s
inner join customer as c
on s.customer_id=c.customer_id
where s.sales::varchar ~* '^[1-9]{3}'
and s.discount > 0
and c.age::varchar ~ '[2-3][0-9]'
group by s.order_id,s.customer_id,c.customer_name,s.ship_mode,c.city,c.postal_code,s.sales::varchar,s.discount
order by s.discount DESC


select s.*,c.customer_name,c.age::varchar from sales as s
right join customer as c
on s.customer_id=c.customer_id
where c.age::varchar ~'[6-9]{2}'

select * from sales
	
select order_id,ship_mode as "Shipping mode" ,ship_date from sales where ship_mode ~ '^(F|S)[a-z]{7} Class'
order by ship_date::varchar DESC

select * from product

	select * from customer

select p.product_id,p.product_name,s.sales,s.customer_id,s.profit::varchar,c.customer_id,c.age::varchar,c.region from product as p
inner join sales as s
on p.product_id=s.product_id
inner join customer as c
on c.customer_id=s.customer_id
where s.profit::varchar ~'^[2-6]{2}'
and c.age::varchar ~'[1-6](0|5|4|8)'
order by c.age DESC;

select * from sales
	
select c.*,s.sales::varchar from customer as c
left join sales as s
on c.customer_id=s.customer_id
where s.sales::varchar ~'[0-9]{3}'
and first_name ~ 'C'


select * from customer where age::varchar ~ '^[2-3](2|3|5|8)$'
