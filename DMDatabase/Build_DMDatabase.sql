-- #############################################################

-- Make sure you create a new empty database to run this against 
-- Creates the DMDatabase Sample Database for demonstrations 

-- ############################################################# */

create table DM_CUSTOMER
    (
    customer_id nvarchar(10) not null,
    customer_firstname nvarchar(60),
    customer_lastname nvarchar(60),
    customer_gender nvarchar(1),
    customer_company_name nvarchar(60),
    customer_street_address nvarchar(60),
    customer_region nvarchar(60),
    customer_country nvarchar(60),
    customer_email nvarchar(60),
    customer_telephone nvarchar(60),
    customer_zipcode nvarchar(60),
    credit_card_type_id nvarchar(2),
    customer_credit_card_number nvarchar(60)
    );

CREATE TABLE DM_CUSTOMER_ASXML_IDAttr
(
	[customer_id] [varchar](10) NOT NULL,
	[customer_data] [xml] NULL,
 CONSTRAINT [PK_DM_CUSTOMER_ASXML_IDAttr] PRIMARY KEY ([customer_id] ASC)
);
create table DM_CUSTOMER_NOTES
    (
    customer_note_id INT NOT NULL,
	customer_id nvarchar(10) not null,
    customer_firstname nvarchar(60),
    customer_lastname nvarchar(60),
    customer_notes_entry_date datetime not null,
    customer_note nvarchar(2000),
	CONSTRAINT [PK_DM_CUSTOMER_NOTES] PRIMARY KEY (customer_note_id ASC)
    );

create table DM_INVOICE
    (
    invoice_number nvarchar(10) not null,
    invoice_date   datetime,
    invoice_customer_id nvarchar(60)
    );

create table DM_INVOICE_LINE
    (
    invoice_number nvarchar(10) not null,
    inventory_item_id  nvarchar(10) not null,
    invoice_line_quantity int,
    invoice_line_sale_price decimal(10,2)
    );
 
create table DM_INVOICE_LINE_HISTORY
    (
    identCol int IDENTITY (1, 1) NOT NULL,
    invoice_number nvarchar(6) not null,
    item_id nvarchar(6) not null,
    quantity int
    );
 
create table DM_CREDIT_CARD_TYPE
   (
   credit_card_type_id   nvarchar(2) not null,
   credit_card_type_name nvarchar(60)
   );

create table DM_INVENTORY_ITEM
    (
    inventory_item_id nvarchar(10) not null,
    inventory_item_name nvarchar(60)
    );
 
create table DM_SUPPLIERS
    (
    supplier_id int not null,
    supplier_name nvarchar(60)
    );

create table DM_EMPLOYEE
    (
    person_id int not null,
    assignment_id int not null,
    emp_id nvarchar(50),
    first_name nvarchar(40),
    last_name nvarchar(40),
    full_name nvarchar(40),
    birth_date datetime,
    gender nvarchar(1),
    title nvarchar(10),
    emp_data nvarchar(100)
    );

create table DM_EMP_AUDIT
    (
    identCol int IDENTITY (1, 1) NOT NULL,
    person_id int not null,
    assignment_id int not null,
    emp_id nvarchar(10),
    first_name nvarchar(40),
    last_name nvarchar(40),
    full_name nvarchar(40)
    );

create table DM_ASSIGNMENT
    (
    assignment_id int not null,
    person_id int not null,
    emp_id nvarchar(10),
    emp_jobtitle nvarchar(100),
    assignment_notes nvarchar(1000)
    );

CREATE TABLE DM_CUSTOMER_CONTACTS
(
CONTACT_ID int identity not null,
CONTACT_PERSON xml DEFAULT '<Company />' NOT NULL
);

-- #############################################################
-- This file loads the Data Masker sample tables
--
--   Run the file: create_tables.sql
--   to create the Data Masker sample tables
--
--   Data Masker for SQL Server Sample Schema
--
-- ############################################################# 


-- #######################################
-- ###### DM_CREDIT_CARD_TYPE       ######
-- #######################################

insert into DM_CREDIT_CARD_TYPE values ('1', 'Discover');
insert into DM_CREDIT_CARD_TYPE values ('2', 'American Express');
insert into DM_CREDIT_CARD_TYPE values ('3', 'Diners Club');
insert into DM_CREDIT_CARD_TYPE values ('4', 'Master Card');
insert into DM_CREDIT_CARD_TYPE values ('5', 'VISA');

-- ### DM_CUSTOMER ###

insert into DM_CUSTOMER values ('1000000','Mayme','Furno','M','','83 Goolagong Rd.','Florida','','mneeum43@millstream.com','(556) 244-7912','61463-7912','3','36128 2348 34945');
insert into DM_CUSTOMER values ('1000002','Jathbiyya','Valliant','F','','61 Naugatuck Gdns.','Iowa','','ycq_ny@thundershower.com','(496) 452-6901','26941-6156','2','');
insert into DM_CUSTOMER values ('1000005','Shanika','Lord','M','','9 New Inn St.','Wyoming','','qmyhonq97@toxifying.com','(636) 988-5480','23748-2460','1','6012 8234 1783 4945');
insert into DM_CUSTOMER values ('1000007','Cathie','Grismore','X','','48 Sleisna Rd.','South Carolina','','pin.gug@vibration.com','(461) 740-6755','41412-2052','3','36224 4498 76203');
insert into DM_CUSTOMER values ('1000008','Vinson','Herreras','M','Somerville Intruder plc','84 Castelle Bluff Ave.','South Dakota','','bfelb.epjb@demodulators.com','(437) 504-2373','50906-4896','2','');
insert into DM_CUSTOMER values ('1000011','Clovis','Aden','F','','99 Millbrose Rd.','Idaho','','vkafr56@taking.com','(565) 595-1319','68594-2180','1','6060 4294 7085 4718');
insert into DM_CUSTOMER values ('1000013','Tyshawn','Adriance','M','','25 Midpointe St.','Connecticut','','csmd.uzk@synchro.com','(377) 969-8485','71231-7733','4','5422 4449 6087 6203');
insert into DM_CUSTOMER values ('1000015','Gervaise','Shattles','F','','12 Rhoney Farm St.','New Jersey','','rscr_iber@scavenging.edu','(913) 492-4997','61211-5480','1','6051 8794 9274 6772');
insert into DM_CUSTOMER values ('1000016','Donovan','Allhands','M','Antiique Marine Ltd.','81 Four Season Cottages','Oklahoma','','uagw_owss@leopardess.com','(702) 578-8259','80798-9488','4','5560 4294 7085 4718');
insert into DM_CUSTOMER values ('1000017','Oriane','Brys','F','','74 Pellary St.','Massachusetts','','ikdu.ucfj@lurcher.com','(857) 968-4626','52716-6636','2','');
insert into DM_CUSTOMER values ('1000019','Agustin','Irby','M','','43 Clout Rd.','Rhode Island','','snlt.ycy@dysphonic.com','(703) 948-7317','60809-2472','3','36604 2948 54718');
insert into DM_CUSTOMER values ('1000020','Ryana','Frascella','F','Printhaus Call Co.','81 Netnolin Villas','Mississippi','','gmxo93@tonsillitis.com','(622) 130-6055','25290-2583','4','5451 8794 9274 6772');
insert into DM_CUSTOMER values ('1000021','Caesar','Nash','M','','80 Capano Ave.','Illinois','','cvv.qb@daxxit.com','(226) 977-3601','46611-6755','1','6006 7853 7184 3733');
insert into DM_CUSTOMER values ('1000022','Agostina','Samek','F','','52 Atkinson Mill Rd.','Georgia','','nlc@antitumoral.com','(596) 741-9136','07622-9140','1','6070 8424 4733 8486');
insert into DM_CUSTOMER values ('1000025','Hildegard','Polynice','M','','314 Englenook Embankment','District of Columbia','','erdpun29@inaudible.com','(525) 934-6853','94468-0404','5','4322 4449 6087 6203');
insert into DM_CUSTOMER values ('1000026','Fouad','Coonfare','F','','494 Sardis Mill Promenade','Vermont','','grwkgoh93@gazebos.com','(502) 189-6146','81376-6537','3','36518 7947 46772');
insert into DM_CUSTOMER values ('1000027','Pene','Coxon','M','','9 Veterens Rd.','Indiana','','fqjo.doyi@midrib.edu','(200) 968-8121','65186-0361','2','');
insert into DM_CUSTOMER values ('1000028','Royle','Pinilla','F','Blindcraft Bowes Ltd.','54 Breit Ave.','Wisconsin','','sxcq51@classy.com','(476) 528-2322','34165-2361','2','');
insert into DM_CUSTOMER values ('1000029','Jacob','Lavi','M','','4 Mechan Ct.','Maine','','iyl@substantiae.com','(207) 163-1113','74660-5653','4','5406 7853 7184 3733');
insert into DM_CUSTOMER values ('1000030','Janis','Perusse','F','','44 Chicken Foot Ave.','Minnesota','','rujwm_zvin@disporves.edu','(454) 898-7633','56792-8919','5','4460 4294 7085 4719');
insert into DM_CUSTOMER values ('1000032','Dionne','Lowell','M','Spin Hoist Ltd.','99 Buchin Ave.','Alabama','','etyteyfwvf@concurrencies.org','(668) 499-4519','38510-4158','4','5170 8424 4733 8486');
insert into DM_CUSTOMER values ('1000035','Arline','Riesenberg','F','','770 Schinnecock Hills Rd.','North Carolina','','lsptn.mcpw@hypoglycemic.com','(131) 923-5900','91806-1865','1','6068 6680 4850 2477');
insert into DM_CUSTOMER values ('1000037','Toinette','Stanojevic','M','','53 Tall Window Ave.','New York','','ucow.mpti@discouraging.biz','(827) 975-0699','55244-6558','4','5533 7218 0259 9220');
insert into DM_CUSTOMER values ('1000038','Berton','Ertel','F','','39 Question Ave.','New Mexico','','vqjh_knxw@embryologists.com','(749) 945-2951','63754-1176','2','');
insert into DM_CUSTOMER values ('1000040','Kati','Annan','M','European Lineartec Co.','15 Colquittford Ave.','Kentucky','','vacvxwkdt@emphatically.com','(898) 513-3091','64025-3469','5','4351 8794 9274 6772');
insert into DM_CUSTOMER values ('1000041','Heron','Mantia','F','','253A Worrel St.','West Virginia','','hhco_gef@lienteries.org','(423) 114-3954','78698-5577','3','36067 8538 43733');
insert into DM_CUSTOMER values ('1000042','Reva','Dort','M','','7 Scrivers Woods Lawn','Arizona','','mud_dds@preamble.edu','(202) 541-0536','30443-7807','3','36708 4243 38486');
insert into DM_CUSTOMER values ('1000046','Butch','Sannella','F','','792A Gimletter St.','Oregon','','kohndpc5@maxillas.com','(802) 302-9250','05248-9292','3','36686 6805 02478');
insert into DM_CUSTOMER values ('1000048','Christian','Burak','M','Premises Shephard plc','13 Colaine Ct.','Arkansas','','sqtsuz@elfish.com','(753) 646-5624','63175-8259','5','4806 7853 7184 3733');
insert into DM_CUSTOMER values ('1000050','Laure','Flummer','F','','84 Betsey Ave.','Virginia','','eyvl_foe@boarish.edu','(128) 400-7207','19680-6102','3','36184 8467 59324');
insert into DM_CUSTOMER values ('1000051','Boutros','Shelnutt','M','','568 Milcon St.','Florida','','vgxk.vdfa@tableware.com','(320) 236-5383','95740-4626','2','');
insert into DM_CUSTOMER values ('1000052','Demetria','Stevinson','F','Christopher Lambe Inc.','8 Chamo St.','Delaware','','rpi.nzr@dimpling.com','(176) 647-4971','54042-4568','4','5518 4846 3675 9324');
insert into DM_CUSTOMER values ('1000053','Edgar','Tikkanen','M','','81 Capurso Ave.','Iowa','','dvccwgx41@deathcup.com','(118) 178-2640','47500-6857','3','36175 4895 81982');
insert into DM_CUSTOMER values ('1000054','Homer','Mccleave','F','','57 Old Planters Parade','Kansas','','pio_esb@various.com','(827) 786-3862','26518-3502','3','36673 4857 79176');
insert into DM_CUSTOMER values ('1000057','Felecia','Hagler','M','','57 New Portland Hill Blvd.','Nebraska','','rej.fqy@trailed.biz','(401) 564-0563','41375-7317','3','36851 7458 25357');
insert into DM_CUSTOMER values ('1000058','Barnabas','Piedigrossi','F','','63 Godsdon St.','South Carolina','','uayjwulb@messier.com','(386) 848-9143','03999-6848','4','5417 5489 5358 1981');
insert into DM_CUSTOMER values ('1000059','Nader','Yerton','M','','73 Kasba Lane','South Dakota','','xmuh.llk@reacceded.com','(530) 101-4881','75593-8003','4','5367 3485 4877 9176');
insert into DM_CUSTOMER values ('1000061','Hall','Edemann','F','','89 Cajole Side','New Hampshire','','tspr.fjhc@crater.org','(637) 536-2032','43177-6530','1','6018 4846 3675 9324');
insert into DM_CUSTOMER values ('1000062','Millicent','Tyeryar','M','','68 Stoney Weir St.','Idaho','','tadiavu93@disestimation.com','(847) 414-6706','55655-1622','3','36336 0332 47555');
insert into DM_CUSTOMER values ('1000063','Jaylen','Vidals','F','','48 Warmlands Ave.','Nevada','','elywn_lxan@unsprung.com','(589) 225-7245','12365-3601','2','');
insert into DM_CUSTOMER values ('1000065','Maryam','Ramsdale','M','','37 Punching Camp Side','Hawaii','','mykgc.wfkm@phoneticize.com','(641) 445-9509','69742-6426','2','');
insert into DM_CUSTOMER values ('1000066','King','Sessa','F','','77 Green Pine Rd.','New Jersey','','fcgi_xvv@moviedom.com','(508) 568-1858','25351-9136','2','');
insert into DM_CUSTOMER values ('1000069','Stirling','Giessler','M','','10 Schaak Avenue','Missouri','','dmou.rztf@mankind.com','(118) 969-2785','19826-8936','2','');
insert into DM_CUSTOMER values ('1000070','Perdita','Bressette','F','','94 Leichester Row','Rhode Island','','tjnr30@semantically.com','(264) 159-7841','18008-1337','3','36751 7889 62095');
insert into DM_CUSTOMER values ('1000071','Bassam','Miggo','M','','43 Mendleson Ave.','Mississippi','','dlcvto70@sultanas.com','(846) 452-4518','98767-4785','1','6017 5489 5358 1981');
insert into DM_CUSTOMER values ('1000073','Percival','Brazell','F','','22 Chaft Chason Rd.','Georgia','','umq@dieses.com','(589) 759-8287','53491-7307','3','36601 4651 63210');
insert into DM_CUSTOMER values ('1000074','Ramakrishna','Dilello','M','','16 Frontenay Rd.','North Dakota','','xuy.yqc@litigable.com','(802) 823-9733','21428-3512','3','36663 9861 71225');
insert into DM_CUSTOMER values ('1000075','Kerry','Spakes','F','','21 Druet St.','California','','tzn.usg@harlots.com','(420) 120-4812','86808-6853','4','5285 1745 8082 5357');
insert into DM_CUSTOMER values ('1000076','Palmiro','Clemo','M','Algorithms Aaken Ltd.','894 Castlebury St.','District of Columbia','','xkvyp@demotic.com','(538) 580-3679','50993-5634','5','4570 8424 4733 8486');
insert into DM_CUSTOMER values ('1000077','Duha','Hiraki','F','','78 Serendia Ave.','Vermont','','igkuazuy@spearhead.com','(250) 575-0794','24304-4625','1','6067 3485 4877 9176');
insert into DM_CUSTOMER values ('1000078','Hayder','Raschig','M','','52A Canyon Branch Rd.','Indiana','','lbgc.dqp@dagoes.org','(463) 194-0464','46456-6146','2','');
insert into DM_CUSTOMER values ('1000080','Nadja','Asal','F','Sheffield Artisans Ltd.','27 Baren St.','Maine','','ttnzs80@ballcarrier.com','(485) 976-8366','12660-1102','3','36244 2513 75422');
insert into DM_CUSTOMER values ('1000082','Petrona','Merlo','M','','23 Canton Heights St.','Louisiana','','jwpamqxc@czarinas.com','(967) 814-8290','46351-9368','4','5233 6033 5624 7555');
insert into DM_CUSTOMER values ('1000083','Loyd','Morillo','F','','97 Haar St.','Alabama','','qxvvagn20@noncombining.edu','(337) 415-9157','75193-9800','1','6085 1745 8082 5357');
insert into DM_CUSTOMER values ('1000088','Edsel','Choudhury','M','Kensington Shears Ltd.','417 Harnum Ave.','New York','','mhwyd46@oilcup.com','(807) 913-6943','71887-4963','4','5375 1788 5296 2095');
insert into DM_CUSTOMER values ('1000089','Herschel','Messmer','F','','6 Ostrow Ave.','New Mexico','','tehix51@weekending.com','(435) 335-8968','12611-8007','3','36858 8029 34961');
insert into DM_CUSTOMER values ('1000091','Telesphore','Vientos','M','','116 Lufberry Quay','Kentucky','','tyrh_ank@smolders.biz','(810) 212-4749','89811-1298','4','5460 1465 6616 3210');
insert into DM_CUSTOMER values ('1000097','Faye','Grond','F','','84 Vesthaven Rd.','Oregon','','gvl@gitanos.edu','(651) 298-8813','82292-6999','5','4268 6680 4850 2477');
insert into DM_CUSTOMER values ('1000098','Nerio','Kidd','M','','61 Stehley St.','Ohio','','bbod.ezzj@dogear.com','(706) 551-7326','57954-2368','4','5266 3986 5417 1224');
insert into DM_CUSTOMER values ('1000099','Curtiss','Raynes','F','','144 Noto Ct.','Arkansas','','yrckl_ozjy@uglified.com','(538) 815-5372','40541-5927','3','36017 3640 80200');
insert into DM_CUSTOMER values ('1000084','Amador','Cordier','M','Malton Woodturners Ltd.','441 Azore St.','Utah','','hqbzg66@arrives.com','(237) 996-9467','09327-2322','3','36154 2802 53703');
insert into DM_CUSTOMER values ('1000087','Estela','Waddel','F','','28 Olde Atlanta Ave.','Montana','','jlxq88@unscrutinizingly.com','(783) 354-9285','75341-1113','4','5424 4251 1237 5422');
insert into DM_CUSTOMER values ('1000090','Gowri','Iozzi','M','','44 Canoe Pond St.','Maryland','','rbbcltxsr@cuttingly.com','(705) 604-5293','45980-7633','4','5585 8802 1893 4961');
insert into DM_CUSTOMER values ('1000093','Donal','Stumpp','F','','585 Singleton School Rd.','Arizona','','earrqad71@zippers.com','(584) 598-7627','05992-4084','5','4918 4846 3675 9324');
insert into DM_CUSTOMER values ('1000096','Judge','Gade','M','Workwear Tollemache Ltd.','76 Farias Ave.','Michigan','','kwwekma28@internuncial.com','(834) 992-8441','99854-4519','5','4317 5489 5358 1981');
insert into DM_CUSTOMER values ('1000001','Camilo','Burrows','F','','67 Ducey Rd.','Delaware','','nkiy72@hazardous.com','(860) 748-3226','87244-9144','5','4267 3485 4877 9176');
insert into DM_CUSTOMER values ('1000006','Freddie','Geringer','M','','347 Cave Walk St.','Nebraska','','zqbz.pwww@deserter.com','(583) 672-2407','51948-6901','2','');
insert into DM_CUSTOMER values ('1000012','Adrianna','Buzek','F','Switch Bellhouse Ltd.','967 Chilula Ave.','Nevada','','xcgcij@dissolutions.com','(276) 258-6001','57122-1425','1','6033 6033 5624 7555');
insert into DM_CUSTOMER values ('1000018','Brayan','Chrzanowski','M','','15 Knobview Court','Missouri','','agqkv@reprehends.com','(947) 373-3502','12088-2407','3','36473 3184 85000');
insert into DM_CUSTOMER values ('1000024','Glanville','Elwer','F','Guss Hillstead Inc.','85 Nottington St.','California','','ekcv.dys@ulnar.com','(612) 307-9541','34595-2373','4','5401 7364 0408 0200');
insert into DM_CUSTOMER values ('1000031','Kirstin','Punch','M','','739 Towerwood St.','Louisiana','','bxk_yg@omikron.biz','(120) 663-4084','85265-7397','3','36343 6969 11401');
insert into DM_CUSTOMER values ('1000036','Alban','Kravitz','F','Goldstraw Maintenance plc','55 Winberry Ave.','Montana','','zswjziu@deregulate.com','(941) 722-9392','51775-6001','2','');
insert into DM_CUSTOMER values ('1000043','Olaf','Mestre','M','','90 Eastlin View','Colorado','','eseo_pwq@housefront.org','(682) 171-8019','90456-3211','2','');
insert into DM_CUSTOMER values ('1000049','James','Bonnet','F','','991 Lampton Heights St.','Pennsylvania','','thqiaf52@sailors.biz','(689) 660-2265','12735-7178','4','5115 4280 5225 3703');
insert into DM_CUSTOMER values ('1000055','Ronnie','Jungling','M','','31 Ness Rd.','Texas','','kum_ol@tomentum.biz','(468) 213-1383','69649-3773','4','5347 3318 9648 5001');
insert into DM_CUSTOMER values ('1000060','Cherri','Closeburn','F','Rosco Pigs plc','89 Cayford Orchard St.','Tennessee','','aehubhaa@desirability.biz','(535) 833-2280','52017-6055','1','6077 1669 8381 9566');
insert into DM_CUSTOMER values ('1000067','Letitia','Cliatt','M','','98 Pflughaupt Rd.','Oklahoma','','rdlj@watchwords.com','(429) 907-4550','97529-9241','2','');
insert into DM_CUSTOMER values ('1000072','Lottie','Gibble','F','Bagpipe Milner Co.','98 Shiras Rd.','Illinois','','bdsbs_lzgi@emigrates.com','(494) 933-3095','63865-9541','2','');
insert into DM_CUSTOMER values ('1000079','Vergil','Ledesma','M','','38 Lonesome Pocket St.','Wisconsin','','emhef.axxc@shrimpier.com','(649) 554-3512','96560-8689','5','4685 1745 8082 5357');
insert into DM_CUSTOMER values ('1000086','Drake','Denery','F','','394 High Tech Ave.','North Carolina','','hyibww@peeler.com','(760) 385-5376','53626-1576','2','');
insert into DM_CUSTOMER values ('1000095','Emelia','Youtsey','M','','7 Left Frontage Parade','Alaska','','dhmmgxz98@seemers.com','(737) 658-4060','96212-0320','1','6075 1788 5296 2095');
insert into DM_CUSTOMER values ('1000003','Jarrell','Madison','F','','27 Romanik Est Ave.','Kansas','','moow.tdlj@typebar.org','(880) 820-3574','23746-3226','2','');
insert into DM_CUSTOMER values ('1000014','Jerry','Gaskell','M','','31 Falls Run Ave.','Hawaii','','iwuho@intercostal.com','(317) 311-7807','99257-1786','2','');
insert into DM_CUSTOMER values ('1000023','Wilf','Volinsky','F','','36 Frodel St.','North Dakota','','yyv_ic@listel.com','(585) 937-8936','62317-8161','2','');
insert into DM_CUSTOMER values ('1000033','Toussaint','Schwent','M','','829 Eastfields Rd.','Utah','','fnb_uay@horseshoers.com','(999) 682-5927','90218-1319','5','4633 6033 5624 7555');
insert into DM_CUSTOMER values ('1000044','Sankar','Dreisbach','F','Caunce Hooper Inc.','563 Chappo Rd.','Alaska','','zvmzj@dischargee.com','(552) 982-0145','54852-5917','3','36691 6014 08198');
insert into DM_CUSTOMER values ('1000056','Colton','Kyle','M','Piccolo Gunsmiths Ltd.','9 Black Knight Wall','Wyoming','','axh@bucolically.com','(861) 113-0153','23267-4347','3','36666 5469 20636');
insert into DM_CUSTOMER values ('1000068','Nathanial','Setser','F','Maughan Soap Ltd.','540 Mercada Grove','Massachusetts','','sljvzpkfwz@superber.com','(838) 399-5970','45818-3396','2','');
insert into DM_CUSTOMER values ('1000081','Alger','Kenebrew','M','','758 Burjer Ave.','Minnesota','','ntlid.ptkb@contendere.org','(271) 516-6636','40273-8121','2','');
insert into DM_CUSTOMER values ('1000094','Fulk','Corban','F','','998 Left Terrace','Colorado','','mmq.az@sedulously.edu','(135) 988-4377','83054-5763','4','5434 3696 5891 1401');
insert into DM_CUSTOMER values ('1000039','Anand','Stanciel','M','','60 Gun Powder Ave.','Maryland','','jxfz.kft@nobbier.biz','(788) 575-0049','66152-8485','1','6060 1465 6616 3210');
insert into DM_CUSTOMER values ('1000009','Husam','Closey','F','','961 Bushwacker St.','Tennessee','','mqbnh_xdpr@cordlessly.com','(953) 561-0361','41434-3574','5','4312 8234 1783 4945');
insert into DM_CUSTOMER values ('1000092','Rhiannon','Riskin','M','Toys Upton Inc.','342 Chairty St.','West Virginia','','ndte_ufg@differers.com','(735) 983-3665','53631-1954','5','4933 7218 0259 9221');
insert into DM_CUSTOMER values ('1000045','Suzanna','Muegge','F','','4 Ridgeway Industrial Ave.','Michigan','','jgih_zejz@moldboard.com','(996) 278-1292','55493-4997','3','36337 2185 99220');
insert into DM_CUSTOMER values ('1000064','Stone','Dowson','M','Associate Boyall Ltd.','148 Puulau Ave.','Connecticut','','jqrne.tibo@deceitfully.com','(359) 356-5502','47900-8977','3','36771 6698 19566');
insert into DM_CUSTOMER values ('1000010','Delia','Tamm','F','','73 Pert Rd.','New Hampshire','','hix.wvx@triers.org','(858) 497-8919','77763-8820','1','6022 4449 6087 6203');
insert into DM_CUSTOMER values ('1000034','Rolph','Foglio','M','','16 Bonmot Drive','Washington','','vgkyij@catechizable.com','(190) 382-9371','28058-7295','1','6033 7218 0259 9220');
insert into DM_CUSTOMER values ('1000004','Gaylord','Bellefleur','F','Balloon Save Inc.','80 Centerpoint Esplanade','Texas','','btqe34@devisees.com','(886) 933-1425','52835-3648','4','5412 8234 1783 4945');
insert into DM_CUSTOMER values ('1000047','Haylee','Winnike','M','','61 Unimay Ave.','Ohio','','qmna50@joystick.org','(994) 471-7076','50879-8213','4','5368 6680 4850 2477');
insert into DM_CUSTOMER values ('1000085','Jaqueline','Eakle','F','','23 Desert Trailways Ave.','Washington','','fcf_pd@gerontologists.com','(304) 456-0434','81910-6128','4','5177 1669 8381 9566');

insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000000', '<Customer ID="1000000" XCode="XX"><customer_firstname>Mayme</customer_firstname><customer_lastname>Furno</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>83 Goolagong Rd.</customer_street_address><customer_region>Florida</customer_region><customer_country></customer_country><customer_email>mneeum43@millstream.com</customer_email><customer_telephone>(556) 244-7912</customer_telephone><customer_zipcode>61463-7912</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36128 2348 34945</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000001', '<Customer ID="1000001" XCode="XX"><customer_firstname>Camilo</customer_firstname><customer_lastname>Burrows</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>67 Ducey Rd.</customer_street_address><customer_region>Delaware</customer_region><customer_country></customer_country><customer_email>nkiy72@hazardous.com</customer_email><customer_telephone>(860) 748-3226</customer_telephone><customer_zipcode>87244-9144</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4267 3485 4877 9176</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000002', '<Customer ID="1000002" XCode="XX"><customer_firstname>Jathbiyya</customer_firstname><customer_lastname>Valliant</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>61 Naugatuck Gdns.</customer_street_address><customer_region>Iowa</customer_region><customer_country></customer_country><customer_email>ycq_ny@thundershower.com</customer_email><customer_telephone>(496) 452-6901</customer_telephone><customer_zipcode>26941-6156</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000003', '<Customer ID="1000003" XCode="XX"><customer_firstname>Jarrell</customer_firstname><customer_lastname>Madison</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>27 Romanik Est Ave.</customer_street_address><customer_region>Kansas</customer_region><customer_country></customer_country><customer_email>moow.tdlj@typebar.org</customer_email><customer_telephone>(880) 820-3574</customer_telephone><customer_zipcode>23746-3226</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000004', '<Customer ID="1000004" XCode="XX"><customer_firstname>Gaylord</customer_firstname><customer_lastname>Bellefleur</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Balloon Save Inc.</customer_company_name><customer_street_address>80 Centerpoint Esplanade</customer_street_address><customer_region>Texas</customer_region><customer_country></customer_country><customer_email>btqe34@devisees.com</customer_email><customer_telephone>(886) 933-1425</customer_telephone><customer_zipcode>52835-3648</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5412 8234 1783 4945</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000005', '<Customer ID="1000005" XCode="XX"><customer_firstname>Shanika</customer_firstname><customer_lastname>Lord</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>9 New Inn St.</customer_street_address><customer_region>Wyoming</customer_region><customer_country></customer_country><customer_email>qmyhonq97@toxifying.com</customer_email><customer_telephone>(636) 988-5480</customer_telephone><customer_zipcode>23748-2460</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6012 8234 1783 4945</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000006', '<Customer ID="1000006" XCode="XX"><customer_firstname>Freddie</customer_firstname><customer_lastname>Geringer</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>347 Cave Walk St.</customer_street_address><customer_region>Nebraska</customer_region><customer_country></customer_country><customer_email>zqbz.pwww@deserter.com</customer_email><customer_telephone>(583) 672-2407</customer_telephone><customer_zipcode>51948-6901</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000007', '<Customer ID="1000007" XCode="XX"><customer_firstname>Cathie</customer_firstname><customer_lastname>Grismore</customer_lastname><customer_gender>X</customer_gender><customer_company_name></customer_company_name><customer_street_address>48 Sleisna Rd.</customer_street_address><customer_region>South Carolina</customer_region><customer_country></customer_country><customer_email>pin.gug@vibration.com</customer_email><customer_telephone>(461) 740-6755</customer_telephone><customer_zipcode>41412-2052</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36224 4498 76203</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000008', '<Customer ID="1000008" XCode="XX"><customer_firstname>Vinson</customer_firstname><customer_lastname>Herreras</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Somerville Intruder plc</customer_company_name><customer_street_address>84 Castelle Bluff Ave.</customer_street_address><customer_region>South Dakota</customer_region><customer_country></customer_country><customer_email>bfelb.epjb@demodulators.com</customer_email><customer_telephone>(437) 504-2373</customer_telephone><customer_zipcode>50906-4896</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000009', '<Customer ID="1000009" XCode="XX"><customer_firstname>Husam</customer_firstname><customer_lastname>Closey</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>961 Bushwacker St.</customer_street_address><customer_region>Tennessee</customer_region><customer_country></customer_country><customer_email>mqbnh_xdpr@cordlessly.com</customer_email><customer_telephone>(953) 561-0361</customer_telephone><customer_zipcode>41434-3574</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4312 8234 1783 4945</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000010', '<Customer ID="1000010" XCode="XX"><customer_firstname>Delia</customer_firstname><customer_lastname>Tamm</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>73 Pert Rd.</customer_street_address><customer_region>New Hampshire</customer_region><customer_country></customer_country><customer_email>hix.wvx@triers.org</customer_email><customer_telephone>(858) 497-8919</customer_telephone><customer_zipcode>77763-8820</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6022 4449 6087 6203</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000011', '<Customer ID="1000011" XCode="XX"><customer_firstname>Clovis</customer_firstname><customer_lastname>Aden</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>99 Millbrose Rd.</customer_street_address><customer_region>Idaho</customer_region><customer_country></customer_country><customer_email>vkafr56@taking.com</customer_email><customer_telephone>(565) 595-1319</customer_telephone><customer_zipcode>68594-2180</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6060 4294 7085 4718</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000012', '<Customer ID="1000012" XCode="XX"><customer_firstname>Adrianna</customer_firstname><customer_lastname>Buzek</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Switch Bellhouse Ltd.</customer_company_name><customer_street_address>967 Chilula Ave.</customer_street_address><customer_region>Nevada</customer_region><customer_country></customer_country><customer_email>xcgcij@dissolutions.com</customer_email><customer_telephone>(276) 258-6001</customer_telephone><customer_zipcode>57122-1425</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6033 6033 5624 7555</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000013', '<Customer ID="1000013" XCode="XX"><customer_firstname>Tyshawn</customer_firstname><customer_lastname>Adriance</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>25 Midpointe St.</customer_street_address><customer_region>Connecticut</customer_region><customer_country></customer_country><customer_email>csmd.uzk@synchro.com</customer_email><customer_telephone>(377) 969-8485</customer_telephone><customer_zipcode>71231-7733</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5422 4449 6087 6203</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000014', '<Customer ID="1000014" XCode="XX"><customer_firstname>Jerry</customer_firstname><customer_lastname>Gaskell</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>31 Falls Run Ave.</customer_street_address><customer_region>Hawaii</customer_region><customer_country></customer_country><customer_email>iwuho@intercostal.com</customer_email><customer_telephone>(317) 311-7807</customer_telephone><customer_zipcode>99257-1786</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000015', '<Customer ID="1000015" XCode="XX"><customer_firstname>Gervaise</customer_firstname><customer_lastname>Shattles</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>12 Rhoney Farm St.</customer_street_address><customer_region>New Jersey</customer_region><customer_country></customer_country><customer_email>rscr_iber@scavenging.edu</customer_email><customer_telephone>(913) 492-4997</customer_telephone><customer_zipcode>61211-5480</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6051 8794 9274 6772</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000016', '<Customer ID="1000016" XCode="XX"><customer_firstname>Donovan</customer_firstname><customer_lastname>Allhands</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Antiique Marine Ltd.</customer_company_name><customer_street_address>81 Four Season Cottages</customer_street_address><customer_region>Oklahoma</customer_region><customer_country></customer_country><customer_email>uagw_owss@leopardess.com</customer_email><customer_telephone>(702) 578-8259</customer_telephone><customer_zipcode>80798-9488</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5560 4294 7085 4718</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000017', '<Customer ID="1000017" XCode="XX"><customer_firstname>Oriane</customer_firstname><customer_lastname>Brys</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>74 Pellary St.</customer_street_address><customer_region>Massachusetts</customer_region><customer_country></customer_country><customer_email>ikdu.ucfj@lurcher.com</customer_email><customer_telephone>(857) 968-4626</customer_telephone><customer_zipcode>52716-6636</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000018', '<Customer ID="1000018" XCode="XX"><customer_firstname>Brayan</customer_firstname><customer_lastname>Chrzanowski</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>15 Knobview Court</customer_street_address><customer_region>Missouri</customer_region><customer_country></customer_country><customer_email>agqkv@reprehends.com</customer_email><customer_telephone>(947) 373-3502</customer_telephone><customer_zipcode>12088-2407</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36473 3184 85000</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000019', '<Customer ID="1000019" XCode="XX"><customer_firstname>Agustin</customer_firstname><customer_lastname>Irby</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>43 Clout Rd.</customer_street_address><customer_region>Rhode Island</customer_region><customer_country></customer_country><customer_email>snlt.ycy@dysphonic.com</customer_email><customer_telephone>(703) 948-7317</customer_telephone><customer_zipcode>60809-2472</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36604 2948 54718</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000020', '<Customer ID="1000020" XCode="XX"><customer_firstname>Ryana</customer_firstname><customer_lastname>Frascella</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Printhaus Call Co.</customer_company_name><customer_street_address>81 Netnolin Villas</customer_street_address><customer_region>Mississippi</customer_region><customer_country></customer_country><customer_email>gmxo93@tonsillitis.com</customer_email><customer_telephone>(622) 130-6055</customer_telephone><customer_zipcode>25290-2583</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5451 8794 9274 6772</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000021', '<Customer ID="1000021" XCode="XX"><customer_firstname>Caesar</customer_firstname><customer_lastname>Nash</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>80 Capano Ave.</customer_street_address><customer_region>Illinois</customer_region><customer_country></customer_country><customer_email>cvv.qb@daxxit.com</customer_email><customer_telephone>(226) 977-3601</customer_telephone><customer_zipcode>46611-6755</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6006 7853 7184 3733</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000022', '<Customer ID="1000022" XCode="XX"><customer_firstname>Agostina</customer_firstname><customer_lastname>Samek</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>52 Atkinson Mill Rd.</customer_street_address><customer_region>Georgia</customer_region><customer_country></customer_country><customer_email>nlc@antitumoral.com</customer_email><customer_telephone>(596) 741-9136</customer_telephone><customer_zipcode>07622-9140</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6070 8424 4733 8486</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000023', '<Customer ID="1000023" XCode="XX"><customer_firstname>Wilf</customer_firstname><customer_lastname>Volinsky</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>36 Frodel St.</customer_street_address><customer_region>North Dakota</customer_region><customer_country></customer_country><customer_email>yyv_ic@listel.com</customer_email><customer_telephone>(585) 937-8936</customer_telephone><customer_zipcode>62317-8161</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000024', '<Customer ID="1000024" XCode="XX"><customer_firstname>Glanville</customer_firstname><customer_lastname>Elwer</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Guss Hillstead Inc.</customer_company_name><customer_street_address>85 Nottington St.</customer_street_address><customer_region>California</customer_region><customer_country></customer_country><customer_email>ekcv.dys@ulnar.com</customer_email><customer_telephone>(612) 307-9541</customer_telephone><customer_zipcode>34595-2373</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5401 7364 0408 0200</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000025', '<Customer ID="1000025" XCode="XX"><customer_firstname>Hildegard</customer_firstname><customer_lastname>Polynice</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>314 Englenook Embankment</customer_street_address><customer_region>District of Columbia</customer_region><customer_country></customer_country><customer_email>erdpun29@inaudible.com</customer_email><customer_telephone>(525) 934-6853</customer_telephone><customer_zipcode>94468-0404</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4322 4449 6087 6203</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000026', '<Customer ID="1000026" XCode="XX"><customer_firstname>Fouad</customer_firstname><customer_lastname>Coonfare</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>494 Sardis Mill Promenade</customer_street_address><customer_region>Vermont</customer_region><customer_country></customer_country><customer_email>grwkgoh93@gazebos.com</customer_email><customer_telephone>(502) 189-6146</customer_telephone><customer_zipcode>81376-6537</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36518 7947 46772</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000027', '<Customer ID="1000027" XCode="XX"><customer_firstname>Pene</customer_firstname><customer_lastname>Coxon</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>9 Veterens Rd.</customer_street_address><customer_region>Indiana</customer_region><customer_country></customer_country><customer_email>fqjo.doyi@midrib.edu</customer_email><customer_telephone>(200) 968-8121</customer_telephone><customer_zipcode>65186-0361</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000028', '<Customer ID="1000028" XCode="XX"><customer_firstname>Royle</customer_firstname><customer_lastname>Pinilla</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Blindcraft Bowes Ltd.</customer_company_name><customer_street_address>54 Breit Ave.</customer_street_address><customer_region>Wisconsin</customer_region><customer_country></customer_country><customer_email>sxcq51@classy.com</customer_email><customer_telephone>(476) 528-2322</customer_telephone><customer_zipcode>34165-2361</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000029', '<Customer ID="1000029" XCode="XX"><customer_firstname>Jacob</customer_firstname><customer_lastname>Lavi</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>4 Mechan Ct.</customer_street_address><customer_region>Maine</customer_region><customer_country></customer_country><customer_email>iyl@substantiae.com</customer_email><customer_telephone>(207) 163-1113</customer_telephone><customer_zipcode>74660-5653</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5406 7853 7184 3733</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000030', '<Customer ID="1000030" XCode="XX"><customer_firstname>Janis</customer_firstname><customer_lastname>Perusse</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>44 Chicken Foot Ave.</customer_street_address><customer_region>Minnesota</customer_region><customer_country></customer_country><customer_email>rujwm_zvin@disporves.edu</customer_email><customer_telephone>(454) 898-7633</customer_telephone><customer_zipcode>56792-8919</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4460 4294 7085 4719</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000031', '<Customer ID="1000031" XCode="XX"><customer_firstname>Kirstin</customer_firstname><customer_lastname>Punch</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>739 Towerwood St.</customer_street_address><customer_region>Louisiana</customer_region><customer_country></customer_country><customer_email>bxk_yg@omikron.biz</customer_email><customer_telephone>(120) 663-4084</customer_telephone><customer_zipcode>85265-7397</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36343 6969 11401</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000032', '<Customer ID="1000032" XCode="XX"><customer_firstname>Dionne</customer_firstname><customer_lastname>Lowell</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Spin Hoist Ltd.</customer_company_name><customer_street_address>99 Buchin Ave.</customer_street_address><customer_region>Alabama</customer_region><customer_country></customer_country><customer_email>etyteyfwvf@concurrencies.org</customer_email><customer_telephone>(668) 499-4519</customer_telephone><customer_zipcode>38510-4158</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5170 8424 4733 8486</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000033', '<Customer ID="1000033" XCode="XX"><customer_firstname>Toussaint</customer_firstname><customer_lastname>Schwent</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>829 Eastfields Rd.</customer_street_address><customer_region>Utah</customer_region><customer_country></customer_country><customer_email>fnb_uay@horseshoers.com</customer_email><customer_telephone>(999) 682-5927</customer_telephone><customer_zipcode>90218-1319</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4633 6033 5624 7555</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000034', '<Customer ID="1000034" XCode="XX"><customer_firstname>Rolph</customer_firstname><customer_lastname>Foglio</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>16 Bonmot Drive</customer_street_address><customer_region>Washington</customer_region><customer_country></customer_country><customer_email>vgkyij@catechizable.com</customer_email><customer_telephone>(190) 382-9371</customer_telephone><customer_zipcode>28058-7295</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6033 7218 0259 9220</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000035', '<Customer ID="1000035" XCode="XX"><customer_firstname>Arline</customer_firstname><customer_lastname>Riesenberg</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>770 Schinnecock Hills Rd.</customer_street_address><customer_region>North Carolina</customer_region><customer_country></customer_country><customer_email>lsptn.mcpw@hypoglycemic.com</customer_email><customer_telephone>(131) 923-5900</customer_telephone><customer_zipcode>91806-1865</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6068 6680 4850 2477</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000036', '<Customer ID="1000036" XCode="XX"><customer_firstname>Alban</customer_firstname><customer_lastname>Kravitz</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Goldstraw Maintenance plc</customer_company_name><customer_street_address>55 Winberry Ave.</customer_street_address><customer_region>Montana</customer_region><customer_country></customer_country><customer_email>zswjziu@deregulate.com</customer_email><customer_telephone>(941) 722-9392</customer_telephone><customer_zipcode>51775-6001</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000037', '<Customer ID="1000037" XCode="XX"><customer_firstname>Toinette</customer_firstname><customer_lastname>Stanojevic</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>53 Tall Window Ave.</customer_street_address><customer_region>New York</customer_region><customer_country></customer_country><customer_email>ucow.mpti@discouraging.biz</customer_email><customer_telephone>(827) 975-0699</customer_telephone><customer_zipcode>55244-6558</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5533 7218 0259 9220</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000038', '<Customer ID="1000038" XCode="XX"><customer_firstname>Berton</customer_firstname><customer_lastname>Ertel</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>39 Question Ave.</customer_street_address><customer_region>New Mexico</customer_region><customer_country></customer_country><customer_email>vqjh_knxw@embryologists.com</customer_email><customer_telephone>(749) 945-2951</customer_telephone><customer_zipcode>63754-1176</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000039', '<Customer ID="1000039" XCode="XX"><customer_firstname>Anand</customer_firstname><customer_lastname>Stanciel</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>60 Gun Powder Ave.</customer_street_address><customer_region>Maryland</customer_region><customer_country></customer_country><customer_email>jxfz.kft@nobbier.biz</customer_email><customer_telephone>(788) 575-0049</customer_telephone><customer_zipcode>66152-8485</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6060 1465 6616 3210</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000040', '<Customer ID="1000040" XCode="XX"><customer_firstname>Kati</customer_firstname><customer_lastname>Annan</customer_lastname><customer_gender>M</customer_gender><customer_company_name>European Lineartec Co.</customer_company_name><customer_street_address>15 Colquittford Ave.</customer_street_address><customer_region>Kentucky</customer_region><customer_country></customer_country><customer_email>vacvxwkdt@emphatically.com</customer_email><customer_telephone>(898) 513-3091</customer_telephone><customer_zipcode>64025-3469</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4351 8794 9274 6772</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000041', '<Customer ID="1000041" XCode="XX"><customer_firstname>Heron</customer_firstname><customer_lastname>Mantia</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>253A Worrel St.</customer_street_address><customer_region>West Virginia</customer_region><customer_country></customer_country><customer_email>hhco_gef@lienteries.org</customer_email><customer_telephone>(423) 114-3954</customer_telephone><customer_zipcode>78698-5577</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36067 8538 43733</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000042', '<Customer ID="1000042" XCode="XX"><customer_firstname>Reva</customer_firstname><customer_lastname>Dort</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>7 Scrivers Woods Lawn</customer_street_address><customer_region>Arizona</customer_region><customer_country></customer_country><customer_email>mud_dds@preamble.edu</customer_email><customer_telephone>(202) 541-0536</customer_telephone><customer_zipcode>30443-7807</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36708 4243 38486</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000043', '<Customer ID="1000043" XCode="XX"><customer_firstname>Olaf</customer_firstname><customer_lastname>Mestre</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>90 Eastlin View</customer_street_address><customer_region>Colorado</customer_region><customer_country></customer_country><customer_email>eseo_pwq@housefront.org</customer_email><customer_telephone>(682) 171-8019</customer_telephone><customer_zipcode>90456-3211</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000044', '<Customer ID="1000044" XCode="XX"><customer_firstname>Sankar</customer_firstname><customer_lastname>Dreisbach</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Caunce Hooper Inc.</customer_company_name><customer_street_address>563 Chappo Rd.</customer_street_address><customer_region>Alaska</customer_region><customer_country></customer_country><customer_email>zvmzj@dischargee.com</customer_email><customer_telephone>(552) 982-0145</customer_telephone><customer_zipcode>54852-5917</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36691 6014 08198</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000045', '<Customer ID="1000045" XCode="XX"><customer_firstname>Suzanna</customer_firstname><customer_lastname>Muegge</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>4 Ridgeway Industrial Ave.</customer_street_address><customer_region>Michigan</customer_region><customer_country></customer_country><customer_email>jgih_zejz@moldboard.com</customer_email><customer_telephone>(996) 278-1292</customer_telephone><customer_zipcode>55493-4997</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36337 2185 99220</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000046', '<Customer ID="1000046" XCode="XX"><customer_firstname>Butch</customer_firstname><customer_lastname>Sannella</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>792A Gimletter St.</customer_street_address><customer_region>Oregon</customer_region><customer_country></customer_country><customer_email>kohndpc5@maxillas.com</customer_email><customer_telephone>(802) 302-9250</customer_telephone><customer_zipcode>05248-9292</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36686 6805 02478</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000047', '<Customer ID="1000047" XCode="XX"><customer_firstname>Haylee</customer_firstname><customer_lastname>Winnike</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>61 Unimay Ave.</customer_street_address><customer_region>Ohio</customer_region><customer_country></customer_country><customer_email>qmna50@joystick.org</customer_email><customer_telephone>(994) 471-7076</customer_telephone><customer_zipcode>50879-8213</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5368 6680 4850 2477</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000048', '<Customer ID="1000048" XCode="XX"><customer_firstname>Christian</customer_firstname><customer_lastname>Burak</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Premises Shephard plc</customer_company_name><customer_street_address>13 Colaine Ct.</customer_street_address><customer_region>Arkansas</customer_region><customer_country></customer_country><customer_email>sqtsuz@elfish.com</customer_email><customer_telephone>(753) 646-5624</customer_telephone><customer_zipcode>63175-8259</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4806 7853 7184 3733</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000049', '<Customer ID="1000049" XCode="XX"><customer_firstname>James</customer_firstname><customer_lastname>Bonnet</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>991 Lampton Heights St.</customer_street_address><customer_region>Pennsylvania</customer_region><customer_country></customer_country><customer_email>thqiaf52@sailors.biz</customer_email><customer_telephone>(689) 660-2265</customer_telephone><customer_zipcode>12735-7178</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5115 4280 5225 3703</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000050', '<Customer ID="1000050" XCode="XX"><customer_firstname>Laure</customer_firstname><customer_lastname>Flummer</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>84 Betsey Ave.</customer_street_address><customer_region>Virginia</customer_region><customer_country></customer_country><customer_email>eyvl_foe@boarish.edu</customer_email><customer_telephone>(128) 400-7207</customer_telephone><customer_zipcode>19680-6102</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36184 8467 59324</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000051', '<Customer ID="1000051" XCode="XX"><customer_firstname>Boutros</customer_firstname><customer_lastname>Shelnutt</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>568 Milcon St.</customer_street_address><customer_region>Florida</customer_region><customer_country></customer_country><customer_email>vgxk.vdfa@tableware.com</customer_email><customer_telephone>(320) 236-5383</customer_telephone><customer_zipcode>95740-4626</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000052', '<Customer ID="1000052" XCode="XX"><customer_firstname>Demetria</customer_firstname><customer_lastname>Stevinson</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Christopher Lambe Inc.</customer_company_name><customer_street_address>8 Chamo St.</customer_street_address><customer_region>Delaware</customer_region><customer_country></customer_country><customer_email>rpi.nzr@dimpling.com</customer_email><customer_telephone>(176) 647-4971</customer_telephone><customer_zipcode>54042-4568</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5518 4846 3675 9324</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000053', '<Customer ID="1000053" XCode="XX"><customer_firstname>Edgar</customer_firstname><customer_lastname>Tikkanen</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>81 Capurso Ave.</customer_street_address><customer_region>Iowa</customer_region><customer_country></customer_country><customer_email>dvccwgx41@deathcup.com</customer_email><customer_telephone>(118) 178-2640</customer_telephone><customer_zipcode>47500-6857</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36175 4895 81982</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000054', '<Customer ID="1000054" XCode="XX"><customer_firstname>Homer</customer_firstname><customer_lastname>Mccleave</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>57 Old Planters Parade</customer_street_address><customer_region>Kansas</customer_region><customer_country></customer_country><customer_email>pio_esb@various.com</customer_email><customer_telephone>(827) 786-3862</customer_telephone><customer_zipcode>26518-3502</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36673 4857 79176</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000055', '<Customer ID="1000055" XCode="XX"><customer_firstname>Ronnie</customer_firstname><customer_lastname>Jungling</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>31 Ness Rd.</customer_street_address><customer_region>Texas</customer_region><customer_country></customer_country><customer_email>kum_ol@tomentum.biz</customer_email><customer_telephone>(468) 213-1383</customer_telephone><customer_zipcode>69649-3773</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5347 3318 9648 5001</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000056', '<Customer ID="1000056" XCode="XX"><customer_firstname>Colton</customer_firstname><customer_lastname>Kyle</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Piccolo Gunsmiths Ltd.</customer_company_name><customer_street_address>9 Black Knight Wall</customer_street_address><customer_region>Wyoming</customer_region><customer_country></customer_country><customer_email>axh@bucolically.com</customer_email><customer_telephone>(861) 113-0153</customer_telephone><customer_zipcode>23267-4347</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36666 5469 20636</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000057', '<Customer ID="1000057" XCode="XX"><customer_firstname>Felecia</customer_firstname><customer_lastname>Hagler</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>57 New Portland Hill Blvd.</customer_street_address><customer_region>Nebraska</customer_region><customer_country></customer_country><customer_email>rej.fqy@trailed.biz</customer_email><customer_telephone>(401) 564-0563</customer_telephone><customer_zipcode>41375-7317</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36851 7458 25357</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000058', '<Customer ID="1000058" XCode="XX"><customer_firstname>Barnabas</customer_firstname><customer_lastname>Piedigrossi</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>63 Godsdon St.</customer_street_address><customer_region>South Carolina</customer_region><customer_country></customer_country><customer_email>uayjwulb@messier.com</customer_email><customer_telephone>(386) 848-9143</customer_telephone><customer_zipcode>03999-6848</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5417 5489 5358 1981</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000059', '<Customer ID="1000059" XCode="XX"><customer_firstname>Nader</customer_firstname><customer_lastname>Yerton</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>73 Kasba Lane</customer_street_address><customer_region>South Dakota</customer_region><customer_country></customer_country><customer_email>xmuh.llk@reacceded.com</customer_email><customer_telephone>(530) 101-4881</customer_telephone><customer_zipcode>75593-8003</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5367 3485 4877 9176</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000060', '<Customer ID="1000060" XCode="XX"><customer_firstname>Cherri</customer_firstname><customer_lastname>Closeburn</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Rosco Pigs plc</customer_company_name><customer_street_address>89 Cayford Orchard St.</customer_street_address><customer_region>Tennessee</customer_region><customer_country></customer_country><customer_email>aehubhaa@desirability.biz</customer_email><customer_telephone>(535) 833-2280</customer_telephone><customer_zipcode>52017-6055</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6077 1669 8381 9566</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000061', '<Customer ID="1000061" XCode="XX"><customer_firstname>Hall</customer_firstname><customer_lastname>Edemann</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>89 Cajole Side</customer_street_address><customer_region>New Hampshire</customer_region><customer_country></customer_country><customer_email>tspr.fjhc@crater.org</customer_email><customer_telephone>(637) 536-2032</customer_telephone><customer_zipcode>43177-6530</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6018 4846 3675 9324</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000062', '<Customer ID="1000062" XCode="XX"><customer_firstname>Millicent</customer_firstname><customer_lastname>Tyeryar</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>68 Stoney Weir St.</customer_street_address><customer_region>Idaho</customer_region><customer_country></customer_country><customer_email>tadiavu93@disestimation.com</customer_email><customer_telephone>(847) 414-6706</customer_telephone><customer_zipcode>55655-1622</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36336 0332 47555</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000063', '<Customer ID="1000063" XCode="XX"><customer_firstname>Jaylen</customer_firstname><customer_lastname>Vidals</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>48 Warmlands Ave.</customer_street_address><customer_region>Nevada</customer_region><customer_country></customer_country><customer_email>elywn_lxan@unsprung.com</customer_email><customer_telephone>(589) 225-7245</customer_telephone><customer_zipcode>12365-3601</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000064', '<Customer ID="1000064" XCode="XX"><customer_firstname>Stone</customer_firstname><customer_lastname>Dowson</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Associate Boyall Ltd.</customer_company_name><customer_street_address>148 Puulau Ave.</customer_street_address><customer_region>Connecticut</customer_region><customer_country></customer_country><customer_email>jqrne.tibo@deceitfully.com</customer_email><customer_telephone>(359) 356-5502</customer_telephone><customer_zipcode>47900-8977</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36771 6698 19566</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000065', '<Customer ID="1000065" XCode="XX"><customer_firstname>Maryam</customer_firstname><customer_lastname>Ramsdale</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>37 Punching Camp Side</customer_street_address><customer_region>Hawaii</customer_region><customer_country></customer_country><customer_email>mykgc.wfkm@phoneticize.com</customer_email><customer_telephone>(641) 445-9509</customer_telephone><customer_zipcode>69742-6426</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000066', '<Customer ID="1000066" XCode="XX"><customer_firstname>King</customer_firstname><customer_lastname>Sessa</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>77 Green Pine Rd.</customer_street_address><customer_region>New Jersey</customer_region><customer_country></customer_country><customer_email>fcgi_xvv@moviedom.com</customer_email><customer_telephone>(508) 568-1858</customer_telephone><customer_zipcode>25351-9136</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000067', '<Customer ID="1000067" XCode="XX"><customer_firstname>Letitia</customer_firstname><customer_lastname>Cliatt</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>98 Pflughaupt Rd.</customer_street_address><customer_region>Oklahoma</customer_region><customer_country></customer_country><customer_email>rdlj@watchwords.com</customer_email><customer_telephone>(429) 907-4550</customer_telephone><customer_zipcode>97529-9241</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000068', '<Customer ID="1000068" XCode="XX"><customer_firstname>Nathanial</customer_firstname><customer_lastname>Setser</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Maughan Soap Ltd.</customer_company_name><customer_street_address>540 Mercada Grove</customer_street_address><customer_region>Massachusetts</customer_region><customer_country></customer_country><customer_email>sljvzpkfwz@superber.com</customer_email><customer_telephone>(838) 399-5970</customer_telephone><customer_zipcode>45818-3396</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000069', '<Customer ID="1000069" XCode="XX"><customer_firstname>Stirling</customer_firstname><customer_lastname>Giessler</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>10 Schaak Avenue</customer_street_address><customer_region>Missouri</customer_region><customer_country></customer_country><customer_email>dmou.rztf@mankind.com</customer_email><customer_telephone>(118) 969-2785</customer_telephone><customer_zipcode>19826-8936</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000070', '<Customer ID="1000070" XCode="XX"><customer_firstname>Perdita</customer_firstname><customer_lastname>Bressette</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>94 Leichester Row</customer_street_address><customer_region>Rhode Island</customer_region><customer_country></customer_country><customer_email>tjnr30@semantically.com</customer_email><customer_telephone>(264) 159-7841</customer_telephone><customer_zipcode>18008-1337</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36751 7889 62095</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000071', '<Customer ID="1000071" XCode="XX"><customer_firstname>Bassam</customer_firstname><customer_lastname>Miggo</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>43 Mendleson Ave.</customer_street_address><customer_region>Mississippi</customer_region><customer_country></customer_country><customer_email>dlcvto70@sultanas.com</customer_email><customer_telephone>(846) 452-4518</customer_telephone><customer_zipcode>98767-4785</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6017 5489 5358 1981</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000072', '<Customer ID="1000072" XCode="XX"><customer_firstname>Lottie</customer_firstname><customer_lastname>Gibble</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Bagpipe Milner Co.</customer_company_name><customer_street_address>98 Shiras Rd.</customer_street_address><customer_region>Illinois</customer_region><customer_country></customer_country><customer_email>bdsbs_lzgi@emigrates.com</customer_email><customer_telephone>(494) 933-3095</customer_telephone><customer_zipcode>63865-9541</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000073', '<Customer ID="1000073" XCode="XX"><customer_firstname>Percival</customer_firstname><customer_lastname>Brazell</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>22 Chaft Chason Rd.</customer_street_address><customer_region>Georgia</customer_region><customer_country></customer_country><customer_email>umq@dieses.com</customer_email><customer_telephone>(589) 759-8287</customer_telephone><customer_zipcode>53491-7307</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36601 4651 63210</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000074', '<Customer ID="1000074" XCode="XX"><customer_firstname>Ramakrishna</customer_firstname><customer_lastname>Dilello</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>16 Frontenay Rd.</customer_street_address><customer_region>North Dakota</customer_region><customer_country></customer_country><customer_email>xuy.yqc@litigable.com</customer_email><customer_telephone>(802) 823-9733</customer_telephone><customer_zipcode>21428-3512</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36663 9861 71225</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000075', '<Customer ID="1000075" XCode="XX"><customer_firstname>Kerry</customer_firstname><customer_lastname>Spakes</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>21 Druet St.</customer_street_address><customer_region>California</customer_region><customer_country></customer_country><customer_email>tzn.usg@harlots.com</customer_email><customer_telephone>(420) 120-4812</customer_telephone><customer_zipcode>86808-6853</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5285 1745 8082 5357</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000076', '<Customer ID="1000076" XCode="XX"><customer_firstname>Palmiro</customer_firstname><customer_lastname>Clemo</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Algorithms Aaken Ltd.</customer_company_name><customer_street_address>894 Castlebury St.</customer_street_address><customer_region>District of Columbia</customer_region><customer_country></customer_country><customer_email>xkvyp@demotic.com</customer_email><customer_telephone>(538) 580-3679</customer_telephone><customer_zipcode>50993-5634</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4570 8424 4733 8486</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000077', '<Customer ID="1000077" XCode="XX"><customer_firstname>Duha</customer_firstname><customer_lastname>Hiraki</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>78 Serendia Ave.</customer_street_address><customer_region>Vermont</customer_region><customer_country></customer_country><customer_email>igkuazuy@spearhead.com</customer_email><customer_telephone>(250) 575-0794</customer_telephone><customer_zipcode>24304-4625</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6067 3485 4877 9176</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000078', '<Customer ID="1000078" XCode="XX"><customer_firstname>Hayder</customer_firstname><customer_lastname>Raschig</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>52A Canyon Branch Rd.</customer_street_address><customer_region>Indiana</customer_region><customer_country></customer_country><customer_email>lbgc.dqp@dagoes.org</customer_email><customer_telephone>(463) 194-0464</customer_telephone><customer_zipcode>46456-6146</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000079', '<Customer ID="1000079" XCode="XX"><customer_firstname>Vergil</customer_firstname><customer_lastname>Ledesma</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>38 Lonesome Pocket St.</customer_street_address><customer_region>Wisconsin</customer_region><customer_country></customer_country><customer_email>emhef.axxc@shrimpier.com</customer_email><customer_telephone>(649) 554-3512</customer_telephone><customer_zipcode>96560-8689</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4685 1745 8082 5357</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000080', '<Customer ID="1000080" XCode="XX"><customer_firstname>Nadja</customer_firstname><customer_lastname>Asal</customer_lastname><customer_gender>F</customer_gender><customer_company_name>Sheffield Artisans Ltd.</customer_company_name><customer_street_address>27 Baren St.</customer_street_address><customer_region>Maine</customer_region><customer_country></customer_country><customer_email>ttnzs80@ballcarrier.com</customer_email><customer_telephone>(485) 976-8366</customer_telephone><customer_zipcode>12660-1102</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36244 2513 75422</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000081', '<Customer ID="1000081" XCode="XX"><customer_firstname>Alger</customer_firstname><customer_lastname>Kenebrew</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>758 Burjer Ave.</customer_street_address><customer_region>Minnesota</customer_region><customer_country></customer_country><customer_email>ntlid.ptkb@contendere.org</customer_email><customer_telephone>(271) 516-6636</customer_telephone><customer_zipcode>40273-8121</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000082', '<Customer ID="1000082" XCode="XX"><customer_firstname>Petrona</customer_firstname><customer_lastname>Merlo</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>23 Canton Heights St.</customer_street_address><customer_region>Louisiana</customer_region><customer_country></customer_country><customer_email>jwpamqxc@czarinas.com</customer_email><customer_telephone>(967) 814-8290</customer_telephone><customer_zipcode>46351-9368</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5233 6033 5624 7555</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000083', '<Customer ID="1000083" XCode="XX"><customer_firstname>Loyd</customer_firstname><customer_lastname>Morillo</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>97 Haar St.</customer_street_address><customer_region>Alabama</customer_region><customer_country></customer_country><customer_email>qxvvagn20@noncombining.edu</customer_email><customer_telephone>(337) 415-9157</customer_telephone><customer_zipcode>75193-9800</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6085 1745 8082 5357</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000084', '<Customer ID="1000084" XCode="XX"><customer_firstname>Amador</customer_firstname><customer_lastname>Cordier</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Malton Woodturners Ltd.</customer_company_name><customer_street_address>441 Azore St.</customer_street_address><customer_region>Utah</customer_region><customer_country></customer_country><customer_email>hqbzg66@arrives.com</customer_email><customer_telephone>(237) 996-9467</customer_telephone><customer_zipcode>09327-2322</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36154 2802 53703</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000085', '<Customer ID="1000085" XCode="XX"><customer_firstname>Jaqueline</customer_firstname><customer_lastname>Eakle</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>23 Desert Trailways Ave.</customer_street_address><customer_region>Washington</customer_region><customer_country></customer_country><customer_email>fcf_pd@gerontologists.com</customer_email><customer_telephone>(304) 456-0434</customer_telephone><customer_zipcode>81910-6128</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5177 1669 8381 9566</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000086', '<Customer ID="1000086" XCode="XX"><customer_firstname>Drake</customer_firstname><customer_lastname>Denery</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>394 High Tech Ave.</customer_street_address><customer_region>North Carolina</customer_region><customer_country></customer_country><customer_email>hyibww@peeler.com</customer_email><customer_telephone>(760) 385-5376</customer_telephone><customer_zipcode>53626-1576</customer_zipcode><credit_card_type_id>2</credit_card_type_id><customer_credit_card_number></customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000087', '<Customer ID="1000087" XCode="XX"><customer_firstname>Estela</customer_firstname><customer_lastname>Waddel</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>28 Olde Atlanta Ave.</customer_street_address><customer_region>Montana</customer_region><customer_country></customer_country><customer_email>jlxq88@unscrutinizingly.com</customer_email><customer_telephone>(783) 354-9285</customer_telephone><customer_zipcode>75341-1113</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5424 4251 1237 5422</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000088', '<Customer ID="1000088" XCode="XX"><customer_firstname>Edsel</customer_firstname><customer_lastname>Choudhury</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Kensington Shears Ltd.</customer_company_name><customer_street_address>417 Harnum Ave.</customer_street_address><customer_region>New York</customer_region><customer_country></customer_country><customer_email>mhwyd46@oilcup.com</customer_email><customer_telephone>(807) 913-6943</customer_telephone><customer_zipcode>71887-4963</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5375 1788 5296 2095</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000089', '<Customer ID="1000089" XCode="XX"><customer_firstname>Herschel</customer_firstname><customer_lastname>Messmer</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>6 Ostrow Ave.</customer_street_address><customer_region>New Mexico</customer_region><customer_country></customer_country><customer_email>tehix51@weekending.com</customer_email><customer_telephone>(435) 335-8968</customer_telephone><customer_zipcode>12611-8007</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36858 8029 34961</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000090', '<Customer ID="1000090" XCode="XX"><customer_firstname>Gowri</customer_firstname><customer_lastname>Iozzi</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>44 Canoe Pond St.</customer_street_address><customer_region>Maryland</customer_region><customer_country></customer_country><customer_email>rbbcltxsr@cuttingly.com</customer_email><customer_telephone>(705) 604-5293</customer_telephone><customer_zipcode>45980-7633</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5585 8802 1893 4961</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000091', '<Customer ID="1000091" XCode="XX"><customer_firstname>Telesphore</customer_firstname><customer_lastname>Vientos</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>116 Lufberry Quay</customer_street_address><customer_region>Kentucky</customer_region><customer_country></customer_country><customer_email>tyrh_ank@smolders.biz</customer_email><customer_telephone>(810) 212-4749</customer_telephone><customer_zipcode>89811-1298</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5460 1465 6616 3210</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000092', '<Customer ID="1000092" XCode="XX"><customer_firstname>Rhiannon</customer_firstname><customer_lastname>Riskin</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Toys Upton Inc.</customer_company_name><customer_street_address>342 Chairty St.</customer_street_address><customer_region>West Virginia</customer_region><customer_country></customer_country><customer_email>ndte_ufg@differers.com</customer_email><customer_telephone>(735) 983-3665</customer_telephone><customer_zipcode>53631-1954</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4933 7218 0259 9221</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000093', '<Customer ID="1000093" XCode="XX"><customer_firstname>Donal</customer_firstname><customer_lastname>Stumpp</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>585 Singleton School Rd.</customer_street_address><customer_region>Arizona</customer_region><customer_country></customer_country><customer_email>earrqad71@zippers.com</customer_email><customer_telephone>(584) 598-7627</customer_telephone><customer_zipcode>05992-4084</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4918 4846 3675 9324</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000094', '<Customer ID="1000094" XCode="XX"><customer_firstname>Fulk</customer_firstname><customer_lastname>Corban</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>998 Left Terrace</customer_street_address><customer_region>Colorado</customer_region><customer_country></customer_country><customer_email>mmq.az@sedulously.edu</customer_email><customer_telephone>(135) 988-4377</customer_telephone><customer_zipcode>83054-5763</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5434 3696 5891 1401</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000095', '<Customer ID="1000095" XCode="XX"><customer_firstname>Emelia</customer_firstname><customer_lastname>Youtsey</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>7 Left Frontage Parade</customer_street_address><customer_region>Alaska</customer_region><customer_country></customer_country><customer_email>dhmmgxz98@seemers.com</customer_email><customer_telephone>(737) 658-4060</customer_telephone><customer_zipcode>96212-0320</customer_zipcode><credit_card_type_id>1</credit_card_type_id><customer_credit_card_number>6075 1788 5296 2095</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000096', '<Customer ID="1000096" XCode="XX"><customer_firstname>Judge</customer_firstname><customer_lastname>Gade</customer_lastname><customer_gender>M</customer_gender><customer_company_name>Workwear Tollemache Ltd.</customer_company_name><customer_street_address>76 Farias Ave.</customer_street_address><customer_region>Michigan</customer_region><customer_country></customer_country><customer_email>kwwekma28@internuncial.com</customer_email><customer_telephone>(834) 992-8441</customer_telephone><customer_zipcode>99854-4519</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4317 5489 5358 1981</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000097', '<Customer ID="1000097" XCode="XX"><customer_firstname>Faye</customer_firstname><customer_lastname>Grond</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>84 Vesthaven Rd.</customer_street_address><customer_region>Oregon</customer_region><customer_country></customer_country><customer_email>gvl@gitanos.edu</customer_email><customer_telephone>(651) 298-8813</customer_telephone><customer_zipcode>82292-6999</customer_zipcode><credit_card_type_id>5</credit_card_type_id><customer_credit_card_number>4268 6680 4850 2477</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000098', '<Customer ID="1000098" XCode="XX"><customer_firstname>Nerio</customer_firstname><customer_lastname>Kidd</customer_lastname><customer_gender>M</customer_gender><customer_company_name></customer_company_name><customer_street_address>61 Stehley St.</customer_street_address><customer_region>Ohio</customer_region><customer_country></customer_country><customer_email>bbod.ezzj@dogear.com</customer_email><customer_telephone>(706) 551-7326</customer_telephone><customer_zipcode>57954-2368</customer_zipcode><credit_card_type_id>4</credit_card_type_id><customer_credit_card_number>5266 3986 5417 1224</customer_credit_card_number></Customer>');
insert into DM_CUSTOMER_ASXML_IDAttr (customer_id, customer_data) values ('1000099', '<Customer ID="1000099" XCode="XX"><customer_firstname>Curtiss</customer_firstname><customer_lastname>Raynes</customer_lastname><customer_gender>F</customer_gender><customer_company_name></customer_company_name><customer_street_address>144 Noto Ct.</customer_street_address><customer_region>Arkansas</customer_region><customer_country></customer_country><customer_email>yrckl_ozjy@uglified.com</customer_email><customer_telephone>(538) 815-5372</customer_telephone><customer_zipcode>40541-5927</customer_zipcode><credit_card_type_id>3</credit_card_type_id><customer_credit_card_number>36017 3640 80200</customer_credit_card_number></Customer>');

