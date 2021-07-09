use dss_vendor;

DROP TABLE supplying_table;
DROP TABLE company;
DROP TABLE antivirus;

CREATE TABLE antivirus(
	idantivirus bigint primary key not null,
    antivirus_name varchar(30),
    overall_efficacy int,
    user_mark int,
    price int
);

insert into antivirus(idantivirus, antivirus_name, overall_efficacy, user_mark, price) 
values (001, "Norton", 82, 75,123),(002, "Symantec", 85, 71,23),(003, "Panda", 93, 97,1234), 
(004, "TotalAV", 81, 80,97),(005, "Bitdefender", 79, 70,38),(006, "PCProtect", 77, 91,13), 
(007, "BullGuard", 75, 50,150),(008, "McAfee", 71, 93,107),(009, "ScanGuard", 55, 21,146), 
(010, "Heimdal", 43, 26,83),(011, "ThorPremium", 28, 16,64),(012, "PcMatic", 14, 05,23);

CREATE TABLE company(
	id bigint primary key not null auto_increment,
	company_name Varchar(30),
    crypto_mechanism varchar (30),
    company_data_update date,
    product_update date,
	employee_awareness int unsigned,
    number_employees int,
    annual_revenue int,
    cybersecurity_investment int,
	number_devices int,
	number_audits int,
    cybercrisis_team boolean,
    contingency_plan boolean,
    signed_cyber_requirements boolean,
    ciphered_communications boolean,
    role_validator boolean,
    antivirus_id bigint,
    two_factor_authentication boolean,
    isolated_backups boolean,
    data_risk int,
    supplying_vendors int,
    foreign key (antivirus_id) references antivirus(idAntivirus)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);
insert into company		(company_name, crypto_mechanism, company_data_update, product_update, 
						employee_awareness, number_employees, annual_revenue, cybersecurity_investment, number_devices, 
                        number_audits, cybercrisis_team, contingency_plan, signed_cyber_requirements, ciphered_communications, 
                        role_validator, antivirus_id, two_factor_authentication, isolated_backups, data_risk, supplying_vendors)
values 	("RobertSL", "SHA-256", "2021-05-24", "2021-05-02", 
		91, 28, 1948900, 1100000, 113, 
        5, true, true, true, true, 
        true, 003, true, true, 3, 2),
		("MariaSL", "SHA-128", "2021-05-03", "2020-04-28", 
        68, 532, 13555000, 100000, 3560, 
        2, true, true, false, true, 
        false, 008, true, false, 2, 15),
		("DavidSL", "SHA-256", "2021-04-11", "2021-01-16", 
        88, 1205, 80342000, 15000000, 5600, 
        4, true, true, true, true, 
        false, 006, true, true, 1, 22),
		("Medieval", "SHA-256", "2014-05-02", "2008-02-02", 
		0, 555, 468234, 37456, 8, 
		0, false, true, true, true, 
		false, 004, true, false, 1, 8),
		("LaJessi", "SHA-128", "2021-03-03", "2019-05-02", 
		90, 523, 1000000, 10000, 1057, 
		4, true, false, true, false, 
		true, 005, false, true, 2, 12),
		("Ventilated", "SHA-512", "2021-05-30", "2021-05-30", 
		99, 2, 1000, 300, 2, 
		0, false, true, false, true, 
		false, 006, true, false, 3, 24),
        ("Quantum computer services", "SHA-128", "2021-05-30", "2020-05-02", 
		53, 1356, 812569, 1524, 1027, 
		1, false, false, true, false, 
		true, 005, false, true, 2, 45),
		("Sound of music", "SHA-512", "2021-05-30", "2020-05-02", 
		87, 152946, 89450732, 512206, 894565, 
		4, true, true, true, true, 
		true, 001, false, false, 1, 796),
        ("Pete’s Super Submarines", "SHA-128", "2015-08-05", "2010-01-09", 
        12, 68, 76802, 159, 58, 
        0, false, false, false, false, 
        true, 012, true, true, 3, 14);

CREATE TABLE supplying_table(
	id_supplying_table bigint primary key not null,
    id_company_st bigint,
    id_supplying_company_st bigint,
    foreign key (id_company_st) references company (id)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	foreign key (id_supplying_company_st) references company (id)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

insert into supplying_table(id_supplying_table, id_company_st, id_supplying_company_st)
values	(001,001,002), (002,001,003), 
		(003,004,005), (004,004,006), 
        (005,007,008), (006,007,009);

select * from company;
select * from antivirus;
select * from supplying_table;

select * from supplying_table s
join company c on s.id_company_st=c.id
join antivirus ac on s.id_company_st=ac.idAntivirus
join company v on s.id_supplying_company_st=v.id
join antivirus av on s.id_supplying_company_st=av.idAntivirus;


# UPDATE `ciber_chollo`.`usuarios` SET `password` = 'toor' WHERE (`idUsuario` = '1');

 

#insert into usuarios(idUsuario, nombre, password) 
#values(1, "Robert", "1234"), (2, "Maria", "123"), (3, "David", "123");
#select * from usuarios;