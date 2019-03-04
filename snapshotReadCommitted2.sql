--Close All transaction is database
alter database Northwind
set read_committed_snapshot on

--Only in sinle_user mode
alter database Northwind
set read_committed_snapshot on 

--Move to Multi User Mode
alter database Northwind
set multi_user

--set isolation level
set transaction isolation level read Committed

begin tran 

--first select
select notes  from Employees
where EmployeeID = 1 
--shows what was there before snapshotReadCommitted1's update
--because only reads from committed data
--go back to snapshotReadCommitted1 and commit

--second select
select notes  from Employees
where EmployeeID = 1 

--shows committed data

select @@TRANCOUNT
commit


