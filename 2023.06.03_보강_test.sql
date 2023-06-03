-- oracle ����
-- group by �� having ��
-- �� �ݺ� ����� ����ϰ� ������,
-- group by �� � ���� �÷����� ���� ����� ������ �������� ��Ÿ�� �� ����Ѵ�.

select ddit_class, sum(ddit_score)/5 as avg
from dditclass
group by ddit_class
order by ddit_class;

-- ����� ����� ���� ������ ������ ����µ�, ���ο� ������ ����.
-- �ٱ� �ʿ��� ���� ��� �߿� �ش� �Ķ���� ���� ��Ī�� �ٿ��� ���ο� ���� �ȿ� ���� �ϳ��� �����ִ°�
select ddit_class, sum(ddit_score)/(select count(ddit_no) from dditclass where ddit_class = d.ddit_class) as avg
from dditclass d
group by ddit_class
order by ddit_class;

--having���� �����Լ��� �̿��Ͽ� ������ �����Ѵ�.
--group by ���� ����� ������ �̿��Ͽ� ����� 80%�̻��� �б��� ��ȸ�غ���
select ddit_class, sum(ddit_score)/(select count(ddit_no) from dditclass where ddit_class = d.ddit_class) as avg
from dditclass d
group by ddit_class
having sum(ddit_score) > 400 -- having �� �������� �����Լ��� ����
order by ddit_class;

-- join
-- inner join, outer join
-- oracle ����, ansi ���� : ���̴� ����� ����

-- oracle ���� ���
select 
    a.no, a.id,
    b.no, b.id
from aaa a, bbb b
where a.no = b.no;

--ansi ����
select 
    a.no, a.id,
    b.no, b.id
from aaa a inner join bbb on (a.no = b.no);

-- inner join �̶�?
-- �������̺�� �������̺��� �����͵� ��, join ������ ���� ���ÿ� �����ϴ� ���Ǹ� ��ȸ�Ѵ�.
-- �������ǿ� �ش����� �ʴ� ���� ��쿡�� ��ȸ���� �ʴ´�. (�������� �� ��ȸ�ؼ� ��Ÿ��)

select
 ddit_class, ddit_student,
 stu_no, stu_id
from dditclass a left outer join student b on(a.ddit_student = b.stu_no);

select
 ddit_class, ddit_student,
 stu_no, stu_id
from dditclass a right outer join student b on(a.ddit_student = b.stu_no); 




select * from dditclass;
select * from student;


create table student(
 stu_no number(8) not null,
 stu_id varchar2(100) not null,
 stu_name varchar2(100) not null,
 stu_gender varchar2(30) not null,
 constraint pk_student primary key (stu_no)
 );
 
 --student sequence�� ����
 create sequence seq_student increment by 1 start with 1 nocache;
 
 -- dditclass ���̺� ����
create table dditclass (
 ddit_no number(8) not null,
 ddit_class number(8) not null,
 ddit_student number(8) not null,
 ddit_score number(8) not null,
 constraint pk_dditclass primary key(ddit_no)
 );
 
 --ddit sequence �� ����
create sequence seq_dditclass increment by 1 start with 1 nocache;

insert into student values(seq_student.nextval, 'stu1', 'ȫ�浿', '����');
insert into student values(seq_student.nextval, 'stu2', '���缮', '����');
insert into student values(seq_student.nextval, 'stu3', '�ڸ��', '����');
insert into student values(seq_student.nextval, 'stu4', '������', '����');
insert into student values(seq_student.nextval, 'stu5', '��ȫö', '����');
insert into student values(seq_student.nextval, 'stu6', '������', '����');
insert into student values(seq_student.nextval, 'stu7', '�ϵ���', '����');
insert into student values(seq_student.nextval, 'stu8', '�漺��', '����');
insert into student values(seq_student.nextval, 'stu9', '�̱���', '����');
insert into student values(seq_student.nextval, 'stu10', '������', '����');
insert into student values(seq_student.nextval, 'stu11', '������', '����');
insert into student values(seq_student.nextval, 'stu12', '����ȿ', '����');
insert into student values(seq_student.nextval, 'stu13', '�ڹ���', '����');
insert into student values(seq_student.nextval, 'stu14', '�缼��', '����');
insert into student values(seq_student.nextval, 'stu15', '������', '����');
insert into student values(seq_student.nextval, 'stu16', 'ȫ�浿', '����');
insert into student values(seq_student.nextval, 'stu17', '����', '����');
insert into student values(seq_student.nextval, 'stu18', '�̿���', '����');
insert into student values(seq_student.nextval, 'stu19', '��¯��', '����');
insert into student values(seq_student.nextval, 'stu20', '��ö��', '����');

insert into dditclass values(seq_dditclass.nextval, 304, 1, 100);
insert into dditclass values(seq_dditclass.nextval, 304, 2, 92);
insert into dditclass values(seq_dditclass.nextval, 304, 3, 72);
insert into dditclass values(seq_dditclass.nextval, 304, 4, 55);
insert into dditclass values(seq_dditclass.nextval, 304, 5, 80);
insert into dditclass values(seq_dditclass.nextval, 305, 6, 70);
insert into dditclass values(seq_dditclass.nextval, 305, 7, 60);
insert into dditclass values(seq_dditclass.nextval, 305, 8, 88);
insert into dditclass values(seq_dditclass.nextval, 305, 9, 77);
insert into dditclass values(seq_dditclass.nextval, 305, 10, 66);
insert into dditclass values(seq_dditclass.nextval, 306, 11, 77);
insert into dditclass values(seq_dditclass.nextval, 306, 12, 98);
insert into dditclass values(seq_dditclass.nextval, 306, 13, 89);
insert into dditclass values(seq_dditclass.nextval, 306, 14, 76);
insert into dditclass values(seq_dditclass.nextval, 306, 15, 67);
insert into dditclass values(seq_dditclass.nextval, 307, 16, 55);
insert into dditclass values(seq_dditclass.nextval, 307, 17, 43);
insert into dditclass values(seq_dditclass.nextval, 307, 18, 80);
insert into dditclass values(seq_dditclass.nextval, 307, 19, 88);
insert into dditclass values(seq_dditclass.nextval, 307, 20, 93);

