alter table candidate modify telephone_number varchar(255) NULL;
alter table address modify post_code_id bigint(20) NULL;

-- 29/06/2014

alter table candidate_note DROP FOREIGN KEY FK535CCD2E227CB0F;
alter table candidate_note drop note_type_id;
alter table note drop foreign key FK33AFF267D2865C;
alter table note drop type_id;

alter table candidate ADD date_created datetime;
alter table candidate ADD last_updated datetime;


-- 13/07/2014