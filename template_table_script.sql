--*--------------------------------------------------------------------------------------------------
--* [Description]
--*	
--*--------------------------------------------------------------------------------------------------

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[template_table]') AND type in (N'U'))
drop table [template_table]

-- CREATE
CREATE TABLE [template_table] ( 
    A VARCHAR(10) NOT NULL
	, B VARCHAR(10)
)

-- PRIMARY KEY
ALTER TABLE [template_table] ADD CONSTRAINT pk_template_table
 PRIMARY KEY (
    A
)
