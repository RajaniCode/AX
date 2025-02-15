/* **  SQLSERVER  **************************************** */
/* **                                                   ** */
/* **  upgrade_BaseEdiData.sql  			** */
/* **    Step 4 - Update (insert) data is needed        ** */
/* ** 	 Step 5 - Refresh (delete&insert)the errtxt     ** */
/* ** 		  table for language = 1 (english)      ** */
/* **    Step 6 - Remove 'old' CONTRL Documents and add ** */
/* ** 		  new CONTRL Document                   ** */
/* ** 							** */
/* ** 				           Covast 2005  ** */
/* ******************************************************* */

/* ****************************************************** */
/* **  STEP 4 -  Correct/insert data                   ** */
/* ****************************************************** */

IF NOT EXISTS ( select * from charset WHERE setname = 'ISO-8859-1')
INSERT INTO charset VALUES ('ISO-8859-1','ISO character set 8859 Latin 1',1) 

IF NOT EXISTS ( select * from charset WHERE setname = 'ISO-8859-1')
INSERT INTO charset VALUES ('ISO-8859-2','ISO character set 8859 Latin 2',2) 

IF NOT EXISTS ( select * from charset WHERE setname = 'ISO-8859-3')
INSERT INTO charset VALUES ('ISO-8859-3','ISO character set 8859 Latin 3',3) 

IF NOT EXISTS ( select * from charset WHERE setname = 'ISO-8859-5')
INSERT INTO charset VALUES ('ISO-8859-5','ISO character set 8859 Cyrillic',5)

IF NOT EXISTS ( select * from charset WHERE setname = 'ISO-8859-7')
INSERT INTO charset VALUES ('ISO-8859-7','ISO character set 8859 Modern Greek',7) 

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOA')
INSERT INTO charset VALUES ('UNOA','UNOA', 11)

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOB')
INSERT INTO charset VALUES ('UNOB','UNOB', 12)

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOC')
INSERT INTO charset VALUES ('UNOC','UNOC', 13)

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOD')
INSERT INTO charset VALUES ('UNOD','UNOD', 14)

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOE')
INSERT INTO charset VALUES ('UNOE','UNOE', 15)

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOF')
INSERT INTO charset VALUES ('UNOF','UNOF', 16)

IF NOT EXISTS ( select * from charset WHERE setname = 'UNOG')
INSERT INTO charset VALUES ('UNOG','UNOG', 17)


IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 1  3  ')
INSERT INTO mfcvr VALUES ('3 1  3  ',3,'1  ','3  ','EDIFACT UNOC 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOC?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOC',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL) 

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 1  4  ')
INSERT INTO mfcvr VALUES ('3 1  4  ',3,'1  ','4  ','EDIFACT UNOD 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOD?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOD',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 1  5  ')
INSERT INTO mfcvr VALUES ('3 1  5  ',3,'1  ','5  ','EDIFACT UNOE 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOE?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOE',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 1  6  ')
INSERT INTO mfcvr VALUES ('3 1  6  ',3,'1  ','6  ','EDIFACT UNOF 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOF?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOF',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 1  7  ')
INSERT INTO mfcvr VALUES ('3 1  7  ',3,'1  ','7  ','EDIFACT UNOG 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOG?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOG',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 2  3  ')
INSERT INTO mfcvr VALUES ('3 2  3  ',3,'2  ','3  ','EDIFACT UNOC 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOC?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOC',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 2  4  ')
INSERT INTO mfcvr VALUES ('3 2  4  ',3,'2  ','4  ','EDIFACT UNOD 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOD?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOD',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 2  5  ')
INSERT INTO mfcvr VALUES ('3 2  5  ',3,'2  ','5  ','EDIFACT UNOE 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOE?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOE',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 2  6  ')
INSERT INTO mfcvr VALUES ('3 2  6  ',3,'2  ','6  ','EDIFACT UNOF 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOF?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOF',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 2  7  ')
INSERT INTO mfcvr VALUES ('3 2  7  ',3,'2  ','7  ','EDIFACT UNOG 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOG?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOG',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 3  3  ')
INSERT INTO mfcvr VALUES ('3 3  3  ',3,'3  ','3  ','EDIFACT UNOC 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOC?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOC',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 3  4  ')
INSERT INTO mfcvr VALUES ('3 3  4  ',3,'3  ','4  ','EDIFACT UNOD 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOD?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOD',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 3  5  ')
INSERT INTO mfcvr VALUES ('3 3  5  ',3,'3  ','5  ','EDIFACT UNOE 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOE?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOE',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 3  6  ')
INSERT INTO mfcvr VALUES ('3 3  6  ',3,'3  ','6  ','EDIFACT UNOF 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOF?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOF',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 3  7  ')
INSERT INTO mfcvr VALUES ('3 3  7  ',3,'3  ','7  ','EDIFACT UNOG 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOG?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOG',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00302 ')
INSERT INTO mfcvr VALUES ('5 00302 ',5,'003','02 ','X12-3020','.',0,3,'','-','(0)ISA','(84)00302',0,'ISA','IEA','GS','GE','ST','SE','',1,58,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111101111111111111111','         ?     ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00303 ')
INSERT INTO mfcvr VALUES ('5 00303 ',5,'003','03 ','X12-3030','.',0,3,'','-','(0)ISA','(84)00303',0,'ISA','IEA','GS','GE','ST','SE','',1,58,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111101111111111111111','         ?     ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00304 ')
INSERT INTO mfcvr VALUES ('5 00304 ',5,'003','04 ','X12-3040','.',0,3,'','-','(0)ISA','(84)00304',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00305 ')
INSERT INTO mfcvr VALUES ('5 00305 ',5,'003','05 ','X12-3050','.',0,3,'','-','(0)ISA','(84)00305',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00307 ')
INSERT INTO mfcvr VALUES ('5 00307 ',5,'003','07 ','X12-3070','.',0,3,'','-','(0)ISA','(84)00307',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00400 ')
INSERT INTO mfcvr VALUES ('5 00400 ',5,'004','00 ','X12-4000','.',0,3,'','-','(0)ISA','(84)00400',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00402 ')
INSERT INTO mfcvr VALUES ('5 00402 ',5,'004','02 ','X12-4020','.',0,3,'','-','(0)ISA','(84)00402',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00403 ')
INSERT INTO mfcvr VALUES ('5 00403 ',5,'004','03 ','X12-4030','.',0,3,'','-','(0)ISA','(84)00403',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00404 ')
INSERT INTO mfcvr VALUES ('5 00404 ',5,'004','04 ','X12-4040','.',0,3,'','-','(0)ISA','(84)00404',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '5 00405 ')
INSERT INTO mfcvr VALUES ('5 00405 ',5,'004','05 ','X12-4050','.',0,3,'','-','(0)ISA','(84)00405',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,NULL,0,0,'00',0,NULL)

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00302 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00302 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','02 ',0,17,'AN',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00302 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00302 Interchange Note Code','Interchange Note Code','003','02 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Acknowledgment Requested')
INSERT INTO elmnts VALUES (5,'003020Acknowledgment Requested','Acknowledgment Requested','003','020',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Application Receiver`s Code')
INSERT INTO elmnts VALUES (5,'003020Application Receiver`s Code','Application Receiver`s Code','003','020',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Application Sender`s Code')
INSERT INTO elmnts VALUES (5,'003020Application Sender`s Code','Application Sender`s Code','003','020',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Authorization Information')
INSERT INTO elmnts VALUES (5,'003020Authorization Information','Authorization Information','003','020',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Authorization Information Qualifier')
INSERT INTO elmnts VALUES (5,'003020Authorization Information Qualifier','Authorization Information Qualifier','003','020',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Date')
INSERT INTO elmnts VALUES (5,'003020Date','Date','003','020',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Functional Identifier Code')
INSERT INTO elmnts VALUES (5,'003020Functional Identifier Code','Functional Identifier Code','003','020',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Group Control Number')
INSERT INTO elmnts VALUES (5,'003020Group Control Number','Group Control Number','003','020',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Control Number')
INSERT INTO elmnts VALUES (5,'003020Interchange Control Number','Interchange Control Number','003','020',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Control Standards Ident')
INSERT INTO elmnts VALUES (5,'003020Interchange Control Standards Ident','Interchange Control Standards Ident','003','020',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Control Version Number')
INSERT INTO elmnts VALUES (5,'003020Interchange Control Version Number','Interchange Control Version Number','003','020',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Date')
INSERT INTO elmnts VALUES (5,'003020Interchange Date','Interchange Date','003','020',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange ID Qualifier')
INSERT INTO elmnts VALUES (5,'003020Interchange ID Qualifier','Interchange ID Qualifier','003','020',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Receiver ID')
INSERT INTO elmnts VALUES (5,'003020Interchange Receiver ID','Interchange Receiver ID','003','020',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Sender ID')
INSERT INTO elmnts VALUES (5,'003020Interchange Sender ID','Interchange Sender ID','003','020',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Interchange Time')
INSERT INTO elmnts VALUES (5,'003020Interchange Time','Interchange Time','003','020',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Number of Included Functional Group')
INSERT INTO elmnts VALUES (5,'003020Number of Included Functional Group','Number of Included Functional Group','003','020',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Number of Included Segments')
INSERT INTO elmnts VALUES (5,'003020Number of Included Segments','Number of Included Segments','003','020',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Number of Transaction Sets Included')
INSERT INTO elmnts VALUES (5,'003020Number of Transaction Sets Included','Number of Transaction Sets Included','003','020',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Responsible Agency Code')
INSERT INTO elmnts VALUES (5,'003020Responsible Agency Code','Responsible Agency Code','003','020',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Security Information')
INSERT INTO elmnts VALUES (5,'003020Security Information','Security Information','003','020',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Security Information Qualifier')
INSERT INTO elmnts VALUES (5,'003020Security Information Qualifier','Security Information Qualifier','003','020',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Subelement Separator')
INSERT INTO elmnts VALUES (5,'003020Subelement Separator','Subelement Separator','003','020',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Test Indicator')
INSERT INTO elmnts VALUES (5,'003020Test Indicator','Test Indicator','003','020',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Time')
INSERT INTO elmnts VALUES (5,'003020Time','Time','003','020',0,337,'AN',6,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Transaction Set Control Number')
INSERT INTO elmnts VALUES (5,'003020Transaction Set Control Number','Transaction Set Control Number','003','020',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Transaction Set Identifier Code')
INSERT INTO elmnts VALUES (5,'003020Transaction Set Identifier Code','Transaction Set Identifier Code','003','020',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003020Version / Release / Industry Identi')
INSERT INTO elmnts VALUES (5,'003020Version / Release / Industry Identi','Version / Release / Industry Identi','003','020',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00303 Acknowledgment requested','Acknowledgment requested','003','03 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Application receivers code')
INSERT INTO elmnts VALUES (5,'00303 Application receivers code','Application receivers code','003','03 ',0,124,'A',12,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Application senders code')
INSERT INTO elmnts VALUES (5,'00303 Application senders code','Application senders code','003','03 ',0,142,'A',12,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Authorization information')
INSERT INTO elmnts VALUES (5,'00303 Authorization information','Authorization information','003','03 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00303 Authorization information qualifier','Authorization information qualifier','003','03 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Functional id code')
INSERT INTO elmnts VALUES (5,'00303 Functional id code','Functional id code','003','03 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Group control number')
INSERT INTO elmnts VALUES (5,'00303 Group control number','Group control number','003','03 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00303 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','03 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange control number')
INSERT INTO elmnts VALUES (5,'00303 Interchange control number','Interchange control number','003','03 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00303 Interchange control standards id','Interchange control standards id','003','03 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00303 Interchange control version number','Interchange control version number','003','03 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange date')
INSERT INTO elmnts VALUES (5,'00303 Interchange date','Interchange date','003','03 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00303 Interchange id qualifier','Interchange id qualifier','003','03 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00303 Interchange Note Code','Interchange Note Code','003','03 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00303 Interchange receiver id','Interchange receiver id','003','03 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00303 Interchange sender id','Interchange sender id','003','03 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Interchange time')
INSERT INTO elmnts VALUES (5,'00303 Interchange time','Interchange time','003','03 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00303 Number of included functional group','Number of included functional group','003','03 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Number of included segments')
INSERT INTO elmnts VALUES (5,'00303 Number of included segments','Number of included segments','003','03 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00303 Number of transaction sets included','Number of transaction sets included','003','03 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00303 Responsible agency code','Responsible agency code','003','03 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Security information')
INSERT INTO elmnts VALUES (5,'00303 Security information','Security information','003','03 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00303 Security information qualifier','Security information qualifier','003','03 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00303 Sub-element separator','Sub-element separator','003','03 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Test indicator')
INSERT INTO elmnts VALUES (5,'00303 Test indicator','Test indicator','003','03 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00303 Transaction set control number','Transaction set control number','003','03 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00303 Transaction set identifier code','Transaction set identifier code','003','03 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00303 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00303 Version/release/industry id code','Version/release/industry id code','003','03 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003030Date')
INSERT INTO elmnts VALUES (5,'003030Date','Date','003','030',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '003030Time')
INSERT INTO elmnts VALUES (5,'003030Time','Time','003','030',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00304 Acknowledgment requested','Acknowledgment requested','003','04 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Application receivers code')
INSERT INTO elmnts VALUES (5,'00304 Application receivers code','Application receivers code','003','04 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Application senders code')
INSERT INTO elmnts VALUES (5,'00304 Application senders code','Application senders code','003','04 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Authorization information')
INSERT INTO elmnts VALUES (5,'00304 Authorization information','Authorization information','003','04 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00304 Authorization information qualifier','Authorization information qualifier','003','04 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Date')
INSERT INTO elmnts VALUES (5,'00304 Date','Date','003','04 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Functional id code')
INSERT INTO elmnts VALUES (5,'00304 Functional id code','Functional id code','003','04 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Group control number')
INSERT INTO elmnts VALUES (5,'00304 Group control number','Group control number','003','04 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00304 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','04 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange control number')
INSERT INTO elmnts VALUES (5,'00304 Interchange control number','Interchange control number','003','04 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00304 Interchange control standards id','Interchange control standards id','003','04 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00304 Interchange control version number','Interchange control version number','003','04 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange date')
INSERT INTO elmnts VALUES (5,'00304 Interchange date','Interchange date','003','04 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00304 Interchange id qualifier','Interchange id qualifier','003','04 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00304 Interchange Note Code','Interchange Note Code','003','04 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00304 Interchange receiver id','Interchange receiver id','003','04 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00304 Interchange sender id','Interchange sender id','003','04 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Interchange time')
INSERT INTO elmnts VALUES (5,'00304 Interchange time','Interchange time','003','04 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00304 Number of included functional group','Number of included functional group','003','04 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Number of included segments')
INSERT INTO elmnts VALUES (5,'00304 Number of included segments','Number of included segments','003','04 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00304 Number of transaction sets included','Number of transaction sets included','003','04 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00304 Responsible agency code','Responsible agency code','003','04 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Security information')
INSERT INTO elmnts VALUES (5,'00304 Security information','Security information','003','04 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00304 Security information qualifier','Security information qualifier','003','04 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00304 Sub-element separator','Sub-element separator','003','04 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Test indicator')
INSERT INTO elmnts VALUES (5,'00304 Test indicator','Test indicator','003','04 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Time')
INSERT INTO elmnts VALUES (5,'00304 Time','Time','003','04 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00304 Transaction set control number','Transaction set control number','003','04 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00304 Transaction set identifier code','Transaction set identifier code','003','04 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00304 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00304 Version/release/industry id code','Version/release/industry id code','003','04 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00305 Acknowledgment requested','Acknowledgment requested','003','05 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Application receivers code')
INSERT INTO elmnts VALUES (5,'00305 Application receivers code','Application receivers code','003','05 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Application senders code')
INSERT INTO elmnts VALUES (5,'00305 Application senders code','Application senders code','003','05 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Authorization information')
INSERT INTO elmnts VALUES (5,'00305 Authorization information','Authorization information','003','05 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00305 Authorization information qualifier','Authorization information qualifier','003','05 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Date')
INSERT INTO elmnts VALUES (5,'00305 Date','Date','003','05 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Functional id code')
INSERT INTO elmnts VALUES (5,'00305 Functional id code','Functional id code','003','05 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Group control number')
INSERT INTO elmnts VALUES (5,'00305 Group control number','Group control number','003','05 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00305 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','05 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange control number')
INSERT INTO elmnts VALUES (5,'00305 Interchange control number','Interchange control number','003','05 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00305 Interchange control standards id','Interchange control standards id','003','05 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00305 Interchange control version number','Interchange control version number','003','05 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange date')
INSERT INTO elmnts VALUES (5,'00305 Interchange date','Interchange date','003','05 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00305 Interchange id qualifier','Interchange id qualifier','003','05 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00305 Interchange Note Code','Interchange Note Code','003','05 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00305 Interchange receiver id','Interchange receiver id','003','05 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00305 Interchange sender id','Interchange sender id','003','05 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Interchange time')
INSERT INTO elmnts VALUES (5,'00305 Interchange time','Interchange time','003','05 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00305 Number of included functional group','Number of included functional group','003','05 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Number of included segments')
INSERT INTO elmnts VALUES (5,'00305 Number of included segments','Number of included segments','003','05 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00305 Number of transaction sets included','Number of transaction sets included','003','05 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00305 Responsible agency code','Responsible agency code','003','05 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Security information')
INSERT INTO elmnts VALUES (5,'00305 Security information','Security information','003','05 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00305 Security information qualifier','Security information qualifier','003','05 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00305 Sub-element separator','Sub-element separator','003','05 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Test indicator')
INSERT INTO elmnts VALUES (5,'00305 Test indicator','Test indicator','003','05 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Time')
INSERT INTO elmnts VALUES (5,'00305 Time','Time','003','05 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00305 Transaction set control number','Transaction set control number','003','05 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00305 Transaction set identifier code','Transaction set identifier code','003','05 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00305 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00305 Version/release/industry id code','Version/release/industry id code','003','05 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00307 Acknowledgment requested','Acknowledgment requested','003','07 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Application receivers code')
INSERT INTO elmnts VALUES (5,'00307 Application receivers code','Application receivers code','003','07 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Application senders code')
INSERT INTO elmnts VALUES (5,'00307 Application senders code','Application senders code','003','07 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Authorization information')
INSERT INTO elmnts VALUES (5,'00307 Authorization information','Authorization information','003','07 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00307 Authorization information qualifier','Authorization information qualifier','003','07 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Date')
INSERT INTO elmnts VALUES (5,'00307 Date','Date','003','07 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Functional id code')
INSERT INTO elmnts VALUES (5,'00307 Functional id code','Functional id code','003','07 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Group control number')
INSERT INTO elmnts VALUES (5,'00307 Group control number','Group control number','003','07 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00307 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','07 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange control number')
INSERT INTO elmnts VALUES (5,'00307 Interchange control number','Interchange control number','003','07 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00307 Interchange control standards id','Interchange control standards id','003','07 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00307 Interchange control version number','Interchange control version number','003','07 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange date')
INSERT INTO elmnts VALUES (5,'00307 Interchange date','Interchange date','003','07 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00307 Interchange id qualifier','Interchange id qualifier','003','07 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00307 Interchange Note Code','Interchange Note Code','003','07 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00307 Interchange receiver id','Interchange receiver id','003','07 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00307 Interchange sender id','Interchange sender id','003','07 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Interchange time')
INSERT INTO elmnts VALUES (5,'00307 Interchange time','Interchange time','003','07 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00307 Number of included functional group','Number of included functional group','003','07 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Number of included segments')
INSERT INTO elmnts VALUES (5,'00307 Number of included segments','Number of included segments','003','07 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00307 Number of transaction sets included','Number of transaction sets included','003','07 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00307 Responsible agency code','Responsible agency code','003','07 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Security information')
INSERT INTO elmnts VALUES (5,'00307 Security information','Security information','003','07 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00307 Security information qualifier','Security information qualifier','003','07 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00307 Sub-element separator','Sub-element separator','003','07 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Test indicator')
INSERT INTO elmnts VALUES (5,'00307 Test indicator','Test indicator','003','07 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Time')
INSERT INTO elmnts VALUES (5,'00307 Time','Time','003','07 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00307 Transaction set control number','Transaction set control number','003','07 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00307 Transaction set identifier code','Transaction set identifier code','003','07 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00307 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00307 Version/release/industry id code','Version/release/industry id code','003','07 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00400 Acknowledgment requested','Acknowledgment requested','004','00 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Application receivers code')
INSERT INTO elmnts VALUES (5,'00400 Application receivers code','Application receivers code','004','00 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Application senders code')
INSERT INTO elmnts VALUES (5,'00400 Application senders code','Application senders code','004','00 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Authorization information')
INSERT INTO elmnts VALUES (5,'00400 Authorization information','Authorization information','004','00 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00400 Authorization information qualifier','Authorization information qualifier','004','00 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Date')
INSERT INTO elmnts VALUES (5,'00400 Date','Date','004','00 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Functional id code')
INSERT INTO elmnts VALUES (5,'00400 Functional id code','Functional id code','004','00 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Group control number')
INSERT INTO elmnts VALUES (5,'00400 Group control number','Group control number','004','00 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00400 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','00 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange control number')
INSERT INTO elmnts VALUES (5,'00400 Interchange control number','Interchange control number','004','00 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00400 Interchange control standards id','Interchange control standards id','004','00 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00400 Interchange control version number','Interchange control version number','004','00 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange date')
INSERT INTO elmnts VALUES (5,'00400 Interchange date','Interchange date','004','00 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00400 Interchange id qualifier','Interchange id qualifier','004','00 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00400 Interchange Note Code','Interchange Note Code','004','00 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00400 Interchange receiver id','Interchange receiver id','004','00 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00400 Interchange sender id','Interchange sender id','004','00 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Interchange time')
INSERT INTO elmnts VALUES (5,'00400 Interchange time','Interchange time','004','00 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00400 Number of included functional group','Number of included functional group','004','00 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Number of included segments')
INSERT INTO elmnts VALUES (5,'00400 Number of included segments','Number of included segments','004','00 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00400 Number of transaction sets included','Number of transaction sets included','004','00 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00400 Responsible agency code','Responsible agency code','004','00 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Security information')
INSERT INTO elmnts VALUES (5,'00400 Security information','Security information','004','00 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00400 Security information qualifier','Security information qualifier','004','00 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00400 Sub-element separator','Sub-element separator','004','00 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Test indicator')
INSERT INTO elmnts VALUES (5,'00400 Test indicator','Test indicator','004','00 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Time')
INSERT INTO elmnts VALUES (5,'00400 Time','Time','004','00 ',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00400 Transaction set control number','Transaction set control number','004','00 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00400 Transaction set identifier code','Transaction set identifier code','004','00 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00400 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00400 Version/release/industry id code','Version/release/industry id code','004','00 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00402 Acknowledgment requested','Acknowledgment requested','004','02 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Application receivers code')
INSERT INTO elmnts VALUES (5,'00402 Application receivers code','Application receivers code','004','02 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Application senders code')
INSERT INTO elmnts VALUES (5,'00402 Application senders code','Application senders code','004','02 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Authorization information')
INSERT INTO elmnts VALUES (5,'00402 Authorization information','Authorization information','004','02 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00402 Authorization information qualifier','Authorization information qualifier','004','02 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Date')
INSERT INTO elmnts VALUES (5,'00402 Date','Date','004','02 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Functional id code')
INSERT INTO elmnts VALUES (5,'00402 Functional id code','Functional id code','004','02 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Group control number')
INSERT INTO elmnts VALUES (5,'00402 Group control number','Group control number','004','02 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Implementation Convention Reference')
INSERT INTO elmnts VALUES (5,'00402 Implementation Convention Reference','Implementation Convention Reference','004','02 ',0,1705,'A',35,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00402 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','02 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange control number')
INSERT INTO elmnts VALUES (5,'00402 Interchange control number','Interchange control number','004','02 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00402 Interchange control standards id','Interchange control standards id','004','02 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00402 Interchange control version number','Interchange control version number','004','02 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange date')
INSERT INTO elmnts VALUES (5,'00402 Interchange date','Interchange date','004','02 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00402 Interchange id qualifier','Interchange id qualifier','004','02 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00402 Interchange Note Code','Interchange Note Code','004','02 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00402 Interchange receiver id','Interchange receiver id','004','02 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00402 Interchange sender id','Interchange sender id','004','02 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Interchange time')
INSERT INTO elmnts VALUES (5,'00402 Interchange time','Interchange time','004','02 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00402 Number of included functional group','Number of included functional group','004','02 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Number of included segments')
INSERT INTO elmnts VALUES (5,'00402 Number of included segments','Number of included segments','004','02 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00402 Number of transaction sets included','Number of transaction sets included','004','02 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00402 Responsible agency code','Responsible agency code','004','02 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Security information')
INSERT INTO elmnts VALUES (5,'00402 Security information','Security information','004','02 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00402 Security information qualifier','Security information qualifier','004','02 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00402 Sub-element separator','Sub-element separator','004','02 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Test indicator')
INSERT INTO elmnts VALUES (5,'00402 Test indicator','Test indicator','004','02 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Time')
INSERT INTO elmnts VALUES (5,'00402 Time','Time','004','02 ',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00402 Transaction set control number','Transaction set control number','004','02 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00402 Transaction set identifier code','Transaction set identifier code','004','02 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00402 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00402 Version/release/industry id code','Version/release/industry id code','004','02 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00403 Acknowledgment requested','Acknowledgment requested','004','03 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Application receivers code')
INSERT INTO elmnts VALUES (5,'00403 Application receivers code','Application receivers code','004','03 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Application senders code')
INSERT INTO elmnts VALUES (5,'00403 Application senders code','Application senders code','004','03 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Authorization information')
INSERT INTO elmnts VALUES (5,'00403 Authorization information','Authorization information','004','03 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00403 Authorization information qualifier','Authorization information qualifier','004','03 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Date')
INSERT INTO elmnts VALUES (5,'00403 Date','Date','004','03 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Functional id code')
INSERT INTO elmnts VALUES (5,'00403 Functional id code','Functional id code','004','03 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Group control number')
INSERT INTO elmnts VALUES (5,'00403 Group control number','Group control number','004','03 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Implementation Convention Reference')
INSERT INTO elmnts VALUES (5,'00403 Implementation Convention Reference','Implementation Convention Reference','004','03 ',0,1705,'A',35,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00403 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','03 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange control number')
INSERT INTO elmnts VALUES (5,'00403 Interchange control number','Interchange control number','004','03 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00403 Interchange control standards id','Interchange control standards id','004','03 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00403 Interchange control version number','Interchange control version number','004','03 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange date')
INSERT INTO elmnts VALUES (5,'00403 Interchange date','Interchange date','004','03 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00403 Interchange id qualifier','Interchange id qualifier','004','03 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00403 Interchange Note Code','Interchange Note Code','004','03 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00403 Interchange receiver id','Interchange receiver id','004','03 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00403 Interchange sender id','Interchange sender id','004','03 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Interchange time')
INSERT INTO elmnts VALUES (5,'00403 Interchange time','Interchange time','004','03 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00403 Number of included functional group','Number of included functional group','004','03 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Number of included segments')
INSERT INTO elmnts VALUES (5,'00403 Number of included segments','Number of included segments','004','03 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00403 Number of transaction sets included','Number of transaction sets included','004','03 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00403 Responsible agency code','Responsible agency code','004','03 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Security information')
INSERT INTO elmnts VALUES (5,'00403 Security information','Security information','004','03 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00403 Security information qualifier','Security information qualifier','004','03 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00403 Sub-element separator','Sub-element separator','004','03 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Test indicator')
INSERT INTO elmnts VALUES (5,'00403 Test indicator','Test indicator','004','03 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Time')
INSERT INTO elmnts VALUES (5,'00403 Time','Time','004','03 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00403 Transaction set control number','Transaction set control number','004','03 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00403 Transaction set identifier code','Transaction set identifier code','004','03 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00403 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00403 Version/release/industry id code','Version/release/industry id code','004','03 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00404 Acknowledgment requested','Acknowledgment requested','004','04 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Application receivers code')
INSERT INTO elmnts VALUES (5,'00404 Application receivers code','Application receivers code','004','04 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Application senders code')
INSERT INTO elmnts VALUES (5,'00404 Application senders code','Application senders code','004','04 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Authorization information')
INSERT INTO elmnts VALUES (5,'00404 Authorization information','Authorization information','004','04 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00404 Authorization information qualifier','Authorization information qualifier','004','04 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Date')
INSERT INTO elmnts VALUES (5,'00404 Date','Date','004','04 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Functional id code')
INSERT INTO elmnts VALUES (5,'00404 Functional id code','Functional id code','004','04 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Group control number')
INSERT INTO elmnts VALUES (5,'00404 Group control number','Group control number','004','04 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00404 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','04 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange control number')
INSERT INTO elmnts VALUES (5,'00404 Interchange control number','Interchange control number','004','04 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00404 Interchange control standards id','Interchange control standards id','004','04 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00404 Interchange control version number','Interchange control version number','004','04 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange date')
INSERT INTO elmnts VALUES (5,'00404 Interchange date','Interchange date','004','04 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00404 Interchange id qualifier','Interchange id qualifier','004','04 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00404 Interchange Note Code','Interchange Note Code','004','04 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00404 Interchange receiver id','Interchange receiver id','004','04 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00404 Interchange sender id','Interchange sender id','004','04 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Interchange time')
INSERT INTO elmnts VALUES (5,'00404 Interchange time','Interchange time','004','04 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00404 Number of included functional group','Number of included functional group','004','04 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Number of included segments')
INSERT INTO elmnts VALUES (5,'00404 Number of included segments','Number of included segments','004','04 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00404 Number of transaction sets included','Number of transaction sets included','004','04 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00404 Responsible agency code','Responsible agency code','004','04 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Security information')
INSERT INTO elmnts VALUES (5,'00404 Security information','Security information','004','04 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00404 Security information qualifier','Security information qualifier','004','04 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00404 Sub-element separator','Sub-element separator','004','04 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Test indicator')
INSERT INTO elmnts VALUES (5,'00404 Test indicator','Test indicator','004','04 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Time')
INSERT INTO elmnts VALUES (5,'00404 Time','Time','004','04 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00404 Transaction set control number','Transaction set control number','004','04 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00404 Transaction set identifier code','Transaction set identifier code','004','04 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00404 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00404 Version/release/industry id code','Version/release/industry id code','004','04 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Acknowledgment requested')
INSERT INTO elmnts VALUES (5,'00405 Acknowledgment requested','Acknowledgment requested','004','05 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Application receivers code')
INSERT INTO elmnts VALUES (5,'00405 Application receivers code','Application receivers code','004','05 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Application senders code')
INSERT INTO elmnts VALUES (5,'00405 Application senders code','Application senders code','004','05 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Authorization information')
INSERT INTO elmnts VALUES (5,'00405 Authorization information','Authorization information','004','05 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Authorization information qualifier')
INSERT INTO elmnts VALUES (5,'00405 Authorization information qualifier','Authorization information qualifier','004','05 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Date')
INSERT INTO elmnts VALUES (5,'00405 Date','Date','004','05 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Functional id code')
INSERT INTO elmnts VALUES (5,'00405 Functional id code','Functional id code','004','05 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Group control number')
INSERT INTO elmnts VALUES (5,'00405 Group control number','Group control number','004','05 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Implementation Convention Reference')
INSERT INTO elmnts VALUES (5,'00405 Implementation Convention Reference','Implementation Convention Reference','004','05 ',0,1705,'A',35,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange Acknowledgement Code')
INSERT INTO elmnts VALUES (5,'00405 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','05 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange control number')
INSERT INTO elmnts VALUES (5,'00405 Interchange control number','Interchange control number','004','05 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange control standards id')
INSERT INTO elmnts VALUES (5,'00405 Interchange control standards id','Interchange control standards id','004','05 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange control version number')
INSERT INTO elmnts VALUES (5,'00405 Interchange control version number','Interchange control version number','004','05 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange date')
INSERT INTO elmnts VALUES (5,'00405 Interchange date','Interchange date','004','05 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange id qualifier')
INSERT INTO elmnts VALUES (5,'00405 Interchange id qualifier','Interchange id qualifier','004','05 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange Note Code')
INSERT INTO elmnts VALUES (5,'00405 Interchange Note Code','Interchange Note Code','004','05 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange receiver id')
INSERT INTO elmnts VALUES (5,'00405 Interchange receiver id','Interchange receiver id','004','05 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange sender id')
INSERT INTO elmnts VALUES (5,'00405 Interchange sender id','Interchange sender id','004','05 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Interchange time')
INSERT INTO elmnts VALUES (5,'00405 Interchange time','Interchange time','004','05 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Number of included functional group')
INSERT INTO elmnts VALUES (5,'00405 Number of included functional group','Number of included functional group','004','05 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Number of included segments')
INSERT INTO elmnts VALUES (5,'00405 Number of included segments','Number of included segments','004','05 ',0,96,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Number of transaction sets included')
INSERT INTO elmnts VALUES (5,'00405 Number of transaction sets included','Number of transaction sets included','004','05 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Responsible agency code')
INSERT INTO elmnts VALUES (5,'00405 Responsible agency code','Responsible agency code','004','05 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Security information')
INSERT INTO elmnts VALUES (5,'00405 Security information','Security information','004','05 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Security information qualifier')
INSERT INTO elmnts VALUES (5,'00405 Security information qualifier','Security information qualifier','004','05 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Sub-element separator')
INSERT INTO elmnts VALUES (5,'00405 Sub-element separator','Sub-element separator','004','05 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Test indicator')
INSERT INTO elmnts VALUES (5,'00405 Test indicator','Test indicator','004','05 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Time')
INSERT INTO elmnts VALUES (5,'00405 Time','Time','004','05 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Transaction set control number')
INSERT INTO elmnts VALUES (5,'00405 Transaction set control number','Transaction set control number','004','05 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Transaction set identifier code')
INSERT INTO elmnts VALUES (5,'00405 Transaction set identifier code','Transaction set identifier code','004','05 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc = 5 AND envr = '00405 Version/release/industry id code')
INSERT INTO elmnts VALUES (5,'00405 Version/release/industry id code','Version/release/industry id code','004','05 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00302 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00302 TA1 Interchange Acknowledgement','003','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '003020Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','003020Functional Group Header','003','020',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '003020Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','003020Functional Group Trailer','003','020',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '003020Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','003020Interchange Control Header','003','020',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '003020Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','003020Interchange Control Trailer','003','020',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '003020Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','003020Transaction Set Header','003','020',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '003020Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','003020Transaction Set Trailer','003','020',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00303 Functional Group Header','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00303 Functional Group Trailer','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00303 Interchange Control Header','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00303 Interchange Control Trailer','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00303 TA1 Interchange Acknowledgement','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00303 Transaction Set Header','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00303 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00303 Transaction Set Trailer','003','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00304 Functional Group Header','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00304 Functional Group Trailer','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00304 Interchange Control Header','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00304 Interchange Control Trailer','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00304 TA1 Interchange Acknowledgement','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00304 Transaction Set Header','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00304 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00304 Transaction Set Trailer','003','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00305 Functional Group Header','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00305 Functional Group Trailer','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00305 Interchange Control Header','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00305 Interchange Control Trailer','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00305 TA1 Interchange Acknowledgement','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00305 Transaction Set Header','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00305 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00305 Transaction Set Trailer','003','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00307 Functional Group Header','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00307 Functional Group Trailer','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00307 Interchange Control Header','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00307 Interchange Control Trailer','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00307 TA1 Interchange Acknowledgement','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00307 Transaction Set Header','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00307 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00307 Transaction Set Trailer','003','07 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00400 Functional Group Header','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00400 Functional Group Trailer','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00400 Interchange Control Header','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00400 Interchange Control Trailer','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00400 TA1 Interchange Acknowledgement','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00400 Transaction Set Header','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00400 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00400 Transaction Set Trailer','004','00 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00402 Functional Group Header','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00402 Functional Group Trailer','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00402 Interchange Control Header','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00402 Interchange Control Trailer','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00402 TA1 Interchange Acknowledgement','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00402 Transaction Set Header','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00402 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00402 Transaction Set Trailer','004','02 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00403 Functional Group Header','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00403 Functional Group Trailer','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00403 Interchange Control Header','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00403 Interchange Control Trailer','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00403 TA1 Interchange Acknowledgement','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00403 Transaction Set Header','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00403 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00403 Transaction Set Trailer','004','03 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00404 Functional Group Header','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00404 Functional Group Trailer','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00404 Interchange Control Header','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00404 Interchange Control Trailer','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00404 TA1 Interchange Acknowledgement','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00404 Transaction Set Header','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00404 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00404 Transaction Set Trailer','004','04 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 Functional Group Header')
INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00405 Functional Group Header','004','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 Functional Group Trailer')
INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00405 Functional Group Trailer','004','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 Interchange Control Header')
INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00405 Interchange Control Header','004','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 Interchange Control Trailer')
INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00405 Interchange Control Trailer','004','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 TA1 Interchange Acknowledgement')
INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00405 TA1 Interchange Acknowledgement','004','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 Transaction Set Header')
INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00405 Transaction Set Header','004','05 ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 5 AND snvr = '00405 Transaction Set Trailer')
INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00405 Transaction Set Trailer','004','05 ',NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00302 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',1,4,'00302 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00302 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',2,1,'003020Interchange Control Number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00302 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',3,2,'003020Interchange Date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00302 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',4,3,'003020Interchange Time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00302 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',5,5,'00302 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',1,1,'003020Functional Identifier Code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',2,2,'003020Application Sender`s Code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',3,3,'003020Application Receiver`s Code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',4,4,'003020Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',5,5,'003020Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',6,6,'003020Group Control Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',7,7,'003020Responsible Agency Code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '003020Functional Group Header')
INSERT INTO segcon VALUES (5,'003020Functional Group Header',8,8,'003020Version / Release / Industry Identi',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '003020Functional Group Trailer')
INSERT INTO segcon VALUES (5,'003020Functional Group Trailer',1,1,'003020Number of Transaction Sets Included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '003020Functional Group Trailer')
INSERT INTO segcon VALUES (5,'003020Functional Group Trailer',2,2,'003020Group Control Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',1,1,'003020Authorization Information Qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',2,2,'003020Authorization Information',0,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',3,3,'003020Security Information Qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',4,4,'003020Security Information',0,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',5,5,'003020Interchange ID Qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',6,6,'003020Interchange Sender ID',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',7,7,'003020Interchange ID Qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',8,8,'003020Interchange Receiver ID',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',9,9,'003020Interchange Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',10,10,'003020Interchange Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',11,11,'003020Interchange Control Standards Ident',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',12,12,'003020Interchange Control Version Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',13,13,'003020Interchange Control Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',14,14,'003020Acknowledgment Requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',15,15,'003020Test Indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '003020Interchange Control Header')
INSERT INTO segcon VALUES (5,'003020Interchange Control Header',16,16,'003020Subelement Separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '003020Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'003020Interchange Control Trailer',1,1,'003020Number of Included Functional Group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '003020Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'003020Interchange Control Trailer',2,2,'003020Interchange Control Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '003020Transaction Set Header')
INSERT INTO segcon VALUES (5,'003020Transaction Set Header',1,1,'003020Transaction Set Identifier Code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '003020Transaction Set Header')
INSERT INTO segcon VALUES (5,'003020Transaction Set Header',2,2,'003020Transaction Set Control Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '003020Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'003020Transaction Set Trailer',1,1,'003020Number of Included Segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '003020Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'003020Transaction Set Trailer',2,2,'003020Transaction Set Control Number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',1,1,'00303 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',2,2,'00303 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',3,3,'00303 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',6,6,'00303 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',7,7,'00303 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',8,8,'00303 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',9,4,'003030Date',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00303 Functional Group Header')
INSERT INTO segcon VALUES (5,'00303 Functional Group Header',10,5,'003030Time',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00303 Functional Group Trailer',1,1,'00303 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00303 Functional Group Trailer',2,2,'00303 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',1,1,'00303 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',2,2,'00303 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',3,3,'00303 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',4,4,'00303 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',5,5,'00303 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',6,6,'00303 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',7,7,'00303 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',8,8,'00303 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',9,9,'00303 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',10,10,'00303 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',11,11,'00303 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',12,12,'00303 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',13,13,'00303 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',14,14,'00303 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',15,15,'00303 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00303 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',16,16,'00303 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Trailer',1,1,'00303 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00303 Interchange Control Trailer',2,2,'00303 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',1,1,'00303 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',2,2,'00303 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00303 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',4,4,'00303 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00303 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',5,5,'00303 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00303 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',6,3,'00303 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00303 Transaction Set Header',1,1,'00303 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00303 Transaction Set Header',2,2,'00303 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00303 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00303 Transaction Set Trailer',1,1,'00303 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00303 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00303 Transaction Set Trailer',2,2,'00303 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',1,1,'00304 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',2,2,'00304 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',3,3,'00304 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',4,4,'00304 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',5,5,'00304 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',6,6,'00304 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',7,7,'00304 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00304 Functional Group Header')
INSERT INTO segcon VALUES (5,'00304 Functional Group Header',8,8,'00304 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00304 Functional Group Trailer',1,1,'00304 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00304 Functional Group Trailer',2,2,'00304 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',1,1,'00304 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',2,2,'00304 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',3,3,'00304 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',4,4,'00304 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',5,5,'00304 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',6,6,'00304 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',7,7,'00304 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',8,8,'00304 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',9,9,'00304 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',10,10,'00304 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',11,11,'00304 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',12,12,'00304 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',13,13,'00304 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',14,14,'00304 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',15,15,'00304 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00304 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',16,16,'00304 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Trailer',1,1,'00304 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00304 Interchange Control Trailer',2,2,'00304 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',1,1,'00304 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',2,2,'00304 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00304 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',4,4,'00304 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00304 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',5,5,'00304 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00304 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',6,3,'00304 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00304 Transaction Set Header',1,1,'00304 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00304 Transaction Set Header',2,2,'00304 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00304 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00304 Transaction Set Trailer',1,1,'00304 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00304 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00304 Transaction Set Trailer',2,2,'00304 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',1,1,'00305 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',2,2,'00305 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',3,3,'00305 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',4,4,'00305 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',5,5,'00305 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',6,6,'00305 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',7,7,'00305 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00305 Functional Group Header')
INSERT INTO segcon VALUES (5,'00305 Functional Group Header',8,8,'00305 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00305 Functional Group Trailer',1,1,'00305 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00305 Functional Group Trailer',2,2,'00305 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',1,1,'00305 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',2,2,'00305 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',3,3,'00305 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',4,4,'00305 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',5,5,'00305 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',6,6,'00305 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',7,7,'00305 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',8,8,'00305 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',9,9,'00305 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',10,10,'00305 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',11,11,'00305 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',12,12,'00305 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',13,13,'00305 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',14,14,'00305 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',15,15,'00305 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00305 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',16,16,'00305 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Trailer',1,1,'00305 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00305 Interchange Control Trailer',2,2,'00305 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',1,1,'00305 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',2,2,'00305 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00305 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',4,4,'00305 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00305 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',5,5,'00305 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00305 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',6,3,'00305 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00305 Transaction Set Header',1,1,'00305 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00305 Transaction Set Header',2,2,'00305 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00305 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00305 Transaction Set Trailer',1,1,'00305 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00305 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00305 Transaction Set Trailer',2,2,'00305 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',1,1,'00307 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',2,2,'00307 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',3,3,'00307 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',4,4,'00307 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',5,5,'00307 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',6,6,'00307 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',7,7,'00307 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00307 Functional Group Header')
INSERT INTO segcon VALUES (5,'00307 Functional Group Header',8,8,'00307 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00307 Functional Group Trailer',1,1,'00307 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00307 Functional Group Trailer',2,2,'00307 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',1,1,'00307 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',2,2,'00307 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',3,3,'00307 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',4,4,'00307 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',5,5,'00307 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',6,6,'00307 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',7,7,'00307 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',8,8,'00307 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',9,9,'00307 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',10,10,'00307 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',11,11,'00307 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',12,12,'00307 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',13,13,'00307 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',14,14,'00307 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',15,15,'00307 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00307 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',16,16,'00307 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Trailer',1,1,'00307 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00307 Interchange Control Trailer',2,2,'00307 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',1,1,'00307 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',2,2,'00307 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00307 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',4,4,'00307 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00307 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',5,5,'00307 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00307 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',6,3,'00307 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00307 Transaction Set Header',1,1,'00307 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00307 Transaction Set Header',2,2,'00307 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00307 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00307 Transaction Set Trailer',1,1,'00307 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00307 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00307 Transaction Set Trailer',2,2,'00307 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',1,1,'00400 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',2,2,'00400 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',3,3,'00400 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',4,4,'00400 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',5,5,'00400 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',6,6,'00400 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',7,7,'00400 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00400 Functional Group Header')
INSERT INTO segcon VALUES (5,'00400 Functional Group Header',8,8,'00400 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00400 Functional Group Trailer',1,1,'00400 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00400 Functional Group Trailer',2,2,'00400 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',1,1,'00400 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',2,2,'00400 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',3,3,'00400 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',4,4,'00400 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',5,5,'00400 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',6,6,'00400 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',7,7,'00400 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',8,8,'00400 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',9,9,'00400 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',10,10,'00400 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',11,11,'00400 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',12,12,'00400 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',13,13,'00400 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',14,14,'00400 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',15,15,'00400 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00400 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',16,16,'00400 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Trailer',1,1,'00400 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00400 Interchange Control Trailer',2,2,'00400 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',1,1,'00400 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',2,2,'00400 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00400 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',6,3,'00400 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00400 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',7,4,'00400 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00400 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',8,5,'00400 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00400 Transaction Set Header',1,1,'00400 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00400 Transaction Set Header',2,2,'00400 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00400 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00400 Transaction Set Trailer',1,1,'00400 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00400 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00400 Transaction Set Trailer',2,2,'00400 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',1,1,'00402 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',2,2,'00402 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',3,3,'00402 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',4,4,'00402 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',5,5,'00402 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',6,6,'00402 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',7,7,'00402 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00402 Functional Group Header')
INSERT INTO segcon VALUES (5,'00402 Functional Group Header',8,8,'00402 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00402 Functional Group Trailer',1,1,'00402 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00402 Functional Group Trailer',2,2,'00402 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',1,1,'00402 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',2,2,'00402 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',3,3,'00402 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',4,4,'00402 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',5,5,'00402 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',6,6,'00402 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',7,7,'00402 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',8,8,'00402 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',9,9,'00402 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',10,10,'00402 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',11,11,'00402 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',12,12,'00402 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',13,13,'00402 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',14,14,'00402 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',15,15,'00402 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00402 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',16,16,'00402 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Trailer',1,1,'00402 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00402 Interchange Control Trailer',2,2,'00402 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',1,1,'00402 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',2,2,'00402 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00402 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',4,4,'00402 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00402 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',5,5,'00402 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00402 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',6,3,'00402 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00402 Transaction Set Header',1,1,'00402 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00402 Transaction Set Header',2,2,'00402 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00402 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00402 Transaction Set Header',3,3,'00402 Implementation Convention Reference',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00402 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00402 Transaction Set Trailer',1,1,'00402 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00402 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00402 Transaction Set Trailer',2,2,'00402 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',1,1,'00403 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',2,2,'00403 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',3,3,'00403 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',4,4,'00403 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',5,5,'00403 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',6,6,'00403 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',7,7,'00403 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00403 Functional Group Header')
INSERT INTO segcon VALUES (5,'00403 Functional Group Header',8,8,'00403 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00403 Functional Group Trailer',1,1,'00403 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00403 Functional Group Trailer',2,2,'00403 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',1,1,'00403 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',2,2,'00403 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',3,3,'00403 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',4,4,'00403 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',5,5,'00403 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',6,6,'00403 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',7,7,'00403 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',8,8,'00403 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',9,9,'00403 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',10,10,'00403 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',11,11,'00403 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',12,12,'00403 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',13,13,'00403 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',14,14,'00403 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',15,15,'00403 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00403 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',16,16,'00403 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Trailer',1,1,'00403 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00403 Interchange Control Trailer',2,2,'00403 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',1,1,'00403 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',2,2,'00403 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00403 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',4,4,'00403 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00403 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',5,5,'00403 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00403 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',6,3,'00403 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00403 Transaction Set Header',1,1,'00403 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00403 Transaction Set Header',2,2,'00403 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00403 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00403 Transaction Set Header',3,3,'00403 Implementation Convention Reference',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00403 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00403 Transaction Set Trailer',1,1,'00403 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00403 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00403 Transaction Set Trailer',2,2,'00403 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',1,1,'00404 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',2,2,'00404 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',3,3,'00404 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',4,4,'00404 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',5,5,'00404 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',6,6,'00404 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',7,7,'00404 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00404 Functional Group Header')
INSERT INTO segcon VALUES (5,'00404 Functional Group Header',8,8,'00404 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00404 Functional Group Trailer',1,1,'00404 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00404 Functional Group Trailer',2,2,'00404 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',1,1,'00404 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',2,2,'00404 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',3,3,'00404 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',4,4,'00404 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',5,5,'00404 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',6,6,'00404 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',7,7,'00404 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',8,8,'00404 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',9,9,'00404 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',10,10,'00404 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',11,11,'00404 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',12,12,'00404 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',13,13,'00404 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',14,14,'00404 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',15,15,'00404 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00404 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',16,16,'00404 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Trailer',1,1,'00404 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00404 Interchange Control Trailer',2,2,'00404 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',1,1,'00404 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',2,2,'00404 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00404 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',4,4,'00404 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00404 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',5,5,'00404 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00404 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',6,3,'00404 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00404 Transaction Set Header',1,1,'00404 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00404 Transaction Set Header',2,2,'00404 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00404 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00404 Transaction Set Header',3,3,'00402 Implementation Convention Reference',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00404 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00404 Transaction Set Trailer',1,1,'00404 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00404 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00404 Transaction Set Trailer',2,2,'00404 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',1,1,'00405 Functional id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',2,2,'00405 Application senders code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',3,3,'00405 Application receivers code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',4,4,'00405 Date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',5,5,'00405 Time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',6,6,'00405 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',7,7,'00405 Responsible agency code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00405 Functional Group Header')
INSERT INTO segcon VALUES (5,'00405 Functional Group Header',8,8,'00405 Version/release/industry id code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00405 Functional Group Trailer',1,1,'00405 Number of transaction sets included',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 Functional Group Trailer')
INSERT INTO segcon VALUES (5,'00405 Functional Group Trailer',2,2,'00405 Group control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',1,1,'00405 Authorization information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',2,2,'00405 Authorization information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',3,3,'00405 Security information qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',4,4,'00405 Security information',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',5,5,'00405 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',6,6,'00405 Interchange sender id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 7 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',7,7,'00405 Interchange id qualifier',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 8 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',8,8,'00405 Interchange receiver id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 9 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',9,9,'00405 Interchange date',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 10 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',10,10,'00405 Interchange time',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 11 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',11,11,'00405 Interchange control standards id',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 12 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',12,12,'00405 Interchange control version number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 13 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',13,13,'00405 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 14 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',14,14,'00405 Acknowledgment requested',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 15 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',15,15,'00405 Test indicator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 16 AND snvr = '00405 Interchange Control Header')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',16,16,'00405 Sub-element separator',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Trailer',1,1,'00405 Number of included functional group',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 Interchange Control Trailer')
INSERT INTO segcon VALUES (5,'00405 Interchange Control Trailer',2,2,'00405 Interchange control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',1,1,'00405 Interchange control number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',2,2,'00405 Interchange date',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 4 AND snvr = '00405 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',4,4,'00405 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 5 AND snvr = '00405 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',5,5,'00405 Interchange Note Code',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 6 AND snvr = '00405 TA1 Interchange Acknowledgement')
INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',6,3,'00405 Interchange time',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00405 Transaction Set Header',1,1,'00405 Transaction set identifier code',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00405 Transaction Set Header',2,2,'00405 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 3 AND snvr = '00405 Transaction Set Header')
INSERT INTO segcon VALUES (5,'00405 Transaction Set Header',3,3,'00405 Implementation Convention Reference',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 1 AND snvr = '00405 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00405 Transaction Set Trailer',1,1,'00405 Number of included segments',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 5 AND esnr = 2 AND snvr = '00405 Transaction Set Trailer')
INSERT INTO segcon VALUES (5,'00405 Transaction Set Trailer',2,2,'00405 Transaction set control number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00302 DEFAULT','SYNTAX','003','02 ','Service Segments X.12 release 3020','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00303 DEFAULT','SYNTAX','003','03 ','Service Segments X.12 release 3030','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00304 DEFAULT','SYNTAX','003','04 ','Service Segments X.12 release 3040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00305 DEFAULT','SYNTAX','003','05 ','Service Segments X.12 release 3050','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00307 DEFAULT','SYNTAX','003','07 ','Service Segments X.12 release 3070','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00400 DEFAULT','SYNTAX','004','00 ','Service Segments X.12 release 4010','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00402 DEFAULT','SYNTAX','004','02 ','Service Segments X.12 release 4020','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00403 DEFAULT','SYNTAX','004','03 ','Service Segments X.12 release 4030','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00404 DEFAULT','SYNTAX','004','04 ','Service Segments X.12 release 4040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00405 DEFAULT','SYNTAX','004','05 ','Service Segments X.12 release 4050','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',1,'003020Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',2,'003020Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',3,'003020Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',4,'003020Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',5,'003020Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',6,'003020Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',7,'00302 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',1,'00303 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',2,'00303 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',3,'00303 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',4,'00303 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',5,'00303 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',6,'00303 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',7,'00303 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',1,'00304 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',2,'00304 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',3,'00304 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',4,'00304 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',5,'00304 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',6,'00304 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',7,'00304 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',1,'00305 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',2,'00305 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',3,'00305 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',4,'00305 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',5,'00305 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',6,'00305 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',7,'00305 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',1,'00307 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',2,'00307 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',3,'00307 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',4,'00307 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',5,'00307 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',6,'00307 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',7,'00307 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',1,'00400 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',2,'00400 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',3,'00400 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',4,'00400 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',5,'00400 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',6,'00400 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',7,'00400 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',1,'00402 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',2,'00402 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',3,'00402 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',4,'00402 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',5,'00402 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',6,'00402 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',7,'00402 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',1,'00403 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',2,'00403 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',3,'00403 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',4,'00403 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',5,'00403 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',6,'00403 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',7,'00403 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',1,'00404 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',2,'00404 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',3,'00404 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',4,'00404 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',5,'00404 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',6,'00404 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',7,'00404 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',1,'00405 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',2,'00405 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 3 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',3,'00405 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 4 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',4,'00405 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 5 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',5,'00405 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 6 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',6,'00405 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( select * from msgs2 WHERE fc = 5 AND ssnr = 7 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',7,'00405 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,2,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,4,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,12,1,1,3,'00302',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,16,1,1,2,'81',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,4,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,5,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',4,1,1,1,2,'29',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',4,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',5,1,1,1,2,'57',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',5,2,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',6,1,1,1,2,'60',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',6,2,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,1,1,0,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,2,1,0,2,'210',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 3 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,3,1,0,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,4,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00302 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,12,1,1,1,'00303',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 9 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 10 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,12,1,1,1,'00304',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,12,1,1,1,'00305',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,12,1,1,1,'00307',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,12,1,1,1,'00400',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 7 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,7,1,0,2,'207',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 8 AND mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,8,1,0,2,'208',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,12,1,1,1,'00402',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 3 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,12,1,1,1,'00403',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 3 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,12,1,1,1,'00404',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 3 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 3 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 4 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 5 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 6 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 7 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 8 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 9 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 10 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 11 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 12 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,12,1,1,1,'00405',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 13 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 14 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 15 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 1 AND esnr = 16 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 3 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 4 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 5 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 6 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 7 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 2 AND esnr = 8 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 3 AND esnr = 3 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',3,3,0,0,8,'211',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 4 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 5 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 6 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 1 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 2 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 4 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 5 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

IF NOT EXISTS ( select * from msgs3 WHERE fc = 5 AND ssnr = 7 AND esnr = 6 AND mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')


/* ======================================================== */
/* == Upgrade from 4.0.111 Parity                        == */
/* ======================================================== */
UPDATE elmnts SET len = 10 WHERE fc = 5 AND lower(elmnam) = 'number of included segments' AND elmtag = 96 AND elmtyp ='N0' AND len = 6


/* ======================================================== */
/* == 11-01-2005 Add format versions for Kedifact        == */
/* ======================================================== */


DECLARE @CharsetKedifact smallint

SELECT @CharsetKedifact = COUNT(*) FROM charset WHERE setname = 'ISO-IR-149'
IF @CharsetKedifact = 0 
BEGIN
	INSERT INTO charset VALUES ('ISO-IR-149','ISO character set IR149 Korean',34)
	
	INSERT INTO mfcvr VALUES ('3 1  14 ',3,'1  ','14 ','KEDIFACT KECA 1','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',1,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',1,0,NULL,NULL,NULL,1,0,0,0,0,1,NULL,NULL,0,0,'001',0,'')
	INSERT INTO mfcvr VALUES ('3 2  14 ',3,'2  ','14 ','KEDIFACT KECA 2','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',2,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',1,0,NULL,NULL,NULL,1,0,0,0,0,1,NULL,NULL,0,0,'001',0,'')
	INSERT INTO mfcvr VALUES ('3 3  14 ',3,'3  ','14 ','KEDIFACT KECA 3','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',3,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',1,0,NULL,NULL,NULL,1,0,0,0,0,1,NULL,NULL,0,0,'001',0,'')
END


/* =================================================================== */
/* == 15-05-2005 Add format version and Control and Syntax document == */
/* =================================================================== */

IF NOT EXISTS ( select * from mfcvr WHERE fcvr = '3 4  14 ') 
INSERT INTO mfcvr VALUES ('3 4  14 ',3,'4  ','14 ','KEDIFACT KECA 4','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?4',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',4,0,'11111111111111111111100000000000','                     *(/)*-"(-)-',1,0,0,0,0,1,0,0,0,0,1,NULL,NULL,0,0,'000',0,'')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Action, coded' )
INSERT INTO elmnts VALUES (3,'4  1  Action, coded','Action, coded','4  ','1  ',1,83,'A',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Address for reverse routing' )
INSERT INTO elmnts VALUES (3,'4  1  Address for reverse routing','Address for reverse routing','4  ','1  ',0,8,'A',14,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Association assigned code' )
INSERT INTO elmnts VALUES (3,'4  1  Association assigned code','Association assigned code','4  ','1  ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Controlling agency' )
INSERT INTO elmnts VALUES (3,'4  1  Controlling agency','Controlling agency','4  ','1  ',1,51,'A',2,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Erroneous component data element po' )
INSERT INTO elmnts VALUES (3,'4  1  Erroneous component data element po','Erroneous component data element po','4  ','1  ',0,104,'S',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Erroneous data element occurrence' )
INSERT INTO elmnts VALUES (3,'4  1  Erroneous data element occurrence','Erroneous data element occurrence','4  ','1  ',0,136,'N0',6,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Erroneous data element position in' )
INSERT INTO elmnts VALUES (3,'4  1  Erroneous data element position in','Erroneous data element position in','4  ','1  ',0,98,'S',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Functional group reference number' )
INSERT INTO elmnts VALUES (3,'4  1  Functional group reference number','Functional group reference number','4  ','1  ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Interchange control reference' )
INSERT INTO elmnts VALUES (3,'4  1  Interchange control reference','Interchange control reference','4  ','1  ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Message reference number' )
INSERT INTO elmnts VALUES (3,'4  1  Message reference number','Message reference number','4  ','1  ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Message release number' )
INSERT INTO elmnts VALUES (3,'4  1  Message release number','Message release number','4  ','1  ',1,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Message type' )
INSERT INTO elmnts VALUES (3,'4  1  Message type','Message type','4  ','1  ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Message version number' )
INSERT INTO elmnts VALUES (3,'4  1  Message version number','Message version number','4  ','1  ',1,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Package reference number' )
INSERT INTO elmnts VALUES (3,'4  1  Package reference number','Package reference number','4  ','1  ',0,800,'A',35,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Partner identification code qualifi' )
INSERT INTO elmnts VALUES (3,'4  1  Partner identification code qualifi','Partner identification code qualifi','4  ','1  ',1,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Recipient identification' )
INSERT INTO elmnts VALUES (3,'4  1  Recipient identification','Recipient identification','4  ','1  ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Recipient''s identification' )
INSERT INTO elmnts VALUES (3,'4  1  Recipient''s identification','Recipient''s identification','4  ','1  ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Reference identification number' )
INSERT INTO elmnts VALUES (3,'4  1  Reference identification number','Reference identification number','4  ','1  ',0,802,'A',35,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Reference qualifier' )
INSERT INTO elmnts VALUES (3,'4  1  Reference qualifier','Reference qualifier','4  ','1  ',0,813,'A',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Routing address' )
INSERT INTO elmnts VALUES (3,'4  1  Routing address','Routing address','4  ','1  ',0,14,'A',14,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Security reference number' )
INSERT INTO elmnts VALUES (3,'4  1  Security reference number','Security reference number','4  ','1  ',0,534,'A',14,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Security segment position' )
INSERT INTO elmnts VALUES (3,'4  1  Security segment position','Security segment position','4  ','1  ',0,138,'N0',6,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Segment position in message' )
INSERT INTO elmnts VALUES (3,'4  1  Segment position in message','Segment position in message','4  ','1  ',0,96,'S',6,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Sender identification' )
INSERT INTO elmnts VALUES (3,'4  1  Sender identification','Sender identification','4  ','1  ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Service segment tag, coded' )
INSERT INTO elmnts VALUES (3,'4  1  Service segment tag, coded','Service segment tag, coded','4  ','1  ',1,135,'AB',3,1,NULL,3,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4  1  Syntax error, coded' )
INSERT INTO elmnts VALUES (3,'4  1  Syntax error, coded','Syntax error, coded','4  ','1  ',1,85,'A',3,0,NULL,1,NULL,1,NULL,'','')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Acknowledgement request' )
INSERT INTO elmnts VALUES ( 3, '4     Acknowledgement request', 'Acknowledgement request', '4  ', '   ',0,31, 'N0',1,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Application password' )
INSERT INTO elmnts VALUES ( 3, '4     Application password', 'Application password', '4  ', '   ',0,58, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Application recipient identification' )
INSERT INTO elmnts VALUES ( 3, '4     Application recipient identification', 'Application recipient identification', '4  ', '   ',0,44, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Application reference' )
INSERT INTO elmnts VALUES ( 3, '4     Application reference', 'Application reference', '4  ', '   ',0,26, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Application sender identification' )
INSERT INTO elmnts VALUES ( 3, '4     Application sender identification', 'Application sender identification', '4  ', '   ',0,40, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Association assigned code' )
INSERT INTO elmnts VALUES ( 3, '4     Association assigned code', 'Association assigned code', '4  ', '   ',0,57, 'A',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Character encoding, coded' )
INSERT INTO elmnts VALUES ( 3, '4     Character encoding, coded', 'Character encoding, coded', '4  ', '   ',0,133, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Code list directory version number' )
INSERT INTO elmnts VALUES ( 3, '4     Code list directory version number', 'Code list directory version number', '4  ', '   ',0,110, 'A',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Common access reference' )
INSERT INTO elmnts VALUES ( 3, '4     Common access reference', 'Common access reference', '4  ', '   ',0,68, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Controlling agency, coded' )
INSERT INTO elmnts VALUES ( 3, '4     Controlling agency, coded', 'Controlling agency, coded', '4  ', '   ',0,51, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Date' )
INSERT INTO elmnts VALUES ( 3, '4     Date', 'Date', '4  ', '   ',0,17, 'DY',6,1,NULL,6,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     First and last transfer' )
INSERT INTO elmnts VALUES ( 3, '4     First and last transfer', 'First and last transfer', '4  ', '   ',0,73, 'A',1,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Group control count' )
INSERT INTO elmnts VALUES ( 3, '4     Group control count', 'Group control count', '4  ', '   ',0,60, 'N0',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Group reference number' )
INSERT INTO elmnts VALUES ( 3, '4     Group reference number', 'Group reference number', '4  ', '   ',0,48, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Identification code qualifier' )
INSERT INTO elmnts VALUES ( 3, '4     Identification code qualifier', 'Identification code qualifier', '4  ', '   ',0,7, 'A',4,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange agreement identifier' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange agreement identifier', 'Interchange agreement identifier', '4  ', '   ',0,32, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange control count' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange control count', 'Interchange control count', '4  ', '   ',0,36, 'N0',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange control reference' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange control reference', 'Interchange control reference', '4  ', '   ',0,20, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange recipient internal identification' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange recipient internal identification', 'Interchange recipient internal identification', '4  ', '   ',0,14, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange recipient internal sub-identification' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange recipient internal sub-identification', 'Interchange recipient internal sub-identification', '4  ', '   ',0,46, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange sender internal identification' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange sender internal identification', 'Interchange sender internal identification', '4  ', '   ',0,8, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Interchange sender internal sub-identification' )
INSERT INTO elmnts VALUES ( 3, '4     Interchange sender internal sub-identification', 'Interchange sender internal sub-identification', '4  ', '   ',0,42, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message group identification' )
INSERT INTO elmnts VALUES ( 3, '4     Message group identification', 'Message group identification', '4  ', '   ',0,38, 'A',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message implementation guideline identification' )
INSERT INTO elmnts VALUES ( 3, '4     Message implementation guideline identification', 'Message implementation guideline identification', '4  ', '   ',0,121, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message implementation guideline release number' )
INSERT INTO elmnts VALUES ( 3, '4     Message implementation guideline release number', 'Message implementation guideline release number', '4  ', '   ',0,124, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message implementation guideline version number' )
INSERT INTO elmnts VALUES ( 3, '4     Message implementation guideline version number', 'Message implementation guideline version number', '4  ', '   ',0,122, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message reference number' )
INSERT INTO elmnts VALUES ( 3, '4     Message reference number', 'Message reference number', '4  ', '   ',0,62, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message release number' )
INSERT INTO elmnts VALUES ( 3, '4     Message release number', 'Message release number', '4  ', '   ',0,54, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message subset identification' )
INSERT INTO elmnts VALUES ( 3, '4     Message subset identification', 'Message subset identification', '4  ', '   ',0,115, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message subset release number' )
INSERT INTO elmnts VALUES ( 3, '4     Message subset release number', 'Message subset release number', '4  ', '   ',0,118, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message subset version number' )
INSERT INTO elmnts VALUES ( 3, '4     Message subset version number', 'Message subset version number', '4  ', '   ',0,116, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message type' )
INSERT INTO elmnts VALUES ( 3, '4     Message type', 'Message type', '4  ', '   ',0,65, 'A',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message type sub-function identification' )
INSERT INTO elmnts VALUES ( 3, '4     Message type sub-function identification', 'Message type sub-function identification', '4  ', '   ',0,113, 'A',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Message version number' )
INSERT INTO elmnts VALUES ( 3, '4     Message version number', 'Message version number', '4  ', '   ',0,52, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Number of segments in a message' )
INSERT INTO elmnts VALUES ( 3, '4     Number of segments in a message', 'Number of segments in a message', '4  ', '   ',0,74, 'N0',10,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Processing priority' )
INSERT INTO elmnts VALUES ( 3, '4     Processing priority', 'Processing priority', '4  ', '   ',0,29, 'A',1,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Recipient identification' )
INSERT INTO elmnts VALUES ( 3, '4     Recipient identification', 'Recipient identification', '4  ', '   ',0,10, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Recipient reference/password' )
INSERT INTO elmnts VALUES ( 3, '4     Recipient reference/password', 'Recipient reference/password', '4  ', '   ',0,22, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Recipient reference/password qualifier' )
INSERT INTO elmnts VALUES ( 3, '4     Recipient reference/password qualifier', 'Recipient reference/password qualifier', '4  ', '   ',0,25, 'A',2,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Scenario identification' )
INSERT INTO elmnts VALUES ( 3, '4     Scenario identification', 'Scenario identification', '4  ', '   ',0,127, 'A',14,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Scenario release number' )
INSERT INTO elmnts VALUES ( 3, '4     Scenario release number', 'Scenario release number', '4  ', '   ',0,130, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Scenario version number' )
INSERT INTO elmnts VALUES ( 3, '4     Scenario version number', 'Scenario version number', '4  ', '   ',0,128, 'A',3,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Sender identification' )
INSERT INTO elmnts VALUES ( 3, '4     Sender identification', 'Sender identification', '4  ', '   ',0,4, 'A',35,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Sequence of transfer' )
INSERT INTO elmnts VALUES ( 3, '4     Sequence of transfer', 'Sequence of transfer', '4  ', '   ',0,70, 'N0',2,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Service code list directory version number' )
INSERT INTO elmnts VALUES ( 3, '4     Service code list directory version number', 'Service code list directory version number', '4  ', '   ',0,80, 'A',6,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Syntax identifier' )
INSERT INTO elmnts VALUES ( 3, '4     Syntax identifier', 'Syntax identifier', '4  ', '   ',0,1, 'AB',4,1,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Syntax release number' )
INSERT INTO elmnts VALUES ( 3, '4     Syntax release number', 'Syntax release number', '4  ', '   ',0,76, 'A',2,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Syntax version number' )
INSERT INTO elmnts VALUES ( 3, '4     Syntax version number', 'Syntax version number', '4  ', '   ',0,2, 'A',1,1,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Test indicator' )
INSERT INTO elmnts VALUES ( 3, '4     Test indicator', 'Test indicator', '4  ', '   ',0,35, 'N0',1,0,NULL,1,NULL,1,NULL, '', '')

IF NOT EXISTS ( select * from elmnts WHERE fc =  3 AND envr = '4     Time' )
INSERT INTO elmnts VALUES ( 3, '4     Time', 'Time', '4  ', '   ',0,19, 'T',4,1,NULL,1,NULL,1,NULL, '', '')



IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Action, coded' AND code = '4' )    
INSERT INTO codset VALUES (3,'4  1  Action, coded','4','This level and all lower levels rej',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Action, coded' AND code = '7' )    
INSERT INTO codset VALUES (3,'4  1  Action, coded','7','This level acknowledged, next lower',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Action, coded' AND code = '8' )
INSERT INTO codset VALUES (3,'4  1  Action, coded','8','Interchange received',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AA' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AA','EDICONSTRUCT',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AB' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AB','DIN (Deutsches Institut fuer Normun',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AC' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AC','ICS (International Chamber of Shipp',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AD' ) 
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AD','UPU (Union Postale Universelle)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AE' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AE','United Kingdom ANA (Article Numberi',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AF' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AF','ANSI ASC X12 (American National Sta',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AG' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AG','US DoD (United States Department of',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AH' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AH','US Federal Government',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'AI' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','AI','EDIFICAS',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'CC' )    
INSERT INTO codset VALUES (3,'4  1  Controlling agency','CC','CCC (Customs Co-operation Council)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'CE' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','CE','CEFIC (Conseil Europeen des Federat',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'EC' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','EC','EDICON',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'ED' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','ED','EDIFICE (Electronic industries proj',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'EE' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','EE','EC + EFTA (European Communities and',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'EN' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','EN','EAN (European Article Numbering Ass',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'ER' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','ER','UIC (International Union of railway',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'EU' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','EU','European Union',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'EW' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','EW','UN/EDIFACT Working Group (EWG)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'EX' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','EX','IECC (International Express Carrier',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'IA' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','IA','IATA (International Air Transport A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'KE' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','KE','KEC (Korea EDIFACT Committee)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'LI' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','LI','LIMNET',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'OD' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','OD','ODETTE (Organization for Data Excha',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'RI' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','RI','RINET (Reinsurance and Insurance Ne',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'RT' )     
INSERT INTO codset VALUES (3,'4  1  Controlling agency','RT','UN/ECE/TRADE/WP.4/GE.1/EDIFACT Rapp',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Controlling agency' AND code = 'UN' )
INSERT INTO codset VALUES (3,'4  1  Controlling agency','UN','UN/CEFACT',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '00A' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','00A','Release 2000 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '00B' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','00B','Release 2000 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '01A' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','01A','Release 2001 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '01B' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','01B','Release 2001 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '01C' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','01C','Release 2001 - C',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '02A' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','02A','Release 2002 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '02B' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','02B','Release 2002 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '03A' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','03A','Release 2003 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '03B' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','03B','Release 2003 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '1' )
INSERT INTO codset VALUES (3,'4  1  Message release number','1','First release',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '2' )
INSERT INTO codset VALUES (3,'4  1  Message release number','2','Second release',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '3' )
INSERT INTO codset VALUES (3,'4  1  Message release number','3','Third release, CONTRL message',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '901' )  
INSERT INTO codset VALUES (3,'4  1  Message release number','901','Release 1990 - 901',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '902' )  
INSERT INTO codset VALUES (3,'4  1  Message release number','902','Trial release 1990',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '911' )  
INSERT INTO codset VALUES (3,'4  1  Message release number','911','Trial release 1991',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '912' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','912','Standard release 1991',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '921' )  
INSERT INTO codset VALUES (3,'4  1  Message release number','921','Trial release 1992',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '932' )     
INSERT INTO codset VALUES (3,'4  1  Message release number','932','Standard release 1993',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '93A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','93A','Release 1993 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '94A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','94A','Release 1994 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '94B' )
INSERT INTO codset VALUES (3,'4  1  Message release number','94B','Release 1994 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '95A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','95A','Release 1995 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '95B' )
INSERT INTO codset VALUES (3,'4  1  Message release number','95B','Release 1995 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '96A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','96A','Release 1996 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '96B' )
INSERT INTO codset VALUES (3,'4  1  Message release number','96B','Release 1996 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '97A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','97A','Release 1997 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '97B' )
INSERT INTO codset VALUES (3,'4  1  Message release number','97B','Release 1997 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '98A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','98A','Release 1998 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '98B' )
INSERT INTO codset VALUES (3,'4  1  Message release number','98B','Release 1998 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '99A' )
INSERT INTO codset VALUES (3,'4  1  Message release number','99A','Release 1999 - A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message release number' AND code = '99B' )
INSERT INTO codset VALUES (3,'4  1  Message release number','99B','Release 1999 - B',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = '1' )
INSERT INTO codset VALUES (3,'4  1  Message version number','1','Status 1 version',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = '2' )
INSERT INTO codset VALUES (3,'4  1  Message version number','2','Status 2 version',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = '88')
INSERT INTO codset VALUES (3,'4  1  Message version number','88','1988 version',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = '89')
INSERT INTO codset VALUES (3,'4  1  Message version number','89','1989 version',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = '90')
INSERT INTO codset VALUES (3,'4  1  Message version number','90','1990 version',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = 'D' )      
INSERT INTO codset VALUES (3,'4  1  Message version number','D','Draft version/UN/EDIFACT Directory',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Message version number' AND code = 'S' )
INSERT INTO codset VALUES (3,'4  1  Message version number','S','Standard version',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '1' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','1','DUNS (Data Universal Numbering Syst',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '103')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','103','TW, Trade-van',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '12' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','12','Telephone number',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '128')       
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','128','CH, BCNR (Swiss Clearing Bank Numbe',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '129')       
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','129','CH, BPI (Swiss Business Partner Ide',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '14' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','14','EAN (European Article Numbering Ass',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '144')       
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','144','US, DoDAAC (Department of Defense A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '145')      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','145','FR, DGCP (Direction Generale de la',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '146')       
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','146','FR, DGI (Direction Generale des Imp',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '147')      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','147','JP, JIPDEC/ECPC (Japan Information',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '148')       
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','148','ITU (International Telecommunicatio',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '18' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','18','AIAG (Automotive Industry Action Gr',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '22' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','22','INSEE (Institut National de la Stat',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '30' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','30','ISO 6523: Organization identificati',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '31' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','31','DIN (Deutsches Institut fuer Normun',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '33' )      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','33','BfA (Bundesversicherungsanstalt fue',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '34' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','34','National Statistical Agency',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '4' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','4','IATA (International Air Transport A',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '5' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','5','INSEE (Institut National de la Stat',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '51')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','51','GEIS (General Electric Information',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '52')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','52','INS (IBM Network Services)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '53')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','53','Datenzentrale des Einzelhandels',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '54')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','54','Bundesverband der Deutschen Baustof',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '55')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','55','Bank identifier code',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '57')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','57','KTNet (Korea Trade Network Services',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '58')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','58','UPU (Universal Postal Union)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '59')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','59','ODETTE (Organization for Data Excha',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '61')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','61','SCAC (Standard Carrier Alpha Code)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '63')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','63','ECA (Electronic Commerce Australia)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '65')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','65','TELEBOX 400 (Deutsche Telekom)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '8' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','8','UCC Communications ID (Uniform Code',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '80')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','80','NHS (National Health Service)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '82')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','82','Statens Teleforvaltning',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '84')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','84','Athens Chamber of Commerce',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '85')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','85','Swiss Chamber of Commerce',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '86')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','86','US Council for International Busine',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '87')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','87','National Federation of Chambers of',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '89')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','89','Association of British Chambers of',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '9' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','9','DUNS (Data Universal Numbering Syst',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '90')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','90','SITA (Societe Internationale de Tel',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '91') 
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','91','Assigned by seller or seller''s agen',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = '92')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','92','Assigned by buyer or buyer''s agent',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = 'Z01')      
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','Z01','Vehicle registration number',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = 'ZZ' )
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','ZZ','Mutually defined',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Partner identification code qualifi' AND code = 'ZZZ')
INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','ZZZ','Mutually defined',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UCD')       
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCD','Data element error indication',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UCF')   
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCF','Functional group response',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UCI')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCI','Interchange response',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UCM')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCM','Message response',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UCS')  
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCS','Segment error indication',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNA')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNA','Service string advice',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNB')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNB','Interchange header',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNE')  
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNE','Functional group trailer',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNG') 
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNG','Functional group header',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNH')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNH','Message header',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNS')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNS','Section control',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNT')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNT','Message trailer',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Service segment tag, coded' AND code = 'UNZ')
INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNZ','Interchange trailer',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '12')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','12','Invalid value',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '13')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','13','Missing',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '14')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','14','Value not supported in this positio',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '15')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','15','Not supported in this position',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '16')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','16','Too many constituents',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '17')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','17','No agreement',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '18')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','18','Unspecified error',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '19')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','19','Invalid decimal notation',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '2' )
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','2','Syntax version or level not support',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '20')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','20','Character invalid as service charac',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '21')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','21','Invalid character(s)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '22')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','22','Invalid service character(s)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '23')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','23','Unknown Interchange sender',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '24')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','24','Too old',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '25')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','25','Test indicator not supported',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '26')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','26','Duplicate detected',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '27')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','27','Security function not supported',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '28')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','28','References do not match',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '29')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','29','Control count does not match number',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '30')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','30','Functional groups and messages mixe',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '31')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','31','More than one message type in group',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '32')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','32','Lower level empty',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '33')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','33','Invalid occurrence outside message',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '34')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','34','Nesting indicator not allowed',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '35')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','35','Too many segment repetitions',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '36')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','36','Too many segment group repetitions',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '37')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','37','Invalid type of character(s)',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '38')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','38','Missing digit in front of decimal s',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '39')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','39','Data element too long',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '40')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','40','Data element too short',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '41')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','41','Permanent communication network err',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '42')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','42','Temporary communication network err',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '43')
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','43','Unknown interchange recipient',NULL,'')

IF NOT EXISTS ( select * from codset WHERE fc =   3 and envr = '4  1  Syntax error, coded' AND code = '7' )
INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','7','Interchange recipient not actual re',NULL,'')


IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4  1  Data element error indication')
INSERT INTO sgmnts VALUES (3,'Data element error indication','UCD','4  1  Data element error indication','4  ','1  ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4  1  Functional group response')
INSERT INTO sgmnts VALUES (3,'Functional group response','UCF','4  1  Functional group response','4  ','1  ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4  1  Interchange response')
INSERT INTO sgmnts VALUES (3,'Interchange response','UCI','4  1  Interchange response','4  ','1  ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4  1  Message response')
INSERT INTO sgmnts VALUES (3,'Message response','UCM','4  1  Message response','4  ','1  ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4  1  Segment error indication')
INSERT INTO sgmnts VALUES (3,'Segment error indication','UCS','4  1  Segment error indication','4  ','1  ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4     GROUP HEADER')
INSERT INTO sgmnts VALUES (3,'GROUP HEADER','UNG','4     GROUP HEADER','4  ','   ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4     GROUP TRAILER')
INSERT INTO sgmnts VALUES (3,'GROUP TRAILER','UNE','4     GROUP TRAILER','4  ','   ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER')
INSERT INTO sgmnts VALUES (3,'INTERCHANGE HEADER','UNB','4     INTERCHANGE HEADER','4  ','   ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4     INTERCHANGE TRAILER')
INSERT INTO sgmnts VALUES (3,'INTERCHANGE TRAILER','UNZ','4     INTERCHANGE TRAILER','4  ','   ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4     MESSAGE HEADER')
INSERT INTO sgmnts VALUES (3,'MESSAGE HEADER','UNH','4     MESSAGE HEADER','4  ','   ',NULL)

IF NOT EXISTS ( select * from sgmnts WHERE fc = 3 AND snvr = '4     MESSAGE TRAILER')
INSERT INTO sgmnts VALUES (3,'MESSAGE TRAILER','UNT','4     MESSAGE TRAILER','4  ','   ',NULL)


IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Data element error indication'  and envr = '4  1  Syntax error, coded' and esnr=1)
INSERT INTO segcon VALUES (3,'4  1  Data element error indication',1,1,'4  1  Syntax error, coded',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Data element error indication'  and envr = '4  1  Erroneous data element position in' and esnr=2)
INSERT INTO segcon VALUES (3,'4  1  Data element error indication',2,2,'4  1  Erroneous data element position in',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Data element error indication'  and envr = '4  1  Erroneous component data element po' and esnr=3)
INSERT INTO segcon VALUES (3,'4  1  Data element error indication',3,3,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Data element error indication'  and envr = '4  1  Erroneous data element occurrence' and esnr=4)
INSERT INTO segcon VALUES (3,'4  1  Data element error indication',4,4,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Functional group reference number' and esnr=1)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',1,1,'4  1  Functional group reference number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Sender identification' and esnr=2)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',2,2,'4  1  Sender identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Partner identification code qualifi' and esnr=3)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',3,3,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Recipient''s identification' and esnr=4)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',4,4,'4  1  Recipient''s identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Partner identification code qualifi' and esnr=5)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',5,5,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Action, coded' and esnr=6)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',6,6,'4  1  Action, coded',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Syntax error, coded' and esnr=7)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',7,7,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Service segment tag, coded' and esnr=8)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',8,8,'4  1  Service segment tag, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Erroneous data element position in' and esnr=9)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',9,9,'4  1  Erroneous data element position in',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Erroneous component data element po' and esnr=10)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',10,10,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Erroneous data element occurrence' and esnr=11)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',11,11,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Security reference number' and esnr=12)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',12,12,'4  1  Security reference number',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Functional group response'  and envr = '4  1  Security segment position' and esnr=13)
INSERT INTO segcon VALUES (3,'4  1  Functional group response',13,13,'4  1  Security segment position',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Interchange control reference' and esnr=1)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',1,1,'4  1  Interchange control reference',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Partner identification code qualifi' and esnr=3)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',3,3,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Address for reverse routing' and esnr=4)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',4,4,'4  1  Address for reverse routing',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Recipient identification' and esnr=5)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',5,6,'4  1  Recipient identification',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Partner identification code qualifi' and esnr=6)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',6,7,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Routing address' and esnr=7)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',7,8,'4  1  Routing address',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Action, coded' and esnr=8)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',8,10,'4  1  Action, coded',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Syntax error, coded' and esnr=9)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',9,11,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Service segment tag, coded' and esnr=10)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',10,12,'4  1  Service segment tag, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Erroneous data element position in' and esnr=11)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',11,13,'4  1  Erroneous data element position in',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Erroneous component data element po' and esnr=12)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',12,14,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4     Sender identification' and esnr=13)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',13,2,'4     Sender identification',1,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4     Interchange sender internal sub-identification' and esnr=14)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',14,5,'4     Interchange sender internal sub-identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4     Interchange recipient internal sub-identification' and esnr=15)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',15,9,'4     Interchange recipient internal sub-identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Erroneous data element occurrence' and esnr=16)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',16,15,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Security reference number' and esnr=17)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',17,16,'4  1  Security reference number',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Interchange response'  and envr = '4  1  Security segment position' and esnr=18)
INSERT INTO segcon VALUES (3,'4  1  Interchange response',18,17,'4  1  Security segment position',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Message reference number' and esnr=1)
INSERT INTO segcon VALUES (3,'4  1  Message response',1,1,'4  1  Message reference number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Message type' and esnr=2)
INSERT INTO segcon VALUES (3,'4  1  Message response',2,2,'4  1  Message type',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Message version number' and esnr=3)
INSERT INTO segcon VALUES (3,'4  1  Message response',3,3,'4  1  Message version number',2,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Message release number' and esnr=4)
INSERT INTO segcon VALUES (3,'4  1  Message response',4,4,'4  1  Message release number',2,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Controlling agency' and esnr=5)
INSERT INTO segcon VALUES (3,'4  1  Message response',5,5,'4  1  Controlling agency',2,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Association assigned code' and esnr=6)
INSERT INTO segcon VALUES (3,'4  1  Message response',6,6,'4  1  Association assigned code',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Action, coded' and esnr=7)
INSERT INTO segcon VALUES (3,'4  1  Message response',7,9,'4  1  Action, coded',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Syntax error, coded' and esnr=8)
INSERT INTO segcon VALUES (3,'4  1  Message response',8,10,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Service segment tag, coded' and esnr=9)
INSERT INTO segcon VALUES (3,'4  1  Message response',9,11,'4  1  Service segment tag, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Erroneous data element position in' and esnr=10)
INSERT INTO segcon VALUES (3,'4  1  Message response',10,12,'4  1  Erroneous data element position in',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Erroneous component data element po' and esnr=11)
INSERT INTO segcon VALUES (3,'4  1  Message response',11,13,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4     Code list directory version number' and esnr=12)
INSERT INTO segcon VALUES (3,'4  1  Message response',12,7,'4     Code list directory version number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4     Message type sub-function identification' and esnr=13)
INSERT INTO segcon VALUES (3,'4  1  Message response',13,8,'4     Message type sub-function identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Erroneous data element occurrence' and esnr=14)
INSERT INTO segcon VALUES (3,'4  1  Message response',14,14,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Package reference number' and esnr=15)
INSERT INTO segcon VALUES (3,'4  1  Message response',15,15,'4  1  Package reference number',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Reference qualifier' and esnr=16)
INSERT INTO segcon VALUES (3,'4  1  Message response',16,16,'4  1  Reference qualifier',1,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Reference identification number' and esnr=17)
INSERT INTO segcon VALUES (3,'4  1  Message response',17,17,'4  1  Reference identification number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Security reference number' and esnr=18)
INSERT INTO segcon VALUES (3,'4  1  Message response',18,18,'4  1  Security reference number',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Message response'  and envr = '4  1  Security segment position' and esnr=19)
INSERT INTO segcon VALUES (3,'4  1  Message response',19,19,'4  1  Security segment position',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Segment error indication'  and envr = '4  1  Segment position in message' and esnr=1)
INSERT INTO segcon VALUES (3,'4  1  Segment error indication',1,1,'4  1  Segment position in message',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4  1  Segment error indication'  and envr = '4  1  Syntax error, coded' and esnr=2)
INSERT INTO segcon VALUES (3,'4  1  Segment error indication',2,2,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Identification code qualifier' and esnr=3)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',3,3,'4     Identification code qualifier',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Identification code qualifier' and esnr=5)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',5,5,'4     Identification code qualifier',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Date' and esnr=6)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',6,6,'4     Date',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Time' and esnr=7)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',7,7,'4     Time',2,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Message version number' and esnr=10)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',10,10,'4     Message version number',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Message release number' and esnr=11)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',11,11,'4     Message release number',2,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Association assigned code' and esnr=12)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',12,12,'4     Association assigned code',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Application password' and esnr=13)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',13,13,'4     Application password',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Message group identification' and esnr=14)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',14,1,'4     Message group identification',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Application sender identification' and esnr=15)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',15,2,'4     Application sender identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Application recipient identification' and esnr=16)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',16,4,'4     Application recipient identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Group reference number' and esnr=17)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',17,8,'4     Group reference number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP HEADER'  and envr = '4     Controlling agency, coded' and esnr=18)
INSERT INTO segcon VALUES (3,'4     GROUP HEADER',18,9,'4     Controlling agency, coded',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP TRAILER'  and envr = '4     Group control count' and esnr=3)
INSERT INTO segcon VALUES (3,'4     GROUP TRAILER',3,1,'4     Group control count',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     GROUP TRAILER'  and envr = '4     Group reference number' and esnr=4)
INSERT INTO segcon VALUES (3,'4     GROUP TRAILER',4,2,'4     Group reference number',0,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Syntax identifier' and esnr=1)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',1,1,'4     Syntax identifier',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Syntax version number' and esnr=2)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',2,2,'4     Syntax version number',2,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Sender identification' and esnr=3)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',3,6,'4     Sender identification',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Identification code qualifier' and esnr=4)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',4,7,'4     Identification code qualifier',2,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Recipient identification' and esnr=6)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',6,10,'4     Recipient identification',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Identification code qualifier' and esnr=7)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',7,11,'4     Identification code qualifier',2,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Date' and esnr=9)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',9,14,'4     Date',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Time' and esnr=10)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',10,15,'4     Time',2,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Interchange control reference' and esnr=11)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',11,16,'4     Interchange control reference',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Application reference' and esnr=14)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',14,19,'4     Application reference',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Processing priority' and esnr=15)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',15,20,'4     Processing priority',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Acknowledgement request' and esnr=16)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',16,21,'4     Acknowledgement request',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Test indicator' and esnr=18)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',18,23,'4     Test indicator',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Service code list directory version number' and esnr=19)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',19,3,'4     Service code list directory version number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Character encoding, coded' and esnr=20)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',20,4,'4     Character encoding, coded',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Interchange sender internal identification' and esnr=22)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',22,8,'4     Interchange sender internal identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Interchange sender internal sub-identification' and esnr=23)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',23,9,'4     Interchange sender internal sub-identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Interchange recipient internal identification' and esnr=24)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',24,12,'4     Interchange recipient internal identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Interchange recipient internal sub-identification' and esnr=25)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',25,13,'4     Interchange recipient internal sub-identification',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Recipient reference/password' and esnr=26)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',26,17,'4     Recipient reference/password',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Recipient reference/password qualifier' and esnr=27)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',27,18,'4     Recipient reference/password qualifier',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Interchange agreement identifier' and esnr=28)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',28,22,'4     Interchange agreement identifier',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE HEADER'  and envr = '4     Syntax release number' and esnr=29)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',29,5,'4     Syntax release number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE TRAILER'  and envr = '4     Interchange control count' and esnr=1)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE TRAILER',1,1,'4     Interchange control count',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     INTERCHANGE TRAILER'  and envr = '4     Interchange control reference' and esnr=2)
INSERT INTO segcon VALUES (3,'4     INTERCHANGE TRAILER',2,2,'4     Interchange control reference',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message reference number' and esnr=1)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',1,1,'4     Message reference number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message type' and esnr=2)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',2,2,'4     Message type',1,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message version number' and esnr=3)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',3,3,'4     Message version number',2,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message release number' and esnr=4)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',4,4,'4     Message release number',2,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Association assigned code' and esnr=6)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',6,6,'4     Association assigned code',2,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Common access reference' and esnr=7)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',7,9,'4     Common access reference',0,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Sequence of transfer' and esnr=8)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',8,10,'4     Sequence of transfer',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     First and last transfer' and esnr=9)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',9,11,'4     First and last transfer',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message type sub-function identification' and esnr=11)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',11,8,'4     Message type sub-function identification',2,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Controlling agency, coded' and esnr=12)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',12,5,'4     Controlling agency, coded',2,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Code list directory version number' and esnr=13)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',13,7,'4     Code list directory version number',2,1,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message subset identification' and esnr=14)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',14,12,'4     Message subset identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message subset version number' and esnr=15)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',15,13,'4     Message subset version number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message subset release number' and esnr=16)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',16,14,'4     Message subset release number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Controlling agency, coded' and esnr=17)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',17,15,'4     Controlling agency, coded',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message implementation guideline identification' and esnr=18)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',18,16,'4     Message implementation guideline identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message implementation guideline version number' and esnr=19)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',19,17,'4     Message implementation guideline version number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Message implementation guideline release number' and esnr=20)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',20,18,'4     Message implementation guideline release number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Controlling agency, coded' and esnr=21)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',21,19,'4     Controlling agency, coded',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Scenario version number' and esnr=23)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',23,21,'4     Scenario version number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Scenario release number' and esnr=24)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',24,22,'4     Scenario release number',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Scenario identification' and esnr=25)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',25,20,'4     Scenario identification',1,0,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE HEADER'  and envr = '4     Controlling agency, coded' and esnr=26)
INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',26,23,'4     Controlling agency, coded',2,0,0,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE TRAILER'  and envr = '4     Message reference number' and esnr=2)
INSERT INTO segcon VALUES (3,'4     MESSAGE TRAILER',2,2,'4     Message reference number',0,1,1,NULL,NULL)

IF NOT EXISTS ( select * from segcon WHERE fc = 3 AND snvr = '4     MESSAGE TRAILER'  and envr = '4     Number of segments in a message' and esnr=3)
INSERT INTO segcon VALUES (3,'4     MESSAGE TRAILER',3,1,'4     Number of segments in a message',0,1,0,NULL,NULL)

IF NOT EXISTS (select * from msgs1 where fc = 3 AND mcvr = 'SYNTAX4     DEFAULT')
INSERT INTO msgs1 VALUES (3,'SYNTAX4     DEFAULT','SYNTAX','4  ','   ','Service Segments EDIFACT version 4','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'  ','      ',0,0,0,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'                                   ',NULL)

IF NOT EXISTS (select * from msgs1 where fc = 3 AND mcvr = 'CONTRL4  1  DEFAULT          UN')
INSERT INTO msgs1 VALUES (3,'CONTRL4  1  DEFAULT          UN','CONTRL','4  ','1  ','Syntax and service report message','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'UN','      ',0,0,1,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         00','','DEFAULT',NULL,'                                   ',NULL)

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,'4  1  Interchange response',1,1,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,'4  1  Message response',0,2,0,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 3)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',3,'4  1  Segment error indication',0,3,999,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 4)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,'4  1  Data element error indication',0,4,99,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,'4  1  Functional group response',0,2,0,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,'4  1  Message response',0,3,0,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 7)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',7,'4  1  Segment error indication',0,4,999,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 8)
INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,'4  1  Data element error indication',0,5,99,NULL,NULL,NULL,8,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1)
INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',1,'4     INTERCHANGE HEADER',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2)
INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',2,'4     MESSAGE HEADER',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 3)
INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',3,'4     MESSAGE TRAILER',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 4)
INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',4,'4     INTERCHANGE TRAILER',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5)
INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',5,'4     GROUP HEADER',0,0,1,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

IF NOT EXISTS ( SELECT * FROM msgs2 WHERE fc = 3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 6)
INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',6,'4     GROUP TRAILER',0,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')


IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,3,0,0,4,'7',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,4,0,0,4,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 5)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,5,1,1,4,'3',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,6,0,0,4,'4',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,7,0,0,4,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 8)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,8,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 9)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 10)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,11,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 12)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 13)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,13,1,0,4,'6',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 14)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 15)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 16)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 17)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 1 and esnr = 18)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,3,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,4,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 5)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,5,0,1,3,'UN',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,7,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 8)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 9)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 10)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,10,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 12)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 13)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 14)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 15)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 16)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 17)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 18)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 2 and esnr = 19)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 3 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',3,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 3 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',3,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 4 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 4 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 4 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 4 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,2,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,3,0,0,12,'7',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,4,1,1,12,'3',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 5)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,5,0,0,12,'4',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,6,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 8)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 9)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,9,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 10)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 12)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 5 and esnr = 13)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,3,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,4,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 5)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,5,0,1,3,'UN',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,7,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 8)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 9)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 10)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,10,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 12)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 13)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 14)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 15)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 16)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 17)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 18)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 6 and esnr = 19)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 7 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',7,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 7 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',7,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 8 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 8 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 8 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'CONTRL4  1  DEFAULT          UN' and ssnr = 8 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,1,1,1,2,'1',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,2,1,1,2,'2',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,3,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,4,1,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,6,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,7,1,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 9)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 10)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,11,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 14)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,14,0,0,2,'14',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 15)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,15,0,0,2,'15',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 16)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,16,0,0,2,'16',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 18)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,18,0,0,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 19)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 20)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,20,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 22)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,22,0,0,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 23)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,23,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 24)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,24,0,0,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 25)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,25,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 26)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,26,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 27)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,27,0,0,2,'13',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 28)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,28,0,0,2,'17',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 1 and esnr = 29)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,29,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,1,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,2,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,3,1,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,4,1,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,6,1,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,7,0,0,2,'25',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 8)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,8,0,1,2,'26',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 9)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,9,0,0,2,'27',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,11,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 12)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,12,1,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 13)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,13,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 14)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,14,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 15)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 16)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 17)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 18)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,18,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 19)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 20)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,20,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 21)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,21,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 23)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,23,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 24)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,24,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 25)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,25,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 2 and esnr = 26)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,26,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 3 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',3,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 3 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',3,3,1,0,7,'29',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 4 and esnr = 1)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',4,1,1,1,7,'28',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 4 and esnr = 2)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',4,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,3,0,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 5)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,5,0,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 6)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,6,0,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 7)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,7,0,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 10)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,10,0,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 11)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,11,0,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 12)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,12,0,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 13)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 14)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,14,0,0,2,'20',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 15)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,15,0,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 16)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,16,0,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 17)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,17,1,0,2,'56',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 5 and esnr = 18)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,18,0,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 6 and esnr = 3)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',6,3,1,0,7,'57',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

IF NOT EXISTS( select * from msgs3 WHERE fc =  3 and mcvr = 'SYNTAX4     DEFAULT' and ssnr = 6 and esnr = 4)
INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',6,4,1,0,7,'56',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

/* ========================================================= */
/* 13 Sept.05  If numbers is filled with 'default start      */
/* values' update them with the values from the parame tabel */
/* ========================================================= */

UPDATE numbers SET nextnr = (SELECT parame.icin FROM parame  ) where typecd = 1 and nextnr = 10001;
UPDATE numbers SET nextnr = (SELECT parame.msgin FROM parame  ) where typecd = 2 and nextnr = 10001;
UPDATE numbers SET nextnr = (SELECT parame.msgout FROM parame  ) where typecd = 3 and nextnr = 10001;
UPDATE numbers SET nextnr = (SELECT parame.icout FROM parame ) where typecd = 4 and nextnr = 10001;
UPDATE numbers SET nextnr = (SELECT parame.errnr FROM parame ) where typecd = 5 and nextnr = 1;
UPDATE numbers SET nextnr = (SELECT parame.grpin FROM parame ) where typecd = 65 and nextnr = 10001;
UPDATE numbers SET nextnr = (SELECT parame.grpout FROM parame ) where typecd = 66 and nextnr = 10001;

/* ========================================================= */
/* 14 Sept.05  All EDI documents need to have value "A" in   */
/* position 15 of msgs1.xflags to be recognized as Base EDI  */
/* ========================================================= */

UPDATE    msgs1
SET       xflags = substring((xflags + space (14 - len(xflags))), 1, 14) + 'A'
WHERE     xflags is not NULL
AND       substring(xflags, 15, 1) <> 'A'
AND       ackfc = 0
AND       mcvr NOT LIKE 'SYNTAX%'

UPDATE    msgs1
SET       xflags = '00000000000000A'
WHERE     xflags is NULL
AND       ackfc = 0
AND       mcvr NOT LIKE 'SYNTAX%'


/* ========================================================= */
/* 26 Okt.05  Set the setname for the BASE EDI format        */
/* versions.                                                 */
/* ========================================================= */

UPDATE mfcvr
SET setname = 'ISO-646'
WHERE fcvr = '1'

UPDATE mfcvr 
SET setname = 'ISO-646'
WHERE fcvr LIKE '5%'

UPDATE mfcvr
SET setname = 'UNOA'
WHERE fcvr = '3 1  1' OR
      fcvr = '3 2  1' OR
      fcvr = '3 3  1'

UPDATE mfcvr
SET setname = 'UNOB'
WHERE fcvr = '3 1  2' OR
      fcvr = '3 2  2' OR
      fcvr = '3 3  2'

UPDATE mfcvr
SET setname = 'UNOC'
WHERE fcvr = '3 1  3' OR
      fcvr = '3 2  3' OR
      fcvr = '3 3  3'

UPDATE mfcvr
SET setname = 'UNOD'
WHERE fcvr = '3 1  4' OR
      fcvr = '3 2  4' OR
      fcvr = '3 3  4'

UPDATE mfcvr
SET setname = 'UNOE'
WHERE fcvr = '3 1  5' OR
      fcvr = '3 2  5' OR
      fcvr = '3 3  5'

UPDATE mfcvr
SET setname = 'UNOF'
WHERE fcvr = '3 1  6' OR
      fcvr = '3 2  6' OR
      fcvr = '3 3  6'

UPDATE mfcvr
SET setname = 'UNOG'
WHERE fcvr = '3 1  7' OR
      fcvr = '3 2  7' OR
      fcvr = '3 3  7'

UPDATE mfcvr
SET setname = 'ISO-IR-149'
WHERE fcvr = '3 1  14' OR
      fcvr = '3 2  14' OR
      fcvr = '3 3  14' OR
      fcvr = '3 4  14'

UPDATE mfcvr 
SET setname = 'ISO-646'
WHERE fcvr LIKE '10%'



/* ****************************************************** */
/* **  STEP 5 -  Refresh the errtxt table for          ** */
/* ** 		 language = 1 (english)                ** */
/* ****************************************************** */

DELETE FROM errtxt WHERE language = 1

INSERT INTO errtxt VALUES ( 1, 2243, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2242, NULL, 1030, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2241, NULL, 1030, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2240, NULL, 23, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2239, NULL, 79, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2238, NULL, 46, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2237, NULL, 68, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2236, NULL, 79, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2235, NULL, 79, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2234, NULL, 79, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2233, NULL, 79, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2232, NULL, 68, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2231, NULL, 37, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2230, NULL, 49, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2229, NULL, 46, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2228, NULL, 49, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2227, NULL, 46, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2226, NULL, 47, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2225, NULL, 19, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2224, NULL, 13, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2223, NULL, 42, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2222, NULL, 41, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2221, NULL, 42, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2220, NULL, 41, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2219, NULL, 18, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2218, NULL, 39, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2217, NULL, 49, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2216, NULL, 14, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2215, NULL, 49, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2214, NULL, 46, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2213, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2212, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2211, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2210, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2209, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2208, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2207, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2206, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2205, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2204, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2203, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2202, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2201, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2200, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2199, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2198, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2197, NULL, 121, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2196, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2195, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2194, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2193, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2192, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2191, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2190, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2189, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2188, NULL, 120, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2187, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2186, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2185, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2184, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2183, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2182, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2181, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2180, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2179, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2178, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2177, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2176, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2175, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2174, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2173, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2172, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2171, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2170, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2169, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2168, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2167, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2166, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2165, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2164, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2163, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2162, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2161, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2160, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2159, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2158, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2157, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2156, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2155, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2154, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2153, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2152, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2151, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2150, NULL, 2149, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2149, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2148, NULL, 2111, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2147, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2146, NULL, 2130, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2145, NULL, 2141, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2144, NULL, 2131, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2143, NULL, 2130, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2142, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2141, NULL, 2109, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2140, NULL, 2107, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2139, NULL, 2107, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2138, NULL, 2106, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2137, NULL, 2108, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2136, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2135, NULL, 2106, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2134, NULL, 2106, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2133, NULL, 2130, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2132, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2131, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2130, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2129, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2128, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2127, NULL, 2124, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2126, NULL, 2124, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2125, NULL, 2124, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2124, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2123, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2122, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2121, NULL, 2105, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2120, NULL, 2110, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2119, NULL, 2107, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2118, NULL, 2106, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2117, NULL, 2106, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2116, NULL, 2105, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2115, NULL, 2110, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2114, NULL, 2105, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2113, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2112, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2111, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2110, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2109, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2108, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2107, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2106, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2105, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2104, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2103, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2102, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2101, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2100, NULL, 3, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2099, NULL, 1031, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2098, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2097, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2096, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2095, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2094, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2093, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2092, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2091, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2090, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2089, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2088, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2087, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2086, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2085, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2084, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2083, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2082, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2081, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2080, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2079, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2078, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2077, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2076, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2075, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2074, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2073, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2072, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2071, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2070, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2069, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2068, NULL, 12, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2067, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2066, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2065, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2064, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2063, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2062, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2061, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2060, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2059, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2058, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2057, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2056, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2055, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2054, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2053, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2052, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2051, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2050, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2049, NULL, 12, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2048, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2047, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2046, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2045, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2044, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2043, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2042, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2041, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2040, NULL, 82, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2039, NULL, 125, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2038, NULL, 125, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2037, NULL, 125, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2036, NULL, 125, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2035, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2034, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2033, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2032, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2031, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2030, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2029, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2028, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2027, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2026, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2025, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2024, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2023, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2022, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2021, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2020, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2019, NULL, 2, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2018, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2017, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2016, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2015, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2014, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2013, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2012, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2011, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2010, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2009, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2008, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2007, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2006, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2005, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2004, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2003, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2002, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2001, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1043, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1042, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1041, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1040, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1039, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1038, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1037, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1036, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1035, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1034, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1033, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1032, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1031, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1030, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1029, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1028, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1027, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1026, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1025, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1024, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1023, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1022, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1021, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1020, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1019, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1018, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1017, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1016, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1015, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1014, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1013, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1012, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1011, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1010, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1009, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1008, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1007, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1006, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1005, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1004, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1003, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 1001, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 500, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 125, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 124, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 123, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 122, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 121, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 120, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 119, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 118, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 117, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 116, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 115, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 114, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 113, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 112, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 111, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 110, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 109, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 108, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 107, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 106, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 105, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 104, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 103, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 102, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 101, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 100, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 99, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 98, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 97, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 96, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 95, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 94, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 93, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 92, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 91, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 90, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 89, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 88, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 87, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 86, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 85, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 84, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 83, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 82, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 81, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 80, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 79, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 78, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 77, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 76, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 75, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 74, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 73, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 72, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 71, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 70, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 69, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 68, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 67, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 66, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 65, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 64, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 63, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 62, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 61, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 60, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 59, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 58, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 57, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 56, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 55, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 54, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 53, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 52, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 51, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 50, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 49, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 48, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 47, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 46, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 45, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 44, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 43, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 42, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 41, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 40, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 39, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 38, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 37, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 36, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 35, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 34, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 33, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 32, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 31, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 30, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 29, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 28, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 27, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 26, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 25, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 24, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 23, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 22, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 21, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 20, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 19, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 18, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 17, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 16, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 15, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 14, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 13, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 12, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 11, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 10, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 9, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 8, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 7, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 6, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO errtxt VALUES ( 1, 2, NULL, NULL, NULL, NULL);



/* ****************************************************** */
/* **  STEP 6 -  Remove 'old' CONTRL Documents and add ** */
/* ** 		 new CONTRL Document                   ** */
/* ****************************************************** */


DECLARE @CONTRL98AExists smallint,
	@CONTRL98BExists smallint

/* Remove the old control documents */
SELECT @CONTRL98AExists = COUNT(*) FROM msgs1 WHERE (fc = 3) and ( Upper(msgs1.mcvr) = 'CONTRLD  98ADEFAULT          UN')
IF @CONTRL98AExists > 0
BEGIN
	SELECT 'Delete document fc: 3 mcvr: "CONTRLD  98ADEFAULT          UN"' FROM parame
	DELETE FROM msgcon  WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98ADEFAULT          UN'
	DELETE FROM msgs4   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98ADEFAULT          UN'
	DELETE FROM msgs3   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98ADEFAULT          UN'
	DELETE FROM msgs2   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98ADEFAULT          UN'
	DELETE FROM msgs1   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98ADEFAULT          UN'
END
SELECT @CONTRL98BExists = COUNT(*) FROM msgs1 WHERE (fc = 3) and ( Upper(msgs1.mcvr) = 'CONTRLD  98BDEFAULT          UN')
IF @CONTRL98BExists > 0
BEGIN
	SELECT 'Delete document fc: 3 mcvr: "CONTRLD  98BDEFAULT          UN"' FROM parame
	DELETE FROM msgcon  WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98BDEFAULT          UN'
	DELETE FROM msgs4   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98BDEFAULT          UN'
	DELETE FROM msgs3   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98BDEFAULT          UN'
	DELETE FROM msgs2   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98BDEFAULT          UN'
	DELETE FROM msgs1   WHERE fc = 3 AND upper(mcvr) = 'CONTRLD  98BDEFAULT          UN'

END

IF @CONTRL98BExists > 0 OR @CONTRL98AExists > 0
BEGIN
	/* Remove all unused EDIFACT stuff from the repository */
	SELECT 'Cleanup repository for fc: 3' FROM parame
	DELETE FROM segcon
	 WHERE ( segcon.fc = 3 ) AND
	       ( NOT EXISTS ( SELECT sgmnts.snvr  FROM msgs2, sgmnts
			       WHERE ( sgmnts.fc = msgs2.fc ) and  ( sgmnts.snvr = msgs2.snvr )  and
	                  	     ( msgs2.fc = 3)  AND (sgmnts.snvr = segcon.snvr  ) ) )
	
	DELETE FROM codset
	 WHERE ( codset.fc = 3 ) AND
	        ( NOT EXISTS ( SELECT elmnts.envr  FROM elmnts, segcon
	                        WHERE ( segcon.fc = elmnts.fc ) and ( segcon.envr = elmnts.envr ) and
	                              ( elmnts.fc = 3 ) AND  ( elmnts.envr = codset.envr) ) )
	
	DELETE FROM sgmnts
	 WHERE ( sgmnts.fc = 3) AND
	       ( NOT EXISTS ( SELECT msgs2.snvr  FROM msgs2 WHERE ( msgs2.fc = 3) and (msgs2.snvr =  sgmnts.snvr)))
	
	DELETE  FROM elmnts
	WHERE ( elmnts.fc = 3 ) AND
	      ( NOT EXISTS (  SELECT *  FROM segcon  WHERE ( segcon.fc = 3)  AND ( segcon.envr =elmnts.envr )))
END




DECLARE @CONTRLD3Exists smallint

SELECT @CONTRLD3Exists = COUNT(*) FROM msgs1 WHERE (fc = 3) and ( Upper(msgs1.mcvr) = 'CONTRLD  3  DEFAULT          UN')
IF @CONTRLD3Exists = 0
BEGIN
	/* ============== REPOSITORY ============== */

	/* Elements and codeset */

	DECLARE @ElementExists smallint,
		@SegmentExists smallint

	EXEC sp_add_or_replace_element  3, 'D  3  Action, coded', 'Action, coded', 'D  ', '3  ',  1,   83, 'A',  3,   0,   1,   1,  '', '' , @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3 ) AND  ( codset.envr = 'D  3  Action, coded')
	EXEC sp_add_or_replace_codeset  3, 'D  3  Action, coded', '4', 'This level and all lower levels rej', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Action, coded', '7', 'This level acknowledged, next lower', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Action, coded', '8', 'Interchange received', ''

	EXEC sp_add_or_replace_element  3, 'D  3  Address for reverse routing', 'Address for reverse routing', 'D  ', '3  ',  0,   8, 'A',  14,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Association assigned code', 'Association assigned code', 'D  ', '3  ',  0,   57, 'A',  6,   0,   1,   1,  '', '', @ElementExists OUTPUT

	EXEC sp_add_or_replace_element  3, 'D  3  Controlling agency', 'Controlling agency', 'D  ', '3  ',  1,   51, 'A',  2,   0,   1,   1,  '', '', @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3) AND  ( codset.envr = 'D  3  Controlling agency' )
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AA', 'EDICONSTRUCT', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AB', 'DIN (Deutsches Institut fuer Normun', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AC', 'ICS (International Chamber of Shipp', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AD', 'UPU (Union Postale Universelle)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AE', 'United Kingdom ANA (Article Numberi', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AF', 'ANSI ASC X12 (American National Sta', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AG', 'US DoD (United States Department of', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AH', 'US Federal Government', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'AI', 'EDIFICAS', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'CC', 'CCC (Customs Co-operation Council)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'CE', 'CEFIC (Conseil Europeen des Federat', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'EC', 'EDICON', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'ED', 'EDIFICE (Electronic industries proj', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'EE', 'EC + EFTA (European Communities and', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'EN', 'EAN (European Article Numbering Ass', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'ER', 'UIC (International Union of railway', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'EU', 'European Union', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'EW', 'UN/EDIFACT Working Group (EWG)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'EX', 'IECC (International Express Carrier', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'IA', 'IATA (International Air Transport A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'KE', 'KEC (Korea EDIFACT Committee)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'LI', 'LIMNET', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'OD', 'ODETTE (Organization for Data Excha', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'RI', 'RINET (Reinsurance and Insurance Ne', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'RT', 'UN/ECE/TRADE/WP.4/GE.1/EDIFACT Rapp', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Controlling agency', 'UN', 'UN/CEFACT', ''

	EXEC sp_add_or_replace_element  3, 'D  3  Erroneous component data element po', 'Erroneous component data element po', 'D  ', '3  ',  0,   104, 'S',  3,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Erroneous data element position in', 'Erroneous data element position in', 'D  ', '3  ',  0,   98, 'S',  3,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Functional group reference number', 'Functional group reference number', 'D  ', '3  ',  0,   48, 'A',  14,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Interchange control reference', 'Interchange control reference', 'D  ', '3  ',  0,   20, 'A',  14,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Message reference number', 'Message reference number', 'D  ', '3  ',  0,   62, 'A',  14,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Message release number', 'Message release number', 'D  ', '3  ',  1,   54, 'A',  3,   0,   1,   1,  '', '', @ElementExists OUTPUT

	EXEC sp_add_or_replace_element  3, 'D  3  Message type', 'Message type', 'D  ', '3  ',  0,   65, 'A',  6,   0,   1,   1,  '', '', @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3) AND  ( lower(codset.envr) = lower('D  3  Message version number') )
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '00A', 'Release 2000 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '00B', 'Release 2000 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '01A', 'Release 2001 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '01B', 'Release 2001 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '01C', 'Release 2001 - C', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '02A', 'Release 2002 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '02B', 'Release 2002 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '03A', 'Release 2003 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '03B', 'Release 2003 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '1', 'First release', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '2', 'Second release', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '3', 'Third release, CONTRL message', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '901', 'Release 1990 - 901', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '902', 'Trial release 1990', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '911', 'Trial release 1991', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '912', 'Standard release 1991', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '921', 'Trial release 1992', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '932', 'Standard release 1993', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '93A', 'Release 1993 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '94A', 'Release 1994 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '94B', 'Release 1994 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '95A', 'Release 1995 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '95B', 'Release 1995 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '96A', 'Release 1996 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '96B', 'Release 1996 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '97A', 'Release 1997 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '97B', 'Release 1997 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '98A', 'Release 1998 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '98B', 'Release 1998 - B', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '99A', 'Release 1999 - A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message release number', '99B', 'Release 1999 - B', ''

	EXEC sp_add_or_replace_element  3, 'D  3  Message version number', 'Message version number', 'D  ', '3  ',  1,   52, 'A',  3,   0,   1,   1,  '', '', @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3) AND  ( codset.envr = 'D  3  Message version number' )
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', '1', 'Status 1 version', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', '2', 'Status 2 version', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', '88', '1988 version', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', '89', '1989 version', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', '90', '1990 version', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', 'D', 'Draft version/UN/EDIFACT Directory', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Message version number', 'S', 'Standard version', ''

	EXEC sp_add_or_replace_element  3, 'D  3  Partner identification code qualifi', 'Partner identification code qualifi', 'D  ', '3  ',  1,   7, 'A',  4,   0,   1,   1,  '', '', @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3) AND  ( codset.envr = 'D  3  Partner identification code qualifi')
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '1', 'DUNS (Data Universal Numbering Syst', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '103', 'TW, Trade-van', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '12', 'Telephone number', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '128', 'CH, BCNR (Swiss Clearing Bank Numbe', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '129', 'CH, BPI (Swiss Business Partner Ide', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '14', 'EAN (European Article Numbering Ass', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '144', 'US, DoDAAC (Department of Defense A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '145', 'FR, DGCP (Direction Generale de la', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '146', 'FR, DGI (Direction Generale des Imp', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '147', 'JP, JIPDEC/ECPC (Japan Information', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '148', 'ITU (International Telecommunicatio', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '18', 'AIAG (Automotive Industry Action Gr', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '22', 'INSEE (Institut National de la Stat', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '30', 'ISO 6523: Organization identificati', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '31', 'DIN (Deutsches Institut fuer Normun', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '33', 'BfA (Bundesversicherungsanstalt fue', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '34', 'National Statistical Agency', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '4', 'IATA (International Air Transport A', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '5', 'INSEE (Institut National de la Stat', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '51', 'GEIS (General Electric Information', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '52', 'INS (IBM Network Services)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '53', 'Datenzentrale des Einzelhandels', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '54', 'Bundesverband der Deutschen Baustof', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '55', 'Bank identifier code', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '57', 'KTNet (Korea Trade Network Services', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '58', 'UPU (Universal Postal Union)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '59', 'ODETTE (Organization for Data Excha', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '61', 'SCAC (Standard Carrier Alpha Code)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '63', 'ECA (Electronic Commerce Australia)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '65', 'TELEBOX 400 (Deutsche Telekom)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '8', 'UCC Communications ID (Uniform Code', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '80', 'NHS (National Health Service)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '82', 'Statens Teleforvaltning', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '84', 'Athens Chamber of Commerce', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '85', 'Swiss Chamber of Commerce', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '86', 'US Council for International Busine', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '87', 'National Federation of Chambers of', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '89', 'Association of British Chambers of', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '9', 'DUNS (Data Universal Numbering Syst', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '90', 'SITA (Societe Internationale de Tel', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '91', 'Assigned by seller or sellers agen', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', '92', 'Assigned by buyer or buyers agent', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', 'Z01', 'Vehicle registration number', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', 'ZZ', 'Mutually defined', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Partner identification code qualifi', 'ZZZ', 'Mutually defined', ''

	EXEC sp_add_or_replace_element  3, 'D  3  Recipient identification', 'Recipient identification', 'D  ', '3  ',  0,   10, 'A',  35,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Recipients identification', 'Recipients identification', 'D  ', '3  ',  0,   44, 'A',  35,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Routing address', 'Routing address', 'D  ', '3  ',  0,   14, 'A',  14,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Segment position in message', 'Segment position in message', 'D  ', '3  ',  0,   96, 'S',  6,   0,   1,   1,  '', '', @ElementExists OUTPUT
	EXEC sp_add_or_replace_element  3, 'D  3  Sender identification', 'Sender identification', 'D  ', '3  ',  0,   40, 'A',  35,   0,   1,   1,  '', '', @ElementExists OUTPUT

	EXEC sp_add_or_replace_element  3, 'D  3  Service segment tag, coded', 'Service segment tag, coded', 'D  ', '3  ',  1,   13, 'AB',  3,   1,   3,   1,  '', '', @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3) AND  ( codset.envr = 'D  3  Service segment tag, coded' )
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UCD', 'Data element error indication', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UCF', 'Functional group response', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UCI', 'Interchange response', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UCM', 'Message response', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UCS', 'Segment error indication', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNA', 'Service string advice', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNB', 'Interchange header', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNE', 'Functional group trailer', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNG', 'Functional group header', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNH', 'Message header', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNS', 'Section control', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNT', 'Message trailer', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Service segment tag, coded', 'UNZ', 'Interchange trailer', ''

	EXEC sp_add_or_replace_element  3, 'D  3  Syntax error, coded', 'Syntax error, coded', 'D  ', '3  ',  1,   85, 'A',  3,   0,   1,   1,  '', '', @ElementExists OUTPUT
	IF (@ElementExists = 1)
		DELETE FROM codset WHERE ( codset.fc = 3) AND  ( codset.envr = 'D  3  Syntax error, coded' )
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '12', 'Invalid value', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '13', 'Missing', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '14', 'Value not supported in this positio', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '15', 'Not supported in this position', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '16', 'Too many constituents', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '17', 'No agreement', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '18', 'Unspecified error', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '19', 'Invalid decimal notation', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '2', 'Syntax version or level not support', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '20', 'Character invalid as service charac', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '21', 'Invalid character(s)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '22', 'Invalid service character(s)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '23', 'Unknown Interchange sender', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '24', 'Too old', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '25', 'Test indicator not supported', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '26', 'Duplicate detected', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '27', 'Security function not supported', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '28', 'References do not match', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '29', 'Control count does not match number', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '30', 'Functional groups and messages mixe', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '31', 'More than one message type in group', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '32', 'Lower level empty', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '33', 'Invalid occurrence outside message', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '34', 'Nesting indicator not allowed', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '35', 'Too many segment repetitions', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '36', 'Too many segment group repetitions', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '37', 'Invalid type of character(s)', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '38', 'Missing digit in front of decimal s', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '39', 'Data element too long', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '40', 'Data element too short', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '41', 'Permanent communication network err', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '42', 'Temporary communication network err', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '43', 'Unknown interchange recipient', ''
	EXEC sp_add_or_replace_codeset  3, 'D  3  Syntax error, coded', '7', 'Interchange recipient not actual re', ''

	/* =================== Segments =================== */
	EXEC sp_add_or_replace_segment 3, 'Data element error indication', 'UCD', 'D  3  Data element error indication',  'D  ', '3  ', @SegmentExists OUTPUT
	IF (@SegmentExists = 1)
		DELETE segcon WHERE fc = 3 AND lower(snvr) = lower( 'D  3  Data element error indication')

	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Data element error indication',  1, 1, 'D  3  Syntax error, coded', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Data element error indication',  2, 2, 'D  3  Erroneous data element position in', 1, 1, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Data element error indication',  3, 3, 'D  3  Erroneous component data element po', 2, 0, 0, 0
	IF (@SegmentExists = 1)
		EXEC sp_update_segment_construction 	3, 'Data element error indication', 'D  3  Data element error indication', 'UCD', 'D  ', '3  '

	EXEC sp_add_or_replace_segment 3, 'Functional group response', 'UCF', 'D  3  Functional group response',  'D  ', '3  ', @SegmentExists OUTPUT
	IF (@SegmentExists = 1)
		DELETE segcon WHERE fc = 3 AND lower(snvr) = lower( 'D  3  Functional group response')

	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  1, 1, 'D  3  Functional group reference number', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  2, 2, 'D  3  Sender identification', 1, 1, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  3, 3, 'D  3  Partner identification code qualifi', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  4, 4, 'D  3  Recipients identification', 1, 1, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  5, 5, 'D  3  Partner identification code qualifi', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  6, 6, 'D  3  Action, coded', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  7, 7, 'D  3  Syntax error, coded', 0, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  8, 8, 'D  3  Service segment tag, coded', 0, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  9, 9, 'D  3  Erroneous data element position in', 1, 0, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Functional group response',  10, 10, 'D  3  Erroneous component data element po', 2, 0, 0, 0
	IF (@SegmentExists = 1)
		EXEC sp_update_segment_construction 	3, 'Functional group response', 'D  3  Functional group response', 'UCF', 'D  ', '3  '

	EXEC sp_add_or_replace_segment 3, 'Interchange response',  'UCI', 'D  3  Interchange response', 'D  ', '3  ', @SegmentExists OUTPUT
	IF (@SegmentExists = 1)
		DELETE segcon WHERE fc = 3 AND lower(snvr) = lower( 'D  3  Interchange response' )

	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  1, 1, 'D  3  Interchange control reference', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  2, 2, 'D  3  Sender identification', 1, 1, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  3, 3, 'D  3  Partner identification code qualifi', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  4, 4, 'D  3  Address for reverse routing', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  5, 5, 'D  3  Recipient identification', 1, 1, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  6, 6, 'D  3  Partner identification code qualifi', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  7, 7, 'D  3  Routing address', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  8, 8, 'D  3  Action, coded', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  9, 9, 'D  3  Syntax error, coded', 0, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  10, 10, 'D  3  Service segment tag, coded', 0, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  11, 11, 'D  3  Erroneous data element position in', 1, 0, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Interchange response',  12, 12, 'D  3  Erroneous component data element po', 2, 0, 0, 0
	IF (@SegmentExists = 1)
		EXEC sp_update_segment_construction 3, 'Interchange response', 'D  3  Interchange response', 'UCI', 'D  ', '3  '


	EXEC sp_add_or_replace_segment 3, 'Message response', 'UCM', 'D  3  Message response',  'D  ', '3  ', @SegmentExists OUTPUT
	IF (@SegmentExists = 1)
		DELETE segcon WHERE fc = 3 AND lower(snvr) = lower( 'D  3  Message response')

	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  1, 1, 'D  3  Message reference number', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  2, 2, 'D  3  Message type', 1, 1, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  3, 3, 'D  3  Message version number', 2, 0, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  4, 4, 'D  3  Message release number', 2, 0, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  5, 5, 'D  3  Controlling agency', 2, 0, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  6, 6, 'D  3  Association assigned code', 2, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  7, 7, 'D  3  Action, coded', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  8, 8, 'D  3  Syntax error, coded', 0, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  9, 9, 'D  3  Service segment tag, coded', 0, 0, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  10, 10, 'D  3  Erroneous data element position in', 1, 0, 1, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Message response',  11, 11, 'D  3  Erroneous component data element po', 2, 0, 0, 0
	IF (@SegmentExists = 1)
		EXEC sp_update_segment_construction  3, 'Message response', 'D  3  Message response', 'UCM', 'D  ', '3  '


	EXEC sp_add_or_replace_segment 3, 'Segment error indication', 'UCS', 'D  3  Segment error indication',  'D  ', '3  ', @SegmentExists OUTPUT
	IF (@SegmentExists = 1)
		DELETE segcon WHERE fc = 3 AND lower(snvr) = lower( 'D  3  Segment error indication' )

	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Segment error indication',  1, 1, 'D  3  Segment position in message', 0, 1, 0, 0
	EXEC sp_add_or_replace_segment_construction  3, 'D  3  Segment error indication',  2, 2, 'D  3  Syntax error, coded', 0, 0, 0, 0
	IF (@SegmentExists = 1)
		EXEC sp_update_segment_construction  3, 'Segment error indication', 'D  3  Segment error indication', 'UCS', 'D  ', '3  '


	/* =========== DOCUMENT =========== */

	INSERT INTO msgs1 ( fc, mcvr, mc, ver, rel, descrp, msgtyp, decnot, idstrg, linlen, bore, una, uno, conage, asascd, maxdelnot, maxtechack, ackfc, ackmcvr, numhan, signplus, signmin, routinplug, routoutplug, thtmlview, espcomment, maxrecnot, xmlsysid, xmlpubid, xflags, xslurl, pc, impconref )
		   values ( 3, 'CONTRLD  3  DEFAULT          UN', 'CONTRL', 'D  ', '3  ', 'Syntax and service report message', '', '.', '', 0, 0, 0, 2, 'UN', '      ', 0, 0, 1, '', 0, '', '', 0, 0, '[serverhome]\web\template\viewedi.html', '', 0, '', '', '00         00', '', 'DEFAULT', '                                   ' )

	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 1 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 1, 'D  3  Interchange response', 1, 1, 1, 1, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 2 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 2, 'D  3  Message response', 0, 2, 0, 2, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 3 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 3, 'D  3  Segment error indication', 0, 3, 999, 3, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 4 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 4, 'D  3  Data element error indication', 0, 4, 99, 4, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 5 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 5, 'D  3  Functional group response', 0, 2, 0, 5, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 6 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 6, 'D  3  Message response', 0, 3, 0, 6, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 7 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 7, 'D  3  Segment error indication', 0, 4, 999, 7, '', 0, '' )
	IF (SELECT count(*) FROM msgs2 where fc= 3 AND lower( mcvr )= lower ('CONTRLD  3  DEFAULT          UN') AND ssnr = 8 ) = 0
	 	INSERT INTO msgs2 ( fc, mcvr, ssnr, snvr, mancon, esplevel, nrocc, espindex, espcomment, prestyle, xflags )
		VALUES ( 3, 'CONTRLD  3  DEFAULT          UN', 8, 'D  3  Data element error indication', 0, 5, 99, 8, '', 0, '' )


	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=1 )  = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=2 )  = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 2, 1, 1, 4, '3', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=3 )  = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 3, 0, 0, 4, '4', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=4 )  = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 4, 0, 0, 4, '5', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=5  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 5, 1, 1, 4, '6', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=6  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 6, 0, 0, 4, '7', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=7  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 7, 0, 0, 4, '8', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=8  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 8, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=9  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 9, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=10  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 10, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=11  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 11, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=1 AND esnr=12  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 1, 12, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 2, 1, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=3  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 3, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=4  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 4, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=5  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 5, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=6  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 6, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=7  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 7, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=8  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 8, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=9  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 9, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=10  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 10, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=2 AND esnr=11  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 2, 11, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=3 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 3, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=3 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 3, 2, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=4 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 4, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=4 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 4, 2, 1, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=4 AND esnr=3  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 4, 3, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 2, 1, 1, 2, '3', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=3  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 3, 0, 0, 12, '4', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=4 ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 4, 1, 1, 12, '6', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=5  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 5, 0, 0, 12, '7', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=6  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 6, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=7  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 7, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=8  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 8, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=9  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 9, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=5 AND esnr=10  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 5, 10, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 2, 1, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=3  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 3, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=4  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 4, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=5  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 5, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=6  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 6, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=7  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 7, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=8  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 8, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=9  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 9, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=10 )  = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 10, 0, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=6 AND esnr=11  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 6, 11, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=7 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 7, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=7 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 7, 2, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=8 AND esnr=1  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 8, 1, 1, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=8 AND esnr=2  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 8, 2, 1, 1, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
	IF (SELECT count(*) FROM msgs3 WHERE fc = 3 AND lower(mcvr) = lower('CONTRLD  3  DEFAULT          UN') AND ssnr=8 AND esnr=3  ) = 0
		 INSERT INTO msgs3 ( fc, mcvr, ssnr, esnr, manc1, manc2, valtyp, espvalue, numhan, espcomment, rdonly, labcol, labrow, elmcol, elmrow, labalign, elmalign, xflags, imgurl, hrefurl, internal, msrvcd, tablename, columnname )
		VALUES  (3, 'CONTRLD  3  DEFAULT          UN', 8, 3, 0, 0, 0, '', 0, '', 0, 0, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, '', '' )
END
		
DROP PROCEDURE  sp_add_or_replace_codeset
DROP PROCEDURE  sp_add_or_replace_element
DROP PROCEDURE  sp_add_or_replace_segment
DROP PROCEDURE  sp_add_or_replace_segment_construction
DROP PROCEDURE  sp_update_segment_construction