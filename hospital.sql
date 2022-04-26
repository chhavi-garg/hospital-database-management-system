create table doctor( 
d_id number(15), 
d_tel number(10), 
d_sex varchar(2), 
d_name varchar(50), 
specialization varchar(50), 
d_sal number(10), 
d_fees number(10), 
time timestamp, 
constraint pk_doctor primary key(d_id) 
)
;

create table nurse(n_id number(5), n_tel number(10) ,n_sex varchar(2) , n_name varchar(20), d_id number(5), constraint pk_nurse primary key (n_id) , constraint fk_nurse foreign key (d_id) references doctor 
)
;

create table reception(r_id number(5),r_tel number(10),r_name varchar(20), constraint pk_reception primary key(r_id))
;

create table patient(p_id number(5),p_tel number(10),p_sex varchar(2),p_name varchar(20),street varchar(20),city varchar(10),dob date,d_id number(5),r_id number(5),token_no number(5),constraint pk_patient primary key(p_id),constraint fk_p1 foreign key(d_id) references doctor(d_id),constraint fk_p2 foreign key(r_id) references reception(r_id))
;

create table medicine(m_id number(5),m_price number(5),m_name varchar(20), d_id number(5), p_id number(5), constraint pk_medicine primary key(m_id), constraint fk_medicine foreign key (d_id) references doctor, constraint fk_medicine_patient foreign key (p_id) references patient)
;

create table room(ro_no number(5),ro_fee number(5),ro_type varchar(20),constraint pk_room primary key(ro_no))
;

create table Lab_Report(report_id number(4) , test_name varchar(20) not null, test_result varchar(10), d_id number(5), p_id number(5), constraint pk_report primary key(report_id), constraint fk_report foreign key (d_id) references doctor, constraint fk_report_patient foreign key (p_id) references patient)
;

create table ailment(a_name varchar(50) not null ,p_id number(5),a_detail varchar(50),constraint pf_ailment primary key(p_id,a_name),constraint fk_a1 foreign key (p_id) references patient)
;

create table bill(bill_no number(10) not null, p_id references patient, tot_amt number(10), constraint pk_bill primary key(p_id, bill_no))
;

create table treats(d_id number(5) ,p_id number(5) ,constraint fk1_treats foreign key(d_id) references doctor(d_id),constraint fk2_treats foreign 
key(p_id) references patient(p_id), constraint pf_treats primary key(d_id,p_id))
;

create table looks_after(n_id number(5) ,p_id number(5) ,constraint fk_np1 foreign key(p_id) references patient(p_id),constraint fk_np2 foreign key(n_id) references nurse(n_id), constraint pk_looks_after primary key(n_id,p_id))
;

create table manages(r_id number(5),p_id number(5) ,bill_no number(10) , constraint fk_manages1 foreign key(r_id) references reception(r_id), constraint fk_managesbill foreign key(bill_no,p_id) references bill(bill_no,p_id), constraint pk_manages primary key(bill_no,p_id,r_id))
;

create table admits(ro_no number(5) ,p_id number(5) ,time timestamp, constraint fk_pro1 foreign key(p_id) references patient(p_id),constraint fk_pro2 foreign key(ro_no) references room(ro_no), constraint pk_admits primary key(ro_no,p_id))
;

insert into doctor values(129,6379127012,'F','Ayushi','Neuro',150000,300,to_timestamp('17:35','hh24:mi'))
;

insert into doctor values(88,9140251364,'F','Harshita','Cardiology',175000,400,to_timestamp('12:00','hh24:mi'))
;

insert into doctor values(53,8840638864,'F','Jayati','Opthalmology',125000,250,to_timestamp('10:00','hh24:mi'))
;

insert into doctor values(120,8853821122,'F','Shreeya','Dermatology',50000,100,to_timestamp('15:00','hh24:mi'))
;

insert into doctor values(276,7424905270,'M','Yuvraj','Pediatrician',75000,350,to_timestamp('16:30','hh24:mi'))
;

insert into nurse values(001,9879811559,'F','Mital Vora',129)
;

insert into nurse values(002,9428120909,'F','Ketki Parekh',88)
;

insert into nurse values(003,9426549027,'F','Hiral Parekh',53)
;

insert into nurse values(004,9726276215,'F','Ishani Desai',120)
;

insert into nurse values(005,9924841494,'F','Sakshi Naik',276)
;

insert into nurse values(006,8085562345,'M','Kshitij Dahiya',53)
;

insert into reception values(01,02782205311,'Neurology Dept.')
;

insert into reception values(02,02782514198,'Cardiology Dept.')
;

insert into reception values(03,02783482689,'Opthalmology Dept.')
;

insert into reception values(04,02788665432,'Dermatology Dept.')
;

insert into reception values(05,02786732563,'Pediatrician Dept.')
;

insert into reception values(06,02784321108,'Dentist Dept.')
;

insert into patient values(14,9408048634,'F','Hitarthi Vora','Chala Road','Vapi','24-sep-2000',129,01,220)
;

