

CREATE TABLE pbcattbl
(
	pbt_tnam      		char(129) NOT NULL,
	pbt_tid       		integer NULL,
	pbt_ownr      		char(129) NOT NULL,
	pbd_fhgt      		smallint NULL,
	pbd_fwgt      		smallint NULL,
	pbd_fitl      		char(1) NULL,
	pbd_funl      		char(1) NULL,
	pbd_fchr      		smallint NULL,
	pbd_fptc      		smallint NULL,
	pbd_ffce      		char(18) NULL,
	pbh_fhgt      		smallint NULL,
	pbh_fwgt      		smallint NULL,
	pbh_fitl      		char(1) NULL,
	pbh_funl      		char(1) NULL,
	pbh_fchr      		smallint NULL,
	pbh_fptc      		smallint NULL,
	pbh_ffce      		char(18) NULL,
	pbl_fhgt      		smallint NULL,
	pbl_fwgt      		smallint NULL,
	pbl_fitl      		char(1) NULL,
	pbl_funl      		char(1) NULL,
	pbl_fchr      		smallint NULL,
	pbl_fptc      		smallint NULL,
	pbl_ffce      		char(18) NULL,
	pbt_cmnt      		varchar(254) NULL
)

 



CREATE TABLE pbcatcol
(
	pbc_tnam      		char(129) NOT NULL,
	pbc_tid       		integer NULL,
	pbc_ownr      		char(129) NOT NULL,
	pbc_cnam      		char(129) NOT NULL,
	pbc_cid       		smallint NULL,
	pbc_labl      		varchar(254) NULL,
	pbc_lpos      		smallint NULL,
	pbc_hdr       		varchar(254) NULL,
	pbc_hpos      		smallint NULL,
	pbc_jtfy      		smallint NULL,
	pbc_mask      		varchar(31) NULL,
	pbc_case      		smallint NULL,
	pbc_hght      		smallint NULL,
	pbc_wdth      		smallint NULL,
	pbc_ptrn      		varchar(31) NULL,
	pbc_bmap      		char(1) NULL,
	pbc_init      		varchar(254) NULL,
	pbc_cmnt      		varchar(254) NULL,
	pbc_edit      		varchar(31) NULL,
	pbc_tag       		varchar(254) NULL
)



CREATE TABLE pbcatfmt
(
	pbf_name      		varchar(30) NOT NULL,
	pbf_frmt      		varchar(254) NULL,
	pbf_type      		smallint NULL,
	pbf_cntr      		integer NULL
)



CREATE TABLE msgfmt
(
	fc    			smallint NOT NULL,
	descrp        		char(35) NULL,
	ie    			smallint NULL,
	vrf   			smallint NULL,
	vrmsg 			smallint NULL,
	vrelm 			smallint NULL,
	vrseg 			smallint NULL,
	PRIMARY KEY (fc)
)

CREATE TABLE pbcatvld
(
	pbv_name      		varchar(30) NOT NULL,
	pbv_vald      		varchar(254) NULL,
	pbv_type      		smallint NULL,
	pbv_cntr      		integer NULL,
	pbv_msg       		varchar(254) NULL
)



CREATE TABLE pbcatedt
(
	pbe_name      		varchar(30) NOT NULL,
	pbe_edit      		varchar(254) NULL,
	pbe_type      		smallint NULL,
	pbe_cntr      		integer NULL,
	pbe_seqn      		smallint NOT NULL,
	pbe_flag      		integer NULL,
	pbe_work      		char(32) NULL
)



CREATE TABLE mfcvr
(
	fcvr  			char(8) NOT NULL,
	fc    			smallint NOT NULL,
	ver   			char(3) NOT NULL,
	rel   			char(3) NOT NULL,
	descrp        		char(35) NULL,
	decnot        		char(1) NOT NULL,
	bore  			smallint NULL,
	taglen        		smallint NULL,
	signplus      		char(1) NULL,
	signmin       		char(1) NULL,
	fmtid1        		char(20) NULL,
	fmtid2        		char(20) NULL,
	expnest       		smallint NULL,
	tagih 			char(5) NULL,
	tagit 			char(5) NULL,
	taggh 			char(5) NULL,
	taggt 			char(5) NULL,
	tagmh 			char(5) NULL,
	tagmt 			char(5) NULL,
	tagfloat      		char(5) NULL,
	usesep        		smallint NULL,
	compsep       		smallint NULL,
	elmsep        		smallint NULL,
	relchar       		smallint NULL,
	segterm       		smallint NULL,
	tagsep        		smallint NULL,
	compco        		smallint NULL,
	segco 			smallint NULL,
	floatp        		smallint NULL,
	numlis        		smallint NULL,
	numlip        		smallint NULL,
	syntid        		char(4) NULL,
	syntver       		smallint NULL,
	upcase        		smallint NULL,
	specchar      		char(32) NULL,
	conchar       		char(32) NULL,
	eightbit      		smallint NULL,
	wrapyn        		smallint NULL,
	wraplen       		smallint NULL,
	wrapsep       		smallint NULL,
	wraplsc       		smallint NULL,
	empseg        		smallint NULL,
	groupman      		smallint NULL,
	nonprint      		smallint NULL,
	noncset       		smallint NULL,
	fmtid1m       		smallint NULL,
	fmtid2m       		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	setname       		char(15) NULL,
	doubleb       		smallint NULL,
	ungroup       		smallint NULL,
	xflags        		varchar(80) NULL,
	inlinedtd     		smallint NULL,
	tagiack       		char(5) NULL,
	PRIMARY KEY (fcvr)
)

CREATE TABLE states
(
	sc    			char(4) NOT NULL,
	descrp        		char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (sc)
)

CREATE TABLE cntrys
(
	cc    			char(3) NOT NULL,
	descrp        		char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (cc)
)

CREATE TABLE prtnr1
(
	pc    			char(17) NOT NULL,
	name1 			char(35) NULL,
	name2 			char(35) NULL,
	addr1 			char(35) NULL,
	addr2 			char(35) NULL,
	city  			char(35) NULL,
	sc    			char(4) NULL,
	zip   			char(9) NULL,
	cc    			char(3) NULL,
	contact       		char(35) NULL,
	telno 			char(20) NULL,
	faxno 			char(20) NULL,
	email 			char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (pc)
)

CREATE TABLE msgsrv
(
	msrvcd        		smallint NOT NULL,
	descrp        		char(35) NULL,
	din   			varchar(254) NULL,
	dout  			varchar(254) NULL,
	mi    			smallint NULL,
	mo    			smallint NULL,
	lstat 			smallint NULL,
	stasto        		smallint NULL,
	uname 			char(35) NULL,
	pword 			char(35) NULL,
	dimin 			varchar(254) NULL,
	dimout        		varchar(254) NULL,
	exefile       		varchar(254) NULL,
	rcvscr        		varchar(254) NULL,
	sndscr        		varchar(254) NULL,
	mvc   			integer NULL,
	rcvsf 			varchar(254) NULL,
	sndsf 			varchar(254) NULL,
	rcvmscr       		varchar(254) NULL,
	sndmscr       		varchar(254) NULL,
	stextok       		char(35) NULL,
	stextfail     		char(35) NULL,
	s_idloc       		integer NULL,
	s_idsep       		char(1) NULL,
	rtextdel      		char(35) NULL,
	rtextndel     		char(35) NULL,
	r_idloc       		integer NULL,
	r_idsep       		char(1) NULL,
	espdriver     		integer NULL,
	sndarg        		char(35) NULL,
	rcvarg        		char(35) NULL,
	tframes       		integer NULL,
	dcomin        		varchar(254) NULL,
	delnot        		smallint NULL,
	dload 			varchar(254) NULL,
	ddload        		varchar(254) NULL,
	recnot        		smallint NULL,
	r_idesep      		char(1) NULL,
	s_idesep      		char(1) NULL,
	stextrec      		char(35) NULL,
	stextnrec     		char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	comscr        		varchar(254) NULL,
	commscr       		varchar(254) NULL,
	comarg        		char(35) NULL,
	comsf 			varchar(254) NULL,
	resid 			smallint NULL,
	msrvcdpp      		smallint NULL,
	applto        		smallint NULL,
	ptenabled     		smallint NULL,
	ptformat      		smallint NULL,
	ptsender      		smallint NULL,
	ptrecipient   		smallint NULL,
	ptdoctype     		smallint NULL,
	ptauth        		smallint NULL,
	PRIMARY KEY (msrvcd)
)

CREATE TABLE prtnr3
(
	pc    			char(17) NOT NULL,
	dc    			char(17) NOT NULL,
	msrvcd        		smallint NOT NULL,
	id    			char(35) NULL,
	refpas        		char(14) NULL,
	cc    			char(3) NULL,
	adn   			char(16) NULL,
	pdn   			char(16) NULL,
	ona   			varchar(254) NULL,
	oun1  			char(32) NULL,
	oun2  			char(32) NULL,
	oun3  			char(32) NULL,
	oun4  			char(32) NULL,
	srn   			char(40) NULL,
	gn    			char(16) NULL,
	ini   			char(5) NULL,
	gen   			char(3) NULL,
	idcdq 			char(4) NULL,
	uno   			smallint NULL,
	una   			smallint NULL,
	elmsep        		smallint NULL,
	compsep       		smallint NULL,
	segterm       		smallint NULL,
	relchar       		smallint NULL,
	decsep        		smallint NULL,
	spliti        		smallint NULL,
	errlevel      		smallint NULL,
	techack       		smallint NULL,
	tagsep        		smallint NULL,
	groupyn       		smallint NULL,
	wrapyn        		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	routad        		char(15) NULL,
	comnam        		varchar(64) NULL,
	descrp        		char(35) NULL,
	alldupicn     		smallint NULL,
	errlevelin    		smallint NULL,
	intack        		smallint NULL,
	ftpsrv        		smallint NULL,
	tslen 			smallint NULL,
	PRIMARY KEY (pc, dc)
)

CREATE TABLE msgsts
(
	language      		smallint NOT NULL,
	mstscd        		smallint NOT NULL,
	descrp        		char(35) NULL,
	PRIMARY KEY (language, mstscd)
)

CREATE TABLE days
(
	language      		smallint NOT NULL,
	dc    			smallint NOT NULL,
	descrp        		char(35) NULL,
	PRIMARY KEY (language, dc)
)

CREATE TABLE value1
(
	valtcd        		smallint NOT NULL,
	descrp        		char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	internal      		smallint NULL,
	msrvcd        		smallint NULL,
	tablename     		varchar(80) NULL,
	sourcecolumn  		varchar(80) NULL,
	targetcolumn  		varchar(80) NULL,
	PRIMARY KEY (valtcd)
)

CREATE TABLE value2
(
	valtcd        		smallint NOT NULL,
	inval 			char(35) NOT NULL,
	exval 			char(35) NOT NULL,
	pc    			char(17) NOT NULL,
	dc    			char(17) NOT NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (valtcd, inval, exval, pc, dc)
)

CREATE TABLE eltype
(
	elmtyp        		char(2) NOT NULL,
	maxlen        		smallint NOT NULL,
	modlen        		smallint NULL,
	descrp        		char(35) NULL,
	PRIMARY KEY (elmtyp)
)

CREATE TABLE parame
(
	pc    			char(8) NOT NULL,
	icin  			integer NOT NULL,
	msgin 			integer NOT NULL,
	msgout        		integer NOT NULL,
	icout 			integer NOT NULL,
	errnr 			integer NOT NULL,
	ownpc 			char(17) NOT NULL,
	owndc 			char(17) NOT NULL,
	stasto        		smallint NULL,
	logwnd        		smallint NULL,
	numert        		smallint NULL,
	numerc        		smallint NULL,
	pswnex        		smallint NULL,
	pswvad        		smallint NULL,
	errmail       		smallint NULL,
	language      		smallint NULL,
	licdate       		char(8) NULL,
	timestamp     		timestamp NOT NULL ,
	csn1  			integer NULL,
	csn2  			integer NULL,
	csn3  			integer NULL,
	csn4  			integer NULL,
	csn5  			integer NULL,
	csn6  			integer NULL,
	csn7  			integer NULL,
	csn8  			integer NULL,
	csn9  			integer NULL,
	csnts1        		datetime NULL,
	csnts2        		datetime NULL,
	csnts3        		datetime NULL,
	csnts4        		datetime NULL,
	csnts5        		datetime NULL,
	csnts6        		datetime NULL,
	csnts7        		datetime NULL,
	csnts8        		datetime NULL,
	csnts9        		datetime NULL,
	csnrm1        		smallint NULL,
	csnrm2        		smallint NULL,
	csnrm3        		smallint NULL,
	csnrm4        		smallint NULL,
	csnrm5        		smallint NULL,
	csnrm6        		smallint NULL,
	csnrm7        		smallint NULL,
	csnrm8        		smallint NULL,
	csnrm9        		smallint NULL,
	csnmax1       		integer NULL,
	csnmax2       		integer NULL,
	csnmax3       		integer NULL,
	csnmax4       		integer NULL,
	csnmax5       		integer NULL,
	csnmax6       		integer NULL,
	csnmax7       		integer NULL,
	csnmax8       		integer NULL,
	csnmax9       		integer NULL,
	csnmin1       		integer NULL,
	csnmin2       		integer NULL,
	csnmin3       		integer NULL,
	csnmin4       		integer NULL,
	csnmin5       		integer NULL,
	csnmin6       		integer NULL,
	csnmin7       		integer NULL,
	csnmin8       		integer NULL,
	csnmin9       		integer NULL,
	csncom1       		varchar(80) NULL,
	csncom2       		varchar(80) NULL,
	csncom3       		varchar(80) NULL,
	csncom4       		varchar(80) NULL,
	csncom5       		varchar(80) NULL,
	csncom6       		varchar(80) NULL,
	csncom7       		varchar(80) NULL,
	csncom8       		varchar(80) NULL,
	csncom9       		varchar(80) NULL,
	magic 			char(14) NULL,
	grpin 			integer NULL,
	grpout        		integer NULL,
	repolock      		char(64) NULL,
	documentshome 		varchar(255) NULL,
	mag1  			smallint NOT NULL,
	mag2  			smallint NOT NULL,
	mag3  			smallint NOT NULL,
	mag4  			smallint NOT NULL,
	mag5  			smallint NOT NULL,
	mag6  			smallint NOT NULL,
	mag7  			smallint NOT NULL,
	mag8  			smallint NOT NULL,
	mag9  			smallint NOT NULL,
	mag10 			smallint NOT NULL,
	mag11 			smallint NOT NULL,
	mag12 			smallint NOT NULL,
	mag13 			smallint NOT NULL,
	mag14 			smallint NOT NULL,
	subsystemusersgroup   	varchar(128) NULL,
	PRIMARY KEY (pc)
)

CREATE TABLE elmnts
(
	fc    			smallint NOT NULL,
	envr  			varchar(206) NOT NULL,
	elmnam        		varchar(200) NOT NULL,
	ver   			char(3) NOT NULL,
	rel   			char(3) NOT NULL,
	qualyn        		smallint NULL,
	elmtag        		smallint NULL,
	elmtyp        		char(2) NOT NULL,
	len   			smallint NOT NULL,
	fxdlen        		smallint NULL,
	elmlen        		smallint NULL,
	minlen        		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	internal      		smallint NULL,
	msrvcd        		smallint NULL,
	tablename     		varchar(80) NULL,
	columnname    		varchar(80) NULL,
	PRIMARY KEY (fc, envr)
)

CREATE TABLE sgmnts
(
	fc    			smallint NOT NULL,
	segnam        		varchar(200) NOT NULL,
	segtag        		char(5) NOT NULL,
	snvr  			varchar(206) NOT NULL,
	ver   			char(3) NOT NULL,
	rel   			char(3) NOT NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (fc, snvr)
)

CREATE TABLE msgs1
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	mc    			char(6) NOT NULL,
	ver   			char(3) NOT NULL,
	rel   			char(3) NOT NULL,
	descrp        		char(35) NULL,
	msgtyp        		char(6) NULL,
	decnot        		char(1) NOT NULL,
	idstrg        		varchar(254) NULL,
	linlen        		smallint NULL,
	bore  			smallint NULL,
	lext  			char(3) NULL,
	dlext 			char(3) NULL,
	una   			smallint NULL,
	uno   			smallint NULL,
	tlp   			varchar(254) NULL,
	tdlp  			varchar(254) NULL,
	conage        		char(2) NULL,
	asascd        		char(6) NULL,
	maxdelnot     		smallint NULL,
	maxtechack    		smallint NULL,
	ackfc 			smallint NULL,
	ackmcvr       		char(12) NULL,
	numhan        		smallint NULL,
	signplus      		char(1) NULL,
	signmin       		char(1) NULL,
	routinplug    		smallint NULL,
	inputmail     		char(35) NULL,
	ingetmail     		char(35) NULL,
	routoutplug   		smallint NULL,
	outputmail    		char(35) NULL,
	outgetmail    		char(35) NULL,
	thtmlview     		varchar(254) NULL,
	thtmledit     		varchar(254) NULL,
	htmlstyle     		char(10) NULL,
	timestamp     		timestamp NOT NULL ,
	espcomment    		varchar(160) NULL,
	maxrecnot     		smallint NULL,
	xmlsysid      		varchar(254) NULL,
	xmlpubid      		varchar(254) NULL,
	xflags        		varchar(80) NULL,
	xslurl        		varchar(254) NULL,
	pc    			char(17) NULL,
	trp   			varchar(254) NULL,
	impconref     		char(35) NULL,
	hashtot       		varchar(64) NULL,
	PRIMARY KEY (fc, mcvr)
)

CREATE TABLE msgs2
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	ssnr  			smallint NOT NULL,
	snvr  			varchar(206) NOT NULL,
	mancon        		smallint NULL,
	esplevel      		smallint NULL,
	nrocc 			smallint NULL,
	strtln        		smallint NULL,
	offset        		smallint NULL,
	idstrg        		char(35) NULL,
	espindex      		smallint NOT NULL,
	timestamp     		timestamp NOT NULL ,
	espcomment    		varchar(160) NULL,
	prestyle      		smallint NULL,
	altlab        		varchar(40) NULL,
	xflags        		varchar(80) NULL,
	PRIMARY KEY (fc, mcvr, ssnr)
)

CREATE TABLE msgs3
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	ssnr  			smallint NOT NULL,
	esnr  			smallint NOT NULL,
	manc1 			smallint NULL,
	manc2 			smallint NULL,
	valtyp        		smallint NULL,
	espvalue      		varchar(40) NULL,
	numhan        		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	espcomment    		varchar(160) NULL,
	rdonly        		smallint NULL,
	labcol        		smallint NULL,
	labrow        		smallint NULL,
	elmcol        		smallint NULL,
	elmrow        		smallint NULL,
	labalign      		smallint NULL,
	elmalign      		smallint NULL,
	xflags        		varchar(80) NULL,
	imgurl        		smallint NULL,
	hrefurl       		smallint NULL,
	altlab        		varchar(40) NULL,
	internal      		smallint NULL,
	msrvcd        		smallint NULL,
	tablename     		varchar(80) NULL,
	columnname    		varchar(80) NULL,
	PRIMARY KEY (fc, mcvr, ssnr, esnr)
)

CREATE TABLE msgs4
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	ssnr  			smallint NOT NULL,
	esnr  			smallint NOT NULL,
	qual  			varchar(254) NOT NULL,
	descrp        		char(35) NULL,
	mancon        		smallint NULL,
	pc    			char(17) NOT NULL,
	dc    			char(17) NOT NULL,
	timestamp     		timestamp NOT NULL ,
	espcomment    		varchar(160) NULL,
	PRIMARY KEY (fc, mcvr, ssnr, esnr, qual, pc, dc)
)

CREATE TABLE audin
(
	icin  			integer NOT NULL,
	msgin 			integer NOT NULL,
	dtbdd 			datetime NULL,
	tmbdd 			datetime NULL,
	dubdd 			datetime NULL,
	dtte  			datetime NULL,
	tmte  			datetime NULL,
	dute  			datetime NULL,
	dtcs  			datetime NULL,
	tmcs  			datetime NULL,
	ducs  			datetime NULL,
	pdtbdd        		datetime NULL,
	ptmbdd        		datetime NULL,
	bytcnt        		integer NULL,
	mstscd        		smallint NULL,
	pc    			char(17) NULL,
	dc    			char(17) NULL,
	msrvcd        		smallint NULL,
	sid   			char(35) NULL,
	rid   			char(35) NULL,
	refpas        		char(14) NULL,
	ti    			smallint NULL,
	icr   			char(14) NULL,
	mrn   			char(14) NULL,
	msgtyp        		char(6) NULL,
	ver   			char(3) NULL,
	rel   			char(3) NULL,
	ref   			char(35) NULL,
	ownpc 			char(17) NULL,
	owndc 			char(17) NULL,
	msgout        		integer NULL,
	icout 			integer NULL,
	sidcdq        		char(4) NULL,
	ridcdq        		char(4) NULL,
	fcvr  			char(8) NULL,
	msgttk        		char(20) NULL,
	routad        		char(15) NULL,
	del_not       		smallint NULL,
	resetyn       		smallint NULL,
	resetdate     		datetime NULL,
	resettime     		datetime NULL,
	timestamp     		timestamp NOT NULL ,
	resetby       		char(20) NULL,
	hashtot       		varchar(64) NULL,
	dttpli        		datetime NULL,
	tmtpli        		datetime NULL,
	dtfpli        		datetime NULL,
	tmfpli        		datetime NULL,
	dubddms       		smallint NULL,
	dutems        		smallint NULL,
	ducsms        		smallint NULL,
	msrvcdout     		smallint NULL,
	mcvr  			char(72) NULL,
	grpin 			integer NULL,
	gcr   			char(14) NULL,
	grpout        		integer NULL,
	sroutad       		char(15) NULL,
	docinfo1      		varchar(254) NULL,
	docinfo2      		varchar(254) NULL,
	docinfo3      		varchar(254) NULL,
	docinfo4      		varchar(254) NULL,
	docinfo5      		varchar(254) NULL,
	docinfo6      		varchar(254) NULL,
	docinfo7      		varchar(254) NULL,
	docinfo8      		varchar(254) NULL,
	docinfo9      		varchar(254) NULL,
	docinfo10     		varchar(254) NULL,
	intacksent    		smallint NULL,
	intackref     		integer NULL,
	intacktimestamp       	datetime NULL,
	passthru      		smallint NULL,
	intdate       		varchar(64) NULL,
	inttime       		varchar(64) NULL,
	servername    		varchar(63) NULL,
	erraccptd     		smallint NULL,
	messagedigest 		varchar(128) NULL,
	origfilename  		varchar(254) NULL,
	setname       		varchar(15) NULL,
	PRIMARY KEY (icin, msgin)
)

CREATE TABLE audout
(
	msgout        		integer NOT NULL,
	icout 			integer NOT NULL,
	dtbdd 			datetime NULL,
	tmbdd 			datetime NULL,
	dubdd 			datetime NULL,
	dtte  			datetime NULL,
	tmte  			datetime NULL,
	dute  			datetime NULL,
	dtcs  			datetime NULL,
	tmcs  			datetime NULL,
	ducs  			datetime NULL,
	pdtcs 			datetime NULL,
	ptmcs 			datetime NULL,
	bytcnt        		integer NULL,
	mstscd        		smallint NULL,
	pc    			char(17) NULL,
	dc    			char(17) NULL,
	msrvcd        		smallint NULL,
	sid   			char(35) NULL,
	rid   			char(35) NULL,
	refpas        		char(14) NULL,
	ti    			smallint NULL,
	msgtyp        		char(6) NULL,
	ver   			char(3) NULL,
	rel   			char(3) NULL,
	ref   			char(35) NULL,
	uname 			char(8) NULL,
	prog  			char(8) NULL,
	id_nr 			char(35) NULL,
	del_not       		smallint NULL,
	ownpc 			char(17) NULL,
	owndc 			char(17) NULL,
	icin  			integer NULL,
	msgin 			integer NULL,
	sidcdq        		char(4) NULL,
	ridcdq        		char(4) NULL,
	fcvr  			char(8) NULL,
	msgttk        		char(20) NULL,
	routad        		char(15) NULL,
	clientid      		char(35) NULL,
	resetyn       		smallint NULL,
	resetdate     		datetime NULL,
	resettime     		datetime NULL,
	timestamp     		timestamp NOT NULL ,
	resetby       		char(20) NULL,
	hashtot       		varchar(64) NULL,
	dttpli        		datetime NULL,
	tmtpli        		datetime NULL,
	dtfpli        		datetime NULL,
	tmfpli        		datetime NULL,
	prio  			smallint NULL,
	dubddms       		smallint NULL,
	dutems        		smallint NULL,
	ducsms        		smallint NULL,
	seqno 			smallint NOT NULL,
	bloffs        		integer NULL,
	msrvcdout     		smallint NULL,
	icr   			char(14) NULL,
	mrn   			char(14) NULL,
	mcvr  			char(72) NULL,
	grpout        		integer NULL,
	gcr   			char(14) NULL,
	grpin 			integer NULL,
	sroutad       		char(15) NULL,
	totalexpected 		integer NULL,
	docinfo1      		varchar(254) NULL,
	docinfo2      		varchar(254) NULL,
	docinfo3      		varchar(254) NULL,
	docinfo4      		varchar(254) NULL,
	docinfo5      		varchar(254) NULL,
	docinfo6      		varchar(254) NULL,
	docinfo7      		varchar(254) NULL,
	docinfo8      		varchar(254) NULL,
	docinfo9      		varchar(254) NULL,
	docinfo10     		varchar(254) NULL,
	intackrcvd    		smallint NULL,
	intackref     		integer NULL,
	intacktimestamp       	datetime NULL,
	passthru      		smallint NULL,
	servername    		varchar(63) NULL,
	messagedigest 		varchar(128) NULL,
	setname       		varchar(15) NULL,
	PRIMARY KEY (msgout, icout, seqno)
)

CREATE TABLE errtxt
(
	language      		smallint NOT NULL,
	etc   			smallint NOT NULL,
	descrp        		varchar(254) NULL,
	oldetc        		smallint NULL,
	cause 			varchar(3750) NULL,
	solution      		varchar(3750) NULL,
	PRIMARY KEY (language, etc)
)

CREATE TABLE errors
(
	errnr 			integer NOT NULL,
	err_date      		datetime NULL,
	err_time      		datetime NULL,
	prog  			char(20) NULL,
	msgnr 			integer NULL,
	inout 			smallint NULL,
	etc   			smallint NULL,
	descrp1       		varchar(250) NULL,
	descrp2       		varchar(250) NULL,
	timestamp     		timestamp NOT NULL ,
	errlevel      		char(1) NULL,
	descrp3       		varchar(250) NULL,
	descrp4       		varchar(250) NULL,
	servername    		varchar(63) NULL,
	lerrnr        		integer NULL,
	PRIMARY KEY (errnr)
)

CREATE TABLE msgipe
(
	frfcvr        		char(8) NOT NULL,
	frmcvr        		char(72) NOT NULL,
	pc    			char(17) NOT NULL,
	tofcvr        		char(8) NOT NULL,
	tomcvr        		char(72) NOT NULL,
	frdc  			char(17) NOT NULL,
	topc  			char(17) NOT NULL,
	todc  			char(17) NOT NULL,
	intstatus     		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	routdc        		char(17) NULL,
	testmode      		smallint NULL,
	cirfr 			smallint NULL,
	cirto 			smallint NULL,
	cirdt 			smallint NULL,
	cdrfr 			smallint NULL,
	cdrto 			smallint NULL,
	cdrdt 			smallint NULL,
	usecir        		smallint NULL,
	usecdr        		smallint NULL,
	altroutdc     		char(17) NULL,
	obbtype       		smallint NULL,
	obbident      		char(20) NULL,
	cgrfr 			smallint NULL,
	cgrto 			smallint NULL,
	cgrdt 			smallint NULL,
	usecgr        		smallint NULL,
	PRIMARY KEY (frfcvr, frmcvr, pc, frdc, topc, todc)
)

CREATE TABLE eitra1
(
	frfc  			smallint NOT NULL,
	frmcvr        		char(72) NOT NULL,
	tofc  			smallint NOT NULL,
	tomcvr        		char(72) NOT NULL,
	frssnr        		smallint NOT NULL,
	fresnr        		smallint NOT NULL,
	tossnr        		smallint NOT NULL,
	toesnr        		smallint NOT NULL,
	operat        		smallint NOT NULL,
	valtcd        		smallint NULL,
	system        		smallint NULL,
	split 			smallint NULL,
	tratyp        		smallint NOT NULL,
	frpc  			char(17) NOT NULL,
	frdc  			char(17) NOT NULL,
	topc  			char(17) NOT NULL,
	todc  			char(17) NOT NULL,
	funcreg       		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	seqnr 			smallint NOT NULL,
	espindex      		smallint NOT NULL,
	PRIMARY KEY (frfc, frmcvr, tofc, tomcvr, frssnr, fresnr, tossnr, toesnr, frpc, frdc, topc, todc, seqnr)
)

CREATE TABLE tracon
(
	frfc  			smallint NOT NULL,
	frmcvr        		char(72) NOT NULL,
	frssnr        		smallint NOT NULL,
	fresnr        		smallint NOT NULL,
	tofc  			smallint NOT NULL,
	tomcvr        		char(72) NOT NULL,
	tossnr        		smallint NOT NULL,
	toesnr        		smallint NOT NULL,
	fromto        		smallint NOT NULL,
	seqnr 			smallint NOT NULL,
	seqno 			smallint NOT NULL,
	ssnr  			smallint NOT NULL,
	esnr  			smallint NOT NULL,
	occno 			smallint NULL,
	operat        		smallint NOT NULL,
	espvalue      		varchar(80) NULL,
	andor 			smallint NULL,
	frpc  			char(17) NOT NULL,
	frdc  			char(17) NOT NULL,
	topc  			char(17) NOT NULL,
	todc  			char(17) NOT NULL,
	olevel        		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	clevel        		smallint NULL,
	espindex      		smallint NULL,
	PRIMARY KEY (frfc, frmcvr, frssnr, fresnr, tofc, tomcvr, tossnr, toesnr, fromto, seqnr, seqno, frpc, frdc, topc, todc)
)

CREATE TABLE codset
(
	fc    			smallint NOT NULL,
	envr  			varchar(206) NOT NULL,
	code  			varchar(254) NOT NULL,
	descrp        		char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	espcomment    		varchar(160) NULL,
	PRIMARY KEY (fc, envr, code)
)

CREATE TABLE trafun
(
	frpc  			char(17) NOT NULL,
	frdc  			char(17) NOT NULL,
	topc  			char(17) NOT NULL,
	todc  			char(17) NOT NULL,
	frfc  			smallint NOT NULL,
	frmcvr        		char(72) NOT NULL,
	frssnr        		smallint NOT NULL,
	fresnr        		smallint NOT NULL,
	tofc  			smallint NOT NULL,
	tomcvr        		char(72) NOT NULL,
	seqnr 			smallint NOT NULL,
	fxdval        		char(40) NULL,
	freg1 			smallint NULL,
	freg2 			smallint NULL,
	freg3 			smallint NULL,
	freg4 			smallint NULL,
	freg5 			smallint NULL,
	offset        		smallint NULL,
	overlen       		smallint NULL,
	field1        		smallint NULL,
	cval1 			char(10) NULL,
	operat        		char(1) NULL,
	field2        		smallint NULL,
	cval2 			char(10) NULL,
	tofreg        		smallint NULL,
	descrp        		char(35) NULL,
	timestamp     		timestamp NOT NULL ,
	condit        		smallint NULL,
	espindex      		smallint NULL,
	PRIMARY KEY (frpc, frdc, topc, todc, frfc, frmcvr, frssnr, fresnr, tofc, tomcvr, seqnr)
)

CREATE TABLE segcon
(
	fc    			smallint NOT NULL,
	snvr  			varchar(206) NOT NULL,
	esnr  			smallint NOT NULL,
	espindex      		smallint NOT NULL,
	envr  			varchar(206) NOT NULL,
	compos        		smallint NULL,
	manc1 			smallint NULL,
	manc2 			smallint NULL,
	pos   			smallint NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (fc, snvr, esnr)
)

