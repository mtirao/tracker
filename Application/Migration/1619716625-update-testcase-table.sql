-- Write your SQL migration code in here
alter table test_cases drop column detail;
alter table test_cases drop column operation_ext;
alter table test_cases drop column operation;
alter table test_cases drop column tender;
alter table test_cases drop column tender_ext;
alter table test_cases drop column dp;
alter table test_cases drop column dp_ext;