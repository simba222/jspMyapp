--��������--
/*1�� ���� 4���� ���̺� ��� �˻��Ͻÿ�*/
select cid "����ȣ", cname "���̸�", city "���ֵ���", discnt "��������"
from customers;

select aid "�Ǹ��ڹ�ȣ", aname "�Ǹ����̸�", acity "���ֵ���", apercent "�Ǹ��ڼ�����"
from agents;

select pid "��ǰ��ȣ", pname "��ǰ�̸�", pcity "��ǰ��������", quantity "��ǰ����", price "��ǰ����"
from products;

select ordno "�ֹ���ȣ", month "�ֹ���", cid, aid, pid, qty "�ֹ�����", wons "�ֹ�����"
from orders;

/*2�� ���߿� ���￡ ��� ���� �˻��Ͻÿ�.*/
select cname, city
from customers
where city = '����';

/*3�� ���߿� ���￡ ��� ���� �ʴ� ���� �˻��Ͻÿ�.*/ 
select cname, city
from customers
where city != '����';

/*4�� ���߿� ���￡ ��� �������� 10%�̻��� �˻��Ͻÿ�.*/
select cname, city, discnt
from customers
where city = '����' and discnt>=10;

/*5�� ���߿� ������ ��� ���� �ʰų� �Ǵ� �������� 8%�̻��� �˻��Ͻÿ�.*/
select cname, city, discnt
from customers
where city != '����' or discnt>=8;

/*6�� �Ǹ��� �߿� �λ�, ������ ��� �ִ� ����� �̸��� �˻��Ͻÿ�.*/
select *
from agents
--where acity = '�λ�' or acity = '����';
where acity in ('�λ�', '����');

/*7�� �Ǹ��� �߿� �����ᰡ ���� ���� ����� �����Ḧ ���Ͻÿ�.*/
select max(apercent)from agents;

/*7-1�� �Ǹ��� �߿� �����ᰡ ���� ���� ����� �̸��� ���Ͻÿ�.*/
--sub query(��������)
select aname, apercent
from agents
where apercent = (select max(apercent)from agents);

/*7-2�� ���� ���� ������(discnt)�� ���� ���� �̸�(cname)�� 
���� ���� �������� ���� ���� �̸��� ���Ͻÿ�.*/

/*8�� �λ꿡 ��� ������ �达�� ����� �Ǹ��� ��ȣ�� �˻��Ͻÿ�*/
select aid, aname, acity
from agents
where acity = '�λ�' and --aname like '��%';
                         --'��' = substr(aname, 1,1);
                        instr(aname,'��',1) = 1;
                        
/*9�� ��ǰ������ 1000�� �̻��� ��ǰ�̸��� �������� �˻��Ͻÿ�.*/
select pname, quantity, price
from products
where price>=1000;


/*10��. ��ǰ�������ð� �������� �ʰų� �Ǵ� ������ 500������ 1500�� 
������ ��ǰ��ȣ�� �˻��Ͻÿ�.*/
select pid
from products
where pcity!='����' or --price BETWEEN 500 and 1500;
                      (price>=500 and price<=1500);

/*11�� �ֹ������� 1000���� �ʰ��� ��ǰ��ȣ�� �˻��Ͻÿ�.(�ߺ��� ����)*/
select distinct pid
from orders
where qty>1000;

/*12�� �ֹ���¥�� 1�� �ƴϰ� �ֹ��׼��� 500,000������ 800,000�����̿� 
�ֹ��� ����ȣ�� �˻��Ͻÿ�.*/
select distinct cid
from orders
where month!='1��' and wons BETWEEN 500000 and 800000;

/*13�� ������ ��� �ִ� ���� �ֹ��� ��ǰ��ȣ�� �������ÿ�.*/
--join
select city, ordno
from customers c join orders o on c.cid=o.cid
where city = '����';

--sub query
select ordno
from orders
where cid in (select cid from customers where city = '����');

select cid from customers where city = '����';

/*14�� ���� ��� ��ǰ�� �ֹ��� ����ȣ�� �������ÿ�.*/
select pid, price , pname
from products
order by 2 desc; -- p06

--���� ��� ��ǰ��ȣ
select pid
from products
where price = (select max(price) from products);

select cid
from orders
where pid = (select pid 
             from products
             where price = (select max(price) from products));

/*15�� Ȧ���޿� �ֹ��� ������ �������ÿ�.*/
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

/*16�� ���￡ ��� ���� ������ �����϶�.*/
--���̺� ����(������ ������� �ʴ´�.)
create table customers2
as
select * from customers;

delete from customers2
where city = '����';

/*17�� ������ ��� ���� �ʰ� ��,��,�� ���� ���� ���� �����϶�.*/
delete from customers2
where city!='����' and (cname like '��%' or 
                       cname like '��%' or
                       cname like '��%');

/*18�� �ֹ������� 400�������� �ֹ��� ��� ���� �Ͻÿ�.*/
create table orders2
as
select * from orders;

delete from orders2
where qty<= 400;

/*19�� �ֹ���¥�� 4���̰� �ֹ��׼��� 720,000�� �ֹ��� �����϶�.*/
delete from orders2
where month = '4��' and wons = 720000;

/*20�� ������ ��� �ִ� ���� �������� �λ����� �����϶�.*/
update customers2
set city = '�λ�'
where city = '����';

/*21�� �������� 12% �̻��� ���� ����ȣ�� c007�� �����϶�.*/
update customers2
set cid = 'c007'
where discnt >=12; 

/*22�� �����̺��� �̸��� �������� 
�׸��� �������� ������������ �������ÿ�.*/
select cname, city
from customers
--order by 1 asc, 2 desc;
order by cname, city desc;


/*23�� �λ꿡 ��� �ִ� �Ǹ��� �߿� �����ᰡ ���� ������ �������ÿ�.*/
select * from agents
order by apercent;

/*24�� ��ǰ �������ú��� ������ ��հ��� ��հ��� ���� ������� �������ÿ�.*/
select pcity, round(avg(price),2) "��հ�"
from products
group by pcity
order by 2 desc;


/*25�� ��ǰ������ 700�� �̻��� ��ǰ�߿� ��ǰ �������ú��� �������� 
���� ���Ͻÿ�.*/
select pcity , sum(quantity) "��������"
from products
where price >= 700
group by pcity
order by 2;


/*26�� ��ǰ������ 1000�� �̻��� ��ǰ�߿� ��ǰ �������ú��� ��ǰ ��հ����� 
1200�� �̻��ΰ͸� �������ÿ�.*/

select pcity , round(avg(price),2) "��հ�"
from products
where price>=1000 --�⺻���� ����
group by pcity
having avg(price)>= 1200 --group by ����
order by 2;









