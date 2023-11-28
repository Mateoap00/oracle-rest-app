-- Conectado como base2.

-------------------- CUSTOMER --------------------------------
CREATE TABLE customer (
    custno   VARCHAR(8),
    custname VARCHAR(30)
        CONSTRAINT custnamenotnull NOT NULL,
    address  VARCHAR(50)
        CONSTRAINT addressnotnull NOT NULL,
    internal CHAR(1)
        CONSTRAINT internalnotnull NOT NULL,
    contact  VARCHAR(35)
        CONSTRAINT contractnotnull NOT NULL,
    phone    VARCHAR(11)
        CONSTRAINT cphonenotnull NOT NULL,
    city     VARCHAR(30)
        CONSTRAINT citynotnull NOT NULL,
    state    VARCHAR(2)
        CONSTRAINT statenotnull NOT NULL,
    zip      VARCHAR(10)
        CONSTRAINT zipnotnull NOT NULL,
    CONSTRAINT pk_customer PRIMARY KEY ( custno )
);

COMMENT ON COLUMN customer.custno IS
    'Customer DECIMAL';

COMMENT ON COLUMN customer.custname IS
    'Customer name';

COMMENT ON COLUMN customer.address IS
    'Customer address';

COMMENT ON COLUMN customer.internal IS
    'Customer type (Yes if internal, No otherwise)';

COMMENT ON COLUMN customer.contact IS
    'Contact person';

COMMENT ON COLUMN customer.phone IS
    'Contact phone DECIMAL';

COMMENT ON COLUMN customer.city IS
    'City';

COMMENT ON COLUMN customer.state IS
    'State';

COMMENT ON COLUMN customer.zip IS
    'Zip code';

-------------------- FACILITY --------------------------------
CREATE TABLE facility (
    facno   VARCHAR(8),
    facname VARCHAR(30)
        CONSTRAINT facnamenotnull NOT NULL,
    CONSTRAINT pk_facility PRIMARY KEY ( facno )
);

COMMENT ON COLUMN facility.facno IS
    'Facility DECIMAL';

COMMENT ON COLUMN facility.facname IS
    'Facility name';

-------------------- LOCATION --------------------------------
CREATE TABLE location (
    locno   VARCHAR(8),
    facno   VARCHAR(8)
        CONSTRAINT facnofknotnull NOT NULL,
    locname VARCHAR(30)
        CONSTRAINT locnamenotnull NOT NULL,
    CONSTRAINT pk_location PRIMARY KEY ( locno ),
    CONSTRAINT fk_facno FOREIGN KEY ( facno )
        REFERENCES facility ( facno )
);

COMMENT ON COLUMN location.locno IS
    'Location DECIMAL';

COMMENT ON COLUMN location.facno IS
    'Facility DECIMAL';

COMMENT ON COLUMN location.locname IS
    'Location name';

-------------------- EMPLOYEE --------------------------------
CREATE TABLE employee (
    empno      VARCHAR(8),
    empname    VARCHAR(35)
        CONSTRAINT empnamenotnull NOT NULL,
    department VARCHAR(25)
        CONSTRAINT departmetnnotnull NOT NULL,
    email      VARCHAR(30)
        CONSTRAINT emailnotnull NOT NULL,
    phone      VARCHAR(10)
        CONSTRAINT ephonenotnull NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY ( empno )
);

COMMENT ON COLUMN employee.empno IS
    'Employee DECIMAL';

COMMENT ON COLUMN employee.empname IS
    'Employee name';

COMMENT ON COLUMN employee.department IS
    'Department';

COMMENT ON COLUMN employee.email IS
    'electronic mail address';

-------------------- RESOURCETBL --------------------------------
CREATE TABLE resourcetbl (
    resno   VARCHAR(8),
    resname VARCHAR(30)
        CONSTRAINT resnamenotnull NOT NULL,
    rate    DECIMAL(15, 4)
        CONSTRAINT ratenotnull NOT NULL,
    CONSTRAINT ratepositive CHECK ( rate > 0 ),
    CONSTRAINT pk_resource PRIMARY KEY ( resno )
);

