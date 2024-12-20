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
ELSE
UPDATE mfcvr SET fmtid2 = '(84)00400' WHERE fcvr = '5 00400 '

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
INSERT INTO msgs1 VALUES (5,'SYNTAX00302 DEFAULT','SYNTAX','003','02 ','Service Segments X.12 release 3020','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00303 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00303 DEFAULT','SYNTAX','003','03 ','Service Segments X.12 release 3030','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00304 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00304 DEFAULT','SYNTAX','003','04 ','Service Segments X.12 release 3040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00305 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00305 DEFAULT','SYNTAX','003','05 ','Service Segments X.12 release 3050','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00307 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00307 DEFAULT','SYNTAX','003','07 ','Service Segments X.12 release 3070','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00400 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00400 DEFAULT','SYNTAX','004','00 ','Service Segments X.12 release 4010','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00402 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00402 DEFAULT','SYNTAX','004','02 ','Service Segments X.12 release 4020','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00403 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00403 DEFAULT','SYNTAX','004','03 ','Service Segments X.12 release 4030','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00404 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00404 DEFAULT','SYNTAX','004','04 ','Service Segments X.12 release 4040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

IF NOT EXISTS ( select * from msgs1 WHERE fc = 5 AND  mcvr = 'SYNTAX00405 DEFAULT')
INSERT INTO msgs1 VALUES (5,'SYNTAX00405 DEFAULT','SYNTAX','004','05 ','Service Segments X.12 release 4050','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'')

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

ALTER TABLE audin ALTER COLUMN routad CHAR(15) NULL
ALTER TABLE audin ALTER COLUMN sroutad CHAR(15) NULL

ALTER TABLE audout ALTER COLUMN routad CHAR(15) NULL
ALTER TABLE audout ALTER COLUMN sroutad CHAR(15) NULL

DROP INDEX prtnr3.sk_prtnr3_id
ALTER TABLE prtnr3 ALTER COLUMN routad CHAR(15) NULL
CREATE UNIQUE INDEX sk_prtnr3_id ON prtnr3 (id, idcdq, routad)
