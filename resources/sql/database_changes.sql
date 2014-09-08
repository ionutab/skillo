alter table candidate modify telephone_number varchar(255) NULL;
alter table address modify post_code_id bigint(20) NULL;

-- 29/06/2014

alter table candidate_note DROP FOREIGN KEY FK535CCD2E227CB0F;
alter table candidate_note drop note_type_id;
alter table note drop foreign key FK33AFF267D2865C;
alter table note drop type_id;

alter table candidate ADD date_created datetime;
alter table candidate ADD last_updated datetime;

update candidate set date_created = now();
update candidate set last_updated = now();
update client set date_created = now();
update client set last_updated = now();

-- 13/07/2014


# alter table tablename change oldname newname varchar (10) ;
alter table payroll change unqiue_tax_reference_number unique_tax_reference_number varchar2(255);

delete from payroll_company;
insert into payroll_company(name) values('FOSRE');

-- candidate payment section details
update payroll_company set name = 'FOSRE PAYE' where name='FOSRE';

-- insert into payroll_company(name) values('FOSRE PAYE');
insert into payroll_company(name) values('FOSRE CIS');
insert into payroll_company(name) values('FOSRE EPSC');
insert into payroll_company(name) values('FOSRE EDM');
insert into payroll_company(name) values('OTHER');

alter table client modify telephone_number varchar(255) NULL;

-- changing candidate note from varchar(255) to TEXT
alter table candidate_note add note_new text;
update candidate_note set note_new = note_note;
alter table candidate_note change note_note note_old varchar(255);
alter table candidate_note change note_new note_note text;
alter table candidate_note drop column note_old;

alter table client modify website varchar(255) NULL;

update contact set date_created = now();
update contact set last_updated = now();

drop table client_contact;
-- 17/08/2014

-- set max size of allowed file to upload in the database to 10MB
SET GLOBAL max_allowed_packet=1073741824;

-- 19/08/2014
ALTER TABLE `smrskillo`.`contact_comment` DROP FOREIGN KEY `FK7F1699409F1D23CD`;
ALTER TABLE `smrskillo`.`contact_comment` DROP COLUMN `client_id`, DROP INDEX `FK7F1699409F1D23CD` ;