COMMENT ON TABLE resourcetbl IS
    'ORIGINAL NAME:Resource';

-------------------- EVENTREQUEST --------------------------------
CREATE TABLE eventrequest (
    eventno     VARCHAR(8),
    dateheld    DATE
        CONSTRAINT dateheldnotnull NOT NULL,
    datereq     DATE
        CONSTRAINT datereqnotnull NOT NULL,
    custno      VARCHAR(8)
        CONSTRAINT custnofknotnull NOT NULL,
    facno       VARCHAR(8)
        CONSTRAINT facnofk2notnull NOT NULL,
    dateauth    DATE,
    status      VARCHAR(20)
        CONSTRAINT statusnotnull NOT NULL,
    estcost     DECIMAL(15, 4)
        CONSTRAINT estcostnotnull NOT NULL,
    estaudience INTEGER
        CONSTRAINT estaudiencenotnull NOT NULL,
    budno       VARCHAR(8),
    CONSTRAINT validstatus CHECK ( status IN ( 'Pending', 'Denied', 'Approved' ) ),
    CONSTRAINT estaudiencepositive CHECK ( estaudience > 0 ),
    CONSTRAINT pk_eventrequest PRIMARY KEY ( eventno ),
    CONSTRAINT fk_event_facno FOREIGN KEY ( facno )
        REFERENCES facility ( facno ),
    CONSTRAINT fk_custno FOREIGN KEY ( custno )
        REFERENCES customer ( custno )
);

COMMENT ON COLUMN eventrequest.eventno IS
    'Event number';

COMMENT ON COLUMN eventrequest.dateheld IS
    'Event date';

COMMENT ON COLUMN eventrequest.datereq IS
    'Date requested';

COMMENT ON COLUMN eventrequest.custno IS
    'Customer number';

COMMENT ON COLUMN eventrequest.facno IS
    'Facility number';

COMMENT ON COLUMN eventrequest.dateauth IS
    'Date authorized';

COMMENT ON COLUMN eventrequest.status IS
    'Status of event request';

COMMENT ON COLUMN eventrequest.estcost IS
    'Estimated cost';

COMMENT ON COLUMN eventrequest.estaudience IS
    'Estimated audience';

COMMENT ON COLUMN eventrequest.budno IS
    'Budget number';

-------------------- EVENTPLAN --------------------------------
CREATE TABLE eventplan (
    planno   VARCHAR(8),
    eventno  VARCHAR(8)
        CONSTRAINT eventnofknotnull NOT NULL,
    workdate DATE
        CONSTRAINT workdatenotnull NOT NULL,
    notes    VARCHAR(50),
    activity VARCHAR(50)
        CONSTRAINT activitynotnull NOT NULL,
    empno    VARCHAR(8),
    CONSTRAINT pk_eventplan PRIMARY KEY ( planno ),
    CONSTRAINT fk_empno FOREIGN KEY ( empno )
        REFERENCES employee ( empno ),
    CONSTRAINT fk_eventno FOREIGN KEY ( eventno )
        REFERENCES eventrequest ( eventno )
);

COMMENT ON COLUMN eventplan.planno IS
    'Event plan number';

COMMENT ON COLUMN eventplan.eventno IS
    'Event number';

COMMENT ON COLUMN eventplan.workdate IS
    'Work date';

