--연습문제--
/*1번 각각 4개의 테이블를 모두 검색하시오*/
select cid "고객번호", cname "고객이름", city "거주도시", discnt "고객할인율"
from customers;

select aid "판매자번호", aname "판매자이름", acity "거주도시", apercent "판매자수수료"
from agents;

select pid "상품번호", pname "상품이름", pcity "상품보관도시", quantity "상품수량", price "상품가격"
from products;

select ordno "주문번호", month "주문월", cid, aid, pid, qty "주문수량", wons "주문가격"
from orders;

/*2번 고객중에 서울에 사는 고객을 검색하시오.*/
select cname, city
from customers
where city = '서울';

/*3번 고객중에 서울에 살고 있지 않는 고객을 검색하시오.*/ 
select cname, city
from customers
where city != '서울';

/*4번 고객중에 서울에 살고 할인율이 10%이상을 검색하시오.*/
select cname, city, discnt
from customers
where city = '서울' and discnt>=10;

/*5번 고객중에 대전에 살고 있지 않거나 또는 할인율이 8%이상을 검색하시오.*/
select cname, city, discnt
from customers
where city != '대전' or discnt>=8;

/*6번 판매자 중에 부산, 대전에 살고 있는 사람의 이름을 검색하시오.*/
select *
from agents
--where acity = '부산' or acity = '대전';
where acity in ('부산', '대전');

/*7번 판매자 중에 수수료가 가장 높은 사람의 수수료를 구하시오.*/
select max(apercent)from agents;

/*7-1번 판매자 중에 수수료가 가장 높은 사람의 이름을 구하시오.*/
--sub query(하위질의)
select aname, apercent
from agents
where apercent = (select max(apercent)from agents);

/*7-2번 가장 높은 할인율(discnt)을 가진 고객의 이름(cname)과 
가장 낮은 할인율을 가진 고객의 이름을 구하시오.*/

/*8번 부산에 살고 성씨가 김씨인 사람의 판매자 번호를 검색하시오*/
select aid, aname, acity
from agents
where acity = '부산' and --aname like '김%';
                         --'김' = substr(aname, 1,1);
                        instr(aname,'김',1) = 1;
                        
/*9번 상품가격이 1000원 이상인 상품이름과 재고수량을 검색하시오.*/
select pname, quantity, price
from products
where price>=1000;


/*10번. 제품보관도시가 대전이지 않거나 또는 가격이 500원에서 1500원 
사이의 제품번호를 검색하시오.*/
select pid
from products
where pcity!='대전' or --price BETWEEN 500 and 1500;
                      (price>=500 and price<=1500);

/*11번 주문수량이 1000개를 초과한 상품번호를 검색하시오.(중복은 제거)*/
select distinct pid
from orders
where qty>1000;

/*12번 주문날짜가 1월 아니고 주문액수가 500,000원에서 800,000원사이에 
주문한 고객번호를 검색하시오.*/
select distinct cid
from orders
where month!='1월' and wons BETWEEN 500000 and 800000;

/*13번 대전에 살고 있는 고객이 주문한 상품번호를 가져오시오.*/
--join
select city, ordno
from customers c join orders o on c.cid=o.cid
where city = '대전';

--sub query
select ordno
from orders
where cid in (select cid from customers where city = '대전');

select cid from customers where city = '대전';

/*14번 가장 비싼 상품을 주문한 고객번호를 가져오시오.*/
select pid, price , pname
from products
order by 2 desc; -- p06

--가장 비싼 상품번호
select pid
from products
where price = (select max(price) from products);

select cid
from orders
where pid = (select pid 
             from products
             where price = (select max(price) from products));

/*15번 홀수달에 주문한 고객명을 가져오시오.*/
--join
select distinct cname, o.month
from orders o join customers c on o.cid=c.cid
where mod(substr(o.month,1,1),2) = 1
order by 2;

--sub
select distinct cname
from customers
where cid in (select cid 
              from orders 
              where mod(substr(month,1,1),2) = 1);

/*16번 서울에 사는 고객의 정보를 삭제하라.*/
--테이블 복사(제약은 복사되지 않는다.)
create table customers2
as
select * from customers;

delete from customers2
where city = '서울';

/*17번 대전에 살고 있지 않고 김,이,박 성을 가진 고객을 삭제하라.*/
delete from customers2
where city!='대전' and (cname like '김%' or 
                       cname like '이%' or
                       cname like '박%');

/*18번 주문수량이 400개이하의 주문은 모두 삭제 하시오.*/
create table orders2
as
select * from orders;

delete from orders2
where qty<= 400;

/*19번 주문날짜가 4월이고 주문액수가 720,000원 주문을 삭제하라.*/
delete from orders2
where month = '4월' and wons = 720000;

/*20번 대전에 살고 있는 고객의 거주지를 부산으로 변경하라.*/
update customers2
set city = '부산'
where city = '대전';

/*21번 할인율이 12% 이상인 고객의 고객번호를 c007로 변경하라.*/
update customers2
set cid = 'c007'
where discnt >=12; 

/*22번 고객테이블에서 이름은 오름차순 
그리고 거주지는 내림차순으로 가져오시오.*/
select cname, city
from customers
--order by 1 asc, 2 desc;
order by cname, city desc;


/*23번 부산에 살고 있는 판매자 중에 수수료가 낮은 순서로 가져오시오.*/
select * from agents
order by apercent;

/*24번 제품 보관도시별로 가격의 평균값을 평균값이 높은 순서대로 가져오시오.*/
select pcity, round(avg(price),2) "평균값"
from products
group by pcity
order by 2 desc;


/*25번 제품가격이 700원 이상인 제품중에 제품 보관도시별로 재고수량을 
합을 구하시오.*/
select pcity , sum(quantity) "재고수량합"
from products
where price >= 700
group by pcity
order by 2;


/*26번 제품가격이 1000원 이상의 제품중에 제품 보관도시별로 제품 평균가격이 
1200원 이상인것만 가져오시오.*/

select pcity , round(avg(price),2) "평균값"
from products
where price>=1000 --기본적인 조건
group by pcity
having avg(price)>= 1200 --group by 조건
order by 2;









