-- Create database
CREATE DATABASE SuperDogCarbonDB2;
GO

USE SuperDogCarbonDB2;
GO

-- 1. Organization
CREATE TABLE Organization (
    organization_id INT PRIMARY KEY IDENTITY(1,1),
    organization_name VARCHAR(255) NOT NULL,
    industry_type VARCHAR(100)
);

-- 2. Site
CREATE TABLE Site (
    site_id INT PRIMARY KEY IDENTITY(1,1),
    organization_id INT NOT NULL,
    site_name VARCHAR(255) NOT NULL,
    location VARCHAR(255),
    FOREIGN KEY (organization_id) REFERENCES Organization(organization_id)
);

-- 3. Supplier
CREATE TABLE Supplier (
    supplier_id INT PRIMARY KEY IDENTITY(1,1),
    supplier_name VARCHAR(255) NOT NULL,
    region VARCHAR(100)
);

-- 4. Emission_Scope
CREATE TABLE Emission_Scope (
    scope_id INT PRIMARY KEY IDENTITY(1,1),
    scope_type VARCHAR(50) NOT NULL CHECK (scope_type IN ('Scope 1', 'Scope 2', 'Scope 3')),
    description TEXT
);

-- 5. Emission_Source
CREATE TABLE Emission_Source (
    source_id INT PRIMARY KEY IDENTITY(1,1),
    source_type VARCHAR(100) NOT NULL,
    unit_of_measure VARCHAR(50),
    default_emission_factor DECIMAL(10, 4)
);

-- 6. Emission_Record
CREATE TABLE Emission_Record (
    record_id INT PRIMARY KEY IDENTITY(1,1),
    site_id INT NOT NULL,
    supplier_id INT NOT NULL,
    scope_id INT NOT NULL,
    source_id INT NOT NULL,
    record_date DATE NOT NULL,
    quantity_used DECIMAL(12, 2) NOT NULL,
    emission_factor DECIMAL(10, 4) NOT NULL,
    calculated_emission AS (quantity_used * emission_factor) PERSISTED,
    FOREIGN KEY (site_id) REFERENCES Site(site_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id),
    FOREIGN KEY (scope_id) REFERENCES Emission_Scope(scope_id),
    FOREIGN KEY (source_id) REFERENCES Emission_Source(source_id)
);

-- 7. Emission_Target (optional for planning/strategy)
CREATE TABLE Emission_Target (
    target_id INT PRIMARY KEY IDENTITY(1,1),
    organization_id INT NOT NULL,
    scope_id INT NOT NULL,
    year INT NOT NULL,
    emission_limit DECIMAL(12, 2) NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES Organization(organization_id),
    FOREIGN KEY (scope_id) REFERENCES Emission_Scope(scope_id)
);

USE SuperDogCarbonDB;
GO

-- 1. Insert into Organization
INSERT INTO Organization (organization_name, industry_type)
VALUES 
('EcoCorp Ltd.', 'Manufacturing'),
('GreenWare Inc.', 'Software'),
('UrbanPower Co.', 'Energy'),
('CleanFoods Ltd.', 'Food Processing'),
('TransportMax', 'Logistics'),
('SkyHigh Airlines', 'Aviation'),
('SmartHome Solutions', 'Electronics'),
('BuildBright', 'Construction'),
('TreeLine Apparel', 'Fashion'),
('AquaFlow Utilities', 'Water Management');

-- 2. Insert into Site
INSERT INTO Site (organization_id, site_name, location)
VALUES
(1, 'EcoCorp HQ', 'New York'),
(1, 'EcoCorp Plant A', 'New Jersey'),
(2, 'GreenWare Hub', 'San Francisco'),
(3, 'UrbanPower Plant 1', 'Texas'),
(4, 'CleanFoods Factory', 'Chicago'),
(5, 'TransportMax Warehouse', 'Detroit'),
(6, 'SkyHigh Terminal', 'Atlanta'),
(7, 'SmartHome Factory', 'Seattle'),
(8, 'BuildBright Site A', 'Houston'),
(9, 'TreeLine Studio', 'Los Angeles');

-- 3. Insert into Supplier
INSERT INTO Supplier (supplier_name, region)
VALUES
('PowerGrid Inc.', 'North America'),
('BioFuel Systems', 'Europe'),
('ClearEnergy', 'Asia'),
('FreshWater Corp.', 'North America'),
('GreenTransport Ltd.', 'Europe'),
('RecyclePro', 'North America'),
('SolarPeak', 'Asia'),
('CarbonNeutral Freight', 'South America'),
('EcoDeliveries', 'Africa'),
('WindFlow Partners', 'Oceania');

-- 4. Insert into Emission_Scope
INSERT INTO Emission_Scope (scope_type, description)
VALUES
('Scope 1', 'Direct emissions from owned or controlled sources'),
('Scope 2', 'Indirect emissions from the generation of purchased electricity'),
('Scope 3', 'Other indirect emissions such as those from supply chains');

-- 5. Insert into Emission_Source
INSERT INTO Emission_Source (source_type, unit_of_measure, default_emission_factor)
VALUES
('Diesel Fuel', 'liters', 2.68),
('Electricity', 'kWh', 0.5),
('Natural Gas', 'cubic meters', 1.9),
('Air Travel', 'passenger-km', 0.18),
('Freight Shipping', 'ton-km', 0.1),
('Office Equipment', 'unit', 12.5),
('Refrigerant Leak', 'kg', 1430),
('Food Waste', 'kg', 4.0),
('Employee Commute', 'km', 0.12),
('Water Usage', 'cubic meters', 0.5);