-- ### DM_CUSTOMER_NOTES ###

insert into DM_CUSTOMER_NOTES values (1,'1000007','','',convert(datetime,'20000320',103),'Cathie contact number is (213) 555-8081');
insert into DM_CUSTOMER_NOTES values (2,'1000089','','',convert(datetime,'19990311',103),'Herschel also purchased as Melanie Jones');
insert into DM_CUSTOMER_NOTES values (3,'1000001','','',convert(datetime,'20010503',103),'Called in on 555-1234.');
insert into DM_CUSTOMER_NOTES values (4,'1000002','','',convert(datetime,'20010111',103),'Jathbiyya returned goods a number of times - always query');
insert into DM_CUSTOMER_NOTES values (5,'1000020','','',convert(datetime,'20010412',103),'Bad Credit Rating. Recently cleaned up');
insert into DM_CUSTOMER_NOTES values (6,'1000066','','',convert(datetime,'20000311',103),'Indicated her friend John Smith would sign.');
insert into DM_CUSTOMER_NOTES values (7,'1000005','','',convert(datetime,'20011002',103),'Shanika is Never available for courier - blames us');
insert into DM_CUSTOMER_NOTES values (8,'1000042','','',convert(datetime,'20001123',103),'Extremely rude. Feel free to decline sale if need be.');
insert into DM_CUSTOMER_NOTES values (9,'1000098','','',convert(datetime,'20010526',103),'Courier always charges extra shipping to this address.');
insert into DM_CUSTOMER_NOTES values (10,'1000073','','',convert(datetime,'19991014',103),'Also known as Sam Williams');
insert into DM_CUSTOMER_NOTES values (11,'1000051','','',convert(datetime,'20011225',103),'Do not ship perishables to this address very slow courier');
insert into DM_CUSTOMER_NOTES values (12,'1000017','','',convert(datetime,'20010406',103),'This customer is actually a PO box - take care.');
insert into DM_CUSTOMER_NOTES values (13,'1000031','','',convert(datetime,'20011226',103),'Call (654) 555-0734 prior to delivery');
insert into DM_CUSTOMER_NOTES values (14,'1000099','','',convert(datetime,'20010326',103),'Decline all further sales.');
insert into DM_CUSTOMER_NOTES values (15,'1000091','','',convert(datetime,'20000329',103),'Do not ship untill payment received.');
insert into DM_CUSTOMER_NOTES values (16,'1000043','','',convert(datetime,'20000727',103),'Has a phobia about dogs - never mention them.');
insert into DM_CUSTOMER_NOTES values (17,'1000011','','',convert(datetime,'20000114',103),'call on (321) 555-2234');
insert into DM_CUSTOMER_NOTES values (18,'1000078','','',convert(datetime,'19990704',103),'Dr. Jim Williams is contact at 555-1234');
insert into DM_CUSTOMER_NOTES values (19,'1000058','','',convert(datetime,'20000209',103),'Courier always charges extra shipping to this address');
insert into DM_CUSTOMER_NOTES values (20,'1000087','','',convert(datetime,'20001130',103),'Decline all further sales.');
insert into DM_CUSTOMER_NOTES values (21,'1000012','','',convert(datetime,'20011204',103),'Always asks for a discount. Cannot do this everytime.');
insert into DM_CUSTOMER_NOTES values (22,'1000012','','',convert(datetime,'19991113',103),'Do not ship perishables to this address. Courier invariably slow.');
insert into DM_CUSTOMER_NOTES values (23,'1000076','','',convert(datetime,'20010418',103),'Do not ship untill payment received.');
insert into DM_CUSTOMER_NOTES values (24,'1000036','','',convert(datetime,'20010413',103),'Decline all further sales.');
insert into DM_CUSTOMER_NOTES values (25,'1000027','','',convert(datetime,'20020126',103),'Courier always charges extra shipping to this address');

