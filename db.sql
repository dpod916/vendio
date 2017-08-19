--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agreements; Type: TABLE; Schema: public; Owner: contractually
--

CREATE TABLE agreements (
    id integer NOT NULL,
    old_id integer,
    agreement_number integer,
    agreement_version character varying,
    added_text text,
    title character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE agreements OWNER TO contractually;

--
-- Name: agreements_id_seq; Type: SEQUENCE; Schema: public; Owner: contractually
--

CREATE SEQUENCE agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE agreements_id_seq OWNER TO contractually;

--
-- Name: agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: contractually
--

ALTER SEQUENCE agreements_id_seq OWNED BY agreements.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: contractually
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO contractually;

--
-- Name: consultants; Type: TABLE; Schema: public; Owner: contractually
--

CREATE TABLE consultants (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    name character varying,
    email character varying,
    vendor_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE consultants OWNER TO contractually;

--
-- Name: consultants_id_seq; Type: SEQUENCE; Schema: public; Owner: contractually
--

CREATE SEQUENCE consultants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consultants_id_seq OWNER TO contractually;

--
-- Name: consultants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: contractually
--

ALTER SEQUENCE consultants_id_seq OWNED BY consultants.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: contractually
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO contractually;

--
-- Name: vendor_hierarchies; Type: TABLE; Schema: public; Owner: contractually
--

CREATE TABLE vendor_hierarchies (
    ancestor_id integer NOT NULL,
    descendant_id integer NOT NULL,
    generations integer NOT NULL
);


ALTER TABLE vendor_hierarchies OWNER TO contractually;

--
-- Name: vendors; Type: TABLE; Schema: public; Owner: contractually
--

CREATE TABLE vendors (
    id bigint NOT NULL,
    name character varying,
    legal_name character varying,
    type character varying,
    parent_id integer,
    lng double precision,
    lat double precision,
    full_address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    phone character varying,
    website character varying
);


ALTER TABLE vendors OWNER TO contractually;

--
-- Name: vendors_id_seq; Type: SEQUENCE; Schema: public; Owner: contractually
--

CREATE SEQUENCE vendors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vendors_id_seq OWNER TO contractually;

--
-- Name: vendors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: contractually
--

ALTER SEQUENCE vendors_id_seq OWNED BY vendors.id;


--
-- Name: agreements id; Type: DEFAULT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY agreements ALTER COLUMN id SET DEFAULT nextval('agreements_id_seq'::regclass);


--
-- Name: consultants id; Type: DEFAULT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY consultants ALTER COLUMN id SET DEFAULT nextval('consultants_id_seq'::regclass);


--
-- Name: vendors id; Type: DEFAULT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY vendors ALTER COLUMN id SET DEFAULT nextval('vendors_id_seq'::regclass);


--
-- Data for Name: agreements; Type: TABLE DATA; Schema: public; Owner: contractually
--

COPY agreements (id, old_id, agreement_number, agreement_version, added_text, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: agreements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: contractually
--

SELECT pg_catalog.setval('agreements_id_seq', 1, false);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: contractually
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-08-16 16:51:09.163564	2017-08-16 16:51:09.163564
\.


--
-- Data for Name: consultants; Type: TABLE DATA; Schema: public; Owner: contractually
--

COPY consultants (id, first_name, last_name, name, email, vendor_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: consultants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: contractually
--

SELECT pg_catalog.setval('consultants_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: contractually
--

COPY schema_migrations (version) FROM stdin;
10190903160853
20170331000452
20170625205818
20170626160235
20170816173736
\.


--
-- Data for Name: vendor_hierarchies; Type: TABLE DATA; Schema: public; Owner: contractually
--

COPY vendor_hierarchies (ancestor_id, descendant_id, generations) FROM stdin;
\.


--
-- Data for Name: vendors; Type: TABLE DATA; Schema: public; Owner: contractually
--

COPY vendors (id, name, legal_name, type, parent_id, lng, lat, full_address, created_at, updated_at, phone, website) FROM stdin;
1	Akshay Software International Inc	Akshay Software International, Inc.	\N	\N	-80.3795980999999955	25.7915412000000011	11234 NW 20th St, Miami, FL 33172, USA	2017-08-16 17:44:41.253958	2017-08-16 17:44:41.253958	(305) 591-4633	\N
2	Alden & Associates, Inc., a Division of Spelman Johnson	Alden Associates & Consulting, Inc	\N	\N	-72.6705230999999969	42.2689049000000026	3 Chapman Ave, Easthampton, MA 01027, USA	2017-08-16 17:44:42.229459	2017-08-16 17:44:42.229459	(413) 549-1635	http://www.spelmanjohnson.com/
3	Alden Personnel, Inc.	Alden Personnel, Inc.	\N	\N	\N	\N	\N	2017-08-16 17:44:42.719709	2017-08-16 17:44:42.719709	\N	\N
4	arago Consulting GmbH	Arago Consulting	\N	\N	8.61939420000000034	50.132359000000001	Hausener Weg 112a, 60489 Frankfurt am Main, Germany	2017-08-16 17:44:44.167112	2017-08-16 17:44:44.167112	069 95739090	http://www.arago-consulting.de/
5	Avensys Consulting Pte Ltd.	Avaisys Consulting PTE LTD	\N	\N	103.893675099999996	1.33290850000000005	Vertex, #08-04, 33 Ubi Ave 3, Singapore 408868	2017-08-16 17:44:45.148196	2017-08-16 17:44:45.148196	6336 6634	http://www.aven-sys.com/
6	Axion of New Jersey LLC	Axion Worldwide, LLC	\N	\N	-74.3320470999999969	40.5654170999999977	510 Thornall St, Edison, NJ 08837, USA	2017-08-16 17:44:46.521375	2017-08-16 17:44:46.521375	(732) 906-6655	https://axionllc.com/
7	The Ayers Group	Ayers Group, The	\N	\N	-73.9784106000000037	40.7503839999999968	99 Park Ave, New York, NY 10016, USA	2017-08-16 17:44:47.580184	2017-08-16 17:44:47.580184	(212) 889-7788	http://www.ayers.com/
8	Best Writers / Sid Falthzik	Best Writers / Sid Falthzik	\N	\N	\N	\N	\N	2017-08-16 17:44:48.190532	2017-08-16 17:44:48.190532	\N	\N
9	Best Training & Consulting Co	Bist Consulting Co.	\N	\N	-84.3134510000000006	33.9940330000000017	1405 Northcliff Trce, Roswell, GA 30076, USA	2017-08-16 17:44:49.440867	2017-08-16 17:44:49.440867	(770) 642-7282	\N
10	BSA Health System	BSA	\N	\N	-101.920410700000005	35.1963195000000084	1600 Wallace Blvd, Amarillo, TX 79106, USA	2017-08-16 17:44:55.077527	2017-08-16 17:44:55.077527	(806) 212-2000	http://www.bsahs.org/
11	The Burton Group	Burton Group	\N	\N	-86.6015440999999981	39.2180965000000015	5015 W State Road 46, Suite J, Bloomington, IN 47404, USA	2017-08-16 17:44:56.836137	2017-08-16 17:44:56.836137	(812) 334-4000	http://www.burtontrust.com/
12	Calpion Inc	Calpion Inc.	\N	\N	-96.8248399999999947	32.928058	4835 Lyndon B Johnson Fwy #515, Dallas, TX 75244, USA	2017-08-16 17:44:57.503039	2017-08-16 17:44:57.503039	(972) 200-4809	http://www.calpion.com/
13	CAMO Software	Camo Technologies, Inc.	\N	\N	-74.2862713999999897	40.5540676000000033	One Woodbridge Center Suite 319, Woodbridge Township, NJ 07095, USA	2017-08-16 17:44:58.424032	2017-08-16 17:44:58.424032	(732) 726-9200	http://www.camo.com/
14	Career Techniques, Inc.	Career Techniques, Inc.	\N	\N	\N	\N	\N	2017-08-16 17:44:59.108735	2017-08-16 17:44:59.108735	\N	\N
15	CEI	CEI	\N	\N	-81.630321600000002	41.2884450000000029	6896 Miller Rd, Brecksville, OH 44141, USA	2017-08-16 17:45:02.303167	2017-08-16 17:45:02.303167	(800) 589-3101	https://www.firstenergycorp.com/illuminating_company.html
16	Celeris Solutions Group	Celeris Solutions Group	\N	\N	-71.1008180000000038	42.4935079999999985	125 Main St A, Stoneham, MA 02180, USA	2017-08-16 17:45:03.115674	2017-08-16 17:45:03.115674	(781) 438-8438	\N
17	ClearPath Workforce Management	ClearPath Workforce Management, Inc.	\N	\N	-121.235434999999995	37.7996239999999872	1215 W Center St Suite 102, Manteca, CA 95337, USA	2017-08-16 17:45:04.262539	2017-08-16 17:45:04.262539	(800) 874-7837	http://www.clearpathwm.com/
18	Clerysys Philippines Incorporated	Clerysys Incorporated	\N	\N	121.061505999999994	14.5852210000000007	22 Emerald Ave, San Antonio, Pasig, Metro Manila, Philippines	2017-08-16 17:45:05.185971	2017-08-16 17:45:05.185971	(02) 490 0032	http://www.clerysys.com/
19	Cobalt Wave Technology, LLC,	Cobalt Wave Technology, LLC,	\N	\N	\N	\N	\N	2017-08-16 17:45:05.81962	2017-08-16 17:45:05.81962	\N	\N
20	Informatics Inc	Confirmatics Inc	\N	\N	-96.6932321999999971	33.0122621000000009	1400 10th St, Plano, TX 75074, USA	2017-08-16 17:45:07.179828	2017-08-16 17:45:07.179828	(972) 881-5500	http://www.informatics-inc.com/
21	CUNY College of Staten Island	CSI 	\N	\N	-74.1484904	40.6018151999999972	2800 Victory Boulevard, Staten Island, NY 10314, USA	2017-08-16 17:45:10.258609	2017-08-16 17:45:10.258609	(718) 982-2000	http://www.csi.cuny.edu/
22	Custom Staffing Bellefontaine Inc	Custom Satffing, Inc	\N	\N	-83.7597864999999899	40.3749972000000028	165 Reynolds Ave # 1, Bellefontaine, OH 43311, USA	2017-08-16 17:45:13.890322	2017-08-16 17:45:13.890322	(937) 592-5006	http://mycustomstaffing.com/
23	Daugherty	Daugherty	\N	\N	-75.6681359999999898	37.6899950000000032	Daugherty, VA 23301, USA	2017-08-16 17:45:14.967605	2017-08-16 17:45:14.967605	\N	\N
24	Domani Tech Inc	DomaniTech, Inc.	\N	\N	-73.9908999999999963	40.7539682000000028	241 W 37th St, New York, NY 10018, USA	2017-08-16 17:45:15.837611	2017-08-16 17:45:15.837611	(212) 852-8869	\N
25	Domingos E Goncalves Solucoes EM INFORMATICA LTDA	Domingos E Goncalves Solucoes EM INFORMATICA LTDA	\N	\N	\N	\N	\N	2017-08-16 17:45:16.350719	2017-08-16 17:45:16.350719	\N	\N
26	Dtn Market Access	DTN Market Access	\N	\N	-93.4169017999999909	44.8586562999999998	11000 W 78th St, Eden Prairie, MN 55344, USA	2017-08-16 17:45:17.155544	2017-08-16 17:45:17.155544	(952) 278-6640	\N
27	e-Core Desenvolvimento de Software	e-Core Desenvolvimento de Software	\N	\N	-51.1821776999999898	-30.0259892000000015	Av. Carlos Gomes, 466 - Auxiliadora, Porto Alegre - RS, 90480-000, Brazil	2017-08-16 17:45:18.073864	2017-08-16 17:45:18.073864	(51) 2103-9103	http://www.e-core.com/pt
28	Core It Solutions LLC	eCore IT Solutions, LLC	\N	\N	-81.872721999999996	41.3055949000000027	Strongsville, OH 44149, USA	2017-08-16 17:45:18.811392	2017-08-16 17:45:18.811392	(440) 572-1384	http://www.coreitus.com/
29	EcoSys	EcoSys Management LLC	\N	\N	-73.982360099999994	40.760949399999987	135 W 50th St, New York, NY 10020, USA	2017-08-16 17:45:20.45431	2017-08-16 17:45:20.45431	(646) 776-7000	http://www.ecosys.net/
30	Egar Technology	Egar Technology, Inc.	\N	\N	-73.9662024000000002	40.7526407000000006	866 United Nations Plaza, New York, NY 10017, USA	2017-08-16 17:45:21.483387	2017-08-16 17:45:21.483387	(212) 223-3552	http://www.egartech.com/
31	Examination Management Services Inc	Emassi Inc.	\N	\N	-96.9183203999999989	32.8994656000000134	11498 Luna Rd, Farmers Branch, TX 75234, USA	2017-08-16 17:45:25.589833	2017-08-16 17:45:25.589833	(214) 373-1921	https://www.emsinet.com/
32	Eunomia M&M S.A	Eunomia M&M S.A	\N	\N	\N	\N	\N	2017-08-16 17:45:26.017058	2017-08-16 17:45:26.017058	\N	\N
33	Eurospher Tecnologia da Informação Ltda.	Eurospher Tecnologia da Informação Ltda.	\N	\N	\N	\N	\N	2017-08-16 17:45:26.70939	2017-08-16 17:45:26.70939	\N	\N
34	FH Consulting GmbH	FH Consulting GmbH	\N	\N	9.43456419999999873	48.8777088000000006	Im Aupperle 18, 71364 Winnenden, Germany	2017-08-16 17:45:27.785339	2017-08-16 17:45:27.785339	\N	\N
35	FI & Co. Finance und Controlling AG	FI & CO Finance & Controlling AG	\N	\N	8.31014180000000202	46.9946058000000022	Obermattweg 12, 6052 Hergiswil, Switzerland	2017-08-16 17:45:28.632351	2017-08-16 17:45:28.632351	\N	\N
36	Forstar Resources Ltd	Forstar Resources LTD	\N	\N	-73.9842177000000163	40.7423611999999977	381 Park Ave S #721, New York, NY 10016, USA	2017-08-16 17:45:29.470785	2017-08-16 17:45:29.470785	(212) 981-1500	http://www.forstar.com/
37	The Forum Group	Forum Personnel Inc.	\N	\N	-73.9811227000000002	40.7506831999999974	260 Madison Ave # 200, New York, NY 10016, USA	2017-08-16 17:45:30.239514	2017-08-16 17:45:30.239514	(212) 687-4050	http://forumgrp.com/
38	Greenbee Enterprises Ltd	GreenBee LTD	\N	\N	-6.00392690000000062	54.7478699999999989	Dennisons Insdustrial Estate, Avondale Drive, Ballyclare BT39 9EB, UK	2017-08-16 17:45:30.999371	2017-08-16 17:45:30.999371	\N	\N
39	Helios and Matheson Analytics Inc.	Helios & Matheson North America Inc.	\N	\N	-73.9856563999999963	40.7486764000000008	350 5th Ave, New York, NY 10018, USA	2017-08-16 17:45:32.050575	2017-08-16 17:45:32.050575	(212) 979-8228	http://www.hmny.com/
40	Hyatt Leader Ltd	Hyatt Leader LTD	\N	\N	-73.9756082999999904	40.749750800000001	622 3rd Ave # 3402, New York, NY 10017, USA	2017-08-16 17:45:32.9712	2017-08-16 17:45:32.9712	(212) 993-8010	http://hyattleader.com/
41	IBI Group	IBI 	\N	\N	-80.1410389999999921	26.266292	2200 Park Central Blvd N # 100, Pompano Beach, FL 33064, USA	2017-08-16 17:45:37.419114	2017-08-16 17:45:37.419114	(954) 974-2200	http://www.ibigroup.com/
42	Idexcel - iTech Consuling Group, Inc. 	Idexcel - iTech Consuling Group, Inc. 	\N	\N	\N	\N	\N	2017-08-16 17:45:38.123944	2017-08-16 17:45:38.123944	\N	\N
43	Scheer GmbH	IDS Scheer	\N	\N	7.04369399999999857	49.2581982000000025	Uni-Campus Nord D5.1, 66123 Saarbrücken, Germany	2017-08-16 17:45:40.503873	2017-08-16 17:45:40.503873	0681 967770	http://www.scheer-group.com/
44	Infosys Technologies Ltd	Infosys Technologies Limited	\N	\N	-95.560921399999998	29.7109804000000004	6002 Rogerdale Rd, Houston, TX 77072, USA	2017-08-16 17:45:44.0138	2017-08-16 17:45:44.0138	(281) 561-2550	https://www.infosys.com/
45	Ishi Systems, Inc.	Ishi Systems Inc.	\N	\N	-74.0348357999999962	40.7188200000000009	185 Hudson St, Jersey City, NJ 07302, USA	2017-08-16 17:45:45.378419	2017-08-16 17:45:45.378419	(201) 332-6900	http://www.ishisystems.com/
46	iSolve Technologies Private Limited	iSolve Services  Private Limited	\N	\N	80.259641000000002	13.0426859999999998	3A, KG Business Centre 65, TTK Road, Alwarpet, CIT Colony, Mylapore, Chennai, Tamil Nadu 600018, India	2017-08-16 17:45:46.450279	2017-08-16 17:45:46.450279	044 2498 3672	http://www.isolvetechnologies.net/
47	It-Happens Kft	IT Happens KFT 	\N	\N	19.1306703999999996	47.4601307000000006	Budapest, Kábel u. 6, 1192 Hungary	2017-08-16 17:45:47.061032	2017-08-16 17:45:47.061032	(20) 365 8665	\N
48	iTech Solutions, Inc.	iTech Solutions, Inc.	\N	\N	-72.812407499999992	41.7099416000000005	20 Stanford Dr, Farmington, CT 06032, USA	2017-08-16 17:45:47.973584	2017-08-16 17:45:47.973584	(860) 674-1636	http://www.itechsolutions.com/
49	Friedman Joel E	Joel H Friedman	\N	\N	-71.0690443999999957	42.3514586000000079	20 Park Plaza Suite 466, Boston, MA 02116, USA	2017-08-16 17:45:49.014377	2017-08-16 17:45:49.014377	(617) 948-2151	\N
50	2 Partners Rd	K-2 Partners	\N	\N	-73.8568432000000001	41.5938972999999876	2 Partners Rd, Wappingers Falls, NY 12590, USA	2017-08-16 17:45:49.856363	2017-08-16 17:45:49.856363	\N	\N
51	Kennedy / De Almeida, LLC	Kennedy / De Almeida, LLC	\N	\N	\N	\N	\N	2017-08-16 17:45:50.382371	2017-08-16 17:45:50.382371	\N	\N
52	L＆T	L&T 	\N	\N	139.721851799999996	35.6598419999999976	Japan, 〒106-0031 Tōkyō-to, Minato-ku, Nishiazabu, 2 Chome−25−２２ 西麻布2522ビル B1F	2017-08-16 17:45:55.799122	2017-08-16 17:45:55.799122	03-3797-6626	http://www.larsentoubro.com/
53	Lancaster Systems Inc	Lancaster Systems, Inc.	\N	\N	-73.7006167999999917	40.9735865000000032	411 Theodore Fremd Ave # 2, Rye, NY 10580, USA	2017-08-16 17:45:56.502416	2017-08-16 17:45:56.502416	(914) 967-5700	http://www.lancastersys.com/
54	LCI Language Centers - Houston	LCI 	\N	\N	-95.393843099999998	29.7397798999999914	3618 Mt Vernon St, Houston, TX 77006, USA	2017-08-16 17:46:00.771714	2017-08-16 17:46:00.771714	(832) 571-1007	http://www.englishlci.edu/about-lci/houston-texas
55	Leading Edge Communications, LLC	Leading Edge Communications Corp.	\N	\N	-86.8692410000000024	35.9275140000000022	206 Bridge St, Franklin, TN 37064, USA	2017-08-16 17:46:01.976416	2017-08-16 17:46:01.976416	(615) 790-3718	\N
56	Lekha Ink, Corp.	Lekha, Inc.	\N	\N	-121.977006900000006	37.2907474999999877	4204 Latimer Ave, San Jose, CA 95130, USA	2017-08-16 17:46:02.746182	2017-08-16 17:46:02.746182	(408) 429-8880	http://www.lekhaink.com/
57	Letse	Letse	\N	\N	88.4304142000000013	22.5816961999999997	Room No. 801, RDB Boulevard, 8th Floor, Plot K-1,, Sector V, Block EP & GP, Salt Lake City, BN Block, Sector V, Salt Lake City, Kolkata, West Bengal 700091, India	2017-08-16 17:46:03.571806	2017-08-16 17:46:03.571806	033 6637 4949	http://www.letse.com/
58	Lloyd's Register Fairplay	Lloyd's Register - Fairplay	\N	\N	103.845031500000005	1.2730459999999999	78 Shenton Way, Singapore 079120	2017-08-16 17:46:04.772301	2017-08-16 17:46:04.772301	6576 5300	http://www.ihsfairplay.com/Shopping_Basket/basket.aspx
59	Masfin Consulting, Inc	Masfin Consulting, Inc	\N	\N	\N	\N	\N	2017-08-16 17:46:05.41347	2017-08-16 17:46:05.41347	\N	\N
60	Moakley Consulting Solutions, LLC	Moakley Consulting Solutions, LLC	\N	\N	\N	\N	\N	2017-08-16 17:46:06.090833	2017-08-16 17:46:06.090833	\N	\N
61	NEC Corporation of America	NEC Solutions , Inc.	\N	\N	-96.9995040000000017	32.9126263000000066	3929 W John Carpenter Fwy, Irving, TX 75063, USA	2017-08-16 17:46:08.671177	2017-08-16 17:46:08.671177	(214) 262-6000	https://www.necam.com/
62	NEORIS	Neoris	\N	\N	-80.2958490999999981	25.7789965999999993	703 Waterford Way #700, Miami, FL 33126, USA	2017-08-16 17:46:11.363814	2017-08-16 17:46:11.363814	(305) 728-6000	http://www.neoris.com/
63	Aspect Contact Centre Software India	New Aspects of Software	\N	\N	77.1041697000000141	28.4832406999999996	Garden Estate, DLF Phase 3, Sector 24, Gurugram, Haryana 122002, India	2017-08-16 17:46:11.9472	2017-08-16 17:46:11.9472	\N	\N
64	Perficient, Inc.	Perficient, Inc.	\N	\N	-93.2750719000000004	44.9802325000000067	100 N 6th St, Minneapolis, MN 55403, USA	2017-08-16 17:46:16.349692	2017-08-16 17:46:16.349692	(612) 752-1700	http://www.perficient.com/
65	Peter J. Mancuso, DPM	Peter Mancuso	\N	\N	-73.2513239999999968	40.779792999999998	620 Suffolk Ave, Brentwood, NY 11717, USA	2017-08-16 17:46:17.406749	2017-08-16 17:46:17.406749	(631) 231-1401	\N
66	Portland Resourcing Ltd	Portland Resourcing Limited	\N	\N	-0.143783500000000009	51.5218765999999988	4th Floor Devon House, 171-177 Great Portland Street, Marylebone, London W1W 5PQ, UK	2017-08-16 17:46:18.365779	2017-08-16 17:46:18.365779	020 7580 1837	http://www.portlandresourcing.com/
67	Project One, Inc.	Project One, Inc.	\N	\N	-73.990610899999993	40.7515995999999987	450 7th Ave, New York, NY 10123, USA	2017-08-16 17:46:19.050741	2017-08-16 17:46:19.050741	(212) 268-5800	http://www.project1.com/
68	PwC	PWC 	\N	\N	-71.0451881999999983	42.3511621999999974	101 Seaport Blvd, Boston, MA 02210, USA	2017-08-16 17:50:32.844495	2017-08-16 17:50:32.844495	(617) 530-5000	http://www.pwc.com/
69	Recruit 121	Recruit 121 Limited	\N	\N	-3.17766139999999986	51.4829393999999994	14, Capital Tower, Greyfriars Rd, Cardiff CF10 3AG, UK	2017-08-16 17:50:33.761007	2017-08-16 17:50:33.761007	029 2049 6121	http://www.recruit121.com/
70	Savitar Consulting, LLC	Savitar Consulting, LLC	\N	\N	\N	\N	\N	2017-08-16 17:50:34.205852	2017-08-16 17:50:34.205852	\N	\N
71	Semafor Technologies	Semafor Technologies	\N	\N	\N	\N	\N	2017-08-16 17:50:34.833853	2017-08-16 17:50:34.833853	\N	\N
72	Servicon Systems Inc	Servicon	\N	\N	-118.386284599999996	34.0264785000000032	3965 Landmark St, Culver City, CA 90232, USA	2017-08-16 17:50:35.634859	2017-08-16 17:50:35.634859	(310) 204-5040	http://serviconsystems.com/
73	Spring Garden Apartments	SGA 	\N	\N	-79.8148786999999942	36.0654372000000123	1540 Spring Garden St, Greensboro, NC 27403, USA	2017-08-16 17:50:36.458877	2017-08-16 17:50:36.458877	\N	\N
74	Silver Search Inc	Silversearch, Inc.	\N	\N	-73.9728199999999987	40.8651750999999877	2 Executive Dr # 705, Fort Lee, NJ 07024, USA	2017-08-16 17:50:37.222853	2017-08-16 17:50:37.222853	(201) 947-7050	https://www.silversearchinc.com/
75	SMB Services LLC	SMB Services LLC	\N	\N	-96.9459149999999994	32.8122569999999882	212 S Main St, Irving, TX 75060, USA	2017-08-16 17:50:38.040088	2017-08-16 17:50:38.040088	(972) 259-4000	http://smbservices.org/main/SMBS-PAGE.ASP?P=5
76	Softworld Inc	Softworld, Inc.	\N	\N	-71.2552908999999914	42.4004353999999992	281 Winter St Suite 301, Waltham, MA 02451, USA	2017-08-16 17:50:39.009978	2017-08-16 17:50:39.009978	(781) 466-8882	http://www.softworldinc.com/
77	Sogeti USA LLC	Sogeti USA LLC	\N	\N	-87.9029747999999955	41.8454677000000004	4 Westbrook Corporate Center #800, Westchester, IL 60154, USA	2017-08-16 17:50:41.66935	2017-08-16 17:50:41.66935	(708) 531-0011	https://www.us.sogeti.com/who-we-are/locations/
78	Sovereign Technologies Inc	Sovereign Technologies	\N	\N	-90.3751869999999968	38.5382399999999876	11414 Gravois Rd, Sappington, MO 63126, USA	2017-08-16 17:50:42.349724	2017-08-16 17:50:42.349724	(314) 842-5995	http://sovereigntec.com/
79	Spock Advisors  LLC	Spock Advisors  LLC	\N	\N	\N	\N	\N	2017-08-16 17:50:42.869517	2017-08-16 17:50:42.869517	\N	\N
80	Spring Lake Consulting LLC	Spring Lake Consulting, LLC	\N	\N	-73.989381999999992	40.7534644999999998	512 Fashion Ave, New York, NY 10018, USA	2017-08-16 17:50:43.615089	2017-08-16 17:50:43.615089	(212) 389-2300	\N
81	SQS USA, Inc.	SQS 	\N	\N	-84.4193322999999936	38.0268562999999986	2720 Old Rosebud Rd STE 300, Lexington, KY 40509, USA	2017-08-16 17:50:45.795827	2017-08-16 17:50:45.795827	(859) 317-9504	https://www.sqs.com/en/index.php
82	SGS North America Inc	SQS North Amercia, LLC	\N	\N	-74.1015439999999899	40.8171020000000127	201 NJ-17, Rutherford, NJ 07070, USA	2017-08-16 17:50:49.133056	2017-08-16 17:50:49.133056	(201) 508-3000	http://www.us.sgs.com/
83	Stefanini International Corporation	Stefanini International Corp.	\N	\N	-80.1513597000000004	26.2055925999999992	6301 NW 5th Way # 2700, Fort Lauderdale, FL 33309, USA	2017-08-16 17:50:49.906235	2017-08-16 17:50:49.906235	(954) 229-9150	https://stefanini.com/
84	Stockell Consulting	Stockell Information Systems, Inc.	\N	\N	-90.5517679999999956	38.6505397999999971	15400 S Outer Forty # 105, Chesterfield, MO 63017, USA	2017-08-16 17:50:50.794817	2017-08-16 17:50:50.794817	(636) 537-9100	http://stockellconsulting.com/
85	Syncro Medical	Syncro Technologies	\N	\N	-74.8800339999999949	40.1880169999999879	886 Town Center Dr, Langhorne, PA 19047, USA	2017-08-16 17:50:51.624832	2017-08-16 17:50:51.624832	(888) 770-9350	http://www.syncro.com/
86	The Churchill Benefit Corporation 	The Churchill Benefit Corporation 	\N	\N	\N	\N	\N	2017-08-16 17:50:52.460384	2017-08-16 17:50:52.460384	\N	\N
87	TIBCO Software Inc	Tibco	\N	\N	-73.9838730000000027	40.7570431999999983	120 W 45th St # 18, New York, NY 10036, USA	2017-08-16 17:50:56.152855	2017-08-16 17:50:56.152855	(646) 495-2600	http://www.tibco.com/
88	TITAN Technology Partners Corporation	Titan Technology Partners, Limited	\N	\N	-80.925622699999991	35.1839779000000021	2105 Water Ridge Pkwy # 500, Charlotte, NC 28217, USA	2017-08-16 17:50:57.223746	2017-08-16 17:50:57.223746	(704) 357-7705	https://velocitycloud.com/resources/blog/velocity-welcomes-titan-to-the-company
89	Alcohol and Tobacco Tax and Trade Bureau	Treasury & Trade	\N	\N	-77.0304909999999978	38.898021	1310 G Street, Washington, DC 20004, USA	2017-08-16 17:50:58.929901	2017-08-16 17:50:58.929901	\N	https://www.ttb.gov/
90	TSR Consulting Services Inc	TSR Consulting Services, Inc.	\N	\N	-74.3338846999999987	40.5619297000000003	379 Thornall St # 6, Edison, NJ 08837, USA	2017-08-16 17:51:00.076306	2017-08-16 17:51:00.076306	(732) 321-9000	http://www.tsrconsulting.com/
91	Basic Vision System Group Co., LTD.	Vision Systems Group	\N	\N	100.421302699999998	13.9063166999999996	Sano Loi, Bang Bua Thong District, Nonthaburi 11110, Thailand	2017-08-16 17:51:00.841878	2017-08-16 17:51:00.841878	\N	\N
92	Wan Zhang Enterprise Sdn.bhd	Wan Zhang	\N	\N	110.453751499999996	1.59239979999999992	1148, Jln Demak Maju, Demak Industrial Park Phase III, 93050 Kuching, Sarawak, Malaysia	2017-08-16 17:51:01.557202	2017-08-16 17:51:01.557202	082-433 299	http://www.wanzhang.com.my/
93	Lincoln Pediatric Group: Swisher William P MD	William Swisher	\N	\N	-96.6264339999999891	40.7675120000000035	4501 S 70th St # 110, Lincoln, NE 68516, USA	2017-08-16 17:51:02.298152	2017-08-16 17:51:02.298152	(402) 489-3834	http://lincolnpedsgroup.com/
94	WAND Corporation	WNAF Corporation	\N	\N	-93.4662000000000006	44.8662690000000026	7575 Corporate Way, Eden Prairie, MN 55344, USA	2017-08-16 17:51:03.322934	2017-08-16 17:51:03.322934	(800) 786-9263	http://www.wandcorp.com/
95	York Solutions - IT Consulting Firm	York Solutions	\N	\N	-87.905588999999992	41.8468688999999969	1 Westbrook Corporate Center, Westchester, IL 60154, USA	2017-08-16 17:51:04.189476	2017-08-16 17:51:04.189476	(708) 531-8362	http://www.yorksolutions.net/
\.


--
-- Name: vendors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: contractually
--

SELECT pg_catalog.setval('vendors_id_seq', 95, true);


--
-- Name: agreements agreements_pkey; Type: CONSTRAINT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY agreements
    ADD CONSTRAINT agreements_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: consultants consultants_pkey; Type: CONSTRAINT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY consultants
    ADD CONSTRAINT consultants_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: vendors vendors_pkey; Type: CONSTRAINT; Schema: public; Owner: contractually
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);


--
-- Name: index_consultants_on_vendor_id; Type: INDEX; Schema: public; Owner: contractually
--

CREATE INDEX index_consultants_on_vendor_id ON consultants USING btree (vendor_id);


--
-- Name: vendor_anc_desc_udx; Type: INDEX; Schema: public; Owner: contractually
--

CREATE UNIQUE INDEX vendor_anc_desc_udx ON vendor_hierarchies USING btree (ancestor_id, descendant_id, generations);


--
-- Name: vendor_desc_idx; Type: INDEX; Schema: public; Owner: contractually
--

CREATE INDEX vendor_desc_idx ON vendor_hierarchies USING btree (descendant_id);


--
-- PostgreSQL database dump complete
--

