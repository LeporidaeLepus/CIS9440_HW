CREATE SCHEMA IF NOT EXISTS "phila_commodities_contracts";

CREATE  TABLE "phila_commodities_contracts".dim_contract ( 
	contract_number      text  NOT NULL  ,
	bid_number           text    ,
	contract_description text    ,
	quarter              integer    ,
	CONSTRAINT pk_dim_contract PRIMARY KEY ( contract_number )
 );

CREATE  TABLE "phila_commodities_contracts".dim_contract_type ( 
	contract_type_id     integer  NOT NULL  ,
	contract_type        text    ,
	CONSTRAINT pk_dim_contract_type PRIMARY KEY ( contract_type_id )
 );

CREATE  TABLE "phila_commodities_contracts".dim_date ( 
	date_id              bigint  NOT NULL  ,
	"year"               integer    ,
	quarter              integer    ,
	"month"              integer    ,
	"day"                integer    ,
	month_name           varchar(50)    ,
	day_name             varchar(50)    ,
	week_of_month        integer    ,
	week_of_year         integer    ,
	"date"               date    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE "phila_commodities_contracts".dim_department ( 
	department_id        integer  NOT NULL  ,
	department_name      text    ,
	CONSTRAINT pk_dim_department PRIMARY KEY ( department_id )
 );

CREATE  TABLE "phila_commodities_contracts".dim_vendor ( 
	vendor_id            integer  NOT NULL  ,
	vendor_name          text    ,
	CONSTRAINT pk_dim_vendor PRIMARY KEY ( vendor_id )
 );

CREATE  TABLE "phila_commodities_contracts".contract_facts ( 
	record_id            bigint  NOT NULL  ,
	total_contract_month integer    ,
	remaining_contract_month integer    ,
	total_transactions   numeric(20,2)    ,
	contract_amount      numeric(20,2)    ,
	contract_number      text    ,
	contract_type_id     integer    ,
	verdor_id            integer    ,
	department_id        integer    ,
	start_date           bigint    ,
	end_date             bigint    ,
	CONSTRAINT pk_contract_facts PRIMARY KEY ( record_id )
 );

ALTER TABLE "phila_commodities_contracts".contract_facts ADD CONSTRAINT fk_contract_facts_dim_contract FOREIGN KEY ( contract_number ) REFERENCES "phila_commodities_contracts".dim_contract( contract_number );

ALTER TABLE "phila_commodities_contracts".contract_facts ADD CONSTRAINT fk_contract_facts_dim_contract_type FOREIGN KEY ( contract_type_id ) REFERENCES "phila_commodities_contracts".dim_contract_type( contract_type_id );

ALTER TABLE "phila_commodities_contracts".contract_facts ADD CONSTRAINT fk_contract_facts_dim_vendor FOREIGN KEY ( verdor_id ) REFERENCES "phila_commodities_contracts".dim_vendor( vendor_id );

ALTER TABLE "phila_commodities_contracts".contract_facts ADD CONSTRAINT fk_contract_facts_dim_department FOREIGN KEY ( department_id ) REFERENCES "phila_commodities_contracts".dim_department( department_id );

ALTER TABLE "phila_commodities_contracts".contract_facts ADD CONSTRAINT fk_contract_facts_dim_date FOREIGN KEY ( start_date ) REFERENCES "phila_commodities_contracts".dim_date( date_id );

ALTER TABLE "phila_commodities_contracts".contract_facts ADD CONSTRAINT fk_contract_facts_dim_date_0 FOREIGN KEY ( end_date ) REFERENCES "phila_commodities_contracts".dim_date( date_id );
