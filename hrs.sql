USE Hris;
DROP TABLE IF EXISTS Employee_Location;

DROP TABLE IF EXISTS Clocking_Hours;
DROP TABLE IF EXISTS Hours_Missed;
DROP TABLE IF EXISTS Employee_Job_Day_Off;

DROP TABLE IF EXISTS Day_Off;
DROP TABLE IF EXISTS Leave_Type;

DROP TABLE IF EXISTS Payroll;
DROP TABLE IF EXISTS Employee_Job_Benefit_Requirement;

DROP TABLE IF EXISTS Link_Benefit_And_Requirement;
DROP TABLE IF EXISTS Benefit_Requirement;
DROP TABLE IF EXISTS Employee_Job_Benefit;

DROP TABLE IF EXISTS Benefit;

DROP TABLE IF EXISTS Employee_Job_Certification_Requirement;
DROP TABLE IF EXISTS Employee_Job_Training_Program;
DROP TABLE IF EXISTS Certification_Requirement_Training_Program;


DROP TABLE IF EXISTS Employee_Competancy;
DROP TABLE IF EXISTS Fired;
DROP TABLE IF EXISTS Retired;
DROP TABLE IF EXISTS Employee_Job;
DROP TABLE IF EXISTS Relevant_Competancy;


DROP TABLE IF EXISTS Certification_Employee;
DROP TABLE IF EXISTS Link_Certification_Requirement;

DROP TABLE IF EXISTS Certification_Requirement;

DROP TABLE IF EXISTS Certification;
DROP TABLE IF EXISTS Accident_Employee_Reporter;
DROP TABLE IF EXISTS Accident_Department;
DROP TABLE IF EXISTS Accident_Report;

DROP TABLE IF EXISTS Employee_Training_Program;

DROP TABLE IF EXISTS Training_Program;

DROP TABLE IF EXISTS Employee;

DROP TABLE IF EXISTS Competancy_Job;
DROP TABLE IF EXISTS Competancy;
DROP TABLE IF EXISTS Job_Tax;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Leave_Law;
DROP TABLE IF EXISTS Leave_Law_Location;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Organization;


DROP TABLE IF EXISTS Country;
DROP TABLE IF EXISTS Region;