-- 6. Insert into Emission_Record
INSERT INTO Emission_Record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor)
VALUES
(1, 1, 2, 2, '2024-01-15', 10000, 0.5),
(2, 2, 1, 1, '2024-01-20', 5000, 2.68),
(3, 3, 3, 9, '2024-02-01', 2000, 0.12),
(4, 4, 2, 2, '2024-02-10', 8000, 0.5),
(5, 5, 3, 5, '2024-03-05', 12000, 0.1),
(6, 6, 1, 4, '2024-03-10', 1500, 0.18),
(7, 7, 1, 3, '2024-03-20', 3000, 1.9),
(8, 8, 3, 6, '2024-04-01', 100, 12.5),
(8, 8, 3, 7, '2024-04-01', 100, 12.5),
(8, 8, 3, 8, '2024-04-01', 100, 12.5),
(9, 9, 3, 8, '2024-04-10', 2500, 4.0),
(10, 10, 1, 7, '2024-04-15', 50, 1430);

-- 7. Insert into Emission_Target
INSERT INTO Emission_Target (organization_id, scope_id, year, emission_limit)
VALUES
(1, 1, 2025, 25000),
(2, 2, 2025, 15000),
(3, 3, 2025, 10000),
(4, 1, 2025, 5000),
(5, 3, 2025, 12000),
(6, 1, 2025, 8000),
(7, 2, 2025, 6000),
(8, 3, 2025, 10000),
(9, 2, 2025, 9000),
(10, 1, 2025, 3000);


select * from Organization
select * from [Site]
select * from Supplier
select * from Emission_Scope
select * from Emission_Source
select * from Emission_Record
select * from Emission_Target

--Tables used in questions

create table site_emissions(
    site_id int primary key,
    total_emissions decimal(12, 2) not null default 0,
    foreign key (site_id) references site(site_id));
create table organization_credits(
    organization_id int primary key,
    credits int not null default 0,
    foreign key (organization_id) references organization(organization_id));
create table sitemanagers(
    manager_id int primary key,
    site_id int not null,
    manager_name varchar(100) not null,
    foreign key (site_id) references site(site_id));




-- 1
begin try
begin transaction
insert into emission_record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor) values (1, 1, 1, 1, '2025-05-10', 120.5, 2.68)
insert into emission_record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor) values (2, 2, -1, 2, '2025-05-10', 140.8, 0.5)
commit
end try
begin catch
rollback
print 'transaction failed'
end catch

-- 2
begin try
begin transaction
update site_emissions 
set total_emissions = total_emissions + 50
where site_id = 101
update [sites]
set TotalEmissions = TotalEmission + 50
where site_id = 101
commit
end try
begin catch
rollback
print 'transaction failed'
end catch

-- 3
begin transaction
insert into emission_record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor) values (1, 1, 1, 1, '2025-05-10', 100.0, 2.68)
save transaction sp1
begin try
insert into emission_record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor) values (1, 1, 1, 1, null, 120.0, 2.68)
end try
begin catch
rollback transaction sp1
print 'rolled back to sp1'
end catch
commit

-- 4
begin try
begin transaction
insert into emission_record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor) values (1, 1, 1, 1, '2025-05-10', 110.0, 2.68)
insert into emission_record (site_id, supplier_id, scope_id, source_id, record_date, quantity_used, emission_factor) values (1, 1, 1, 1, '2025-05-10', null, 2.68)
commit
end try
begin catch
rollback
print 'error occurred'
end catch

-- 5
begin transaction
update emission_record 
set quantity_used = quantity_used + 10 
where record_id = 1
select * from emission_record where record_id = 1
rollback transaction
select * from emission_record where record_id = 1

-- 6
begin try
begin transaction
declare @credits int
select @credits = credits from organization_credits where organization_id = 1
if @credits >= 100
begin
update organization_credits 
set credits = credits - 100 
where organization_id = 1
update organization_credits 
set credits = credits + 100 
where organization_id = 2
commit
end
else
begin
rollback
print 'insufficient credits for organization_id 1'
end
end try
begin catch
rollback
print 'transaction failed'
end catch

-- 7
begin try
begin transaction
insert into [site] (organization_id, site_name, location) values (1, 'eco hub', 'zone a')
insert into sitemanagers (manager_id, site_id, manager_name) values (301, scope_identity(), 'mano')
commit
end try
begin catch
rollback
print 'insertion failed'
end catch

--8
begin transaction
insert into emission_record (site_id, supplier_id, [scope_id], source_id, record_date, quantity_used, emission_factor) values (202, 2, 1, 1, '2025-05-10', 80.0, 2.68)
save transaction s1
insert into emission_record (site_id, supplier_id, [scope_id], source_id, record_date, quantity_used, emission_factor) values (203, 3, 1, 1, '2025-05-10', 90.0, 2.68)
save transaction s2
begin try
insert into emission_record (site_id, supplier_id, [scope_id], source_id, record_date, quantity_used, emission_factor) values (204, 4, 1, 1, null, 100.0, 2.68)
end try
begin catch
rollback transaction s2
print 'rolled back to s2'
end catch
commit

-- 9
begin transaction
update site 
set location = 'temp update' where site_id = 1
begin transaction
update site_emissions 
set total_emissions = total_emissions + 10 
where site_id = 1
rollback transaction

select * from site where site_id = 1

-- 10
create procedure q10
as
begin
begin try
begin transaction
insert into emission_record (site_id, supplier_id, [scope_id], source_id, record_date, quantity_used, emission_factor) values (5, 5, 1, 1, '2025-05-10', 70.0, 2.68)
update site 
set location = 'updated via procedure' 
where site_id = 5
commit
print 'transaction committed'
end try
begin catch
rollback
print 'error'
end catch
end

exec q10
select * from Emission_Record where site_id = 5 order by record_id desc;
select * from [site]
where site_id = 5;