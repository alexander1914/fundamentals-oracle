--- Create new database ---

CREATE USER course IDENTIFIED BY course;	-- User creation
GRANT CREATE SESSION to course;			    -- Necessary to connect to the database
GRANT CREATE ANY TABLE to course;		    -- Necessary to be able to create tables
GRANT RESOURCE to course;			        -- Necessary to extend the system tablespace
GRANT SELECT_CATALOG_ROLE to course;		-- Necessary to be able to AutoTrace commands
GRANT CREATE ANY VIEW TO course;		    -- Necessary to be able to create views	
GRANT UNLIMITED TABLESPACE TO course;		-- Necessary to extend a tablespace when needed	