CREATE TABLE msgcon
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	pc    			char(17) NOT NULL,
	dc    			char(17) NOT NULL,
	ssnr  			smallint NOT NULL,
	esnr  			smallint NOT NULL,
	seqno 			smallint NOT NULL,
	olevel        		smallint NULL,
	ssnrlo        		smallint NOT NULL,
	esnrlo        		smallint NOT NULL,
	occno 			smallint NULL,
	operat        		smallint NOT NULL,
	espvalue      		varchar(80) NULL,
	andor 			smallint NULL,
	errlevel      		smallint NULL,
	timestamp     		timestamp NOT NULL ,
	clevel        		smallint NULL,
	espindex      		smallint NULL,
	PRIMARY KEY (fc, mcvr, pc, dc, ssnr, esnr, seqno)
)

CREATE TABLE htmlta
(
	htmlstyle     		char(10) NOT NULL,
	bseglab       		char(35) NOT NULL,
	eseglab       		char(35) NOT NULL,
	belmlab       		char(35) NOT NULL,
	eelmlab       		char(35) NOT NULL,
	belmcon       		char(35) NOT NULL,
	eelmcon       		char(35) NOT NULL,
	styledes      		char(35) NULL,
	htmlversion   		char(5) NOT NULL,
	timestamp     		timestamp NOT NULL ,
	xflags        		varchar(160) NULL,
	PRIMARY KEY (htmlstyle)
)

CREATE TABLE htmlba
(
	htmlversion   		char(5) NOT NULL,
	segline       		varchar(254) NOT NULL,
	elmline       		varchar(254) NOT NULL,
	cbxline       		varchar(254) NOT NULL,
	selbody       		varchar(254) NOT NULL,
	selitem       		varchar(254) NOT NULL,
	descrp        		char(35) NULL,
	special       		varchar(254) NULL,
	keyw1 			char(20) NULL,
	keyw2 			char(20) NULL,
	keyw3 			char(20) NULL,
	keyw4 			char(20) NULL,
	keyw5 			char(20) NULL,
	keyw6 			char(20) NULL,
	keyw7 			char(20) NULL,
	keyw8 			char(20) NULL,
	keyw9 			char(20) NULL,
	keyw10        		char(20) NULL,
	keyw11        		char(20) NULL,
	keyw12        		char(20) NULL,
	keyw13        		char(20) NULL,
	keyw14        		char(20) NULL,
	keyw15        		char(20) NULL,
	keyw16        		char(20) NULL,
	keyw17        		char(20) NULL,
	keyw18        		char(20) NULL,
	PRIMARY KEY (htmlversion)
)

CREATE TABLE charset
(
	setname       		char(15) NOT NULL,
	descrp        		char(35) NOT NULL,
	intcode       		smallint NOT NULL,
	PRIMARY KEY (setname)
)

CREATE TABLE timefr
(
	msrvcd        		smallint NOT NULL,
	dc    			smallint NOT NULL,
	snr   			smallint NOT NULL,
	ts    			char(4) NOT NULL,
	te    			char(4) NOT NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (msrvcd, dc, snr)
)

CREATE TABLE esptxt
(
	language      		smallint NOT NULL,
	textno        		smallint NOT NULL,
	text  			varchar(80) NULL,
	PRIMARY KEY (language, textno)
)

CREATE TABLE dom3
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	ssnr  			smallint NOT NULL,
	esnr  			smallint NOT NULL,
	valtyp        		smallint NULL,
	espvalue      		varchar(40) NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (fc, mcvr, ssnr, esnr)
)

CREATE TABLE dom1
(
	fc    			smallint NOT NULL,
	mcvr  			char(72) NOT NULL,
	blockno       		integer NOT NULL,
	blocklen      		smallint NOT NULL,
	block 			varchar(250) NOT NULL,
	timestamp     		timestamp NOT NULL ,
	PRIMARY KEY (fc, mcvr, blockno)
)

CREATE TABLE custids
(
	type  			char(1) NOT NULL,
	frpc  			char(17) NOT NULL,
	topc  			char(17) NOT NULL,
	fcvr  			char(8) NOT NULL,
	mcvr  			char(72) NOT NULL,
	nextval       		integer NOT NULL,
	reset 			smallint NOT NULL,
	minval        		integer NOT NULL,
	maxval        		integer NOT NULL,
	mask  			char(80) NULL,
	dtlstreset    		datetime NULL,
	timestamp     		timestamp NOT NULL ,
	transnumb     		smallint NULL,
	incrval       		smallint NOT NULL,
	PRIMARY KEY (type, frpc, topc, fcvr, mcvr)
)

CREATE TABLE authgrps
(
	id    			integer NOT NULL,
	descrp        		char(35) NOT NULL,
	PRIMARY KEY (id)
)

CREATE TABLE bpauth
(
	pc    			char(17) NOT NULL,
	dc    			char(17) NOT NULL,
	agid  			integer NOT NULL,
	PRIMARY KEY (pc, dc, agid)
)

CREATE TABLE agmaps
(
	agid  			integer NOT NULL,
	frfcvr        		char(8) NOT NULL,
	frmcvr        		char(72) NOT NULL,
	tofcvr        		char(8) NOT NULL,
	tomcvr        		char(72) NOT NULL,
	direction     		smallint NOT NULL,
	PRIMARY KEY (agid, frfcvr, frmcvr, direction)
)

CREATE TABLE heartbeat
(
	servername    		varchar(63) NOT NULL,
	heartbeat     		datetime NOT NULL,
	PRIMARY KEY (servername)
)

CREATE TABLE numbers
(
	typecd        		smallint NOT NULL,
	nextnr        		integer NOT NULL,
	timestamp     		timestamp NOT NULL ,
	filler        		char(2048) NULL,
	PRIMARY KEY (typecd)
)

CREATE TABLE relrcpt
(
	servername    		char(63) NOT NULL,
	uuid  			char(40) NOT NULL
)

CREATE TABLE ediservers
(
	servername    		char(63) NOT NULL,
	ipaddress     		char(20) NULL,
	port  			integer NOT NULL,
	active_date   		datetime NULL,
	active_time   		datetime NULL,
	PRIMARY KEY (servername)
)

CREATE TABLE uritopc
(
	uri   			varchar(256) NOT NULL,
	pc    			integer NOT NULL,
	pname 			varchar(256) NULL,
	PRIMARY KEY (uri)
)










GO

INSERT INTO charset VALUES ('ISO-646','ISO character set 646 7-bit',50)

INSERT INTO charset VALUES ('ISO-8859-1','ISO character set 8859 Latin 1',1)

INSERT INTO charset VALUES ('ISO-8859-2','ISO character set 8859 Latin 2',2)

INSERT INTO charset VALUES ('ISO-8859-3','ISO character set 8859 Latin 3',3)

INSERT INTO charset VALUES ('ISO-8859-5','ISO character set 8859 Cyrillic',5)

INSERT INTO charset VALUES ('ISO-8859-7','ISO character set 8859 Modern Greek',7)

INSERT INTO charset VALUES ('ISO-IR-149','ISO character set IR149 Korean',34)

INSERT INTO charset VALUES ('UNOA','UNOA',11)

INSERT INTO charset VALUES ('UNOB','UNOB',12)

INSERT INTO charset VALUES ('UNOC','UNOC',13)

INSERT INTO charset VALUES ('UNOD','UNOD',14)

INSERT INTO charset VALUES ('UNOE','UNOE',15)

INSERT INTO charset VALUES ('UNOF','UNOF',16)

INSERT INTO charset VALUES ('UNOG','UNOG',17)

INSERT INTO cntrys VALUES ('DF','Default country',NULL)

INSERT INTO cntrys VALUES ('NL','The Netherlands',NULL)

