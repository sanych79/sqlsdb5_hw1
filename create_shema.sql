CREATE TABLE "public.Project" (
	"Project_id" serial NOT NULL,
	"project_name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "Project_pk" PRIMARY KEY ("Project_id")
) 

CREATE TABLE "public.employee" (
	"emp_id" serial NOT NULL,
	"emp_salary" integer NOT NULL,
	"emp_branch_adr_id" integer NOT NULL,
	"emp_start_date" DATE NOT NULL,
	"emp_name" varchar(255) NOT NULL,
	"division_id" integer(255) NOT NULL,
	CONSTRAINT "employee_pk" PRIMARY KEY ("emp_id")
)


CREATE TABLE "public.Project_Emp" (
	"project_id" integer NOT NULL,
	"emp_id" integer NOT NULL
) 


CREATE TABLE "public.branch_address" (
	"branch_adr_id" serial NOT NULL UNIQUE,
	"city_id" integer NOT NULL UNIQUE,
	"region_id" integer NOT NULL UNIQUE,
	"street_id" integer NOT NULL UNIQUE,
	"bld_id" integer NOT NULL UNIQUE,
	"country_id" integer NOT NULL,
	CONSTRAINT "branch_address_pk" PRIMARY KEY ("branch_adr_id")
) 


CREATE TABLE "public.Region" (
	"region_id" serial NOT NULL,
	"region_name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "Region_pk" PRIMARY KEY ("region_id")
)


CREATE TABLE "public.City" (
	"City_id" serial NOT NULL,
	"City_name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "City_pk" PRIMARY KEY ("City_id")
)



CREATE TABLE "public.Street" (
	"Street_id" serial NOT NULL,
	"Street_name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "Street_pk" PRIMARY KEY ("Street_id")
) 



CREATE TABLE "public.building" (
	"bld_id" serial NOT NULL,
	"bld_name" varchar(255) NOT NULL,
	CONSTRAINT "building_pk" PRIMARY KEY ("bld_id")
) 



CREATE TABLE "public.position" (
	"position_id" serial NOT NULL,
	"position_name" serial NOT NULL,
	CONSTRAINT "position_pk" PRIMARY KEY ("position_id")
)



CREATE TABLE "public.pos_emp" (
	"position_id" integer NOT NULL,
	"emp_id" integer NOT NULL
) 



CREATE TABLE "public.division" (
	"division_id" serial NOT NULL,
	"division_name" varchar(255) NOT NULL UNIQUE,
	"division_type_id" serial(255) NOT NULL,
	CONSTRAINT "division_pk" PRIMARY KEY ("division_id")
) 



CREATE TABLE "public.division_type" (
	"division_type_id" serial NOT NULL UNIQUE,
	"division_type_name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "division_type_pk" PRIMARY KEY ("division_type_id")
) 



CREATE TABLE "public.country" (
	"country_id" serial NOT NULL,
	"country_name" varchar(255) NOT NULL,
	CONSTRAINT "country_pk" PRIMARY KEY ("country_id")
) 



ALTER TABLE "employee" ADD CONSTRAINT "employee_fk0" FOREIGN KEY ("emp_branch_adr_id") REFERENCES "branch_address"("branch_adr_id");

ALTER TABLE "Project_Emp" ADD CONSTRAINT "Project_Emp_fk0" FOREIGN KEY ("project_id") REFERENCES "Project"("Project_id");
ALTER TABLE "Project_Emp" ADD CONSTRAINT "Project_Emp_fk1" FOREIGN KEY ("emp_id") REFERENCES "employee"("emp_id");


ALTER TABLE "Region" ADD CONSTRAINT "Region_fk0" FOREIGN KEY ("region_id") REFERENCES "branch_address"("region_id");

ALTER TABLE "City" ADD CONSTRAINT "City_fk0" FOREIGN KEY ("City_id") REFERENCES "branch_address"("city_id");

ALTER TABLE "Street" ADD CONSTRAINT "Street_fk0" FOREIGN KEY ("Street_id") REFERENCES "branch_address"("street_id");

ALTER TABLE "building" ADD CONSTRAINT "building_fk0" FOREIGN KEY ("bld_id") REFERENCES "branch_address"("bld_id");


ALTER TABLE "pos_emp" ADD CONSTRAINT "pos_emp_fk0" FOREIGN KEY ("position_id") REFERENCES "position"("position_id");
ALTER TABLE "pos_emp" ADD CONSTRAINT "pos_emp_fk1" FOREIGN KEY ("emp_id") REFERENCES "employee"("emp_id");

ALTER TABLE "division" ADD CONSTRAINT "division_fk0" FOREIGN KEY ("division_id") REFERENCES "employee"("division_id");

ALTER TABLE "division_type" ADD CONSTRAINT "division_type_fk0" FOREIGN KEY ("division_type_id") REFERENCES "division"("division_type_id");

ALTER TABLE "country" ADD CONSTRAINT "country_fk0" FOREIGN KEY ("country_id") REFERENCES "branch_address"("country_id");