-- ### DM_INVENTORY_ITEM ###

insert into DM_INVENTORY_ITEM values ('1','Cocktail Forks');
insert into DM_INVENTORY_ITEM values ('2','Cement Balloons');
insert into DM_INVENTORY_ITEM values ('3','HB Pencils');
insert into DM_INVENTORY_ITEM values ('4','Jewelled Tweezers');
insert into DM_INVENTORY_ITEM values ('5','Precision Hammers');
insert into DM_INVENTORY_ITEM values ('6','Napkin Rings');
insert into DM_INVENTORY_ITEM values ('7','Plastic Cups');
insert into DM_INVENTORY_ITEM values ('8','Fork and Knife Set');
insert into DM_INVENTORY_ITEM values ('9','Birthday Card Type1');
insert into DM_INVENTORY_ITEM values ('10','Birthday Cart Type2');


-- ### DM_INVOICE ###

insert into DM_INVOICE values (10000,convert(datetime,'20010908'),'1000096');
insert into DM_INVOICE values (10001,convert(datetime,'20010410'),'1000080');
insert into DM_INVOICE values (10002,convert(datetime,'19990715'),'1000074');
insert into DM_INVOICE values (10003,convert(datetime,'20001209'),'1000009');
insert into DM_INVOICE values (10004,convert(datetime,'19991214'),'1000069');
insert into DM_INVOICE values (10005,convert(datetime,'19990312'),'1000036');
insert into DM_INVOICE values (10006,convert(datetime,'19990331'),'1000029');
insert into DM_INVOICE values (10007,convert(datetime,'20020119'),'1000055');
insert into DM_INVOICE values (10008,convert(datetime,'19990227'),'1000086');
insert into DM_INVOICE values (10009,convert(datetime,'20010928'),'1000064');
insert into DM_INVOICE values (10010,convert(datetime,'19990515'),'1000054');
insert into DM_INVOICE values (10011,convert(datetime,'19990617'),'1000069');
insert into DM_INVOICE values (10012,convert(datetime,'19990313'),'1000058');
insert into DM_INVOICE values (10013,convert(datetime,'19991217'),'1000013');
insert into DM_INVOICE values (10014,convert(datetime,'20010721'),'1000100');
insert into DM_INVOICE values (10015,convert(datetime,'19991015'),'1000019');
insert into DM_INVOICE values (10016,convert(datetime,'20010714'),'1000078');
insert into DM_INVOICE values (10017,convert(datetime,'20011004'),'1000001');
insert into DM_INVOICE values (10018,convert(datetime,'20001222'),'1000008');
insert into DM_INVOICE values (10019,convert(datetime,'20011014'),'1000045');
insert into DM_INVOICE values (10020,convert(datetime,'19990517'),'1000095');
insert into DM_INVOICE values (10021,convert(datetime,'19990406'),'1000013');
insert into DM_INVOICE values (10022,convert(datetime,'20010721'),'1000097');
insert into DM_INVOICE values (10023,convert(datetime,'20001111'),'1000061');
insert into DM_INVOICE values (10024,convert(datetime,'20001214'),'1000028');
insert into DM_INVOICE values (10025,convert(datetime,'20010722'),'1000097');
insert into DM_INVOICE values (10026,convert(datetime,'20010110'),'1000028');
insert into DM_INVOICE values (10027,convert(datetime,'20000525'),'1000022');
insert into DM_INVOICE values (10028,convert(datetime,'20010401'),'1000036');
insert into DM_INVOICE values (10029,convert(datetime,'20000711'),'1000054');
insert into DM_INVOICE values (10030,convert(datetime,'20010827'),'1000098');
insert into DM_INVOICE values (10031,convert(datetime,'20000430'),'1000081');
insert into DM_INVOICE values (10032,convert(datetime,'20010929'),'1000100');
insert into DM_INVOICE values (10033,convert(datetime,'20001118'),'1000097');
insert into DM_INVOICE values (10034,convert(datetime,'20010621'),'1000047');
insert into DM_INVOICE values (10035,convert(datetime,'20010326'),'1000062');
insert into DM_INVOICE values (10036,convert(datetime,'20010705'),'1000018');
insert into DM_INVOICE values (10037,convert(datetime,'20010629'),'1000051');
insert into DM_INVOICE values (10038,convert(datetime,'20000618'),'1000090');
insert into DM_INVOICE values (10039,convert(datetime,'20010401'),'1000057');
insert into DM_INVOICE values (10040,convert(datetime,'20010328'),'1000083');
insert into DM_INVOICE values (10041,convert(datetime,'20001113'),'1000077');
insert into DM_INVOICE values (10042,convert(datetime,'19991106'),'1000021');
insert into DM_INVOICE values (10043,convert(datetime,'20000104'),'1000069');
insert into DM_INVOICE values (10044,convert(datetime,'20000328'),'1000077');
insert into DM_INVOICE values (10045,convert(datetime,'19991101'),'1000095');
insert into DM_INVOICE values (10046,convert(datetime,'19991101'),'1000051');
insert into DM_INVOICE values (10047,convert(datetime,'20000317'),'1000068');
insert into DM_INVOICE values (10048,convert(datetime,'20000326'),'1000081');
insert into DM_INVOICE values (10049,convert(datetime,'20001129'),'1000020');
insert into DM_INVOICE values (10050,convert(datetime,'19990211'),'1000047');
insert into DM_INVOICE values (10051,convert(datetime,'19990711'),'1000004');
insert into DM_INVOICE values (10052,convert(datetime,'20010805'),'1000012');
insert into DM_INVOICE values (10053,convert(datetime,'19990723'),'1000016');
insert into DM_INVOICE values (10054,convert(datetime,'19990428'),'1000015');
insert into DM_INVOICE values (10055,convert(datetime,'20001104'),'1000056');
insert into DM_INVOICE values (10056,convert(datetime,'19990818'),'1000060');
insert into DM_INVOICE values (10057,convert(datetime,'19990429'),'1000000');
insert into DM_INVOICE values (10058,convert(datetime,'20001230'),'1000063');
insert into DM_INVOICE values (10059,convert(datetime,'20010915'),'1000073');
insert into DM_INVOICE values (10060,convert(datetime,'20001014'),'1000061');
insert into DM_INVOICE values (10061,convert(datetime,'19990820'),'1000096');
insert into DM_INVOICE values (10062,convert(datetime,'20010810'),'1000063');
insert into DM_INVOICE values (10063,convert(datetime,'20000917'),'1000044');
insert into DM_INVOICE values (10064,convert(datetime,'20010523'),'1000058');
insert into DM_INVOICE values (10065,convert(datetime,'20010214'),'1000066');
insert into DM_INVOICE values (10066,convert(datetime,'19991231'),'1000061');
insert into DM_INVOICE values (10067,convert(datetime,'19990412'),'1000097');
insert into DM_INVOICE values (10068,convert(datetime,'20000326'),'1000024');
insert into DM_INVOICE values (10069,convert(datetime,'20010821'),'1000000');
insert into DM_INVOICE values (10070,convert(datetime,'20011231'),'1000085');
insert into DM_INVOICE values (10071,convert(datetime,'20000205'),'1000055');
insert into DM_INVOICE values (10072,convert(datetime,'20001206'),'1000032');
insert into DM_INVOICE values (10073,convert(datetime,'20000718'),'1000024');
insert into DM_INVOICE values (10074,convert(datetime,'20000901'),'1000019');
insert into DM_INVOICE values (10075,convert(datetime,'20001007'),'1000088');
insert into DM_INVOICE values (10076,convert(datetime,'20000917'),'1000047');
insert into DM_INVOICE values (10077,convert(datetime,'19990323'),'1000003');
insert into DM_INVOICE values (10078,convert(datetime,'20001115'),'1000025');
insert into DM_INVOICE values (10079,convert(datetime,'20000908'),'1000037');
insert into DM_INVOICE values (10080,convert(datetime,'19990220'),'1000036');
insert into DM_INVOICE values (10081,convert(datetime,'20011009'),'1000066');
insert into DM_INVOICE values (10082,convert(datetime,'19990925'),'1000008');
insert into DM_INVOICE values (10083,convert(datetime,'20000915'),'1000016');
insert into DM_INVOICE values (10084,convert(datetime,'19990304'),'1000072');
insert into DM_INVOICE values (10085,convert(datetime,'19990223'),'1000064');
insert into DM_INVOICE values (10086,convert(datetime,'20000116'),'1000079');
insert into DM_INVOICE values (10087,convert(datetime,'19990703'),'1000013');
insert into DM_INVOICE values (10088,convert(datetime,'19991118'),'1000078');
insert into DM_INVOICE values (10089,convert(datetime,'20010108'),'1000037');
insert into DM_INVOICE values (10090,convert(datetime,'20000307'),'1000076');
insert into DM_INVOICE values (10091,convert(datetime,'20010806'),'1000038');
insert into DM_INVOICE values (10092,convert(datetime,'19990602'),'1000087');
insert into DM_INVOICE values (10093,convert(datetime,'19991022'),'1000066');
insert into DM_INVOICE values (10094,convert(datetime,'20010714'),'1000089');
insert into DM_INVOICE values (10095,convert(datetime,'20001021'),'1000008');
insert into DM_INVOICE values (10096,convert(datetime,'19990727'),'1000012');
insert into DM_INVOICE values (10097,convert(datetime,'20010111'),'1000011');
insert into DM_INVOICE values (10098,convert(datetime,'20001128'),'1000048');
insert into DM_INVOICE values (10099,convert(datetime,'20011208'),'1000042');
insert into DM_INVOICE values (10100,convert(datetime,'20010730'),'1000044');
insert into DM_INVOICE values (10101,convert(datetime,'20020107'),'1000099');
insert into DM_INVOICE values (10102,convert(datetime,'19991202'),'1000088');
insert into DM_INVOICE values (10103,convert(datetime,'20000212'),'1000004');
insert into DM_INVOICE values (10104,convert(datetime,'20000429'),'1000060');
insert into DM_INVOICE values (10105,convert(datetime,'20010418'),'1000079');
insert into DM_INVOICE values (10106,convert(datetime,'20010614'),'1000088');
insert into DM_INVOICE values (10107,convert(datetime,'20010507'),'1000054');
insert into DM_INVOICE values (10108,convert(datetime,'20001023'),'1000018');
insert into DM_INVOICE values (10109,convert(datetime,'20010401'),'1000096');
insert into DM_INVOICE values (10110,convert(datetime,'19991023'),'1000050');
insert into DM_INVOICE values (10111,convert(datetime,'20000504'),'1000022');
insert into DM_INVOICE values (10112,convert(datetime,'20000323'),'1000039');
insert into DM_INVOICE values (10113,convert(datetime,'19990521'),'1000035');
insert into DM_INVOICE values (10114,convert(datetime,'20010222'),'1000017');
insert into DM_INVOICE values (10115,convert(datetime,'19990608'),'1000037');
insert into DM_INVOICE values (10116,convert(datetime,'19990311'),'1000040');
insert into DM_INVOICE values (10117,convert(datetime,'19990219'),'1000024');
insert into DM_INVOICE values (10118,convert(datetime,'19991118'),'1000028');
insert into DM_INVOICE values (10119,convert(datetime,'20001026'),'1000010');
insert into DM_INVOICE values (10120,convert(datetime,'20011123'),'1000025');
insert into DM_INVOICE values (10121,convert(datetime,'19990212'),'1000022');
insert into DM_INVOICE values (10122,convert(datetime,'20010226'),'1000041');
insert into DM_INVOICE values (10123,convert(datetime,'20010201'),'1000033');
insert into DM_INVOICE values (10124,convert(datetime,'19991205'),'1000090');
insert into DM_INVOICE values (10125,convert(datetime,'20010405'),'1000022');
insert into DM_INVOICE values (10126,convert(datetime,'20001214'),'1000007');
insert into DM_INVOICE values (10127,convert(datetime,'20010919'),'1000057');
insert into DM_INVOICE values (10128,convert(datetime,'20010226'),'1000049');
insert into DM_INVOICE values (10129,convert(datetime,'20010914'),'1000075');
insert into DM_INVOICE values (10130,convert(datetime,'20010204'),'1000032');
insert into DM_INVOICE values (10131,convert(datetime,'19990826'),'1000038');
insert into DM_INVOICE values (10132,convert(datetime,'20010713'),'1000050');
insert into DM_INVOICE values (10133,convert(datetime,'20000715'),'1000022');
insert into DM_INVOICE values (10134,convert(datetime,'20000604'),'1000039');
insert into DM_INVOICE values (10135,convert(datetime,'19990827'),'1000039');
insert into DM_INVOICE values (10136,convert(datetime,'20010616'),'1000000');
insert into DM_INVOICE values (10137,convert(datetime,'20020109'),'1000017');
insert into DM_INVOICE values (10138,convert(datetime,'19990907'),'1000073');
insert into DM_INVOICE values (10139,convert(datetime,'20000327'),'1000011');
insert into DM_INVOICE values (10140,convert(datetime,'20001012'),'1000081');
insert into DM_INVOICE values (10141,convert(datetime,'20011006'),'1000046');
insert into DM_INVOICE values (10142,convert(datetime,'19991210'),'1000006');
insert into DM_INVOICE values (10143,convert(datetime,'20020121'),'1000083');
insert into DM_INVOICE values (10144,convert(datetime,'20001205'),'1000065');
insert into DM_INVOICE values (10145,convert(datetime,'20000813'),'1000002');
insert into DM_INVOICE values (10146,convert(datetime,'20010323'),'1000056');
insert into DM_INVOICE values (10147,convert(datetime,'20011008'),'1000001');
insert into DM_INVOICE values (10148,convert(datetime,'20000216'),'1000095');
insert into DM_INVOICE values (10149,convert(datetime,'20010222'),'1000062');