-------------------- EVENTPLANLINE --------------------------------
CREATE TABLE eventplanline (
    planno      VARCHAR(8),
    lineno      INTEGER
        CONSTRAINT linenonotnull NOT NULL,
    timestart   DATE
        CONSTRAINT timestartnotnull NOT NULL,
    timeend     DATE
        CONSTRAINT timeendnotnull NOT NULL,
    resourcecnt INTEGER
        CONSTRAINT numberfldnotnull NOT NULL,
    locno       VARCHAR(8)
        CONSTRAINT locnofknotnull NOT NULL,
    resno       VARCHAR(8)
        CONSTRAINT resnofknotnull NOT NULL,
    CONSTRAINT timestartendrelationship CHECK ( timestart < timeend ),
    CONSTRAINT pk_eventplanline PRIMARY KEY ( planno,
                                              lineno ),
    CONSTRAINT fk_locno FOREIGN KEY ( locno )
        REFERENCES location ( locno ),
    CONSTRAINT fk_resno FOREIGN KEY ( resno )
        REFERENCES resourcetbl ( resno ),
    CONSTRAINT fk_planno FOREIGN KEY ( planno )
        REFERENCES eventplan ( planno )
            ON DELETE CASCADE
);

COMMENT ON COLUMN eventplanline.planno IS
    'Event Event plan number';

COMMENT ON COLUMN eventplanline.lineno IS
    'line number';

COMMENT ON COLUMN eventplanline.timestart IS
    'Time start';

COMMENT ON COLUMN eventplanline.timeend IS
    'Time end';

COMMENT ON COLUMN eventplanline.resourcecnt IS
    'count of resources needed';

INSERT INTO employee (
    empno,
    empname,
    department,
    email,
    phone
) VALUES (
    'E100',
    'Chuck Coordinator',
    'Administration',
    'chuck@colorado.edu',
    '3-1111'
);

INSERT INTO employee (
    empno,
    empname,
    department,
    email,
    phone
) VALUES (
    'E101',
    'Mary Manager',
    'Football',
    'mary@colorado.edu',
    '5-1111'
);

INSERT INTO employee (
    empno,
    empname,
    department,
    email,
    phone
) VALUES (
    'E102',
    'Sally Supervisor',
    'Planning',
    'sally@colorado.edu',
    '3-2222'
);

INSERT INTO employee (
    empno,
    empname,
    department,
    email,
    phone
) VALUES (
    'E103',
    'Alan Administrator',
    'Administration',
    'alan@colorado.edu',
    '3-3333'
);

INSERT INTO customer (
    custno,
    custname,
    address,
    internal,
    contact,
    phone,
    city,
    state,
    zip
) VALUES (
    'C100',
    'Football',
    'Box 352200',
    'Y',
    'Mary Manager',
    '6857100',
    'Boulder',
    'CO',
    '80309'
);

INSERT INTO customer (
    custno,
    custname,
    address,
    internal,
    contact,
    phone,
    city,
    state,
    zip
) VALUES (
    'C101',
    'Men''s Basketball',
    'Box 352400',
    'Y',
    'Sally Supervisor',
    '5431700',
    'Boulder',
    'CO',
    '80309'
);

INSERT INTO customer (
    custno,
    custname,
    address,
    internal,
    contact,
    phone,
    city,
    state,
    zip
) VALUES (
    'C103',
    'Baseball',
    'Box 352020',
    'Y',
    'Bill Baseball',
    '5431234',
    'Boulder',
    'CO',
    '80309'
);

INSERT INTO customer (
    custno,
    custname,
    address,
    internal,
    contact,
    phone,
    city,
    state,
    zip
) VALUES (
    'C104',
    'Women''s Softball',
    'Box 351200',
    'Y',
    'Sue Softball',
    '5434321',
    'Boulder',
    'CO',
    '80309'
);

INSERT INTO customer (
    custno,
    custname,
    address,
    internal,
    contact,
    phone,
    city,
    state,
    zip
) VALUES (
    'C105',
    'High School Football',
    '123 AnyStreet',
    'N',
    'Coach Bob',
    '4441234',
    'Louisville',
    'CO',
    '80027'
);

INSERT INTO resourcetbl (
    resno,
    resname,
    rate
) VALUES (
    'R100',
    'attendant',
    10
);

INSERT INTO resourcetbl (
    resno,
    resname,
    rate
) VALUES (
    'R101',
    'police',
    15
);

INSERT INTO resourcetbl (
    resno,
    resname,
    rate
) VALUES (
    'R102',
    'usher',
    10
);