insert into patient values(20,9512245764,'M','Nisarg Vora','Haridas Nagar','Mumbai','20-mar-2006',88,02,150)
;

insert into patient values(07,9714410269,'F','Archana Naik','MG Road','Delhi','04-jul-1974',53,03,222)
;

insert into patient values(30,9825747459,'M','Dev Parekh','Subhash Nagar','Bhavnagar','10-feb-2000',120,04,175)
;

insert into patient values(45,8983443606,'M','Chintan Vora','Gunjan Road','Vapi','30-oct-1999',276,05,256)
;

insert into patient values(67,9823679043,'F','Dhruvisha Patel','Godal Nagar','Surat','06-aug-2004',276,04,130)
;

insert into medicine values(1234,450,'Phenytoin',129,14)
;

insert into medicine values(1235,350,'Lacosamide',129,14)
;

insert into medicine values(2155,1000,'Kerlone',88,20)
;

insert into medicine values(2160,850,'Zebeta',88,20)
;

insert into medicine values(3260,400,'Gramicidin',53,07)
;

insert into medicine values(3230,550,'Ofloxacin',53,07)
;

insert into medicine values(5490,300,'Albuterol',276,45)
;

insert into medicine values(5555,250,'Amoxicillin',276,45)
;

insert into medicine values(4230,175,'Erythromycin',120,30)
;

insert into medicine values(4350,120,'Caladryl',120,30)
;

insert into room values(012,1200,'AC')
;

insert into room values(123,2000,'Deluxe AC')
;

insert into room values(032,700,'NON AC')
;

insert into room values(215,700,'NON AC')
;

insert into room values(423,1200,'AC')
;

insert into room values(108,2000,'Deluxe AC')
;

insert into lab_report values(101 , 'Blood Sugar', 'High',88,20)
;

insert into lab_report values(102 , 'Heamoglobin Test','Normal',276,45)
;

insert into lab_report values(103 , 'Insulin Clearance', 'Normal',276,45)
;

insert into lab_report values(104 ,'Retina Scan','Normal',53,07)
;

insert into lab_report values(105 ,'Gastric Fluid','Low',276,45)
;

insert into lab_report values(106 ,'Blood Test','Normal',120,30)
;

insert into lab_report values(107 ,'Flu Test','Positive',129,14)
;

insert into ailment values('Atherosclerotic disease',20,'Chest pain,chest tightness,chest discomfort ')
;

insert into ailment values('Neurodegenerative disease',14,'anxiety,agitation,memory loss')
;

insert into ailment values('Cataract',07,'blurry vision')
;

insert into ailment values('Carbuncle',30,'red,painful,and irritated lump under skin,fatigue')
;

insert into ailment values('Streptococcal',45,'sote throat,fever,cough')
;

insert into treats values(129,14)
;

insert into treats values(88,20)
;

insert into treats values(53,07)
;

insert into treats values(120,30)
;

insert into treats values(276,45)
;

insert into treats values(120,14)
;

insert into admits values(012,07,to_timestamp('05:00','hh24:mi'))
;

insert into admits values(123,14,to_timestamp('13:00','hh24:mi'))
;

insert into admits values(108,20,to_timestamp('02:00','hh24:mi'))
;

insert into admits values(215,45,to_timestamp('22:30','hh24:mi'))
;

insert into admits values(423,30,to_timestamp('18:45','hh24:mi'))
;

insert into bill values(50,14,700)
;

insert into bill values(52,14,1500)
;

insert into bill values(75,14,25000)
;

insert into bill values(102,20,25000)
;

insert into bill values(165,20,5000)
;

insert into bill values(245,07,4500)
;

insert into bill values(250,07,1800)
;

insert into bill values(243,07,500)
;

insert into bill values(006,30,450)
;

insert into bill values(045,30,800)
;

insert into bill values(375,45,200)
;

insert into bill values(315,45,1200)
;

insert into bill values(267,07,700)
;

insert into bill values(50,20,800)
;

insert into looks_after values(01,14)
;

insert into looks_after values(02,20)
;

insert into looks_after values(03,07)
;

insert into looks_after values(04,30)
;

insert into looks_after values(05,45)
;

insert into looks_after values(02,07)
;

insert into looks_after values(04,45)
;

insert into looks_after values(01,30)
;

insert into looks_after values(02,14)
;

insert into manages values(01,14,50)
;

insert into manages values(01,14,52)
;

insert into manages values(01,14,75)
;

insert into manages values(02,20,102)
;

insert into manages values(02,20,165)
;

insert into manages values(03,07,245)
;

insert into manages values(03,07,250)
;

insert into manages values(03,07,243)
;

insert into manages values(03,07,267)
;

insert into manages values(04,30,006)
;

insert into manages values(04,30,045)
;

insert into manages values(05,45,375)
;

insert into manages values(05,45,315)
;

select * from doctor
;

select * from nurse
;

select * from reception
;

select * from patient
;

select * from medicine
;

select * from room
;

select * from lab_report
;

select * from ailment
;

select * from treats
;

select * from admits
;

select * from bill
;

select * from looks_after
;

select * from manages
;