INSERT INTO codset VALUES (3,'4  1  Action, coded','4','This level and all lower levels rej',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Action, coded','7','This level acknowledged, next lower',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Action, coded','8','Interchange received',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AA','EDICONSTRUCT',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AB','DIN (Deutsches Institut fuer Normun',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AC','ICS (International Chamber of Shipp',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AD','UPU (Union Postale Universelle)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AE','United Kingdom ANA (Article Numberi',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AF','ANSI ASC X12 (American National Sta',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AG','US DoD (United States Department of',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AH','US Federal Government',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','AI','EDIFICAS',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','CC','CCC (Customs Co-operation Council)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','CE','CEFIC (Conseil Europeen des Federat',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','EC','EDICON',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','ED','EDIFICE (Electronic industries proj',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','EE','EC + EFTA (European Communities and',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','EN','EAN (European Article Numbering Ass',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','ER','UIC (International Union of railway',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','EU','European Union',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','EW','UN/EDIFACT Working Group (EWG)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','EX','IECC (International Express Carrier',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','IA','IATA (International Air Transport A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','KE','KEC (Korea EDIFACT Committee)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','LI','LIMNET',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','OD','ODETTE (Organization for Data Excha',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','RI','RINET (Reinsurance and Insurance Ne',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','RT','UN/ECE/TRADE/WP.4/GE.1/EDIFACT Rapp',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Controlling agency','UN','UN/CEFACT',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','00A','Release 2000 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','00B','Release 2000 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','01A','Release 2001 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','01B','Release 2001 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','01C','Release 2001 - C',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','02A','Release 2002 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','02B','Release 2002 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','03A','Release 2003 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','03B','Release 2003 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','1','First release',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','2','Second release',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','3','Third release, CONTRL message',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','901','Release 1990 - 901',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','902','Trial release 1990',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','911','Trial release 1991',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','912','Standard release 1991',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','921','Trial release 1992',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','932','Standard release 1993',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','93A','Release 1993 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','94A','Release 1994 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','94B','Release 1994 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','95A','Release 1995 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','95B','Release 1995 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','96A','Release 1996 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','96B','Release 1996 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','97A','Release 1997 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','97B','Release 1997 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','98A','Release 1998 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','98B','Release 1998 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','99A','Release 1999 - A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message release number','99B','Release 1999 - B',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','1','Status 1 version',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','2','Status 2 version',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','88','1988 version',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','89','1989 version',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','90','1990 version',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','D','Draft version/UN/EDIFACT Directory',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Message version number','S','Standard version',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','1','DUNS (Data Universal Numbering Syst',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','103','TW, Trade-van',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','12','Telephone number',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','128','CH, BCNR (Swiss Clearing Bank Numbe',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','129','CH, BPI (Swiss Business Partner Ide',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','14','EAN (European Article Numbering Ass',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','144','US, DoDAAC (Department of Defense A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','145','FR, DGCP (Direction Generale de la',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','146','FR, DGI (Direction Generale des Imp',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','147','JP, JIPDEC/ECPC (Japan Information',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','148','ITU (International Telecommunicatio',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','18','AIAG (Automotive Industry Action Gr',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','22','INSEE (Institut National de la Stat',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','30','ISO 6523: Organization identificati',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','31','DIN (Deutsches Institut fuer Normun',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','33','BfA (Bundesversicherungsanstalt fue',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','34','National Statistical Agency',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','4','IATA (International Air Transport A',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','5','INSEE (Institut National de la Stat',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','51','GEIS (General Electric Information',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','52','INS (IBM Network Services)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','53','Datenzentrale des Einzelhandels',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','54','Bundesverband der Deutschen Baustof',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','55','Bank identifier code',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','57','KTNet (Korea Trade Network Services',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','58','UPU (Universal Postal Union)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','59','ODETTE (Organization for Data Excha',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','61','SCAC (Standard Carrier Alpha Code)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','63','ECA (Electronic Commerce Australia)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','65','TELEBOX 400 (Deutsche Telekom)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','8','UCC Communications ID (Uniform Code',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','80','NHS (National Health Service)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','82','Statens Teleforvaltning',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','84','Athens Chamber of Commerce',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','85','Swiss Chamber of Commerce',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','86','US Council for International Busine',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','87','National Federation of Chambers of',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','89','Association of British Chambers of',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','9','DUNS (Data Universal Numbering Syst',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','90','SITA (Societe Internationale de Tel',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','91','Assigned by seller or seller''s agen',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','92','Assigned by buyer or buyer''s agent',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','Z01','Vehicle registration number',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','ZZ','Mutually defined',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Partner identification code qualifi','ZZZ','Mutually defined',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCD','Data element error indication',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCF','Functional group response',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCI','Interchange response',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCM','Message response',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UCS','Segment error indication',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNA','Service string advice',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNB','Interchange header',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNE','Functional group trailer',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNG','Functional group header',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNH','Message header',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNS','Section control',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNT','Message trailer',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Service segment tag, coded','UNZ','Interchange trailer',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','12','Invalid value',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','13','Missing',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','14','Value not supported in this positio',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','15','Not supported in this position',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','16','Too many constituents',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','17','No agreement',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','18','Unspecified error',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','19','Invalid decimal notation',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','2','Syntax version or level not support',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','20','Character invalid as service charac',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','21','Invalid character(s)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','22','Invalid service character(s)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','23','Unknown Interchange sender',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','24','Too old',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','25','Test indicator not supported',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','26','Duplicate detected',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','27','Security function not supported',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','28','References do not match',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','29','Control count does not match number',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','30','Functional groups and messages mixe',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','31','More than one message type in group',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','32','Lower level empty',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','33','Invalid occurrence outside message',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','34','Nesting indicator not allowed',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','35','Too many segment repetitions',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','36','Too many segment group repetitions',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','37','Invalid type of character(s)',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','38','Missing digit in front of decimal s',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','39','Data element too long',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','40','Data element too short',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','41','Permanent communication network err',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','42','Temporary communication network err',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','43','Unknown interchange recipient',NULL,'')

INSERT INTO codset VALUES (3,'4  1  Syntax error, coded','7','Interchange recipient not actual re',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Action, coded','4','This level and all lower levels rej',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Action, coded','7','This level acknowledged, next lower',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Action, coded','8','Interchange received',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AA','EDICONSTRUCT',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AB','DIN (Deutsches Institut fuer Normun',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AC','ICS (International Chamber of Shipp',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AD','UPU (Union Postale Universelle)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AE','United Kingdom ANA (Article Numberi',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AF','ANSI ASC X12 (American National Sta',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AG','US DoD (United States Department of',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AH','US Federal Government',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','AI','EDIFICAS',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','CC','CCC (Customs Co-operation Council)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','CE','CEFIC (Conseil Europeen des Federat',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','EC','EDICON',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','ED','EDIFICE (Electronic industries proj',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','EE','EC + EFTA (European Communities and',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','EN','EAN (European Article Numbering Ass',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','ER','UIC (International Union of railway',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','EU','European Union',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','EW','UN/EDIFACT Working Group (EWG)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','EX','IECC (International Express Carrier',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','IA','IATA (International Air Transport A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','KE','KEC (Korea EDIFACT Committee)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','LI','LIMNET',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','OD','ODETTE (Organization for Data Excha',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','RI','RINET (Reinsurance and Insurance Ne',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','RT','UN/ECE/TRADE/WP.4/GE.1/EDIFACT Rapp',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Controlling agency','UN','UN/CEFACT',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','00A','Release 2000 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','00B','Release 2000 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','01A','Release 2001 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','01B','Release 2001 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','01C','Release 2001 - C',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','02A','Release 2002 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','02B','Release 2002 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','03A','Release 2003 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','03B','Release 2003 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','1','First release',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','2','Second release',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','3','Third release, CONTRL message',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','901','Release 1990 - 901',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','902','Trial release 1990',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','911','Trial release 1991',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','912','Standard release 1991',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','921','Trial release 1992',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','932','Standard release 1993',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','93A','Release 1993 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','94A','Release 1994 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','94B','Release 1994 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','95A','Release 1995 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','95B','Release 1995 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','96A','Release 1996 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','96B','Release 1996 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','97A','Release 1997 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','97B','Release 1997 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','98A','Release 1998 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','98B','Release 1998 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','99A','Release 1999 - A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message release number','99B','Release 1999 - B',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','1','Status 1 version',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','2','Status 2 version',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','88','1988 version',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','89','1989 version',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','90','1990 version',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','D','Draft version/UN/EDIFACT Directory',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Message version number','S','Standard version',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','1','DUNS (Data Universal Numbering Syst',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','103','TW, Trade-van',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','12','Telephone number',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','128','CH, BCNR (Swiss Clearing Bank Numbe',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','129','CH, BPI (Swiss Business Partner Ide',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','14','EAN (European Article Numbering Ass',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','144','US, DoDAAC (Department of Defense A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','145','FR, DGCP (Direction Generale de la',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','146','FR, DGI (Direction Generale des Imp',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','147','JP, JIPDEC/ECPC (Japan Information',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','148','ITU (International Telecommunicatio',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','18','AIAG (Automotive Industry Action Gr',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','22','INSEE (Institut National de la Stat',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','30','ISO 6523: Organization identificati',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','31','DIN (Deutsches Institut fuer Normun',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','33','BfA (Bundesversicherungsanstalt fue',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','34','National Statistical Agency',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','4','IATA (International Air Transport A',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','5','INSEE (Institut National de la Stat',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','51','GEIS (General Electric Information',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','52','INS (IBM Network Services)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','53','Datenzentrale des Einzelhandels',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','54','Bundesverband der Deutschen Baustof',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','55','Bank identifier code',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','57','KTNet (Korea Trade Network Services',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','58','UPU (Universal Postal Union)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','59','ODETTE (Organization for Data Excha',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','61','SCAC (Standard Carrier Alpha Code)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','63','ECA (Electronic Commerce Australia)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','65','TELEBOX 400 (Deutsche Telekom)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','8','UCC Communications ID (Uniform Code',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','80','NHS (National Health Service)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','82','Statens Teleforvaltning',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','84','Athens Chamber of Commerce',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','85','Swiss Chamber of Commerce',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','86','US Council for International Busine',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','87','National Federation of Chambers of',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','89','Association of British Chambers of',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','9','DUNS (Data Universal Numbering Syst',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','90','SITA (Societe Internationale de Tel',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','91','Assigned by seller or seller''s agen',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','92','Assigned by buyer or buyer''s agent',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','Z01','Vehicle registration number',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','ZZ','Mutually defined',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Partner identification code qualifi','ZZZ','Mutually defined',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UCD','Data element error indication',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UCF','Functional group response',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UCI','Interchange response',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UCM','Message response',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UCS','Segment error indication',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNA','Service string advice',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNB','Interchange header',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNE','Functional group trailer',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNG','Functional group header',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNH','Message header',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNS','Section control',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNT','Message trailer',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Service segment tag, coded','UNZ','Interchange trailer',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','12','Invalid value',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','13','Missing',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','14','Value not supported in this positio',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','15','Not supported in this position',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','16','Too many constituents',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','17','No agreement',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','18','Unspecified error',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','19','Invalid decimal notation',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','2','Syntax version or level not support',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','20','Character invalid as service charac',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','21','Invalid character(s)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','22','Invalid service character(s)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','23','Unknown Interchange sender',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','24','Too old',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','25','Test indicator not supported',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','26','Duplicate detected',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','27','Security function not supported',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','28','References do not match',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','29','Control count does not match number',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','30','Functional groups and messages mixe',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','31','More than one message type in group',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','32','Lower level empty',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','33','Invalid occurrence outside message',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','34','Nesting indicator not allowed',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','35','Too many segment repetitions',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','36','Too many segment group repetitions',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','37','Invalid type of character(s)',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','38','Missing digit in front of decimal s',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','39','Data element too long',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','40','Data element too short',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','41','Permanent communication network err',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','42','Temporary communication network err',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','43','Unknown interchange recipient',NULL,'')

INSERT INTO codset VALUES (3,'D  3  Syntax error, coded','7','Interchange recipient not actual re',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','1','Mandatory data element missing',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','2','Conditional required data element m',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','3','Too many data elements.',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','4','Data element too short.',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','5','Data element too long.',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','6','Invalid character in data element.',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','7','Invalid code value.',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','8','Invalid Date',NULL,'')

INSERT INTO codset VALUES (5,'002040Data Element Syntax Error Code','9','Invalid Time',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Acknowledge Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Acknowledge Code','E','Accepted, But Errors Were Noted.',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Acknowledge Code','P','Partially Accepted, At Least One Tr',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Acknowledge Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Syntax Error Code','1','Functional Group Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Syntax Error Code','2','Functional Group Version Not Suppor',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Syntax Error Code','3','Functional Group Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Syntax Error Code','4','Data Interchange Control Number in',NULL,'')

INSERT INTO codset VALUES (5,'002040Functional Group Syntax Error Code','5','Number of Included Transaction Sets',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','1','Unrecognized segment ID',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','2','Unexpected segment',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','3','Mandatory segment missing',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','4','Loop Occurs Over Maximum Times',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','5','Segment Exceeds Maximum Use',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','6','Segment Not in Defined Transaction',NULL,'')

INSERT INTO codset VALUES (5,'002040Segment Syntax Error Code','7','Segment Not in Proper Sequence',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Acknowledgment Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Acknowledgment Code','E','Accepted But Errors Were Noted',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Acknowledgment Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','1','Transaction Set Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','2','Transaction Set Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','3','Transaction Set Control Number in H',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','4','Number of Included Segments Does No',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','5','One or More Segments in Error',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','6','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'002040Transaction Set Syntax Error Code','7','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','1','Mandatory data element missing',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','2','Conditional required data element m',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','3','Too many data elements.',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','4','Data element too short.',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','5','Data element too long.',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','6','Invalid character in data element.',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','7','Invalid code value.',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','8','Invalid Date',NULL,'')

INSERT INTO codset VALUES (5,'003010Data Element Syntax Error Code','9','Invalid Time',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Acknowledge Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Acknowledge Code','E','Accepted, But Errors Were Noted.',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Acknowledge Code','P','Partially Accepted, At Least One Tr',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Acknowledge Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Syntax Error Code','1','Functional Group Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Syntax Error Code','2','Functional Group Version Not Suppor',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Syntax Error Code','3','Functional Group Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Syntax Error Code','4','Data Interchange Control Number in',NULL,'')

INSERT INTO codset VALUES (5,'003010Functional Group Syntax Error Code','5','Number of Included Transaction Sets',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','1','Unrecognized segment ID',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','2','Unexpected segment',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','3','Mandatory segment missing',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','4','Loop Occurs Over Maximum Times',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','5','Segment Exceeds Maximum Use',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','6','Segment Not in Defined Transaction',NULL,'')

INSERT INTO codset VALUES (5,'003010Segment Syntax Error Code','7','Segment Not in Proper Sequence',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Acknowledgment Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Acknowledgment Code','E','Accepted But Errors Were Noted',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Acknowledgment Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','1','Transaction Set Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','2','Transaction Set Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','3','Transaction Set Control Number in H',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','4','Number of Included Segments Does No',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','5','One or More Segments in Error',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','6','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'003010Transaction Set Syntax Error Code','7','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','1','Mandatory data element missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','10','Exclusion Condition Violated',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','2','Conditional required data element m',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','3','Too many data elements.',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','4','Data element too short.',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','5','Data element too long.',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','6','Invalid character in data element.',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','7','Invalid code value.',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','8','Invalid Date',NULL,'')

INSERT INTO codset VALUES (5,'003060Data Element Syntax Error Code','9','Invalid Time',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','E','Accepted, But Errors Were Noted.',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','M','Rejected, Message Authentication Co',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','P','Partially Accepted, At Least One Tr',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','W','Rejected, Assurance Failed Validity',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Acknowledge Code','X','Rejected, Content After Decryption',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','1','Functional Group Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','10','Authentication Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','11','Encryption Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','12','Requested Service (Authentication o',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','13','Unknown Security Recipient',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','14','Unknown Security Originator',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','15','Syntax Error in Decrypted Text',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','16','Security Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','17','Incorrect Message Length (Encryptio',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','18','Message Authentication Code Failed',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','19','S1E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','2','Functional Group Version Not Suppor',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','20','S1S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','21','S2E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','22','S2S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','3','Functional Group Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','4','Group Control Number in the Functio',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','5','Number of Included Transaction Sets',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Group Syntax Error Code','6','Group Control Number Violates Synta',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AA','Customer Account Analysis (822)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AF','Application for Admission to Educat',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AG','Application Advice (824)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AI','Automotive Inspection Detail (928)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AK','Student Educational Record (Transcr',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AL','Set Cancellation (998) and Applicat',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AN','Return Merchandise Authorization an',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AR','Warehouse Stock Transfer Shipment A',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AS','Appointment Schedule Information (1',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','AW','Warehouse Inventory Adjustment Advi',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','BE','Benefit Enrollment and Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','BS','Shipment and Billing Notice (857)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CA','Purchase Order Change Acknowledgmen',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CC','Clauses and Provisions (504)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CD','Credit/Debit Adjustment (812)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CF','Corporate Financial Adjustment Info',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CG','Administrative Message (994)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CH','Car Handling Information (420)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CI','Consolidated Service Invoice/Statem',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CJ','Manufacturer Coupon Family Code Str',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CK','Manufacturer Coupon Redemption Deta',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CM','Component Parts Content (871)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CN','Coupon Notification (887)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CO','Cooperative Advertising Agreement (',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CP','Electronic Proposal Information (25',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CR','Rail Carhire Settlements (414)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CS','Cryptographic Service Message (815)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','CT','Application Control Totals (831)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','D3','Contract Completion Status (567)',NULL,'Transaction set for reporting the administrative closure status of physically completed contracts')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','D4','Contract Abstract (561)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','D5','Contract Payment Management Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DA','Debit Authoriztion (828)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DD','Shipment Delivery Discrepancy Infor',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DF','Market Development Fund Allocation',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DI','Dealer Information (128)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DM','Shipper''s Car Order (422)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DS','Data Status Tracking (242)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','DX','Direct Exchange Delivery and Return',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','EC','Educational Course Inventory (188)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','ED','Student Educational Record (Transcr',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','EI','Railroad Equipment Inquiry or Advic',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','ER','Revenue Receipts Statement (170)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','EV','Railroad Event Report (451)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FA','Functional Acknowledgment (997)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FB','Freight Invoice (859)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FC','Court Notice (175)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FG','Motor Carrier Loading and Route Gui',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FH','Motor Carrier Tariff Information (2',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FR','Financial Reporting (821, 827)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','FT','File Transfer (996)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','GB','Average Agreement Demurrage (423)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','GC','Damage Claim Transaction Sets (920,',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','GF','Response to a Load Tender (990)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','GP','Grocery Products Invoice (880)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','GR','Statistical Government Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','GT','Grant or Assistance Application (19',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HB','Eligibility, Coverage or Benefit In',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HC','Health Care Claim (837)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HI','Health Care Services Review Informa',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HN','Health Care Claim Status Notificati',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HP','Health Care Claim Payment/Advice (8',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HR','Health Care Claim Status Request (2',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','HS','Eligibility, Coverage or Benefit In',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IA','Air Freight Details and Invoice (11',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IB','Inventory Inquiry/Advice (846)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IC','Rail Advance Interchange Consist (4',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','ID','Insurance/Annuity Application Statu',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IG','Invoice Group - Grocery (880, 882)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','II','Rail Freight Details and Invoice Su',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IJ','Report of Injury, Illness or Incide',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IM','Motor Carrier Freight Details and I',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IN','Invoice Information (810,819)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IO','Ocean Shipment Billing Details (310',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IP','Intermodal Ramp Activity (622)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IR','Rail Carrier Freight Details and In',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','IS','Estimated Time of Arrival and Car S',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LA','Federal Communications Commission (',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LB','Lockbox (823)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LI','Locomotive Information (436)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LN','Property and Casualty Loss Notifica',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LR','Logistics Reassignment (536)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LS','Asset Schedule (851)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','LT','Student Loan Transfer and Status Ve',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MB','Mortgage Credit Report (200)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MD','Department of Defense Inventory Man',NULL,'Transactions related to the interchange of information involving material in the supply, control, and distribution systems and financial management of the Depar')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','ME','Mortgage Origination (261, 262)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MF','Market Development Funds Settlement',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MG','Mortgage Servicing Transaction Sets',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MH','Secondary Mortgage Market Investor',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MI','Motor Carrier Shipment Status Inqui',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','ML','Mortgage Credit Report Order (201,',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MP','Motion Picture Booking Confirmation',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MR','Multilevel Railcar Load Details (12',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MS','Material Safety Data Sheet (848)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MT','Electronic Form Structure (868)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MV','Material Obligation Validation (517',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MW','Rail Waybill Response (427)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','MX','Material Claim (847)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','NC','Nonconformance Report (842)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','NT','Notice of Tax Adjustment or Assessm',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','OC','Cargo Insurance Advice of Shipment',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','OG','Order Group - Grocery (875, 876)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','OR','Organizational Relationship (816)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','OW','Warehouse Shipping Order (940)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PA','Price Authorization Acknowledgment/',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PB','Railroad Parameter Trace Registrati',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PC','Purchase Order Change Request - Buy',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PD','Product Activity Data (852)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PE','Periodic Annuity Compensation (256)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PH','Pricing History (503)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PI','Patient Information (275)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PJ','Project Schedule Reporting (806)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PK','Project Cost Reporting (839) and Co',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PL','Railroad Problem Log Inquiry or Adv',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PM','Residential Mortgage Insurance Appl',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PO','Purchase Order (850)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PR','Purchase Order Acknowledgement (855',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PS','Planning Schedule with Release Capa',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PT','Product Transfer and Resale Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PV','Purchase Order Shipment Management',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PY','Payment Cancellation Request (829)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','PZ','Residential Mortgage Insurance Appl',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','QG','Product Information (878, 879, 888,',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','QM','Transporation Carrier Shipment Stat',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','QO','Ocean Shipment Status Information (',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RA','Payment Order/Remittance Advice (82',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RC','Receiving Advice/Acceptance Certifi',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RD','Royalty Regulatory Reports (185)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RE','Warehouse Stock Receipt Advice (944',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RF','Rail Route File Maintenance (475)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RG','Railroad Reciprocal Switch File (43',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RI','Routing and Carrier Instruction (85',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RL','Rail Industrial Switch List (423)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RM','Railroad Station Master File (431)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RN','Requisition Transaction (511)',NULL,'Transaction set for ordering equipment and material. Can also be used to inquire about, amend, or terminate the original order')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RO','Ocean Booking Information (300, 301',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RP','Commission Sales Report (818)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RQ','Request for Quotation (840) and Pro',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RR','Response to Request For Quotation (',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RS','Order Status Information (869, 870)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RT','Report of Test Results (863)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RU','Railroad Retirement Activity (429)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RX','Rail Deprescription (432)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RY','Request for Student Educational Rec',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','RZ','Response to Request for Student Edu',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SA','Air Shipment Information (104)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SB','Switch Rails (424)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SC','Price/Sales Catalog (832)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SD','Student Loan Pre-Claims and Claims',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SE','Shipper''s Export Declaration (601)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SF','Standard Transportation Commodity C',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SG','SG Receiving Advice - Grocery (885)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SH','Ship Notice/Manifest (856)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SI','Shipment Information (858)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SL','Student Loan Application and Guaran',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SM','Motor Carrier Shipment Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SO','',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SP','Specifications/Technical Informatio',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SQ','Production Sequence (866)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SR','Rail Carrier Shipment Information (',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SS','Shipping Schedule (862)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','ST','Railroad Service Commitment Advice',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SV','Student Enrollment Verification (19',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','SW','Warehouse Shipping Advice (945)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TA','Electronic Filing of Tax Return Dat',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TC','Court Submission (176)\r\x0a\r\x0a',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TD','Trading Partner Profile (838)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TF','Electronic Filing of Tax Return Dat',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TI','Tax Information Exchange (826)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TN','Tax Rate Notification (150)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TO','Real Estate Title Services (197, 19',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TP','Rail Rate Transactions (466, 468, 4',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TR','Train Sheet (161)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TS','Transportation Services Tender (602',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','TX','Text Message (864)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','UA','Retail Account Characteristics (885',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','UB','Customer Call Reporting (886)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','UC','Uniform Commercial Code Filing (154',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','UD','Deduction Research Report (891)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','UI','Insurance Underwriting Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','UW','Laboratory Reporting (186)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','VA','Vehicle Application Advice (126)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','VB','Vehicle Baying Order (127)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','VC','Vehicle Shipping Order (120)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','VD','Property and Casualty Vehicle Damag',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','VH','Vehicle Carrier Rate Update (129)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','VS','Vehicle Service (121)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','WA','Product Service Transaction Sets (1',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','WB','Rail Carrier Waybill Interchange (4',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','WG','Vendor Performance Review (501)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','WI','Wage Determination (288)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','WR','Shipment Weights (440)',NULL,'')

INSERT INTO codset VALUES (5,'003060Functional Identifier Code','WT','Rail Waybill Request (425)',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','1','Unrecognized segment ID',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','2','Unexpected segment',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','3','Mandatory segment missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','4','Loop Occurs Over Maximum Times',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','5','Segment Exceeds Maximum Use',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','6','Segment Not in Defined Transaction',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','7','Segment Not in Proper Sequence',NULL,'')

INSERT INTO codset VALUES (5,'003060Segment Syntax Error Code','8','Segment Has Data Element Errors',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Acknowledgment Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Acknowledgment Code','E','Accepted But Errors Were Noted',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Acknowledgment Code','M','Rejected, Message Authentication Co',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Acknowledgment Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Acknowledgment Code','W','Rejected, Assurance Failed Validity',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Acknowledgment Code','X','Rejected, Content After Decryption',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','104','X12.100 Air Shipment Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','110','X12.101 Air Freight Details and Inv',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','120','X12.70 Vehicle Shipping Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','121','X12.71 Vehicle Service',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','124','X12.311 Property and Casualty Vehic',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','125','X12.75 Multilevel Railcar Load Deta',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','126','X12.76 Vehicle Application Advice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','127','X12.77 Vehicle Baying Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','128','X12.78 Dealer Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','129','X12.79 Vehicle Carrier Rate Update',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','130','X12.89 Student Educational Record (',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','131','X12.90 Student Educational Record (',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','135','X12.198 Student Loan Application',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','139','X12.265 Student Loan Guarantee Resu',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','140','X12.200 Product Registration',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','141','X12.201 Product Service Claim Respo',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','142','X12.202 Product Service Claim',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','143','X12.203 Product Service Notificatio',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','144','X12.94 Student Loan Transfer and St',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','146','X12.121 Request for Student Educati',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','147','X12.123 Response to Request for Stu',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','148','X12.124 Report of Injury, Illness o',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','149','X12.361 Notice of Tax Adjustment or',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','150','X12.204 Tax Rate Notification',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','151','X12.205 Electronic Filing of Tax Re',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','152','X12.206 Statistical Government Info',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','154','X12.99 Uniform Commercial Code Fili',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','159','X12.363 Motion Picture Booking Conf',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','161','X12.72 Train Sheet',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','163','X12.96 Appointment Schedule Informa',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','170','X12.210 Revenue Receipts Statement',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','175','X12.305 Court Notice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','176','X12.306 Court Submission',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','180','X12.255 Return Merchandise Authoriz',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','185','X12.266 Royalty Regulatory Reports',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','186','X12.284 Laboratory Reporting',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','188','X12.322 Educational Course Inventor',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','189','X12.321 Application for Admission t',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','190','X12.264 Student Enrollment Verifica',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','191','X12.276 Student Loan Pre-Claims and',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','194','X12.372 Grant or Assistance Applica',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','195','X12.267 Federal Communications Comm',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','196','X12.280 Contractor Cost Data Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','197','X12.360 Real Estate Title Evidence',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','199','X12.358 Real Estate Settlement Info',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','200','X12.304 Mortgage Credit Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','201','X12.326 Residential Loan Applicatio',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','203','X12.340 Secondary Mortgage Market I',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','204','X12.103 Motor Carrier Shipment Info',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','206','X12.371 Real Estate Inspection',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','210','X12.104 Motor Carrier Freight Detai',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','213','X12.105 Motor Carrier Shipment Stat',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','214','X12.106 Transportation Carrier Ship',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','217','X12.107 Motor Carrier Loading and R',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','218','X12.108 Motor Carrier Tariff Inform',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','242','X12.274 Data Status Tracking',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','250','X12.98 Purchase Order Shipment Mana',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','251','X12.288 Pricing Support',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','255','X12.347 Insurance Underwriting Info',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','256','X12.357 Periodic Annuity Compensati',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','260','X12.275 Application for Mortgage In',NULL,'A claim filed for mortgage insurance benefits')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','261','X12.277 Residential Appraisal Reque',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','262','X12.278 Residential Appraisal Repor',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','263','X12.279 Residential Mortgage Insura',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','264','X12.285 Mortgage Loan Default Statu',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','265','X12.286 Real Estate Title Insurance',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','266','X12.295 Mortgage Record Change',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','270','X12.281 Eligibility, Coverage or Be',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','271','X12.282 Eligibility, Coverage or Be',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','272','X12.283 Property and Casualty Loss',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','273','X12.294 Insurance/Annuity Applicati',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','275','X12.315 Patient Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','276','X12.316 Health Care Claim Status Re',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','277','X12.317 Health Care Claim Status No',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','278','X12.336 Health Care Services Review',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','288','X12.386 Wage Determination',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','290','X12.293 Cooperative Advertising Agr',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','300','X12.109 Reservation (Booking Reques',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','301','X12.109 Confirmation (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','303','X12.110 Booking Cancellation (Ocean',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','304','X12.113 Shipping Instructions',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','306','Dock Receipt',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','309','X12.117 U.S. Customs Manifest',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','310','X12.118 Freight Receipt and Invoice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','311','X12.182-Canadian Customs Informatio',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','312','X12.119 Arrival Notice (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','313','X12.120 Shipment Status Inquiry (Oc',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','315','X12.122 Status Details (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','317','X12.271 Delivery/Pickup Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','319','X12.292 Terminal Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','321','Demurrage Guarantee (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','322','X12.127 Terminal Operations and Int',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','323','X12.128 Vessel Schedule and Intiner',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','324','X12.129 Vessel Stow Plan (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','325','X12.208 Consolidation of Goods in C',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','326','X12.97 Consignment Summary List',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','350','X12.130 U.S. Customs Status Informa',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','352','X12.131 U.S. Customs Carrier Genera',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','353','X12.132 U.S. Customs Events Advisor',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','354','X12.133 U.S. Customs Automated Mani',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','355','X12.134 U.S. Customs Acceptance/Rej',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','356','X12.211 U.S. Customs Permit to Tran',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','357','X12.307 U.S. Customs In-Bond Inform',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','358','X12.308 U.S. Customs Consist Inform',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','361','X12.136 Carrier Interchange Agreeme',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','362','X12.312 Cargo Insurance Advice of S',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','404','X12.138 Rail Carrier Shipment Infor',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','410','X12.139 Rail Carrier Freight Detail',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','411','Freight Details and Invoice Summary',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','414','X12.83 Car Hire Settlements',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','417','X12.141 Rail Carrier Waybill Interc',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','418','X12.142 Rail Advance Interchange Co',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','419','X12.143 Advance Car Disposition',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','420','X12.144 Car Handling Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','421','X12.261 Estimated Time of Arrival a',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','422','X12.262 Shipper''s Car Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','423','X12.327 Rail Industrial Switch List',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','425','X12.149 Rail Waybill Request',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','426','X12.150 Rail Revenue Waybill',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','429','X12.35 Railroad Retirement Activity',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','431','X12.65 Railroad Station Master File',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','432','X12.328 Rail Deprescription',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','433','X12.329 Railroad Reciprocal Switch',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','435','X12.330 Standard Transportation Com',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','436','X12.362 Locomotive Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','440','X12.152 Shipment Weights',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','451','X12.337 Railroad Event Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','452','X12.338 Railroad Problem Log Inquir',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','453','X12.331 Railroad Service Commitment',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','455','X12.332 Railroad Parameter Trace Re',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','456','X12.333 Railroad Equipment Inquiry',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','466','X12.159 Rate Request',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','468','X12.161 Rate Docket Journal Log',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','475','X12.334 Rail Route File Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','485','X12.164 Ratemaking Action',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','490','X12.166 Rate Group Definition',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','492','X12.168 Miscellaneous Rates',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','494','X12.169 Scale Rate Table',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','501','X12.341 Vendor Performance Review',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','503','X12.352 Pricing History',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','504','X12.353 Clauses and Provisions',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','511','X12.225 Requisition',NULL,'Transaction set for ordering equipment and material from a supply distribution system; this can also be used to inquire about, amend, or terminate the original')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','517','X12.230 Material Obligation Validat',NULL,'Transaction set for verifying the continued need for open orders. Can also be used to confirm open order quantities and request reinstatement of previously canc')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','527','X12.231 Material Due-In and Receipt',NULL,'Transaction set for reporting material dues-in, anticipated receipts, and receipts')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','536','X12.243 Logistics Reassignment',NULL,'Transaction set for reporting information needed by a new manager when transferring inventory management responsibility between organizations')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','561','X12.212 Contract Abstract',NULL,'A summary of the essential elements of a contract, sufficient to enable the contract administration process to commence')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','567','X12.218 Contract Completion Status',NULL,'Transaction set for reporting the administrative closure status of physically completed contracts')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','568','X12.219 Contract Payment Management',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','601','X12.273 U.S. Customs Export Shipmen',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','602','X12.126 Transportation Services Ten',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','622','X12.173 Intermodal Ramp Activity',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','715','X12.209 Intermodal Group Loading Pl',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','805','X12.195 Contract Pricing Proposal',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','806','X12.196 Project Schedule Reporting',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','810','X12.2 Invoice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','811','X12.39 Consolidated Service Invoice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','812','X12.40 Credit/Debit Adjustment',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','813','X12.62 Electronic Filing of Tax Ret',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','815','X12.42 Cryptographic Service Messag',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','816','X12.66 Organization Relationship',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','818','X12.256 Commission Sales Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','819','X12.43 Operating Expense Statement',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','820','X12.4 Payment Order/Remittance Advi',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','821','X12.24 Financial Information Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','822','X12.25 Customer Account Analysis',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','823','X12.38 Lockbox',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','824','X12.44 Application Advice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','826','X12.19 Tax Information Exchange',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','827','X12.47 Financial Return Notice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','828','X12.45 Debit Authorization',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','829','X12.48 Payment Cancellation Request',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','830','X12.14 Planning Schedule with Relea',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','831','X12.49 Application Control Totals',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','832','X12.13 Price/Sales Catalog',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','833','X12.69 Mortgage Credit Report Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','834','X12.84 Benefit Enrollment and Maint',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','835','X12.85 Health Care Claim Payment/Ad',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','836','X12.54 Procurement Notices',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','837','X12.86 Health Care Claim',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','838','X12.17 Trading Partner Profile',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','839','X12.31 Project Cost Reporting',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','840','X12.7 Request for Quotation',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','841','X12.51 Specifications/Technical Inf',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','842','X12.21 Nonconformance Report Transa',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','843','X12.8 Response to Request for Quota',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','844','X12.26 Product Transfer Account Adj',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','845','X12.27 Price Authorization Acknowle',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','846','X12.28 Inventory Inquiry/Advice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','847','X12.63 Material Claim',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','848','X12.36 Material Safety Data Sheet',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','849','X12.50 Response to Product Transfer',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','850','X12.1 Purchase Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','851','X12.51 Asset Schedule',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','852','X12.52 Product Activity Data',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','853','X12.64 Routing and Carrier Instruct',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','854','X12.68 Shipment Delivery Discrepanc',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','855','X12.9 Purchase Order Acknowledgment',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','856','X12.10 Ship Notice/Manifest',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','857','X12.29 Shipment and Billing Notice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','858','X12.18 Shipment Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','859','X12.55 Freight Invoice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','860','X12.15 Purchase Order Change Reques',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','861','X12.12 Receiving Advice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','862','X12.37 Shipping Schedule',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','863','X12.41 Report of Test Results',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','864','X12.34 Text Message',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','865','X12.16 Purchase Order Change Acknow',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','866','X12.57 Production Sequence',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','867','X12.33 Product Transfer and Resale',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','868','X12.30 Electronic Form Structure',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','869','X12.11 Order Status Inquiry',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','870','X12.23 Order Status Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','871','X12.343 Component Parts Content',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','872','X12.53 Residential Mortgage Insuran',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','875','X12.298 Grocery Products Purchase O',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','876','X12.299 Grocery Products Purchase O',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','877','X12.373 Manufacturer Coupon Family',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','878','X12.182 Product Authorization/De-Au',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','879','X12.60 Price Information',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','880','X12.287 Grocery Products Invoice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','881','X12.389 Manufacturer Coupon Redempt',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','882','X12.125 Direct Store Delivery Summa',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','883','X12.309 Market Development Fund All',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','884','X12.310 Market Development Fund Set',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','885','X12.320 Retail Account Characterist',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','886','X12.319 Customer Call Reporting',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','887','X12.356 Coupon Notification',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','888','X12.269 - Item Maintenance (UCS)',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','889','X12.183 Promotion Announcement',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','891','X12.184 Deduction Research Report',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','893','X12.197 Item Information Request',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','894','X12.186 Delivery/Return Base Record',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','895','X12.187 Delivery/Return Acknowledge',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','896','X12.188 Product Dimension Maintenan',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','920','X12.174 Loss or Damage Claim - Gene',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','924','X12.175 Loss or Damage Claim - Moto',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','925','X12.176 Claim Tracer',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','926','X12.177 Claim Status Report and Tra',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','928','X12.178 Automotive Inspection Detai',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','940','X12.189 Warehouse Shipping Order',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','943','X12.191 Warehouse Stock Transfer Sh',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','944','X12.192 Warehouse Stock Transfer Re',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','945','X12.193 Warehouse Shipping Advice',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','947','X12.194 Warehouse Inventory Adjustm',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','980','X12.179 Functional Group Totals',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','990','X12.180 Response To a Load Tender',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','994','Administrative Message',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','996','X12.32 File Transfer',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','997','X12.20 Functional Acknowledgment',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Identifier Code','998','X12.181 Set Cancellation',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','1','Transaction Set Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','10','Requested Service (Authentication o',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','11','Unknown Security Recipient',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','12','Incorrect Message Length (Encryptio',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','13','Message Authentication Code Failed',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','15','Unknown Security Originator',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','16','Syntax Error in Decrypted Text',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','17','Security Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','19','S1E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','2','Transaction Set Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','20','S1S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','21','S2E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','22','S2S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','23','Transaction Set Control Number Not',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','3','Transaction Set Control Number in H',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','4','Number of Included Segments Does No',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','5','One or More Segments in Error',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','6','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','7','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','8','Authentication Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'003060Transaction Set Syntax Error Code','9','Encryption Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','1','Mandatory data element missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','10','Exclusion Condition Violated',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','2','Conditional required data element m',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','3','Too many data elements.',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','4','Data element too short.',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','5','Data element too long.',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','6','Invalid character in data element.',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','7','Invalid code value.',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','8','Invalid Date',NULL,'')

INSERT INTO codset VALUES (5,'004010Data Element Syntax Error Code','9','Invalid Time',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','E','Accepted, But Errors Were Noted.',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','M','Rejected, Message Authentication Co',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','P','Partially Accepted, At Least One Tr',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','W','Rejected, Assurance Failed Validity',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Acknowledge Code','X','Rejected, Content After Decryption',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','1','Functional Group Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','10','Authentication Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','11','Encryption Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','12','Requested Service (Authentication o',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','13','Unknown Security Recipient',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','14','Unknown Security Originator',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','15','Syntax Error in Decrypted Text',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','16','Security Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','17','Incorrect Message Length (Encryptio',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','18','Message Authentication Code Failed',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','19','S1E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','2','Functional Group Version Not Suppor',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','20','S1S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','21','S2E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','22','S2S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','23','S3E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','24','S3S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','25','S4E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','26','S4S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','3','Functional Group Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','4','Group Control Number in the Functio',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','5','Number of Included Transaction Sets',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Group Syntax Error Code','6','Group Control Number Violates Synta',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AA','Account Analysis (822)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AB','Logistics Service Request (219)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AD','Individual Life, Annuity and Disabi',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AF','Application for Admission to Educat',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AG','Application Advice (824)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AH','Logistics Service Response (220)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AI','Automotive Inspection Detail (928)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AK','Student Educational Record (Transcr',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AL','Set Cancellation (998) and Applicat',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AN','Return Merchandise Authorization an',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AO','Income or Asset Offset (521)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AR','Warehouse Stock Transfer Shipment A',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AS','Transportation Appointment Schedule',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AT','Animal Toxicological Data (249)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','AW','Warehouse Inventory Adjustment Advi',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','BC','Business Credit Report (155)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','BE','Benefit Enrollment and Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','BF','Business Entity Filings (105)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','BL','Motor Carrier Bill of Lading (211)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','BS','Shipment and Billing Notice (857)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CA','Purchase Order Change Acknowledgmen',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CB','Unemployment Insurance Tax Claim or',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CC','Clauses and Provisions (504)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CD','Credit/Debit Adjustment (812)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CE','Cartage Work Assignment (222)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CF','Corporate Financial Adjustment Info',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CG','Administrative Message (994)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CH','Car Handling Information (420)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CI','Consolidated Service Invoice/Statem',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CJ','Manufacturer Coupon Family Code Str',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CK','Manufacturer Coupon Redemption Deta',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CM','Component Parts Content (871)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CN','Coupon Notification (887)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CO','Cooperative Advertising Agreements',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CP','Electronic Proposal Information (25',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CR','Rail Carhire Settlements (414)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CS','Cryptographic Service Message (815)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CT','Application Control Totals (831)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','CV','Commercial Vehicle Safety and Crede',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','D3','Contract Completion Status (567)',NULL,'Transaction set for reporting the administrative closure status of physically completed contracts')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','D4','Contract Abstract (561)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','D5','Contract Payment Management Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DA','Debit Authorization (828)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DD','Shipment Delivery Discrepancy Infor',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DF','Market Development Fund Allocation',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DI','Dealer Information (128)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DM','Shipper''s Car Order (422)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DS','Data Status Tracking (242)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','DX','Direct Exchange Delivery and Return',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','EC','Educational Course Inventory (188)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','ED','Student Educational Record (Transcr',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','EI','Railroad Equipment Inquiry or Advic',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','ER','Revenue Receipts Statement (170)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','ES','Notice of Employment Status (540)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','EV','Railroad Event Report (451)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','EX','Excavation Communication (620)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FA','Functional Acknowledgment (997)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FB','Freight Invoice (859)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FC','Court and Law Enforcement Informati',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FG','Motor Carrier Loading and Route Gui',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FH','Motor Carrier Tariff Information (2',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FR','Financial Reporting (821, 827)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','FT','File Transfer (996)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GB','Average Agreement Demurrage (423)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GC','Damage Claim Transaction Sets (920,',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GE','General Request, Response or Confir',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GF','Response to a Load Tender (990)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GL','Intermodal Group Loading Plan (715)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GP','Grocery Products Invoice (880)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GR','Statistical Government Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','GT','Grant or Assistance Application (19',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HB','Eligibility, Coverage or Benefit In',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HC','Health Care Claim (837)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HI','Health Care Services Review Informa',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HN','Health Care Claim Status Notificati',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HP','Health Care Claim Payment/Advice (8',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HR','Health Care Claim Status Request (2',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','HS','Eligibility, Coverage or Benefit In',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IA','Air Freight Details and Invoice (11',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IB','Inventory Inquiry/Advice (846)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IC','Rail Advance Interchange Consist (4',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','ID','Insurance/Annuity Application Statu',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IE','Insurance Producer Administration (',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IG','Direct Store Delivery Summary Infor',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','II','Rail Freight Details and Invoice Su',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IJ','Report of Injury, Illness or Incide',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IM','Motor Carrier Freight Details and I',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IN','Invoice Information (810,819)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IO','Ocean Shipment Billing Details (310',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IP','Intermodal Ramp Activity (622)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IR','Rail Carrier Freight Details and In',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','IS','Estimated Time of Arrival and Car S',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','KM','Commercial Vehicle Credentials (286',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LA','Federal Communications Commission (',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LB','Lockbox (823)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LI','Locomotive Information (436)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LN','Property and Casualty Loss Notifica',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LR','Logistics Reassignment (536)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LS','Asset Schedule (851)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','LT','Student Loan Transfer and Status Ve',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MA','Motor Carrier Summary Freight Bill',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MC','Request for Motor Carrier Rate Prop',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MD','Department of Defense Inventory Man',NULL,'Transactions related to the interchange of information involving material in the supply, control, and distribution systems and financial management of the Depar')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','ME','Mortgage Origination (198, 200, 201',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MF','Market Development Funds Settlement',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MG','Mortgage Servicing Transaction Sets',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MH','Motor Carrier Rate Proposal (106)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MI','Motor Carrier Shipment Status Inqui',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MJ','Secondary Mortgage Market Loan Deli',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MK','Response to a Motor Carrier Rate Pr',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MM','Medical Event Reporting (500)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MN','Mortgage Note (205)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MO','Maintenance Service Order (650)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MP','Motion Picture Booking Confirmation',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MQ','Consolidators Freight Bill and Invo',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MR','Multilevel Railcar Load Details (12',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MS','Material Safety Data Sheet (848)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MT','Electronic Form Structure (868)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MV','Material Obligation Validation (517',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MW','Rail Waybill Response (427)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MX','Material Claim (847)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','MY','Response to a Cartage Work Assignme',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','NC','Nonconformance Report (842)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','NL','Name and Address Lists (101)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','NP','Notice of Power of Attorney (157)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','NT','Notice of Tax Adjustment or Assessm',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','OC','Cargo Insurance Advice of Shipment',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','OG','Order Group - Grocery (875, 876)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','OR','Organizational Relationships (816)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','OW','Warehouse Shipping Order (940)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PA','Price Authorization Acknowledgment/',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PB','Railroad Parameter Trace Registrati',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PC','Purchase Order Change Request - Buy',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PD','Product Activity Data (852)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PE','Periodic Compensation (256)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PF','Annuity Activity (268)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PG','Insurance Plan Description (100)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PH','Pricing History (503)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PI','Patient Information (275)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PJ','Project Schedule Reporting (806)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PK','Project Cost Reporting (839) and Co',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PL','Railroad Problem Log Inquiry or Adv',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PN','Product Source Information (244)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PO','Purchase Order (850)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PQ','Property Damage Report (112)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PR','Purchase Order Acknowledgement (855',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PS','Planning Schedule with Release Capa',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PT','Product Transfer and Resale Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PU','Motor Carrier Shipment Pick-up Noti',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PV','Purchase Order Shipment Management',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','PY','Payment Cancellation Request (829)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','QG','Product Information (878, 879, 888,',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','QM','Transportation Carrier Shipment Sta',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','QO','Ocean Shipment Status Information (',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RA','Payment Order/Remittance Advice (82',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RB','Railroad Clearance (470)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RC','Receiving Advice/Acceptance Certifi',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RD','Royalty Regulatory Report (185)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RE','Warehouse Stock Receipt Advice (944',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RH','Railroad Reciprocal Switch File (43',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RI','Routing and Carrier Instruction (85',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RJ','Railroad Mark Register Update Activ',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RK','Standard Transportation Commodity C',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RL','Rail Industrial Switch List (423)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RM','Railroad Station Master File (431)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RN','Requisition Transaction (511)',NULL,'Transaction set for ordering equipment and material. Can also be used to inquire about, amend, or terminate the original order')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RO','Ocean Booking Information (300, 301',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RP','Commission Sales Report (818)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RQ','Request for Quotation (840) and Pro',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RR','Response to Request For Quotation (',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RS','Order Status Information (869, 870)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RT','Report of Test Results (863)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RU','Railroad Retirement Activity (429)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RV','Railroad Junctions and Interchanges',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RW','Rail Revenue Waybill (426)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RX','Rail Deprescription (432)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RY','Request for Student Educational Rec',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','RZ','Response to Request for Student Edu',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SA','Air Shipment Information (104)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SB','Switch Rails (424)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SC','Price/Sales Catalog (832)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SD','Student Loan Pre-Claims and Claims',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SE','Shipper''s Export Declaration (601)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SG','SG Receiving Advice - Grocery (885)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SH','Ship Notice/Manifest (856)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SI','Shipment Information (858)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SJ','Transportation Automatic Equipment',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SL','Student Loan Application and Guaran',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SM','Motor Carrier Load Tender (204)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SN','Rail Route File Maintenance (475)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SO','',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SP','Specifications/Technical Informatio',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SQ','Production Sequence (866)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SR','Rail Carrier Shipment Information (',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SS','Shipping Schedule (862)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','ST','Railroad Service Commitment Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SU','Account Assignment/Inquiry and Serv',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SV','Student Enrollment Verification (19',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','SW','Warehouse Shipping Advice (945)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TA','Electronic Filing of Tax Return Dat',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TC','Court Submission (176)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TD','Trading Partner Profile (838)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TF','Electronic Filing of Tax Return Dat',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TI','Tax Information Exchange (826)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TM','Motor Carrier Delivery Trailer Mani',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TN','Tax Rate Notification (150)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TO','Real Estate Title Services (197, 19',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TP','Rail Rate Transactions (460, 463, 4',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TR','Train Sheet (161)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TS','Transportation Services Tender (602',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TT','Testing Results Request and Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','TX','Text Message (864)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UA','Retail Account Characteristics (885',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UB','Customer Call Reporting (886)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UC','Uniform Commercial Code Filing (154',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UD','Deduction Research Report (891)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UI','Underwriting Information Services (',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UP','Motor Carrier Pick-up Manifest (215',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','UW','Insurance Underwriting Requirements',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VA','Vehicle Application Advice (126)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VB','Vehicle Baying Order (127)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VC','Vehicle Shipping Order (120)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VD','Vehicle Damage (124)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VE','Vessel Content Details (109)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VH','Vehicle Carrier Rate Update (129)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VI','Voter Registration Information (280',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','VS','Vehicle Service (121)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WA','Product Service Transaction Sets (1',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WB','Rail Carrier Waybill Interchange (4',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WG','Vendor Performance Review (501)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WI','Wage Determination (288)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WL','Well Information (625)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WR','Shipment Weights (440)',NULL,'')

INSERT INTO codset VALUES (5,'004010Functional Identifier Code','WT','Rail Waybill Request (425)',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','1','Unrecognized segment ID',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','2','Unexpected segment',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','3','Mandatory segment missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','4','Loop Occurs Over Maximum Times',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','5','Segment Exceeds Maximum Use',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','6','Segment Not in Defined Transaction',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','7','Segment Not in Proper Sequence',NULL,'')

INSERT INTO codset VALUES (5,'004010Segment Syntax Error Code','8','Segment Has Data Element Errors',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Acknowledgment Code','A','Accepted',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Acknowledgment Code','E','Accepted But Errors Were Noted',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Acknowledgment Code','M','Rejected, Message Authentication Co',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Acknowledgment Code','R','Rejected',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Acknowledgment Code','W','Rejected, Assurance Failed Validity',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Acknowledgment Code','X','Rejected, Content After Decryption',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','100','Insurance Plan Description',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','101','Name and Address Lists',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','104','Air Shipment Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','105','Business Entity Filings',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','106','Motor Carrier Rate Proposal',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','107','Request for Motor Carrier Rate Prop',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','108','Response to a Motor Carrier Rate Pr',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','109','Vessel Content Details',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','110','Air Freight Details and Invoice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','112','Property Damage Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','120','Vehicle Shipping Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','121','Vehicle Service',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','124','Vehicle Damage',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','125','Multilevel Railcar Load Details',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','126','Vehicle Application Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','127','Vehicle Baying Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','128','Dealer Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','129','Vehicle Carrier Rate Update',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','130','Student Educational Record (Transcr',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','131','Student Educational Record (Transcr',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','135','Student Loan Application',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','138','Testing Results Request and Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','139','Student Loan Guarantee Result',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','140','Product Registration',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','141','Product Service Claim Response',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','142','Product Service Claim',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','143','Product Service Notification',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','144','Student Loan Transfer and Status Ve',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','146','Request for Student Educational Rec',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','147','Response to Request for Student Edu',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','148','Report of Injury, Illness or Incide',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','149','Notice of Tax Adjustment or Assessm',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','150','Tax Rate Notification',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','151','Electronic Filing of Tax Return Dat',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','152','Statistical Government Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','153','Unemployment Insurance Tax Claim or',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','154','Uniform Commercial Code Filing',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','155','Business Credit Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','157','Notice of Power of Attorney',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','159','Motion Picture Booking Confirmation',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','160','Transportation Automatic Equipment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','161','Train Sheet',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','163','Transportation Appointment Schedule',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','170','Revenue Receipts Statement',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','175','Court and Law Enforcement Notice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','176','Court Submission',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','180','Return Merchandise Authorization an',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','185','Royalty Regulatory Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','186','Insurance Underwriting Requirements',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','188','Educational Course Inventory',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','189','Application for Admission to Educat',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','190','Student Enrollment Verification',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','191','Student Loan Pre-Claims and Claims',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','194','Grant or Assistance Application',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','195','Federal Communications Commission (',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','196','Contractor Cost Data Reporting',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','197','Real Estate Title Evidence',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','198','Loan Verification Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','199','Real Estate Settlement Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','200','Mortgage Credit Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','201','Residential Loan Application',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','202','Secondary Mortgage Market Loan Deli',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','203','Secondary Mortgage Market Investor',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','204','Motor Carrier Load Tender',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','205','Mortgage Note',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','206','Real Estate Inspection',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','210','Motor Carrier Freight Details and I',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','211','Motor Carrier Bill of Lading',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','212','Motor Carrier Delivery Trailer Mani',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','213','Motor Carrier Shipment Status Inqui',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','214','Transportation Carrier Shipment Sta',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','215','Motor Carrier Pick-up Manifest',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','216','Motor Carrier Shipment Pick-up Noti',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','217','Motor Carrier Loading and Route Gui',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','218','Motor Carrier Tariff Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','219','Logistics Service Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','220','Logistics Service Response',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','222','Cartage Work Assignment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','223','Consolidators Freight Bill and Invo',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','224','Motor Carrier Summary Freight Bill',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','225','Response to a Cartage Work Assignme',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','242','Data Status Tracking',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','244','Product Source Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','248','Account Assignment/Inquiry and Serv',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','249','Animal Toxicological Data',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','250','Purchase Order Shipment Management',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','251','Pricing Support',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','252','Insurance Producer Administration',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','255','Underwriting Information Services',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','256','Periodic Compensation',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','260','Application for Mortgage Insurance',NULL,'A claim filed for mortgage insurance benefits')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','261','Real Estate Information Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','262','Real Estate Information Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','263','Residential Mortgage Insurance Appl',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','264','Mortgage Loan Default Status',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','265','Real Estate Title Insurance Service',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','266','Mortgage or Property Record Change',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','267','Individual Life, Annuity and Disabi',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','268','Annuity Activity',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','270','Eligibility, Coverage or Benefit In',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','271','Eligibility, Coverage or Benefit In',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','272','Property and Casualty Loss Notifica',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','273','Insurance/Annuity Application Statu',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','275','Patient Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','276','Health Care Claim Status Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','277','Health Care Claim Status Notificati',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','278','Health Care Services Review Informa',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','280','Voter Registration Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','285','Commercial Vehicle Safety and Crede',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','286','Commercial Vehicle Credentials',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','288','Wage Determination',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','290','Cooperative Advertising Agreements',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','300','Reservation (Booking Request) (Ocea',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','301','Confirmation (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','303','Booking Cancellation (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','304','Shipping Instructions',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','306','Dock Receipt',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','309','U.S. Customs Manifest',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','310','Freight Receipt and Invoice (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','311','Canadian Customs Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','312','Arrival Notice (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','313','Shipment Status Inquiry (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','315','Status Details (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','317','Delivery/Pickup Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','319','Terminal Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','321','Demurrage Guarantee (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','322','Terminal Operations and Intermodal',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','323','Vessel Schedule and Itinerary (Ocea',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','324','Vessel Stow Plan (Ocean)',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','325','Consolidation of Goods in Container',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','326','Consignment Summary List',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','350','U.S. Customs Status Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','352','U.S. Customs Carrier General Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','353','U.S. Customs Events Advisory Detail',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','354','U.S. Customs Automated Manifest Arc',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','355','U.S. Customs Acceptance/Rejection',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','356','U.S. Customs Permit to Transfer Req',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','357','U.S. Customs In-Bond Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','358','U.S. Customs Consist Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','361','Carrier Interchange Agreement (Ocea',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','362','Cargo Insurance Advice of Shipment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','404','Rail Carrier Shipment Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','410','Rail Carrier Freight Details and In',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','411','Freight Details and Invoice Summary',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','414','Rail Carhire Settlements',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','417','Rail Carrier Waybill Interchange',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','418','Rail Advance Interchange Consist',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','419','Advance Car Disposition',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','420','Car Handling Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','421','Estimated Time of Arrival and Car S',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','422','Shipper''s Car Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','423','Rail Industrial Switch List',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','425','Rail Waybill Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','426','Rail Revenue Waybill',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','429','Railroad Retirement Activity',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','431','Railroad Station Master File',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','432','Rail Deprescription',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','433','Railroad Reciprocal Switch File',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','434','Railroad Mark Register Update Activ',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','435','Standard Transportation Commodity C',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','436','Locomotive Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','437','Railroad Junctions and Interchanges',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','440','Shipment Weights',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','451','Railroad Event Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','452','Railroad Problem Log Inquiry or Adv',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','453','Railroad Service Commitment Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','455','Railroad Parameter Trace Registrati',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','456','Railroad Equipment Inquiry or Advic',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','460','Railroad Price Distribution Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','463','Rail Rate Reply',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','466','Rate Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','468','Rate Docket Journal Log',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','470','Railroad Clearance',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','475','Rail Route File Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','485','Ratemaking Action',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','486','Rate Docket Expiration',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','490','Rate Group Definition',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','492','Miscellaneous Rates',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','494','Scale Rate Table',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','500','Medical Event Reporting',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','501','Vendor Performance Review',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','503','Pricing History',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','504','Clauses and Provisions',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','511','Requisition',NULL,'Transaction set for ordering equipment and material from a supply distribution system; this can also be used to inquire about, amend, or terminate the original')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','517','Material Obligation Validation',NULL,'Transaction set for verifying the continued need for open orders. Can also be used to confirm open order quantities and request reinstatement of previously canc')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','521','Income or Asset Offset',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','527','Material Due-In and Receipt',NULL,'Transaction set for reporting material dues-in, anticipated receipts, and receipts')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','536','Logistics Reassignment',NULL,'Transaction set for reporting information needed by a new manager when transferring inventory management responsibility between organizations')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','540','Notice of Employment Status',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','561','Contract Abstract',NULL,'A summary of the essential elements of a contract, sufficient to enable the contract administration process to commence')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','567','Contract Completion Status',NULL,'Transaction set for reporting the administrative closure status of physically completed contracts')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','568','Contract Payment Management Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','601','U.S. Customs Export Shipment Inform',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','602','Transportation Services Tender',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','620','Excavation Communication',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','622','Intermodal Ramp Activity',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','625','Well Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','650','Maintenance Service Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','715','Intermodal Group Loading Plan',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','805','Contract Pricing Proposal',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','806','Project Schedule Reporting',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','810','Invoice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','811','Consolidated Service Invoice/Statem',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','812','Credit/Debit Adjustment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','813','Electronic Filing of Tax Return Dat',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','814','General Request, Response or Confir',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','815','Cryptographic Service Message',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','816','Organizational Relationships',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','818','Commission Sales Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','819','Operating Expense Statement',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','820','Payment Order/Remittance Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','821','Financial Information Reporting',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','822','Account Analysis',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','823','Lockbox',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','824','Application Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','826','Tax Information Exchange',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','827','Financial Return Notice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','828','Debit Authorization',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','829','Payment Cancellation Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','830','Planning Schedule with Release Capa',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','831','Application Control Totals',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','832','Price/Sales Catalog',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','833','Mortgage Credit Report Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','834','Benefit Enrollment and Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','835','Health Care Claim Payment/Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','836','Procurement Notices',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','837','Health Care Claim',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','838','Trading Partner Profile',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','839','Project Cost Reporting',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','840','Request for Quotation',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','841','Specifications/Technical Informatio',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','842','Nonconformance Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','843','Response to Request for Quotation',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','844','Product Transfer Account Adjustment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','845','Price Authorization Acknowledgment/',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','846','Inventory Inquiry/Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','847','Material Claim',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','848','Material Safety Data Sheet',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','849','Response to Product Transfer Accoun',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','850','Purchase Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','851','Asset Schedule',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','852','Product Activity Data',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','853','Routing and Carrier Instruction',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','854','Shipment Delivery Discrepancy Infor',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','855','Purchase Order Acknowledgment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','856','Ship Notice/Manifest',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','857','Shipment and Billing Notice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','858','Shipment Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','859','Freight Invoice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','860','Purchase Order Change Request - Buy',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','861','Receiving Advice/Acceptance Certifi',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','862','Shipping Schedule',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','863','Report of Test Results',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','864','Text Message',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','865','Purchase Order Change Acknowledgmen',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','866','Production Sequence',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','867','Product Transfer and Resale Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','868','Electronic Form Structure',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','869','Order Status Inquiry',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','870','Order Status Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','871','Component Parts Content',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','872','Residential Mortgage Insurance Appl',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','875','Grocery Products Purchase Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','876','Grocery Products Purchase Order Cha',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','877','Manufacturer Coupon Family Code Str',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','878','Product Authorization/De-Authorizat',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','879','Price Information',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','880','Grocery Products Invoice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','881','Manufacturer Coupon Redemption Deta',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','882','Direct Store Delivery Summary Infor',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','883','Market Development Fund Allocation',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','884','Market Development Fund Settlement',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','885','Retail Account Characteristics',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','886','Customer Call Reporting',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','887','Coupon Notification',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','888','Item Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','889','Promotion Announcement',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','891','Deduction Research Report',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','893','Item Information Request',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','894','Delivery/Return Base Record',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','895','Delivery/Return Acknowledgment or A',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','896','Product Dimension Maintenance',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','920','Loss or Damage Claim - General Comm',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','924','Loss or Damage Claim - Motor Vehicl',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','925','Claim Tracer',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','926','Claim Status Report and Tracer Repl',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','928','Automotive Inspection Detail',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','940','Warehouse Shipping Order',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','943','Warehouse Stock Transfer Shipment A',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','944','Warehouse Stock Transfer Receipt Ad',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','945','Warehouse Shipping Advice',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','947','Warehouse Inventory Adjustment Advi',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','980','Functional Group Totals',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','990','Response To a Load Tender',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','994','Administrative Message',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','996','File Transfer',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','997','Functional Acknowledgment',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Identifier Code','998','Set Cancellation',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','1','Transaction Set Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','10','Requested Service (Authentication o',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','11','Unknown Security Recipient',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','12','Incorrect Message Length (Encryptio',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','13','Message Authentication Code Failed',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','15','Unknown Security Originator',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','16','Syntax Error in Decrypted Text',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','17','Security Not Supported',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','19','S1E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','2','Transaction Set Trailer Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','20','S1S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','21','S2E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','22','S2S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','23','Transaction Set Control Number Not',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','24','S3E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','25','S3S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','26','S4E Security End Segment Missing fo',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','27','S4S Security Start Segment Missing',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','3','Transaction Set Control Number in H',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','4','Number of Included Segments Does No',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','5','One or More Segments in Error',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','6','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','7','Missing or Invalid Transaction Set',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','8','Authentication Key Name Unknown',NULL,'')

INSERT INTO codset VALUES (5,'004010Transaction Set Syntax Error Code','9','Encryption Key Name Unknown',NULL,'')


GO

INSERT INTO elmnts VALUES (1,'2  SP4Acknowledgment code','Acknowledgment code','2  ','SP4',1,0,'N0',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Date of status report','Date of status report','2  ','SP4',0,0,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Document info field 1','Document info field 1','2  ','SP4',0,0,'A',50,1,NULL,50,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Element name','Element name','2  ','SP4',0,0,'A',35,1,NULL,35,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Element number','Element number','2  ','SP4',0,0,'N0',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Element tag','Element tag','2  ','SP4',0,0,'A',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Element value','Element value','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error code','Error code','2  ','SP4',1,0,'A',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error details part 1','Error details part 1','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error details part 2','Error details part 2','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error details part 3','Error details part 3','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error details part 4','Error details part 4','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error details part 5','Error details part 5','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Error sequence number','Error sequence number','2  ','SP4',0,0,'N0',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Format code/version/release','Format code/version/release','2  ','SP4',0,0,'A',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Function name','Function name','2  ','SP4',0,0,'A',30,1,NULL,30,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Functional group identifier','Functional group identifier','2  ','SP4',0,0,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Functional group number','Functional group number','2  ','SP4',0,0,'A',14,1,NULL,14,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Interchange control reference','Interchange control reference','2  ','SP4',0,0,'A',14,1,NULL,14,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Interchange number','Interchange number','2  ','SP4',0,0,'A',14,1,NULL,14,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Message number','Message number','2  ','SP4',0,0,'A',14,1,NULL,14,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Message reference number','Message reference number','2  ','SP4',0,0,'A',14,1,NULL,14,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Message release','Message release','2  ','SP4',0,0,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Message type','Message type','2  ','SP4',0,0,'A',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Message version','Message version','2  ','SP4',0,0,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Number of messages accepted','Number of messages accepted','2  ','SP4',0,0,'N0',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Number of messages indicated','Number of messages indicated','2  ','SP4',0,0,'N0',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Number of messages received','Number of messages received','2  ','SP4',0,0,'N0',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Number of messages rejected','Number of messages rejected','2  ','SP4',0,0,'N0',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Recipient department code','Recipient department code','2  ','SP4',0,0,'A',17,1,NULL,17,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Recipient partner code','Recipient partner code','2  ','SP4',0,0,'A',17,1,NULL,17,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Segment number','Segment number','2  ','SP4',0,0,'N0',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Segment tag','Segment tag','2  ','SP4',0,0,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Sender department code','Sender department code','2  ','SP4',0,0,'A',17,1,NULL,17,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Sender partner code','Sender partner code','2  ','SP4',0,0,'A',17,1,NULL,17,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Status code','Status code','2  ','SP4',1,0,'N0',2,1,NULL,2,NULL,1,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Status report generated by server','Status report generated by server','2  ','SP4',0,0,'A',30,1,NULL,30,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Status text','Status text','2  ','SP4',0,0,'A',80,1,NULL,80,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Time of status report','Time of status report','2  ','SP4',0,0,'TS',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (1,'2  SP4Tracking and tracing key','Tracking and tracing key','2  ','SP4',0,0,'A',20,1,NULL,20,NULL,0,0,'','')

INSERT INTO elmnts VALUES (3,'1     ACKNOWLEDGEMENT REQUEST','ACKNOWLEDGEMENT REQUEST','1  ','   ',0,31,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Address for reverse routing','Address for reverse routing','1  ','   ',0,8,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Application password','Application password','1  ','   ',0,58,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     APPLICATION REFERENCE','APPLICATION REFERENCE','1  ','   ',0,26,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Application sender''s identification','Application sender''s identification','1  ','   ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Association assigned code','Association assigned code','1  ','   ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     COMMON ACCESS REFERENCE','COMMON ACCESS REFERENCE','1  ','   ',0,68,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     COMMUNICATIONS AGREEMENT ID','COMMUNICATIONS AGREEMENT ID','1  ','   ',0,32,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Controlling agency','Controlling agency','1  ','   ',0,51,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Date','Date','1  ','   ',0,17,'DY',6,1,NULL,6,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     First and last transfer','First and last transfer','1  ','   ',0,73,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Functional group identification','Functional group identification','1  ','   ',0,38,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Functional group reference number','Functional group reference number','1  ','   ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Identification code qualifier','Identification code qualifier','1  ','   ',0,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     INTERCHANGE CONTROL COUNT','INTERCHANGE CONTROL COUNT','1  ','   ',0,36,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     INTERCHANGE CONTROL REFERENCE','INTERCHANGE CONTROL REFERENCE','1  ','   ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     MESSAGE REFERENCE NUMBER','MESSAGE REFERENCE NUMBER','1  ','   ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Message release number','Message release number','1  ','   ',0,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Message type','Message type','1  ','   ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Message version number','Message version number','1  ','   ',0,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     NR OF SGMNTS IN THE MSG','NR OF SGMNTS IN THE MSG','1  ','   ',0,74,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Number of messages','Number of messages','1  ','   ',0,60,'N',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     PROCESSING PRIORITY','PROCESSING PRIORITY','1  ','   ',0,29,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Recipient identification','Recipient identification','1  ','   ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Recipient''s identification','Recipient''s identification','1  ','   ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Recipient''s reference/password','Recipient''s reference/password','1  ','   ',0,22,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Recipient''s reference/password qual','Recipient''s reference/password qual','1  ','   ',0,25,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Routing address','Routing address','1  ','   ',0,14,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Sender identification','Sender identification','1  ','   ',0,4,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Sequence of transfer','Sequence of transfer','1  ','   ',0,70,'N0',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Syntax identifier','Syntax identifier','1  ','   ',0,1,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Syntax version number','Syntax version number','1  ','   ',0,2,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     TEST INDICATOR','TEST INDICATOR','1  ','   ',0,35,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'1     Time','Time','1  ','   ',0,19,'T',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     ACKNOWLEDGEMENT REQUEST','ACKNOWLEDGEMENT REQUEST','2  ','   ',0,31,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Address for reverse routing','Address for reverse routing','2  ','   ',0,8,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Application password','Application password','2  ','   ',0,58,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     APPLICATION REFERENCE','APPLICATION REFERENCE','2  ','   ',0,26,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Application sender''s identification','Application sender''s identification','2  ','   ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Association assigned code','Association assigned code','2  ','   ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     COMMON ACCESS REFERENCE','COMMON ACCESS REFERENCE','2  ','   ',0,68,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     COMMUNICATIONS AGREEMENT ID','COMMUNICATIONS AGREEMENT ID','2  ','   ',0,32,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Controlling agency','Controlling agency','2  ','   ',0,51,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Date','Date','2  ','   ',0,17,'DY',6,1,NULL,6,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     First and last transfer','First and last transfer','2  ','   ',0,73,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Functional group identification','Functional group identification','2  ','   ',0,38,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Functional group reference number','Functional group reference number','2  ','   ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Identification code qualifier','Identification code qualifier','2  ','   ',0,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     INTERCHANGE CONTROL COUNT','INTERCHANGE CONTROL COUNT','2  ','   ',0,36,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     INTERCHANGE CONTROL REFERENCE','INTERCHANGE CONTROL REFERENCE','2  ','   ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     MESSAGE REFERENCE NUMBER','MESSAGE REFERENCE NUMBER','2  ','   ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Message release number','Message release number','2  ','   ',0,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Message type','Message type','2  ','   ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Message version number','Message version number','2  ','   ',0,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     NR OF SGMNTS IN THE MSG','NR OF SGMNTS IN THE MSG','2  ','   ',0,74,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Number of messages','Number of messages','2  ','   ',0,60,'N',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     PROCESSING PRIORITY','PROCESSING PRIORITY','2  ','   ',0,29,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Recipient identification','Recipient identification','2  ','   ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Recipient''s identification','Recipient''s identification','2  ','   ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Recipient''s reference/password','Recipient''s reference/password','2  ','   ',0,22,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Recipient''s reference/password qual','Recipient''s reference/password qual','2  ','   ',0,25,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Routing address','Routing address','2  ','   ',0,14,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Sender identification','Sender identification','2  ','   ',0,4,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Sequence of transfer','Sequence of transfer','2  ','   ',0,70,'N0',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Syntax identifier','Syntax identifier','2  ','   ',0,1,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Syntax version number','Syntax version number','2  ','   ',0,2,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     TEST INDICATOR','TEST INDICATOR','2  ','   ',0,35,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'2     Time','Time','2  ','   ',0,19,'T',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     ACKNOWLEDGEMENT REQUEST','ACKNOWLEDGEMENT REQUEST','3  ','   ',0,31,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Address for reverse routing','Address for reverse routing','3  ','   ',0,8,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Application password','Application password','3  ','   ',0,58,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     APPLICATION REFERENCE','APPLICATION REFERENCE','3  ','   ',0,26,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Application sender''s identification','Application sender''s identification','3  ','   ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Association assigned code','Association assigned code','3  ','   ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     COMMON ACCESS REFERENCE','COMMON ACCESS REFERENCE','3  ','   ',0,68,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     COMMUNICATIONS AGREEMENT ID','COMMUNICATIONS AGREEMENT ID','3  ','   ',0,32,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Controlling agency','Controlling agency','3  ','   ',0,51,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Date','Date','3  ','   ',0,17,'DY',6,1,NULL,6,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     First and last transfer','First and last transfer','3  ','   ',0,73,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Functional group identification','Functional group identification','3  ','   ',0,38,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Functional group reference number','Functional group reference number','3  ','   ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Identification code qualifier','Identification code qualifier','3  ','   ',0,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     INTERCHANGE CONTROL COUNT','INTERCHANGE CONTROL COUNT','3  ','   ',0,36,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     INTERCHANGE CONTROL REFERENCE','INTERCHANGE CONTROL REFERENCE','3  ','   ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     MESSAGE REFERENCE NUMBER','MESSAGE REFERENCE NUMBER','3  ','   ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Message release number','Message release number','3  ','   ',0,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Message type','Message type','3  ','   ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Message version number','Message version number','3  ','   ',0,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     NR OF SGMNTS IN THE MSG','NR OF SGMNTS IN THE MSG','3  ','   ',0,74,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Number of messages','Number of messages','3  ','   ',0,60,'N',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     PROCESSING PRIORITY','PROCESSING PRIORITY','3  ','   ',0,29,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Recipient identification','Recipient identification','3  ','   ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Recipient''s identification','Recipient''s identification','3  ','   ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Recipient''s reference/password','Recipient''s reference/password','3  ','   ',0,22,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Recipient''s reference/password qual','Recipient''s reference/password qual','3  ','   ',0,25,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Routing address','Routing address','3  ','   ',0,14,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Sender identification','Sender identification','3  ','   ',0,4,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Sequence of transfer','Sequence of transfer','3  ','   ',0,70,'N0',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Syntax identifier','Syntax identifier','3  ','   ',0,1,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Syntax version number','Syntax version number','3  ','   ',0,2,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     TEST INDICATOR','TEST INDICATOR','3  ','   ',0,35,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'3     Time','Time','3  ','   ',0,19,'T',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Acknowledgement request','Acknowledgement request','4  ','   ',0,31,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Application password','Application password','4  ','   ',0,58,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Application recipient identification','Application recipient identification','4  ','   ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Application reference','Application reference','4  ','   ',0,26,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Application sender identification','Application sender identification','4  ','   ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Association assigned code','Association assigned code','4  ','   ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Character encoding, coded','Character encoding, coded','4  ','   ',0,133,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Code list directory version number','Code list directory version number','4  ','   ',0,110,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Common access reference','Common access reference','4  ','   ',0,68,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Controlling agency, coded','Controlling agency, coded','4  ','   ',0,51,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Date','Date','4  ','   ',0,17,'DY',6,1,NULL,6,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     First and last transfer','First and last transfer','4  ','   ',0,73,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Group control count','Group control count','4  ','   ',0,60,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Group reference number','Group reference number','4  ','   ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Identification code qualifier','Identification code qualifier','4  ','   ',0,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange agreement identifier','Interchange agreement identifier','4  ','   ',0,32,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange control count','Interchange control count','4  ','   ',0,36,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange control reference','Interchange control reference','4  ','   ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange recipient internal identification','Interchange recipient internal identification','4  ','   ',0,14,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange recipient internal sub-identification','Interchange recipient internal sub-identification','4  ','   ',0,46,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange sender internal identification','Interchange sender internal identification','4  ','   ',0,8,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Interchange sender internal sub-identification','Interchange sender internal sub-identification','4  ','   ',0,42,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message group identification','Message group identification','4  ','   ',0,38,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message implementation guideline identification','Message implementation guideline identification','4  ','   ',0,121,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message implementation guideline release number','Message implementation guideline release number','4  ','   ',0,124,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message implementation guideline version number','Message implementation guideline version number','4  ','   ',0,122,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message reference number','Message reference number','4  ','   ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message release number','Message release number','4  ','   ',0,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message subset identification','Message subset identification','4  ','   ',0,115,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message subset release number','Message subset release number','4  ','   ',0,118,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message subset version number','Message subset version number','4  ','   ',0,116,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message type','Message type','4  ','   ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message type sub-function identification','Message type sub-function identification','4  ','   ',0,113,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Message version number','Message version number','4  ','   ',0,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Number of segments in a message','Number of segments in a message','4  ','   ',0,74,'N0',10,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Processing priority','Processing priority','4  ','   ',0,29,'A',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Recipient identification','Recipient identification','4  ','   ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Recipient reference/password','Recipient reference/password','4  ','   ',0,22,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Recipient reference/password qualifier','Recipient reference/password qualifier','4  ','   ',0,25,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Scenario identification','Scenario identification','4  ','   ',0,127,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Scenario release number','Scenario release number','4  ','   ',0,130,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Scenario version number','Scenario version number','4  ','   ',0,128,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Sender identification','Sender identification','4  ','   ',0,4,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Sequence of transfer','Sequence of transfer','4  ','   ',0,70,'N0',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Service code list directory version number','Service code list directory version number','4  ','   ',0,80,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Syntax identifier','Syntax identifier','4  ','   ',0,1,'AB',4,1,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Syntax release number','Syntax release number','4  ','   ',0,76,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Syntax version number','Syntax version number','4  ','   ',0,2,'A',1,1,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Test indicator','Test indicator','4  ','   ',0,35,'N0',1,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4     Time','Time','4  ','   ',0,19,'T',4,1,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Action, coded','Action, coded','4  ','1  ',1,83,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Address for reverse routing','Address for reverse routing','4  ','1  ',0,8,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Association assigned code','Association assigned code','4  ','1  ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Controlling agency','Controlling agency','4  ','1  ',1,51,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Erroneous component data element po','Erroneous component data element po','4  ','1  ',0,104,'S',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Erroneous data element occurrence','Erroneous data element occurrence','4  ','1  ',0,136,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Erroneous data element position in','Erroneous data element position in','4  ','1  ',0,98,'S',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Functional group reference number','Functional group reference number','4  ','1  ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Interchange control reference','Interchange control reference','4  ','1  ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Message reference number','Message reference number','4  ','1  ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Message release number','Message release number','4  ','1  ',1,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Message type','Message type','4  ','1  ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Message version number','Message version number','4  ','1  ',1,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Package reference number','Package reference number','4  ','1  ',0,800,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Partner identification code qualifi','Partner identification code qualifi','4  ','1  ',1,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Recipient identification','Recipient identification','4  ','1  ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Recipient''s identification','Recipient''s identification','4  ','1  ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Reference identification number','Reference identification number','4  ','1  ',0,802,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Reference qualifier','Reference qualifier','4  ','1  ',0,813,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Routing address','Routing address','4  ','1  ',0,14,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Security reference number','Security reference number','4  ','1  ',0,534,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Security segment position','Security segment position','4  ','1  ',0,138,'N0',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Segment position in message','Segment position in message','4  ','1  ',0,96,'S',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Sender identification','Sender identification','4  ','1  ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Service segment tag, coded','Service segment tag, coded','4  ','1  ',1,135,'AB',3,1,NULL,3,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'4  1  Syntax error, coded','Syntax error, coded','4  ','1  ',1,85,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Action, coded','Action, coded','D  ','3  ',1,83,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Address for reverse routing','Address for reverse routing','D  ','3  ',0,8,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Association assigned code','Association assigned code','D  ','3  ',0,57,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Controlling agency','Controlling agency','D  ','3  ',1,51,'A',2,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Erroneous component data element po','Erroneous component data element po','D  ','3  ',0,104,'S',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Erroneous data element position in','Erroneous data element position in','D  ','3  ',0,98,'S',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Functional group reference number','Functional group reference number','D  ','3  ',0,48,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Interchange control reference','Interchange control reference','D  ','3  ',0,20,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Message reference number','Message reference number','D  ','3  ',0,62,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Message release number','Message release number','D  ','3  ',1,54,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Message type','Message type','D  ','3  ',0,65,'A',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Message version number','Message version number','D  ','3  ',1,52,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Partner identification code qualifi','Partner identification code qualifi','D  ','3  ',1,7,'A',4,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Recipient identification','Recipient identification','D  ','3  ',0,10,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Recipient''s identification','Recipient''s identification','D  ','3  ',0,44,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Routing address','Routing address','D  ','3  ',0,14,'A',14,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Segment position in message','Segment position in message','D  ','3  ',0,96,'S',6,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Sender identification','Sender identification','D  ','3  ',0,40,'A',35,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Service segment tag, coded','Service segment tag, coded','D  ','3  ',1,13,'AB',3,1,NULL,3,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (3,'D  3  Syntax error, coded','Syntax error, coded','D  ','3  ',1,85,'A',3,0,NULL,1,NULL,1,NULL,'','')

INSERT INTO elmnts VALUES (5,'00204 Acknowledgment requested','Acknowledgment requested','002','04 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Application receivers code','Application receivers code','002','04 ',0,124,'A',12,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Application senders code','Application senders code','002','04 ',0,142,'A',12,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Authorization information','Authorization information','002','04 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Authorization information qualifier','Authorization information qualifier','002','04 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Functional id code','Functional id code','002','04 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Group control number','Group control number','002','04 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange Acknowledgement Code','Interchange Acknowledgement Code','002','04 ',0,17,'AB',1,1,NULL,1,NULL,1,NULL,NULL,NULL)

INSERT INTO elmnts VALUES (5,'00204 Interchange control number','Interchange control number','002','04 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange control standards id','Interchange control standards id','002','04 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange control version number','Interchange control version number','002','04 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange date','Interchange date','002','04 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange id qualifier','Interchange id qualifier','002','04 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange Note Code','Interchange Note Code','002','04 ',0,18,'N0',3,1,NULL,3,NULL,1,NULL,NULL,NULL)

INSERT INTO elmnts VALUES (5,'00204 Interchange receiver id','Interchange receiver id','002','04 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange sender id','Interchange sender id','002','04 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Interchange time','Interchange time','002','04 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Number of included functional group','Number of included functional group','002','04 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Number of included segments','Number of included segments','002','04 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Number of transaction sets included','Number of transaction sets included','002','04 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Responsible agency code','Responsible agency code','002','04 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Security information','Security information','002','04 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Security information qualifier','Security information qualifier','002','04 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Sub-element separator','Sub-element separator','002','04 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Test indicator','Test indicator','002','04 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Transaction set control number','Transaction set control number','002','04 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Transaction set identifier code','Transaction set identifier code','002','04 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00204 Version/release/industry id code','Version/release/industry id code','002','04 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Copy of Bad Data Element','Copy of Bad Data Element','002','040',0,724,'A',80,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Data Element Reference Number','Data Element Reference Number','002','040',0,725,'N0',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Data Element Syntax Error Code','Data Element Syntax Error Code','002','040',1,723,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'002040Date','Date','002','040',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Element Position in Segment','Element Position in Segment','002','040',0,722,'N0',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Functional Group Acknowledge Code','Functional Group Acknowledge Code','002','040',1,715,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'002040Functional Group Syntax Error Code','Functional Group Syntax Error Code','002','040',1,716,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'002040Functional Identifier Code','Functional Identifier Code','002','040',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Group Control Number','Group Control Number','002','040',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Loop Identifier Code','Loop Identifier Code','002','040',0,447,'A',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Number of Accepted Transaction Sets','Number of Accepted Transaction Sets','002','040',0,2,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Number of Received Transaction Sets','Number of Received Transaction Sets','002','040',0,123,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Number of Transaction Sets Included','Number of Transaction Sets Included','002','040',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Segment ID Code','Segment ID Code','002','040',0,721,'A',3,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Segment Position in Transaction Set','Segment Position in Transaction Set','002','040',0,719,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Segment Syntax Error Code','Segment Syntax Error Code','002','040',1,720,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'002040Time','Time','002','040',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Transaction Set Acknowledgment Code','Transaction Set Acknowledgment Code','002','040',1,717,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'002040Transaction Set Control Number','Transaction Set Control Number','002','040',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Transaction Set Identifier Code','Transaction Set Identifier Code','002','040',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'002040Transaction Set Syntax Error Code','Transaction Set Syntax Error Code','002','040',1,718,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Acknowledgment requested','Acknowledgment requested','003','01 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Application receivers code','Application receivers code','003','01 ',0,124,'A',12,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Application senders code','Application senders code','003','01 ',0,142,'A',12,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Authorization information','Authorization information','003','01 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Authorization information qualifier','Authorization information qualifier','003','01 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Functional id code','Functional id code','003','01 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Group control number','Group control number','003','01 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','01 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange control number','Interchange control number','003','01 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange control standards id','Interchange control standards id','003','01 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange control version number','Interchange control version number','003','01 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange date','Interchange date','003','01 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange id qualifier','Interchange id qualifier','003','01 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange Note Code','Interchange Note Code','003','01 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange receiver id','Interchange receiver id','003','01 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange sender id','Interchange sender id','003','01 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Interchange time','Interchange time','003','01 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Number of included functional group','Number of included functional group','003','01 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Number of included segments','Number of included segments','003','01 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Number of transaction sets included','Number of transaction sets included','003','01 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Responsible agency code','Responsible agency code','003','01 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Security information','Security information','003','01 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Security information qualifier','Security information qualifier','003','01 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Sub-element separator','Sub-element separator','003','01 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Test indicator','Test indicator','003','01 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Transaction set control number','Transaction set control number','003','01 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Transaction set identifier code','Transaction set identifier code','003','01 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00301 Version/release/industry id code','Version/release/industry id code','003','01 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Copy of Bad Data Element','Copy of Bad Data Element','003','010',0,724,'A',80,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Data Element Reference Number','Data Element Reference Number','003','010',0,725,'N0',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Data Element Syntax Error Code','Data Element Syntax Error Code','003','010',1,723,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003010Date','Date','003','010',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Element Position in Segment','Element Position in Segment','003','010',0,722,'N0',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Functional Group Acknowledge Code','Functional Group Acknowledge Code','003','010',1,715,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003010Functional Group Syntax Error Code','Functional Group Syntax Error Code','003','010',1,716,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003010Functional Identifier Code','Functional Identifier Code','003','010',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Group Control Number','Group Control Number','003','010',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Loop Identifier Code','Loop Identifier Code','003','010',0,447,'A',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Number of Accepted Transaction Sets','Number of Accepted Transaction Sets','003','010',0,2,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Number of Received Transaction Sets','Number of Received Transaction Sets','003','010',0,123,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Number of Transaction Sets Included','Number of Transaction Sets Included','003','010',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Segment ID Code','Segment ID Code','003','010',0,721,'A',3,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Segment Position in Transaction Set','Segment Position in Transaction Set','003','010',0,719,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Segment Syntax Error Code','Segment Syntax Error Code','003','010',1,720,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003010Time','Time','003','010',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Transaction Set Acknowledgment Code','Transaction Set Acknowledgment Code','003','010',1,717,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003010Transaction Set Control Number','Transaction Set Control Number','003','010',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Transaction Set Identifier Code','Transaction Set Identifier Code','003','010',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003010Transaction Set Syntax Error Code','Transaction Set Syntax Error Code','003','010',1,718,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00302 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','02 ',0,17,'AN',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00302 Interchange Note Code','Interchange Note Code','003','02 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003020Acknowledgment Requested','Acknowledgment Requested','003','020',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Application Receiver`s Code','Application Receiver`s Code','003','020',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Application Sender`s Code','Application Sender`s Code','003','020',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Authorization Information','Authorization Information','003','020',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Authorization Information Qualifier','Authorization Information Qualifier','003','020',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Date','Date','003','020',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Functional Identifier Code','Functional Identifier Code','003','020',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Group Control Number','Group Control Number','003','020',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Control Number','Interchange Control Number','003','020',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Control Standards Ident','Interchange Control Standards Ident','003','020',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Control Version Number','Interchange Control Version Number','003','020',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Date','Interchange Date','003','020',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange ID Qualifier','Interchange ID Qualifier','003','020',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Receiver ID','Interchange Receiver ID','003','020',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Sender ID','Interchange Sender ID','003','020',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Interchange Time','Interchange Time','003','020',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Number of Included Functional Group','Number of Included Functional Group','003','020',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Number of Included Segments','Number of Included Segments','003','020',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Number of Transaction Sets Included','Number of Transaction Sets Included','003','020',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Responsible Agency Code','Responsible Agency Code','003','020',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Security Information','Security Information','003','020',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Security Information Qualifier','Security Information Qualifier','003','020',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Subelement Separator','Subelement Separator','003','020',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Test Indicator','Test Indicator','003','020',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Time','Time','003','020',0,337,'AN',6,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Transaction Set Control Number','Transaction Set Control Number','003','020',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Transaction Set Identifier Code','Transaction Set Identifier Code','003','020',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003020Version / Release / Industry Identi','Version / Release / Industry Identi','003','020',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Acknowledgment requested','Acknowledgment requested','003','03 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Application receivers code','Application receivers code','003','03 ',0,124,'A',12,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Application senders code','Application senders code','003','03 ',0,142,'A',12,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Authorization information','Authorization information','003','03 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Authorization information qualifier','Authorization information qualifier','003','03 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Functional id code','Functional id code','003','03 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Group control number','Group control number','003','03 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','03 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange control number','Interchange control number','003','03 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange control standards id','Interchange control standards id','003','03 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange control version number','Interchange control version number','003','03 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange date','Interchange date','003','03 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange id qualifier','Interchange id qualifier','003','03 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange Note Code','Interchange Note Code','003','03 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange receiver id','Interchange receiver id','003','03 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange sender id','Interchange sender id','003','03 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Interchange time','Interchange time','003','03 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Number of included functional group','Number of included functional group','003','03 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Number of included segments','Number of included segments','003','03 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Number of transaction sets included','Number of transaction sets included','003','03 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Responsible agency code','Responsible agency code','003','03 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Security information','Security information','003','03 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Security information qualifier','Security information qualifier','003','03 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Sub-element separator','Sub-element separator','003','03 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Test indicator','Test indicator','003','03 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Transaction set control number','Transaction set control number','003','03 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Transaction set identifier code','Transaction set identifier code','003','03 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00303 Version/release/industry id code','Version/release/industry id code','003','03 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003030Date','Date','003','030',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003030Time','Time','003','030',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Acknowledgment requested','Acknowledgment requested','003','04 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Application receivers code','Application receivers code','003','04 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Application senders code','Application senders code','003','04 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Authorization information','Authorization information','003','04 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Authorization information qualifier','Authorization information qualifier','003','04 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Date','Date','003','04 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Functional id code','Functional id code','003','04 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Group control number','Group control number','003','04 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','04 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange control number','Interchange control number','003','04 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange control standards id','Interchange control standards id','003','04 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange control version number','Interchange control version number','003','04 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange date','Interchange date','003','04 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange id qualifier','Interchange id qualifier','003','04 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange Note Code','Interchange Note Code','003','04 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange receiver id','Interchange receiver id','003','04 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange sender id','Interchange sender id','003','04 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Interchange time','Interchange time','003','04 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Number of included functional group','Number of included functional group','003','04 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Number of included segments','Number of included segments','003','04 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Number of transaction sets included','Number of transaction sets included','003','04 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Responsible agency code','Responsible agency code','003','04 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Security information','Security information','003','04 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Security information qualifier','Security information qualifier','003','04 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Sub-element separator','Sub-element separator','003','04 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Test indicator','Test indicator','003','04 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Time','Time','003','04 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Transaction set control number','Transaction set control number','003','04 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Transaction set identifier code','Transaction set identifier code','003','04 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00304 Version/release/industry id code','Version/release/industry id code','003','04 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Acknowledgment requested','Acknowledgment requested','003','05 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Application receivers code','Application receivers code','003','05 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Application senders code','Application senders code','003','05 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Authorization information','Authorization information','003','05 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Authorization information qualifier','Authorization information qualifier','003','05 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Date','Date','003','05 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Functional id code','Functional id code','003','05 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Group control number','Group control number','003','05 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','05 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange control number','Interchange control number','003','05 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange control standards id','Interchange control standards id','003','05 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange control version number','Interchange control version number','003','05 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange date','Interchange date','003','05 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange id qualifier','Interchange id qualifier','003','05 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange Note Code','Interchange Note Code','003','05 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange receiver id','Interchange receiver id','003','05 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange sender id','Interchange sender id','003','05 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Interchange time','Interchange time','003','05 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Number of included functional group','Number of included functional group','003','05 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Number of included segments','Number of included segments','003','05 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Number of transaction sets included','Number of transaction sets included','003','05 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Responsible agency code','Responsible agency code','003','05 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Security information','Security information','003','05 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Security information qualifier','Security information qualifier','003','05 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Sub-element separator','Sub-element separator','003','05 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Test indicator','Test indicator','003','05 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Time','Time','003','05 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Transaction set control number','Transaction set control number','003','05 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Transaction set identifier code','Transaction set identifier code','003','05 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00305 Version/release/industry id code','Version/release/industry id code','003','05 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Acknowledgment requested','Acknowledgment requested','003','06 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Application receivers code','Application receivers code','003','06 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Application senders code','Application senders code','003','06 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Authorization information','Authorization information','003','06 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Authorization information qualifier','Authorization information qualifier','003','06 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Date','Date','003','06 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Functional id code','Functional id code','003','06 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Group control number','Group control number','003','06 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','06 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange control number','Interchange control number','003','06 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange control standards id','Interchange control standards id','003','06 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange control version number','Interchange control version number','003','06 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange date','Interchange date','003','06 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange id qualifier','Interchange id qualifier','003','06 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange Note Code','Interchange Note Code','003','06 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange receiver id','Interchange receiver id','003','06 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange sender id','Interchange sender id','003','06 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Interchange time','Interchange time','003','06 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Number of included functional group','Number of included functional group','003','06 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Number of included segments','Number of included segments','003','06 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Number of transaction sets included','Number of transaction sets included','003','06 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Responsible agency code','Responsible agency code','003','06 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Security information','Security information','003','06 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Security information qualifier','Security information qualifier','003','06 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Sub-element separator','Sub-element separator','003','06 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Test indicator','Test indicator','003','06 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Time','Time','003','06 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Transaction set control number','Transaction set control number','003','06 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Transaction set identifier code','Transaction set identifier code','003','06 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00306 Version/release/industry id code','Version/release/industry id code','003','06 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Component Data Element Position in','Component Data Element Position in','003','060',0,1528,'N0',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Copy of Bad Data Element','Copy of Bad Data Element','003','060',0,724,'A',99,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Data Element Reference Number','Data Element Reference Number','003','060',0,725,'N0',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Data Element Syntax Error Code','Data Element Syntax Error Code','003','060',1,723,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Element Position in Segment','Element Position in Segment','003','060',0,722,'N0',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Functional Group Acknowledge Code','Functional Group Acknowledge Code','003','060',1,715,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Functional Group Syntax Error Code','Functional Group Syntax Error Code','003','060',1,716,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Functional Identifier Code','Functional Identifier Code','003','060',1,479,'A',2,1,NULL,2,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Group Control Number','Group Control Number','003','060',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Loop Identifier Code','Loop Identifier Code','003','060',0,447,'A',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Number of Accepted Transaction Sets','Number of Accepted Transaction Sets','003','060',0,2,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Number of Received Transaction Sets','Number of Received Transaction Sets','003','060',0,123,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Number of Transaction Sets Included','Number of Transaction Sets Included','003','060',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Segment ID Code','Segment ID Code','003','060',0,721,'A',3,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Segment Position in Transaction Set','Segment Position in Transaction Set','003','060',0,719,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Segment Syntax Error Code','Segment Syntax Error Code','003','060',1,720,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Transaction Set Acknowledgment Code','Transaction Set Acknowledgment Code','003','060',1,717,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Transaction Set Control Number','Transaction Set Control Number','003','060',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'003060Transaction Set Identifier Code','Transaction Set Identifier Code','003','060',1,143,'A',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'003060Transaction Set Syntax Error Code','Transaction Set Syntax Error Code','003','060',1,718,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Acknowledgment requested','Acknowledgment requested','003','07 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Application receivers code','Application receivers code','003','07 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Application senders code','Application senders code','003','07 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Authorization information','Authorization information','003','07 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Authorization information qualifier','Authorization information qualifier','003','07 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Date','Date','003','07 ',0,373,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Functional id code','Functional id code','003','07 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Group control number','Group control number','003','07 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange Acknowledgement Code','Interchange Acknowledgement Code','003','07 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange control number','Interchange control number','003','07 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange control standards id','Interchange control standards id','003','07 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange control version number','Interchange control version number','003','07 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange date','Interchange date','003','07 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange id qualifier','Interchange id qualifier','003','07 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange Note Code','Interchange Note Code','003','07 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange receiver id','Interchange receiver id','003','07 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange sender id','Interchange sender id','003','07 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Interchange time','Interchange time','003','07 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Number of included functional group','Number of included functional group','003','07 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Number of included segments','Number of included segments','003','07 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Number of transaction sets included','Number of transaction sets included','003','07 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Responsible agency code','Responsible agency code','003','07 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Security information','Security information','003','07 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Security information qualifier','Security information qualifier','003','07 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Sub-element separator','Sub-element separator','003','07 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Test indicator','Test indicator','003','07 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Time','Time','003','07 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Transaction set control number','Transaction set control number','003','07 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Transaction set identifier code','Transaction set identifier code','003','07 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00307 Version/release/industry id code','Version/release/industry id code','003','07 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Acknowledgment requested','Acknowledgment requested','004','00 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Application receivers code','Application receivers code','004','00 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Application senders code','Application senders code','004','00 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Authorization information','Authorization information','004','00 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Authorization information qualifier','Authorization information qualifier','004','00 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Date','Date','004','00 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Functional id code','Functional id code','004','00 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Group control number','Group control number','004','00 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','00 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange control number','Interchange control number','004','00 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange control standards id','Interchange control standards id','004','00 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange control version number','Interchange control version number','004','00 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange date','Interchange date','004','00 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange id qualifier','Interchange id qualifier','004','00 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange Note Code','Interchange Note Code','004','00 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange receiver id','Interchange receiver id','004','00 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange sender id','Interchange sender id','004','00 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Interchange time','Interchange time','004','00 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Number of included functional group','Number of included functional group','004','00 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Number of included segments','Number of included segments','004','00 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Number of transaction sets included','Number of transaction sets included','004','00 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Responsible agency code','Responsible agency code','004','00 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Security information','Security information','004','00 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Security information qualifier','Security information qualifier','004','00 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Sub-element separator','Sub-element separator','004','00 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Test indicator','Test indicator','004','00 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Time','Time','004','00 ',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Transaction set control number','Transaction set control number','004','00 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Transaction set identifier code','Transaction set identifier code','004','00 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00400 Version/release/industry id code','Version/release/industry id code','004','00 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Acknowledgment requested','Acknowledgment requested','004','01 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Application receivers code','Application receivers code','004','01 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Application senders code','Application senders code','004','01 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Authorization information','Authorization information','004','01 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Authorization information qualifier','Authorization information qualifier','004','01 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Date','Date','004','01 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Functional id code','Functional id code','004','01 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Group control number','Group control number','004','01 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','01 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange control number','Interchange control number','004','01 ',0,9012,'N0',9,1,NULL,9,NULL,0,NULL,NULL,NULL)

INSERT INTO elmnts VALUES (5,'00401 Interchange control standards id','Interchange control standards id','004','01 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange control version number','Interchange control version number','004','01 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange date','Interchange date','004','01 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange id qualifier','Interchange id qualifier','004','01 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange Note Code','Interchange Note Code','004','01 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange receiver id','Interchange receiver id','004','01 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange sender id','Interchange sender id','004','01 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Interchange time','Interchange time','004','01 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Number of included functional group','Number of included functional group','004','01 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Number of included segments','Number of included segments','004','01 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Number of transaction sets included','Number of transaction sets included','004','01 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Responsible agency code','Responsible agency code','004','01 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Security information','Security information','004','01 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Security information qualifier','Security information qualifier','004','01 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Sub-element separator','Sub-element separator','004','01 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Test indicator','Test indicator','004','01 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Time','Time','004','01 ',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Transaction set control number','Transaction set control number','004','01 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Transaction set identifier code','Transaction set identifier code','004','01 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00401 Version/release/industry id code','Version/release/industry id code','004','01 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Component Data Element Position in','Component Data Element Position in','004','010',0,1528,'S0',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Copy of Bad Data Element','Copy of Bad Data Element','004','010',0,724,'A',99,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Data Element Reference Number','Data Element Reference Number','004','010',0,725,'S0',4,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Data Element Syntax Error Code','Data Element Syntax Error Code','004','010',1,723,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Element Position in Segment','Element Position in Segment','004','010',0,722,'S0',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Functional Group Acknowledge Code','Functional Group Acknowledge Code','004','010',1,715,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Functional Group Syntax Error Code','Functional Group Syntax Error Code','004','010',1,716,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Functional Identifier Code','Functional Identifier Code','004','010',1,479,'A',2,1,NULL,2,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Group Control Number','Group Control Number','004','010',0,28,'S0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Loop Identifier Code','Loop Identifier Code','004','010',0,447,'A',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Number of Accepted Transaction Sets','Number of Accepted Transaction Sets','004','010',0,2,'S0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Number of Received Transaction Sets','Number of Received Transaction Sets','004','010',0,123,'S0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Number of Transaction Sets Included','Number of Transaction Sets Included','004','010',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Segment ID Code','Segment ID Code','004','010',0,721,'A',3,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Segment Position in Transaction Set','Segment Position in Transaction Set','004','010',0,719,'S0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Segment Syntax Error Code','Segment Syntax Error Code','004','010',1,720,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Transaction Set Acknowledgment Code','Transaction Set Acknowledgment Code','004','010',1,717,'A',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Transaction Set Control Number','Transaction Set Control Number','004','010',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'004010Transaction Set Identifier Code','Transaction Set Identifier Code','004','010',1,143,'A',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'004010Transaction Set Syntax Error Code','Transaction Set Syntax Error Code','004','010',1,718,'A',3,0,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Acknowledgment requested','Acknowledgment requested','004','02 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Application receivers code','Application receivers code','004','02 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Application senders code','Application senders code','004','02 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Authorization information','Authorization information','004','02 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Authorization information qualifier','Authorization information qualifier','004','02 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Date','Date','004','02 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Functional id code','Functional id code','004','02 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Group control number','Group control number','004','02 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Implementation Convention Reference','Implementation Convention Reference','004','02 ',0,1705,'A',35,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','02 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange control number','Interchange control number','004','02 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange control standards id','Interchange control standards id','004','02 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange control version number','Interchange control version number','004','02 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange date','Interchange date','004','02 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange id qualifier','Interchange id qualifier','004','02 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange Note Code','Interchange Note Code','004','02 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange receiver id','Interchange receiver id','004','02 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange sender id','Interchange sender id','004','02 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Interchange time','Interchange time','004','02 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Number of included functional group','Number of included functional group','004','02 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Number of included segments','Number of included segments','004','02 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Number of transaction sets included','Number of transaction sets included','004','02 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Responsible agency code','Responsible agency code','004','02 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Security information','Security information','004','02 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Security information qualifier','Security information qualifier','004','02 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Sub-element separator','Sub-element separator','004','02 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Test indicator','Test indicator','004','02 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Time','Time','004','02 ',0,337,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Transaction set control number','Transaction set control number','004','02 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Transaction set identifier code','Transaction set identifier code','004','02 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00402 Version/release/industry id code','Version/release/industry id code','004','02 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Acknowledgment requested','Acknowledgment requested','004','03 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Application receivers code','Application receivers code','004','03 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Application senders code','Application senders code','004','03 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Authorization information','Authorization information','004','03 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Authorization information qualifier','Authorization information qualifier','004','03 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Date','Date','004','03 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Functional id code','Functional id code','004','03 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Group control number','Group control number','004','03 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Implementation Convention Reference','Implementation Convention Reference','004','03 ',0,1705,'A',35,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','03 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange control number','Interchange control number','004','03 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange control standards id','Interchange control standards id','004','03 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange control version number','Interchange control version number','004','03 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange date','Interchange date','004','03 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange id qualifier','Interchange id qualifier','004','03 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange Note Code','Interchange Note Code','004','03 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange receiver id','Interchange receiver id','004','03 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange sender id','Interchange sender id','004','03 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Interchange time','Interchange time','004','03 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Number of included functional group','Number of included functional group','004','03 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Number of included segments','Number of included segments','004','03 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Number of transaction sets included','Number of transaction sets included','004','03 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Responsible agency code','Responsible agency code','004','03 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Security information','Security information','004','03 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Security information qualifier','Security information qualifier','004','03 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Sub-element separator','Sub-element separator','004','03 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Test indicator','Test indicator','004','03 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Time','Time','004','03 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Transaction set control number','Transaction set control number','004','03 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Transaction set identifier code','Transaction set identifier code','004','03 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00403 Version/release/industry id code','Version/release/industry id code','004','03 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Acknowledgment requested','Acknowledgment requested','004','04 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Application receivers code','Application receivers code','004','04 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Application senders code','Application senders code','004','04 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Authorization information','Authorization information','004','04 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Authorization information qualifier','Authorization information qualifier','004','04 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Date','Date','004','04 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Functional id code','Functional id code','004','04 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Group control number','Group control number','004','04 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','04 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange control number','Interchange control number','004','04 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange control standards id','Interchange control standards id','004','04 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange control version number','Interchange control version number','004','04 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange date','Interchange date','004','04 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange id qualifier','Interchange id qualifier','004','04 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange Note Code','Interchange Note Code','004','04 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange receiver id','Interchange receiver id','004','04 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange sender id','Interchange sender id','004','04 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Interchange time','Interchange time','004','04 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Number of included functional group','Number of included functional group','004','04 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Number of included segments','Number of included segments','004','04 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Number of transaction sets included','Number of transaction sets included','004','04 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Responsible agency code','Responsible agency code','004','04 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Security information','Security information','004','04 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Security information qualifier','Security information qualifier','004','04 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Sub-element separator','Sub-element separator','004','04 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Test indicator','Test indicator','004','04 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Time','Time','004','04 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Transaction set control number','Transaction set control number','004','04 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Transaction set identifier code','Transaction set identifier code','004','04 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00404 Version/release/industry id code','Version/release/industry id code','004','04 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Acknowledgment requested','Acknowledgment requested','004','05 ',0,9013,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Application receivers code','Application receivers code','004','05 ',0,124,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Application senders code','Application senders code','004','05 ',0,142,'A',15,0,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Authorization information','Authorization information','004','05 ',0,9002,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Authorization information qualifier','Authorization information qualifier','004','05 ',0,9001,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Date','Date','004','05 ',0,373,'CY',8,1,NULL,8,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Functional id code','Functional id code','004','05 ',0,479,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Group control number','Group control number','004','05 ',0,28,'N0',9,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Implementation Convention Reference','Implementation Convention Reference','004','05 ',0,1705,'A',35,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange Acknowledgement Code','Interchange Acknowledgement Code','004','05 ',0,17,'AB',1,1,NULL,1,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange control number','Interchange control number','004','05 ',0,9012,'N0',9,1,NULL,9,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange control standards id','Interchange control standards id','004','05 ',0,9010,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange control version number','Interchange control version number','004','05 ',0,9011,'A',5,1,NULL,5,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange date','Interchange date','004','05 ',0,9008,'DY',6,1,NULL,6,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange id qualifier','Interchange id qualifier','004','05 ',0,9005,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange Note Code','Interchange Note Code','004','05 ',0,18,'N0',3,1,NULL,3,NULL,1,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange receiver id','Interchange receiver id','004','05 ',0,9007,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange sender id','Interchange sender id','004','05 ',0,9006,'A',15,1,NULL,15,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Interchange time','Interchange time','004','05 ',0,9009,'T',4,1,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Number of included functional group','Number of included functional group','004','05 ',0,9016,'N0',5,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Number of included segments','Number of included segments','004','05 ',0,96,'N0',10,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Number of transaction sets included','Number of transaction sets included','004','05 ',0,97,'N0',6,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Responsible agency code','Responsible agency code','004','05 ',0,455,'A',2,0,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Security information','Security information','004','05 ',0,9004,'A',10,1,NULL,10,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Security information qualifier','Security information qualifier','004','05 ',0,9003,'A',2,1,NULL,2,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Sub-element separator','Sub-element separator','004','05 ',0,9015,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Test indicator','Test indicator','004','05 ',0,9014,'A',1,1,NULL,1,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Time','Time','004','05 ',0,337,'A',8,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Transaction set control number','Transaction set control number','004','05 ',0,329,'A',9,0,NULL,4,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Transaction set identifier code','Transaction set identifier code','004','05 ',0,143,'A',3,1,NULL,3,NULL,0,0,'','')

INSERT INTO elmnts VALUES (5,'00405 Version/release/industry id code','Version/release/industry id code','004','05 ',0,480,'A',12,0,NULL,1,NULL,0,0,'','')


GO

INSERT INTO eltype VALUES ('A',80,1,'alpha')

INSERT INTO eltype VALUES ('AB',80,1,'alphabetic')

INSERT INTO eltype VALUES ('AL',80,1,'alpha lowercase')

INSERT INTO eltype VALUES ('AN',80,1,'alphanumeric')

INSERT INTO eltype VALUES ('AU',80,1,'alpha uppercase')

INSERT INTO eltype VALUES ('BA',1,0,'boolean: Y or N')

INSERT INTO eltype VALUES ('BL',99,1,'binary large object')

INSERT INTO eltype VALUES ('BN',1,0,'boolean: 1 or 0')

INSERT INTO eltype VALUES ('BS',80,1,'bitstring')

INSERT INTO eltype VALUES ('CD',8,0,'date: "dd-mm-yyyy"')

INSERT INTO eltype VALUES ('CM',8,0,'date: "mm-dd-yyyy"')

INSERT INTO eltype VALUES ('CY',8,0,'date: "yyyy-mm-dd"')

INSERT INTO eltype VALUES ('DD',6,0,'date: "dd-mm-yy"')

INSERT INTO eltype VALUES ('DM',6,0,'date: "mm-dd-yy"')

INSERT INTO eltype VALUES ('DY',6,0,'date: "yy-mm-dd"')

INSERT INTO eltype VALUES ('N',18,1,'numeric (floating point)')

INSERT INTO eltype VALUES ('N0',18,1,'numeric with 0 decimals')

INSERT INTO eltype VALUES ('N1',18,1,'numeric with 1 decimal')

INSERT INTO eltype VALUES ('N2',18,1,'numeric with 2 decimals')

INSERT INTO eltype VALUES ('N3',18,1,'numeric with 3 decimals')

INSERT INTO eltype VALUES ('N4',18,1,'numeric with 4 decimals')

INSERT INTO eltype VALUES ('N5',18,1,'numeric with 5 decimals')

INSERT INTO eltype VALUES ('N6',18,1,'numeric with 6 decimals')

INSERT INTO eltype VALUES ('N7',18,1,'numeric with 7 decimals')

INSERT INTO eltype VALUES ('N8',18,1,'numeric with 8 decimals')

INSERT INTO eltype VALUES ('N9',18,1,'numeric with 9 decimals')

INSERT INTO eltype VALUES ('S',18,1,'signed numeric (floating point)')

INSERT INTO eltype VALUES ('S0',18,1,'signed numeric with 0 decimals')

INSERT INTO eltype VALUES ('S1',18,1,'signed numeric with 1 decimal')

INSERT INTO eltype VALUES ('S2',18,1,'signed numeric with 2 decimals')

INSERT INTO eltype VALUES ('S3',18,1,'signed numeric with 3 decimals')

INSERT INTO eltype VALUES ('S4',18,1,'signed numeric with 4 decimals')

INSERT INTO eltype VALUES ('S5',18,1,'signed numeric with 5 decimals')

INSERT INTO eltype VALUES ('S6',18,1,'signed numeric with 6 decimals')

INSERT INTO eltype VALUES ('S7',18,1,'signed numeric with 7 decimals')

INSERT INTO eltype VALUES ('S8',18,1,'signed numeric with 8 decimals')

INSERT INTO eltype VALUES ('S9',18,1,'signed numeric with 9 decimals')

INSERT INTO eltype VALUES ('T',4,0,'time: "hh:mm"')

INSERT INTO eltype VALUES ('TS',6,0,'time: "hh:mm:ss"')

INSERT INTO errtxt VALUES (1,1,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,3,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,4,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,5,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,6,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,7,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,8,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,9,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,10,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,11,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,12,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,13,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,14,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,15,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,16,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,17,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,18,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,19,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,20,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,21,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,22,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,23,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,24,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,25,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,26,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,27,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,28,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,29,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,30,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,31,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,32,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,33,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,34,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,35,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,36,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,37,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,38,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,39,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,40,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,41,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,42,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,43,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,44,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,45,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,46,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,47,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,48,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,49,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,50,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,51,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,52,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,53,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,54,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,55,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,56,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,57,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,58,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,59,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,60,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,61,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,62,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,63,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,64,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,65,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,66,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,67,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,68,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,69,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,70,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,71,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,72,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,73,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,74,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,75,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,76,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,77,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,78,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,79,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,80,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,81,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,82,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,83,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,84,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,85,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,86,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,87,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,88,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,89,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,90,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,91,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,92,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,93,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,94,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,95,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,96,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,97,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,98,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,99,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,100,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,101,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,102,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,103,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,104,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,105,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,106,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,107,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,108,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,109,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,110,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,111,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,112,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,113,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,114,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,115,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,116,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,117,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,118,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,119,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,120,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,121,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,122,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,123,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,124,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,125,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,500,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1001,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1003,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1004,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1005,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1006,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1007,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1008,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1009,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1010,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1011,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1012,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1013,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1014,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1015,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1016,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1017,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1018,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1019,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1020,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1021,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1022,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1023,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1024,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1025,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1026,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1027,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1028,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1029,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1030,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1031,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1032,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1033,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1034,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1035,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1036,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1037,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1038,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1039,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1040,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1041,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1042,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,1043,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2001,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2002,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2003,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2004,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2005,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2006,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2007,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2008,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2009,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2010,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2011,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2012,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2013,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2014,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2015,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2016,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2017,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2018,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2019,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2020,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2021,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2022,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2023,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2024,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2025,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2026,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2027,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2028,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2029,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2030,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2031,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2032,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2033,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2034,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2035,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2036,NULL,125,NULL,NULL)

INSERT INTO errtxt VALUES (1,2037,NULL,125,NULL,NULL)

INSERT INTO errtxt VALUES (1,2038,NULL,125,NULL,NULL)

INSERT INTO errtxt VALUES (1,2039,NULL,125,NULL,NULL)

INSERT INTO errtxt VALUES (1,2040,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2041,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2042,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2043,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2044,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2045,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2046,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2047,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2048,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2049,NULL,12,NULL,NULL)

INSERT INTO errtxt VALUES (1,2050,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2051,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2052,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2053,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2054,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2055,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2056,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2057,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2058,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2059,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2060,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2061,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2062,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2063,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2064,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2065,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2066,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2067,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2068,NULL,12,NULL,NULL)

INSERT INTO errtxt VALUES (1,2069,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2070,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2071,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2072,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2073,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2074,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2075,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2076,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2077,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2078,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2079,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2080,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2081,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2082,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2083,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2084,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2085,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2086,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2087,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2088,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2089,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2090,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2091,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2092,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2093,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2094,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2095,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2096,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2097,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2098,NULL,2,NULL,NULL)

INSERT INTO errtxt VALUES (1,2099,NULL,1031,NULL,NULL)

INSERT INTO errtxt VALUES (1,2100,NULL,3,NULL,NULL)

INSERT INTO errtxt VALUES (1,2101,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2102,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2103,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2104,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2105,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2106,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2107,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2108,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2109,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2110,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2111,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2112,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2113,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2114,NULL,2105,NULL,NULL)

INSERT INTO errtxt VALUES (1,2115,NULL,2110,NULL,NULL)

INSERT INTO errtxt VALUES (1,2116,NULL,2105,NULL,NULL)

INSERT INTO errtxt VALUES (1,2117,NULL,2106,NULL,NULL)

INSERT INTO errtxt VALUES (1,2118,NULL,2106,NULL,NULL)

INSERT INTO errtxt VALUES (1,2119,NULL,2107,NULL,NULL)

INSERT INTO errtxt VALUES (1,2120,NULL,2110,NULL,NULL)

INSERT INTO errtxt VALUES (1,2121,NULL,2105,NULL,NULL)

INSERT INTO errtxt VALUES (1,2122,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2123,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2124,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2125,NULL,2124,NULL,NULL)

INSERT INTO errtxt VALUES (1,2126,NULL,2124,NULL,NULL)

INSERT INTO errtxt VALUES (1,2127,NULL,2124,NULL,NULL)

INSERT INTO errtxt VALUES (1,2128,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2129,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2130,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2131,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2132,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2133,NULL,2130,NULL,NULL)

INSERT INTO errtxt VALUES (1,2134,NULL,2106,NULL,NULL)

INSERT INTO errtxt VALUES (1,2135,NULL,2106,NULL,NULL)

INSERT INTO errtxt VALUES (1,2136,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2137,NULL,2108,NULL,NULL)

INSERT INTO errtxt VALUES (1,2138,NULL,2106,NULL,NULL)

INSERT INTO errtxt VALUES (1,2139,NULL,2107,NULL,NULL)

INSERT INTO errtxt VALUES (1,2140,NULL,2107,NULL,NULL)

INSERT INTO errtxt VALUES (1,2141,NULL,2109,NULL,NULL)

INSERT INTO errtxt VALUES (1,2142,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2143,NULL,2130,NULL,NULL)

INSERT INTO errtxt VALUES (1,2144,NULL,2131,NULL,NULL)

INSERT INTO errtxt VALUES (1,2145,NULL,2141,NULL,NULL)

INSERT INTO errtxt VALUES (1,2146,NULL,2130,NULL,NULL)

INSERT INTO errtxt VALUES (1,2147,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2148,NULL,2111,NULL,NULL)

INSERT INTO errtxt VALUES (1,2149,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2150,NULL,2149,NULL,NULL)

INSERT INTO errtxt VALUES (1,2151,NULL,82,NULL,NULL)

INSERT INTO errtxt VALUES (1,2152,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2153,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2154,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2155,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2156,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2157,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2158,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2159,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2160,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2161,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2162,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2163,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2164,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2165,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2166,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2167,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2168,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2169,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2170,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2171,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2172,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2173,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2174,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2175,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2176,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2177,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2178,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2179,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2180,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2181,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2182,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2183,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2184,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2185,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2186,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2187,NULL,NULL,NULL,NULL)

INSERT INTO errtxt VALUES (1,2188,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2189,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2190,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2191,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2192,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2193,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2194,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2195,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2196,NULL,120,NULL,NULL)

INSERT INTO errtxt VALUES (1,2197,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2198,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2199,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2200,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2201,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2202,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2203,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2204,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2205,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2206,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2207,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2208,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2209,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2210,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2211,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2212,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2213,NULL,121,NULL,NULL)

INSERT INTO errtxt VALUES (1,2214,NULL,46,NULL,NULL)

INSERT INTO errtxt VALUES (1,2215,NULL,49,NULL,NULL)

INSERT INTO errtxt VALUES (1,2216,NULL,14,NULL,NULL)

INSERT INTO errtxt VALUES (1,2217,NULL,49,NULL,NULL)

INSERT INTO errtxt VALUES (1,2218,NULL,39,NULL,NULL)

INSERT INTO errtxt VALUES (1,2219,NULL,18,NULL,NULL)

INSERT INTO errtxt VALUES (1,2220,NULL,41,NULL,NULL)

INSERT INTO errtxt VALUES (1,2221,NULL,42,NULL,NULL)

INSERT INTO errtxt VALUES (1,2222,NULL,41,NULL,NULL)

INSERT INTO errtxt VALUES (1,2223,NULL,42,NULL,NULL)

INSERT INTO errtxt VALUES (1,2224,NULL,13,NULL,NULL)

INSERT INTO errtxt VALUES (1,2225,NULL,19,NULL,NULL)

INSERT INTO errtxt VALUES (1,2226,NULL,47,NULL,NULL)

INSERT INTO errtxt VALUES (1,2227,NULL,46,NULL,NULL)

INSERT INTO errtxt VALUES (1,2228,NULL,49,NULL,NULL)

INSERT INTO errtxt VALUES (1,2229,NULL,46,NULL,NULL)

INSERT INTO errtxt VALUES (1,2230,NULL,49,NULL,NULL)

INSERT INTO errtxt VALUES (1,2231,NULL,37,NULL,NULL)

INSERT INTO errtxt VALUES (1,2232,NULL,68,NULL,NULL)

INSERT INTO errtxt VALUES (1,2233,NULL,79,NULL,NULL)

INSERT INTO errtxt VALUES (1,2234,NULL,79,NULL,NULL)

INSERT INTO errtxt VALUES (1,2235,NULL,79,NULL,NULL)

INSERT INTO errtxt VALUES (1,2236,NULL,79,NULL,NULL)

INSERT INTO errtxt VALUES (1,2237,NULL,68,NULL,NULL)

INSERT INTO errtxt VALUES (1,2238,NULL,46,NULL,NULL)

INSERT INTO errtxt VALUES (1,2239,NULL,79,NULL,NULL)

INSERT INTO errtxt VALUES (1,2240,NULL,23,NULL,NULL)

INSERT INTO errtxt VALUES (1,2241,NULL,1030,NULL,NULL)

INSERT INTO errtxt VALUES (1,2242,NULL,1030,NULL,NULL)

INSERT INTO errtxt VALUES (1,2243,NULL,NULL,NULL,NULL)


GO

INSERT INTO mfcvr VALUES ('1       ',1,'   ','   ','INHOUSE','i',0,5,'','-','','',0,'','','','','','','',0,0,0,0,0,0,0,0,0,1,0,'',0,0,'11111111111111111111111111111111','',0,0,0,0,0,0,0,2,0,0,0,NULL,'ISO-646',0,0,'  1',0,NULL)

INSERT INTO mfcvr VALUES ('101  0  ',10,'1  ','0  ','XML 1.0','.',0,0,'','-','<','<?xml version="1.0"',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,1,0,0,'',0,0,'11111111111111111111111111111111','',1,0,NULL,NULL,NULL,1,0,1,1,1,0,NULL,'ISO-646',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  1  ',3,'1','1','EDIFACT UNOA 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOA?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOA',1,1,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',0,0,0,0,0,1,0,0,0,0,1,NULL,'UNOA',0,0,'  0',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  14 ',3,'1  ','14 ','KEDIFACT KECA 1','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',1,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',1,0,NULL,NULL,NULL,1,0,0,0,0,1,NULL,'ISO-IR-149',0,0,'001',0,'')

INSERT INTO mfcvr VALUES ('3 1  2  ',3,'1','2','EDIFACT UNOB 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOB?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,29,31,63,28,31,1,1,1,0,0,'UNOB',1,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',0,0,0,0,0,1,0,0,0,0,1,NULL,'UNOB',0,0,'  0',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  3  ',3,'1  ','3  ','EDIFACT UNOC 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOC?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOC',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOC',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  4  ',3,'1  ','4  ','EDIFACT UNOD 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOD?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOD',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOD',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  5  ',3,'1  ','5  ','EDIFACT UNOE 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOE?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOE',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOE',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  6  ',3,'1  ','6  ','EDIFACT UNOF 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOF?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOF',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOF',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 1  7  ',3,'1  ','7  ','EDIFACT UNOG 1','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOG?1',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOG',1,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOG',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  1  ',3,'2','1','EDIFACT UNOA 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOA?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOA',2,1,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',0,0,0,0,0,1,0,0,0,0,1,NULL,'UNOA',0,0,'  0',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  14 ',3,'2  ','14 ','KEDIFACT KECA 2','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',2,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',1,0,NULL,NULL,NULL,1,0,0,0,0,1,NULL,'ISO-IR-149',0,0,'001',0,'')

INSERT INTO mfcvr VALUES ('3 2  2  ',3,'2','2','EDIFACT UNOB 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOB?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,29,31,63,28,31,1,1,1,0,0,'UNOB',2,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',0,0,0,0,0,1,0,0,0,0,1,NULL,'UNOB',0,0,'  0',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  3  ',3,'2  ','3  ','EDIFACT UNOC 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOC?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOC',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOC',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  4  ',3,'2  ','4  ','EDIFACT UNOD 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOD?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOD',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOD',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  5  ',3,'2  ','5  ','EDIFACT UNOE 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOE?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOE',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOE',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  6  ',3,'2  ','6  ','EDIFACT UNOF 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOF?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOF',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOF',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 2  7  ',3,'2  ','7  ','EDIFACT UNOG 2','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOG?2',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOG',2,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOG',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  1  ',3,'3','1','EDIFACT UNOA 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOA?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOA',3,1,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',0,0,0,0,0,1,0,0,0,0,1,NULL,'UNOA',0,0,'  0',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  14 ',3,'3  ','14 ','KEDIFACT KECA 3','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',3,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',1,0,NULL,NULL,NULL,1,0,0,0,0,1,NULL,'ISO-IR-149',0,0,'001',0,'')

INSERT INTO mfcvr VALUES ('3 3  2  ',3,'3','2','EDIFACT UNOB 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOB?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,29,31,63,28,31,1,1,1,0,0,'UNOB',3,0,'11001111111111111111100000000000','  **                 *(/)*-"(-)-',0,0,0,0,0,1,0,0,0,0,1,NULL,'UNOB',0,0,'  0',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  3  ',3,'3  ','3  ','EDIFACT UNOC 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOC?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOC',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOC',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  4  ',3,'3  ','4  ','EDIFACT UNOD 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOD?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOD',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOD',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  5  ',3,'3  ','5  ','EDIFACT UNOE 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOE?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOE',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOE',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  6  ',3,'3  ','6  ','EDIFACT UNOF 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOF?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOF',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOF',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 3  7  ',3,'3  ','7  ','EDIFACT UNOG 3','.',0,3,'','-','(0)UNA','(0-20)UNB?UNOG?3',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'UNOG',3,0,'11111111111111111111111111111111','',1,0,0,0,0,1,0,0,0,0,1,NULL,'UNOG',0,0,'000',0,NULL)

INSERT INTO mfcvr VALUES ('3 4  14 ',3,'4  ','14 ','KEDIFACT KECA 4','.',0,3,'','-','(0)UNA','(0-20)UNB?KECA?4',0,'UNB','UNZ','UNG','UNE','UNH','UNT','',1,58,43,63,39,43,1,1,1,0,0,'KECA',4,0,'11111111111111111111100000000000','                     *(/)*-"(-)-',1,0,0,0,0,1,0,0,0,0,1,NULL,'ISO-IR-149',0,0,'000',0,'')

INSERT INTO mfcvr VALUES ('5 00204 ',5,'002','04 ','X12-2040','.',0,3,'','-','(0)ISA','(84)00204',0,'ISA','IEA','GS','GE','ST','SE','',1,58,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111101111111111111111','         ?     ?        ',1,0,NULL,NULL,NULL,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00301 ',5,'003','01 ','X12-3010','.',0,3,'','-','(0)ISA','(84)00301',0,'ISA','IEA','GS','GE','ST','SE','',1,58,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111101111111111111111','         ?     ?        ',1,0,NULL,NULL,NULL,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00302 ',5,'003','02 ','X12-3020','.',0,3,'','-','(0)ISA','(84)00302',0,'ISA','IEA','GS','GE','ST','SE','',1,58,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111101111111111111111','         ?     ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00303 ',5,'003','03 ','X12-3030','.',0,3,'','-','(0)ISA','(84)00303',0,'ISA','IEA','GS','GE','ST','SE','',1,58,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111101111111111111111','         ?     ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00304 ',5,'003','04 ','X12-3040','.',0,3,'','-','(0)ISA','(84)00304',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00305 ',5,'003','05 ','X12-3050','.',0,3,'','-','(0)ISA','(84)00305',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00306 ',5,'003','06','X12-3060','.',0,3,'','-','(0)ISA','(84)00306',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?         ',1,0,NULL,NULL,NULL,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00307 ',5,'003','07 ','X12-3070','.',0,3,'','-','(0)ISA','(84)00307',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00400 ',5,'004','00 ','X12-4000','.',0,3,'','-','(0)ISA','(84)00400',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00401 ',5,'004','01','X12-4010','.',0,3,'','-','(0)ISA','(84)00401',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?          ',1,0,NULL,NULL,NULL,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00402 ',5,'004','02 ','X12-4020','.',0,3,'','-','(0)ISA','(84)00402',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00403 ',5,'004','03 ','X12-4030','.',0,3,'','-','(0)ISA','(84)00403',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00404 ',5,'004','04 ','X12-4040','.',0,3,'','-','(0)ISA','(84)00404',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)

INSERT INTO mfcvr VALUES ('5 00405 ',5,'004','05 ','X12-4050','.',0,3,'','-','(0)ISA','(84)00405',0,'ISA','IEA','GS','GE','ST','SE','',1,62,42,0,13,42,1,1,1,0,0,'',0,1,'11111111101111111110111111111111','         ?         ?',0,0,0,0,0,1,1,0,0,1,1,NULL,'ISO-646',0,0,'00',0,NULL)


GO

INSERT INTO msgfmt VALUES (1,'INHOUSE',NULL,NULL,NULL,NULL,NULL)

INSERT INTO msgfmt VALUES (3,'EDIFACT',2,1,1,1,1)

INSERT INTO msgfmt VALUES (5,'ASC X12',2,1,1,1,1)

INSERT INTO msgfmt VALUES (10,'XML',NULL,NULL,NULL,NULL,NULL)


GO

INSERT INTO msgs1 VALUES (1,'ESPSTA2  SP4DEFAULT','ESPSTA','2  ','SP4','Covast status report','','.','',0,0,'ESO','ESI',0,2,NULL,NULL,'','',0,0,1,NULL,0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'Status report generated by Covast',0,'','','00         0','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (3,'CONTRL4  1  DEFAULT          UN','CONTRL','4  ','1  ','Syntax and service report message','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'UN','      ',0,0,1,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         00','','DEFAULT',NULL,'                                   ',NULL)

INSERT INTO msgs1 VALUES (3,'CONTRLD  3  DEFAULT          UN','CONTRL','D  ','3  ','Syntax and service report message','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'UN','      ',0,0,1,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         00','','DEFAULT',NULL,'                                   ',NULL)

INSERT INTO msgs1 VALUES (3,'SYNTAX1     DEFAULT','SYNTAX','1  ','   ','Service Segments EDIFACT version 1','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'  ','      ',0,0,0,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'                                   ',NULL)

INSERT INTO msgs1 VALUES (3,'SYNTAX2     DEFAULT','SYNTAX','2  ','   ','Service Segments EDIFACT version 2','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'  ','      ',0,0,0,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'                                   ',NULL)

INSERT INTO msgs1 VALUES (3,'SYNTAX3     DEFAULT','SYNTAX','3  ','   ','Service Segments EDIFACT version 3','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'  ','      ',0,0,0,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'                                   ',NULL)

INSERT INTO msgs1 VALUES (3,'SYNTAX4     DEFAULT','SYNTAX','4  ','   ','Service Segments EDIFACT version 4','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'  ','      ',0,0,0,'',0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'                                   ',NULL)

INSERT INTO msgs1 VALUES (5,'997   002040DEFAULT          X','997','002','040','Functional Acknowledgment','FA','.','',0,0,NULL,NULL,0,0,NULL,NULL,'X','',240,0,1,NULL,0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         0','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'997   003010DEFAULT          X','997','003','010','Functional Acknowledgment','FA','.','',0,0,NULL,NULL,0,0,NULL,NULL,'X','',240,0,1,NULL,0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         0','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'997   003060DEFAULT          X','997','003','060','Functional Acknowledgment','FA','.','',0,0,NULL,NULL,0,0,NULL,NULL,'X','',240,0,1,NULL,0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         0','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'997   004010DEFAULT          X','997','004','010','Functional Acknowledgment','FA','.','',0,0,NULL,NULL,0,0,NULL,NULL,'X','',240,0,1,NULL,0,'','',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html',NULL,NULL,NULL,'',0,'','','00         00','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00204 DEFAULT','SYNTAX','002','04 ','Service Segments X.12 release 2040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,NULL,0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00301 DEFAULT','SYNTAX','003','01 ','Service Segments X.12 release 3010','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,NULL,0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00302 DEFAULT','SYNTAX','003','02 ','Service Segments X.12 release 3020','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00303 DEFAULT','SYNTAX','003','03 ','Service Segments X.12 release 3030','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         000','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00304 DEFAULT','SYNTAX','003','04 ','Service Segments X.12 release 3040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00305 DEFAULT','SYNTAX','003','05 ','Service Segments X.12 release 3050','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00306 DEFAULT','SYNTAX','003','06 ','Service Segments X.12 release 3060','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,NULL,0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00307 DEFAULT','SYNTAX','003','07 ','Service Segments X.12 release 3070','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00400 DEFAULT','SYNTAX','004','00 ','Service Segments X.12 release 4010','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00401 DEFAULT','SYNTAX','004','01 ','Service Segments X.12 release 4010','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,NULL,0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,NULL,NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00402 DEFAULT','SYNTAX','004','02 ','Service Segments X.12 release 4020','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00403 DEFAULT','SYNTAX','004','03 ','Service Segments X.12 release 4030','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00404 DEFAULT','SYNTAX','004','04 ','Service Segments X.12 release 4040','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs1 VALUES (5,'SYNTAX00405 DEFAULT','SYNTAX','004','05 ','Service Segments X.12 release 4050','','.','',0,0,NULL,NULL,0,2,NULL,NULL,'','',0,0,0,'',0,'','-',0,NULL,NULL,0,NULL,NULL,'[serverhome]\web\template\viewedi.html','[serverhome]\web\template\editedi.html',NULL,NULL,'This message is used by Covast for generating and checking Service segments',0,'','','00         0','','DEFAULT',NULL,'',NULL)

INSERT INTO msgs2 VALUES (1,'ESPSTA2  SP4DEFAULT',1,'2  SP4STATUS REPORT HEADER',1,0,1,NULL,NULL,NULL,1,NULL,'Contains the header information concerning this status report',0,NULL,'')

INSERT INTO msgs2 VALUES (1,'ESPSTA2  SP4DEFAULT',2,'2  SP4STATUS REPORT MESSAGE DETAILS',1,1,0,NULL,NULL,NULL,2,NULL,'Contains status details concerning one message',0,NULL,'')

INSERT INTO msgs2 VALUES (1,'ESPSTA2  SP4DEFAULT',3,'2  SP4STATUS REPORT ERROR DETAILS',0,2,0,NULL,NULL,NULL,3,NULL,'Contains error details belonging to one message',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,'4  1  Interchange response',1,1,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,'4  1  Message response',0,2,0,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',3,'4  1  Segment error indication',0,3,999,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,'4  1  Data element error indication',0,4,99,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,'4  1  Functional group response',0,2,0,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,'4  1  Message response',0,3,0,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',7,'4  1  Segment error indication',0,4,999,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,'4  1  Data element error indication',0,5,99,NULL,NULL,NULL,8,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,'D  3  Interchange response',1,1,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,'D  3  Message response',0,2,0,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',3,'D  3  Segment error indication',0,3,999,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',4,'D  3  Data element error indication',0,4,99,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,'D  3  Functional group response',0,2,0,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,'D  3  Message response',0,3,0,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',7,'D  3  Segment error indication',0,4,999,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'CONTRLD  3  DEFAULT          UN',8,'D  3  Data element error indication',0,5,99,NULL,NULL,NULL,8,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX1     DEFAULT',1,'1     INTERCHANGE HEADER',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX1     DEFAULT',2,'1     MESSAGE HEADER',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX1     DEFAULT',3,'1     MESSAGE TRAILER',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX1     DEFAULT',4,'1     INTERCHANGE TRAILER',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX1     DEFAULT',5,'1     FUNCTIONAL GROUP HEADER',0,0,1,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX1     DEFAULT',6,'1     FUNCTIONAL GROUP TRAILER',0,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX2     DEFAULT',1,'2     INTERCHANGE HEADER',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX2     DEFAULT',2,'2     MESSAGE HEADER',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX2     DEFAULT',3,'2     MESSAGE TRAILER',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX2     DEFAULT',4,'2     INTERCHANGE TRAILER',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX2     DEFAULT',5,'2     FUNCTIONAL GROUP HEADER',0,0,1,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX2     DEFAULT',6,'2     FUNCTIONAL GROUP TRAILER',0,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX3     DEFAULT',1,'3     INTERCHANGE HEADER',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX3     DEFAULT',2,'3     MESSAGE HEADER',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX3     DEFAULT',3,'3     MESSAGE TRAILER',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX3     DEFAULT',4,'3     INTERCHANGE TRAILER',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX3     DEFAULT',5,'3     FUNCTIONAL GROUP HEADER',0,0,1,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX3     DEFAULT',6,'3     FUNCTIONAL GROUP TRAILER',0,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',1,'4     INTERCHANGE HEADER',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',2,'4     MESSAGE HEADER',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',3,'4     MESSAGE TRAILER',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',4,'4     INTERCHANGE TRAILER',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',5,'4     GROUP HEADER',0,0,1,NULL,NULL,NULL,2,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (3,'SYNTAX4     DEFAULT',6,'4     GROUP TRAILER',0,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   002040DEFAULT          X',1,'002040Functional Group Response Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   002040DEFAULT          X',2,'002040Transaction Set Response Header',0,1,0,NULL,NULL,NULL,2,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   002040DEFAULT          X',3,'002040Data Segment Note',0,2,0,NULL,NULL,NULL,3,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   002040DEFAULT          X',4,'002040Data Element Note',0,3,99,NULL,NULL,NULL,4,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   002040DEFAULT          X',5,'002040Transaction Set Response Trailer',1,2,1,NULL,NULL,NULL,5,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   002040DEFAULT          X',6,'002040Functional Group Response Trailer',1,1,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003010DEFAULT          X',1,'003010Functional Group Response Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003010DEFAULT          X',2,'003010Transaction Set Response Header',0,1,0,NULL,NULL,NULL,2,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003010DEFAULT          X',3,'003010Data Segment Note',0,2,0,NULL,NULL,NULL,3,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003010DEFAULT          X',4,'003010Data Element Note',0,3,99,NULL,NULL,NULL,4,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003010DEFAULT          X',5,'003010Transaction Set Response Trailer',1,2,1,NULL,NULL,NULL,5,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003010DEFAULT          X',6,'003010Functional Group Response Trailer',1,1,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003060DEFAULT          X',1,'003060Functional Group Response Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003060DEFAULT          X',2,'003060Transaction Set Response Header',0,1,0,NULL,NULL,NULL,2,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003060DEFAULT          X',3,'003060Data Segment Note',0,2,0,NULL,NULL,NULL,3,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003060DEFAULT          X',4,'003060Data Element Note',0,3,99,NULL,NULL,NULL,4,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003060DEFAULT          X',5,'003060Transaction Set Response Trailer',1,2,1,NULL,NULL,NULL,5,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   003060DEFAULT          X',6,'003060Functional Group Response Trailer',1,1,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   004010DEFAULT          X',1,'004010Functional Group Response Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   004010DEFAULT          X',2,'004010Transaction Set Response Header',0,1,0,NULL,NULL,NULL,2,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   004010DEFAULT          X',3,'004010Data Segment Note',0,2,0,NULL,NULL,NULL,3,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   004010DEFAULT          X',4,'004010Data Element Note',0,3,99,NULL,NULL,NULL,4,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   004010DEFAULT          X',5,'004010Transaction Set Response Trailer',1,2,1,NULL,NULL,NULL,5,NULL,'',1,NULL,'')

INSERT INTO msgs2 VALUES (5,'997   004010DEFAULT          X',6,'004010Functional Group Response Trailer',1,1,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',1,'00204 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',2,'00204 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',3,'00204 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',4,'00204 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',5,'00204 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',6,'00204 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00204 DEFAULT',7,'00204 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',1,'00301 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',2,'00301 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',3,'00301 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',4,'00301 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',5,'00301 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',6,'00301 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00301 DEFAULT',7,'00301 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',1,'003020Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',2,'003020Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',3,'003020Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',4,'003020Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',5,'003020Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',6,'003020Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00302 DEFAULT',7,'00302 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',1,'00303 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',2,'00303 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',3,'00303 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',4,'00303 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',5,'00303 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',6,'00303 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00303 DEFAULT',7,'00303 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',1,'00304 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',2,'00304 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',3,'00304 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',4,'00304 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',5,'00304 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',6,'00304 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00304 DEFAULT',7,'00304 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',1,'00305 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',2,'00305 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',3,'00305 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',4,'00305 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',5,'00305 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',6,'00305 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00305 DEFAULT',7,'00305 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',1,'00306 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',2,'00306 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',3,'00306 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',4,'00306 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',5,'00306 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',6,'00306 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00306 DEFAULT',7,'00306 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',1,'00307 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',2,'00307 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',3,'00307 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',4,'00307 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',5,'00307 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',6,'00307 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00307 DEFAULT',7,'00307 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',1,'00400 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',2,'00400 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',3,'00400 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',4,'00400 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',5,'00400 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',6,'00400 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00400 DEFAULT',7,'00400 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',1,'00401 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',2,'00401 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',3,'00401 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',4,'00401 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',5,'00401 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',6,'00401 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00401 DEFAULT',7,'00401 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',1,'00402 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',2,'00402 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',3,'00402 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',4,'00402 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',5,'00402 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',6,'00402 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00402 DEFAULT',7,'00402 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',1,'00403 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',2,'00403 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',3,'00403 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',4,'00403 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',5,'00403 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',6,'00403 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00403 DEFAULT',7,'00403 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',1,'00404 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',2,'00404 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',3,'00404 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',4,'00404 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',5,'00404 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',6,'00404 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00404 DEFAULT',7,'00404 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',1,'00405 Interchange Control Header',1,0,1,NULL,NULL,NULL,1,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',2,'00405 Functional Group Header',1,0,1,NULL,NULL,NULL,3,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',3,'00405 Transaction Set Header',1,0,1,NULL,NULL,NULL,4,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',4,'00405 Transaction Set Trailer',1,0,1,NULL,NULL,NULL,5,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',5,'00405 Functional Group Trailer',1,0,1,NULL,NULL,NULL,6,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',6,'00405 Interchange Control Trailer',1,0,1,NULL,NULL,NULL,7,NULL,'',0,NULL,'')

INSERT INTO msgs2 VALUES (5,'SYNTAX00405 DEFAULT',7,'00405 TA1 Interchange Acknowledgement',0,0,0,NULL,NULL,NULL,2,NULL,'Tech ack TA1',0,NULL,'')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',1,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,17,0,0,9,'54',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',2,20,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,1,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (1,'ESPSTA2  SP4DEFAULT',3,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,3,0,0,4,'7',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,4,0,0,4,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,5,1,1,4,'3',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,6,0,0,4,'4',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,7,0,0,4,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,8,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,11,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,13,1,0,4,'6',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',1,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,3,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,4,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,5,0,1,3,'UN',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,7,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,10,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',2,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',3,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',3,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',4,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,2,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,3,0,0,12,'7',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,4,1,1,12,'3',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,5,0,0,12,'4',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,6,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,9,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,3,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,4,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,5,0,1,3,'UN',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,7,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,10,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,14,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,18,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',6,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',7,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',7,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRL4  1  DEFAULT          UN',8,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,2,1,1,4,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,3,0,0,4,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,4,0,0,4,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,5,1,1,4,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,6,0,0,4,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,7,0,0,4,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,8,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,11,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',1,12,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,3,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,4,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,5,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,7,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,10,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',2,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',3,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',3,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',4,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',4,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',4,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,2,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,3,0,0,12,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,4,1,1,12,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,5,0,0,12,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,6,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,9,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',5,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,3,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,4,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,5,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,7,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,10,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',6,11,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',7,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',7,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',8,1,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',8,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'CONTRLD  3  DEFAULT          UN',8,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,1,1,1,2,'1',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,2,1,1,2,'2',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,3,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,4,1,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,5,1,0,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,6,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,7,1,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,8,1,0,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,11,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,12,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,13,0,0,2,'13',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,14,0,0,2,'14',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,15,0,0,2,'15',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,16,0,0,2,'16',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,17,0,0,2,'17',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',1,18,0,0,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,1,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,2,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,3,1,0,2,'21',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,4,1,0,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,5,1,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,6,1,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,7,0,0,2,'25',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,8,0,1,2,'26',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',2,9,0,0,2,'27',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',3,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',3,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',4,1,1,1,7,'28',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',4,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,1,1,0,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,2,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,3,0,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,4,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,5,0,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,6,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,7,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,8,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,9,0,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,10,1,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,11,0,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,12,0,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',6,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX1     DEFAULT',6,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,1,1,1,2,'1',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,2,1,1,2,'2',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,3,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,4,1,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,5,1,0,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,6,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,7,1,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,8,1,0,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,11,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,12,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,13,0,0,2,'13',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,14,0,0,2,'14',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,15,0,0,2,'15',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,16,0,0,2,'16',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,17,0,0,2,'17',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',1,18,0,0,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,1,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,2,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,3,1,0,2,'21',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,4,1,0,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,5,1,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,6,1,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,7,0,0,2,'25',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,8,0,1,2,'26',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',2,9,0,0,2,'27',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',3,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',3,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',4,1,1,1,7,'28',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',4,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,2,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,3,0,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,4,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,5,0,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,6,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,7,0,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,8,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,9,0,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,10,1,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,11,0,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,12,0,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',6,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX2     DEFAULT',6,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,1,1,1,2,'1',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,2,1,1,2,'2',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,3,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,4,1,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,5,1,0,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,6,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,7,1,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,8,1,0,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,11,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,12,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,13,0,0,2,'13',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,14,0,0,2,'14',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,15,0,0,2,'15',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,16,0,0,2,'16',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,17,0,0,2,'17',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',1,18,0,0,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,1,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,2,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,3,1,0,2,'21',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,4,1,0,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,5,1,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,6,1,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,7,0,0,2,'25',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,8,0,1,2,'26',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',2,9,0,0,2,'27',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',3,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',3,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',4,1,1,1,7,'28',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',4,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,2,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,3,0,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,4,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,5,0,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,6,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,7,0,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,8,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,9,0,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,10,1,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,11,0,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,12,0,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',6,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX3     DEFAULT',6,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,1,1,1,2,'1',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,2,1,1,2,'2',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,3,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,4,1,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,6,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,7,1,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,11,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,14,0,0,2,'14',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,15,0,0,2,'15',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,16,0,0,2,'16',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,18,0,0,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,20,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,22,0,0,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,23,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,24,0,0,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,25,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,26,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,27,0,0,2,'13',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,28,0,0,2,'17',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',1,29,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,1,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,2,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,3,1,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,4,1,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,6,1,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,7,0,0,2,'25',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,8,0,1,2,'26',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,9,0,0,2,'27',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,11,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,12,1,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,13,1,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,14,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,15,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,16,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,17,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,18,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,19,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,20,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,21,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,23,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,24,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,25,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',2,26,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',3,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',3,3,1,0,7,'29',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',4,1,1,1,7,'28',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',4,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,3,0,0,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,5,0,0,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,6,0,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,7,0,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,10,0,1,2,'21',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,11,0,1,2,'22',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,12,0,0,2,'24',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,13,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,14,0,0,2,'20',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,15,0,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,16,0,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,17,1,0,2,'56',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',5,18,0,0,2,'23',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',6,3,1,0,7,'57',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (3,'SYNTAX4     DEFAULT',6,4,1,0,7,'56',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',1,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',1,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',2,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',3,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',4,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',4,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',4,3,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',4,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',5,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',5,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',5,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',5,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',5,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',5,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,3,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,4,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   002040DEFAULT          X',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',1,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',1,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',2,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',3,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',4,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',4,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',4,3,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',4,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',5,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',5,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',5,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',5,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',5,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',5,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,3,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,4,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003010DEFAULT          X',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',1,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',1,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',2,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',3,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',3,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',3,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',4,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',4,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',4,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',4,4,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',4,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',5,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',5,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',5,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',5,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',5,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',5,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,3,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,4,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   003060DEFAULT          X',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',1,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',1,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',2,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',2,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',3,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',3,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',3,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',4,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',4,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',4,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',4,4,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',4,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',5,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',5,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',5,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',5,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',5,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',5,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,1,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,2,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,3,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,4,1,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,5,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,6,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,7,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,8,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'997   004010DEFAULT          X',6,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,11,1,1,2,'220',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,12,1,1,2,'221',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',2,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00204 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,11,1,1,2,'220',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,12,1,1,2,'221',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',2,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00301 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,2,0,1,0,'',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,4,0,1,2,'12',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,12,1,1,3,'00302',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',1,16,1,1,2,'81',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,4,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,5,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',4,1,1,1,2,'29',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',4,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',5,1,1,1,2,'57',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',5,2,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',6,1,1,1,2,'60',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',6,2,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,1,1,0,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,2,1,0,2,'210',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,3,1,0,2,'9',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,4,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00302 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,12,1,1,1,'00303',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,9,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',2,10,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00303 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,12,1,1,1,'00304',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00304 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,12,1,1,1,'00305',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00305 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,11,1,1,2,'220',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,12,1,1,2,'221',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00306 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,12,1,1,1,'00307',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00307 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,12,1,1,1,'00400',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,7,1,0,2,'207',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00400 DEFAULT',7,8,1,0,2,'208',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,11,1,1,2,'220',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,12,1,1,2,'221',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',7,7,1,0,2,'207',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00401 DEFAULT',7,8,1,0,2,'208',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,12,1,1,1,'00402',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00402 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,12,1,1,1,'00403',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00403 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,12,1,1,1,'00404',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',3,3,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00404 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,1,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,2,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,3,1,1,3,'00',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,4,0,0,0,'',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,5,1,1,2,'4',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,6,1,1,2,'3',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,7,1,1,2,'7',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,8,1,1,2,'6',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,9,1,1,2,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,10,1,1,2,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,11,1,1,3,'U',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,12,1,1,1,'00405',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,13,1,1,2,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,14,1,1,2,'209',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,15,1,1,2,'18',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',1,16,1,1,8,'81',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,1,1,1,2,'55',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,2,1,1,2,'5',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,3,1,1,2,'8',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,4,1,1,8,'9',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,5,1,1,8,'10',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,6,1,1,2,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,7,1,1,2,'23',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',2,8,1,1,2,'42',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',3,1,1,1,2,'20',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',3,2,1,1,2,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',3,3,0,0,8,'211',0,NULL,'',0,0,0,0,0,0,0,'0d',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',4,1,1,1,7,'29',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',4,2,1,1,7,'19',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',5,1,1,1,7,'57',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',5,2,1,1,7,'56',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',6,1,1,1,7,'60',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',6,2,1,1,7,'11',0,NULL,'',0,0,0,0,0,0,0,'',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,1,1,0,2,'210',0,NULL,'',0,1,1,2,1,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,2,1,0,2,'9',0,NULL,'',0,1,2,2,2,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,4,1,0,2,'207',0,NULL,'',0,1,4,2,4,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,5,1,0,2,'208',0,NULL,'',0,1,5,2,5,1,1,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs3 VALUES (5,'SYNTAX00405 DEFAULT',7,6,1,0,2,'10',0,NULL,'',0,0,0,0,0,0,0,'0',0,0,NULL,0,0,'','')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'0','sent',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'1','waiting for receipt',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'10','routed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'2','waiting for delivery',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'3','in external format',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'4','in internal format',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'5','plug-in is processing',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'6','downloaded',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'7','(down)load failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'8','communicate failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,9,'9','translate failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,16,'0','rejected',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',2,16,'1','accepted',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'001','filepath not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'002','load library failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'003','file open failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'004','account information not defined',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'005','channel not open',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'006','file close failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'007','file delete failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'008','file write failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'009','file read failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'010','failed to start program',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'011','load engine input file failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'012','not enough memory',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'013','interchange agreement not defined',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'014','empty message file',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'015','cannot determine format',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'016','internal error: buffer length',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'017','incorrect segment sequence',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'018','SYNTAX documentnot found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'019','mapping not defined in current EIF',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'020','element value <> service register',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'021','wrong version of Engine Input File',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'022','Internal error in CMC subsystem',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'023','illegal character',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'024','divide by zero',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'025','code value not defined',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'026','invalid value for testindicator',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'027','invalid value for priority',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'028','internal error: cache corrupt',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'029','value translation not defined',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'030','mandatory singular element missing',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'031','mandatory component missing',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'032','illegal date',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'033','illegal time',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'034','illegal numeric value',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'035','invalid check condition',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'036','mandatory segment missing',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'037','illegal segment',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'038','invalid source condition',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'039','unknown type of message',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'040','too many segment occurrences',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'041','sender unknown',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'042','recipient unknown',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'043','mandatory code value missing',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'044','database io error',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'045','connector not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'046','source documentdefinition not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'047','target documentdefinition not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'048','unexpected end of document',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'049','document format not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'050','seek failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'051','document contains extra characters',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'052','communication scriptname empty',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'053','network could not deliver message',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'054','invalid target condition',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'055','own electronic address not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'056','business partner address not found',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'057','empty segment not allowed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'058','entity is not defined',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'059','send error',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'060','warning: > 95% of document limit',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'061','exceeded document limit this year',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'062','element length not correct',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'063','incompatible element types',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'064','other document in interchange wrong',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'065','invalid record in engine input file',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'066','illegal value in engine input file',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'067','internal error: tree full',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'068','internal error: tree corrupt',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'069','element has been defined already',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'070','invalid session number',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'071','session is still processing',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'072','input file has no envelope',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'073','mixed content is not supported',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'074','rename file failed',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'075','illegal alpha boolean value',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'076','illegal numeric boolean value',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'077','incompatible value for these types',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'078','minimum # of occurrences not met',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'079','illegal separator',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'080','duplicate interchange received',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'081','element check condition not met',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'082','socket handling error',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'083','no combined script defined',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'084','timeout for delivery notification',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'085','timeout for receipt notification',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'086','timeout for technical ack',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'087','somebody else is already archiving',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'088','cannot find or open template',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'089','recipient did not fetch document',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'090','hashtotal incorrect',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'091','error in OFTP subsystem',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'092','error in CAPI subsystem',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'093','error in X.25 subsystem',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'094','missing end label',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'095','illegal attribute',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'096','value <> defined fixed value',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'097','end label <> start label',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'098','missing separator',0,'DEFAULT','DEFAULT',NULL,'')

INSERT INTO msgs4 VALUES (1,'ESPSTA2  SP4DEFAULT',3,2,'099','document rejected by recipient',0,'DEFAULT','DEFAULT',NULL,'')


GO

INSERT INTO msgsrv VALUES (0,'EDI Subsystem',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)

INSERT INTO msgsrv VALUES (1,'File system',NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,0,NULL,NULL,0,' ',' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)

INSERT INTO msgsrv VALUES (2,'BizTalk(R) 2004',NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,'Localhost',NULL,'Localhost',18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,11011,NULL,1,'11010',NULL,0,NULL,0,NULL,NULL,0,' ',' ',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)

INSERT INTO numbers VALUES (1,10001,NULL,'icin')

INSERT INTO numbers VALUES (2,10001,NULL,'msgin')

INSERT INTO numbers VALUES (3,10001,NULL,'msgout')

INSERT INTO numbers VALUES (4,10001,NULL,'icout')

INSERT INTO numbers VALUES (5,1,NULL,'errnr')

INSERT INTO numbers VALUES (65,10001,NULL,'grpin')

INSERT INTO numbers VALUES (66,10001,NULL,'grpout')

INSERT INTO parame VALUES ('ESP10',10001,10001,10001,10001,1,'DEFAULT','DEFAULT',0,0,20,50,1,30,0,1,'',NULL,1,1,1,1,1,1,1,1,1,convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),convert(datetime,'1998-01-01 00:00:00',120),0,0,0,0,0,0,0,0,0,9999999,9999999,9999999,9999999,9999999,9999999,9999999,9999999,9999999,1,1,1,1,1,1,1,1,1,'Custom number 1','Custom number 2','Custom number 3','Custom number 4','Custom number 5','Custom number 6','Custom number 7','Custom number 8','Custom number 9',char(66)+char(51)+char(42)+char(60)+char(245)+char(225)+char(69),10001,10001,NULL,NULL,41,21,17,24,41,31,37,19,34,17,19,0,0,0,NULL)

INSERT INTO prtnr1 VALUES ('DEFAULT','DEFAULT PARTNER','','','','',NULL,'','DF','','','','',NULL)

INSERT INTO prtnr1 VALUES ('MSDEFAULT','MESSAGING SERVICE DEFAULT',NULL,NULL,NULL,NULL,NULL,NULL,'DF',NULL,NULL,NULL,NULL,NULL)

INSERT INTO prtnr3 VALUES ('DEFAULT','DEFAULT',0,'DEFAULTIDENTIFICATION',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ZZ',NULL,NULL,0,0,0,0,0,NULL,0,NULL,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL)

INSERT INTO prtnr3 VALUES ('MSDEFAULT','MS01',0,'MS01 DEFAULT',NULL,NULL,NULL,NULL,'[documentshome]\Documents\PickupEDI',NULL,NULL,'*.*',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MS01 DEFAULT',NULL,NULL,NULL,NULL,NULL)

INSERT INTO prtnr3 VALUES ('MSDEFAULT','MS02',0,'MS02 DEFAULT',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MS02 DEFAULT',NULL,NULL,NULL,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',1,1,'2  SP4Error sequence number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',2,2,'2  SP4Error code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',3,3,'2  SP4Function name',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',4,4,'2  SP4Segment number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',5,5,'2  SP4Segment tag',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',6,7,'2  SP4Element name',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',7,6,'2  SP4Element number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',8,8,'2  SP4Element tag',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',9,9,'2  SP4Element value',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',10,10,'2  SP4Error details part 1',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',11,11,'2  SP4Error details part 2',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',12,12,'2  SP4Error details part 3',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',13,13,'2  SP4Error details part 4',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT ERROR DETAILS',14,14,'2  SP4Error details part 5',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',3,1,'2  SP4Status report generated by server',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',4,2,'2  SP4Date of status report',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',5,3,'2  SP4Time of status report',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',6,4,'2  SP4Sender partner code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',7,5,'2  SP4Sender department code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',8,6,'2  SP4Recipient partner code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT HEADER',9,7,'2  SP4Recipient department code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',2,2,'2  SP4Message number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',3,3,'2  SP4Functional group number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',4,5,'2  SP4Format code/version/release',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',5,6,'2  SP4Message type',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',6,7,'2  SP4Message version',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',7,8,'2  SP4Message release',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',8,9,'2  SP4Functional group identifier',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',9,10,'2  SP4Status code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',10,11,'2  SP4Status text',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',11,1,'2  SP4Interchange number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',12,12,'2  SP4Number of messages indicated',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',13,13,'2  SP4Number of messages received',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',14,14,'2  SP4Number of messages accepted',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',15,15,'2  SP4Number of messages rejected',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',16,16,'2  SP4Acknowledgment code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',17,4,'2  SP4Tracking and tracing key',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',18,17,'2  SP4Interchange control reference',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',19,18,'2  SP4Message reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (1,'2  SP4STATUS REPORT MESSAGE DETAILS',20,19,'2  SP4Document info field 1',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',1,1,'1     Functional group identification',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',2,2,'1     Application sender''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',3,3,'1     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',4,4,'1     Recipient''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',5,5,'1     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',6,6,'1     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',7,7,'1     Time',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',8,8,'1     Functional group reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',9,9,'1     Controlling agency',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',10,10,'1     Message version number',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',11,11,'1     Message release number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',12,12,'1     Association assigned code',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP HEADER',13,13,'1     Application password',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP TRAILER',1,1,'1     Number of messages',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     FUNCTIONAL GROUP TRAILER',2,2,'1     Functional group reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',1,1,'1     Syntax identifier',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',2,2,'1     Syntax version number',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',3,3,'1     Sender identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',4,4,'1     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',5,5,'1     Address for reverse routing',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',6,6,'1     Recipient identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',7,7,'1     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',8,8,'1     Routing address',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',9,9,'1     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',10,10,'1     Time',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',11,11,'1     INTERCHANGE CONTROL REFERENCE',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',12,12,'1     Recipient''s reference/password',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',13,13,'1     Recipient''s reference/password qual',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',14,14,'1     APPLICATION REFERENCE',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',15,15,'1     PROCESSING PRIORITY',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',16,16,'1     ACKNOWLEDGEMENT REQUEST',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',17,17,'1     COMMUNICATIONS AGREEMENT ID',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE HEADER',18,18,'1     TEST INDICATOR',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE TRAILER',1,1,'1     INTERCHANGE CONTROL COUNT',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     INTERCHANGE TRAILER',2,2,'1     INTERCHANGE CONTROL REFERENCE',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',1,1,'1     MESSAGE REFERENCE NUMBER',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',2,2,'1     Message type',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',3,3,'1     Message version number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',4,4,'1     Message release number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',5,5,'1     Controlling agency',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',6,6,'1     Association assigned code',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',7,7,'1     COMMON ACCESS REFERENCE',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',8,8,'1     Sequence of transfer',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE HEADER',9,9,'1     First and last transfer',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE TRAILER',1,1,'1     NR OF SGMNTS IN THE MSG',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'1     MESSAGE TRAILER',2,2,'1     MESSAGE REFERENCE NUMBER',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',1,1,'2     Functional group identification',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',2,2,'2     Application sender''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',3,3,'2     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',4,4,'2     Recipient''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',5,5,'2     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',6,6,'2     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',7,7,'2     Time',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',8,8,'2     Functional group reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',9,9,'2     Controlling agency',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',10,10,'2     Message version number',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',11,11,'2     Message release number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',12,12,'2     Association assigned code',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP HEADER',13,13,'2     Application password',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP TRAILER',1,1,'2     Number of messages',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     FUNCTIONAL GROUP TRAILER',2,2,'2     Functional group reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',1,1,'2     Syntax identifier',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',2,2,'2     Syntax version number',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',3,3,'2     Sender identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',4,4,'2     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',5,5,'2     Address for reverse routing',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',6,6,'2     Recipient identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',7,7,'2     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',8,8,'2     Routing address',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',9,9,'2     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',10,10,'2     Time',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',11,11,'2     INTERCHANGE CONTROL REFERENCE',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',12,12,'2     Recipient''s reference/password',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',13,13,'2     Recipient''s reference/password qual',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',14,14,'2     APPLICATION REFERENCE',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',15,15,'2     PROCESSING PRIORITY',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',16,16,'2     ACKNOWLEDGEMENT REQUEST',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',17,17,'2     COMMUNICATIONS AGREEMENT ID',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE HEADER',18,18,'2     TEST INDICATOR',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE TRAILER',1,1,'2     INTERCHANGE CONTROL COUNT',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     INTERCHANGE TRAILER',2,2,'2     INTERCHANGE CONTROL REFERENCE',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',1,1,'2     MESSAGE REFERENCE NUMBER',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',2,2,'2     Message type',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',3,3,'2     Message version number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',4,4,'2     Message release number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',5,5,'2     Controlling agency',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',6,6,'2     Association assigned code',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',7,7,'2     COMMON ACCESS REFERENCE',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',8,8,'2     Sequence of transfer',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE HEADER',9,9,'2     First and last transfer',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE TRAILER',1,1,'2     NR OF SGMNTS IN THE MSG',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'2     MESSAGE TRAILER',2,2,'2     MESSAGE REFERENCE NUMBER',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',1,1,'3     Functional group identification',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',2,2,'3     Application sender''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',3,3,'3     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',4,4,'3     Recipient''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',5,5,'3     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',6,6,'3     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',7,7,'3     Time',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',8,8,'3     Functional group reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',9,9,'3     Controlling agency',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',10,10,'3     Message version number',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',11,11,'3     Message release number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',12,12,'3     Association assigned code',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP HEADER',13,13,'3     Application password',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP TRAILER',1,1,'3     Number of messages',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     FUNCTIONAL GROUP TRAILER',2,2,'3     Functional group reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',1,1,'3     Syntax identifier',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',2,2,'3     Syntax version number',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',3,3,'3     Sender identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',4,4,'3     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',5,5,'3     Address for reverse routing',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',6,6,'3     Recipient identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',7,7,'3     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',8,8,'3     Routing address',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',9,9,'3     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',10,10,'3     Time',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',11,11,'3     INTERCHANGE CONTROL REFERENCE',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',12,12,'3     Recipient''s reference/password',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',13,13,'3     Recipient''s reference/password qual',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',14,14,'3     APPLICATION REFERENCE',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',15,15,'3     PROCESSING PRIORITY',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',16,16,'3     ACKNOWLEDGEMENT REQUEST',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',17,17,'3     COMMUNICATIONS AGREEMENT ID',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE HEADER',18,18,'3     TEST INDICATOR',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE TRAILER',1,1,'3     INTERCHANGE CONTROL COUNT',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     INTERCHANGE TRAILER',2,2,'3     INTERCHANGE CONTROL REFERENCE',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',1,1,'3     MESSAGE REFERENCE NUMBER',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',2,2,'3     Message type',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',3,3,'3     Message version number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',4,4,'3     Message release number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',5,5,'3     Controlling agency',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',6,6,'3     Association assigned code',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',7,7,'3     COMMON ACCESS REFERENCE',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',8,8,'3     Sequence of transfer',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE HEADER',9,9,'3     First and last transfer',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE TRAILER',1,1,'3     NR OF SGMNTS IN THE MSG',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'3     MESSAGE TRAILER',2,2,'3     MESSAGE REFERENCE NUMBER',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',3,3,'4     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',5,5,'4     Identification code qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',6,6,'4     Date',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',7,7,'4     Time',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',10,10,'4     Message version number',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',11,11,'4     Message release number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',12,12,'4     Association assigned code',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',13,13,'4     Application password',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',14,1,'4     Message group identification',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',15,2,'4     Application sender identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',16,4,'4     Application recipient identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',17,8,'4     Group reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP HEADER',18,9,'4     Controlling agency, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP TRAILER',3,1,'4     Group control count',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     GROUP TRAILER',4,2,'4     Group reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',1,1,'4     Syntax identifier',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',2,2,'4     Syntax version number',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',3,6,'4     Sender identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',4,7,'4     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',6,10,'4     Recipient identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',7,11,'4     Identification code qualifier',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',9,14,'4     Date',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',10,15,'4     Time',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',11,16,'4     Interchange control reference',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',14,19,'4     Application reference',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',15,20,'4     Processing priority',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',16,21,'4     Acknowledgement request',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',18,23,'4     Test indicator',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',19,3,'4     Service code list directory version number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',20,4,'4     Character encoding, coded',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',22,8,'4     Interchange sender internal identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',23,9,'4     Interchange sender internal sub-identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',24,12,'4     Interchange recipient internal identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',25,13,'4     Interchange recipient internal sub-identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',26,17,'4     Recipient reference/password',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',27,18,'4     Recipient reference/password qualifier',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',28,22,'4     Interchange agreement identifier',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE HEADER',29,5,'4     Syntax release number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE TRAILER',1,1,'4     Interchange control count',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     INTERCHANGE TRAILER',2,2,'4     Interchange control reference',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',1,1,'4     Message reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',2,2,'4     Message type',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',3,3,'4     Message version number',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',4,4,'4     Message release number',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',6,6,'4     Association assigned code',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',7,9,'4     Common access reference',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',8,10,'4     Sequence of transfer',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',9,11,'4     First and last transfer',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',11,8,'4     Message type sub-function identification',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',12,5,'4     Controlling agency, coded',2,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',13,7,'4     Code list directory version number',2,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',14,12,'4     Message subset identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',15,13,'4     Message subset version number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',16,14,'4     Message subset release number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',17,15,'4     Controlling agency, coded',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',18,16,'4     Message implementation guideline identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',19,17,'4     Message implementation guideline version number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',20,18,'4     Message implementation guideline release number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',21,19,'4     Controlling agency, coded',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',23,21,'4     Scenario version number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',24,22,'4     Scenario release number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',25,20,'4     Scenario identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE HEADER',26,23,'4     Controlling agency, coded',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE TRAILER',2,2,'4     Message reference number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4     MESSAGE TRAILER',3,1,'4     Number of segments in a message',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Data element error indication',1,1,'4  1  Syntax error, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Data element error indication',2,2,'4  1  Erroneous data element position in',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Data element error indication',3,3,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Data element error indication',4,4,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',1,1,'4  1  Functional group reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',2,2,'4  1  Sender identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',3,3,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',4,4,'4  1  Recipient''s identification',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',5,5,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',6,6,'4  1  Action, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',7,7,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',8,8,'4  1  Service segment tag, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',9,9,'4  1  Erroneous data element position in',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',10,10,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',11,11,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',12,12,'4  1  Security reference number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Functional group response',13,13,'4  1  Security segment position',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',1,1,'4  1  Interchange control reference',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',3,3,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',4,4,'4  1  Address for reverse routing',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',5,6,'4  1  Recipient identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',6,7,'4  1  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',7,8,'4  1  Routing address',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',8,10,'4  1  Action, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',9,11,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',10,12,'4  1  Service segment tag, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',11,13,'4  1  Erroneous data element position in',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',12,14,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',13,2,'4     Sender identification',1,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',14,5,'4     Interchange sender internal sub-identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',15,9,'4     Interchange recipient internal sub-identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',16,15,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',17,16,'4  1  Security reference number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Interchange response',18,17,'4  1  Security segment position',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',1,1,'4  1  Message reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',2,2,'4  1  Message type',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',3,3,'4  1  Message version number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',4,4,'4  1  Message release number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',5,5,'4  1  Controlling agency',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',6,6,'4  1  Association assigned code',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',7,9,'4  1  Action, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',8,10,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',9,11,'4  1  Service segment tag, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',10,12,'4  1  Erroneous data element position in',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',11,13,'4  1  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',12,7,'4     Code list directory version number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',13,8,'4     Message type sub-function identification',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',14,14,'4  1  Erroneous data element occurrence',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',15,15,'4  1  Package reference number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',16,16,'4  1  Reference qualifier',1,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',17,17,'4  1  Reference identification number',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',18,18,'4  1  Security reference number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Message response',19,19,'4  1  Security segment position',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Segment error indication',1,1,'4  1  Segment position in message',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'4  1  Segment error indication',2,2,'4  1  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Data element error indication',1,1,'D  3  Syntax error, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Data element error indication',2,2,'D  3  Erroneous data element position in',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Data element error indication',3,3,'D  3  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',1,1,'D  3  Functional group reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',2,2,'D  3  Sender identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',3,3,'D  3  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',4,4,'D  3  Recipient''s identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',5,5,'D  3  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',6,6,'D  3  Action, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',7,7,'D  3  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',8,8,'D  3  Service segment tag, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',9,9,'D  3  Erroneous data element position in',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Functional group response',10,10,'D  3  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',1,1,'D  3  Interchange control reference',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',2,2,'D  3  Sender identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',3,3,'D  3  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',4,4,'D  3  Address for reverse routing',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',5,5,'D  3  Recipient identification',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',6,6,'D  3  Partner identification code qualifi',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',7,7,'D  3  Routing address',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',8,8,'D  3  Action, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',9,9,'D  3  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',10,10,'D  3  Service segment tag, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',11,11,'D  3  Erroneous data element position in',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Interchange response',12,12,'D  3  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',1,1,'D  3  Message reference number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',2,2,'D  3  Message type',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',3,3,'D  3  Message version number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',4,4,'D  3  Message release number',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',5,5,'D  3  Controlling agency',2,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',6,6,'D  3  Association assigned code',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',7,7,'D  3  Action, coded',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',8,8,'D  3  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',9,9,'D  3  Service segment tag, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',10,10,'D  3  Erroneous data element position in',1,0,1,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Message response',11,11,'D  3  Erroneous component data element po',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Segment error indication',1,1,'D  3  Segment position in message',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (3,'D  3  Segment error indication',2,2,'D  3  Syntax error, coded',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',1,1,'00204 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',2,2,'00204 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',3,3,'00204 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',6,6,'00204 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',7,7,'00204 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',8,8,'00204 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',9,4,'002040Date',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Header',10,5,'002040Time',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Trailer',1,1,'00204 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Functional Group Trailer',2,2,'00204 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',1,1,'00204 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',2,2,'00204 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',3,3,'00204 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',4,4,'00204 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',5,5,'00204 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',6,6,'00204 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',7,7,'00204 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',8,8,'00204 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',9,9,'00204 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',10,10,'00204 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',11,11,'00204 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',12,12,'00204 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',13,13,'00204 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',14,14,'00204 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',15,15,'00204 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Header',16,16,'00204 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Trailer',1,1,'00204 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Interchange Control Trailer',2,2,'00204 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 TA1 Interchange Acknowledgement',1,1,'00204 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 TA1 Interchange Acknowledgement',2,2,'00204 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 TA1 Interchange Acknowledgement',4,4,'00204 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 TA1 Interchange Acknowledgement',5,5,'00204 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 TA1 Interchange Acknowledgement',6,3,'00204 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Transaction Set Header',1,1,'00204 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Transaction Set Header',2,2,'00204 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Transaction Set Trailer',1,1,'00204 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00204 Transaction Set Trailer',2,2,'00204 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Element Note',1,1,'002040Element Position in Segment',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Element Note',2,2,'002040Data Element Reference Number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Element Note',3,3,'002040Data Element Syntax Error Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Element Note',4,4,'002040Copy of Bad Data Element',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',1,1,'002040Segment ID Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',2,2,'002040Segment Position in Transaction Set',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',3,3,'002040Loop Identifier Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',4,4,'002040Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',5,5,'002040Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',6,6,'002040Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',7,7,'002040Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Data Segment Note',8,8,'002040Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Header',1,1,'002040Functional Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Header',2,2,'002040Group Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',1,1,'002040Functional Group Acknowledge Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',2,2,'002040Number of Transaction Sets Included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',3,3,'002040Number of Received Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',4,4,'002040Number of Accepted Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',5,5,'002040Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',6,6,'002040Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',7,7,'002040Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',8,8,'002040Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Functional Group Response Trailer',9,9,'002040Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Header',1,1,'002040Transaction Set Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Header',2,2,'002040Transaction Set Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Trailer',1,1,'002040Transaction Set Acknowledgment Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Trailer',2,2,'002040Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Trailer',3,3,'002040Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Trailer',4,4,'002040Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Trailer',5,5,'002040Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'002040Transaction Set Response Trailer',6,6,'002040Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',1,1,'00301 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',2,2,'00301 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',3,3,'00301 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',6,6,'00301 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',7,7,'00301 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',8,8,'00301 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',9,4,'003010Date',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Header',10,5,'003010Time',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Trailer',1,1,'00301 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Functional Group Trailer',2,2,'00301 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',1,1,'00301 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',2,2,'00301 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',3,3,'00301 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',4,4,'00301 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',5,5,'00301 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',6,6,'00301 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',7,7,'00301 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',8,8,'00301 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',9,9,'00301 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',10,10,'00301 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',11,11,'00301 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',12,12,'00301 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',13,13,'00301 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',14,14,'00301 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',15,15,'00301 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Header',16,16,'00301 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Trailer',1,1,'00301 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Interchange Control Trailer',2,2,'00301 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 TA1 Interchange Acknowledgement',1,1,'00301 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 TA1 Interchange Acknowledgement',2,2,'00301 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 TA1 Interchange Acknowledgement',4,4,'00301 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 TA1 Interchange Acknowledgement',5,5,'00301 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 TA1 Interchange Acknowledgement',6,3,'00301 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Transaction Set Header',1,1,'00301 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Transaction Set Header',2,2,'00301 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Transaction Set Trailer',1,1,'00301 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00301 Transaction Set Trailer',2,2,'00301 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Element Note',1,1,'003010Element Position in Segment',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Element Note',2,2,'003010Data Element Reference Number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Element Note',3,3,'003010Data Element Syntax Error Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Element Note',4,4,'003010Copy of Bad Data Element',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',1,1,'003010Segment ID Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',2,2,'003010Segment Position in Transaction Set',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',3,3,'003010Loop Identifier Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',4,4,'003010Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',5,5,'003010Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',6,6,'003010Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',7,7,'003010Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Data Segment Note',8,8,'003010Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Header',1,1,'003010Functional Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Header',2,2,'003010Group Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',1,1,'003010Functional Group Acknowledge Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',2,2,'003010Number of Transaction Sets Included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',3,3,'003010Number of Received Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',4,4,'003010Number of Accepted Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',5,5,'003010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',6,6,'003010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',7,7,'003010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',8,8,'003010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Functional Group Response Trailer',9,9,'003010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Header',1,1,'003010Transaction Set Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Header',2,2,'003010Transaction Set Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Trailer',1,1,'003010Transaction Set Acknowledgment Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Trailer',2,2,'003010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Trailer',3,3,'003010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Trailer',4,4,'003010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Trailer',5,5,'003010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003010Transaction Set Response Trailer',6,6,'003010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',1,4,'00302 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',2,1,'003020Interchange Control Number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',3,2,'003020Interchange Date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',4,3,'003020Interchange Time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00302 TA1 Interchange Acknowledgement',5,5,'00302 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',1,1,'003020Functional Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',2,2,'003020Application Sender`s Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',3,3,'003020Application Receiver`s Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',4,4,'003020Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',5,5,'003020Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',6,6,'003020Group Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',7,7,'003020Responsible Agency Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Header',8,8,'003020Version / Release / Industry Identi',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Trailer',1,1,'003020Number of Transaction Sets Included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Functional Group Trailer',2,2,'003020Group Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',1,1,'003020Authorization Information Qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',2,2,'003020Authorization Information',0,0,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',3,3,'003020Security Information Qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',4,4,'003020Security Information',0,0,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',5,5,'003020Interchange ID Qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',6,6,'003020Interchange Sender ID',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',7,7,'003020Interchange ID Qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',8,8,'003020Interchange Receiver ID',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',9,9,'003020Interchange Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',10,10,'003020Interchange Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',11,11,'003020Interchange Control Standards Ident',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',12,12,'003020Interchange Control Version Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',13,13,'003020Interchange Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',14,14,'003020Acknowledgment Requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',15,15,'003020Test Indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Header',16,16,'003020Subelement Separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Trailer',1,1,'003020Number of Included Functional Group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Interchange Control Trailer',2,2,'003020Interchange Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Transaction Set Header',1,1,'003020Transaction Set Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Transaction Set Header',2,2,'003020Transaction Set Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Transaction Set Trailer',1,1,'003020Number of Included Segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003020Transaction Set Trailer',2,2,'003020Transaction Set Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',1,1,'00303 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',2,2,'00303 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',3,3,'00303 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',6,6,'00303 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',7,7,'00303 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',8,8,'00303 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',9,4,'003030Date',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Header',10,5,'003030Time',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Trailer',1,1,'00303 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Functional Group Trailer',2,2,'00303 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',1,1,'00303 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',2,2,'00303 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',3,3,'00303 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',4,4,'00303 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',5,5,'00303 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',6,6,'00303 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',7,7,'00303 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',8,8,'00303 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',9,9,'00303 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',10,10,'00303 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',11,11,'00303 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',12,12,'00303 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',13,13,'00303 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',14,14,'00303 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',15,15,'00303 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Header',16,16,'00303 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Trailer',1,1,'00303 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Interchange Control Trailer',2,2,'00303 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',1,1,'00303 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',2,2,'00303 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',4,4,'00303 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',5,5,'00303 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 TA1 Interchange Acknowledgement',6,3,'00303 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Transaction Set Header',1,1,'00303 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Transaction Set Header',2,2,'00303 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Transaction Set Trailer',1,1,'00303 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00303 Transaction Set Trailer',2,2,'00303 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',1,1,'00304 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',2,2,'00304 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',3,3,'00304 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',4,4,'00304 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',5,5,'00304 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',6,6,'00304 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',7,7,'00304 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Header',8,8,'00304 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Trailer',1,1,'00304 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Functional Group Trailer',2,2,'00304 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',1,1,'00304 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',2,2,'00304 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',3,3,'00304 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',4,4,'00304 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',5,5,'00304 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',6,6,'00304 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',7,7,'00304 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',8,8,'00304 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',9,9,'00304 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',10,10,'00304 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',11,11,'00304 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',12,12,'00304 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',13,13,'00304 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',14,14,'00304 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',15,15,'00304 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Header',16,16,'00304 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Trailer',1,1,'00304 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Interchange Control Trailer',2,2,'00304 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',1,1,'00304 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',2,2,'00304 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',4,4,'00304 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',5,5,'00304 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 TA1 Interchange Acknowledgement',6,3,'00304 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Transaction Set Header',1,1,'00304 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Transaction Set Header',2,2,'00304 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Transaction Set Trailer',1,1,'00304 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00304 Transaction Set Trailer',2,2,'00304 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',1,1,'00305 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',2,2,'00305 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',3,3,'00305 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',4,4,'00305 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',5,5,'00305 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',6,6,'00305 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',7,7,'00305 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Header',8,8,'00305 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Trailer',1,1,'00305 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Functional Group Trailer',2,2,'00305 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',1,1,'00305 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',2,2,'00305 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',3,3,'00305 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',4,4,'00305 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',5,5,'00305 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',6,6,'00305 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',7,7,'00305 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',8,8,'00305 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',9,9,'00305 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',10,10,'00305 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',11,11,'00305 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',12,12,'00305 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',13,13,'00305 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',14,14,'00305 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',15,15,'00305 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Header',16,16,'00305 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Trailer',1,1,'00305 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Interchange Control Trailer',2,2,'00305 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',1,1,'00305 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',2,2,'00305 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',4,4,'00305 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',5,5,'00305 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 TA1 Interchange Acknowledgement',6,3,'00305 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Transaction Set Header',1,1,'00305 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Transaction Set Header',2,2,'00305 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Transaction Set Trailer',1,1,'00305 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00305 Transaction Set Trailer',2,2,'00305 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',1,1,'00306 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',2,2,'00306 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',3,3,'00306 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',4,4,'00306 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',5,5,'00306 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',6,6,'00306 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',7,7,'00306 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Header',8,8,'00306 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Trailer',1,1,'00306 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Functional Group Trailer',2,2,'00306 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',1,1,'00306 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',2,2,'00306 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',3,3,'00306 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',4,4,'00306 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',5,5,'00306 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',6,6,'00306 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',7,7,'00306 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',8,8,'00306 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',9,9,'00306 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',10,10,'00306 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',11,11,'00306 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',12,12,'00306 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',13,13,'00306 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',14,14,'00306 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',15,15,'00306 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Header',16,16,'00306 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Trailer',1,1,'00306 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Interchange Control Trailer',2,2,'00306 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 TA1 Interchange Acknowledgement',1,1,'00306 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 TA1 Interchange Acknowledgement',2,2,'00306 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 TA1 Interchange Acknowledgement',4,4,'00306 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 TA1 Interchange Acknowledgement',5,5,'00306 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 TA1 Interchange Acknowledgement',6,3,'00306 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Transaction Set Header',1,1,'00306 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Transaction Set Header',2,2,'00306 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Transaction Set Trailer',1,1,'00306 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00306 Transaction Set Trailer',2,2,'00306 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Element Note',1,1,'003060Element Position in Segment',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Element Note',2,2,'003060Component Data Element Position in',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Element Note',3,3,'003060Data Element Reference Number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Element Note',4,4,'003060Data Element Syntax Error Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Element Note',5,5,'003060Copy of Bad Data Element',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Segment Note',1,1,'003060Segment ID Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Segment Note',2,2,'003060Segment Position in Transaction Set',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Segment Note',3,3,'003060Loop Identifier Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Data Segment Note',4,4,'003060Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Header',1,1,'003060Functional Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Header',2,2,'003060Group Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',1,1,'003060Functional Group Acknowledge Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',2,2,'003060Number of Transaction Sets Included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',3,3,'003060Number of Received Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',4,4,'003060Number of Accepted Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',5,5,'003060Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',6,6,'003060Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',7,7,'003060Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',8,8,'003060Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Functional Group Response Trailer',9,9,'003060Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Header',1,1,'003060Transaction Set Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Header',2,2,'003060Transaction Set Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Trailer',1,1,'003060Transaction Set Acknowledgment Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Trailer',2,2,'003060Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Trailer',3,3,'003060Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Trailer',4,4,'003060Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Trailer',5,5,'003060Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'003060Transaction Set Response Trailer',6,6,'003060Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',1,1,'00307 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',2,2,'00307 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',3,3,'00307 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',4,4,'00307 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',5,5,'00307 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',6,6,'00307 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',7,7,'00307 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Header',8,8,'00307 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Trailer',1,1,'00307 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Functional Group Trailer',2,2,'00307 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',1,1,'00307 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',2,2,'00307 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',3,3,'00307 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',4,4,'00307 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',5,5,'00307 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',6,6,'00307 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',7,7,'00307 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',8,8,'00307 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',9,9,'00307 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',10,10,'00307 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',11,11,'00307 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',12,12,'00307 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',13,13,'00307 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',14,14,'00307 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',15,15,'00307 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Header',16,16,'00307 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Trailer',1,1,'00307 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Interchange Control Trailer',2,2,'00307 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',1,1,'00307 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',2,2,'00307 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',4,4,'00307 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',5,5,'00307 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 TA1 Interchange Acknowledgement',6,3,'00307 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Transaction Set Header',1,1,'00307 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Transaction Set Header',2,2,'00307 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Transaction Set Trailer',1,1,'00307 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00307 Transaction Set Trailer',2,2,'00307 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',1,1,'00400 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',2,2,'00400 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',3,3,'00400 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',4,4,'00400 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',5,5,'00400 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',6,6,'00400 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',7,7,'00400 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Header',8,8,'00400 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Trailer',1,1,'00400 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Functional Group Trailer',2,2,'00400 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',1,1,'00400 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',2,2,'00400 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',3,3,'00400 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',4,4,'00400 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',5,5,'00400 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',6,6,'00400 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',7,7,'00400 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',8,8,'00400 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',9,9,'00400 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',10,10,'00400 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',11,11,'00400 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',12,12,'00400 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',13,13,'00400 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',14,14,'00400 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',15,15,'00400 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Header',16,16,'00400 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Trailer',1,1,'00400 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Interchange Control Trailer',2,2,'00400 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',1,1,'00400 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',2,2,'00400 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',6,3,'00400 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',7,4,'00400 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 TA1 Interchange Acknowledgement',8,5,'00400 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Transaction Set Header',1,1,'00400 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Transaction Set Header',2,2,'00400 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Transaction Set Trailer',1,1,'00400 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00400 Transaction Set Trailer',2,2,'00400 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',1,1,'00401 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',2,2,'00401 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',3,3,'00401 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',4,4,'00401 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',5,5,'00401 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',6,6,'00401 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',7,7,'00401 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Header',8,8,'00401 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Trailer',1,1,'00401 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Functional Group Trailer',2,2,'00401 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',1,1,'00401 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',2,2,'00401 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',3,3,'00401 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',4,4,'00401 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',5,5,'00401 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',6,6,'00401 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',7,7,'00401 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',8,8,'00401 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',9,9,'00401 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',10,10,'00401 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',11,11,'00401 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',12,12,'00401 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',13,13,'00401 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',14,14,'00401 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',15,15,'00401 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Header',16,16,'00401 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Trailer',1,1,'00401 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Interchange Control Trailer',2,2,'00401 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 TA1 Interchange Acknowledgement',1,1,'00401 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 TA1 Interchange Acknowledgement',2,2,'00401 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 TA1 Interchange Acknowledgement',6,3,'00401 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 TA1 Interchange Acknowledgement',7,4,'00401 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 TA1 Interchange Acknowledgement',8,5,'00401 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Transaction Set Header',1,1,'00401 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Transaction Set Header',2,2,'00401 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Transaction Set Trailer',1,1,'00401 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00401 Transaction Set Trailer',2,2,'00401 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Element Note',1,1,'004010Element Position in Segment',1,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Element Note',2,2,'004010Component Data Element Position in',2,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Element Note',3,3,'004010Data Element Reference Number',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Element Note',4,4,'004010Data Element Syntax Error Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Element Note',5,5,'004010Copy of Bad Data Element',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Segment Note',1,1,'004010Segment ID Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Segment Note',2,2,'004010Segment Position in Transaction Set',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Segment Note',3,3,'004010Loop Identifier Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Data Segment Note',4,4,'004010Segment Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Header',1,1,'004010Functional Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Header',2,2,'004010Group Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',1,1,'004010Functional Group Acknowledge Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',2,2,'004010Number of Transaction Sets Included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',3,3,'004010Number of Received Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',4,4,'004010Number of Accepted Transaction Sets',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',5,5,'004010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',6,6,'004010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',7,7,'004010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',8,8,'004010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Functional Group Response Trailer',9,9,'004010Functional Group Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Header',1,1,'004010Transaction Set Identifier Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Header',2,2,'004010Transaction Set Control Number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Trailer',1,1,'004010Transaction Set Acknowledgment Code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Trailer',2,2,'004010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Trailer',3,3,'004010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Trailer',4,4,'004010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Trailer',5,5,'004010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'004010Transaction Set Response Trailer',6,6,'004010Transaction Set Syntax Error Code',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',1,1,'00402 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',2,2,'00402 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',3,3,'00402 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',4,4,'00402 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',5,5,'00402 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',6,6,'00402 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',7,7,'00402 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Header',8,8,'00402 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Trailer',1,1,'00402 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Functional Group Trailer',2,2,'00402 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',1,1,'00402 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',2,2,'00402 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',3,3,'00402 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',4,4,'00402 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',5,5,'00402 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',6,6,'00402 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',7,7,'00402 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',8,8,'00402 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',9,9,'00402 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',10,10,'00402 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',11,11,'00402 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',12,12,'00402 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',13,13,'00402 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',14,14,'00402 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',15,15,'00402 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Header',16,16,'00402 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Trailer',1,1,'00402 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Interchange Control Trailer',2,2,'00402 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',1,1,'00402 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',2,2,'00402 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',4,4,'00402 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',5,5,'00402 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 TA1 Interchange Acknowledgement',6,3,'00402 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Transaction Set Header',1,1,'00402 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Transaction Set Header',2,2,'00402 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Transaction Set Header',3,3,'00402 Implementation Convention Reference',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Transaction Set Trailer',1,1,'00402 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00402 Transaction Set Trailer',2,2,'00402 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',1,1,'00403 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',2,2,'00403 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',3,3,'00403 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',4,4,'00403 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',5,5,'00403 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',6,6,'00403 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',7,7,'00403 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Header',8,8,'00403 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Trailer',1,1,'00403 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Functional Group Trailer',2,2,'00403 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',1,1,'00403 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',2,2,'00403 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',3,3,'00403 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',4,4,'00403 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',5,5,'00403 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',6,6,'00403 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',7,7,'00403 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',8,8,'00403 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',9,9,'00403 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',10,10,'00403 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',11,11,'00403 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',12,12,'00403 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',13,13,'00403 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',14,14,'00403 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',15,15,'00403 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Header',16,16,'00403 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Trailer',1,1,'00403 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Interchange Control Trailer',2,2,'00403 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',1,1,'00403 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',2,2,'00403 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',4,4,'00403 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',5,5,'00403 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 TA1 Interchange Acknowledgement',6,3,'00403 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Transaction Set Header',1,1,'00403 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Transaction Set Header',2,2,'00403 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Transaction Set Header',3,3,'00403 Implementation Convention Reference',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Transaction Set Trailer',1,1,'00403 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00403 Transaction Set Trailer',2,2,'00403 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',1,1,'00404 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',2,2,'00404 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',3,3,'00404 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',4,4,'00404 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',5,5,'00404 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',6,6,'00404 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',7,7,'00404 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Header',8,8,'00404 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Trailer',1,1,'00404 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Functional Group Trailer',2,2,'00404 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',1,1,'00404 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',2,2,'00404 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',3,3,'00404 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',4,4,'00404 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',5,5,'00404 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',6,6,'00404 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',7,7,'00404 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',8,8,'00404 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',9,9,'00404 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',10,10,'00404 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',11,11,'00404 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',12,12,'00404 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',13,13,'00404 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',14,14,'00404 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',15,15,'00404 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Header',16,16,'00404 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Trailer',1,1,'00404 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Interchange Control Trailer',2,2,'00404 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',1,1,'00404 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',2,2,'00404 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',4,4,'00404 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',5,5,'00404 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 TA1 Interchange Acknowledgement',6,3,'00404 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Transaction Set Header',1,1,'00404 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Transaction Set Header',2,2,'00404 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Transaction Set Header',3,3,'00402 Implementation Convention Reference',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Transaction Set Trailer',1,1,'00404 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00404 Transaction Set Trailer',2,2,'00404 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',1,1,'00405 Functional id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',2,2,'00405 Application senders code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',3,3,'00405 Application receivers code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',4,4,'00405 Date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',5,5,'00405 Time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',6,6,'00405 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',7,7,'00405 Responsible agency code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Header',8,8,'00405 Version/release/industry id code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Trailer',1,1,'00405 Number of transaction sets included',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Functional Group Trailer',2,2,'00405 Group control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',1,1,'00405 Authorization information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',2,2,'00405 Authorization information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',3,3,'00405 Security information qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',4,4,'00405 Security information',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',5,5,'00405 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',6,6,'00405 Interchange sender id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',7,7,'00405 Interchange id qualifier',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',8,8,'00405 Interchange receiver id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',9,9,'00405 Interchange date',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',10,10,'00405 Interchange time',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',11,11,'00405 Interchange control standards id',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',12,12,'00405 Interchange control version number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',13,13,'00405 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',14,14,'00405 Acknowledgment requested',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',15,15,'00405 Test indicator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Header',16,16,'00405 Sub-element separator',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Trailer',1,1,'00405 Number of included functional group',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Interchange Control Trailer',2,2,'00405 Interchange control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',1,1,'00405 Interchange control number',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',2,2,'00405 Interchange date',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',4,4,'00405 Interchange Acknowledgement Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',5,5,'00405 Interchange Note Code',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 TA1 Interchange Acknowledgement',6,3,'00405 Interchange time',0,1,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Transaction Set Header',1,1,'00405 Transaction set identifier code',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Transaction Set Header',2,2,'00405 Transaction set control number',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Transaction Set Header',3,3,'00405 Implementation Convention Reference',0,0,0,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Transaction Set Trailer',1,1,'00405 Number of included segments',0,1,1,NULL,NULL)

INSERT INTO segcon VALUES (5,'00405 Transaction Set Trailer',2,2,'00405 Transaction set control number',0,1,1,NULL,NULL)


GO

INSERT INTO sgmnts VALUES (1,'STATUS REPORT ERROR DETAILS','SRE','2  SP4STATUS REPORT ERROR DETAILS','2  ','SP4',NULL)

INSERT INTO sgmnts VALUES (1,'STATUS REPORT HEADER','SRH','2  SP4STATUS REPORT HEADER','2  ','SP4',NULL)

INSERT INTO sgmnts VALUES (1,'STATUS REPORT MESSAGE DETAILS','SRM','2  SP4STATUS REPORT MESSAGE DETAILS','2  ','SP4',NULL)

INSERT INTO sgmnts VALUES (3,'FUNCTIONAL GROUP HEADER','UNG','1     FUNCTIONAL GROUP HEADER','1  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'FUNCTIONAL GROUP TRAILER','UNE','1     FUNCTIONAL GROUP TRAILER','1  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE HEADER','UNB','1     INTERCHANGE HEADER','1  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE TRAILER','UNZ','1     INTERCHANGE TRAILER','1  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE HEADER','UNH','1     MESSAGE HEADER','1  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE TRAILER','UNT','1     MESSAGE TRAILER','1  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'FUNCTIONAL GROUP HEADER','UNG','2     FUNCTIONAL GROUP HEADER','2  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'FUNCTIONAL GROUP TRAILER','UNE','2     FUNCTIONAL GROUP TRAILER','2  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE HEADER','UNB','2     INTERCHANGE HEADER','2  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE TRAILER','UNZ','2     INTERCHANGE TRAILER','2  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE HEADER','UNH','2     MESSAGE HEADER','2  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE TRAILER','UNT','2     MESSAGE TRAILER','2  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'FUNCTIONAL GROUP HEADER','UNG','3     FUNCTIONAL GROUP HEADER','3  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'FUNCTIONAL GROUP TRAILER','UNE','3     FUNCTIONAL GROUP TRAILER','3  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE HEADER','UNB','3     INTERCHANGE HEADER','3  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE TRAILER','UNZ','3     INTERCHANGE TRAILER','3  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE HEADER','UNH','3     MESSAGE HEADER','3  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE TRAILER','UNT','3     MESSAGE TRAILER','3  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'GROUP HEADER','UNG','4     GROUP HEADER','4  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'GROUP TRAILER','UNE','4     GROUP TRAILER','4  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE HEADER','UNB','4     INTERCHANGE HEADER','4  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'INTERCHANGE TRAILER','UNZ','4     INTERCHANGE TRAILER','4  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE HEADER','UNH','4     MESSAGE HEADER','4  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'MESSAGE TRAILER','UNT','4     MESSAGE TRAILER','4  ','   ',NULL)

INSERT INTO sgmnts VALUES (3,'Data element error indication','UCD','4  1  Data element error indication','4  ','1  ',NULL)

INSERT INTO sgmnts VALUES (3,'Functional group response','UCF','4  1  Functional group response','4  ','1  ',NULL)

INSERT INTO sgmnts VALUES (3,'Interchange response','UCI','4  1  Interchange response','4  ','1  ',NULL)

INSERT INTO sgmnts VALUES (3,'Message response','UCM','4  1  Message response','4  ','1  ',NULL)

INSERT INTO sgmnts VALUES (3,'Segment error indication','UCS','4  1  Segment error indication','4  ','1  ',NULL)

INSERT INTO sgmnts VALUES (3,'Data element error indication','UCD','D  3  Data element error indication','D  ','3  ',NULL)

INSERT INTO sgmnts VALUES (3,'Functional group response','UCF','D  3  Functional group response','D  ','3  ',NULL)

INSERT INTO sgmnts VALUES (3,'Interchange response','UCI','D  3  Interchange response','D  ','3  ',NULL)

INSERT INTO sgmnts VALUES (3,'Message response','UCM','D  3  Message response','D  ','3  ',NULL)

INSERT INTO sgmnts VALUES (3,'Segment error indication','UCS','D  3  Segment error indication','D  ','3  ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00204 Functional Group Header','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00204 Functional Group Trailer','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00204 Interchange Control Header','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00204 Interchange Control Trailer','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00204 TA1 Interchange Acknowledgement','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00204 Transaction Set Header','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00204 Transaction Set Trailer','002','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Data Element Note','AK4','002040Data Element Note','002','040',NULL)

INSERT INTO sgmnts VALUES (5,'Data Segment Note','AK3','002040Data Segment Note','002','040',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Header','AK1','002040Functional Group Response Header','002','040',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Trailer','AK9','002040Functional Group Response Trailer','002','040',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Header','AK2','002040Transaction Set Response Header','002','040',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Trailer','AK5','002040Transaction Set Response Trailer','002','040',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00301 Functional Group Header','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00301 Functional Group Trailer','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00301 Interchange Control Header','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00301 Interchange Control Trailer','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00301 TA1 Interchange Acknowledgement','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00301 Transaction Set Header','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00301 Transaction Set Trailer','003','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Data Element Note','AK4','003010Data Element Note','003','010',NULL)

INSERT INTO sgmnts VALUES (5,'Data Segment Note','AK3','003010Data Segment Note','003','010',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Header','AK1','003010Functional Group Response Header','003','010',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Trailer','AK9','003010Functional Group Response Trailer','003','010',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Header','AK2','003010Transaction Set Response Header','003','010',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Trailer','AK5','003010Transaction Set Response Trailer','003','010',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00302 TA1 Interchange Acknowledgement','003','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','003020Functional Group Header','003','020',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','003020Functional Group Trailer','003','020',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','003020Interchange Control Header','003','020',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','003020Interchange Control Trailer','003','020',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','003020Transaction Set Header','003','020',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','003020Transaction Set Trailer','003','020',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00303 Functional Group Header','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00303 Functional Group Trailer','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00303 Interchange Control Header','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00303 Interchange Control Trailer','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00303 TA1 Interchange Acknowledgement','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00303 Transaction Set Header','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00303 Transaction Set Trailer','003','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00304 Functional Group Header','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00304 Functional Group Trailer','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00304 Interchange Control Header','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00304 Interchange Control Trailer','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00304 TA1 Interchange Acknowledgement','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00304 Transaction Set Header','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00304 Transaction Set Trailer','003','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00305 Functional Group Header','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00305 Functional Group Trailer','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00305 Interchange Control Header','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00305 Interchange Control Trailer','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00305 TA1 Interchange Acknowledgement','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00305 Transaction Set Header','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00305 Transaction Set Trailer','003','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00306 Functional Group Header','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00306 Functional Group Trailer','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00306 Interchange Control Header','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00306 Interchange Control Trailer','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00306 TA1 Interchange Acknowledgement','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00306 Transaction Set Header','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00306 Transaction Set Trailer','003','06 ',NULL)

INSERT INTO sgmnts VALUES (5,'Data Element Note','AK4','003060Data Element Note','003','060',NULL)

INSERT INTO sgmnts VALUES (5,'Data Segment Note','AK3','003060Data Segment Note','003','060',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Header','AK1','003060Functional Group Response Header','003','060',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Trailer','AK9','003060Functional Group Response Trailer','003','060',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Header','AK2','003060Transaction Set Response Header','003','060',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Trailer','AK5','003060Transaction Set Response Trailer','003','060',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00307 Functional Group Header','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00307 Functional Group Trailer','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00307 Interchange Control Header','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00307 Interchange Control Trailer','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00307 TA1 Interchange Acknowledgement','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00307 Transaction Set Header','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00307 Transaction Set Trailer','003','07 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00400 Functional Group Header','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00400 Functional Group Trailer','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00400 Interchange Control Header','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00400 Interchange Control Trailer','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00400 TA1 Interchange Acknowledgement','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00400 Transaction Set Header','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00400 Transaction Set Trailer','004','00 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00401 Functional Group Header','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00401 Functional Group Trailer','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00401 Interchange Control Header','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00401 Interchange Control Trailer','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00401 TA1 Interchange Acknowledgement','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00401 Transaction Set Header','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00401 Transaction Set Trailer','004','01 ',NULL)

INSERT INTO sgmnts VALUES (5,'Data Element Note','AK4','004010Data Element Note','004','010',NULL)

INSERT INTO sgmnts VALUES (5,'Data Segment Note','AK3','004010Data Segment Note','004','010',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Header','AK1','004010Functional Group Response Header','004','010',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Response Trailer','AK9','004010Functional Group Response Trailer','004','010',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Header','AK2','004010Transaction Set Response Header','004','010',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Response Trailer','AK5','004010Transaction Set Response Trailer','004','010',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00402 Functional Group Header','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00402 Functional Group Trailer','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00402 Interchange Control Header','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00402 Interchange Control Trailer','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00402 TA1 Interchange Acknowledgement','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00402 Transaction Set Header','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00402 Transaction Set Trailer','004','02 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00403 Functional Group Header','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00403 Functional Group Trailer','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00403 Interchange Control Header','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00403 Interchange Control Trailer','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00403 TA1 Interchange Acknowledgement','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00403 Transaction Set Header','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00403 Transaction Set Trailer','004','03 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00404 Functional Group Header','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00404 Functional Group Trailer','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00404 Interchange Control Header','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00404 Interchange Control Trailer','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00404 TA1 Interchange Acknowledgement','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00404 Transaction Set Header','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00404 Transaction Set Trailer','004','04 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Header','GS','00405 Functional Group Header','004','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Functional Group Trailer','GE','00405 Functional Group Trailer','004','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Header','ISA','00405 Interchange Control Header','004','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Interchange Control Trailer','IEA','00405 Interchange Control Trailer','004','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'TA1 Interchange Acknowledgement','TA1','00405 TA1 Interchange Acknowledgement','004','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Header','ST','00405 Transaction Set Header','004','05 ',NULL)

INSERT INTO sgmnts VALUES (5,'Transaction Set Trailer','SE','00405 Transaction Set Trailer','004','05 ',NULL)


GO

CREATE UNIQUE INDEX pbcatt_x ON pbcattbl
(
	pbt_tnam,
	pbt_ownr
)


CREATE UNIQUE INDEX pbcatc_x ON pbcatcol
(
	pbc_tnam,
	pbc_ownr,
	pbc_cnam
)


CREATE UNIQUE INDEX pbcatf_x ON pbcatfmt
(
	pbf_name
)


CREATE UNIQUE INDEX pbcatv_x ON pbcatvld
(
	pbv_name
)


CREATE UNIQUE INDEX pbcate_x ON pbcatedt
(
	pbe_name,
	pbe_seqn
)


ALTER TABLE mfcvr
	ADD CONSTRAINT fk_mfcvr_msgfmt_fc  FOREIGN KEY (fc) 
	REFERENCES msgfmt (fc)


ALTER TABLE mfcvr
	ADD CONSTRAINT fk_mfcvr_charset_setname  FOREIGN KEY (setname) 
	REFERENCES charset (setname)


CREATE INDEX sk_mfcvr_fc ON mfcvr
(
	fc
)


CREATE UNIQUE INDEX sk_mfcvr_descrp ON mfcvr
(
	fc,
	descrp
)


ALTER TABLE prtnr1
	ADD CONSTRAINT fk_prtnr1_states_sc  FOREIGN KEY (sc) 
	REFERENCES states (sc)


ALTER TABLE prtnr1
	ADD CONSTRAINT fk_prtnr1_cntrys_cc  FOREIGN KEY (cc) 
	REFERENCES cntrys (cc)


ALTER TABLE msgsrv
	ADD CONSTRAINT FK_PREPOST_CONNECTOR  FOREIGN KEY (msrvcdpp) 
	REFERENCES msgsrv (msrvcd)


ALTER TABLE prtnr3
	ADD CONSTRAINT fk_prtnr3_cntrys_cc  FOREIGN KEY (cc) 
	REFERENCES cntrys (cc)


ALTER TABLE prtnr3
	ADD CONSTRAINT fk_prtnr3_prtnr1_pc  FOREIGN KEY (pc) 
	REFERENCES prtnr1 (pc)


ALTER TABLE prtnr3
	ADD CONSTRAINT fk_prtnr3_msgsrv_msrvcd  FOREIGN KEY (msrvcd) 
	REFERENCES msgsrv (msrvcd)


CREATE UNIQUE INDEX sk_prtnr3_id ON prtnr3
(
	id,
	idcdq,
	routad
)


ALTER TABLE value2
	ADD CONSTRAINT fk_value2_value1_valtcd  FOREIGN KEY (valtcd) 
	REFERENCES value1 (valtcd)


ALTER TABLE parame
	ADD CONSTRAINT fk_parame_prtnr1_ownpc  FOREIGN KEY (ownpc) 
	REFERENCES prtnr1 (pc)


ALTER TABLE elmnts
	ADD CONSTRAINT fk_elmnts_msgfmt_fc  FOREIGN KEY (fc) 
	REFERENCES msgfmt (fc)


ALTER TABLE elmnts
	ADD CONSTRAINT fk_elmnts_eltype_elmtyp  FOREIGN KEY (elmtyp) 
	REFERENCES eltype (elmtyp)


ALTER TABLE sgmnts
	ADD CONSTRAINT fk_sgmnts_msgfmt_fc  FOREIGN KEY (fc) 
	REFERENCES msgfmt (fc)


ALTER TABLE msgs1
	ADD CONSTRAINT fk_msgs1_msgfmt_fc  FOREIGN KEY (fc) 
	REFERENCES msgfmt (fc)


ALTER TABLE msgs1
	ADD CONSTRAINT fk_msgs1_htmlta_htmlstyle  FOREIGN KEY (htmlstyle) 
	REFERENCES htmlta (htmlstyle)


CREATE INDEX sk_msgs1_lext ON msgs1
(
	lext
)


CREATE INDEX sk_msgs1_dlext ON msgs1
(
	dlext
)


ALTER TABLE msgs2
	ADD CONSTRAINT fk_msgs2_sgmnts_snvr  FOREIGN KEY (fc,snvr) 
	REFERENCES sgmnts (fc,snvr)


ALTER TABLE msgs2
	ADD CONSTRAINT fk_msgs2_msgs1_fcmcvr  FOREIGN KEY (fc,mcvr) 
	REFERENCES msgs1 (fc,mcvr)


CREATE INDEX sk_msgs2_seqseq ON msgs2
(
	fc,
	mcvr,
	espindex
)


ALTER TABLE msgs3
	ADD CONSTRAINT fk_msgs3_msgs2_msgseg  FOREIGN KEY (fc,mcvr,ssnr) 
	REFERENCES msgs2 (fc,mcvr,ssnr)


ALTER TABLE msgs4
	ADD CONSTRAINT fk_msgs4_msgs3_msgelm  FOREIGN KEY (fc,mcvr,ssnr,esnr) 
	REFERENCES msgs3 (fc,mcvr,ssnr,esnr)


ALTER TABLE audin
	ADD CONSTRAINT fk_audin_msgsrv_msrvcd  FOREIGN KEY (msrvcd) 
	REFERENCES msgsrv (msrvcd)


CREATE UNIQUE INDEX sk_audin_msgint ON audin
(
	msgin,
	icin
)


CREATE INDEX sk_audin_checkdups ON audin
(
	icr,
	mrn,
	pc,
	dc
)


CREATE INDEX sk_audin_status ON audin
(
	mstscd,
	msrvcdout
)


ALTER TABLE audout
	ADD CONSTRAINT fk_audout_msgsrv_msrvcd  FOREIGN KEY (msrvcd) 
	REFERENCES msgsrv (msrvcd)


CREATE UNIQUE INDEX sk_audout_intmsg ON audout
(
	icout,
	msgout,
	seqno
)


CREATE INDEX sk_audout_icrmrn ON audout
(
	pc,
	dc,
	icr,
	mrn
)


CREATE INDEX sk_audout_gcr ON audout
(
	pc,
	dc,
	gcr,
	mrn
)


CREATE INDEX sk_audout_clientid ON audout
(
	clientid
)


CREATE INDEX sk_audout_status ON audout
(
	mstscd,
	ref
)


CREATE INDEX sk_errors_message ON errors
(
	msgnr,
	inout
)


ALTER TABLE eitra1
	ADD CONSTRAINT fk_eitra1_msgfmt_from  FOREIGN KEY (frfc) 
	REFERENCES msgfmt (fc)


ALTER TABLE eitra1
	ADD CONSTRAINT fk_eitra1_msgfmt_to  FOREIGN KEY (tofc) 
	REFERENCES msgfmt (fc)


ALTER TABLE eitra1
	ADD CONSTRAINT fk_eitra1_value1_valtcd  FOREIGN KEY (valtcd) 
	REFERENCES value1 (valtcd)


ALTER TABLE eitra1
	ADD CONSTRAINT fk_eitra1_msgs1_from  FOREIGN KEY (frfc,frmcvr) 
	REFERENCES msgs1 (fc,mcvr)


ALTER TABLE eitra1
	ADD CONSTRAINT fk_eitra1_msgs1_to  FOREIGN KEY (tofc,tomcvr) 
	REFERENCES msgs1 (fc,mcvr)


CREATE INDEX sk_eitra1_traseq ON eitra1
(
	frfc,
	frmcvr,
	tofc,
	tomcvr,
	frssnr,
	fresnr,
	tossnr,
	toesnr,
	frpc,
	frdc,
	topc,
	todc,
	espindex
)


CREATE UNIQUE INDEX sk_eitra1_trafromelm ON eitra1
(
	frfc,
	frmcvr,
	frssnr,
	fresnr,
	tofc,
	tomcvr,
	tossnr,
	toesnr,
	frpc,
	frdc,
	topc,
	todc,
	espindex,
	seqnr
)


CREATE INDEX sk_tracon_conseq ON tracon
(
	frfc,
	frmcvr,
	frssnr,
	fresnr,
	tofc,
	tomcvr,
	tossnr,
	toesnr,
	fromto,
	seqnr,
	espindex,
	frpc,
	frdc,
	topc,
	todc
)


ALTER TABLE codset
	ADD CONSTRAINT fk_codset_elmnts_envr  FOREIGN KEY (fc,envr) 
	REFERENCES elmnts (fc,envr)


CREATE INDEX sk_trafun_funseq ON trafun
(
	frpc,
	frdc,
	topc,
	todc,
	frfc,
	frmcvr,
	frssnr,
	fresnr,
	tofc,
	tomcvr,
	espindex
)


ALTER TABLE segcon
	ADD CONSTRAINT fk_segcon_msgfmt_fc  FOREIGN KEY (fc) 
	REFERENCES msgfmt (fc)


ALTER TABLE segcon
	ADD CONSTRAINT fk_segcon_elmnts_envr  FOREIGN KEY (fc,envr) 
	REFERENCES elmnts (fc,envr)


ALTER TABLE segcon
	ADD CONSTRAINT fk_segcon_sgmnts_snvr  FOREIGN KEY (fc,snvr) 
	REFERENCES sgmnts (fc,snvr)


CREATE INDEX sk_segcon_segelmseq ON segcon
(
	fc,
	snvr,
	espindex
)


ALTER TABLE msgcon
	ADD CONSTRAINT fk_msgcon_msgs3_msgelm  FOREIGN KEY (fc,mcvr,ssnr,esnr) 
	REFERENCES msgs3 (fc,mcvr,ssnr,esnr)


CREATE INDEX sk_msgcon_conseq ON msgcon
(
	fc,
	mcvr,
	pc,
	dc,
	ssnr,
	esnr,
	espindex
)


ALTER TABLE htmlta
	ADD CONSTRAINT fk_htmlta_htmlba_htmlversion  FOREIGN KEY (htmlversion) 
	REFERENCES htmlba (htmlversion)


ALTER TABLE timefr
	ADD CONSTRAINT fk_timefr_msgsrv_msrvcd  FOREIGN KEY (msrvcd) 
	REFERENCES msgsrv (msrvcd)


CREATE UNIQUE INDEX sk_authgrps_descrp ON authgrps
(
	descrp
)


ALTER TABLE bpauth
	ADD CONSTRAINT fk_bpauth_prtnr3_pcdc  FOREIGN KEY (pc,dc) 
	REFERENCES prtnr3 (pc,dc)


ALTER TABLE bpauth
	ADD CONSTRAINT fk_bpauth_authgrps_agid  FOREIGN KEY (agid) 
	REFERENCES authgrps (id)


ALTER TABLE agmaps
	ADD CONSTRAINT fr_agmaps_mfcvr_tofcvr  FOREIGN KEY (tofcvr) 
	REFERENCES mfcvr (fcvr)


ALTER TABLE agmaps
	ADD CONSTRAINT fk_agmaps_mfcvr_frfcvr  FOREIGN KEY (frfcvr) 
	REFERENCES mfcvr (fcvr)


ALTER TABLE agmaps
	ADD CONSTRAINT fk_agmaps_authgrps_agid  FOREIGN KEY (agid) 
	REFERENCES authgrps (id)


CREATE UNIQUE INDEX sk_uritopc_pc ON uritopc
(
	pc
)









