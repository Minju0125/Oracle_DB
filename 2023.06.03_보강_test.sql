-- oracle 보강
-- group by 와 having 절
-- 각 반별 평균을 출력하고 싶을때,
-- group by 는 어떤 기준 컬럼으로 집계 결과를 보여줄 것인지를 나타낼 때 사용한다.

select ddit_class, sum(ddit_score)/5 as avg
from dditclass
group by ddit_class
order by ddit_class;

-- 결과를 만들기 위해 각각의 공간을 만드는데, 새로운 공간을 만듦.
-- 바깥 쪽에서 만든 결과 중에 해당 파라미터 값을 별칭을 붙여서 새로운 공간 안에 값을 하나씩 던져주는것
select ddit_class, sum(ddit_score)/(select count(ddit_no) from dditclass where ddit_class = d.ddit_class) as avg
from dditclass d
group by ddit_class
order by ddit_class;

--having절은 집계함수를 이용하여 조건을 구성한다.
--group by 에서 집계된 조건을 이용하여 평균이 80%이상인 학급을 조회해보자
select ddit_class, sum(ddit_score)/(select count(ddit_no) from dditclass where ddit_class = d.ddit_class) as avg
from dditclass d
group by ddit_class
having sum(ddit_score) > 400 -- having 절 다음에는 집계함수의 내용
order by ddit_class;

-- join
-- inner join, outer join
-- oracle 조인, ansi 조인 : 쓰이는 방식의 차이

-- oracle 조인 방식
select 
    a.no, a.id,
    b.no, b.id
from aaa a, bbb b
where a.no = b.no;

--ansi 조인
select 
    a.no, a.id,
    b.no, b.id
from aaa a inner join bbb on (a.no = b.no);

-- inner join 이란?
-- 메인테이블과 조인테이블의 데이터들 중, join 조건의 값이 동시에 부합하는 조건만 조회한다.
-- 조인조건에 해당하지 않는 값인 경우에는 조회하지 않는다. (교집합일 때 조회해서 나타냄)

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
 
 --student sequence를 생성
 create sequence seq_student increment by 1 start with 1 nocache;
 
 -- dditclass 테이블 생성
create table dditclass (
 ddit_no number(8) not null,
 ddit_class number(8) not null,
 ddit_student number(8) not null,
 ddit_score number(8) not null,
 constraint pk_dditclass primary key(ddit_no)
 );
 
 --ddit sequence 를 생성
create sequence seq_dditclass increment by 1 start with 1 nocache;

insert into student values(seq_student.nextval, 'stu1', '홍길동', '남자');
insert into student values(seq_student.nextval, 'stu2', '유재석', '남자');
insert into student values(seq_student.nextval, 'stu3', '박명수', '남자');
insert into student values(seq_student.nextval, 'stu4', '정준하', '남자');
insert into student values(seq_student.nextval, 'stu5', '노홍철', '남자');
insert into student values(seq_student.nextval, 'stu6', '정형돈', '남자');
insert into student values(seq_student.nextval, 'stu7', '하동훈', '남자');
insert into student values(seq_student.nextval, 'stu8', '길성준', '남자');
insert into student values(seq_student.nextval, 'stu9', '이광수', '남자');
insert into student values(seq_student.nextval, 'stu10', '지석진', '남자');
insert into student values(seq_student.nextval, 'stu11', '김종국', '남자');
insert into student values(seq_student.nextval, 'stu12', '송지효', '남자');
insert into student values(seq_student.nextval, 'stu13', '박민주', '남자');
insert into student values(seq_student.nextval, 'stu14', '양세찬', '남자');
insert into student values(seq_student.nextval, 'stu15', '전지현', '남자');
insert into student values(seq_student.nextval, 'stu16', '홍길동', '남자');
insert into student values(seq_student.nextval, 'stu17', '김용명', '남자');
insert into student values(seq_student.nextval, 'stu18', '이용진', '남자');
insert into student values(seq_student.nextval, 'stu19', '신짱구', '남자');
insert into student values(seq_student.nextval, 'stu20', '김철수', '남자');

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