DROP TABLE IF EXISTS Employee_Location;
CREATE TABLE Employee_Location (
  employee_id      INT UNSIGNED NOT NULL,
  location_id           INT UNSIGNED NOT NULL,
  PRIMARY KEY (employee_id, location_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Clocking_Hours;
CREATE TABLE Clocking_Hours (
  clocking_hours_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  
  from_time DATETIME NOT NULL,
  to_time DATETIME NOT NULL,
  employee_job_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (clocking_hours_id)
  
) ENGINE=InnoDB;




DROP TABLE IF EXISTS Hours_Missed;
CREATE TABLE Hours_Missed (
  hours_missed_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  
  from_time DATETIME NOT NULL,
  to_time DATETIME NOT NULL,
  employee_job_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (hours_missed_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Employee_Job_Day_Off;
CREATE TABLE Employee_Job_Day_Off (
  day_off_id INT UNSIGNED NOT NULL,
  employee_job_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (day_off_id, employee_job_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Day_Off;
CREATE TABLE Day_Off (
  day_off_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  day_off_date DATE NOT NULL,
  leave_type_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (day_off_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Leave_Type;
CREATE TABLE Leave_Type (
  leave_type_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  leave_name VARCHAR (255) NOT NULL,
  leave_description TEXT NOT NULL,
  PRIMARY KEY (leave_type_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Payroll;
CREATE TABLE Payroll (
  payroll_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  employee_job_id INT UNSIGNED NOT NULL,
  date_paid DATE NOT NULL,
  pay DECIMAL (13, 3),
  PRIMARY KEY (payroll_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Employee_Job_Benefit_Requirement;
CREATE TABLE Employee_Job_Benefit_Requirement (
  employee_job_id INT UNSIGNED NOT NULL,
  benefit_requirement_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (employee_job_id, benefit_requirement_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Benefit_Requirement;
CREATE TABLE Benefit_Requirement (
  benefit_requirement_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  benefit_requirement_name VARCHAR (255) NOT NULL,
  benefit_requirement_description TEXT NOT NULL,
  PRIMARY KEY (benefit_requirement_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Link_Benefit_And_Requirement;
CREATE TABLE Link_Benefit_And_Requirement (
  benefit_requirement_id INT UNSIGNED NOT NULL,
  benefit_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (benefit_requirement_id, benefit_id)
  
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Employee_Job_Benefit;
CREATE TABLE Employee_Job_Benefit (
  employee_job_id INT UNSIGNED NOT NULL,
  benefit_id INT UNSIGNED NOT NULL,
  date_benefit_recieved DATE NOT NULL,
  reason_for_getting_benefit TEXT NOT NULL,
  PRIMARY KEY (employee_job_id, benefit_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Benefit;
CREATE TABLE Benefit(
  benefit_id INT UNSIGNED NOT NULL,
  benefit_name VARCHAR (255) NOT NULL,
  benefit_description TEXT NOT NULL,
  PRIMARY KEY (benefit_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Employee_Job_Certification_Requirement;
CREATE TABLE Employee_Job_Certification_Requirement(
  employee_job_id INT UNSIGNED NOT NULL,
  certification_requirement_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (employee_job_id, certification_requirement_id)
  
) ENGINE=InnoDB;



DROP TABLE IF EXISTS Certification_Requirement_Training_Program;
CREATE TABLE Certification_Requirement_Training_Program(
  certification_requirement_id INT UNSIGNED NOT NULL,
  training_program_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (certification_requirement_id, training_program_id)
  
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Leave_Law;
CREATE TABLE Leave_Law (
  leave_law_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  leave_law_name   VARCHAR(255) NOT NULL,
  leave_law_description TEXT NOT NULL,
  PRIMARY KEY (leave_law_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Leave_Law_Location;
CREATE TABLE Leave_Law_Location (
  leave_law_id      INT UNSIGNED NOT NULL,
  location_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (leave_law_id, location_id)
) ENGINE=InnoDB;






DROP TABLE IF EXISTS Location;
CREATE TABLE Location (
  location_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  location_name    VARCHAR(255) NOT NULL,
  organization_id INT UNSIGNED NOT NULL,
  country_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (location_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Employee_Competancy;
CREATE TABLE Employee_Competancy (
  employee_job_id INT UNSIGNED NOT NULL,
  competancy_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (employee_job_id, competancy_id)
) ENGINE=InnoDB;



DROP TABLE IF EXISTS Fired;
CREATE TABLE Fired (
  employee_job_id INT UNSIGNED NOT NULL,
  fired_date DATE NOT NULL,
  reason_fired TEXT NOT NULL,
  PRIMARY KEY (employee_job_id)
) ENGINE=InnoDB;




DROP TABLE IF EXISTS Employee_Job;
CREATE TABLE Employee_Job (
  employee_job_id  INT UNSIGNED NOT NULL AUTO_INCREMENT,  
  employee_id      INT UNSIGNED NOT NULL,
  job_id           INT UNSIGNED NOT NULL,
  review TEXT NOT NULL,
  manager_id INT UNSIGNED,
  PRIMARY KEY (employee_job_id)
) ENGINE=InnoDB;



DROP TABLE IF EXISTS Certification_Employee;
CREATE TABLE Certification_Employee (
  certification_id INT UNSIGNED NOT NULL,
  employee_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (certification_id, employee_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Link_Certification_Requirement;
CREATE TABLE Link_Certification_Requirement (
  certification_id INT UNSIGNED NOT NULL,
  certification_requirement_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (certification_id, certification_requirement_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Certification_Requirement;
CREATE TABLE Certification_Requirement (
  certification_requirement_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  certification_requirement_name VARCHAR(225) NOT NULL,
  certification_requirement_description TEXT NOT NULL,
  PRIMARY KEY (certification_requirement_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Certification;
CREATE TABLE Certification (
  certification_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  certification_name VARCHAR(225) NOT NULL,
  certification_description TEXT NOT NULL,
  PRIMARY KEY (certification_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Accident_Employee_Reporter;
CREATE TABLE Accident_Employee_Reporter (
  employee_reporter_id INT UNSIGNED NOT NULL,
  accident_report_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (accident_report_id, employee_reporter_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Accident_Department;
CREATE TABLE Accident_Department (
  department_id INT UNSIGNED NOT NULL,
  accident_report_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (accident_report_id, department_id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS Accident_Report;
CREATE TABLE Accident_Report (
  accident_report_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  accident_report_date DATE NOT NULL,
  accident_description TEXT NOT NULL,
  PRIMARY KEY (accident_report_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Employee_Training_Program;
CREATE TABLE Employee_Training_Program(
  training_program_id INT UNSIGNED NOT NULL,
  employee_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (training_program_id, employee_id)
  
) ENGINE=InnoDB;




DROP TABLE IF EXISTS Training_Program;
CREATE TABLE Training_Program(
  training_program_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  training_program_name VARCHAR(255) NOT NULL,
  training_program_description TEXT NOT NULL,
  PRIMARY KEY (training_program_id)
  
) ENGINE=InnoDB;






DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  employee_id      INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  employee_name            VARCHAR(255) NOT NULL,
  email            VARCHAR(255) NOT NULL,
  
  PRIMARY KEY(employee_id)
  
) ENGINE=InnoDB;










DROP TABLE IF EXISTS Competancy_Job;
CREATE TABLE Competancy_Job (
  job_id      INT UNSIGNED NOT NULL,
  competancy_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (job_id, competancy_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS Competancy;
CREATE TABLE Competancy (
  competancy_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  competancy_name   VARCHAR(255) NOT NULL,
  competancy_description  TEXT NOT NULL,
  PRIMARY KEY (competancy_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Job_Tax;
CREATE TABLE Job_Tax (
  job_id INT UNSIGNED NOT NULL,
  tax_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (job_id, tax_id)
) ENGINE=InnoDB;







DROP TABLE IF EXISTS Job;
CREATE TABLE Job (
  job_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  job_name            VARCHAR(255) NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  job_description TEXT NOT NULL,
  max_pay   Decimal(8, 2) NOT NULL,
  min_pay   Decimal(8, 2) NOT NULL,
  PRIMARY KEY (job_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Department;
CREATE TABLE Department (
  department_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  organization_id       INT UNSIGNED NOT NULL,
  department_name       VARCHAR(255) NOT NULL,
  PRIMARY KEY (department_id)
) ENGINE=InnoDB;



DROP TABLE IF EXISTS Organization;
CREATE TABLE Organization (
  organization_id      INT UNSIGNED NOT NULL,
  organization_name       VARCHAR(255) NOT NULL,
  PRIMARY KEY (organization_id)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
  country_id     INT UNSIGNED NOT NULL AUTO_INCREMENT,
  country_name       VARCHAR(255) NOT NULL,
  PRIMARY KEY (country_id)
) ENGINE=InnoDB;

ALTER TABLE Employee_Location ADD FOREIGN KEY (location_id)
REFERENCES Location (location_id) ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE Employee_Location ADD FOREIGN KEY (employee_id)
REFERENCES Employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Clocking_Hours ADD FOREIGN KEY (employee_job_id)
REFERENCES Employee_Job (employee_job_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Hours_Missed ADD FOREIGN KEY (employee_job_id)
REFERENCES Employee_Job (employee_job_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job_Day_Off ADD FOREIGN KEY (day_off_id)
REFERENCES Day_Off (day_off_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Day_Off ADD FOREIGN KEY (leave_type_id)
REFERENCES Leave_Type (leave_type_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job_Benefit_Requirement ADD FOREIGN KEY (employee_job_id)
REFERENCES Employee_Job (employee_job_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job_Benefit_Requirement ADD FOREIGN KEY (benefit_requirement_id)
REFERENCES Benefit_Requirement (benefit_requirement_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job_Benefit ADD FOREIGN KEY (employee_job_id)
REFERENCES Employee_Job (employee_job_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job_Benefit ADD FOREIGN KEY (benefit_id)
REFERENCES Benefit (benefit_id) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE Link_Benefit_And_Requirement ADD FOREIGN KEY (benefit_requirement_id)
REFERENCES Benefit_Requirement (benefit_requirement_id)ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Link_Benefit_And_Requirement ADD FOREIGN KEY (benefit_id)
REFERENCES Benefit (benefit_id)ON DELETE CASCADE ON UPDATE CASCADE;



ALTER TABLE Payroll ADD FOREIGN KEY (employee_job_id)
REFERENCES Employee_Job (employee_job_id) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE Location ADD FOREIGN KEY (organization_id)
REFERENCES Organization (organization_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job ADD FOREIGN KEY (employee_id)
REFERENCES Employee (employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job ADD FOREIGN KEY (job_id)
REFERENCES Job (job_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Employee_Job
ADD FOREIGN KEY (manager_id)
REFERENCES Employee_Job(employee_id);


ALTER TABLE Competancy_Job ADD FOREIGN KEY (competancy_id)
REFERENCES Competancy (competancy_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Competancy_Job ADD FOREIGN KEY (job_id)
REFERENCES Job (job_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Department ADD FOREIGN KEY (organization_id)
REFERENCES Organization (organization_id) ON DELETE CASCADE ON UPDATE CASCADE;



INSERT INTO Organization(organization_id, organization_name) VALUES
(1, 'org1'),
(2, 'org2');

INSERT INTO Department(department_id, organization_id, department_name) VALUES
(1, 1, 'hygeine'),
(2, 2, 'english'),
(3, 1, 'english');

INSERT INTO Job(job_id, job_name, department_id, job_description, max_pay, min_pay) VALUES
(1, 'dust', 1, 'boring', 80000, 4),
(2, 'write', 2, 'semi interesting', 7888, 98),
(3, 'write', 3, 'difficult', 7888, 98);

INSERT INTO Competancy(competancy_id, competancy_name, competancy_description) VALUES
(1, 'jump', 'sfsdfsfds'),
(2, 'run', 'sfsdfds');

INSERT INTO Competancy_Job(job_id, competancy_id) VALUES
(1, 1),
(1, 2),
(2, 1);

INSERT INTO Employee(employee_id, employee_name, email) VALUES
(1, 'Sivia', 'sfdsfds'),
(2, 'Snoo', 'sdfdsf');

INSERT INTO Employee_Job(employee_id, job_id, manager_id) VALUES
(1, 2, NULL),
(1, 1, NULL),
(2, 1, 1);

INSERT INTO Location (location_id, location_name, organization_id) VALUES
(1, 'Chicago', 1),
(2, 'Russia', 1);










INSERT INTO Employee_Location (employee_id, location_id) VALUES
(1, 1),	
(2, 1);	







