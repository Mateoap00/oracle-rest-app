-- Ejecutar scripts 01 y 02 antes de ejecutar este script.

-- Conectado como base2.
CONN base2/Clases.2023@freepdb1

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

COMMIT;