--change db to read committed snapshot
alter database Northwind
set read_committed_snapshot on

--close sessions to get change
--Only in sinle_user mode
alter database Northwind
set single_user

--open sessions
--Move to Multi User Mode
alter database Northwind
set multi_user

--set isolation level
set transaction isolation level read Committed

begin tran 

update employees
set notes = 'isolation level is read committed'
where EmployeeID  =1 

--shows the change
select notes  from Employees
where EmployeeID = 1 
--go to snapshotReadCommitted2 and run first select


--commit after first select in snapshotReadCommitted2
commit tran

--go to second select in snapshotReadCommitted2