-- ### DM_INVOICE_LINE ###

insert into DM_INVOICE_LINE values ('10005','7',2,77);
insert into DM_INVOICE_LINE values ('10036','2',2,33);
insert into DM_INVOICE_LINE values ('10129','4',4,14);
insert into DM_INVOICE_LINE values ('10085','10',5,71);
insert into DM_INVOICE_LINE values ('10013','1',1,30);
insert into DM_INVOICE_LINE values ('10045','7',2,42);
insert into DM_INVOICE_LINE values ('10037','7',2,40);
insert into DM_INVOICE_LINE values ('10023','4',4,16);
insert into DM_INVOICE_LINE values ('10116','6',1,65);
insert into DM_INVOICE_LINE values ('10070','4',4,90);
insert into DM_INVOICE_LINE values ('10069','3',3,48);
insert into DM_INVOICE_LINE values ('10140','7',2,88);
insert into DM_INVOICE_LINE values ('10061','2',2,82);
insert into DM_INVOICE_LINE values ('10082','10',5,89);
insert into DM_INVOICE_LINE values ('10136','10',5,83);
insert into DM_INVOICE_LINE values ('10028','6',1,91);
insert into DM_INVOICE_LINE values ('10004','5',5,33);
insert into DM_INVOICE_LINE values ('10029','7',2,37);
insert into DM_INVOICE_LINE values ('10122','9',4,11);
insert into DM_INVOICE_LINE values ('10063','5',5,69);
insert into DM_INVOICE_LINE values ('10115','6',1,33);
insert into DM_INVOICE_LINE values ('10128','3',3,60);
insert into DM_INVOICE_LINE values ('10107','8',3,96);
insert into DM_INVOICE_LINE values ('10066','9',4,84);
insert into DM_INVOICE_LINE values ('10011','3',3,14);
insert into DM_INVOICE_LINE values ('10113','4',4,57);
insert into DM_INVOICE_LINE values ('10090','8',3,22);
insert into DM_INVOICE_LINE values ('10108','1',1,86);
insert into DM_INVOICE_LINE values ('10049','10',5,10);
insert into DM_INVOICE_LINE values ('10120','7',2,98);
insert into DM_INVOICE_LINE values ('10047','6',1,71);
insert into DM_INVOICE_LINE values ('10006','1',1,16);
insert into DM_INVOICE_LINE values ('10050','5',5,83);
insert into DM_INVOICE_LINE values ('10047','8',3,42);
insert into DM_INVOICE_LINE values ('10138','10',5,17);
insert into DM_INVOICE_LINE values ('10039','2',2,85);
insert into DM_INVOICE_LINE values ('10149','8',3,17);
insert into DM_INVOICE_LINE values ('10048','3',3,94);
insert into DM_INVOICE_LINE values ('10085','2',2,40);
insert into DM_INVOICE_LINE values ('10067','10',5,27);
insert into DM_INVOICE_LINE values ('10142','7',2,37);
insert into DM_INVOICE_LINE values ('10005','9',4,11);
insert into DM_INVOICE_LINE values ('10085','6',1,36);
insert into DM_INVOICE_LINE values ('10124','1',1,73);
insert into DM_INVOICE_LINE values ('10057','5',5,56);
insert into DM_INVOICE_LINE values ('10067','6',1,26);
insert into DM_INVOICE_LINE values ('10002','7',2,25);
insert into DM_INVOICE_LINE values ('10145','2',2,70);
insert into DM_INVOICE_LINE values ('10131','2',2,35);
insert into DM_INVOICE_LINE values ('10149','3',3,68);
insert into DM_INVOICE_LINE values ('10138','1',1,52);
insert into DM_INVOICE_LINE values ('10038','10',5,3);
insert into DM_INVOICE_LINE values ('10118','4',4,9);
insert into DM_INVOICE_LINE values ('10056','6',1,30);
insert into DM_INVOICE_LINE values ('10126','8',3,66);
insert into DM_INVOICE_LINE values ('10143','10',5,63);
insert into DM_INVOICE_LINE values ('10086','10',5,36);
insert into DM_INVOICE_LINE values ('10048','2',3,91);
insert into DM_INVOICE_LINE values ('10005','2',4,85);
insert into DM_INVOICE_LINE values ('10074','2',2,5);
insert into DM_INVOICE_LINE values ('10066','6',1,60);
insert into DM_INVOICE_LINE values ('10106','9',4,64);
insert into DM_INVOICE_LINE values ('10077','9',4,67);
insert into DM_INVOICE_LINE values ('10041','9',4,19);
insert into DM_INVOICE_LINE values ('10055','3',3,12);
insert into DM_INVOICE_LINE values ('10089','7',2,58);
insert into DM_INVOICE_LINE values ('10101','1',1,91);
insert into DM_INVOICE_LINE values ('10118','7',2,71);
insert into DM_INVOICE_LINE values ('10117','5',5,38);
insert into DM_INVOICE_LINE values ('10041','6',1,90);
insert into DM_INVOICE_LINE values ('10082','3',3,94);
insert into DM_INVOICE_LINE values ('10131','9',4,52);
insert into DM_INVOICE_LINE values ('10122','7',4,99);
insert into DM_INVOICE_LINE values ('10046','5',5,3);
insert into DM_INVOICE_LINE values ('10096','2',2,10);
insert into DM_INVOICE_LINE values ('10119','8',3,5);
insert into DM_INVOICE_LINE values ('10090','7',2,29);
insert into DM_INVOICE_LINE values ('10049','4',4,17);
insert into DM_INVOICE_LINE values ('10087','4',4,66);
insert into DM_INVOICE_LINE values ('10000','4',4,49);
insert into DM_INVOICE_LINE values ('10124','2',1,20);
insert into DM_INVOICE_LINE values ('10121','9',4,59);
insert into DM_INVOICE_LINE values ('10032','5',5,35);
insert into DM_INVOICE_LINE values ('10005','5',5,52);
insert into DM_INVOICE_LINE values ('10083','7',2,36);
insert into DM_INVOICE_LINE values ('10106','8',3,10);
insert into DM_INVOICE_LINE values ('10072','5',5,90);
insert into DM_INVOICE_LINE values ('10046','2',2,89);
insert into DM_INVOICE_LINE values ('10054','8',3,42);
insert into DM_INVOICE_LINE values ('10105','10',5,99);
insert into DM_INVOICE_LINE values ('10113','7',2,21);
insert into DM_INVOICE_LINE values ('10074','6',1,25);
insert into DM_INVOICE_LINE values ('10101','8',3,88);
insert into DM_INVOICE_LINE values ('10012','6',1,74);
insert into DM_INVOICE_LINE values ('10060','6',1,97);
insert into DM_INVOICE_LINE values ('10137','5',5,83);
insert into DM_INVOICE_LINE values ('10047','2',2,52);
insert into DM_INVOICE_LINE values ('10126','4',4,45);
insert into DM_INVOICE_LINE values ('10005','8',3,21);
insert into DM_INVOICE_LINE values ('10140','9',4,70);
insert into DM_INVOICE_LINE values ('10039','9',4,74);
insert into DM_INVOICE_LINE values ('10118','3',3,82);
insert into DM_INVOICE_LINE values ('10148','4',4,69);
insert into DM_INVOICE_LINE values ('10060','2',1,79);
insert into DM_INVOICE_LINE values ('10127','6',1,35);
insert into DM_INVOICE_LINE values ('10069','10',5,96);
insert into DM_INVOICE_LINE values ('10146','9',4,41);
insert into DM_INVOICE_LINE values ('10113','1',1,9);
insert into DM_INVOICE_LINE values ('10079','4',4,19);
insert into DM_INVOICE_LINE values ('10104','2',2,41);
insert into DM_INVOICE_LINE values ('10118','2',2,40);
insert into DM_INVOICE_LINE values ('10129','2',2,99);
insert into DM_INVOICE_LINE values ('10023','8',3,42);
insert into DM_INVOICE_LINE values ('10024','1',1,5);
insert into DM_INVOICE_LINE values ('10013','5',5,95);
insert into DM_INVOICE_LINE values ('10147','4',4,76);
insert into DM_INVOICE_LINE values ('10037','6',1,7);
insert into DM_INVOICE_LINE values ('10085','9',5,74);
insert into DM_INVOICE_LINE values ('10015','2',2,13);
insert into DM_INVOICE_LINE values ('10003','9',4,95);
insert into DM_INVOICE_LINE values ('10139','6',1,55);
insert into DM_INVOICE_LINE values ('10136','4',4,69);
insert into DM_INVOICE_LINE values ('10123','7',2,17);
insert into DM_INVOICE_LINE values ('10039','6',1,16);
insert into DM_INVOICE_LINE values ('10121','2',4,20);
insert into DM_INVOICE_LINE values ('10074','3',1,67);
insert into DM_INVOICE_LINE values ('10018','5',5,99);
insert into DM_INVOICE_LINE values ('10123','10',5,29);
insert into DM_INVOICE_LINE values ('10001','2',2,31);
insert into DM_INVOICE_LINE values ('10082','9',4,96);
insert into DM_INVOICE_LINE values ('10008','3',3,75);
insert into DM_INVOICE_LINE values ('10074','10',5,28);
insert into DM_INVOICE_LINE values ('10071','7',2,78);
insert into DM_INVOICE_LINE values ('10029','5',5,25);
insert into DM_INVOICE_LINE values ('10027','5',5,71);
insert into DM_INVOICE_LINE values ('10053','6',1,62);
insert into DM_INVOICE_LINE values ('10010','9',4,32);
insert into DM_INVOICE_LINE values ('10096','8',3,80);
insert into DM_INVOICE_LINE values ('10126','3',3,27);
insert into DM_INVOICE_LINE values ('10047','7',2,81);
insert into DM_INVOICE_LINE values ('10087','1',1,77);
insert into DM_INVOICE_LINE values ('10011','1',1,71);
insert into DM_INVOICE_LINE values ('10135','10',5,43);
insert into DM_INVOICE_LINE values ('10088','1',1,64);
insert into DM_INVOICE_LINE values ('10045','4',4,5);
insert into DM_INVOICE_LINE values ('10098','8',3,64);
insert into DM_INVOICE_LINE values ('10011','8',3,61);
insert into DM_INVOICE_LINE values ('10086','9',4,27);
insert into DM_INVOICE_LINE values ('10052','3',3,28);
insert into DM_INVOICE_LINE values ('10107','3',3,87);
insert into DM_INVOICE_LINE values ('10012','2',2,86);
insert into DM_INVOICE_LINE values ('10101','9',4,94);
insert into DM_INVOICE_LINE values ('10048','1',1,28);
insert into DM_INVOICE_LINE values ('10076','9',4,38);
insert into DM_INVOICE_LINE values ('10064','5',5,99);
insert into DM_INVOICE_LINE values ('10054','1',1,44);
insert into DM_INVOICE_LINE values ('10081','3',3,3);
insert into DM_INVOICE_LINE values ('10138','6',1,70);
insert into DM_INVOICE_LINE values ('10128','6',1,45);
insert into DM_INVOICE_LINE values ('10125','10',5,67);
insert into DM_INVOICE_LINE values ('10031','5',5,80);
insert into DM_INVOICE_LINE values ('10052','5',5,38);
insert into DM_INVOICE_LINE values ('10106','6',1,43);
insert into DM_INVOICE_LINE values ('10023','9',4,40);
insert into DM_INVOICE_LINE values ('10148','3',3,61);
insert into DM_INVOICE_LINE values ('10100','2',2,16);
insert into DM_INVOICE_LINE values ('10090','6',1,21);
insert into DM_INVOICE_LINE values ('10089','1',1,70);
insert into DM_INVOICE_LINE values ('10134','7',2,36);
insert into DM_INVOICE_LINE values ('10047','4',4,29);
insert into DM_INVOICE_LINE values ('10050','2',2,36);
insert into DM_INVOICE_LINE values ('10079','5',5,73);
insert into DM_INVOICE_LINE values ('10096','5',5,2);
insert into DM_INVOICE_LINE values ('10127','7',1,51);
insert into DM_INVOICE_LINE values ('10129','7',2,68);
insert into DM_INVOICE_LINE values ('10127','2',1,17);
insert into DM_INVOICE_LINE values ('10124','3',3,10);
insert into DM_INVOICE_LINE values ('10027','6',1,78);
insert into DM_INVOICE_LINE values ('10119','5',5,29);
insert into DM_INVOICE_LINE values ('10099','5',5,39);
insert into DM_INVOICE_LINE values ('10011','6',1,8);
insert into DM_INVOICE_LINE values ('10057','1',1,32);
insert into DM_INVOICE_LINE values ('10125','9',4,77);
insert into DM_INVOICE_LINE values ('10114','8',3,30);
insert into DM_INVOICE_LINE values ('10015','3',2,39);
insert into DM_INVOICE_LINE values ('10133','9',4,87);
insert into DM_INVOICE_LINE values ('10082','6',1,72);
insert into DM_INVOICE_LINE values ('10072','8',3,17);
insert into DM_INVOICE_LINE values ('10029','10',5,85);
insert into DM_INVOICE_LINE values ('10089','4',4,86);
insert into DM_INVOICE_LINE values ('10022','7',2,38);
insert into DM_INVOICE_LINE values ('10138','8',3,92);
insert into DM_INVOICE_LINE values ('10073','1',1,66);
insert into DM_INVOICE_LINE values ('10089','6',1,69);
insert into DM_INVOICE_LINE values ('10063','2',5,93);
insert into DM_INVOICE_LINE values ('10123','6',1,32);
insert into DM_INVOICE_LINE values ('10110','5',5,92);
insert into DM_INVOICE_LINE values ('10027','10',5,17);
insert into DM_INVOICE_LINE values ('10057','9',4,20);
insert into DM_INVOICE_LINE values ('10085','4',1,89);
insert into DM_INVOICE_LINE values ('10128','2',1,8);
insert into DM_INVOICE_LINE values ('10106','2',1,49);
insert into DM_INVOICE_LINE values ('10134','2',2,98);
insert into DM_INVOICE_LINE values ('10077','3',3,93);
insert into DM_INVOICE_LINE values ('10126','10',5,12);
insert into DM_INVOICE_LINE values ('10020','3',3,23);
insert into DM_INVOICE_LINE values ('10140','4',4,60);
insert into DM_INVOICE_LINE values ('10070','3',3,24);
insert into DM_INVOICE_LINE values ('10024','8',3,70);
insert into DM_INVOICE_LINE values ('10068','1',1,33);
insert into DM_INVOICE_LINE values ('10094','2',2,63);
insert into DM_INVOICE_LINE values ('10106','10',5,85);
insert into DM_INVOICE_LINE values ('10038','5',5,12);
insert into DM_INVOICE_LINE values ('10128','7',2,20);
insert into DM_INVOICE_LINE values ('10140','2',2,29);
insert into DM_INVOICE_LINE values ('10020','8',3,53);
insert into DM_INVOICE_LINE values ('10139','2',2,51);
insert into DM_INVOICE_LINE values ('10124','4',4,60);
insert into DM_INVOICE_LINE values ('10082','2',1,61);
insert into DM_INVOICE_LINE values ('10092','7',2,90);
insert into DM_INVOICE_LINE values ('10053','7',2,53);
insert into DM_INVOICE_LINE values ('10040','3',3,84);
insert into DM_INVOICE_LINE values ('10113','2',2,83);
insert into DM_INVOICE_LINE values ('10136','1',1,25);
insert into DM_INVOICE_LINE values ('10053','2',2,25);
insert into DM_INVOICE_LINE values ('10048','7',2,25);
insert into DM_INVOICE_LINE values ('10105','4',4,24);
insert into DM_INVOICE_LINE values ('10097','8',3,45);
insert into DM_INVOICE_LINE values ('10091','5',5,8);
insert into DM_INVOICE_LINE values ('10084','3',3,49);
insert into DM_INVOICE_LINE values ('10127','10',5,29);
insert into DM_INVOICE_LINE values ('10004','10',5,78);
insert into DM_INVOICE_LINE values ('10123','2',5,74);
insert into DM_INVOICE_LINE values ('10000','9',4,84);
insert into DM_INVOICE_LINE values ('10112','6',1,77);
insert into DM_INVOICE_LINE values ('10108','7',2,36);
insert into DM_INVOICE_LINE values ('10097','2',3,89);
insert into DM_INVOICE_LINE values ('10097','1',1,46);
insert into DM_INVOICE_LINE values ('10107','7',2,28);
insert into DM_INVOICE_LINE values ('10123','4',5,88);
insert into DM_INVOICE_LINE values ('10060','8',3,8);
insert into DM_INVOICE_LINE values ('10019','6',1,92);
insert into DM_INVOICE_LINE values ('10006','2',2,5);
insert into DM_INVOICE_LINE values ('10027','7',2,39);
insert into DM_INVOICE_LINE values ('10010','6',1,65);
insert into DM_INVOICE_LINE values ('10132','8',3,84);
insert into DM_INVOICE_LINE values ('10022','2',2,69);
insert into DM_INVOICE_LINE values ('10062','3',3,86);
insert into DM_INVOICE_LINE values ('10048','6',1,6);
insert into DM_INVOICE_LINE values ('10009','5',5,20);


