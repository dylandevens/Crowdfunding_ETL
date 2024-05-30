select * from category;
select * from subcategory;
select * from contacts;
select * from campaign;


-- path = /Users/Dylan/Desktop/Crowdfunding_ETL/Resources/...
COPY category FROM '/Users/Dylan/Desktop/Crowdfunding_ETL/Resources/category.csv' DELIMITER ',' CSV HEADER;
COPY subcategory FROM '/Users/Dylan/Desktop/Crowdfunding_ETL/Resources/subcategory.csv' DELIMITER ',' CSV HEADER;
COPY contacts FROM '/Users/Dylan/Desktop/Crowdfunding_ETL/Resources/contacts.csv' DELIMITER ',' CSV HEADER;
COPY campaign FROM '/Users/Dylan/Desktop/Crowdfunding_ETL/Resources/campaign.csv' DELIMITER ',' CSV HEADER;





CREATE TABLE IF NOT EXISTS "category" (
    "category_id" varchar(10)   NOT NULL,
    "category" varchar(255)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     ),
    CONSTRAINT "uc_category_category" UNIQUE (
        "category"
    )
);

CREATE TABLE IF NOT EXISTS "subcategory" (
    "subcategory_id" varchar(50)   NOT NULL,
    "subcategory" varchar(255)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     ),
    CONSTRAINT "uc_subcategory_subcategory" UNIQUE (
        "subcategory"
    )
);

CREATE TABLE IF NOT EXISTS "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(255)   NOT NULL,
    "last_name" varchar(255)   NOT NULL,
    "email" varchar(255)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     ),
    CONSTRAINT "uc_contacts_email" UNIQUE (
        "email"
    )
);

CREATE TABLE IF NOT EXISTS "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(255)   NOT NULL,
    "description" text   NOT NULL,
    "goal" int   NOT NULL,
    "pledged" int   NOT NULL,
    "outcome" varchar(100)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(10)   NOT NULL,
    "currency" varchar(10)   NOT NULL,
    "launched_date" datetime   NOT NULL,
    "end_date" datetime   NOT NULL,
    "category_id" varchar(10)   NOT NULL,
    "subcategory_id" varchar(50)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");