INSERT INTO resourcetbl (
    resno,
    resname,
    rate
) VALUES (
    'R103',
    'nurse',
    20
);

INSERT INTO resourcetbl (
    resno,
    resname,
    rate
) VALUES (
    'R104',
    'janitor',
    15
);

INSERT INTO resourcetbl (
    resno,
    resname,
    rate
) VALUES (
    'R105',
    'food service',
    10
);

INSERT INTO facility (
    facno,
    facname
) VALUES (
    'F100',
    'Football stadium'
);

INSERT INTO facility (
    facno,
    facname
) VALUES (
    'F101',
    'Basketball arena'
);

INSERT INTO facility (
    facno,
    facname
) VALUES (
    'F102',
    'Baseball field'
);

INSERT INTO facility (
    facno,
    facname
) VALUES (
    'F103',
    'Recreation room'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L100',
    'F100',
    'Locker room'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L101',
    'F100',
    'Plaza'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L102',
    'F100',
    'Vehicle gate'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L103',
    'F101',
    'Locker room'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L104',
    'F100',
    'Ticket Booth'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L105',
    'F101',
    'Gate'
);

INSERT INTO location (
    locno,
    facno,
    locname
) VALUES (
    'L106',
    'F100',
    'Pedestrian gate'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E100',
    TO_DATE('25-OCT-22', 'DD-MON-RR'),
    TO_DATE('06-JUN-22', 'DD-MON-RR'),
    'C100',
    'F100',
    TO_DATE('08-JUN-22', 'DD-MON-RR'),
    'Approved',
    5000,
    80000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E101',
    TO_DATE('26-OCT-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C100',
    'F100',
    NULL,
    'Pending',
    5000,
    80000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E103',
    TO_DATE('21-SEP-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C100',
    'F100',
    TO_DATE('01-AUG-22', 'DD-MON-RR'),
    'Approved',
    5000,
    80000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E102',
    TO_DATE('14-SEP-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C100',
    'F100',
    TO_DATE('31-JUL-22', 'DD-MON-RR'),
    'Approved',
    5000,
    80000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E104',
    TO_DATE('03-DEC-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C101',
    'F101',
    TO_DATE('31-JUL-22', 'DD-MON-RR'),
    'Approved',
    2000,
    12000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E105',
    TO_DATE('05-DEC-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C101',
    'F101',
    TO_DATE('01-AUG-22', 'DD-MON-RR'),
    'Approved',
    2000,
    10000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E106',
    TO_DATE('12-DEC-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C101',
    'F101',
    TO_DATE('31-JUL-22', 'DD-MON-RR'),
    'Approved',
    2000,
    10000,
    'B1000'
);

INSERT INTO eventrequest (
    eventno,
    dateheld,
    datereq,
    custno,
    facno,
    dateauth,
    status,
    estcost,
    estaudience,
    budno
) VALUES (
    'E107',
    TO_DATE('23-NOV-22', 'DD-MON-RR'),
    TO_DATE('28-JUL-22', 'DD-MON-RR'),
    'C105',
    'F100',
    TO_DATE('31-JUL-22', 'DD-MON-RR'),
    'Denied',
    10000,
    5000,
    NULL
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P100',
    'E100',
    TO_DATE('25-OCT-22', 'DD-MON-RR'),
    'Standard operation',
    'Operation',
    'E102'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P101',
    'E104',
    TO_DATE('03-DEC-22', 'DD-MON-RR'),
    'Watch for gate crashers',
    'Operation',
    'E100'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P102',
    'E105',
    TO_DATE('05-DEC-22', 'DD-MON-RR'),
    'Standard operation',
    'Operation',
    'E102'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P103',
    'E106',
    TO_DATE('12-DEC-22', 'DD-MON-RR'),
    'Watch for seat switching',
    'Operation',
    NULL
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P104',
    'E101',
    TO_DATE('26-OCT-22', 'DD-MON-RR'),
    'Standard cleanup',
    'Cleanup',
    'E101'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P105',
    'E100',
    TO_DATE('25-OCT-22', 'DD-MON-RR'),
    'Light cleanup',
    'Cleanup',
    'E101'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P199',
    'E102',
    TO_DATE('10-DEC-22', 'DD-MON-RR'),
    'ABC',
    'Operation',
    'E101'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P299',
    'E101',
    TO_DATE('26-OCT-22', 'DD-MON-RR'),
    NULL,
    'Operation',
    'E101'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P349',
    'E106',
    TO_DATE('12-DEC-22', 'DD-MON-RR'),
    NULL,
    'Setup',
    'E101'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P85',
    'E100',
    TO_DATE('25-OCT-22', 'DD-MON-RR'),
    'Standard operation',
    'Cleanup',
    'E102'
);

INSERT INTO eventplan (
    planno,
    eventno,
    workdate,
    notes,
    activity,
    empno
) VALUES (
    'P95',
    'E101',
    TO_DATE('26-OCT-22', 'DD-MON-RR'),
    'Extra security',
    'Cleanup',
    'E102'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P100',
    1,
    TO_DATE('25-OCT-22 8:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L100',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P100',
    2,
    TO_DATE('25-OCT-22 12:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L101',
    'R101'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P100',
    3,
    TO_DATE('25-OCT-22 7:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 16:30:00', 'DD-MON-RR HH24:MI:SS'),
    1,
    'L102',
    'R102'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P100',
    4,
    TO_DATE('25-OCT-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L100',
    'R102'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P101',
    1,
    TO_DATE('3-DEC-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('3-DEC-22 20:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L103',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P101',
    2,
    TO_DATE('3-DEC-22 18:30:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('3-DEC-22 19:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L105',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P101',
    3,
    TO_DATE('3-DEC-22 19:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('3-DEC-22 20:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L103',
    'R103'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P102',
    1,
    TO_DATE('5-DEC-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('5-DEC-22 19:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L103',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P102',
    2,
    TO_DATE('5-DEC-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('5-DEC-22 21:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L105',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P102',
    3,
    TO_DATE('5-DEC-22 19:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('5-DEC-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L103',
    'R103'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P103',
    1,
    TO_DATE('12-DEC-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('12-DEC-22 21:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L103',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P103',
    2,
    TO_DATE('12-DEC-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('12-DEC-22 21:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L105',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P103',
    3,
    TO_DATE('12-DEC-22 19:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('12-DEC-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L103',
    'R103'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P104',
    1,
    TO_DATE('26-OCT-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L101',
    'R104'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P104',
    2,
    TO_DATE('26-OCT-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L100',
    'R104'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P105',
    1,
    TO_DATE('25-OCT-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L101',
    'R104'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P105',
    2,
    TO_DATE('25-OCT-22 18:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 22:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L100',
    'R104'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P199',
    1,
    TO_DATE('10-DEC-22 8:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('10-DEC-22 12:00:00', 'DD-MON-RR HH24:MI:SS'),
    1,
    'L100',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P349',
    1,
    TO_DATE('12-DEC-22 12:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('12-DEC-22 15:30:00', 'DD-MON-RR HH24:MI:SS'),
    1,
    'L103',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P85',
    1,
    TO_DATE('25-OCT-22 9:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    5,
    'L100',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P85',
    2,
    TO_DATE('25-OCT-22 8:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L102',
    'R101'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P85',
    3,
    TO_DATE('25-OCT-22 10:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('25-OCT-22 15:00:00', 'DD-MON-RR HH24:MI:SS'),
    3,
    'L104',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P95',
    1,
    TO_DATE('26-OCT-22 8:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L100',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P95',
    2,
    TO_DATE('26-OCT-22 9:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L102',
    'R101'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P95',
    3,
    TO_DATE('26-OCT-22 10:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 15:00:00', 'DD-MON-RR HH24:MI:SS'),
    4,
    'L106',
    'R100'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P95',
    4,
    TO_DATE('26-OCT-22 13:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L100',
    'R103'
);

INSERT INTO eventplanline (
    planno,
    lineno,
    timestart,
    timeend,
    resourcecnt,
    locno,
    resno
) VALUES (
    'P95',
    5,
    TO_DATE('26-OCT-22 13:00:00', 'DD-MON-RR HH24:MI:SS'),
    TO_DATE('26-OCT-22 17:00:00', 'DD-MON-RR HH24:MI:SS'),
    2,
    'L101',
    'R104'
);

CREATE OR REPLACE VIEW view_customer_eventrequest AS
    SELECT
        c.custno,
        c.custname,
        c.address,
        c.phone,
        c.city,
        e.eventno,
        e.datereq,
        e.dateheld,
        e.dateauth,
        e.status
    FROM
             customer c
        JOIN eventrequest e ON c.custno = e.custno
    ORDER BY
        e.eventno;

CREATE OR REPLACE VIEW view_facility_eventrequest AS
    SELECT
        f.facno,
        f.facname,
        e.eventno,
        e.datereq,
        e.dateheld,
        e.dateauth,
        e.status
    FROM
             facility f
        JOIN eventrequest e ON f.facno = e.facno
    ORDER BY
        e.eventno;

CREATE TABLE auditoria_eventrequest (
    id              NUMBER
        GENERATED BY DEFAULT AS IDENTITY,
    tipo_operacion  VARCHAR2(10),
    fecha_operacion TIMESTAMP,
    usuario         VARCHAR2(30),
    old_eventno     VARCHAR2(8),
    new_eventno     VARCHAR2(8),
    old_custno      VARCHAR2(8),
    new_custno      VARCHAR2(8),
    old_facno       VARCHAR2(8),
    new_facno       VARCHAR2(8),
    old_budno       VARCHAR2(8),
    new_budno       VARCHAR2(8),
    old_dateheld    DATE,
    new_dateheld    DATE,
    old_datereq     DATE,
    new_datereq     DATE,
    old_dateauth    DATE,
    new_dateauth    DATE,
    old_estaudience NUMBER(38, 0),
    new_estaudience NUMBER(38, 0),
    old_estcost     NUMBER(15, 4),
    new_estcost     NUMBER(15, 4),
    old_status      VARCHAR2(20),
    new_status      VARCHAR2(20),
    PRIMARY KEY ( id )
);

CREATE OR REPLACE TRIGGER trigger_auditoria_eventrequest BEFORE
    INSERT OR UPDATE OR DELETE ON eventrequest
    FOR EACH ROW
DECLARE
    v_tipo_operacion VARCHAR2(10);
BEGIN
    IF inserting THEN
        v_tipo_operacion := 'INSERT';
    ELSIF updating THEN
        v_tipo_operacion := 'UPDATE';
    ELSIF deleting THEN
        v_tipo_operacion := 'DELETE';
    END IF;

    INSERT INTO auditoria_eventrequest (
        tipo_operacion,
        fecha_operacion,
        usuario,
        old_eventno,
        new_eventno,
        old_custno,
        new_custno,
        old_facno,
        new_facno,
        old_budno,
        new_budno,
        old_dateheld,
        new_dateheld,
        old_datereq,
        new_datereq,
        old_dateauth,
        new_dateauth,
        old_estaudience,
        new_estaudience,
        old_estcost,
        new_estcost,
        old_status,
        new_status
    ) VALUES (
        v_tipo_operacion,
        systimestamp,
        user,
        :old.eventno,
        :new.eventno,
        :old.custno,
        :new.custno,
        :old.facno,
        :new.facno,
        :old.budno,
        :new.budno,
        :old.dateheld,
        :new.dateheld,
        :old.datereq,
        :new.datereq,
        :old.dateauth,
        :new.dateauth,
        :old.estaudience,
        :new.estaudience,
        :old.estcost,
        :new.estcost,
        :old.status,
        :new.status
    );

END;