-- #######################################
-- ###### DM_EMPLOYEE               ######
-- #######################################

Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6292425,'BUR68833Q','Crissy','Burns','Ms. Crissy Burns','F','Ms.',4,null,convert(datetime,'07-FEB-60'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2325796,'BAT94173Q','Wayland','Bateman','Mr. Wayland Bateman','M','Mr.',1,null,convert(datetime,'28-JAN-82'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4174118,'NAT45997J','Tawnya','Nathan','Ms. Tawnya Nathan','F','Ms.',1,null,convert(datetime,'18-MAR-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7576073,'FLO84580S','Patricio','Flower','Mr. Patricio Flower','M','Mr.',1,null,convert(datetime,'15-OCT-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1616216,'WHI60070N','Visitacmon','White','Miss. Visitacmon White','F','Miss.',1,null,convert(datetime,'03-JUN-71'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3545311,'SMA30969M','Emery','Smalley','Mr. Emery Smalley','M','Mr.',1,null,convert(datetime,'21-JAN-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2841944,'BRE80788D','Kathi','Brennan','Miss. Kathi Brennan','F','Miss.',1,null,convert(datetime,'16-AUG-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2577863,'MCD84520Z','Rosario','Mcdonald','Mr. Rosario Mcdonald','M','Mr.',1,null,convert(datetime,'23-JAN-85'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4986323,'TRA36240L','Erle','Travers','Mr. Erle Travers','M','Mr.',1,null,convert(datetime,'15-APR-83'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3645783,'DEN53111B','Leanora','Dennis','Ms. Leanora Dennis','F','Ms.',1,null,convert(datetime,'10-DEC-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9287157,'TOR43417V','Rodolphe','Torres','Mr. Rodolphe Torres','M','Mr.',1,null,convert(datetime,'26-JAN-85'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2068568,'WHI94065T','Alya','White','Mrs. Alya White','F','Mrs.',1,null,convert(datetime,'27-NOV-67'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2981186,'WHI68415X','Muhammad','Whiting','Mr. Muhammad Whiting','M','Mr.',1,null,convert(datetime,'10-MAR-72'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4231610,'BEN01369W','Gaynor','Bentley','Ms. Gaynor Bentley','F','Ms.',1,null,convert(datetime,'21-DEC-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7560836,'HUR76236I','Adisa','Hurst','Mr. Adisa Hurst','M','Mr.',1,null,convert(datetime,'31-JUL-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2619127,'RUT77532O','Donny','Rutherford','Mr. Donny Rutherford','M','Mr.',1,null,convert(datetime,'02-JUL-66'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7459062,'WAL76237Q','Afton','Walton','Miss. Afton Walton','F','Miss.',1,null,convert(datetime,'13-NOV-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6372372,'DON09169B','Lacey','Donnelly','Ms. Lacey Donnelly','F','Ms.',1,null,convert(datetime,'07-JAN-84'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2192416,'BID36800V','Alexandre','Bidgood','Mr. Alexandre Bidgood','M','Mr.',1,null,convert(datetime,'04-DEC-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6242372,'OSB21069R','Estela','Osborn','Mrs. Estela Osborn','F','Mrs.',1,null,convert(datetime,'14-OCT-60'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4030310,'PRE17154L','Waylon','Preston','Mr. Waylon Preston','M','Mr.',1,null,convert(datetime,'20-AUG-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4924849,'MAL65313V','Julian','Mallett','Mr. Julian Mallett','M','Mr.',1,null,convert(datetime,'22-FEB-81'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9780570,'NEW49195Y','Migdalia','Newcome','Ms. Migdalia Newcome','F','Ms.',1,null,convert(datetime,'11-OCT-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1616216,'WHI94807J','Visitacmon','White','Miss. Visitacmon White','F','Miss.',2,null,convert(datetime,'01-SEP-66'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4000611,'THO72209M','Marilynn','Thomson','Ms. Marilynn Thomson','F','Ms.',2,null,convert(datetime,'14-AUG-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6194288,'CHA69659B','Nicholaus','Charlton','Mr. Nicholaus Charlton','M','Mr.',2,null,convert(datetime,'13-FEB-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8261173,'ROF04371S','Lorn','Roffey','Mr. Lorn Roffey','M','Mr.',2,null,convert(datetime,'24-MAY-75'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2981186,'WHI35137S','Muhammad','Whiting','Mr. Muhammad Whiting','M','Mr.',2,null,convert(datetime,'24-AUG-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6112223,'BAN14645K','Juanito','Banks','Mr. Juanito Banks','M','Mr.',2,null,convert(datetime,'17-NOV-82'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7459062,'WAL51020A','Afton','Walton','Miss. Afton Walton','F','Miss.',2,null,convert(datetime,'30-JAN-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4343914,'LOR79282X','Kuno','Lord','Mr. Kuno Lord','M','Mr.',2,null,convert(datetime,'16-JUL-69'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6601041,'WIM92417I','Felipe','Wimbush','Mr. Felipe Wimbush','M','Mr.',2,null,convert(datetime,'21-FEB-81'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9860757,'COL71253B','Ewart','Coleman','Mr. Ewart Coleman','M','Mr.',2,null,convert(datetime,'17-JAN-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8761276,'HUG43467M','Lawanda','Hughes','Mrs. Lawanda Hughes','F','Mrs.',1,null,convert(datetime,'20-JUN-78'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3163494,'STA74705Y','Fleuretta','Stanley','Mrs. Fleuretta Stanley','F','Mrs.',2,null,convert(datetime,'04-JUL-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3645783,'WHI94406O','Leanora','Whitton','Mrs. Leanora Whitton','F','Mrs.',3,null,convert(datetime,'08-FEB-60'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1616216,'WHI67222H','Visitacmon','White','Miss. Visitacmon White','F','Miss.',3,null,convert(datetime,'12-SEP-74'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2577863,'MCD42083O','Rosario','Mcdonald','Mr. Rosario Mcdonald','M','Mr.',3,null,convert(datetime,'18-AUG-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2981186,'WHI45424R','Muhammad','Whiting','Mr. Muhammad Whiting','M','Mr.',3,null,convert(datetime,'22-MAR-69'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1220972,'EDW36123C','Grady','Edwards','Mr. Grady Edwards','M','Mr.',3,null,convert(datetime,'06-DEC-83'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4753505,'CLI97410F','Shukri','Clifton','Mr. Shukri Clifton','M','Mr.',3,null,convert(datetime,'01-FEB-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1616216,'PLU87366H','Visitacmon','Plunket','Mrs. Visitacmon Plunket','F','Mrs.',4,null,convert(datetime,'25-JUN-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9187794,'RAI59886Y','Sue','Rainger','Miss. Sue Rainger','F','Miss.',4,null,convert(datetime,'03-SEP-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5491369,'HER11878W','Charlton','Herbert','Mr. Charlton Herbert','M','Mr.',1,null,convert(datetime,'08-MAY-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4479524,'MOR36549K','Munir','Morris','Mr. Munir Morris','M','Mr.',1,null,convert(datetime,'28-APR-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7386704,'EVA17203U','Lesli','Evans','Ms. Lesli Evans','F','Ms.',1,null,convert(datetime,'28-JUN-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1035563,'ELL82466B','Seetha','Ellis','Mrs. Seetha Ellis','F','Mrs.',1,null,convert(datetime,'20-FEB-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6989698,'PRO63521L','Edna','Probert','Ms. Edna Probert','F','Ms.',1,null,convert(datetime,'02-JUL-71'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2534798,'RHO55473W','Denny','Rhodes','Mr. Denny Rhodes','M','Mr.',1,null,convert(datetime,'20-FEB-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7137199,'SAV62355C','Sancha','Savile','Ms. Sancha Savile','F','Ms.',1,null,convert(datetime,'23-MAR-74'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4862214,'RAM67947P','Trevelyan','Ramsbotham','Mr. Trevelyan Ramsbotham','M','Mr.',1,null,convert(datetime,'01-DEC-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5940635,'LON91340H','Goddard','Longbotham','Mr. Goddard Longbotham','M','Mr.',1,null,convert(datetime,'29-OCT-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2774856,'JOR73745V','Lincoln','Jordan','Mr. Lincoln Jordan','M','Mr.',1,null,convert(datetime,'02-FEB-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8620678,'CRI60746C','Kourtney','Cripps','Mrs. Kourtney Cripps','F','Mrs.',1,null,convert(datetime,'28-SEP-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4000611,'THO41301H','Marilynn','Thomson','Ms. Marilynn Thomson','F','Ms.',1,null,convert(datetime,'04-DEC-67'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6449711,'BAR52107G','Joaquin','Barton','Mr. Joaquin Barton','M','Mr.',1,null,convert(datetime,'26-JUN-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6952067,'CAR31514A','Karima','Carson','Ms. Karima Carson','F','Ms.',1,null,convert(datetime,'14-JUL-67'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1050641,'AMB50847S','Angus','Ambler','Mr. Angus Ambler','M','Mr.',1,null,convert(datetime,'14-FEB-80'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3163494,'TAY97146M','Fleuretta','Taylor','Ms. Fleuretta Taylor','F','Ms.',1,null,convert(datetime,'24-NOV-84'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5397456,'BRE04280S','Elfrieda','Brennan','Ms. Elfrieda Brennan','F','Ms.',1,null,convert(datetime,'30-JUN-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6194288,'CHA52634E','Nicholaus','Charlton','Mr. Nicholaus Charlton','M','Mr.',1,null,convert(datetime,'03-JUN-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1975910,'PIG43200J','Charlton','Piggot','Mr. Charlton Piggot','M','Mr.',1,null,convert(datetime,'05-SEP-80'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3822568,'BRA18401Z','Ginette','Bramble','Miss. Ginette Bramble','F','Miss.',1,null,convert(datetime,'01-JAN-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6292425,'BUR77910E','Crissy','Burns','Ms. Crissy Burns','F','Ms.',1,null,convert(datetime,'30-NOV-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7001407,'BAT26290I','Hurley','Bates','Mr. Hurley Bates','M','Mr.',1,null,convert(datetime,'20-SEP-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8261173,'ROF29382U','Lorn','Roffey','Mr. Lorn Roffey','M','Mr.',1,null,convert(datetime,'14-APR-81'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2910324,'STO51423E','Hartmut','Stone','Mr. Hartmut Stone','M','Mr.',1,null,convert(datetime,'28-SEP-83'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5663227,'DUN23206S','Suman','Duncan','Mr. Suman Duncan','M','Mr.',1,null,convert(datetime,'30-NOV-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4695829,'RAY94538N','Mariana','Rayment','Ms. Mariana Rayment','F','Ms.',1,null,convert(datetime,'22-JUN-83'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8089803,'BRO81818D','Carie','Brown','Mrs. Carie Brown','F','Mrs.',1,null,convert(datetime,'09-APR-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5454344,'KIR61922H','Tianna','Kirk','Ms. Tianna Kirk','F','Ms.',1,null,convert(datetime,'16-SEP-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7171496,'NOW75057R','Ocie','Nowell','Miss. Ocie Nowell','F','Miss.',1,null,convert(datetime,'09-JUN-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8761276,'KEL11294F','Lawanda','Kelly','Ms. Lawanda Kelly','F','Ms.',1,null,convert(datetime,'14-FEB-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8614143,'SCO27590R','Karlie','Scobie','Mrs. Karlie Scobie','F','Mrs.',1,null,convert(datetime,'27-MAR-78'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6112223,'BAN21733M','Juanito','Banks','Mr. Juanito Banks','M','Mr.',1,null,convert(datetime,'19-FEB-69'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8697760,'LLO89969K','Austyn','Lloyd','Mr. Austyn Lloyd','M','Mr.',1,null,convert(datetime,'21-OCT-63'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5775646,'ACK67770L','Jaden','Ackland','Mr. Jaden Ackland','M','Mr.',1,null,convert(datetime,'22-SEP-69'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8086992,'WOO96788I','Kenyatta','Woollcombe','Ms. Kenyatta Woollcombe','F','Ms.',1,null,convert(datetime,'17-APR-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5965448,'POR68594C','Parrish','Porter','Mr. Parrish Porter','M','Mr.',1,null,convert(datetime,'18-OCT-83'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1220972,'EDW70671B','Grady','Edwards','Mr. Grady Edwards','M','Mr.',1,null,convert(datetime,'05-JAN-63'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2275154,'ARM70676V','Willie','Armstrong','Ms. Willie Armstrong','F','Ms.',1,null,convert(datetime,'21-FEB-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3913506,'STU71082O','Tameka','Stubbs','Ms. Tameka Stubbs','F','Ms.',1,null,convert(datetime,'08-MAY-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9082068,'LAR86369Y','Eleonore','Larcher','Ms. Eleonore Larcher','F','Ms.',1,null,convert(datetime,'15-JUN-79'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9187794,'RAI89645O','Sue','Rainger','Miss. Sue Rainger','F','Miss.',1,null,convert(datetime,'29-OCT-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9059653,'ORC68271G','Edmund','Orchard','Mr. Edmund Orchard','M','Mr.',1,null,convert(datetime,'27-JAN-60'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4343914,'LOR09707D','Kuno','Lord','Mr. Kuno Lord','M','Mr.',1,null,convert(datetime,'17-JUN-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4753505,'CLI91714D','Shukri','Clifton','Mr. Shukri Clifton','M','Mr.',1,null,convert(datetime,'24-JUL-66'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7850041,'TOR13655Q','Mariela','Torres','Ms. Mariela Torres','F','Ms.',1,null,convert(datetime,'23-MAR-77'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4614808,'VAN79929B','Leia','Vanner','Ms. Leia Vanner','F','Ms.',1,null,convert(datetime,'27-FEB-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6601041,'WIM70406B','Felipe','Wimbush','Mr. Felipe Wimbush','M','Mr.',1,null,convert(datetime,'14-SEP-66'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1706288,'LEN81178Z','Nicolette','Lennox','Mrs. Nicolette Lennox','F','Mrs.',1,null,convert(datetime,'01-FEB-63'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7882083,'OLI79956V','Graham','Oliver','Mr. Graham Oliver','M','Mr.',1,null,convert(datetime,'09-MAR-60'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5910808,'SEX26263J','Vincent','Sexton','Mr. Vincent Sexton','M','Mr.',1,null,convert(datetime,'09-APR-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9860757,'COL61505D','Ewart','Coleman','Mr. Ewart Coleman','M','Mr.',1,null,convert(datetime,'28-AUG-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1995366,'PIN55816J','Chip','Pinero','Mr. Chip Pinero','M','Mr.',1,null,convert(datetime,'08-JUN-85'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4479524,'MOR69433V','Munir','Morris','Mr. Munir Morris','M','Mr.',2,null,convert(datetime,'05-FEB-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6989698,'PRO21780Q','Edna','Probert','Ms. Edna Probert','F','Ms.',2,null,convert(datetime,'25-FEB-69'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7137199,'SAV47480A','Sancha','Savile','Ms. Sancha Savile','F','Ms.',2,null,convert(datetime,'11-DEC-79'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3545311,'SMA72125E','Emery','Smalley','Mr. Emery Smalley','M','Mr.',2,null,convert(datetime,'13-MAY-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8620678,'CRI80743O','Kourtney','Cripps','Mrs. Kourtney Cripps','F','Mrs.',2,null,convert(datetime,'17-SEP-83'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6952067,'CAR56944T','Karima','Carson','Mrs. Karima Carson','F','Mrs.',2,null,convert(datetime,'16-DEC-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2577863,'MCD42146Z','Rosario','Mcdonald','Mr. Rosario Mcdonald','M','Mr.',2,null,convert(datetime,'11-JUN-85'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3163494,'TAY26205A','Fleuretta','Taylor','Ms. Fleuretta Taylor','F','Ms.',2,null,convert(datetime,'18-SEP-71'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3645783,'DEN80391V','Leanora','Dennis','Ms. Leanora Dennis','F','Ms.',2,null,convert(datetime,'22-JAN-82'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6292425,'BUR79534C','Crissy','Burns','Ms. Crissy Burns','F','Ms.',2,null,convert(datetime,'08-NOV-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7001407,'BAT42738H','Hurley','Bates','Mr. Hurley Bates','M','Mr.',2,null,convert(datetime,'23-FEB-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5663227,'DUN26623B','Suman','Duncan','Mr. Suman Duncan','M','Mr.',2,null,convert(datetime,'21-NOV-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4695829,'RAY80686L','Mariana','Rayment','Ms. Mariana Rayment','F','Ms.',2,null,convert(datetime,'18-JUN-81'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5454344,'KIR48216J','Tianna','Kirk','Ms. Tianna Kirk','F','Ms.',2,null,convert(datetime,'08-MAY-75'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7171496,'NOW23035N','Ocie','Nowell','Miss. Ocie Nowell','F','Miss.',2,null,convert(datetime,'14-FEB-72'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4231610,'BEN71866M','Gaynor','Bentley','Ms. Gaynor Bentley','F','Ms.',2,null,convert(datetime,'02-APR-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5775646,'ACK46630G','Jaden','Ackland','Mr. Jaden Ackland','M','Mr.',2,null,convert(datetime,'09-MAR-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1220972,'EDW16762G','Grady','Edwards','Mr. Grady Edwards','M','Mr.',2,null,convert(datetime,'25-NOV-74'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2275154,'ARM95411L','Willie','Armstrong','Ms. Willie Armstrong','F','Ms.',2,null,convert(datetime,'08-JUN-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9187794,'RAI56971G','Sue','Rainger','Miss. Sue Rainger','F','Miss.',2,null,convert(datetime,'12-DEC-75'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9059653,'ORC00387Z','Edmund','Orchard','Mr. Edmund Orchard','M','Mr.',2,null,convert(datetime,'19-SEP-60'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4753505,'CLI70861L','Shukri','Clifton','Mr. Shukri Clifton','M','Mr.',2,null,convert(datetime,'10-MAY-72'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7850041,'TOR48465A','Mariela','Torres','Ms. Mariela Torres','F','Ms.',2,null,convert(datetime,'08-JAN-69'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7882083,'OLI23445G','Graham','Oliver','Mr. Graham Oliver','M','Mr.',2,null,convert(datetime,'30-JUL-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4924849,'MAL86405C','Julian','Mallett','Mr. Julian Mallett','M','Mr.',2,null,convert(datetime,'03-FEB-78'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9780570,'NEW59552H','Migdalia','Newcome','Ms. Migdalia Newcome','F','Ms.',2,null,convert(datetime,'14-MAR-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6952067,'CAR74539L','Karima','Carson','Mrs. Karima Carson','F','Mrs.',1,null,convert(datetime,'28-JAN-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3822568,'CRA45195W','Ginette','Crawford','Mrs. Ginette Crawford','F','Mrs.',1,null,convert(datetime,'15-OCT-72'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3913506,'BEL73945W','Tameka','Bellamy','Mrs. Tameka Bellamy','F','Mrs.',1,null,convert(datetime,'21-MAR-80'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7137199,'TIN87117E','Sancha','Tinkler','Mrs. Sancha Tinkler','F','Mrs.',2,null,convert(datetime,'15-JUN-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2275154,'CAR97531B','Willie','Carey','Mrs. Willie Carey','F','Mrs.',2,null,convert(datetime,'13-FEB-68'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (1616216,'PLU59105X','Visitacmon','Plunket','Mrs. Visitacmon Plunket','F','Mrs.',3,null,convert(datetime,'29-JAN-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9780570,'GIL50921T','Migdalia','Gilbert','Mrs. Migdalia Gilbert','F','Mrs.',3,null,convert(datetime,'05-FEB-81'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6292425,'NEL72628H','Crissy','Nelson','Mrs. Crissy Nelson','F','Mrs.',4,null,convert(datetime,'07-NOV-79'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7137199,'TIN83188R','Sancha','Tinkler','Mrs. Sancha Tinkler','F','Mrs.',3,null,convert(datetime,'29-JUN-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4000611,'THO76825O','Marilynn','Thomson','Ms. Marilynn Thomson','F','Ms.',3,null,convert(datetime,'19-APR-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6952067,'CAR97686Y','Karima','Carson','Mrs. Karima Carson','F','Mrs.',3,null,convert(datetime,'07-SEP-86'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (3645783,'DEN04032H','Leanora','Dennis','Ms. Leanora Dennis','F','Ms.',3,null,convert(datetime,'23-APR-74'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (6292425,'BUR36135J','Crissy','Burns','Ms. Crissy Burns','F','Ms.',3,null,convert(datetime,'25-APR-73'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (8261173,'ROF45935F','Lorn','Roffey','Mr. Lorn Roffey','M','Mr.',3,null,convert(datetime,'12-JUL-70'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (7171496,'NOW40724P','Ocie','Nowell','Miss. Ocie Nowell','F','Miss.',3,null,convert(datetime,'20-DEC-85'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4231610,'BEN68471U','Gaynor','Bentley','Ms. Gaynor Bentley','F','Ms.',3,null,convert(datetime,'16-JAN-65'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5775646,'ACK23358W','Jaden','Ackland','Mr. Jaden Ackland','M','Mr.',3,null,convert(datetime,'02-AUG-64'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2275154,'CAR91784V','Willie','Carey','Mrs. Willie Carey','F','Mrs.',3,null,convert(datetime,'07-OCT-67'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9187794,'RAI08948G','Sue','Rainger','Miss. Sue Rainger','F','Miss.',3,null,convert(datetime,'26-NOV-72'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4343914,'LOR51257T','Kuno','Lord','Mr. Kuno Lord','M','Mr.',3,null,convert(datetime,'02-JUN-61'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4924849,'MAL88658W','Julian','Mallett','Mr. Julian Mallett','M','Mr.',3,null,convert(datetime,'11-SEP-62'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (9780570,'NEW52652I','Migdalia','Newcome','Ms. Migdalia Newcome','F','Ms.',3,null,convert(datetime,'24-DEC-82'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (2577863,'MCD88510R','Rosario','Mcdonald','Mr. Rosario Mcdonald','M','Mr.',4,null,convert(datetime,'06-OCT-82'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4231610,'BEN68059P','Gaynor','Bentley','Ms. Gaynor Bentley','F','Ms.',4,null,convert(datetime,'12-MAR-76'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (5775646,'ACK15918Q','Jaden','Ackland','Mr. Jaden Ackland','M','Mr.',4,null,convert(datetime,'25-OCT-66'));
Insert into DM_EMPLOYEE (person_id,emp_id,first_name,last_name,full_name,gender,title,assignment_id,emp_data,birth_date) values (4924849,'MAL33013G','Julian','Mallett','Mr. Julian Mallett','M','Mr.',4,null,convert(datetime,'08-MAR-74'));

-- #######################################
-- ###### DM_ASSIGNMENT             ######
-- #######################################

Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1035563,'ELL82466B','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5397456,'BRE04280S','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6194288,'CHA52634E','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5663227,'DUN23206S','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5454344,'KIR61922H','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8697760,'LLO89969K','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5965448,'POR68594C','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4030310,'PRE17154L','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,7137199,'TIN87117E','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,3545311,'SMA72125E','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,6194288,'CHA69659B','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,5663227,'DUN26623B','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,9860757,'COL71253B','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,4000611,'THO76825O','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,2577863,'MCD42083O','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,7171496,'NOW40724P','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,1220972,'EDW36123C','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,4753505,'CLI97410F','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5491369,'HER11878W','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2841944,'BRE80788D','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1975910,'PIG43200J','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2910324,'STO51423E','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1706288,'LEN81178Z','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,7171496,'NOW23035N','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,3645783,'DEN04032H','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,9780570,'NEW52652I','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,5775646,'ACK23358W','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,9187794,'RAI08948G','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7386704,'EVA17203U','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4862214,'RAM67947P','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2774856,'JOR73745V','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8620678,'CRI60746C','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4695829,'RAY94538N','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8761276,'HUG43467M','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2619127,'RUT77532O','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2275154,'ARM70676V','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6372372,'DON09169B','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7882083,'OLI79956V','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4479524,'MOR69433V','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4000611,'THO72209M','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,6292425,'BUR79534C','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,5775646,'ACK46630G','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,6292425,'BUR68833Q','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,4924849,'MAL33013G','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7137199,'SAV62355C','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2577863,'MCD84520Z','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2981186,'WHI68415X','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4231610,'BEN01369W','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7560836,'HUR76236I','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9457691,'BAR93339K','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5775646,'ACK67770L','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9187794,'RAI89645O','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6242372,'OSB21069R','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4924849,'MAL65313V','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5910808,'SEX26263J','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9860757,'COL61505D','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,1616216,'WHI94807J','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,6952067,'CAR56944T','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,7001407,'BAT42738H','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,8261173,'ROF04371S','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4695829,'RAY80686L','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,1220972,'EDW16762G','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,9059653,'ORC00387Z','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,7850041,'TOR48465A','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,1616216,'WHI67222H','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,2981186,'WHI45424R','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,2275154,'CAR91784V','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,4924849,'MAL88658W','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,2577863,'MCD88510R','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,9187794,'RAI59886Y','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2325796,'BAT94173Q','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4174118,'NAT45997J','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6989698,'PRO63521L','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2534798,'RHO55473W','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,5940635,'LON91340H','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4000611,'THO41301H','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4986323,'TRA36240L','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,3645783,'DEN53111B','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6292425,'BUR77910E','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7171496,'NOW75057R','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6112223,'BAN21733M','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8086992,'WOO96788I','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7459062,'WAL76237Q','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9082068,'LAR86369Y','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4343914,'LOR09707D','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1995366,'PIN55816J','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,3163494,'STA74705Y','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,9187794,'RAI56971G','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4343914,'LOR79282X','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,9780570,'NEW59552H','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,8261173,'ROF45935F','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,5775646,'ACK15918Q','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7576073,'FLO84580S','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1616216,'WHI60070N','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6449711,'BAR52107G','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7001407,'BAT26290I','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8261173,'ROF29382U','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8089803,'BRO81818D','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4753505,'CLI91714D','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,7850041,'TOR13655Q','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,8535867,'BAI02464C','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,2981186,'WHI35137S','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,6112223,'BAN14645K','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,7459062,'WAL51020A','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4753505,'CLI70861L','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,6601041,'WIM92417I','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,8535867,'BAI79843D','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,6952067,'CAR97686Y','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,4231610,'BEN68059P','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,3163494,'TAY97146M','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2068568,'WHI94065T','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8614143,'SCO27590R','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,3913506,'BEL73945W','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,2192416,'BID36800V','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6601041,'WIM70406B','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9780570,'NEW49195Y','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,2577863,'MCD42146Z','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4231610,'BEN71866M','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,2275154,'CAR97531B','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,7137199,'TIN83188R','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,6292425,'BUR36135J','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,4231610,'BEN68471U','Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (4,1616216,'PLU87366H','Senior Manager',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,8535867,'BAI14498C','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4479524,'MOR36549K','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,3545311,'SMA30969M','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,6952067,'CAR74539L','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1050641,'AMB50847S','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,3822568,'CRA45195W','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9287157,'TOR43417V','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,1220972,'EDW70671B','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,9059653,'ORC68271G','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (1,4614808,'VAN79929B','Telesales Trainee',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,6989698,'PRO21780Q','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,8620678,'CRI80743O','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,3645783,'DEN80391V','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,5454344,'KIR48216J','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,7882083,'OLI23445G','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (2,4924849,'MAL86405C','Telesales Operator',null);
Insert into DM_ASSIGNMENT (assignment_id,person_id,emp_id,emp_jobtitle,assignment_notes) values (3,4343914,'LOR51257T','Manager',null);

INSERT INTO DM_CUSTOMER_CONTACTS (CONTACT_PERSON)
VALUES ('
<Company Name="Somerville Intruder plc">
<Employees>
<Employee Name="Crissy Burns"
role="Telesales"/>
</Employees>
</Company>');
INSERT INTO DM_CUSTOMER_CONTACTS (CONTACT_PERSON)
VALUES ('
<Company Name="Antiique Marine Ltd.">
<Employees>
<Employee Name="Wayland Bateman"
role="Hunter"/>
</Employees>
</Company>');
INSERT INTO DM_CUSTOMER_CONTACTS (CONTACT_PERSON)
VALUES ('
<Company Name="Antiique Marine Ltd.">
<Employees>
<Employee Name="Tawnya Nathan"
role="Hunter"/>
</Employees>
</Company>');
INSERT INTO DM_CUSTOMER_CONTACTS (CONTACT_PERSON)
VALUES ('
<Company Name="Printhaus Call Co.">
<Employees>
<Employee Name="Patricio Flower"
role="Hunter"/>
</Employees>
</Company>');
INSERT INTO DM_CUSTOMER_CONTACTS (CONTACT_PERSON)
VALUES ('
<Company Name="Printhaus Call Co.">
<Employees>
<Employee Name="Visitacmon White"
role="Hunter"/>
</Employees>
</Company>');


/* #############################################################
     cr_indexes.sql - This file creates the indexes and
                foreign key constraints Data Masker sample tables
   
--   Unless manually altered, the indexes and constraints will be 
--   created in the default database of the login in which this 
--   file is run.  
--
--   Data Masker for SQL Server Sample Schema
  
   ############################################################# */

alter table DM_CUSTOMER add primary key (customer_id);
alter table DM_INVOICE add primary key (invoice_number);
alter table DM_INVOICE_LINE add primary key (invoice_number, inventory_item_id);
alter table DM_INVOICE_LINE_HISTORY add primary key (identCol);
alter table DM_CREDIT_CARD_TYPE add primary key (credit_card_type_id);
alter table DM_INVENTORY_ITEM add primary key (inventory_item_id);
alter table DM_SUPPLIERS add primary key (supplier_id);
alter table DM_EMP_AUDIT add primary key (identCol);

create unique index empInd1 on DM_EMPLOYEE (person_id, emp_id);
create unique index asgnInd1 on DM_ASSIGNMENT (person_id, assignment_id);
  
alter table DM_CUSTOMER_NOTES add constraint CN_FK foreign key (customer_id) 
     references DM_CUSTOMER (customer_id);
alter table DM_CUSTOMER add constraint CU_FK foreign key (credit_card_type_id) 
     references DM_CREDIT_CARD_TYPE (credit_card_type_id);
alter table DM_INVOICE_LINE add constraint I3_FK foreign key (invoice_number) 
     references DM_INVOICE (invoice_number);
alter table DM_INVOICE_LINE add constraint I4_FK foreign key (inventory_item_id) 
     references DM_INVENTORY_ITEM (inventory_item_id);
ALTER TABLE [dbo].[DM_CUSTOMER_CONTACTS] add primary key ([CONTACT_ID]);


GO
create trigger IL_trig1
on DM_INVOICE_LINE after insert, update
AS
BEGIN
  DECLARE @invNum integer
  DECLARE @itemID integer
  DECLARE @itemQty integer
  Select @invNum=invoice_number, @itemID=inventory_item_id, @itemQty=invoice_line_quantity from DM_INVOICE_LINE;
  insert into DM_INVOICE_LINE_HISTORY (invoice_number,item_id,quantity) 
     values (@invNum,@itemID,@itemQty);
END
GO

create trigger EMP_trig1
on DM_EMPLOYEE after update
AS
BEGIN
  DECLARE @person_id integer
  DECLARE @assignment_id integer
  DECLARE @emp_id nvarchar(10)
  DECLARE @first_name nvarchar(40)
  DECLARE @last_name nvarchar(40)
  DECLARE @full_name nvarchar(40)
  Select @person_id=person_id, @assignment_id=assignment_id, @emp_id=emp_id, @first_name=first_name, @last_name=last_name, @full_name=full_name from DM_EMPLOYEE;
  insert into DM_EMP_AUDIT (person_id,assignment_id, emp_id,first_name,last_name,full_name) 
     values (@person_id,@assignment_id, @emp_id,@first_name,@last_name,@full_name);
END
GO

UPDATE dbo.DM_CUSTOMER_NOTES
SET customer_firstname =
    (
        SELECT c.customer_firstname 
		FROM dbo.DM_CUSTOMER c
		WHERE dbo.DM_CUSTOMER_NOTES.customer_id = c.customer_id
    );
GO
UPDATE dbo.DM_CUSTOMER_NOTES
SET customer_lastname =
    (
        SELECT c.customer_lastname
		FROM dbo.DM_CUSTOMER c
		WHERE dbo.DM_CUSTOMER_NOTES.customer_id = c.customer_id
    );
GO
