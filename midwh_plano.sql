--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

-- Started on 2025-08-01 21:25:07

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 50829)
-- Name: dim_actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_actor (
    actor_id integer NOT NULL,
    full_name character varying,
    fecha_carga timestamp without time zone,
    film_id integer
);


ALTER TABLE public.dim_actor OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 50834)
-- Name: dim_customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_customer (
    customer_id integer NOT NULL,
    full_name character varying,
    active boolean,
    country character varying,
    city character varying,
    fecha_carga timestamp without time zone
);


ALTER TABLE public.dim_customer OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 50839)
-- Name: dim_film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_film (
    film_id integer NOT NULL,
    title character varying(255),
    release_year integer,
    rental_rate numeric(4,2),
    length smallint,
    rating character varying,
    fecha_carga timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    category character varying,
    language character varying
);


ALTER TABLE public.dim_film OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 50845)
-- Name: dim_staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_staff (
    staff_id integer NOT NULL,
    full_name character varying,
    store_id integer,
    active boolean,
    fecha_carga timestamp without time zone
);


ALTER TABLE public.dim_staff OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 50850)
-- Name: dim_store; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_store (
    store_id integer NOT NULL,
    manager character varying,
    country character varying,
    city character varying,
    fecha_carga timestamp without time zone
);


ALTER TABLE public.dim_store OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 50929)
-- Name: dim_tiempo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dim_tiempo (
    tiempo_id integer NOT NULL,
    fecha date NOT NULL,
    anio integer,
    trimestre integer,
    mes integer,
    nombre_mes character varying(20),
    dia integer,
    nombre_dia character varying(20),
    dia_semana integer,
    es_fin_de_semana boolean
);


ALTER TABLE public.dim_tiempo OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 50942)
-- Name: fact_inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_inventory (
    tiempo_id integer,
    store_id integer,
    film_id integer,
    cantidad integer
);


ALTER TABLE public.fact_inventory OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 50861)
-- Name: fact_rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fact_rental (
    rental_id integer NOT NULL,
    tiempo_id integer,
    customer_id integer,
    staff_id integer,
    fecha_carga timestamp without time zone,
    rental_date_id integer,
    payment_amount numeric(5,2),
    payment_date_id integer
);


ALTER TABLE public.fact_rental OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 75578)
-- Name: geography; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geography (
    geography_id integer,
    country character varying,
    city character varying,
    postal_code character varying,
    address character varying
);


ALTER TABLE public.geography OWNER TO postgres;

--
-- TOC entry 4892 (class 0 OID 50829)
-- Dependencies: 217
-- Data for Name: dim_actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_actor (actor_id, full_name, fecha_carga, film_id) FROM stdin;
103	MATTHEW                                       LEIGH                                        	2025-07-24 21:53:58.672	956
2	NICK                                          WAHLBERG                                     	2025-07-24 21:53:58.689	958
88	KENNETH                                       PESCI                                        	2025-07-24 21:53:58.791	968
20	LUCILLE                                       TRACY                                        	2025-07-24 21:53:58.858	977
19	BOB                                           FAWCETT                                      	2025-07-24 21:53:58.597	877
1	PENELOPE                                      GUINESS                                      	2025-07-24 21:53:58.877	980
59	DUSTIN                                        TAUTOU                                       	2025-07-24 21:53:58.913	984
147	FAY                                           WINSLET                                      	2025-07-24 21:53:58.936	987
123	JULIANNE                                      DENCH                                        	2025-07-24 21:53:58.941	988
181	MATTHEW                                       CARREY                                       	2025-07-24 21:53:58.941	991
51	GARY                                          PHOENIX                                      	2025-07-24 21:53:58.941	993
200	THORA                                         TEMPLE                                       	2025-07-24 21:53:58.941	993
198	MARY                                          KEITEL                                       	2025-07-24 21:53:58.941	997
197	REESE                                         WEST                                         	2025-07-24 21:53:58.941	995
53	MENA                                          TEMPLE                                       	2025-07-24 21:53:58.885	980
23	SANDRA                                        KILMER                                       	2025-07-24 21:53:58.941	997
169	KENNETH                                       HOFFMAN                                      	2025-07-24 21:53:58.941	998
52	CARMEN                                        HUNT                                         	2025-07-24 21:53:58.941	999
64	RAY                                           JOHANSSON                                    	2025-07-24 21:53:58.888	980
144	ANGELA                                        WITHERSPOON                                  	2025-07-24 21:53:58.643	953
139	EWAN                                          GOODING                                      	2025-07-24 21:53:58.597	892
160	CHRIS                                         DEPP                                         	2025-07-24 21:53:58.656	954
162	OPRAH                                         KILMER                                       	2025-07-24 21:53:58.797	968
43	KIRK                                          JOVOVICH                                     	2025-07-24 21:53:58.69	958
68	RIP                                           WINSLET                                      	2025-07-24 21:53:58.826	971
104	PENELOPE                                      CRONYN                                       	2025-07-24 21:53:58.941	999
185	MICHAEL                                       BOLGER                                       	2025-07-24 21:53:58.841	973
130	GRETA                                         KEITEL                                       	2025-07-24 21:53:58.899	981
99	JIM                                           MOSTEL                                       	2025-07-24 21:53:58.904	982
10	CHRISTIAN                                     GABLE                                        	2025-07-24 21:53:58.906	983
5	JOHNNY                                        LOLLOBRIGIDA                                 	2025-07-24 21:53:58.597	865
55	FAY                                           KILMER                                       	2025-07-24 21:53:58.734	963
21	KIRSTEN                                       PALTROW                                      	2025-07-24 21:53:58.907	983
22	ELVIS                                         MARX                                         	2025-07-24 21:53:58.741	964
45	REESE                                         KILMER                                       	2025-07-24 21:53:58.864	978
96	GENE                                          WILLIS                                       	2025-07-24 21:53:58.931	987
110	SUSAN                                         DAVIS                                        	2025-07-24 21:53:58.932	987
108	WARREN                                        NOLTE                                        	2025-07-24 21:53:58.762	966
62	JAYNE                                         NEESON                                       	2025-07-24 21:53:58.941	990
100	SPENCER                                       DEPP                                         	2025-07-24 21:53:58.941	992
81	SCARLETT                                      DAMON                                        	2025-07-24 21:53:58.597	910
159	LAURA                                         BRODY                                        	2025-07-24 21:53:58.87	978
192	JOHN                                          SUVARI                                       	2025-07-24 21:53:58.596	819
174	MICHAEL                                       BENING                                       	2025-07-24 21:53:58.905	982
94	KENNETH                                       TORN                                         	2025-07-24 21:53:58.941	989
25	KEVIN                                         BLOOM                                        	2025-07-24 21:53:58.597	914
69	KENNETH                                       PALTROW                                      	2025-07-24 21:53:58.597	914
188	ROCK                                          DUKAKIS                                      	2025-07-24 21:53:58.941	989
77	CARY                                          MCCONAUGHEY                                  	2025-07-24 21:53:58.941	993
137	MORGAN                                        WILLIAMS                                     	2025-07-24 21:53:58.597	917
90	SEAN                                          GUINESS                                      	2025-07-24 21:53:58.597	925
114	MORGAN                                        MCDORMAND                                    	2025-07-24 21:53:58.941	993
191	GREGORY                                       GOODING                                      	2025-07-24 21:53:58.941	993
117	RENEE                                         TRACY                                        	2025-07-24 21:53:58.597	926
28	WOODY                                         HOFFMAN                                      	2025-07-24 21:53:58.941	994
124	SCARLETT                                      BENING                                       	2025-07-24 21:53:58.941	997
142	JADA                                          RYDER                                        	2025-07-24 21:53:58.941	999
176	JON                                           CHASE                                        	2025-07-24 21:53:58.597	946
36	BURT                                          DUKAKIS                                      	2025-07-24 21:53:58.666	956
177	GENE                                          MCKELLEN                                     	2025-07-24 21:53:58.675	956
109	SYLVESTER                                     DERN                                         	2025-07-24 21:53:58.781	967
167	LAURENCE                                      BULLOCK                                      	2025-07-24 21:53:58.597	923
148	EMILY                                         DEE                                          	2025-07-24 21:53:58.596	792
67	JESSICA                                       BAILEY                                       	2025-07-24 21:53:58.896	981
4	JENNIFER                                      DAVIS                                        	2025-07-24 21:53:58.597	924
47	JULIA                                         BARRYMORE                                    	2025-07-24 21:53:58.834	973
113	MORGAN                                        HOPKINS                                      	2025-07-24 21:53:58.898	981
164	HUMPHREY                                      WILLIS                                       	2025-07-24 21:53:58.918	984
184	HUMPHREY                                      GARLAND                                      	2025-07-24 21:53:58.927	985
112	RUSSELL                                       BACALL                                       	2025-07-24 21:53:58.941	988
161	HARVEY                                        HOPE                                         	2025-07-24 21:53:58.597	927
154	MERYL                                         GIBSON                                       	2025-07-24 21:53:58.941	988
157	GRETA                                         MALDEN                                       	2025-07-24 21:53:58.84	973
42	TOM                                           MIRANDA                                      	2025-07-24 21:53:58.597	932
189	CUBA                                          BIRCH                                        	2025-07-24 21:53:58.597	940
7	GRACE                                         MOSTEL                                       	2025-07-24 21:53:58.699	959
9	JOE                                           SWANK                                        	2025-07-24 21:53:58.842	974
126	FRANCES                                       TOMEI                                        	2025-07-24 21:53:58.597	860
141	CATE                                          HARRIS                                       	2025-07-24 21:53:58.941	992
179	ED                                            GUINESS                                      	2025-07-24 21:53:58.854	976
135	RITA                                          REYNOLDS                                     	2025-07-24 21:53:58.597	905
105	SIDNEY                                        CROWE                                        	2025-07-24 21:53:58.941	994
190	AUDREY                                        BAILEY                                       	2025-07-24 21:53:58.706	959
38	TOM                                           MCKELLEN                                     	2025-07-24 21:53:58.597	876
102	WALTER                                        TORN                                         	2025-07-24 21:53:58.891	980
122	SALMA                                         NOLTE                                        	2025-07-24 21:53:58.941	998
140	WHOOPI                                        HURT                                         	2025-07-24 21:53:58.941	999
150	JAYNE                                         NOLTE                                        	2025-07-24 21:53:58.727	962
128	CATE                                          MCQUEEN                                      	2025-07-24 21:53:58.753	965
163	CHRISTOPHER                                   WEST                                         	2025-07-24 21:53:58.941	996
129	DARYL                                         CRAWFORD                                     	2025-07-24 21:53:58.725	962
170	MENA                                          HOPPER                                       	2025-07-24 21:53:58.941	996
180	JEFF                                          SILVERSTONE                                  	2025-07-24 21:53:58.737	963
111	CAMERON                                       ZELLWEGER                                    	2025-07-24 21:53:58.837	973
175	WILLIAM                                       HACKMAN                                      	2025-07-24 21:53:58.941	998
107	GINA                                          DEGENERES                                    	2025-07-24 21:53:58.861	977
66	MARY                                          TANDY                                        	2025-07-24 21:53:58.941	999
155	IAN                                           TANDY                                        	2025-07-24 21:53:58.941	1000
125	ALBERT                                        NOLTE                                        	2025-07-24 21:53:58.752	965
156	FAY                                           WOOD                                         	2025-07-24 21:53:58.596	844
32	TIM                                           HACKMAN                                      	2025-07-24 21:53:58.88	980
49	ANNE                                          CRONYN                                       	2025-07-24 21:53:58.883	980
183	RUSSELL                                       CLOSE                                        	2025-07-24 21:53:58.91	983
15	CUBA                                          OLIVIER                                      	2025-07-24 21:53:58.92	985
82	WOODY                                         JOLIE                                        	2025-07-24 21:53:58.922	985
182	DEBBIE                                        AKROYD                                       	2025-07-24 21:53:58.941	990
149	RUSSELL                                       TEMPLE                                       	2025-07-24 21:53:58.941	992
76	ANGELINA                                      ASTAIRE                                      	2025-07-24 21:53:58.691	958
33	MILLA                                         PECK                                         	2025-07-24 21:53:58.941	993
152	BEN                                           HARRIS                                       	2025-07-24 21:53:58.794	968
72	SEAN                                          WILLIAMS                                     	2025-07-24 21:53:58.801	969
172	GROUCHO                                       WILLIAMS                                     	2025-07-24 21:53:58.703	959
146	ALBERT                                        JOHANSSON                                    	2025-07-24 21:53:58.807	969
79	MAE                                           HOFFMAN                                      	2025-07-24 21:53:58.597	916
57	JUDE                                          CRUISE                                       	2025-07-24 21:53:58.597	918
120	PENELOPE                                      MONROE                                       	2025-07-24 21:53:58.941	994
27	JULIA                                         MCQUEEN                                      	2025-07-24 21:53:58.941	996
196	BELA                                          WALKEN                                       	2025-07-24 21:53:58.832	972
75	BURT                                          POSEY                                        	2025-07-24 21:53:58.597	920
131	JANE                                          JACKMAN                                      	2025-07-24 21:53:58.597	921
87	SPENCER                                       PECK                                         	2025-07-24 21:53:58.715	961
165	AL                                            GARLAND                                      	2025-07-24 21:53:58.728	962
56	DAN                                           HARRIS                                       	2025-07-24 21:53:58.748	965
65	ANGELA                                        HUDSON                                       	2025-07-24 21:53:58.751	965
173	ALAN                                          DREYFUSS                                     	2025-07-24 21:53:58.597	933
8	MATTHEW                                       JOHANSSON                                    	2025-07-24 21:53:58.597	936
16	FRED                                          COSTNER                                      	2025-07-24 21:53:58.773	967
118	CUBA                                          ALLEN                                        	2025-07-24 21:53:58.805	969
127	KEVIN                                         GARLAND                                      	2025-07-24 21:53:58.817	970
91	CHRISTOPHER                                   BERRY                                        	2025-07-24 21:53:58.901	982
153	MINNIE                                        KILMER                                       	2025-07-24 21:53:58.941	988
119	WARREN                                        JACKMAN                                      	2025-07-24 21:53:58.597	939
194	MERYL                                         ALLEN                                        	2025-07-24 21:53:58.597	940
92	KIRSTEN                                       AKROYD                                       	2025-07-24 21:53:58.941	991
186	JULIA                                         ZELLWEGER                                    	2025-07-24 21:53:58.941	994
13	UMA                                           WOOD                                         	2025-07-24 21:53:58.941	998
18	DAN                                           TORN                                         	2025-07-24 21:53:58.597	944
58	CHRISTIAN                                     AKROYD                                       	2025-07-24 21:53:58.597	858
171	OLYMPIA                                       PFEIFFER                                     	2025-07-24 21:53:58.647	953
50	NATALIE                                       HOPKINS                                      	2025-07-24 21:53:58.679	957
143	RIVER                                         DEAN                                         	2025-07-24 21:53:58.695	958
89	CHARLIZE                                      DENCH                                        	2025-07-24 21:53:58.852	976
97	MEG                                           HAWKE                                        	2025-07-24 21:53:58.628	951
106	GROUCHO                                       DUNST                                        	2025-07-24 21:53:58.597	934
134	GENE                                          HOPKINS                                      	2025-07-24 21:53:58.597	936
31	SISSY                                         SOBIESKI                                     	2025-07-24 21:53:58.863	978
80	RALPH                                         CRUZ                                         	2025-07-24 21:53:58.872	979
63	CAMERON                                       WRAY                                         	2025-07-24 21:53:58.895	981
60	HENRY                                         BERRY                                        	2025-07-24 21:53:58.929	986
199	JULIA                                         FAWCETT                                      	2025-07-24 21:53:58.651	953
74	MILLA                                         KEITEL                                       	2025-07-24 21:53:58.67	956
26	RIP                                           CRAWFORD                                     	2025-07-24 21:53:58.597	906
41	JODIE                                         DEGENERES                                    	2025-07-24 21:53:58.597	942
29	ALEC                                          WAYNE                                        	2025-07-24 21:53:58.597	944
132	ADAM                                          HOPPER                                       	2025-07-24 21:53:58.935	987
11	ZERO                                          CAGE                                         	2025-07-24 21:53:58.938	988
116	DAN                                           STREEP                                       	2025-07-24 21:53:58.674	956
39	GOLDIE                                        BRODY                                        	2025-07-24 21:53:58.597	920
195	JAYNE                                         SILVERSTONE                                  	2025-07-24 21:53:58.731	962
151	GEOFFREY                                      HESTON                                       	2025-07-24 21:53:58.941	989
61	CHRISTIAN                                     NEESON                                       	2025-07-24 21:53:58.941	990
158	VIVIEN                                        BASINGER                                     	2025-07-24 21:53:58.941	990
44	NICK                                          STALLONE                                     	2025-07-24 21:53:58.941	998
166	NICK                                          DEGENERES                                    	2025-07-24 21:53:58.941	1000
86	GREG                                          CHAPLIN                                      	2025-07-24 21:53:58.597	929
12	KARL                                          BERRY                                        	2025-07-24 21:53:58.597	945
121	LIZA                                          BERGMAN                                      	2025-07-24 21:53:58.766	966
78	GROUCHO                                       SINATRA                                      	2025-07-24 21:53:58.79	968
35	JUDY                                          DEAN                                         	2025-07-24 21:53:58.597	914
40	JOHNNY                                        CAGE                                         	2025-07-24 21:53:58.597	938
6	BETTE                                         NICHOLSON                                    	2025-07-24 21:53:58.941	994
115	HARRISON                                      BALE                                         	2025-07-24 21:53:58.941	994
30	SANDRA                                        PECK                                         	2025-07-24 21:53:58.597	945
3	ED                                            CHASE                                        	2025-07-24 21:53:58.941	996
84	JAMES                                         PITT                                         	2025-07-24 21:53:58.941	996
37	VAL                                           BOLGER                                       	2025-07-24 21:53:58.941	997
73	GARY                                          PENN                                         	2025-07-24 21:53:58.941	998
83	BEN                                           WILLIS                                       	2025-07-24 21:53:58.597	932
93	ELLEN                                         PRESLEY                                      	2025-07-24 21:53:58.902	982
70	MICHELLE                                      MCCONAUGHEY                                  	2025-07-24 21:53:58.743	964
178	LISA                                          MONROE                                       	2025-07-24 21:53:58.941	1000
133	RICHARD                                       PENN                                         	2025-07-24 21:53:58.636	952
95	DARYL                                         WAHLBERG                                     	2025-07-24 21:53:58.597	923
145	KIM                                           ALLEN                                        	2025-07-24 21:53:58.645	953
101	SUSAN                                         DAVIS                                        	2025-07-24 21:53:58.941	988
24	CAMERON                                       STREEP                                       	2025-07-24 21:53:58.8	969
14	VIVIEN                                        BERGEN                                       	2025-07-24 21:53:58.813	970
71	ADAM                                          GRANT                                        	2025-07-24 21:53:58.667	956
138	LUCILLE                                       DEE                                          	2025-07-24 21:53:58.941	989
17	HELEN                                         VOIGHT                                       	2025-07-24 21:53:58.7	959
54	PENELOPE                                      PINKETT                                      	2025-07-24 21:53:58.941	990
168	WILL                                          WILSON                                       	2025-07-24 21:53:58.701	959
48	FRANCES                                       DAY-LEWIS                                    	2025-07-24 21:53:58.597	926
46	PARKER                                        GOLDBERG                                     	2025-07-24 21:53:58.941	991
193	BURT                                          TEMPLE                                       	2025-07-24 21:53:58.712	960
34	AUDREY                                        OLIVIER                                      	2025-07-24 21:53:58.822	971
187	RENEE                                         BALL                                         	2025-07-24 21:53:58.857	976
136	ED                                            MANSFIELD                                    	2025-07-24 21:53:58.941	993
85	MINNIE                                        ZELLWEGER                                    	2025-07-24 21:53:58.71	960
98	CHRIS                                         BRIDGES                                      	2025-07-24 21:53:58.941	990
\.


--
-- TOC entry 4893 (class 0 OID 50834)
-- Dependencies: 218
-- Data for Name: dim_customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_customer (customer_id, full_name, active, country, city, fecha_carga) FROM stdin;
218	VERA MCCOY	t	Afghanistan	Kabul	2025-07-13 16:31:21.973
441	MARIO CHEATHAM	t	Algeria	Batna	2025-07-13 16:31:21.974
69	JUDY GRAY	t	Algeria	Bchar	2025-07-13 16:31:21.976
176	JUNE CARROLL	t	Algeria	Skikda	2025-07-13 16:31:21.978
320	ANTHONY SCHWAB	t	American Samoa	Tafuna	2025-07-13 16:31:21.978
528	CLAUDE HERZOG	t	Angola	Benguela	2025-07-13 16:31:21.978
383	MARTIN BALES	t	Angola	Namibe	2025-07-13 16:31:21.978
381	BOBBY BOUDREAU	t	Anguilla	South Hill	2025-07-13 16:31:21.978
359	WILLIE MARKHAM	t	Argentina	Almirante Brown	2025-07-13 16:31:21.978
560	JORDAN ARCHULETA	t	Argentina	Avellaneda	2025-07-13 16:31:21.978
322	JASON MORRISSEY	t	Argentina	Baha Blanca	2025-07-13 16:31:21.978
24	KIMBERLY LEE	t	Argentina	Crdoba	2025-07-13 16:31:21.978
445	MICHEAL FORMAN	t	Argentina	Escobar	2025-07-13 16:31:21.978
530	DARRYL ASHCRAFT	t	Argentina	Ezeiza	2025-07-13 16:31:21.978
89	JULIA FLORES	t	Argentina	La Plata	2025-07-13 16:31:21.978
107	FLORENCE WOODS	t	Argentina	Merlo	2025-07-13 16:31:21.978
585	PERRY SWAFFORD	t	Argentina	Quilmes	2025-07-13 16:31:21.978
243	LYDIA BURKE	t	Argentina	San Miguel de Tucumn	2025-07-13 16:31:21.978
331	ERIC ROBERT	t	Argentina	Santa F	2025-07-13 16:31:21.978
405	LEONARD SCHOFIELD	t	Argentina	Tandil	2025-07-13 16:31:21.978
219	WILLIE HOWELL	t	Argentina	Vicente Lpez	2025-07-13 16:31:21.978
41	STEPHANIE MITCHELL	t	Armenia	Yerevan	2025-07-13 16:31:21.978
173	AUDREY RAY	t	Austria	Graz	2025-07-13 16:31:21.978
159	JILL HAWKINS	t	Austria	Linz	2025-07-13 16:31:21.978
266	NORA HERRERA	t	Austria	Salzburg	2025-07-13 16:31:21.978
333	ANDREW PURDY	t	Azerbaijan	Baku	2025-07-13 16:31:21.978
334	RAYMOND MCWHORTER	t	Azerbaijan	Sumqayit	2025-07-13 16:31:21.978
590	SETH HANNON	t	Bahrain	al-Manama	2025-07-13 16:31:21.978
332	STEPHEN QUALLS	t	Bangladesh	Dhaka	2025-07-13 16:31:21.978
329	FRANK WAGGONER	t	Bangladesh	Jamalpur	2025-07-13 16:31:21.978
21	MICHELLE CLARK	t	Bangladesh	Tangail	2025-07-13 16:31:21.978
527	CORY MEEHAN	t	Belarus	Mogiljov	2025-07-13 16:31:21.978
144	CLARA SHAW	t	Belarus	Molodetno	2025-07-13 16:31:21.978
455	JON WILES	t	Bolivia	El Alto	2025-07-13 16:31:21.978
431	JOEL FRANCISCO	t	Bolivia	Sucre	2025-07-13 16:31:21.978
551	CLAYTON BARBEE	t	Brazil	Alvorada	2025-07-13 16:31:21.978
307	JOSEPH JOY	t	Brazil	Angra dos Reis	2025-07-13 16:31:21.978
229	TAMARA NGUYEN	t	Brazil	Anpolis	2025-07-13 16:31:21.978
216	NATALIE MEYER	t	Brazil	Aparecida de Goinia	2025-07-13 16:31:21.978
77	JANE BENNETT	t	Brazil	Araatuba	2025-07-13 16:31:21.978
398	ANTONIO MEEK	t	Brazil	Bag	2025-07-13 16:31:21.978
362	NICHOLAS BARFIELD	t	Brazil	Belm	2025-07-13 16:31:21.978
206	TERRI VASQUEZ	t	Brazil	Blumenau	2025-07-13 16:31:21.978
342	HAROLD MARTINO	t	Brazil	Boa Vista	2025-07-13 16:31:21.978
325	TIMOTHY BUNN	t	Brazil	Braslia	2025-07-13 16:31:21.978
92	TINA SIMMONS	t	Brazil	Goinia	2025-07-13 16:31:21.978
427	JESUS MCCARTNEY	t	Brazil	Guaruj	2025-07-13 16:31:21.978
130	CHARLOTTE HUNTER	t	Brazil	guas Lindas de Gois	2025-07-13 16:31:21.978
310	DANIEL CABRAL	t	Brazil	Ibirit	2025-07-13 16:31:21.978
47	FRANCES PARKER	t	Brazil	Juazeiro do Norte	2025-07-13 16:31:21.978
591	KENT ARSENAULT	t	Brazil	Juiz de Fora	2025-07-13 16:31:21.978
183	IDA ANDREWS	t	Brazil	Luzinia	2025-07-13 16:31:21.978
246	MARIAN MENDOZA	t	Brazil	Maring	2025-07-13 16:31:21.978
126	ELLEN SIMPSON	t	Brazil	Po	2025-07-13 16:31:21.978
254	MAXINE SILVA	t	Brazil	Poos de Caldas	2025-07-13 16:31:21.978
74	DENISE KELLY	t	Brazil	Rio Claro	2025-07-13 16:31:21.978
178	MARION SNYDER	t	Brazil	Santa Brbara dOeste	2025-07-13 16:31:21.978
354	JUSTIN NGO	t	Brazil	Santo Andr	2025-07-13 16:31:21.978
544	CODY NOLEN	t	Brazil	So Bernardo do Campo	2025-07-13 16:31:21.978
443	FRANCISCO SKIDMORE	t	Brazil	So Leopoldo	2025-07-13 16:31:21.978
314	GEORGE LINTON	t	Brazil	Sorocaba	2025-07-13 16:31:21.978
39	DEBRA NELSON	t	Brazil	Vila Velha	2025-07-13 16:31:21.978
374	JEREMY HURTADO	t	Brazil	Vitria de Santo Anto	2025-07-13 16:31:21.978
91	LOIS BUTLER	t	Brunei	Bandar Seri Begawan	2025-07-13 16:31:21.978
540	TYRONE ASHER	t	Bulgaria	Ruse	2025-07-13 16:31:21.978
215	JESSIE BANKS	t	Bulgaria	Stara Zagora	2025-07-13 16:31:21.978
516	ELMER NOE	t	Cambodia	Battambang	2025-07-13 16:31:21.978
228	ALLISON STANLEY	t	Cambodia	Phnom Penh	2025-07-13 16:31:21.978
352	ALBERT CROUSE	t	Cameroon	Bamenda	2025-07-13 16:31:21.978
361	LAWRENCE LAWTON	t	Cameroon	Yaound	2025-07-13 16:31:21.978
476	DERRICK BOURQUE	t	Canada	Gatineau	2025-07-13 16:31:21.978
463	DARRELL POWER	t	Canada	Halifax	2025-07-13 16:31:21.978
189	LORETTA CARPENTER	t	Canada	Oshawa	2025-07-13 16:31:21.978
410	CURTIS IRBY	t	Canada	Richmond Hill	2025-07-13 16:31:21.978
436	TROY QUIGLEY	t	Canada	Vancouver	2025-07-13 16:31:21.978
535	JAVIER ELROD	t	Chad	NDjamna	2025-07-13 16:31:21.978
45	JANET PHILLIPS	t	Chile	Antofagasta	2025-07-13 16:31:21.978
515	ANDRE RAPP	t	Chile	Coquimbo	2025-07-13 16:31:21.978
464	JEROME KENYON	t	Chile	Rancagua	2025-07-13 16:31:21.978
538	TED BREAUX	t	China	Baicheng	2025-07-13 16:31:21.978
495	CHARLIE BESS	t	China	Baiyin	2025-07-13 16:31:21.978
533	JESSIE MILAM	t	China	Binzhou	2025-07-13 16:31:21.978
197	SUE PETERS	t	China	Changzhou	2025-07-13 16:31:21.978
260	CHRISTY VARGAS	t	China	Datong	2025-07-13 16:31:21.978
64	JUDITH COX	t	China	Daxian	2025-07-13 16:31:21.978
466	LEO EBERT	t	China	Dongying	2025-07-13 16:31:21.978
389	ALAN KAHN	t	China	Emeishan	2025-07-13 16:31:21.978
110	TIFFANY JORDAN	t	China	Enshi	2025-07-13 16:31:21.978
313	DONALD MAHON	t	China	Ezhou	2025-07-13 16:31:21.978
211	STACEY MONTGOMERY	t	China	Fuyu	2025-07-13 16:31:21.978
281	LEONA OBRIEN	t	China	Fuzhou	2025-07-13 16:31:21.978
552	HUGH WALDROP	t	China	Haining	2025-07-13 16:31:21.978
165	LORRAINE STEPHENS	t	China	Hami	2025-07-13 16:31:21.978
138	HAZEL WARREN	t	China	Hohhot	2025-07-13 16:31:21.978
384	ERNEST STEPP	t	China	Huaian	2025-07-13 16:31:21.978
168	REGINA BERRY	t	China	Jinchang	2025-07-13 16:31:21.978
594	EDUARDO HIATT	t	China	Jining	2025-07-13 16:31:21.978
595	TERRENCE GUNDERSON	t	China	Jinzhou	2025-07-13 16:31:21.978
435	RICKY SHELBY	t	China	Junan	2025-07-13 16:31:21.978
283	FELICIA SUTTON	t	China	Korla	2025-07-13 16:31:21.978
151	MEGAN PALMER	t	China	Laiwu	2025-07-13 16:31:21.978
422	MELVIN ELLINGTON	t	China	Laohekou	2025-07-13 16:31:21.978
267	MARGIE WADE	t	China	Lengshuijiang	2025-07-13 16:31:21.978
569	DAVE GARDINER	t	China	Leshan	2025-07-13 16:31:21.978
129	CARRIE PORTER	t	China	Liaocheng	2025-07-13 16:31:21.978
90	RUBY WASHINGTON	t	China	Meixian	2025-07-13 16:31:21.978
37	PAMELA BAKER	t	China	Nanyang	2025-07-13 16:31:21.978
169	ERICA MATTHEWS	t	China	Pingxiang	2025-07-13 16:31:21.978
242	GLENDA FRAZIER	t	China	Qinhuangdao	2025-07-13 16:31:21.978
496	TYLER WREN	t	China	Rizhao	2025-07-13 16:31:21.978
546	KELLY KNOTT	t	China	Sanya	2025-07-13 16:31:21.978
424	KYLE SPURLOCK	t	China	Shanwei	2025-07-13 16:31:21.978
485	CLYDE TOBIAS	t	China	Shaoguan	2025-07-13 16:31:21.978
378	EUGENE CULPEPPER	t	China	Shenzhen	2025-07-13 16:31:21.978
511	CHESTER BENNER	t	China	Suihua	2025-07-13 16:31:21.978
249	DORA MEDINA	t	China	Tianjin	2025-07-13 16:31:21.978
302	MICHAEL SILVERMAN	t	China	Tiefa	2025-07-13 16:31:21.978
599	AUSTIN CINTRON	t	China	Tieli	2025-07-13 16:31:21.978
442	LEROY BUSTAMANTE	t	China	Tongliao	2025-07-13 16:31:21.978
588	MARION OCAMPO	t	China	Weifang	2025-07-13 16:31:21.978
241	HEIDI LARSON	t	China	Xiangfan	2025-07-13 16:31:21.978
67	KELLY TORRES	t	China	Xiangtan	2025-07-13 16:31:21.978
564	BOB PFEIFFER	t	China	Xintai	2025-07-13 16:31:21.978
339	WALTER PERRYMAN	t	China	Xinxiang	2025-07-13 16:31:21.978
272	KAY CALDWELL	t	China	Yantai	2025-07-13 16:31:21.978
484	ROBERTO VU	t	China	Yinchuan	2025-07-13 16:31:21.978
521	ROLAND SOUTH	t	China	Yingkou	2025-07-13 16:31:21.978
154	MICHELE GRANT	t	China	Yuncheng	2025-07-13 16:31:21.978
324	GARY COY	t	China	Yuzhou	2025-07-13 16:31:21.978
93	PHYLLIS FOSTER	t	China	Zalantun	2025-07-13 16:31:21.978
514	FRANKLIN TROUTMAN	t	China	Zaoyang	2025-07-13 16:31:21.978
550	GUY BROWNLEE	t	China	Zhoushan	2025-07-13 16:31:21.978
235	JACKIE LYNCH	t	Colombia	Buenaventura	2025-07-13 16:31:21.978
120	SYLVIA ORTIZ	t	Colombia	Dos Quebradas	2025-07-13 16:31:21.978
460	LEON BOSTIC	t	Colombia	Florencia	2025-07-13 16:31:21.978
180	STACY CUNNINGHAM	t	Colombia	Pereira	2025-07-13 16:31:21.978
87	WANDA PATTERSON	t	Colombia	Sincelejo	2025-07-13 16:31:21.978
490	SAM MCDUFFIE	t	Colombia	Sogamoso	2025-07-13 16:31:21.978
387	JESSE SCHILLING	t	Congo, The Democratic Republic of the	Lubumbashi	2025-07-13 16:31:21.978
375	AARON SELBY	t	Congo, The Democratic Republic of the	Mwene-Ditu	2025-07-13 16:31:21.978
265	JENNIE TERRY	t	Czech Republic	Olomouc	2025-07-13 16:31:21.978
437	RANDALL NEUMANN	t	Dominican Republic	La Romana	2025-07-13 16:31:21.978
418	JEFF EAST	t	Dominican Republic	San Felipe de Puerto Plata	2025-07-13 16:31:21.978
258	MYRTLE FLEMING	t	Dominican Republic	Santiago de los Caballeros	2025-07-13 16:31:21.978
589	TRACY HERRMANN	t	Ecuador	Loja	2025-07-13 16:31:21.978
262	PATSY DAVIDSON	t	Ecuador	Portoviejo	2025-07-13 16:31:21.978
494	RAMON CHOATE	t	Ecuador	Robamba	2025-07-13 16:31:21.978
559	EVERETT BANDA	t	Egypt	Bilbays	2025-07-13 16:31:21.978
233	LILLIE KIM	t	Egypt	Idfu	2025-07-13 16:31:21.978
491	RICK MATTOX	t	Egypt	Mit Ghamr	2025-07-13 16:31:21.978
134	EMMA BOYD	t	Egypt	Qalyub	2025-07-13 16:31:21.978
423	ALFRED CASILLAS	t	Egypt	Sawhaj	2025-07-13 16:31:21.978
119	SHERRY MARSHALL	t	Egypt	Shubra al-Khayma	2025-07-13 16:31:21.978
444	MARCUS HIDALGO	t	Estonia	Tartu	2025-07-13 16:31:21.978
392	SEAN DOUGLASS	t	Ethiopia	Addis Abeba	2025-07-13 16:31:21.978
317	EDWARD BAUGH	t	Faroe Islands	Trshavn	2025-07-13 16:31:21.978
298	ERIKA PENA	t	Finland	Oulu	2025-07-13 16:31:21.978
402	LUIS YANEZ	t	France	Brest	2025-07-13 16:31:21.978
162	LAUREN HUDSON	t	France	Le Mans	2025-07-13 16:31:21.978
104	RITA GRAHAM	t	France	Toulon	2025-07-13 16:31:21.978
35	VIRGINIA GREEN	t	France	Toulouse	2025-07-13 16:31:21.978
65	ROSE HOWARD	t	French Guiana	Cayenne	2025-07-13 16:31:21.978
43	CHRISTINE ROBERTS	t	French Polynesia	Faaa	2025-07-13 16:31:21.978
56	GLORIA COOK	t	French Polynesia	Papeete	2025-07-13 16:31:21.978
584	SALVADOR TEEL	t	Gambia	Banjul	2025-07-13 16:31:21.978
114	GRACE ELLIS	t	Germany	Duisburg	2025-07-13 16:31:21.978
448	MIGUEL BETANCOURT	t	Germany	Erlangen	2025-07-13 16:31:21.978
251	VICKIE BREWER	t	Germany	Halle/Saale	2025-07-13 16:31:21.978
196	ALMA AUSTIN	t	Germany	Mannheim	2025-07-13 16:31:21.978
227	COLLEEN BURTON	t	Germany	Saarbrcken	2025-07-13 16:31:21.978
195	VANESSA SIMS	t	Germany	Siegen	2025-07-13 16:31:21.978
201	VICKI FIELDS	t	Germany	Witten	2025-07-13 16:31:21.978
3	LINDA WILLIAMS	t	Greece	Athenai	2025-07-13 16:31:21.978
596	ENRIQUE FORSYTHE	t	Greece	Patras	2025-07-13 16:31:21.978
207	GERTRUDE CASTILLO	t	Greenland	Nuuk	2025-07-13 16:31:21.978
26	JESSICA HALL	t	Holy See (Vatican City State)	Citt del Vaticano	2025-07-13 16:31:21.978
289	VIOLET RODRIQUEZ	t	Hong Kong	Kowloon and New Kowloon	2025-07-13 16:31:21.978
592	TERRANCE ROUSH	t	Hungary	Szkesfehrvr	2025-07-13 16:31:21.978
367	ADAM GOOCH	t	India	Adoni	2025-07-13 16:31:21.978
297	SHERRI RHODES	t	India	Ahmadnagar	2025-07-13 16:31:21.978
175	ANNETTE OLSON	t	India	Allappuzha (Alleppey)	2025-07-13 16:31:21.978
225	ARLENE HARVEY	t	India	Ambattur	2025-07-13 16:31:21.978
534	CHRISTIAN JUNG	t	India	Amroha	2025-07-13 16:31:21.978
208	LUCY WHEELER	t	India	Balurghat	2025-07-13 16:31:21.978
413	MARVIN YEE	t	India	Berhampore (Baharampur)	2025-07-13 16:31:21.978
379	CARLOS COUGHLIN	t	India	Bhavnagar	2025-07-13 16:31:21.978
209	TONYA CHAPMAN	t	India	Bhilwara	2025-07-13 16:31:21.978
529	ERIK GUILLEN	t	India	Bhimavaram	2025-07-13 16:31:21.978
15	HELEN HARRIS	t	India	Bhopal	2025-07-13 16:31:21.978
202	CARLA GUTIERREZ	t	India	Bhusawal	2025-07-13 16:31:21.978
468	TIM CARY	t	India	Bijapur	2025-07-13 16:31:21.978
167	SALLY PIERCE	t	India	Chandrapur	2025-07-13 16:31:21.978
509	RAUL FORTIER	t	India	Chapra	2025-07-13 16:31:21.978
440	BERNARD COLBY	t	India	Dhule (Dhulia)	2025-07-13 16:31:21.978
121	JOSEPHINE GOMEZ	t	India	Etawah	2025-07-13 16:31:21.978
192	LAURIE LAWRENCE	t	India	Firozabad	2025-07-13 16:31:21.978
117	EDITH MCDONALD	t	India	Gandhinagar	2025-07-13 16:31:21.978
370	WAYNE TRUONG	t	India	Gulbarga	2025-07-13 16:31:21.978
186	HOLLY FOX	t	India	Haldia	2025-07-13 16:31:21.978
259	LENA JENSEN	t	India	Halisahar	2025-07-13 16:31:21.979
412	ALLEN BUTTERFIELD	t	India	Hoshiarpur	2025-07-13 16:31:21.981
136	ANITA MORALES	t	India	Hubli-Dharwad	2025-07-13 16:31:21.982
60	MILDRED BAILEY	t	India	Jaipur	2025-07-13 16:31:21.983
32	AMY LOPEZ	t	India	Jhansi	2025-07-13 16:31:21.985
224	PEARL GARZA	t	India	Jodhpur	2025-07-13 16:31:21.987
31	BRENDA WRIGHT	t	India	Kamarhati	2025-07-13 16:31:21.988
492	LESTER KRAUS	t	India	Kanchrapara	2025-07-13 16:31:21.99
274	NAOMI JENNINGS	t	India	Karnal	2025-07-13 16:31:21.991
419	CHAD CARBONE	t	India	Katihar	2025-07-13 16:31:21.993
271	PENNY NEAL	t	India	Kumbakonam	2025-07-13 16:31:21.994
316	STEVEN CURLEY	t	India	Miraj	2025-07-13 16:31:21.997
28	CYNTHIA YOUNG	t	India	Munger (Monghyr)	2025-07-13 16:31:21.998
59	CHERYL MURPHY	t	India	Mysore	2025-07-13 16:31:21.999
152	ALICIA MILLS	t	India	Nagaon	2025-07-13 16:31:22
268	NINA SOTO	t	India	Palghat (Palakkad)	2025-07-13 16:31:22.002
300	JOHN FARNSWORTH	t	India	Parbhani	2025-07-13 16:31:22.004
95	PAULA BRYANT	t	India	Pathankot	2025-07-13 16:31:22.006
296	RAMONA HALE	t	India	Patiala	2025-07-13 16:31:22.008
421	LEE HAWKS	t	India	Pudukkottai	2025-07-13 16:31:22.01
135	JUANITA MASON	t	India	Pune	2025-07-13 16:31:22.012
426	BRADLEY MOTLEY	t	India	Purnea (Purnia)	2025-07-13 16:31:22.013
78	LORI WOOD	t	India	Rae Bareli	2025-07-13 16:31:22.015
554	DWAYNE OLVERA	t	India	Rajkot	2025-07-13 16:31:22.016
336	JOSHUA MARK	t	India	Rampur	2025-07-13 16:31:22.017
358	SAMUEL MARLOW	t	India	Ranchi	2025-07-13 16:31:22.018
217	AGNES BISHOP	t	India	Sambhal	2025-07-13 16:31:22.021
356	GERALD FULTZ	t	India	Satna	2025-07-13 16:31:22.022
238	NELLIE GARRETT	t	India	Shimoga	2025-07-13 16:31:22.023
68	NICOLE PETERSON	t	India	Shivapuri	2025-07-13 16:31:22.024
502	BRETT CORNWELL	t	India	Siliguri (Shiliguri)	2025-07-13 16:31:22.025
287	BECKY MILES	t	India	Tambaram	2025-07-13 16:31:22.026
170	BEATRICE ARNOLD	t	India	Udaipur	2025-07-13 16:31:22.028
446	THEODORE CULP	t	India	Uluberia	2025-07-13 16:31:22.03
231	GEORGIA JACOBS	t	India	Uttarpara-Kotrung	2025-07-13 16:31:22.032
403	MIKE WAY	t	India	Valparai	2025-07-13 16:31:22.033
123	SHANNON FREEMAN	t	India	Varanasi (Benares)	2025-07-13 16:31:22.035
508	MILTON HOWLAND	t	India	Vijayawada	2025-07-13 16:31:22.036
12	NANCY THOMAS	t	India	Yamuna Nagar	2025-07-13 16:31:22.037
411	NORMAN CURRIER	t	Indonesia	Cianjur	2025-07-13 16:31:22.039
239	MINNIE ROMERO	t	Indonesia	Ciomas	2025-07-13 16:31:22.04
328	JEFFREY SPEAR	t	Indonesia	Ciparay	2025-07-13 16:31:22.042
203	TARA RYAN	t	Indonesia	Gorontalo	2025-07-13 16:31:22.043
153	SUZANNE NICHOLS	t	Indonesia	Jakarta	2025-07-13 16:31:22.044
473	JORGE OLIVARES	t	Indonesia	Lhokseumawe	2025-07-13 16:31:22.046
500	REGINALD KINDER	t	Indonesia	Madiun	2025-07-13 16:31:22.047
542	LONNIE TIRADO	t	Indonesia	Pangkal Pinang	2025-07-13 16:31:22.048
116	VICTORIA GIBSON	t	Indonesia	Pemalang	2025-07-13 16:31:22.049
506	LESLIE SEWARD	t	Indonesia	Pontianak	2025-07-13 16:31:22.051
372	STEVE MACKENZIE	t	Indonesia	Probolinggo	2025-07-13 16:31:22.052
524	JARED ELY	t	Indonesia	Purwakarta	2025-07-13 16:31:22.053
450	JAY ROBB	t	Indonesia	Surakarta	2025-07-13 16:31:22.054
458	LLOYD DOWD	t	Indonesia	Tegal	2025-07-13 16:31:22.056
36	KATHLEEN ADAMS	t	Iran	Arak	2025-07-13 16:31:22.057
10	DOROTHY TAYLOR	t	Iran	Esfahan	2025-07-13 16:31:22.058
377	HOWARD FORTNER	t	Iran	Kermanshah	2025-07-13 16:31:22.059
368	HARRY ARCE	t	Iran	Najafabad	2025-07-13 16:31:22.06
459	TOMMY COLLAZO	t	Iran	Qomsheh	2025-07-13 16:31:22.061
185	ROBERTA HARPER	t	Iran	Shahr-e Kord	2025-07-13 16:31:22.063
449	OSCAR AQUINO	t	Iran	Sirjan	2025-07-13 16:31:22.064
279	DIANNE SHELTON	t	Iran	Tabriz	2025-07-13 16:31:22.065
579	DARYL LARUE	t	Iraq	Mosul	2025-07-13 16:31:22.066
102	CRYSTAL FORD	t	Israel	Ashdod	2025-07-13 16:31:22.068
478	LEWIS LYMAN	t	Israel	Ashqelon	2025-07-13 16:31:22.069
315	KENNETH GOODEN	t	Israel	Bat Yam	2025-07-13 16:31:22.07
161	GERALDINE PERKINS	t	Israel	Tel Aviv-Jaffa	2025-07-13 16:31:22.071
33	ANNA HILL	t	Italy	Alessandria	2025-07-13 16:31:22.073
439	ALEXANDER FENNELL	t	Italy	Bergamo	2025-07-13 16:31:22.074
309	CHRISTOPHER GRECO	t	Italy	Brescia	2025-07-13 16:31:22.075
499	MARC OUTLAW	t	Italy	Brindisi	2025-07-13 16:31:22.076
541	DARREN WINDHAM	t	Italy	Livorno	2025-07-13 16:31:22.077
221	BESSIE MORRISON	t	Italy	Syrakusa	2025-07-13 16:31:22.078
525	ADRIAN CLARY	t	Italy	Udine	2025-07-13 16:31:22.08
574	JULIAN VEST	t	Japan	Akishima	2025-07-13 16:31:22.081
141	DEBBIE REYES	t	Japan	Fukuyama	2025-07-13 16:31:22.082
264	GWENDOLYN MAY	t	Japan	Higashiosaka	2025-07-13 16:31:22.083
194	KRISTEN CHAVEZ	t	Japan	Hino	2025-07-13 16:31:22.085
299	JAMES GANNON	t	Japan	Hiroshima	2025-07-13 16:31:22.086
519	RON DELUCA	t	Japan	Isesaki	2025-07-13 16:31:22.087
240	MARLENE WELCH	t	Japan	Iwaki	2025-07-13 16:31:22.088
54	TERESA ROGERS	t	Japan	Iwakuni	2025-07-13 16:31:22.089
396	EARL SHANKS	t	Japan	Iwatsuki	2025-07-13 16:31:22.091
391	CLARENCE GAMEZ	t	Japan	Izumisano	2025-07-13 16:31:22.092
163	CATHY SPENCER	t	Japan	Kakamigahara	2025-07-13 16:31:22.093
79	RACHEL BARNES	t	Japan	Kamakura	2025-07-13 16:31:22.094
547	KURT EMMONS	t	Japan	Kanazawa	2025-07-13 16:31:22.096
401	TONY CARRANZA	t	Japan	Koriyama	2025-07-13 16:31:22.098
34	REBECCA SCOTT	t	Japan	Kurashiki	2025-07-13 16:31:22.099
531	JAMIE WAUGH	t	Japan	Kuwana	2025-07-13 16:31:22.101
355	TERRY GRISSOM	t	Japan	Matsue	2025-07-13 16:31:22.102
253	TERRY CARLSON	t	Japan	Miyakonojo	2025-07-13 16:31:22.103
53	HEATHER MORRIS	t	Japan	Nagareyama	2025-07-13 16:31:22.104
489	RICARDO MEADOR	t	Japan	Okayama	2025-07-13 16:31:22.106
365	BRUCE SCHWARZ	t	Japan	Okinawa	2025-07-13 16:31:22.108
404	STANLEY SCROGGINS	t	Japan	Omiya	2025-07-13 16:31:22.109
337	JERRY JORDON	t	Japan	Onomichi	2025-07-13 16:31:22.11
285	MIRIAM MCKINNEY	t	Japan	Otsu	2025-07-13 16:31:22.111
11	LISA ANDERSON	t	Japan	Sagamihara	2025-07-13 16:31:22.112
1	MARY SMITH	t	Japan	Sasebo	2025-07-13 16:31:22.114
29	ANGELA HERNANDEZ	t	Japan	Shimonoseki	2025-07-13 16:31:22.115
385	PHILLIP HOLM	t	Japan	Tama	2025-07-13 16:31:22.116
429	FREDERICK ISBELL	t	Japan	Tsuyama	2025-07-13 16:31:22.117
503	ANGEL BARCLAY	t	Japan	Ueda	2025-07-13 16:31:22.118
147	JOANNE ROBERTSON	t	Japan	Urawa	2025-07-13 16:31:22.12
76	IRENE PRICE	t	Kazakstan	Pavlodar	2025-07-13 16:31:22.121
573	BYRON BOX	t	Kazakstan	Zhezqazghan	2025-07-13 16:31:22.122
193	KATIE ELLIOTT	t	Kenya	Kisumu	2025-07-13 16:31:22.123
363	ROY WHITING	t	Kenya	Nyeri	2025-07-13 16:31:22.125
234	CLAUDIA FULLER	t	Kuwait	Jalib al-Shuyukh	2025-07-13 16:31:22.126
347	RYAN SALISBURY	t	Latvia	Daugavpils	2025-07-13 16:31:22.128
23	SARAH LEWIS	t	Latvia	Liepaja	2025-07-13 16:31:22.129
57	EVELYN MORGAN	t	Liechtenstein	Vaduz	2025-07-13 16:31:22.13
557	FELIX GAFFNEY	t	Lithuania	Vilnius	2025-07-13 16:31:22.132
81	ANDREA HENDERSON	t	Madagascar	Mahajanga	2025-07-13 16:31:22.133
166	LYNN PAYNE	t	Malawi	Lilongwe	2025-07-13 16:31:22.135
171	DOLORES WAGNER	t	Malaysia	Ipoh	2025-07-13 16:31:22.137
58	JEAN BELL	t	Malaysia	Kuching	2025-07-13 16:31:22.138
306	CHARLES KOWALSKI	t	Malaysia	Sungai Petani	2025-07-13 16:31:22.139
486	GLEN TALBERT	t	Mexico	Acua	2025-07-13 16:31:22.141
414	VINCENT RALSTON	t	Mexico	Allende	2025-07-13 16:31:22.142
84	SARA PERRY	t	Mexico	Atlixco	2025-07-13 16:31:22.143
578	WILLARD LUMPKIN	t	Mexico	Carmen	2025-07-13 16:31:22.145
587	SERGIO STANFIELD	t	Mexico	Celaya	2025-07-13 16:31:22.146
247	STELLA MORENO	t	Mexico	Coacalco de Berriozbal	2025-07-13 16:31:22.148
482	MAURICE CRAWLEY	t	Mexico	Coatzacoalcos	2025-07-13 16:31:22.15
467	ALVIN DELOACH	t	Mexico	Cuauhtmoc	2025-07-13 16:31:22.151
323	MATTHEW MAHAN	t	Mexico	Cuautla	2025-07-13 16:31:22.152
575	ISAAC OGLESBY	t	Mexico	Cuernavaca	2025-07-13 16:31:22.153
451	JIM REA	t	Mexico	El Fuerte	2025-07-13 16:31:22.154
364	BENJAMIN VARNEY	t	Mexico	Guadalajara	2025-07-13 16:31:22.156
150	DANIELLE DANIELS	t	Mexico	Hidalgo	2025-07-13 16:31:22.157
582	ANDY VANHORN	t	Mexico	Huejutla de Reyes	2025-07-13 16:31:22.158
108	TRACY COLE	t	Mexico	Huixquilucan	2025-07-13 16:31:22.16
581	VIRGIL WOFFORD	t	Mexico	Jos Azueta	2025-07-13 16:31:22.162
369	FRED WHEAT	t	Mexico	Jurez	2025-07-13 16:31:22.163
488	SHANE MILLARD	t	Mexico	La Paz	2025-07-13 16:31:22.164
177	SAMANTHA DUNCAN	t	Mexico	Matamoros	2025-07-13 16:31:22.165
343	DOUGLAS GRAF	t	Mexico	Mexicali	2025-07-13 16:31:22.167
570	IVAN CROMWELL	t	Mexico	Monclova	2025-07-13 16:31:22.168
115	WENDY HARRISON	t	Mexico	Nezahualcyotl	2025-07-13 16:31:22.169
353	JONATHAN SCARBOROUGH	t	Mexico	Pachuca de Soto	2025-07-13 16:31:22.171
273	PRISCILLA LOWE	t	Mexico	Salamanca	2025-07-13 16:31:22.172
319	RONALD WEINER	t	Mexico	San Felipe del Progreso	2025-07-13 16:31:22.173
425	FRANCIS SIKES	t	Mexico	San Juan Bautista Tuxtepec	2025-07-13 16:31:22.175
133	PAULINE HENRY	t	Mexico	Torren	2025-07-13 16:31:22.176
454	ALEX GRESHAM	t	Mexico	Uruapan	2025-07-13 16:31:22.177
288	BOBBIE CRAIG	t	Mexico	Valle de Santiago	2025-07-13 16:31:22.178
465	FLOYD GANDY	t	Mexico	Zapopan	2025-07-13 16:31:22.18
38	MARTHA GONZALEZ	t	Moldova	Chisinau	2025-07-13 16:31:22.182
543	LANCE PEMBERTON	t	Morocco	Beni-Mellal	2025-07-13 16:31:22.183
40	AMANDA CARTER	t	Morocco	Nador	2025-07-13 16:31:22.185
22	LAURA RODRIGUEZ	t	Morocco	Sal	2025-07-13 16:31:22.186
257	MARSHA DOUGLAS	t	Mozambique	Beira	2025-07-13 16:31:22.188
433	DON BONE	t	Mozambique	Naala-Porto	2025-07-13 16:31:22.19
97	ANNIE RUSSELL	t	Mozambique	Tete	2025-07-13 16:31:22.191
256	MABEL HOLLAND	t	Myanmar	Monywa	2025-07-13 16:31:22.193
4	BARBARA JONES	t	Myanmar	Myingyan	2025-07-13 16:31:22.194
513	DUANE TUBBS	t	Nauru	Yangor	2025-07-13 16:31:22.196
321	KEVIN SCHULER	t	Nepal	Birgunj	2025-07-13 16:31:22.197
415	GLENN PULLEN	t	Netherlands	Amersfoort	2025-07-13 16:31:22.198
137	RHONDA KENNEDY	t	Netherlands	Apeldoorn	2025-07-13 16:31:22.199
341	PETER MENARD	t	Netherlands	Ede	2025-07-13 16:31:22.2
474	DUSTIN GILLETTE	t	Netherlands	Emmen	2025-07-13 16:31:22.202
184	VIVIAN RUIZ	t	Netherlands	s-Hertogenbosch	2025-07-13 16:31:22.203
8	SUSAN WILSON	t	New Zealand	Hamilton	2025-07-13 16:31:22.205
284	SONIA GREGORY	t	Nigeria	Benin City	2025-07-13 16:31:22.206
409	RODNEY MOELLER	t	Nigeria	Deba Habe	2025-07-13 16:31:22.207
286	VELMA LUCAS	t	Nigeria	Effon-Alaiye	2025-07-13 16:31:22.209
80	MARILYN ROSS	t	Nigeria	Ife	2025-07-13 16:31:22.21
198	ELSIE KELLEY	t	Nigeria	Ikerre	2025-07-13 16:31:22.212
103	GLADYS HAMILTON	t	Nigeria	Ilorin	2025-07-13 16:31:22.213
18	CAROL GARCIA	t	Nigeria	Kaduna	2025-07-13 16:31:22.214
277	OLGA JIMENEZ	t	Nigeria	Ogbomosho	2025-07-13 16:31:22.216
156	BERTHA FERGUSON	t	Nigeria	Ondo	2025-07-13 16:31:22.217
280	TRACEY BARRETT	t	Nigeria	Owo	2025-07-13 16:31:22.218
250	JO FOWLER	t	Nigeria	Oyo	2025-07-13 16:31:22.22
562	WALLACE SLONE	t	Nigeria	Sokoto	2025-07-13 16:31:22.222
232	CONSTANCE REID	t	Nigeria	Zaria	2025-07-13 16:31:22.223
157	DARLENE ROSE	t	North Korea	Pyongyang	2025-07-13 16:31:22.224
9	MARGARET MOORE	t	Oman	Masqat	2025-07-13 16:31:22.225
498	GENE SANBORN	t	Oman	Salala	2025-07-13 16:31:22.226
416	JEFFERY PINSON	t	Pakistan	Dadu	2025-07-13 16:31:22.228
223	MELINDA FERNANDEZ	t	Pakistan	Mandi Bahauddin	2025-07-13 16:31:22.23
20	SHARON ROBINSON	t	Pakistan	Mardan	2025-07-13 16:31:22.232
399	DANNY ISOM	t	Pakistan	Okara	2025-07-13 16:31:22.233
25	DEBORAH WALKER	t	Pakistan	Shikarpur	2025-07-13 16:31:22.234
226	MAUREEN LITTLE	t	Paraguay	Asuncin	2025-07-13 16:31:22.235
205	EILEEN CARR	t	Paraguay	Ciudad del Este	2025-07-13 16:31:22.236
345	CARL ARTIS	t	Paraguay	San Lorenzo	2025-07-13 16:31:22.237
304	DAVID ROYAL	t	Peru	Callao	2025-07-13 16:31:22.238
565	JAIME NETTLES	t	Peru	Hunuco	2025-07-13 16:31:22.24
122	THELMA MURRAY	t	Peru	Lima	2025-07-13 16:31:22.242
597	FREDDIE DUGGAN	t	Peru	Sullana	2025-07-13 16:31:22.243
71	KATHY JAMES	t	Philippines	Baybay	2025-07-13 16:31:22.245
188	MELANIE ARMSTRONG	t	Philippines	Bayugan	2025-07-13 16:31:22.247
94	NORMA GONZALES	t	Philippines	Bislig	2025-07-13 16:31:22.248
371	BILLY POULIN	t	Philippines	Cabuyao	2025-07-13 16:31:22.25
388	CRAIG MORRELL	t	Philippines	Cavite	2025-07-13 16:31:22.251
27	SHIRLEY ALLEN	t	Philippines	Davao	2025-07-13 16:31:22.253
461	DEREK BLAKELY	t	Philippines	Gingoog	2025-07-13 16:31:22.254
255	IRMA PEARSON	t	Philippines	Hagonoy	2025-07-13 16:31:22.255
580	ROSS GREY	t	Philippines	Iligan	2025-07-13 16:31:22.256
349	JOE GILLILAND	t	Philippines	Imus	2025-07-13 16:31:22.257
244	VIOLA HANSON	t	Philippines	Lapu-Lapu	2025-07-13 16:31:22.258
263	HILDA HOPKINS	t	Philippines	Mandaluyong	2025-07-13 16:31:22.26
434	EDDIE TOMLIN	t	Philippines	Ozamis	2025-07-13 16:31:22.262
522	ARNOLD HAVENS	t	Philippines	Santa Rosa	2025-07-13 16:31:22.264
72	THERESA WATSON	t	Philippines	Taguig	2025-07-13 16:31:22.265
505	RAFAEL ABNEY	t	Philippines	Talavera	2025-07-13 16:31:22.266
373	LOUIS LEONE	t	Philippines	Tanauan	2025-07-13 16:31:22.268
236	MARCIA DEAN	t	Philippines	Tanza	2025-07-13 16:31:22.269
548	ALLAN CORNISH	t	Philippines	Tarlac	2025-07-13 16:31:22.271
261	DEANNA BYRD	t	Philippines	Tuguegarao	2025-07-13 16:31:22.272
318	BRIAN WYMAN	t	Poland	Bydgoszcz	2025-07-13 16:31:22.273
572	SIDNEY BURLESON	t	Poland	Czestochowa	2025-07-13 16:31:22.274
128	MARJORIE TUCKER	t	Poland	Jastrzebie-Zdrj	2025-07-13 16:31:22.276
270	LEAH CURTIS	t	Poland	Kalisz	2025-07-13 16:31:22.277
501	RUBEN GEARY	t	Poland	Lublin	2025-07-13 16:31:22.278
571	JOHNNIE CHISHOLM	t	Poland	Plock	2025-07-13 16:31:22.28
380	RUSSELL BRINSON	t	Poland	Tychy	2025-07-13 16:31:22.282
558	JIMMIE EGGLESTON	t	Poland	Wroclaw	2025-07-13 16:31:22.283
360	RALPH MADRIGAL	t	Puerto Rico	Arecibo	2025-07-13 16:31:22.285
282	JENNY CASTRO	t	Puerto Rico	Ponce	2025-07-13 16:31:22.286
230	JOY GEORGE	t	Romania	Botosani	2025-07-13 16:31:22.288
563	KEN PREWITT	t	Romania	Bucuresti	2025-07-13 16:31:22.289
148	ELEANOR HUNT	t	Runion	Saint-Denis	2025-07-13 16:31:22.291
397	JIMMY SCHRADER	t	Russian Federation	Atinsk	2025-07-13 16:31:22.292
55	DORIS REED	t	Russian Federation	Balaiha	2025-07-13 16:31:22.293
430	RAY HOULE	t	Russian Federation	Dzerzinsk	2025-07-13 16:31:22.294
17	DONNA THOMPSON	t	Russian Federation	Elista	2025-07-13 16:31:22.296
106	CONNIE WALLACE	t	Russian Federation	Ivanovo	2025-07-13 16:31:22.297
222	DELORES HANSEN	t	Russian Federation	Jaroslavl	2025-07-13 16:31:22.299
100	ROBIN HAYES	t	Russian Federation	Jelets	2025-07-13 16:31:22.3
301	ROBERT BAUGHMAN	t	Russian Federation	Kaliningrad	2025-07-13 16:31:22.302
510	BEN EASTER	t	Russian Federation	Kamyin	2025-07-13 16:31:22.303
179	DANA HART	t	Russian Federation	Kirovo-Tepetsk	2025-07-13 16:31:22.304
295	DAISY BATES	t	Russian Federation	Kolpino	2025-07-13 16:31:22.306
393	PHILIP CAUSEY	t	Russian Federation	Korolev	2025-07-13 16:31:22.307
376	RANDY GAITHER	t	Russian Federation	Kurgan	2025-07-13 16:31:22.309
311	PAUL TROUT	t	Russian Federation	Kursk	2025-07-13 16:31:22.312
44	MARIE TURNER	t	Russian Federation	Lipetsk	2025-07-13 16:31:22.313
160	ERIN DUNN	t	Russian Federation	Ljubertsy	2025-07-13 16:31:22.315
346	ARTHUR SIMPKINS	t	Russian Federation	Maikop	2025-07-13 16:31:22.316
46	CATHERINE CAMPBELL	t	Russian Federation	Moscow	2025-07-13 16:31:22.317
447	CLIFFORD BOWENS	t	Russian Federation	Nabereznyje Telny	2025-07-13 16:31:22.319
48	ANN EVANS	t	Russian Federation	Niznekamsk	2025-07-13 16:31:22.321
191	JEANETTE GREENE	t	Russian Federation	Novoterkassk	2025-07-13 16:31:22.323
487	HECTOR POINDEXTER	t	Russian Federation	Pjatigorsk	2025-07-13 16:31:22.324
567	ALFREDO MCADAMS	t	Russian Federation	Serpuhov	2025-07-13 16:31:22.326
127	ELAINE STEVENS	t	Russian Federation	Smolensk	2025-07-13 16:31:22.327
428	HERBERT KRUGER	t	Russian Federation	Syktyvkar	2025-07-13 16:31:22.328
350	JUAN FRALEY	t	Russian Federation	Teboksary	2025-07-13 16:31:22.33
462	WARREN SHERROD	t	Russian Federation	Usolje-Sibirskoje	2025-07-13 16:31:22.331
351	JACK FOUST	t	Russian Federation	Zeleznogorsk	2025-07-13 16:31:22.332
326	JOSE ANDREW	t	Saint Vincent and the Grenadines	Kingstown	2025-07-13 16:31:22.333
101	PEGGY MYERS	t	Saudi Arabia	Abha	2025-07-13 16:31:22.335
70	CHRISTINA RAMIREZ	t	Saudi Arabia	al-Hawiya	2025-07-13 16:31:22.337
417	TRAVIS ESTEP	t	Saudi Arabia	al-Qatif	2025-07-13 16:31:22.338
49	JOYCE EDWARDS	t	Saudi Arabia	Jedda	2025-07-13 16:31:22.339
312	MARK RINEHART	t	Saudi Arabia	Tabuk	2025-07-13 16:31:22.34
456	RONNIE RICKETTS	t	Senegal	Ziguinchor	2025-07-13 16:31:22.342
357	KEITH RICO	t	Slovakia	Bratislava	2025-07-13 16:31:22.343
125	ETHEL WEBB	t	South Africa	Boksburg	2025-07-13 16:31:22.345
132	ESTHER CRAWFORD	t	South Africa	Botshabelo	2025-07-13 16:31:22.346
555	DWIGHT LOMBARDI	t	South Africa	Chatsworth	2025-07-13 16:31:22.347
471	DEAN SAUER	t	South Africa	Johannesburg	2025-07-13 16:31:22.348
19	RUTH MARTINEZ	t	South Africa	Kimberley	2025-07-13 16:31:22.349
109	EDNA WEST	t	South Africa	Klerksdorp	2025-07-13 16:31:22.35
432	EDWIN BURK	t	South Africa	Newcastle	2025-07-13 16:31:22.352
338	DENNIS GILMAN	t	South Africa	Paarl	2025-07-13 16:31:22.353
407	DALE RATCLIFF	t	South Africa	Rustenburg	2025-07-13 16:31:22.354
145	LUCILLE HOLMES	t	South Africa	Soshanguve	2025-07-13 16:31:22.356
83	LOUISE JENKINS	t	South Africa	Springs	2025-07-13 16:31:22.357
88	BONNIE HUGHES	t	South Korea	Cheju	2025-07-13 16:31:22.359
99	EMILY DIAZ	t	South Korea	Kimchon	2025-07-13 16:31:22.36
237	TANYA GILBERT	t	South Korea	Naju	2025-07-13 16:31:22.362
536	FERNANDO CHURCHILL	t	South Korea	Tonghae	2025-07-13 16:31:22.363
245	COURTNEY DAY	t	South Korea	Uijongbu	2025-07-13 16:31:22.364
52	JULIE SANCHEZ	t	Spain	A Corua (La Corua)	2025-07-13 16:31:22.366
293	MAE FLETCHER	t	Spain	Donostia-San Sebastin	2025-07-13 16:31:22.367
394	CHRIS BROTHERS	t	Spain	Gijn	2025-07-13 16:31:22.368
469	WESLEY BULL	t	Spain	Ourense (Orense)	2025-07-13 16:31:22.37
549	NELSON CHRISTENSON	t	Spain	Santiago de Compostela	2025-07-13 16:31:22.372
408	MANUEL MURRELL	t	Sri Lanka	Jaffna	2025-07-13 16:31:22.373
395	JOHNNY TURPIN	t	Sudan	al-Qadarif	2025-07-13 16:31:22.374
50	DIANE COLLINS	t	Sudan	Omdurman	2025-07-13 16:31:22.376
66	JANICE WARD	t	Sweden	Malm	2025-07-13 16:31:22.377
61	KATHERINE RIVERA	t	Switzerland	Basel	2025-07-13 16:31:22.379
155	GAIL KNIGHT	t	Switzerland	Bern	2025-07-13 16:31:22.381
598	WADE DELVALLE	t	Switzerland	Lausanne	2025-07-13 16:31:22.382
75	TAMMY SANDERS	t	Taiwan	Changhwa	2025-07-13 16:31:22.383
73	BEVERLY BROOKS	t	Taiwan	Chiayi	2025-07-13 16:31:22.384
517	BRAD MCCURDY	t	Taiwan	Chungho	2025-07-13 16:31:22.386
576	MORRIS MCCARTER	t	Taiwan	Fengshan	2025-07-13 16:31:22.388
348	ROGER QUINTANILLA	t	Taiwan	Hsichuh	2025-07-13 16:31:22.389
30	MELISSA KING	t	Taiwan	Lungtan	2025-07-13 16:31:22.391
5	ELIZABETH BROWN	t	Taiwan	Nantou	2025-07-13 16:31:22.392
577	CLIFTON MALCOLM	t	Taiwan	Tanshui	2025-07-13 16:31:22.393
139	AMBER DIXON	t	Taiwan	Touliu	2025-07-13 16:31:22.395
586	KIRK STCLAIR	t	Taiwan	Tsaotun	2025-07-13 16:31:22.397
481	HERMAN DEVORE	t	Tanzania	Mwanza	2025-07-13 16:31:22.398
190	YOLANDA WEAVER	t	Tanzania	Tabora	2025-07-13 16:31:22.4
220	CHARLENE ALVAREZ	t	Tanzania	Zanzibar	2025-07-13 16:31:22.402
390	SHAWN HEATON	t	Thailand	Nakhon Sawan	2025-07-13 16:31:22.403
42	CAROLYN PEREZ	t	Thailand	Pak Kret	2025-07-13 16:31:22.404
86	JACQUELINE LONG	t	Thailand	Songkhla	2025-07-13 16:31:22.405
344	HENRY BILLINGSLEY	t	Tonga	Nukualofa	2025-07-13 16:31:22.407
335	GREGORY MAULDIN	t	Tunisia	Sousse	2025-07-13 16:31:22.408
327	LARRY THRASHER	t	Turkey	Adana	2025-07-13 16:31:22.409
366	BRANDON HUEY	t	Turkey	Balikesir	2025-07-13 16:31:22.411
172	BERNICE WILLIS	t	Turkey	Batman	2025-07-13 16:31:22.412
483	VERNON CHAPA	t	Turkey	Denizli	2025-07-13 16:31:22.413
507	EDGAR RHOADS	t	Turkey	Eskisehir	2025-07-13 16:31:22.414
480	COREY HAUSER	t	Turkey	Gaziantep	2025-07-13 16:31:22.417
278	BILLIE HORTON	t	Turkey	Inegl	2025-07-13 16:31:22.418
143	LESLIE GORDON	t	Turkey	Kilis	2025-07-13 16:31:22.42
124	SHEILA WELLS	t	Turkey	Ktahya	2025-07-13 16:31:22.421
13	KAREN JACKSON	t	Turkey	Osmaniye	2025-07-13 16:31:22.423
518	GABRIEL HARDER	t	Turkey	Sivas	2025-07-13 16:31:22.424
493	BRENT HARKINS	t	Turkey	Sultanbeyli	2025-07-13 16:31:22.425
164	JOANN GARDNER	t	Turkey	Tarsus	2025-07-13 16:31:22.426
566	CASEY MENA	t	Turkey	Tokat	2025-07-13 16:31:22.427
204	ROSEMARY SCHMIDT	t	Turkey	Usak	2025-07-13 16:31:22.429
200	JEANNE LAWSON	t	Turkmenistan	Ashgabat	2025-07-13 16:31:22.43
105	DAWN SULLIVAN	t	Tuvalu	Funafuti	2025-07-13 16:31:22.431
386	TODD TAN	t	Ukraine	Kamjanets-Podilskyi	2025-07-13 16:31:22.433
545	JULIO NOLAND	t	Ukraine	Konotop	2025-07-13 16:31:22.435
131	MONICA HICKS	t	Ukraine	Mukateve	2025-07-13 16:31:22.437
475	PEDRO CHESTNUT	t	Ukraine	ostka	2025-07-13 16:31:22.438
82	KATHRYN COLEMAN	t	Ukraine	Simferopol	2025-07-13 16:31:22.439
187	BRITTANY RILEY	t	Ukraine	Sumy	2025-07-13 16:31:22.441
452	TOM MILNER	t	United Arab Emirates	Abu Dhabi	2025-07-13 16:31:22.442
98	LILLIAN GRIFFIN	t	United Arab Emirates	al-Ayn	2025-07-13 16:31:22.443
292	MISTY LAMBERT	t	United Arab Emirates	Sharja	2025-07-13 16:31:22.444
85	ANNE POWELL	t	United Kingdom	Bradford	2025-07-13 16:31:22.446
142	APRIL BURNS	t	United Kingdom	Dundee	2025-07-13 16:31:22.447
252	MATTIE HOFFMAN	t	United Kingdom	London	2025-07-13 16:31:22.448
512	CECIL VINES	t	United Kingdom	London	2025-07-13 16:31:22.45
583	MARSHALL THORN	t	United Kingdom	Southampton	2025-07-13 16:31:22.452
16	SANDRA MARTIN	t	United Kingdom	Southend-on-Sea	2025-07-13 16:31:22.453
556	ARMANDO GRUBER	t	United Kingdom	Southport	2025-07-13 16:31:22.454
477	DAN PAINE	t	United Kingdom	Stockport	2025-07-13 16:31:22.456
497	GILBERT SLEDGE	t	United Kingdom	York	2025-07-13 16:31:22.457
479	ZACHARY HITE	t	United States	Akron	2025-07-13 16:31:22.458
305	RICHARD MCCRARY	t	United States	Arlington	2025-07-13 16:31:22.46
96	DIANA ALEXANDER	t	United States	Augusta-Richmond County	2025-07-13 16:31:22.462
330	SCOTT SHELLEY	t	United States	Aurora	2025-07-13 16:31:22.463
537	CLINTON BUFORD	t	United States	Aurora	2025-07-13 16:31:22.465
212	WILMA RICHARDS	t	United States	Bellevue	2025-07-13 16:31:22.466
149	VALERIE BLACK	t	United States	Brockton	2025-07-13 16:31:22.467
526	KARL SEAL	t	United States	Cape Coral	2025-07-13 16:31:22.469
14	BETTY WHITE	t	United States	Citrus Heights	2025-07-13 16:31:22.472
140	EVA RAMOS	t	United States	Clarksville	2025-07-13 16:31:22.473
182	RENEE LANE	t	United States	Compton	2025-07-13 16:31:22.475
400	BRYAN HARDISON	t	United States	Dallas	2025-07-13 16:31:22.476
294	SHELLY WATTS	t	United States	Dayton	2025-07-13 16:31:22.477
420	JACOB LANCE	t	United States	El Monte	2025-07-13 16:31:22.478
51	ALICE STEWART	t	United States	Fontana	2025-07-13 16:31:22.48
593	RENE MCALISTER	t	United States	Garden Grove	2025-07-13 16:31:22.482
561	IAN STILL	t	United States	Garland	2025-07-13 16:31:22.483
118	KIM CRUZ	t	United States	Grand Prairie	2025-07-13 16:31:22.484
158	VERONICA STONE	t	United States	Greensboro	2025-07-13 16:31:22.485
504	NATHANIEL ADAM	t	United States	Joliet	2025-07-13 16:31:22.487
308	THOMAS GRIGSBY	t	United States	Kansas City	2025-07-13 16:31:22.489
112	ROSA REYNOLDS	t	United States	Lancaster	2025-07-13 16:31:22.49
6	JENNIFER DAVIS	t	United States	Laredo	2025-07-13 16:31:22.492
63	ASHLEY RICHARDSON	t	United States	Lincoln	2025-07-13 16:31:22.493
382	VICTOR BARKLEY	t	United States	Manchester	2025-07-13 16:31:22.494
181	ANA BRADLEY	t	United States	Memphis	2025-07-13 16:31:22.496
275	CAROLE BARNETT	t	United States	Peoria	2025-07-13 16:31:22.497
291	TONI HOLT	t	United States	Roanoke	2025-07-13 16:31:22.498
457	BILL GAVIN	t	United States	Rockford	2025-07-13 16:31:22.5
62	JOAN COOPER	t	United States	Saint Louis	2025-07-13 16:31:22.502
269	CASSANDRA WALTERS	t	United States	Salinas	2025-07-13 16:31:22.503
2	PATRICIA JOHNSON	t	United States	San Bernardino	2025-07-13 16:31:22.504
146	JAMIE RICE	t	United States	Sterling Heights	2025-07-13 16:31:22.505
214	KRISTIN JOHNSTON	t	United States	Sunnyvale	2025-07-13 16:31:22.506
248	CAROLINE BOWMAN	t	United States	Tallahassee	2025-07-13 16:31:22.507
276	BRANDY GRAVES	t	United States	Warren	2025-07-13 16:31:22.509
568	ALBERTO HENNING	t	Venezuela	Barcelona	2025-07-13 16:31:22.51
111	CARMEN OWENS	t	Venezuela	Caracas	2025-07-13 16:31:22.512
113	CINDY FISHER	t	Venezuela	Cuman	2025-07-13 16:31:22.513
453	CALVIN MARTEL	t	Venezuela	Maracabo	2025-07-13 16:31:22.514
174	YVONNE WATKINS	t	Venezuela	Ocumare del Tuy	2025-07-13 16:31:22.515
539	MATHEW BOLIN	t	Venezuela	Valencia	2025-07-13 16:31:22.515
290	KRISTINA CHAMBERS	t	Venezuela	Valle de la Pascua	2025-07-13 16:31:22.515
532	NEIL RENNER	t	Vietnam	Cam Ranh	2025-07-13 16:31:22.515
199	BETH FRANKLIN	t	Vietnam	Haiphong	2025-07-13 16:31:22.515
340	PATRICK NEWSOM	t	Vietnam	Hanoi	2025-07-13 16:31:22.515
472	GREG ROBINS	t	Vietnam	Nam Dinh	2025-07-13 16:31:22.515
520	MITCHELL WESTMORELAND	t	Vietnam	Nha Trang	2025-07-13 16:31:22.515
523	HARVEY GUAJARDO	t	Vietnam	Vinh	2025-07-13 16:31:22.515
406	NATHAN RUNYON	t	Virgin Islands, U.S.	Charlotte Amalie	2025-07-13 16:31:22.515
210	ELLA OLIVER	t	Yemen	Aden	2025-07-13 16:31:22.515
470	GORDON ALLARD	t	Yemen	Hodeida	2025-07-13 16:31:22.515
303	WILLIAM SATTERFIELD	t	Yemen	Sanaa	2025-07-13 16:31:22.515
213	GINA WILLIAMSON	t	Yemen	Taizz	2025-07-13 16:31:22.515
7	MARIA MILLER	t	Yugoslavia	Kragujevac	2025-07-13 16:31:22.515
553	MAX PITT	t	Yugoslavia	Novi Sad	2025-07-13 16:31:22.515
438	BARRY LOVELACE	t	Zambia	Kitwe	2025-07-13 16:31:22.515
\.


--
-- TOC entry 4894 (class 0 OID 50839)
-- Dependencies: 219
-- Data for Name: dim_film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_film (film_id, title, release_year, rental_rate, length, rating, fecha_carga, category, language) FROM stdin;
549	MAGNOLIA FORRESTER	2006	0.99	171	PG-13	2025-07-13 13:47:31.935	Action	English             
574	MIDNIGHT WESTWARD	2006	0.99	86	G	2025-07-13 13:47:31.935	Action	English             
579	MINDS TRUMAN	2006	4.99	149	PG-13	2025-07-13 13:47:31.935	Action	English             
586	MOCKINGBIRD HOLLYWOOD	2006	0.99	60	PG	2025-07-13 13:47:31.935	Action	English             
594	MONTEZUMA COMMAND	2006	0.99	126	NC-17	2025-07-13 13:47:31.935	Action	English             
659	PARK CITIZEN	2006	4.99	109	PG-13	2025-07-13 13:47:31.935	Action	English             
664	PATRIOT ROMAN	2006	2.99	65	PG	2025-07-13 13:47:31.935	Action	English             
697	PRIMARY GLASS	2006	0.99	53	G	2025-07-13 13:47:31.935	Action	English             
707	QUEST MUSSOLINI	2006	2.99	177	R	2025-07-13 13:47:31.935	Action	English             
717	REAR TRADING	2006	0.99	97	NC-17	2025-07-13 13:47:31.935	Action	English             
732	RINGS HEARTBREAKERS	2006	0.99	58	G	2025-07-13 13:47:31.935	Action	English             
748	RUGRATS SHAKESPEARE	2006	0.99	109	PG-13	2025-07-13 13:47:31.935	Action	English             
793	SHRUNK DIVINE	2006	2.99	139	R	2025-07-13 13:47:31.935	Action	English             
794	SIDE ARK	2006	0.99	52	G	2025-07-13 13:47:31.935	Action	English             
802	SKY MIRACLE	2006	2.99	132	PG	2025-07-13 13:47:31.935	Action	English             
823	SOUTH WAIT	2006	2.99	143	R	2025-07-13 13:47:31.935	Action	English             
825	SPEAKEASY DATE	2006	2.99	165	PG-13	2025-07-13 13:47:31.935	Action	English             
838	STAGECOACH ARMAGEDDON	2006	4.99	112	R	2025-07-13 13:47:31.935	Action	English             
850	STORY SIDE	2006	0.99	163	R	2025-07-13 13:47:31.935	Action	English             
901	TRACY CIDER	2006	0.99	142	G	2025-07-13 13:47:31.936	Animation	English             
370	GORGEOUS BINGO	2006	2.99	108	R	2025-07-13 13:47:31.936	Children	English             
373	GRADUATE LORD	2006	2.99	156	G	2025-07-13 13:47:31.936	Children	English             
392	HALL CASSIDY	2006	4.99	51	NC-17	2025-07-13 13:47:31.936	Children	English             
409	HEARTBREAKERS BRIGHT	2006	4.99	59	G	2025-07-13 13:47:31.936	Children	English             
423	HOLLYWOOD ANONYMOUS	2006	0.99	69	PG	2025-07-13 13:47:31.936	Children	English             
424	HOLOCAUST HIGHBALL	2006	0.99	149	R	2025-07-13 13:47:31.936	Children	English             
450	IDOLS SNATCHERS	2006	2.99	84	NC-17	2025-07-13 13:47:31.936	Children	English             
468	INVASION CYCLONE	2006	2.99	97	PG	2025-07-13 13:47:31.936	Children	English             
541	LUKE MUMMY	2006	2.99	74	NC-17	2025-07-13 13:47:31.935	Animation	English             
564	MASSAGE IMAGE	2006	2.99	161	PG	2025-07-13 13:47:31.935	Animation	English             
569	MENAGERIE RUSHMORE	2006	2.99	147	G	2025-07-13 13:47:31.935	Animation	English             
582	MIRACLE VIRTUAL	2006	2.99	162	PG-13	2025-07-13 13:47:31.935	Animation	English             
583	MISSION ZOOLANDER	2006	4.99	164	PG-13	2025-07-13 13:47:31.935	Animation	English             
615	NASH CHOCOLAT	2006	2.99	180	PG-13	2025-07-13 13:47:31.935	Animation	English             
644	OSCAR GOLD	2006	2.99	115	PG	2025-07-13 13:47:31.935	Animation	English             
649	OZ LIAISONS	2006	2.99	85	R	2025-07-13 13:47:31.935	Animation	English             
651	PACKER MADIGAN	2006	0.99	84	PG-13	2025-07-13 13:47:31.935	Animation	English             
690	POND SEATTLE	2006	2.99	185	PG-13	2025-07-13 13:47:31.935	Animation	English             
692	POTLUCK MIXED	2006	2.99	179	G	2025-07-13 13:47:31.935	Animation	English             
693	POTTER CONNECTICUT	2006	2.99	115	PG	2025-07-13 13:47:31.935	Animation	English             
696	PRIDE ALAMO	2006	0.99	114	NC-17	2025-07-13 13:47:31.935	Animation	English             
703	PUNK DIVORCE	2006	4.99	100	PG	2025-07-13 13:47:31.935	Animation	English             
743	ROOM ROMAN	2006	0.99	60	PG	2025-07-13 13:47:31.935	Animation	English             
805	SLEEPLESS MONSOON	2006	4.99	64	G	2025-07-13 13:47:31.935	Animation	English             
816	SNOWMAN ROLLERCOASTER	2006	0.99	62	G	2025-07-13 13:47:31.935	Animation	English             
820	SONS INTERVIEW	2006	2.99	184	NC-17	2025-07-13 13:47:31.935	Animation	English             
849	STORM HAPPINESS	2006	0.99	57	NC-17	2025-07-13 13:47:31.935	Animation	English             
859	SUGAR WONKA	2006	4.99	114	PG	2025-07-13 13:47:31.935	Animation	English             
865	SUNRISE LEAGUE	2006	4.99	135	PG-13	2025-07-13 13:47:31.935	Animation	English             
880	TELEMARK HEARTBREAKERS	2006	2.99	152	PG-13	2025-07-13 13:47:31.935	Animation	English             
886	THEORY MERMAID	2006	0.99	184	PG-13	2025-07-13 13:47:31.935	Animation	English             
887	THIEF PELICAN	2006	4.99	135	PG-13	2025-07-13 13:47:31.935	Animation	English             
892	TITANIC BOONDOCK	2006	4.99	104	R	2025-07-13 13:47:31.935	Animation	English             
869	SUSPECTS QUILLS	2006	2.99	47	PG	2025-07-13 13:47:31.936	Action	English             
241	DONNIE ALLEY	2006	0.99	125	NC-17	2025-07-13 13:47:31.936	Animation	English             
485	JERSEY SASSY	2006	4.99	60	PG	2025-07-13 13:47:31.936	Children	English             
491	JUMPING WRATH	2006	0.99	74	NC-17	2025-07-13 13:47:31.936	Children	English             
505	LABYRINTH LEAGUE	2006	2.99	46	PG-13	2025-07-13 13:47:31.936	Children	English             
509	LANGUAGE COWBOY	2006	0.99	78	NC-17	2025-07-13 13:47:31.936	Children	English             
515	LEGALLY SECRETARY	2006	4.99	113	PG	2025-07-13 13:47:31.936	Children	English             
547	MAGIC MALLRATS	2006	0.99	117	PG	2025-07-13 13:47:31.936	Children	English             
553	MAKER GABLES	2006	0.99	136	PG-13	2025-07-13 13:47:31.936	Children	English             
573	MICROCOSMOS PARADISE	2006	2.99	105	PG-13	2025-07-13 13:47:31.936	Children	English             
588	MODEL FISH	2006	4.99	175	NC-17	2025-07-13 13:47:31.936	Children	English             
608	MURDER ANTITRUST	2006	2.99	166	PG	2025-07-13 13:47:31.936	Children	English             
626	NOON PAPI	2006	2.99	57	G	2025-07-13 13:47:31.936	Children	English             
688	POLISH BROOKLYN	2006	0.99	61	PG	2025-07-13 13:47:31.936	Children	English             
735	ROBBERS JOON	2006	2.99	102	PG-13	2025-07-13 13:47:31.936	Children	English             
755	SABRINA MIDNIGHT	2006	4.99	99	PG	2025-07-13 13:47:31.936	Children	English             
761	SANTA PARIS	2006	2.99	154	PG	2025-07-13 13:47:31.936	Children	English             
768	SCARFACE BANG	2006	4.99	102	PG-13	2025-07-13 13:47:31.936	Children	English             
786	SHEPHERD MIDSUMMER	2006	0.99	113	R	2025-07-13 13:47:31.936	Children	English             
801	SISTER FREDDY	2006	4.99	152	PG-13	2025-07-13 13:47:31.936	Children	English             
833	SPLENDOR PATTON	2006	0.99	134	R	2025-07-13 13:47:31.936	Children	English             
852	STRANGELOVE DESIRE	2006	0.99	103	NC-17	2025-07-13 13:47:31.936	Children	English             
853	STRANGER STRANGERS	2006	4.99	139	G	2025-07-13 13:47:31.936	Children	English             
243	DOORS PRESIDENT	2006	4.99	49	NC-17	2025-07-13 13:47:31.936	Animation	English             
245	DOUBLE WRATH	2006	0.99	177	R	2025-07-13 13:47:31.936	Animation	English             
259	DUCK RACER	2006	2.99	116	NC-17	2025-07-13 13:47:31.936	Animation	English             
268	EARLY HOME	2006	4.99	96	NC-17	2025-07-13 13:47:31.936	Animation	English             
300	FALCON VOLUME	2006	4.99	102	PG-13	2025-07-13 13:47:31.936	Animation	English             
314	FIGHT JAWBREAKER	2006	0.99	91	R	2025-07-13 13:47:31.936	Animation	English             
325	FLOATS GARDEN	2006	2.99	145	PG-13	2025-07-13 13:47:31.936	Animation	English             
326	FLYING HOOK	2006	2.99	69	NC-17	2025-07-13 13:47:31.936	Animation	English             
330	FORRESTER COMANCHEROS	2006	4.99	112	NC-17	2025-07-13 13:47:31.936	Animation	English             
349	GANGS PRIDE	2006	2.99	185	PG-13	2025-07-13 13:47:31.936	Animation	English             
355	GHOSTBUSTERS ELF	2006	0.99	101	R	2025-07-13 13:47:31.936	Animation	English             
402	HARPER DYING	2006	0.99	52	G	2025-07-13 13:47:31.936	Animation	English             
430	HOOK CHARIOTS	2006	0.99	49	G	2025-07-13 13:47:31.936	Animation	English             
433	HORN WORKING	2006	2.99	95	PG	2025-07-13 13:47:31.936	Animation	English             
456	INCH JET	2006	4.99	167	NC-17	2025-07-13 13:47:31.936	Animation	English             
461	INSECTS STONE	2006	0.99	123	NC-17	2025-07-13 13:47:31.936	Animation	English             
464	INTENTIONS EMPIRE	2006	2.99	107	PG-13	2025-07-13 13:47:31.936	Animation	English             
470	ISHTAR ROCKETEER	2006	4.99	79	R	2025-07-13 13:47:31.936	Animation	English             
489	JUGGLER HARDLY	2006	0.99	54	PG-13	2025-07-13 13:47:31.936	Animation	English             
510	LAWLESS VISION	2006	4.99	181	G	2025-07-13 13:47:31.936	Animation	English             
916	TURN STAR	2006	2.99	80	G	2025-07-13 13:47:31.936	Animation	English             
953	WAIT CIDER	2006	0.99	112	PG-13	2025-07-13 13:47:31.936	Animation	English             
963	WATCH TRACY	2006	0.99	78	PG	2025-07-13 13:47:31.936	Animation	English             
986	WONKA SEA	2006	2.99	85	NC-17	2025-07-13 13:47:31.936	Animation	English             
48	BACKLASH UNDEFEATED	2006	4.99	118	PG-13	2025-07-13 13:47:31.936	Children	English             
59	BEAR GRACELAND	2006	2.99	160	R	2025-07-13 13:47:31.936	Children	English             
66	BENEATH RUSH	2006	0.99	53	NC-17	2025-07-13 13:47:31.936	Children	English             
68	BETRAYED REAR	2006	4.99	122	NC-17	2025-07-13 13:47:31.936	Children	English             
196	CRUELTY UNFORGIVEN	2006	0.99	69	G	2025-07-13 13:47:31.936	Classics	English             
228	DETECTIVE VISION	2006	0.99	143	PG-13	2025-07-13 13:47:31.936	Classics	English             
249	DRACULA CRYSTAL	2006	0.99	176	G	2025-07-13 13:47:31.936	Classics	English             
266	DYNAMITE TARZAN	2006	0.99	141	PG-13	2025-07-13 13:47:31.936	Classics	English             
297	EXTRAORDINARY CONQUERER	2006	2.99	122	G	2025-07-13 13:47:31.936	Classics	English             
341	FROST HEAD	2006	0.99	82	PG	2025-07-13 13:47:31.936	Classics	English             
346	GALAXY SWEETHEARTS	2006	4.99	128	R	2025-07-13 13:47:31.936	Classics	English             
357	GILBERT PELICAN	2006	0.99	114	G	2025-07-13 13:47:31.936	Classics	English             
358	GILMORE BOILED	2006	0.99	163	R	2025-07-13 13:47:31.936	Classics	English             
425	HOLY TADPOLE	2006	0.99	88	R	2025-07-13 13:47:31.936	Classics	English             
432	HOPE TOOTSIE	2006	2.99	139	NC-17	2025-07-13 13:47:31.936	Classics	English             
445	HYDE DOCTOR	2006	2.99	100	G	2025-07-13 13:47:31.936	Classics	English             
469	IRON MOON	2006	4.99	46	PG	2025-07-13 13:47:31.936	Classics	English             
471	ISLAND EXORCIST	2006	2.99	84	NC-17	2025-07-13 13:47:31.936	Classics	English             
480	JEEPERS WEDDING	2006	2.99	84	R	2025-07-13 13:47:31.936	Classics	English             
482	JEOPARDY ENCINO	2006	0.99	102	R	2025-07-13 13:47:31.936	Classics	English             
484	JERK PAYCHECK	2006	2.99	172	NC-17	2025-07-13 13:47:31.936	Classics	English             
487	JINGLE SAGEBRUSH	2006	4.99	124	PG-13	2025-07-13 13:47:31.936	Classics	English             
512	LEAGUE HELLFIGHTERS	2006	4.99	110	PG-13	2025-07-13 13:47:31.936	Classics	English             
523	LIGHTS DEER	2006	0.99	174	R	2025-07-13 13:47:31.936	Classics	English             
525	LOATHING LEGALLY	2006	0.99	140	R	2025-07-13 13:47:31.936	Classics	English             
536	LOVELY JINGLE	2006	2.99	65	PG	2025-07-13 13:47:31.936	Classics	English             
537	LOVER TRUMAN	2006	2.99	75	G	2025-07-13 13:47:31.936	Classics	English             
110	CABIN FLASH	2006	0.99	53	NC-17	2025-07-13 13:47:31.936	Children	English             
124	CASPER DRAGONFLY	2006	4.99	163	PG-13	2025-07-13 13:47:31.936	Children	English             
149	CHRISTMAS MOONSHINE	2006	0.99	150	NC-17	2025-07-13 13:47:31.936	Children	English             
152	CIRCUS YOUTH	2006	2.99	90	PG-13	2025-07-13 13:47:31.936	Children	English             
157	CLOCKWORK PARADISE	2006	0.99	143	PG-13	2025-07-13 13:47:31.936	Children	English             
168	COMANCHEROS ENEMY	2006	0.99	67	R	2025-07-13 13:47:31.936	Children	English             
191	CROOKED FROGMEN	2006	0.99	143	PG-13	2025-07-13 13:47:31.936	Children	English             
214	DAUGHTER MADIGAN	2006	4.99	59	PG-13	2025-07-13 13:47:31.936	Children	English             
238	DOCTOR GRAIL	2006	2.99	57	G	2025-07-13 13:47:31.936	Children	English             
280	EMPIRE MALKOVICH	2006	0.99	177	G	2025-07-13 13:47:31.936	Children	English             
304	FARGO GANDHI	2006	2.99	130	G	2025-07-13 13:47:31.936	Children	English             
328	FOREVER CANDIDATE	2006	2.99	131	NC-17	2025-07-13 13:47:31.936	Children	English             
343	FULL FLATLINERS	2006	2.99	94	PG	2025-07-13 13:47:31.936	Children	English             
344	FURY MURDER	2006	0.99	178	PG-13	2025-07-13 13:47:31.936	Children	English             
354	GHOST GROUNDHOG	2006	4.99	85	G	2025-07-13 13:47:31.936	Children	English             
356	GIANT TROOPERS	2006	2.99	102	R	2025-07-13 13:47:31.936	Children	English             
815	SNATCHERS MONTEZUMA	2006	2.99	74	PG-13	2025-07-13 13:47:31.936	Classics	English             
828	SPIKING ELEMENT	2006	2.99	79	G	2025-07-13 13:47:31.936	Classics	English             
843	STEEL SANTA	2006	4.99	143	NC-17	2025-07-13 13:47:31.938	Classics	English             
862	SUMMER SCARFACE	2006	0.99	53	G	2025-07-13 13:47:31.938	Classics	English             
874	TADPOLE PARK	2006	2.99	155	PG	2025-07-13 13:47:31.938	Classics	English             
891	TIMBERLAND SKY	2006	0.99	69	G	2025-07-13 13:47:31.938	Classics	English             
895	TOMORROW HUSTLER	2006	2.99	142	R	2025-07-13 13:47:31.938	Classics	English             
899	TOWERS HURRICANE	2006	0.99	144	NC-17	2025-07-13 13:47:31.938	Classics	English             
950	VOLUME HOUSE	2006	4.99	132	PG	2025-07-13 13:47:31.938	Classics	English             
951	VOYAGE LEGALLY	2006	0.99	78	PG-13	2025-07-13 13:47:31.938	Classics	English             
962	WASTELAND DIVINE	2006	2.99	85	PG	2025-07-13 13:47:31.938	Classics	English             
970	WESTWARD SEABISCUIT	2006	0.99	52	NC-17	2025-07-13 13:47:31.938	Classics	English             
7	AIRPLANE SIERRA	2006	4.99	62	PG-13	2025-07-13 13:47:31.938	Comedy	English             
28	ANTHEM LUKE	2006	4.99	91	PG-13	2025-07-13 13:47:31.938	Comedy	English             
99	BRINGING HYSTERICAL	2006	2.99	136	PG	2025-07-13 13:47:31.938	Comedy	English             
119	CAPER MOTIONS	2006	0.99	176	G	2025-07-13 13:47:31.938	Comedy	English             
365	GOLD RIVER	2006	4.99	154	R	2025-07-13 13:47:31.938	Comedy	English             
385	GROUNDHOG UNCUT	2006	4.99	139	PG-13	2025-07-13 13:47:31.938	Comedy	English             
388	GUNFIGHT MOON	2006	0.99	70	NC-17	2025-07-13 13:47:31.938	Comedy	English             
404	HATE HANDICAP	2006	0.99	107	PG	2025-07-13 13:47:31.938	Comedy	English             
410	HEAVEN FREEDOM	2006	2.99	48	PG	2025-07-13 13:47:31.938	Comedy	English             
413	HEDWIG ALTER	2006	2.99	169	NC-17	2025-07-13 13:47:31.938	Comedy	English             
443	HURRICANE AFFAIR	2006	2.99	49	PG	2025-07-13 13:47:31.938	Comedy	English             
444	HUSTLER PARTY	2006	4.99	83	NC-17	2025-07-13 13:47:31.938	Comedy	English             
478	JAWS HARRY	2006	2.99	112	G	2025-07-13 13:47:31.938	Comedy	English             
502	KNOCK WARLOCK	2006	2.99	71	PG-13	2025-07-13 13:47:31.938	Comedy	English             
522	LIFE TWISTED	2006	2.99	137	NC-17	2025-07-13 13:47:31.938	Comedy	English             
524	LION UNCUT	2006	0.99	50	PG	2025-07-13 13:47:31.938	Comedy	English             
529	LONELY ELEPHANT	2006	2.99	67	G	2025-07-13 13:47:31.938	Comedy	English             
555	MALLRATS UNITED	2006	0.99	133	PG	2025-07-13 13:47:31.938	Comedy	English             
568	MEMENTO ZOOLANDER	2006	4.99	77	NC-17	2025-07-13 13:47:31.938	Comedy	English             
604	MULAN MOON	2006	0.99	160	G	2025-07-13 13:47:31.938	Comedy	English             
613	MYSTIC TRUMAN	2006	0.99	92	NC-17	2025-07-13 13:47:31.938	Comedy	English             
638	OPERATION OPERATION	2006	2.99	156	G	2025-07-13 13:47:31.938	Comedy	English             
657	PARADISE SABRINA	2006	2.99	48	PG-13	2025-07-13 13:47:31.938	Comedy	English             
660	PARTY KNOCK	2006	2.99	107	PG	2025-07-13 13:47:31.938	Comedy	English             
672	PERFECT GROOVE	2006	2.99	82	PG-13	2025-07-13 13:47:31.938	Comedy	English             
680	PINOCCHIO SIMON	2006	4.99	103	PG	2025-07-13 13:47:31.938	Comedy	English             
704	PURE RUNNER	2006	2.99	121	NC-17	2025-07-13 13:47:31.938	Comedy	English             
754	RUSHMORE MERMAID	2006	2.99	150	PG-13	2025-07-13 13:47:31.938	Comedy	English             
756	SADDLE ANTITRUST	2006	2.99	80	PG-13	2025-07-13 13:47:31.938	Comedy	English             
765	SATURN NAME	2006	4.99	182	R	2025-07-13 13:47:31.938	Comedy	English             
774	SEARCHERS WAIT	2006	2.99	182	NC-17	2025-07-13 13:47:31.938	Comedy	English             
814	SNATCH SLIPPER	2006	4.99	110	PG	2025-07-13 13:47:31.938	Comedy	English             
837	STAGE WORLD	2006	2.99	85	PG	2025-07-13 13:47:31.938	Comedy	English             
857	STRICTLY SCARFACE	2006	2.99	144	PG-13	2025-07-13 13:47:31.938	Comedy	English             
858	SUBMARINE BED	2006	4.99	127	R	2025-07-13 13:47:31.938	Comedy	English             
871	SWEDEN SHINING	2006	4.99	176	PG	2025-07-13 13:47:31.938	Comedy	English             
905	TRAINSPOTTING STRANGERS	2006	4.99	132	PG-13	2025-07-13 13:47:31.938	Comedy	English             
906	TRAMP OTHERS	2006	0.99	171	PG	2025-07-13 13:47:31.938	Comedy	English             
939	VERTIGO NORTHWEST	2006	2.99	90	R	2025-07-13 13:47:31.938	Comedy	English             
978	WISDOM WORKER	2006	0.99	98	R	2025-07-13 13:47:31.938	Comedy	English             
1000	ZORRO ARK	2006	4.99	50	NC-17	2025-07-13 13:47:31.938	Comedy	English             
1	ACADEMY DINOSAUR	2006	0.99	86	PG	2025-07-13 13:47:31.938	Documentary	English             
3	ADAPTATION HOLES	2006	2.99	50	NC-17	2025-07-13 13:47:31.938	Documentary	English             
40	ARMY FLINTSTONES	2006	0.99	148	R	2025-07-13 13:47:31.938	Documentary	English             
58	BEACH HEARTBREAKERS	2006	2.99	122	G	2025-07-13 13:47:31.938	Documentary	English             
62	BED HIGHBALL	2006	2.99	106	NC-17	2025-07-13 13:47:31.938	Documentary	English             
932	VALLEY PACKER	2006	0.99	73	G	2025-07-13 13:47:31.938	Comedy	English             
938	VELVET TERMINATOR	2006	4.99	173	R	2025-07-13 13:47:31.938	Comedy	English             
72	BILL OTHERS	2006	2.99	93	PG	2025-07-13 13:47:31.938	Documentary	English             
85	BONNIE HOLOCAUST	2006	0.99	63	G	2025-07-13 13:47:31.938	Documentary	English             
101	BROTHERHOOD BLANKET	2006	0.99	73	R	2025-07-13 13:47:31.938	Documentary	English             
129	CAUSE DATE	2006	2.99	179	R	2025-07-13 13:47:31.938	Documentary	English             
142	CHICKEN HELLFIGHTERS	2006	0.99	122	PG	2025-07-13 13:47:31.938	Documentary	English             
150	CIDER DESIRE	2006	2.99	101	PG	2025-07-13 13:47:31.938	Documentary	English             
156	CLERKS ANGELS	2006	4.99	164	G	2025-07-13 13:47:31.938	Documentary	English             
164	COAST RAINBOW	2006	0.99	55	PG	2025-07-13 13:47:31.938	Documentary	English             
199	CUPBOARD SINNERS	2006	2.99	56	R	2025-07-13 13:47:31.938	Documentary	English             
206	DANCING FEVER	2006	0.99	144	G	2025-07-13 13:47:31.938	Documentary	English             
219	DEEP CRUSADE	2006	4.99	51	PG-13	2025-07-13 13:47:31.938	Documentary	English             
221	DELIVERANCE MULHOLLAND	2006	0.99	100	R	2025-07-13 13:47:31.938	Documentary	English             
248	DOZEN LION	2006	4.99	177	NC-17	2025-07-13 13:47:31.938	Documentary	English             
261	DUFFEL APOCALYPSE	2006	0.99	171	G	2025-07-13 13:47:31.938	Documentary	English             
274	EGG IGBY	2006	2.99	67	PG	2025-07-13 13:47:31.938	Documentary	English             
295	EXPENDABLE STALLION	2006	0.99	97	PG	2025-07-13 13:47:31.938	Documentary	English             
336	FRENCH HOLIDAY	2006	4.99	99	PG	2025-07-13 13:47:31.938	Documentary	English             
393	HALLOWEEN NUTS	2006	2.99	47	PG-13	2025-07-13 13:47:31.938	Documentary	English             
400	HARDLY ROBBERS	2006	2.99	72	R	2025-07-13 13:47:31.938	Documentary	English             
407	HAWK CHILL	2006	0.99	47	PG-13	2025-07-13 13:47:31.938	Documentary	English             
412	HEAVYWEIGHTS BEAST	2006	4.99	102	G	2025-07-13 13:47:31.938	Documentary	English             
427	HOMEWARD CIDER	2006	0.99	103	R	2025-07-13 13:47:31.938	Documentary	English             
441	HUNTER ALTER	2006	2.99	125	PG-13	2025-07-13 13:47:31.938	Documentary	English             
457	INDEPENDENCE HOTEL	2006	0.99	157	NC-17	2025-07-13 13:47:31.938	Documentary	English             
466	INTOLERABLE INTENTIONS	2006	4.99	63	PG-13	2025-07-13 13:47:31.938	Documentary	English             
497	KILL BROTHERHOOD	2006	0.99	54	G	2025-07-13 13:47:31.938	Documentary	English             
544	MADISON TRAP	2006	2.99	147	R	2025-07-13 13:47:31.938	Documentary	English             
552	MAJESTIC FLOATS	2006	0.99	130	PG	2025-07-13 13:47:31.938	Documentary	English             
571	METAL ARMAGEDDON	2006	2.99	161	PG-13	2025-07-13 13:47:31.938	Documentary	English             
575	MIDSUMMER GROUNDHOG	2006	4.99	48	G	2025-07-13 13:47:31.938	Documentary	English             
576	MIGHTY LUCK	2006	2.99	122	PG	2025-07-13 13:47:31.938	Documentary	English             
587	MOD SECRETARY	2006	4.99	77	NC-17	2025-07-13 13:47:31.938	Documentary	English             
589	MODERN DORADO	2006	0.99	74	PG	2025-07-13 13:47:31.938	Documentary	English             
616	NATIONAL STORY	2006	2.99	92	NC-17	2025-07-13 13:47:31.938	Documentary	English             
622	NEWSIES STORY	2006	0.99	159	G	2025-07-13 13:47:31.938	Documentary	English             
627	NORTH TEQUILA	2006	4.99	67	NC-17	2025-07-13 13:47:31.938	Documentary	English             
629	NOTORIOUS REUNION	2006	0.99	128	NC-17	2025-07-13 13:47:31.938	Documentary	English             
650	PACIFIC AMISTAD	2006	0.99	144	G	2025-07-13 13:47:31.938	Documentary	English             
670	PELICAN COMFORTS	2006	4.99	48	PG	2025-07-13 13:47:31.938	Documentary	English             
687	POCUS PULP	2006	0.99	138	NC-17	2025-07-13 13:47:31.938	Documentary	English             
698	PRINCESS GIANT	2006	2.99	71	NC-17	2025-07-13 13:47:31.938	Documentary	English             
172	CONEHEADS SMOOCHY	2006	4.99	112	NC-17	2025-07-13 13:47:31.938	Drama	English             
173	CONFESSIONS MAGUIRE	2006	4.99	65	PG-13	2025-07-13 13:47:31.938	Drama	English             
179	CONQUERER NUTS	2006	4.99	173	G	2025-07-13 13:47:31.938	Drama	English             
186	CRAFT OUTFIELD	2006	0.99	64	NC-17	2025-07-13 13:47:31.938	Drama	English             
204	DALMATIONS SWEDEN	2006	0.99	106	PG	2025-07-13 13:47:31.938	Drama	English             
209	DARKNESS WAR	2006	2.99	99	NC-17	2025-07-13 13:47:31.938	Drama	English             
218	DECEIVER BETRAYED	2006	0.99	122	NC-17	2025-07-13 13:47:31.938	Drama	English             
225	DESTINATION JERK	2006	0.99	76	PG-13	2025-07-13 13:47:31.938	Drama	English             
230	DIARY PANIC	2006	2.99	107	G	2025-07-13 13:47:31.938	Drama	English             
272	EDGE KISSING	2006	4.99	153	NC-17	2025-07-13 13:47:31.938	Drama	English             
282	ENCOUNTERS CURTAIN	2006	0.99	92	NC-17	2025-07-13 13:47:31.938	Drama	English             
366	GOLDFINGER SENSIBILITY	2006	0.99	93	G	2025-07-13 13:47:31.938	Drama	English             
368	GONE TROUBLE	2006	2.99	84	R	2025-07-13 13:47:31.938	Drama	English             
379	GREEDY ROOTS	2006	0.99	166	R	2025-07-13 13:47:31.938	Drama	English             
396	HANGING DEEP	2006	4.99	62	G	2025-07-13 13:47:31.938	Drama	English             
401	HAROLD FRENCH	2006	0.99	168	NC-17	2025-07-13 13:47:31.938	Drama	English             
403	HARRY IDAHO	2006	4.99	121	PG-13	2025-07-13 13:47:31.938	Drama	English             
418	HOBBIT ALIEN	2006	0.99	157	PG-13	2025-07-13 13:47:31.938	Drama	English             
439	HUNCHBACK IMPOSSIBLE	2006	4.99	151	PG-13	2025-07-13 13:47:31.938	Drama	English             
958	WARDROBE PHANTOM	2006	2.99	178	G	2025-07-13 13:47:31.938	Drama	English             
969	WEST LION	2006	4.99	159	G	2025-07-13 13:47:31.938	Drama	English             
979	WITCHES PANIC	2006	4.99	100	NC-17	2025-07-13 13:47:31.938	Drama	English             
5	AFRICAN EGG	2006	2.99	130	G	2025-07-13 13:47:31.938	Family	English             
31	APACHE DIVINE	2006	4.99	92	NC-17	2025-07-13 13:47:31.938	Family	English             
473	JACKET FRISCO	2006	2.99	181	PG-13	2025-07-13 13:47:31.938	Drama	English             
504	KWAI HOMEWARD	2006	0.99	46	PG-13	2025-07-13 13:47:31.938	Drama	English             
514	LEBOWSKI SOLDIERS	2006	2.99	69	PG-13	2025-07-13 13:47:31.938	Drama	English             
521	LIES TREATMENT	2006	4.99	147	NC-17	2025-07-13 13:47:31.938	Drama	English             
539	LUCK OPUS	2006	2.99	152	NC-17	2025-07-13 13:47:31.938	Drama	English             
585	MOB DUFFEL	2006	0.99	105	G	2025-07-13 13:47:31.938	Drama	English             
618	NECKLACE OUTBREAK	2006	0.99	132	PG	2025-07-13 13:47:31.938	Drama	English             
630	NOTTING SPEAKEASY	2006	0.99	48	PG-13	2025-07-13 13:47:31.938	Drama	English             
643	ORIENT CLOSER	2006	2.99	118	R	2025-07-13 13:47:31.938	Drama	English             
662	PATHS CONTROL	2006	4.99	118	PG	2025-07-13 13:47:31.938	Drama	English             
666	PAYCHECK WAIT	2006	4.99	145	PG-13	2025-07-13 13:47:31.938	Drama	English             
683	PITY BOUND	2006	4.99	60	NC-17	2025-07-13 13:47:31.938	Drama	English             
706	QUEEN LUKE	2006	4.99	163	PG	2025-07-13 13:47:31.938	Drama	English             
709	RACER EGG	2006	2.99	147	NC-17	2025-07-13 13:47:31.938	Drama	English             
728	REUNION WITCHES	2006	0.99	63	R	2025-07-13 13:47:31.938	Drama	English             
739	ROCKY WAR	2006	4.99	145	PG-13	2025-07-13 13:47:31.938	Drama	English             
758	SAINTS BRIDE	2006	2.99	125	G	2025-07-13 13:47:31.938	Drama	English             
766	SAVANNAH TOWN	2006	0.99	84	PG-13	2025-07-13 13:47:31.938	Drama	English             
771	SCORPION APOLLO	2006	4.99	137	NC-17	2025-07-13 13:47:31.938	Drama	English             
772	SEA VIRGIN	2006	2.99	80	PG	2025-07-13 13:47:31.938	Drama	English             
775	SEATTLE EXPECATIONS	2006	4.99	110	PG-13	2025-07-13 13:47:31.938	Drama	English             
790	SHOOTIST SUPERFLY	2006	0.99	67	PG-13	2025-07-13 13:47:31.938	Drama	English             
803	SLACKER LIAISONS	2006	4.99	179	R	2025-07-13 13:47:31.938	Drama	English             
818	SOMETHING DUCK	2006	4.99	180	NC-17	2025-07-13 13:47:31.938	Drama	English             
827	SPICE SORORITY	2006	4.99	141	NC-17	2025-07-13 13:47:31.938	Drama	English             
882	TENENBAUMS COMMAND	2006	0.99	99	PG-13	2025-07-13 13:47:31.938	Drama	English             
897	TORQUE BOUND	2006	4.99	179	G	2025-07-13 13:47:31.938	Drama	English             
907	TRANSLATION SUMMER	2006	0.99	168	PG-13	2025-07-13 13:47:31.938	Drama	English             
910	TREATMENT JEKYLL	2006	0.99	87	PG	2025-07-13 13:47:31.938	Drama	English             
923	UNFAITHFUL KILL	2006	2.99	78	R	2025-07-13 13:47:31.938	Drama	English             
942	VIETNAM SMOOCHY	2006	0.99	174	PG-13	2025-07-13 13:47:31.938	Drama	English             
944	VIRGIN DAISY	2006	4.99	179	PG-13	2025-07-13 13:47:31.938	Drama	English             
43	ATLANTIS CAUSE	2006	2.99	170	G	2025-07-13 13:47:31.938	Family	English             
50	BAKED CLEOPATRA	2006	2.99	182	G	2025-07-13 13:47:31.938	Family	English             
53	BANG KWAI	2006	2.99	87	NC-17	2025-07-13 13:47:31.938	Family	English             
63	BEDAZZLED MARRIED	2006	0.99	73	PG	2025-07-13 13:47:31.938	Family	English             
71	BILKO ANONYMOUS	2006	4.99	100	PG-13	2025-07-13 13:47:31.938	Family	English             
80	BLANKET BEVERLY	2006	2.99	148	G	2025-07-13 13:47:31.938	Family	English             
82	BLOOD ARGONAUTS	2006	0.99	71	G	2025-07-13 13:47:31.938	Family	English             
83	BLUES INSTINCT	2006	2.99	50	G	2025-07-13 13:47:31.938	Family	English             
94	BRAVEHEART HUMAN	2006	2.99	176	PG-13	2025-07-13 13:47:31.938	Family	English             
139	CHASING FIGHT	2006	4.99	114	PG	2025-07-13 13:47:31.938	Family	English             
145	CHISUM BEHAVIOR	2006	4.99	124	G	2025-07-13 13:47:31.938	Family	English             
147	CHOCOLAT HARRY	2006	0.99	101	NC-17	2025-07-13 13:47:31.938	Family	English             
175	CONFUSED CANDLES	2006	2.99	122	PG-13	2025-07-13 13:47:31.938	Family	English             
183	CONVERSATION DOWNHILL	2006	4.99	112	R	2025-07-13 13:47:31.938	Family	English             
715	RANGE MOONWALKER	2006	4.99	147	PG	2025-07-13 13:47:31.938	Family	English             
724	REMEMBER DIARY	2006	2.99	110	R	2025-07-13 13:47:31.938	Family	English             
727	RESURRECTION SILVERADO	2006	0.99	117	PG	2025-07-13 13:47:31.938	Family	English             
736	ROBBERY BRIGHT	2006	0.99	134	R	2025-07-13 13:47:31.938	Family	English             
753	RUSH GOODFELLAS	2006	0.99	48	PG	2025-07-13 13:47:31.938	Family	English             
778	SECRETS PARADISE	2006	4.99	109	G	2025-07-13 13:47:31.938	Family	English             
780	SENSIBILITY REAR	2006	4.99	98	PG	2025-07-13 13:47:31.938	Family	English             
795	SIEGE MADRE	2006	0.99	111	R	2025-07-13 13:47:31.938	Family	English             
810	SLUMS DUCK	2006	0.99	147	PG	2025-07-13 13:47:31.938	Family	English             
822	SOUP WISDOM	2006	0.99	169	R	2025-07-13 13:47:31.938	Family	English             
824	SPARTACUS CHEAPER	2006	4.99	52	NC-17	2025-07-13 13:47:31.938	Family	English             
829	SPINAL ROCKY	2006	2.99	138	PG-13	2025-07-13 13:47:31.938	Family	English             
832	SPLASH GUMP	2006	0.99	175	PG	2025-07-13 13:47:31.938	Family	English             
185	COWBOY DOOM	2006	2.99	146	PG	2025-07-13 13:47:31.938	Foreign	English             
192	CROSSING DIVORCE	2006	4.99	50	R	2025-07-13 13:47:31.938	Foreign	English             
198	CRYSTAL BREAKING	2006	2.99	184	NC-17	2025-07-13 13:47:31.938	Foreign	English             
201	CYCLONE FAMILY	2006	2.99	176	PG	2025-07-13 13:47:31.938	Foreign	English             
207	DANGEROUS UPTOWN	2006	4.99	121	PG	2025-07-13 13:47:31.938	Foreign	English             
246	DOUBTFIRE LABYRINTH	2006	4.99	154	R	2025-07-13 13:47:31.938	Foreign	English             
290	EVERYONE CRAFT	2006	0.99	163	PG	2025-07-13 13:47:31.938	Foreign	English             
311	FICTION CHRISTMAS	2006	0.99	72	PG	2025-07-13 13:47:31.938	Foreign	English             
337	FRIDA SLIPPER	2006	2.99	73	R	2025-07-13 13:47:31.938	Foreign	English             
353	GENTLEMEN STAGE	2006	2.99	125	NC-17	2025-07-13 13:47:31.938	Foreign	English             
376	GRAPES FURY	2006	0.99	155	G	2025-07-13 13:47:31.938	Foreign	English             
380	GREEK EVERYONE	2006	2.99	176	PG	2025-07-13 13:47:31.938	Foreign	English             
399	HAPPINESS UNITED	2006	2.99	100	G	2025-07-13 13:47:31.938	Foreign	English             
414	HELLFIGHTERS SIERRA	2006	2.99	75	PG	2025-07-13 13:47:31.938	Foreign	English             
416	HIGHBALL POTTER	2006	0.99	110	R	2025-07-13 13:47:31.938	Foreign	English             
421	HOLIDAY GAMES	2006	4.99	78	PG-13	2025-07-13 13:47:31.938	Foreign	English             
431	HOOSIERS BIRDCAGE	2006	2.99	176	G	2025-07-13 13:47:31.938	Foreign	English             
435	HOTEL HAPPINESS	2006	4.99	181	PG-13	2025-07-13 13:47:31.938	Foreign	English             
440	HUNGER ROOF	2006	0.99	105	G	2025-07-13 13:47:31.938	Foreign	English             
452	ILLUSION AMELIE	2006	0.99	122	R	2025-07-13 13:47:31.938	Foreign	English             
455	IMPOSSIBLE PREJUDICE	2006	4.99	103	NC-17	2025-07-13 13:47:31.938	Foreign	English             
459	INFORMER DOUBLE	2006	4.99	74	NC-17	2025-07-13 13:47:31.938	Foreign	English             
460	INNOCENT USUAL	2006	4.99	178	PG-13	2025-07-13 13:47:31.938	Foreign	English             
467	INTRIGUE WORST	2006	0.99	181	G	2025-07-13 13:47:31.938	Foreign	English             
866	SUNSET RACER	2006	0.99	48	NC-17	2025-07-13 13:47:31.938	Family	English             
867	SUPER WYOMING	2006	4.99	58	PG	2025-07-13 13:47:31.938	Family	English             
946	VIRTUAL SPOILERS	2006	4.99	144	NC-17	2025-07-13 13:47:31.938	Family	English             
975	WILLOW TRACY	2006	2.99	137	R	2025-07-13 13:47:31.938	Family	English             
6	AGENT TRUMAN	2006	2.99	169	PG	2025-07-13 13:47:31.938	Foreign	English             
11	ALAMO VIDEOTAPE	2006	0.99	126	G	2025-07-13 13:47:31.938	Foreign	English             
15	ALIEN CENTER	2006	2.99	46	NC-17	2025-07-13 13:47:31.938	Foreign	English             
16	ALLEY EVOLUTION	2006	2.99	180	NC-17	2025-07-13 13:47:31.938	Foreign	English             
47	BABY HALL	2006	4.99	153	NC-17	2025-07-13 13:47:31.938	Foreign	English             
52	BALLROOM MOCKINGBIRD	2006	0.99	173	G	2025-07-13 13:47:31.938	Foreign	English             
100	BROOKLYN DESERT	2006	4.99	161	R	2025-07-13 13:47:31.938	Foreign	English             
104	BUGSY SONG	2006	2.99	119	G	2025-07-13 13:47:31.938	Foreign	English             
112	CALENDAR GUNFIGHT	2006	4.99	120	NC-17	2025-07-13 13:47:31.938	Foreign	English             
128	CATCH AMISTAD	2006	0.99	183	G	2025-07-13 13:47:31.938	Foreign	English             
148	CHOCOLATE DUCK	2006	2.99	132	R	2025-07-13 13:47:31.938	Foreign	English             
170	COMMAND DARLING	2006	4.99	120	PG-13	2025-07-13 13:47:31.938	Foreign	English             
486	JET NEIGHBORS	2006	4.99	59	R	2025-07-13 13:47:31.938	Foreign	English             
493	KANE EXORCIST	2006	0.99	92	R	2025-07-13 13:47:31.938	Foreign	English             
500	KISS GLORY	2006	4.99	163	PG-13	2025-07-13 13:47:31.938	Foreign	English             
531	LOSE INCH	2006	0.99	137	R	2025-07-13 13:47:31.938	Foreign	English             
533	LOST BIRD	2006	2.99	98	PG-13	2025-07-13 13:47:31.938	Foreign	English             
545	MADNESS ATTACKS	2006	0.99	178	PG-13	2025-07-13 13:47:31.938	Foreign	English             
565	MATRIX SNOWMAN	2006	4.99	56	PG-13	2025-07-13 13:47:31.938	Foreign	English             
566	MAUDE MOD	2006	0.99	72	R	2025-07-13 13:47:31.938	Foreign	English             
567	MEET CHOCOLATE	2006	2.99	80	G	2025-07-13 13:47:31.938	Foreign	English             
584	MIXED DOORS	2006	2.99	180	PG-13	2025-07-13 13:47:31.938	Foreign	English             
595	MOON BUNCH	2006	0.99	83	PG	2025-07-13 13:47:31.938	Foreign	English             
605	MULHOLLAND BEAST	2006	2.99	157	PG	2025-07-13 13:47:31.938	Foreign	English             
607	MUPPET MILE	2006	4.99	50	PG	2025-07-13 13:47:31.938	Foreign	English             
623	NEWTON LABYRINTH	2006	0.99	75	PG	2025-07-13 13:47:31.938	Foreign	English             
640	OPUS ICE	2006	4.99	102	R	2025-07-13 13:47:31.938	Foreign	English             
641	ORANGE GRAPES	2006	0.99	76	PG-13	2025-07-13 13:47:31.938	Foreign	English             
661	PAST SUICIDES	2006	4.99	157	PG-13	2025-07-13 13:47:31.938	Foreign	English             
669	PEARL DESTINY	2006	2.99	74	NC-17	2025-07-13 13:47:31.938	Foreign	English             
674	PET HAUNTING	2006	0.99	99	PG	2025-07-13 13:47:31.938	Foreign	English             
689	POLLOCK DELIVERANCE	2006	2.99	137	PG	2025-07-13 13:47:31.938	Foreign	English             
705	PURPLE MOVIE	2006	2.99	88	R	2025-07-13 13:47:31.938	Foreign	English             
726	RESERVOIR ADAPTATION	2006	2.99	61	PG-13	2025-07-13 13:47:31.938	Foreign	English             
738	ROCKETEER MOTHER	2006	0.99	178	PG-13	2025-07-13 13:47:31.938	Foreign	English             
769	SCHOOL JACKET	2006	4.99	151	PG-13	2025-07-13 13:47:31.938	Foreign	English             
770	SCISSORHANDS SLUMS	2006	2.99	147	G	2025-07-13 13:47:31.938	Foreign	English             
789	SHOCK CABIN	2006	2.99	79	PG-13	2025-07-13 13:47:31.938	Foreign	English             
792	SHREK LICENSE	2006	2.99	154	PG-13	2025-07-13 13:47:31.938	Foreign	English             
106	BULWORTH COMMANDMENTS	2006	2.99	61	G	2025-07-13 13:47:31.938	Games	English             
117	CANDLES GRAPES	2006	4.99	135	NC-17	2025-07-13 13:47:31.938	Games	English             
141	CHICAGO NORTH	2006	4.99	185	PG-13	2025-07-13 13:47:31.938	Games	English             
189	CREATURES SHAKESPEARE	2006	0.99	139	NC-17	2025-07-13 13:47:31.938	Games	English             
200	CURTAIN VIDEOTAPE	2006	0.99	133	PG-13	2025-07-13 13:47:31.938	Games	English             
211	DARLING BREAKING	2006	4.99	165	PG-13	2025-07-13 13:47:31.938	Games	English             
215	DAWN POND	2006	4.99	57	PG	2025-07-13 13:47:31.938	Games	English             
217	DAZED PUNK	2006	4.99	120	G	2025-07-13 13:47:31.938	Games	English             
227	DETAILS PACKER	2006	4.99	88	R	2025-07-13 13:47:31.938	Games	English             
232	DIRTY ACE	2006	2.99	147	NC-17	2025-07-13 13:47:31.938	Games	English             
236	DIVINE RESURRECTION	2006	2.99	100	R	2025-07-13 13:47:31.938	Games	English             
264	DWARFS ALTER	2006	2.99	101	G	2025-07-13 13:47:31.938	Games	English             
281	ENCINO ELF	2006	0.99	143	G	2025-07-13 13:47:31.938	Games	English             
302	FANTASIA PARK	2006	2.99	131	G	2025-07-13 13:47:31.938	Games	English             
306	FEATHERS METAL	2006	0.99	104	PG-13	2025-07-13 13:47:31.938	Games	English             
310	FEVER EMPIRE	2006	4.99	158	R	2025-07-13 13:47:31.938	Games	English             
316	FIRE WOLVES	2006	4.99	173	R	2025-07-13 13:47:31.938	Games	English             
331	FORWARD TEMPLE	2006	2.99	90	NC-17	2025-07-13 13:47:31.938	Games	English             
352	GATHERING CALENDAR	2006	0.99	176	PG-13	2025-07-13 13:47:31.938	Games	English             
362	GLORY TRACY	2006	2.99	115	PG-13	2025-07-13 13:47:31.938	Games	English             
381	GRINCH MASSAGE	2006	4.99	150	R	2025-07-13 13:47:31.938	Games	English             
382	GRIT CLOCKWORK	2006	0.99	137	PG	2025-07-13 13:47:31.938	Games	English             
546	MADRE GABLES	2006	2.99	98	PG-13	2025-07-13 13:47:31.938	Games	English             
556	MALTESE HOPE	2006	4.99	127	PG-13	2025-07-13 13:47:31.938	Games	English             
560	MARS ROMAN	2006	0.99	62	NC-17	2025-07-13 13:47:31.938	Games	English             
563	MASSACRE USUAL	2006	4.99	165	R	2025-07-13 13:47:31.938	Games	English             
591	MONSOON CAUSE	2006	4.99	182	PG	2025-07-13 13:47:31.938	Games	English             
596	MOONSHINE CABIN	2006	4.99	171	PG-13	2025-07-13 13:47:31.938	Games	English             
597	MOONWALKER FOOL	2006	4.99	184	G	2025-07-13 13:47:31.938	Games	English             
614	NAME DETECTIVE	2006	4.99	178	PG-13	2025-07-13 13:47:31.938	Games	English             
624	NIGHTMARE CHILL	2006	4.99	149	PG	2025-07-13 13:47:31.938	Games	English             
646	OUTBREAK DIVINE	2006	0.99	169	NC-17	2025-07-13 13:47:31.938	Games	English             
654	PANKY SUBMARINE	2006	4.99	93	G	2025-07-13 13:47:31.938	Games	English             
684	PIZZA JUMANJI	2006	2.99	173	NC-17	2025-07-13 13:47:31.938	Games	English             
699	PRIVATE DROP	2006	4.99	106	PG	2025-07-13 13:47:31.938	Games	English             
701	PSYCHO SHRUNK	2006	2.99	155	PG-13	2025-07-13 13:47:31.938	Games	English             
742	ROOF CHAMPION	2006	0.99	101	R	2025-07-13 13:47:31.938	Games	English             
746	ROUGE SQUAD	2006	0.99	118	NC-17	2025-07-13 13:47:31.938	Games	English             
747	ROXANNE REBEL	2006	0.99	171	R	2025-07-13 13:47:31.938	Games	English             
762	SASSY PACKER	2006	0.99	154	G	2025-07-13 13:47:31.938	Games	English             
781	SEVEN SWARM	2006	4.99	127	R	2025-07-13 13:47:31.938	Games	English             
807	SLEUTH ORIENT	2006	0.99	87	NC-17	2025-07-13 13:47:31.938	Games	English             
835	SPY MILE	2006	2.99	112	PG-13	2025-07-13 13:47:31.938	Games	English             
840	STAMPEDE DISTURBING	2006	0.99	75	R	2025-07-13 13:47:31.938	Games	English             
842	STATE WASTELAND	2006	2.99	113	NC-17	2025-07-13 13:47:31.938	Games	English             
861	SUIT WALLS	2006	4.99	111	R	2025-07-13 13:47:31.938	Games	English             
919	TYCOON GATHERING	2006	4.99	82	G	2025-07-13 13:47:31.938	Games	English             
934	VANILLA DAY	2006	4.99	122	NC-17	2025-07-13 13:47:31.938	Games	English             
387	GUN BONNIE	2006	0.99	100	G	2025-07-13 13:47:31.938	Games	English             
406	HAUNTING PIANIST	2006	0.99	181	R	2025-07-13 13:47:31.938	Games	English             
408	HEAD STRANGER	2006	4.99	69	R	2025-07-13 13:47:31.938	Games	English             
438	HUMAN GRAFFITI	2006	2.99	68	NC-17	2025-07-13 13:47:31.938	Games	English             
447	ICE CROSSING	2006	2.99	131	R	2025-07-13 13:47:31.938	Games	English             
483	JERICHO MULAN	2006	2.99	171	NC-17	2025-07-13 13:47:31.938	Games	English             
507	LADYBUGS ARMAGEDDON	2006	0.99	113	NC-17	2025-07-13 13:47:31.938	Games	English             
508	LAMBS CINCINATTI	2006	4.99	144	PG-13	2025-07-13 13:47:31.938	Games	English             
941	VIDEOTAPE ARSENIC	2006	4.99	145	NC-17	2025-07-13 13:47:31.938	Games	English             
949	VOLCANO TEXAS	2006	0.99	157	NC-17	2025-07-13 13:47:31.938	Games	English             
956	WANDA CHAMBER	2006	4.99	107	PG-13	2025-07-13 13:47:31.938	Games	English             
976	WIND PHANTOM	2006	0.99	111	R	2025-07-13 13:47:31.938	Games	English             
2	ACE GOLDFINGER	2006	4.99	48	G	2025-07-13 13:47:31.938	Horror	English             
4	AFFAIR PREJUDICE	2006	2.99	117	G	2025-07-13 13:47:31.938	Horror	English             
8	AIRPORT POLLOCK	2006	4.99	54	R	2025-07-13 13:47:31.938	Horror	English             
9	ALABAMA DEVIL	2006	2.99	114	PG-13	2025-07-13 13:47:31.938	Horror	English             
13	ALI FOREVER	2006	4.99	150	PG	2025-07-13 13:47:31.938	Horror	English             
24	ANALYZE HOOSIERS	2006	2.99	181	R	2025-07-13 13:47:31.938	Horror	English             
30	ANYTHING SAVANNAH	2006	2.99	82	R	2025-07-13 13:47:31.938	Horror	English             
34	ARABIA DOGMA	2006	0.99	62	NC-17	2025-07-13 13:47:31.938	Horror	English             
35	ARACHNOPHOBIA ROLLERCOASTER	2006	2.99	147	PG-13	2025-07-13 13:47:31.938	Horror	English             
65	BEHAVIOR RUNAWAY	2006	4.99	100	PG	2025-07-13 13:47:31.938	Horror	English             
92	BOWFINGER GABLES	2006	4.99	72	NC-17	2025-07-13 13:47:31.938	Horror	English             
122	CARRIE BUNCH	2006	0.99	114	PG	2025-07-13 13:47:31.938	Horror	English             
171	COMMANDMENTS EXPRESS	2006	4.99	59	R	2025-07-13 13:47:31.938	Horror	English             
494	KARATE MOON	2006	0.99	120	PG-13	2025-07-13 13:47:31.947	Horror	English             
495	KENTUCKIAN GIANT	2006	2.99	169	PG	2025-07-13 13:47:31.947	Horror	English             
506	LADY STAGE	2006	4.99	67	PG	2025-07-13 13:47:31.947	Horror	English             
527	LOLA AGENT	2006	4.99	85	PG	2025-07-13 13:47:31.947	Horror	English             
535	LOVE SUICIDES	2006	0.99	181	R	2025-07-13 13:47:31.947	Horror	English             
593	MONTEREY LABYRINTH	2006	0.99	158	G	2025-07-13 13:47:31.947	Horror	English             
600	MOTIONS DETAILS	2006	0.99	166	PG	2025-07-13 13:47:31.947	Horror	English             
653	PANIC CLUB	2006	4.99	102	G	2025-07-13 13:47:31.947	Horror	English             
658	PARIS WEEKEND	2006	2.99	121	PG-13	2025-07-13 13:47:31.947	Horror	English             
665	PATTON INTERVIEW	2006	2.99	175	PG	2025-07-13 13:47:31.947	Horror	English             
702	PULP BEVERLY	2006	2.99	89	G	2025-07-13 13:47:31.947	Horror	English             
716	REAP UNFAITHFUL	2006	2.99	136	PG-13	2025-07-13 13:47:31.947	Horror	English             
722	REEF SALUTE	2006	0.99	123	NC-17	2025-07-13 13:47:31.947	Horror	English             
737	ROCK INSTINCT	2006	0.99	102	G	2025-07-13 13:47:31.947	Horror	English             
740	ROLLERCOASTER BRINGING	2006	2.99	153	PG-13	2025-07-13 13:47:31.947	Horror	English             
749	RULES HUMAN	2006	4.99	153	R	2025-07-13 13:47:31.947	Horror	English             
799	SIMON NORTH	2006	0.99	51	NC-17	2025-07-13 13:47:31.947	Horror	English             
800	SINNERS ATLANTIS	2006	2.99	126	PG-13	2025-07-13 13:47:31.947	Horror	English             
804	SLEEPING SUSPECTS	2006	4.99	129	PG-13	2025-07-13 13:47:31.949	Horror	English             
830	SPIRIT FLINTSTONES	2006	0.99	149	R	2025-07-13 13:47:31.951	Horror	English             
854	STRANGERS GRAFFITI	2006	4.99	119	R	2025-07-13 13:47:31.951	Horror	English             
856	STREETCAR INTENTIONS	2006	4.99	73	R	2025-07-13 13:47:31.951	Horror	English             
870	SWARM GOLD	2006	0.99	123	PG-13	2025-07-13 13:47:31.951	Horror	English             
876	TARZAN VIDEOTAPE	2006	2.99	91	PG-13	2025-07-13 13:47:31.951	Horror	English             
881	TEMPLE ATTRACTION	2006	4.99	71	PG	2025-07-13 13:47:31.951	Horror	English             
885	TEXAS WATCH	2006	0.99	179	NC-17	2025-07-13 13:47:31.951	Horror	English             
904	TRAIN BUNCH	2006	4.99	71	R	2025-07-13 13:47:31.951	Horror	English             
909	TREASURE COMMAND	2006	0.99	102	PG-13	2025-07-13 13:47:31.951	Horror	English             
922	UNDEFEATED DALMATIONS	2006	4.99	107	PG-13	2025-07-13 13:47:31.951	Horror	English             
965	WATERSHIP FRONTIER	2006	0.99	112	G	2025-07-13 13:47:31.951	Horror	English             
990	WORLD LEATHERNECKS	2006	0.99	171	PG-13	2025-07-13 13:47:31.951	Horror	English             
995	YENTL IDAHO	2006	4.99	86	R	2025-07-13 13:47:31.951	Horror	English             
998	ZHIVAGO CORE	2006	0.99	105	NC-17	2025-07-13 13:47:31.951	Horror	English             
12	ALASKA PHANTOM	2006	0.99	136	PG	2025-07-13 13:47:31.951	Music	English             
17	ALONE TRIP	2006	0.99	82	R	2025-07-13 13:47:31.951	Music	English             
20	AMELIE HELLFIGHTERS	2006	4.99	79	R	2025-07-13 13:47:31.951	Music	English             
51	BALLOON HOMEWARD	2006	2.99	75	NC-17	2025-07-13 13:47:31.951	Music	English             
54	BANGER PINOCCHIO	2006	0.99	113	R	2025-07-13 13:47:31.951	Music	English             
74	BIRCH ANTITRUST	2006	4.99	162	PG	2025-07-13 13:47:31.951	Music	English             
76	BIRDCAGE CASPER	2006	0.99	103	NC-17	2025-07-13 13:47:31.951	Music	English             
86	BOOGIE AMELIE	2006	4.99	121	R	2025-07-13 13:47:31.951	Music	English             
133	CHAMBER ITALIAN	2006	4.99	117	NC-17	2025-07-13 13:47:31.951	Music	English             
158	CLONES PINOCCHIO	2006	2.99	124	R	2025-07-13 13:47:31.951	Music	English             
161	CLUE GRAIL	2006	4.99	70	NC-17	2025-07-13 13:47:31.951	Music	English             
174	CONFIDENTIAL INTERVIEW	2006	4.99	180	NC-17	2025-07-13 13:47:31.951	Music	English             
220	DEER VIRGINIAN	2006	2.99	106	NC-17	2025-07-13 13:47:31.951	Music	English             
244	DORADO NOTTING	2006	4.99	139	NC-17	2025-07-13 13:47:31.951	Music	English             
255	DRIVING POLISH	2006	4.99	175	NC-17	2025-07-13 13:47:31.951	Music	English             
278	ELF MURDER	2006	4.99	155	NC-17	2025-07-13 13:47:31.951	Music	English             
284	ENEMY ODDS	2006	4.99	77	NC-17	2025-07-13 13:47:31.951	Music	English             
333	FREAKY POCUS	2006	2.99	126	R	2025-07-13 13:47:31.951	Music	English             
363	GO PURPLE	2006	0.99	54	R	2025-07-13 13:47:31.951	Music	English             
378	GREATEST NORTH	2006	2.99	93	NC-17	2025-07-13 13:47:31.951	Music	English             
384	GROSSE WONDERFUL	2006	4.99	49	R	2025-07-13 13:47:31.951	Music	English             
398	HANOVER GALAXY	2006	4.99	47	NC-17	2025-07-13 13:47:31.951	Music	English             
411	HEAVENLY GUN	2006	4.99	49	NC-17	2025-07-13 13:47:31.951	Music	English             
426	HOME PITY	2006	4.99	185	R	2025-07-13 13:47:31.951	Music	English             
454	IMPACT ALADDIN	2006	0.99	180	PG-13	2025-07-13 13:47:31.951	Music	English             
462	INSIDER ARIZONA	2006	2.99	78	NC-17	2025-07-13 13:47:31.951	Music	English             
477	JAWBREAKER BROOKLYN	2006	0.99	118	PG	2025-07-13 13:47:31.951	Music	English             
516	LEGEND JEDI	2006	0.99	59	PG	2025-07-13 13:47:31.951	Music	English             
540	LUCKY FLYING	2006	2.99	97	PG-13	2025-07-13 13:47:31.951	Music	English             
562	MASKED BUBBLE	2006	0.99	151	PG-13	2025-07-13 13:47:31.951	Music	English             
581	MINORITY KISS	2006	0.99	59	G	2025-07-13 13:47:31.951	Music	English             
592	MONSTER SPARTACUS	2006	2.99	107	PG	2025-07-13 13:47:31.951	Music	English             
636	OLEANDER CLUE	2006	0.99	161	PG	2025-07-13 13:47:31.951	Music	English             
647	OUTFIELD MASSACRE	2006	0.99	129	NC-17	2025-07-13 13:47:31.951	Music	English             
673	PERSONAL LADYBUGS	2006	0.99	118	PG-13	2025-07-13 13:47:31.951	Music	English             
718	REBEL AIRPORT	2006	0.99	73	G	2025-07-13 13:47:31.951	Music	English             
721	REDS POCUS	2006	4.99	182	PG-13	2025-07-13 13:47:31.951	Music	English             
741	ROMAN PUNK	2006	0.99	81	NC-17	2025-07-13 13:47:31.951	Music	English             
752	RUNNER MADIGAN	2006	0.99	101	NC-17	2025-07-13 13:47:31.951	Music	English             
767	SCALAWAG DUCK	2006	4.99	183	NC-17	2025-07-13 13:47:31.951	Music	English             
797	SILENCE KANE	2006	0.99	67	R	2025-07-13 13:47:31.951	Music	English             
39	ARMAGEDDON LOST	2006	0.99	99	G	2025-07-13 13:47:32.116	Sci-Fi	English             
44	ATTACKS HATE	2006	4.99	113	PG-13	2025-07-13 13:47:32.118	Sci-Fi	English             
49	BADMAN DAWN	2006	2.99	162	R	2025-07-13 13:47:32.119	Sci-Fi	English             
55	BARBARELLA STREETCAR	2006	2.99	65	G	2025-07-13 13:47:32.121	Sci-Fi	English             
69	BEVERLY OUTLAW	2006	2.99	85	R	2025-07-13 13:47:32.122	Sci-Fi	English             
73	BINGO TALENTED	2006	2.99	150	PG-13	2025-07-13 13:47:32.123	Sci-Fi	English             
819	SONG HEDWIG	2006	0.99	165	PG-13	2025-07-13 13:47:31.951	Music	English             
877	TAXI KICK	2006	0.99	64	PG-13	2025-07-13 13:47:31.951	Music	English             
879	TELEGRAPH VOYAGE	2006	4.99	148	PG	2025-07-13 13:47:31.951	Music	English             
884	TERMINATOR CLUB	2006	4.99	88	R	2025-07-13 13:47:31.951	Music	English             
921	UNCUT SUICIDES	2006	2.99	172	PG-13	2025-07-13 13:47:31.951	Music	English             
936	VANISHING ROCKY	2006	2.99	123	NC-17	2025-07-13 13:47:31.951	Music	English             
980	WIZARD COLDBLOODED	2006	4.99	75	PG	2025-07-13 13:47:31.951	Music	English             
983	WON DARES	2006	2.99	105	PG	2025-07-13 13:47:31.951	Music	English             
987	WORDS HUNTER	2006	2.99	116	PG	2025-07-13 13:47:31.951	Music	English             
997	YOUTH KICK	2006	0.99	179	NC-17	2025-07-13 13:47:31.951	Music	English             
22	AMISTAD MIDSUMMER	2006	2.99	85	G	2025-07-13 13:47:31.951	New	English             
25	ANGELS LIFE	2006	2.99	74	G	2025-07-13 13:47:31.951	New	English             
32	APOCALYPSE FLAMINGOS	2006	4.99	119	R	2025-07-13 13:47:31.951	New	English             
45	ATTRACTION NEWTON	2006	4.99	83	PG-13	2025-07-13 13:47:31.951	New	English             
77	BIRDS PERDITION	2006	4.99	61	G	2025-07-13 13:47:31.951	New	English             
90	BOULEVARD MOB	2006	0.99	63	R	2025-07-13 13:47:31.951	New	English             
320	FLAMINGOS CONNECTICUT	2006	4.99	80	PG-13	2025-07-13 13:47:31.951	New	English             
321	FLASH WARS	2006	4.99	123	NC-17	2025-07-13 13:47:31.951	New	English             
340	FRONTIER CABIN	2006	4.99	183	PG-13	2025-07-13 13:47:31.951	New	English             
364	GODFATHER DIARY	2006	2.99	73	NC-17	2025-07-13 13:47:31.951	New	English             
436	HOURS RAGE	2006	0.99	122	NC-17	2025-07-13 13:47:31.951	New	English             
448	IDAHO LOVE	2006	2.99	172	PG-13	2025-07-13 13:47:31.951	New	English             
465	INTERVIEW LIAISONS	2006	4.99	59	R	2025-07-13 13:47:31.951	New	English             
481	JEKYLL FROGMEN	2006	2.99	58	PG	2025-07-13 13:47:31.951	New	English             
490	JUMANJI BLADE	2006	2.99	121	G	2025-07-13 13:47:31.951	New	English             
492	JUNGLE CLOSER	2006	0.99	134	NC-17	2025-07-13 13:47:31.951	New	English             
538	LOVERBOY ATTACKS	2006	0.99	162	PG-13	2025-07-13 13:47:31.951	New	English             
551	MAIDEN HOME	2006	4.99	138	PG	2025-07-13 13:47:31.951	New	English             
558	MANNEQUIN WORST	2006	2.99	71	PG-13	2025-07-13 13:47:31.951	New	English             
561	MASK PEACH	2006	2.99	123	NC-17	2025-07-13 13:47:31.952	New	English             
580	MINE TITANS	2006	4.99	166	PG-13	2025-07-13 13:47:31.953	New	English             
590	MONEY HAROLD	2006	2.99	135	PG	2025-07-13 13:47:31.954	New	English             
632	NUTS TIES	2006	4.99	145	NC-17	2025-07-13 13:47:31.956	New	English             
635	OKLAHOMA JUMANJI	2006	0.99	58	PG	2025-07-13 13:47:31.958	New	English             
675	PHANTOM GLORY	2006	2.99	60	NC-17	2025-07-13 13:47:31.959	New	English             
677	PIANIST OUTFIELD	2006	0.99	136	NC-17	2025-07-13 13:47:31.96	New	English             
685	PLATOON INSTINCT	2006	4.99	132	PG-13	2025-07-13 13:47:31.962	New	English             
686	PLUTO OLEANDER	2006	4.99	84	R	2025-07-13 13:47:31.963	New	English             
720	REDEMPTION COMFORTS	2006	2.99	179	NC-17	2025-07-13 13:47:31.964	New	English             
730	RIDGEMONT SUBMARINE	2006	0.99	46	PG-13	2025-07-13 13:47:31.966	New	English             
750	RUN PACIFIC	2006	0.99	145	R	2025-07-13 13:47:31.968	New	English             
751	RUNAWAY TENENBAUMS	2006	0.99	181	NC-17	2025-07-13 13:47:31.97	New	English             
759	SALUTE APOLLO	2006	2.99	73	R	2025-07-13 13:47:31.971	New	English             
760	SAMURAI LION	2006	2.99	110	G	2025-07-13 13:47:31.973	New	English             
920	UNBREAKABLE KARATE	2006	0.99	62	G	2025-07-13 13:47:32.051	New	English             
933	VAMPIRE WHALE	2006	4.99	126	NC-17	2025-07-13 13:47:32.055	New	English             
935	VANISHED GARDEN	2006	0.99	142	R	2025-07-13 13:47:32.056	New	English             
937	VARSITY TRIP	2006	2.99	85	NC-17	2025-07-13 13:47:32.059	New	English             
948	VOICE PEACH	2006	0.99	139	PG-13	2025-07-13 13:47:32.06	New	English             
954	WAKE JAWS	2006	4.99	73	G	2025-07-13 13:47:32.061	New	English             
974	WILD APOLLO	2006	0.99	181	R	2025-07-13 13:47:32.065	New	English             
994	WYOMING STORM	2006	4.99	100	PG-13	2025-07-13 13:47:32.112	New	English             
26	ANNIE IDENTITY	2006	0.99	86	G	2025-07-13 13:47:32.114	Sci-Fi	English             
806	SLEEPY JAPANESE	2006	2.99	137	PG	2025-07-13 13:47:31.975	New	English             
846	STING PERSONAL	2006	4.99	93	NC-17	2025-07-13 13:47:31.976	New	English             
847	STOCK GLASS	2006	2.99	160	PG	2025-07-13 13:47:31.978	New	English             
913	TROOPERS METAL	2006	0.99	115	R	2025-07-13 13:47:31.98	New	English             
319	FISH OPUS	2006	2.99	125	R	2025-07-13 13:47:32.152	Sci-Fi	English             
187	CRANES RESERVOIR	2006	2.99	57	NC-17	2025-07-13 13:47:32.21	Sports	English             
197	CRUSADE HONEY	2006	2.99	112	R	2025-07-13 13:47:32.212	Sports	English             
237	DIVORCE SHINING	2006	2.99	47	G	2025-07-13 13:47:32.213	Sports	English             
254	DRIVER ANNIE	2006	2.99	159	PG-13	2025-07-13 13:47:32.216	Sports	English             
256	DROP WATERFRONT	2006	4.99	178	R	2025-07-13 13:47:32.218	Sports	English             
260	DUDE BLINDNESS	2006	4.99	132	G	2025-07-13 13:47:32.219	Sports	English             
263	DURHAM PANKY	2006	4.99	154	R	2025-07-13 13:47:32.221	Sports	English             
279	ELIZABETH SHANE	2006	4.99	152	NC-17	2025-07-13 13:47:32.222	Sports	English             
291	EVOLUTION ALTER	2006	0.99	174	PG-13	2025-07-13 13:47:32.223	Sports	English             
293	EXORCIST STING	2006	2.99	167	G	2025-07-13 13:47:32.225	Sports	English             
322	FLATLINERS KILLER	2006	2.99	100	G	2025-07-13 13:47:32.226	Sports	English             
323	FLIGHT LIES	2006	4.99	179	R	2025-07-13 13:47:32.227	Sports	English             
361	GLEAMING JAWBREAKER	2006	2.99	89	NC-17	2025-07-13 13:47:32.23	Sports	English             
372	GRACELAND DYNAMITE	2006	4.99	140	R	2025-07-13 13:47:32.231	Sports	English             
383	GROOVE FICTION	2006	0.99	111	NC-17	2025-07-13 13:47:32.232	Sports	English             
981	WOLVES DESIRE	2006	0.99	55	NC-17	2025-07-13 13:47:32.258	Travel	English             
988	WORKER TARZAN	2006	2.99	139	R	2025-07-13 13:47:32.258	Travel	English             
389	GUNFIGHTER MUSSOLINI	2006	2.99	127	PG-13	2025-07-13 13:47:32.233	Sports	English             
420	HOLES BRANNIGAN	2006	4.99	128	PG	2025-07-13 13:47:32.235	Sports	English             
429	HONEY TIES	2006	0.99	84	R	2025-07-13 13:47:32.237	Sports	English             
446	HYSTERICAL GRAIL	2006	4.99	150	PG	2025-07-13 13:47:32.238	Sports	English             
453	IMAGE PRINCESS	2006	2.99	178	PG-13	2025-07-13 13:47:32.239	Sports	English             
463	INSTINCT AIRPORT	2006	2.99	116	PG	2025-07-13 13:47:32.241	Sports	English             
474	JADE BUNCH	2006	2.99	174	NC-17	2025-07-13 13:47:32.243	Sports	English             
488	JOON NORTHWEST	2006	0.99	105	NC-17	2025-07-13 13:47:32.244	Sports	English             
503	KRAMER CHOCOLATE	2006	2.99	171	R	2025-07-13 13:47:32.245	Sports	English             
517	LESSON CLEOPATRA	2006	0.99	167	NC-17	2025-07-13 13:47:32.246	Sports	English             
519	LIBERTY MAGNIFICENT	2006	2.99	138	G	2025-07-13 13:47:32.248	Sports	English             
989	WORKING MICROCOSMOS	2006	4.99	74	R	2025-07-13 13:47:32.258	Travel	English             
21	AMERICAN CIRCUS	2006	4.99	129	R	2025-07-13 13:47:31.935	Action	English             
29	ANTITRUST TOMATOES	2006	2.99	168	NC-17	2025-07-13 13:47:31.935	Action	English             
38	ARK RIDGEMONT	2006	0.99	68	NC-17	2025-07-13 13:47:31.935	Action	English             
56	BAREFOOT MANCHURIAN	2006	2.99	129	G	2025-07-13 13:47:31.935	Action	English             
67	BERETS AGENT	2006	2.99	77	PG-13	2025-07-13 13:47:31.935	Action	English             
97	BRIDE INTRIGUE	2006	0.99	56	G	2025-07-13 13:47:31.935	Action	English             
105	BULL SHAWSHANK	2006	0.99	125	NC-17	2025-07-13 13:47:31.935	Action	English             
111	CADDYSHACK JEDI	2006	0.99	52	NC-17	2025-07-13 13:47:31.935	Action	English             
115	CAMPUS REMEMBER	2006	2.99	167	R	2025-07-13 13:47:31.935	Action	English             
126	CASUALTIES ENCINO	2006	4.99	179	G	2025-07-13 13:47:31.935	Action	English             
130	CELEBRITY HORN	2006	0.99	110	PG-13	2025-07-13 13:47:31.935	Action	English             
162	CLUELESS BUCKET	2006	2.99	95	R	2025-07-13 13:47:31.935	Action	English             
194	CROW GREASE	2006	0.99	104	PG	2025-07-13 13:47:31.935	Action	English             
205	DANCES NONE	2006	0.99	58	NC-17	2025-07-13 13:47:31.935	Action	English             
210	DARKO DORADO	2006	4.99	130	NC-17	2025-07-13 13:47:31.935	Action	English             
212	DARN FORRESTER	2006	4.99	185	G	2025-07-13 13:47:31.935	Action	English             
229	DEVIL DESIRE	2006	4.99	87	R	2025-07-13 13:47:31.935	Action	English             
250	DRAGON SQUAD	2006	0.99	170	NC-17	2025-07-13 13:47:31.935	Action	English             
252	DREAM PICKUP	2006	2.99	135	PG	2025-07-13 13:47:31.935	Action	English             
253	DRIFTER COMMANDMENTS	2006	4.99	61	PG-13	2025-07-13 13:47:31.935	Action	English             
271	EASY GLADIATOR	2006	4.99	148	G	2025-07-13 13:47:31.935	Action	English             
287	ENTRAPMENT SATISFACTION	2006	0.99	176	R	2025-07-13 13:47:31.935	Action	English             
292	EXCITEMENT EVE	2006	0.99	51	G	2025-07-13 13:47:31.935	Action	English             
303	FANTASY TROOPERS	2006	0.99	58	PG-13	2025-07-13 13:47:31.935	Action	English             
318	FIREHOUSE VIETNAM	2006	0.99	103	G	2025-07-13 13:47:31.935	Action	English             
327	FOOL MOCKINGBIRD	2006	4.99	158	PG	2025-07-13 13:47:31.935	Action	English             
329	FORREST SONS	2006	2.99	63	R	2025-07-13 13:47:31.935	Action	English             
360	GLASS DYING	2006	0.99	103	G	2025-07-13 13:47:31.935	Action	English             
371	GOSFORD DONNIE	2006	4.99	129	G	2025-07-13 13:47:31.935	Action	English             
375	GRAIL FRANKENSTEIN	2006	2.99	85	NC-17	2025-07-13 13:47:31.935	Action	English             
395	HANDICAP BOONDOCK	2006	0.99	108	R	2025-07-13 13:47:31.935	Action	English             
417	HILLS NEIGHBORS	2006	0.99	93	G	2025-07-13 13:47:31.935	Action	English             
501	KISSING DOLLS	2006	4.99	141	R	2025-07-13 13:47:31.935	Action	English             
511	LAWRENCE LOVE	2006	0.99	175	NC-17	2025-07-13 13:47:31.935	Action	English             
530	LORD ARIZONA	2006	2.99	108	PG-13	2025-07-13 13:47:31.935	Action	English             
542	LUST LOCK	2006	2.99	52	G	2025-07-13 13:47:31.935	Action	English             
19	AMADEUS HOLY	2006	0.99	113	PG	2025-07-13 13:47:31.935	Action	English             
81	BLINDNESS GUN	2006	4.99	103	PG-13	2025-07-13 13:47:32.125	Sci-Fi	English             
114	CAMELOT VACATION	2006	0.99	61	NC-17	2025-07-13 13:47:32.127	Sci-Fi	English             
132	CHAINSAW UPTOWN	2006	0.99	114	PG	2025-07-13 13:47:32.128	Sci-Fi	English             
137	CHARADE DUFFEL	2006	2.99	66	PG	2025-07-13 13:47:32.129	Sci-Fi	English             
138	CHARIOTS CONSPIRACY	2006	2.99	71	R	2025-07-13 13:47:32.131	Sci-Fi	English             
140	CHEAPER CLYDE	2006	0.99	87	G	2025-07-13 13:47:32.132	Sci-Fi	English             
151	CINCINATTI WHISPERER	2006	4.99	143	NC-17	2025-07-13 13:47:32.133	Sci-Fi	English             
153	CITIZEN SHREK	2006	0.99	165	G	2025-07-13 13:47:32.134	Sci-Fi	English             
165	COLDBLOODED DARLING	2006	4.99	70	G	2025-07-13 13:47:32.136	Sci-Fi	English             
177	CONNECTICUT TRAMP	2006	4.99	172	R	2025-07-13 13:47:32.138	Sci-Fi	English             
195	CROWDS TELEMARK	2006	4.99	112	R	2025-07-13 13:47:32.14	Sci-Fi	English             
203	DAISY MENAGERIE	2006	4.99	84	G	2025-07-13 13:47:32.141	Sci-Fi	English             
234	DISTURBING SCARFACE	2006	2.99	94	R	2025-07-13 13:47:32.142	Sci-Fi	English             
235	DIVIDE MONSTER	2006	2.99	68	PG-13	2025-07-13 13:47:32.143	Sci-Fi	English             
240	DOLLS RAGE	2006	2.99	120	PG-13	2025-07-13 13:47:32.146	Sci-Fi	English             
285	ENGLISH BULWORTH	2006	0.99	51	PG-13	2025-07-13 13:47:32.148	Sci-Fi	English             
296	EXPRESS LONELY	2006	2.99	178	R	2025-07-13 13:47:32.149	Sci-Fi	English             
298	EYES DRIVING	2006	2.99	172	PG-13	2025-07-13 13:47:32.15	Sci-Fi	English             
312	FIDDLER LOST	2006	4.99	75	R	2025-07-13 13:47:32.151	Sci-Fi	English             
338	FRISCO FORREST	2006	4.99	51	PG	2025-07-13 13:47:32.153	Sci-Fi	English             
350	GARDEN ISLAND	2006	4.99	80	G	2025-07-13 13:47:32.154	Sci-Fi	English             
367	GOLDMINE TYCOON	2006	0.99	153	R	2025-07-13 13:47:32.156	Sci-Fi	English             
369	GOODFELLAS SALUTE	2006	4.99	56	PG	2025-07-13 13:47:32.158	Sci-Fi	English             
374	GRAFFITI LOVE	2006	0.99	117	PG	2025-07-13 13:47:32.159	Sci-Fi	English             
390	GUYS FALCON	2006	4.99	84	R	2025-07-13 13:47:32.16	Sci-Fi	English             
394	HAMLET WISDOM	2006	2.99	146	R	2025-07-13 13:47:32.161	Sci-Fi	English             
397	HANKY OCTOBER	2006	2.99	107	NC-17	2025-07-13 13:47:32.163	Sci-Fi	English             
422	HOLLOW JEOPARDY	2006	4.99	136	NC-17	2025-07-13 13:47:32.164	Sci-Fi	English             
449	IDENTITY LOVER	2006	2.99	119	PG-13	2025-07-13 13:47:32.166	Sci-Fi	English             
520	LICENSE WEEKEND	2006	2.99	91	NC-17	2025-07-13 13:47:32.167	Sci-Fi	English             
559	MARRIED GO	2006	2.99	114	G	2025-07-13 13:47:32.169	Sci-Fi	English             
572	METROPOLIS COMA	2006	2.99	64	PG-13	2025-07-13 13:47:32.17	Sci-Fi	English             
602	MOURNING PURPLE	2006	0.99	146	PG	2025-07-13 13:47:32.171	Sci-Fi	English             
620	NEMO CAMPUS	2006	2.99	131	NC-17	2025-07-13 13:47:32.172	Sci-Fi	English             
911	TRIP NEWTON	2006	4.99	64	PG-13	2025-07-13 13:47:31.936	Action	English             
915	TRUMAN CRAZY	2006	4.99	92	G	2025-07-13 13:47:31.936	Action	English             
927	UPRISING UPTOWN	2006	2.99	174	NC-17	2025-07-13 13:47:31.936	Action	English             
964	WATERFRONT DELIVERANCE	2006	4.99	61	G	2025-07-13 13:47:31.936	Action	English             
968	WEREWOLF LOLA	2006	4.99	79	G	2025-07-13 13:47:31.936	Action	English             
982	WOMEN DORADO	2006	0.99	126	R	2025-07-13 13:47:31.936	Action	English             
991	WORST BANGER	2006	2.99	185	PG	2025-07-13 13:47:31.936	Action	English             
18	ALTER VICTORY	2006	0.99	57	PG-13	2025-07-13 13:47:31.936	Animation	English             
23	ANACONDA CONFESSIONS	2006	0.99	92	R	2025-07-13 13:47:31.936	Animation	English             
36	ARGONAUTS TOWN	2006	0.99	127	PG-13	2025-07-13 13:47:31.936	Animation	English             
70	BIKINI BORROWERS	2006	4.99	142	NC-17	2025-07-13 13:47:31.936	Animation	English             
78	BLACKOUT PRIVATE	2006	2.99	85	PG	2025-07-13 13:47:31.936	Animation	English             
89	BORROWERS BEDAZZLED	2006	0.99	63	G	2025-07-13 13:47:31.936	Animation	English             
118	CANYON STOCK	2006	0.99	85	R	2025-07-13 13:47:31.936	Animation	English             
121	CAROL TEXAS	2006	2.99	151	PG	2025-07-13 13:47:31.936	Animation	English             
134	CHAMPION FLATLINERS	2006	4.99	51	PG	2025-07-13 13:47:31.936	Animation	English             
154	CLASH FREDDY	2006	2.99	81	G	2025-07-13 13:47:31.936	Animation	English             
160	CLUB GRAFFITI	2006	0.99	65	PG-13	2025-07-13 13:47:31.936	Animation	English             
193	CROSSROADS CASUALTIES	2006	2.99	153	G	2025-07-13 13:47:31.936	Animation	English             
208	DARES PLUTO	2006	2.99	89	PG-13	2025-07-13 13:47:31.936	Animation	English             
223	DESIRE ALIEN	2006	2.99	76	NC-17	2025-07-13 13:47:31.936	Animation	English             
239	DOGMA FAMILY	2006	4.99	122	G	2025-07-13 13:47:31.936	Animation	English             
808	SLING LUKE	2006	0.99	84	R	2025-07-13 13:47:31.936	Classics	English             
864	SUNDANCE INVASION	2006	0.99	92	NC-17	2025-07-13 13:47:31.936	Children	English             
873	SWEETHEARTS SUSPECTS	2006	0.99	108	G	2025-07-13 13:47:31.936	Children	English             
883	TEQUILA PAST	2006	4.99	53	PG	2025-07-13 13:47:31.936	Children	English             
889	TIES HUNGER	2006	4.99	111	R	2025-07-13 13:47:31.936	Children	English             
896	TOOTSIE PILOT	2006	0.99	157	PG	2025-07-13 13:47:31.936	Children	English             
918	TWISTED PIRATES	2006	4.99	152	PG	2025-07-13 13:47:31.936	Children	English             
928	UPTOWN YOUNG	2006	2.99	84	PG	2025-07-13 13:47:31.936	Children	English             
955	WALLS ARTIST	2006	4.99	135	PG	2025-07-13 13:47:31.936	Children	English             
959	WARLOCK WEREWOLF	2006	2.99	83	G	2025-07-13 13:47:31.936	Children	English             
993	WRONG BEHAVIOR	2006	2.99	178	PG-13	2025-07-13 13:47:31.936	Children	English             
999	ZOOLANDER FICTION	2006	2.99	101	R	2025-07-13 13:47:31.936	Children	English             
14	ALICE FANTASIA	2006	0.99	94	NC-17	2025-07-13 13:47:31.936	Classics	English             
37	ARIZONA BANG	2006	2.99	121	PG	2025-07-13 13:47:31.936	Classics	English             
60	BEAST HUNCHBACK	2006	4.99	89	R	2025-07-13 13:47:31.936	Classics	English             
91	BOUND CHEAPER	2006	0.99	98	PG	2025-07-13 13:47:31.936	Classics	English             
116	CANDIDATE PERDITION	2006	2.99	70	R	2025-07-13 13:47:31.936	Classics	English             
131	CENTER DINOSAUR	2006	4.99	152	PG	2025-07-13 13:47:31.936	Classics	English             
166	COLOR PHILADELPHIA	2006	2.99	149	G	2025-07-13 13:47:31.936	Classics	English             
180	CONSPIRACY SPIRIT	2006	2.99	184	PG-13	2025-07-13 13:47:31.936	Classics	English             
184	CORE SUIT	2006	2.99	92	PG-13	2025-07-13 13:47:31.936	Classics	English             
190	CREEPERS KANE	2006	4.99	172	NC-17	2025-07-13 13:47:31.936	Classics	English             
548	MAGNIFICENT CHITTY	2006	2.99	53	R	2025-07-13 13:47:31.936	Classics	English             
554	MALKOVICH PET	2006	2.99	159	G	2025-07-13 13:47:31.936	Classics	English             
578	MILLION ACE	2006	4.99	142	PG-13	2025-07-13 13:47:31.936	Classics	English             
611	MUSKETEERS WAIT	2006	4.99	73	PG	2025-07-13 13:47:31.936	Classics	English             
633	OCTOBER SUBMARINE	2006	4.99	54	PG-13	2025-07-13 13:47:31.936	Classics	English             
652	PAJAMA JAWBREAKER	2006	0.99	126	R	2025-07-13 13:47:31.936	Classics	English             
663	PATIENT SISTER	2006	0.99	99	NC-17	2025-07-13 13:47:31.936	Classics	English             
694	PREJUDICE OLEANDER	2006	4.99	98	PG-13	2025-07-13 13:47:31.936	Classics	English             
725	REQUIEM TYCOON	2006	4.99	167	R	2025-07-13 13:47:31.936	Classics	English             
731	RIGHT CRANES	2006	4.99	153	PG-13	2025-07-13 13:47:31.936	Classics	English             
744	ROOTS REMEMBER	2006	0.99	89	PG-13	2025-07-13 13:47:31.936	Classics	English             
127	CAT CONEHEADS	2006	4.99	112	G	2025-07-13 13:47:31.938	Comedy	English             
159	CLOSER BANG	2006	4.99	58	R	2025-07-13 13:47:31.938	Comedy	English             
178	CONNECTION MICROCOSMOS	2006	0.99	115	G	2025-07-13 13:47:31.938	Comedy	English             
182	CONTROL ANTHEM	2006	4.99	185	G	2025-07-13 13:47:31.938	Comedy	English             
188	CRAZY HOME	2006	2.99	136	PG	2025-07-13 13:47:31.938	Comedy	English             
202	DADDY PITTSBURGH	2006	4.99	161	G	2025-07-13 13:47:31.938	Comedy	English             
242	DOOM DANCING	2006	0.99	68	R	2025-07-13 13:47:31.938	Comedy	English             
247	DOWNHILL ENOUGH	2006	0.99	47	G	2025-07-13 13:47:31.938	Comedy	English             
265	DYING MAKER	2006	4.99	168	PG	2025-07-13 13:47:31.938	Comedy	English             
276	ELEMENT FREDDY	2006	4.99	115	NC-17	2025-07-13 13:47:31.938	Comedy	English             
308	FERRIS MOTHER	2006	2.99	142	PG	2025-07-13 13:47:31.938	Comedy	English             
317	FIREBALL PHILADELPHIA	2006	0.99	148	PG	2025-07-13 13:47:31.938	Comedy	English             
324	FLINTSTONES HAPPINESS	2006	4.99	148	PG-13	2025-07-13 13:47:31.938	Comedy	English             
332	FRANKENSTEIN STRANGER	2006	0.99	159	NC-17	2025-07-13 13:47:31.938	Comedy	English             
335	FREEDOM CLEOPATRA	2006	0.99	133	PG-13	2025-07-13 13:47:31.938	Comedy	English             
708	QUILLS BULL	2006	4.99	112	R	2025-07-13 13:47:31.938	Documentary	English             
712	RAIDERS ANTITRUST	2006	0.99	82	PG-13	2025-07-13 13:47:31.938	Documentary	English             
713	RAINBOW SHOCK	2006	4.99	74	PG	2025-07-13 13:47:31.938	Documentary	English             
734	ROAD ROXANNE	2006	4.99	158	R	2025-07-13 13:47:31.938	Documentary	English             
757	SAGEBRUSH CLUELESS	2006	2.99	106	G	2025-07-13 13:47:31.938	Documentary	English             
776	SECRET GROUNDHOG	2006	4.99	90	PG	2025-07-13 13:47:31.938	Documentary	English             
788	SHIP WONDERLAND	2006	2.99	104	R	2025-07-13 13:47:31.938	Documentary	English             
791	SHOW LORD	2006	4.99	167	PG-13	2025-07-13 13:47:31.938	Documentary	English             
812	SMOKING BARBARELLA	2006	0.99	50	PG-13	2025-07-13 13:47:31.938	Documentary	English             
834	SPOILERS HELLFIGHTERS	2006	0.99	151	G	2025-07-13 13:47:31.938	Documentary	English             
855	STREAK RIDGEMONT	2006	0.99	132	PG-13	2025-07-13 13:47:31.938	Documentary	English             
888	THIN SAGEBRUSH	2006	4.99	53	PG-13	2025-07-13 13:47:31.938	Documentary	English             
925	UNITED PILOT	2006	0.99	164	R	2025-07-13 13:47:31.938	Documentary	English             
926	UNTOUCHABLES SUNRISE	2006	2.99	120	NC-17	2025-07-13 13:47:31.938	Documentary	English             
943	VILLAIN DESPERATE	2006	4.99	76	PG-13	2025-07-13 13:47:31.938	Documentary	English             
945	VIRGINIAN PLUTO	2006	0.99	164	R	2025-07-13 13:47:31.938	Documentary	English             
952	WAGON JAWS	2006	2.99	152	PG	2025-07-13 13:47:31.938	Documentary	English             
960	WARS PLUTO	2006	2.99	128	G	2025-07-13 13:47:31.938	Documentary	English             
966	WEDDING APOLLO	2006	0.99	70	PG	2025-07-13 13:47:31.938	Documentary	English             
973	WIFE TURN	2006	4.99	183	NC-17	2025-07-13 13:47:31.938	Documentary	English             
992	WRATH MILE	2006	0.99	176	NC-17	2025-07-13 13:47:31.938	Documentary	English             
996	YOUNG LANGUAGE	2006	0.99	183	G	2025-07-13 13:47:31.938	Documentary	English             
33	APOLLO TEEN	2006	2.99	153	PG-13	2025-07-13 13:47:31.938	Drama	English             
61	BEAUTY GREASE	2006	4.99	175	G	2025-07-13 13:47:31.938	Drama	English             
64	BEETHOVEN EXORCIST	2006	0.99	151	PG-13	2025-07-13 13:47:31.938	Drama	English             
79	BLADE POLISH	2006	0.99	114	PG-13	2025-07-13 13:47:31.938	Drama	English             
98	BRIGHT ENCOUNTERS	2006	4.99	73	PG-13	2025-07-13 13:47:31.938	Drama	English             
107	BUNCH MINDS	2006	2.99	63	G	2025-07-13 13:47:31.938	Drama	English             
143	CHILL LUCK	2006	0.99	142	PG	2025-07-13 13:47:31.938	Drama	English             
146	CHITTY LOCK	2006	2.99	107	G	2025-07-13 13:47:31.938	Drama	English             
213	DATE SPEED	2006	0.99	104	R	2025-07-13 13:47:31.938	Family	English             
231	DINOSAUR SECRETARY	2006	2.99	63	R	2025-07-13 13:47:31.938	Family	English             
262	DUMBO LUST	2006	0.99	119	NC-17	2025-07-13 13:47:31.938	Family	English             
269	EARRING INSTINCT	2006	0.99	98	R	2025-07-13 13:47:31.938	Family	English             
273	EFFECT GLADIATOR	2006	0.99	107	PG	2025-07-13 13:47:31.938	Family	English             
309	FEUD FROGMEN	2006	0.99	98	R	2025-07-13 13:47:31.938	Family	English             
315	FINDING ANACONDA	2006	0.99	156	R	2025-07-13 13:47:31.938	Family	English             
345	GABLES METROPOLIS	2006	0.99	161	PG	2025-07-13 13:47:31.938	Family	English             
348	GANDHI KWAI	2006	0.99	86	PG-13	2025-07-13 13:47:31.938	Family	English             
359	GLADIATOR WESTWARD	2006	4.99	173	PG	2025-07-13 13:47:31.938	Family	English             
377	GREASE YOUTH	2006	0.99	135	G	2025-07-13 13:47:31.938	Family	English             
391	HALF OUTFIELD	2006	2.99	146	PG-13	2025-07-13 13:47:31.938	Family	English             
419	HOCUS FRIDA	2006	2.99	141	G	2025-07-13 13:47:31.938	Family	English             
428	HOMICIDE PEACH	2006	2.99	141	PG-13	2025-07-13 13:47:31.938	Family	English             
437	HOUSE DYNAMITE	2006	2.99	109	R	2025-07-13 13:47:31.938	Family	English             
442	HUNTING MUSKETEERS	2006	2.99	65	NC-17	2025-07-13 13:47:31.938	Family	English             
458	INDIAN LOVE	2006	0.99	135	NC-17	2025-07-13 13:47:31.938	Family	English             
476	JASON TRAP	2006	2.99	130	NC-17	2025-07-13 13:47:31.938	Family	English             
479	JEDI BENEATH	2006	0.99	128	PG	2025-07-13 13:47:31.938	Family	English             
498	KILLER INNOCENT	2006	2.99	161	R	2025-07-13 13:47:31.938	Family	English             
499	KING EVOLUTION	2006	4.99	184	NC-17	2025-07-13 13:47:31.938	Family	English             
528	LOLITA WORLD	2006	2.99	155	NC-17	2025-07-13 13:47:31.938	Family	English             
534	LOUISIANA HARRY	2006	0.99	70	PG-13	2025-07-13 13:47:31.938	Family	English             
550	MAGUIRE APACHE	2006	2.99	74	NC-17	2025-07-13 13:47:31.938	Family	English             
557	MANCHURIAN CURTAIN	2006	2.99	177	PG	2025-07-13 13:47:31.938	Family	English             
603	MOVIE SHAKESPEARE	2006	4.99	53	PG	2025-07-13 13:47:31.938	Family	English             
610	MUSIC BOONDOCK	2006	0.99	129	R	2025-07-13 13:47:31.938	Family	English             
617	NATURAL STOCK	2006	0.99	50	PG-13	2025-07-13 13:47:31.938	Family	English             
621	NETWORK PEAK	2006	2.99	75	PG-13	2025-07-13 13:47:31.938	Family	English             
634	ODDS BOOGIE	2006	0.99	48	NC-17	2025-07-13 13:47:31.938	Family	English             
639	OPPOSITE NECKLACE	2006	4.99	92	PG	2025-07-13 13:47:31.938	Family	English             
679	PILOT HOOSIERS	2006	2.99	50	PG	2025-07-13 13:47:31.938	Family	English             
682	PITTSBURGH HUNCHBACK	2006	4.99	134	PG-13	2025-07-13 13:47:31.938	Family	English             
695	PRESIDENT BANG	2006	4.99	144	PG	2025-07-13 13:47:31.938	Family	English             
700	PRIX UNDEFEATED	2006	2.99	115	R	2025-07-13 13:47:31.938	Family	English             
710	RAGE GAMES	2006	4.99	120	R	2025-07-13 13:47:31.938	Family	English             
821	SORORITY QUEEN	2006	0.99	184	NC-17	2025-07-13 13:47:31.938	Foreign	English             
845	STEPMOM DREAM	2006	4.99	48	NC-17	2025-07-13 13:47:31.938	Foreign	English             
900	TOWN ARK	2006	2.99	136	R	2025-07-13 13:47:31.938	Foreign	English             
908	TRAP GUYS	2006	4.99	110	G	2025-07-13 13:47:31.938	Foreign	English             
929	USUAL UNTOUCHABLES	2006	4.99	128	PG-13	2025-07-13 13:47:31.938	Foreign	English             
947	VISION TORQUE	2006	0.99	59	PG-13	2025-07-13 13:47:31.938	Foreign	English             
957	WAR NOTTING	2006	4.99	80	G	2025-07-13 13:47:31.938	Foreign	English             
961	WASH HEAVENLY	2006	4.99	161	R	2025-07-13 13:47:31.938	Foreign	English             
971	WHALE BIKINI	2006	4.99	109	PG-13	2025-07-13 13:47:31.938	Foreign	English             
984	WONDERFUL DROP	2006	2.99	126	NC-17	2025-07-13 13:47:31.938	Foreign	English             
46	AUTUMN CROW	2006	4.99	108	G	2025-07-13 13:47:31.938	Games	English             
222	DESERT POSEIDON	2006	4.99	64	R	2025-07-13 13:47:31.938	Horror	English             
258	DRUMS DYNAMITE	2006	0.99	96	PG	2025-07-13 13:47:31.939	Horror	English             
275	EGYPT TENENBAUMS	2006	0.99	85	PG	2025-07-13 13:47:31.941	Horror	English             
277	ELEPHANT TROJAN	2006	4.99	126	PG-13	2025-07-13 13:47:31.943	Horror	English             
301	FAMILY SWEET	2006	0.99	155	R	2025-07-13 13:47:31.944	Horror	English             
313	FIDELITY DEVIL	2006	4.99	118	G	2025-07-13 13:47:31.945	Horror	English             
334	FREDDY STORM	2006	4.99	65	NC-17	2025-07-13 13:47:31.947	Horror	English             
351	GASLIGHT CRUSADE	2006	2.99	106	PG	2025-07-13 13:47:31.947	Horror	English             
415	HIGH ENCINO	2006	2.99	84	R	2025-07-13 13:47:31.947	Horror	English             
475	JAPANESE RUN	2006	0.99	135	G	2025-07-13 13:47:31.947	Horror	English             
93	BRANNIGAN SUNRISE	2006	4.99	121	PG	2025-07-13 13:47:31.951	New	English             
95	BREAKFAST GOLDFINGER	2006	4.99	123	G	2025-07-13 13:47:31.951	New	English             
96	BREAKING HOME	2006	2.99	169	PG-13	2025-07-13 13:47:31.951	New	English             
108	BUTCH PANTHER	2006	0.99	67	PG-13	2025-07-13 13:47:31.951	New	English             
109	BUTTERFLY CHOCOLAT	2006	0.99	89	G	2025-07-13 13:47:31.951	New	English             
136	CHAPLIN LICENSE	2006	2.99	146	NC-17	2025-07-13 13:47:31.951	New	English             
144	CHINATOWN GLADIATOR	2006	4.99	61	PG	2025-07-13 13:47:31.951	New	English             
155	CLEOPATRA DEVIL	2006	0.99	150	PG-13	2025-07-13 13:47:31.951	New	English             
163	CLYDE THEORY	2006	0.99	139	PG-13	2025-07-13 13:47:31.951	New	English             
216	DAY UNFAITHFUL	2006	4.99	113	G	2025-07-13 13:47:31.951	New	English             
226	DESTINY SATURDAY	2006	4.99	56	G	2025-07-13 13:47:31.951	New	English             
251	DRAGONFLY STRANGERS	2006	4.99	133	NC-17	2025-07-13 13:47:31.951	New	English             
267	EAGLES PANKY	2006	4.99	140	NC-17	2025-07-13 13:47:31.951	New	English             
270	EARTH VISION	2006	0.99	85	NC-17	2025-07-13 13:47:31.951	New	English             
283	ENDING CROWDS	2006	0.99	85	NC-17	2025-07-13 13:47:31.951	New	English             
289	EVE RESURRECTION	2006	4.99	66	G	2025-07-13 13:47:31.951	New	English             
305	FATAL HAUNTED	2006	2.99	91	PG	2025-07-13 13:47:31.951	New	English             
930	VACATION BOONDOCK	2006	2.99	145	R	2025-07-13 13:47:32.194	Sci-Fi	English             
967	WEEKEND PERSONAL	2006	2.99	134	R	2025-07-13 13:47:32.195	Sci-Fi	English             
972	WHISPERER GIANT	2006	4.99	59	PG-13	2025-07-13 13:47:32.197	Sci-Fi	English             
985	WONDERLAND CHRISTMAS	2006	4.99	111	PG	2025-07-13 13:47:32.198	Sci-Fi	English             
10	ALADDIN CALENDAR	2006	4.99	63	NC-17	2025-07-13 13:47:32.199	Sports	English             
27	ANONYMOUS HUMAN	2006	0.99	179	NC-17	2025-07-13 13:47:32.201	Sports	English             
42	ARTIST COLDBLOODED	2006	2.99	170	NC-17	2025-07-13 13:47:32.202	Sports	English             
609	MUSCLE BRIGHT	2006	2.99	185	G	2025-07-13 13:47:32.258	Travel	English             
642	ORDER BETRAYED	2006	2.99	120	PG-13	2025-07-13 13:47:32.258	Travel	English             
645	OTHERS SOUP	2006	2.99	118	PG	2025-07-13 13:47:32.258	Travel	English             
648	OUTLAW HANKY	2006	4.99	148	PG-13	2025-07-13 13:47:32.258	Travel	English             
656	PAPI NECKLACE	2006	0.99	128	PG	2025-07-13 13:47:32.258	Travel	English             
783	SHANE DARKNESS	2006	2.99	93	PG	2025-07-13 13:47:32.258	Travel	English             
784	SHANGHAI TYCOON	2006	2.99	47	PG	2025-07-13 13:47:32.258	Travel	English             
785	SHAWSHANK BUBBLE	2006	4.99	80	PG	2025-07-13 13:47:32.258	Travel	English             
787	SHINING ROSES	2006	0.99	125	G	2025-07-13 13:47:32.258	Travel	English             
811	SMILE EARRING	2006	2.99	60	G	2025-07-13 13:47:32.258	Travel	English             
826	SPEED SUIT	2006	4.99	124	PG-13	2025-07-13 13:47:32.258	Travel	English             
848	STONE FIRE	2006	0.99	94	G	2025-07-13 13:47:32.258	Travel	English             
868	SUPERFLY TRIP	2006	0.99	114	PG	2025-07-13 13:47:32.258	Travel	English             
872	SWEET BROTHERHOOD	2006	2.99	185	R	2025-07-13 13:47:32.258	Travel	English             
878	TEEN APOLLO	2006	4.99	74	G	2025-07-13 13:47:32.258	Travel	English             
894	TOMATOES HELLFIGHTERS	2006	0.99	68	PG	2025-07-13 13:47:32.258	Travel	English             
903	TRAFFIC HOBBIT	2006	4.99	139	G	2025-07-13 13:47:32.258	Travel	English             
914	TROUBLE DATE	2006	2.99	61	PG	2025-07-13 13:47:32.258	Travel	English             
931	VALENTINE VANISHING	2006	0.99	48	PG-13	2025-07-13 13:47:32.258	Travel	English             
977	WINDOW SIDE	2006	2.99	85	R	2025-07-13 13:47:32.258	Travel	English             
41	ARSENIC INDEPENDENCE	2006	0.99	137	PG	2025-07-13 13:47:32.258	Travel	English             
57	BASIC EASY	2006	2.99	90	PG-13	2025-07-13 13:47:32.258	Travel	English             
75	BIRD INDEPENDENCE	2006	4.99	163	G	2025-07-13 13:47:32.258	Travel	English             
84	BOILED DARES	2006	4.99	102	PG	2025-07-13 13:47:32.258	Travel	English             
87	BOONDOCK BALLROOM	2006	0.99	76	NC-17	2025-07-13 13:47:32.258	Travel	English             
88	BORN SPINAL	2006	4.99	179	PG	2025-07-13 13:47:32.258	Travel	English             
103	BUCKET BROTHERHOOD	2006	4.99	133	PG	2025-07-13 13:47:32.258	Travel	English             
123	CASABLANCA SUPER	2006	4.99	85	G	2025-07-13 13:47:32.258	Travel	English             
125	CASSIDY WYOMING	2006	2.99	61	NC-17	2025-07-13 13:47:32.258	Travel	English             
167	COMA HEAD	2006	4.99	109	NC-17	2025-07-13 13:47:32.258	Travel	English             
169	COMFORTS RUSH	2006	2.99	76	NC-17	2025-07-13 13:47:32.258	Travel	English             
181	CONTACT ANONYMOUS	2006	2.99	166	PG-13	2025-07-13 13:47:32.258	Travel	English             
224	DESPERATE TRAINSPOTTING	2006	4.99	81	G	2025-07-13 13:47:32.258	Travel	English             
233	DISCIPLE MOTHER	2006	0.99	141	PG	2025-07-13 13:47:32.258	Travel	English             
257	DRUMLINE CYCLONE	2006	0.99	110	G	2025-07-13 13:47:32.258	Travel	English             
286	ENOUGH RAGING	2006	2.99	158	NC-17	2025-07-13 13:47:32.258	Travel	English             
288	ESCAPE METROPOLIS	2006	2.99	167	R	2025-07-13 13:47:32.258	Travel	English             
472	ITALIAN AFRICAN	2006	4.99	174	G	2025-07-13 13:47:32.258	Travel	English             
496	KICK SAVANNAH	2006	0.99	179	PG-13	2025-07-13 13:47:32.258	Travel	English             
513	LEATHERNECKS DWARFS	2006	2.99	153	PG-13	2025-07-13 13:47:32.258	Travel	English             
518	LIAISONS SWEET	2006	4.99	140	PG	2025-07-13 13:47:32.258	Travel	English             
526	LOCK REAR	2006	2.99	120	R	2025-07-13 13:47:32.258	Travel	English             
543	MADIGAN DORADO	2006	4.99	116	R	2025-07-13 13:47:32.258	Travel	English             
601	MOULIN WAKE	2006	0.99	79	PG-13	2025-07-13 13:47:32.258	Travel	English             
625	NONE SPIKING	2006	0.99	83	NC-17	2025-07-13 13:47:32.174	Sci-Fi	English             
637	OPEN AFRICAN	2006	4.99	131	PG	2025-07-13 13:47:32.175	Sci-Fi	English             
655	PANTHER REDS	2006	4.99	109	NC-17	2025-07-13 13:47:32.176	Sci-Fi	English             
711	RAGING AIRPLANE	2006	4.99	154	R	2025-07-13 13:47:32.177	Sci-Fi	English             
714	RANDOM GO	2006	2.99	73	NC-17	2025-07-13 13:47:32.179	Sci-Fi	English             
723	REIGN GENTLEMEN	2006	2.99	82	PG-13	2025-07-13 13:47:32.18	Sci-Fi	English             
798	SILVERADO GOLDFINGER	2006	4.99	74	PG	2025-07-13 13:47:32.181	Sci-Fi	English             
817	SOLDIERS EVOLUTION	2006	4.99	185	R	2025-07-13 13:47:32.183	Sci-Fi	English             
831	SPIRITED CASUALTIES	2006	0.99	138	PG-13	2025-07-13 13:47:32.184	Sci-Fi	English             
839	STALLION SUNDANCE	2006	0.99	130	PG-13	2025-07-13 13:47:32.185	Sci-Fi	English             
860	SUICIDES SILENCE	2006	4.99	93	G	2025-07-13 13:47:32.186	Sci-Fi	English             
863	SUN CONFESSIONS	2006	0.99	141	R	2025-07-13 13:47:32.188	Sci-Fi	English             
893	TITANS JERK	2006	4.99	91	PG	2025-07-13 13:47:32.189	Sci-Fi	English             
912	TROJAN TOMORROW	2006	2.99	52	PG	2025-07-13 13:47:32.191	Sci-Fi	English             
924	UNFORGIVEN ZOOLANDER	2006	0.99	129	PG	2025-07-13 13:47:32.193	Sci-Fi	English             
102	BUBBLE GROSSE	2006	4.99	60	R	2025-07-13 13:47:32.203	Sports	English             
113	CALIFORNIA BIRDS	2006	4.99	75	NC-17	2025-07-13 13:47:32.204	Sports	English             
120	CARIBBEAN LIBERTY	2006	4.99	92	NC-17	2025-07-13 13:47:32.205	Sports	English             
135	CHANCE RESURRECTION	2006	2.99	70	R	2025-07-13 13:47:32.207	Sports	English             
176	CONGENIALITY QUEST	2006	0.99	87	PG-13	2025-07-13 13:47:32.208	Sports	English             
532	LOSER HUSTLER	2006	4.99	80	PG	2025-07-13 13:47:32.249	Sports	English             
570	MERMAID INSECTS	2006	4.99	104	NC-17	2025-07-13 13:47:32.251	Sports	English             
577	MILE MULAN	2006	0.99	64	PG	2025-07-13 13:47:32.253	Sports	English             
598	MOSQUITO ARMAGEDDON	2006	0.99	57	G	2025-07-13 13:47:32.254	Sports	English             
599	MOTHER OLEANDER	2006	0.99	103	R	2025-07-13 13:47:32.256	Sports	English             
606	MUMMY CREATURES	2006	0.99	160	NC-17	2025-07-13 13:47:32.257	Sports	English             
612	MUSSOLINI SPOILERS	2006	2.99	180	G	2025-07-13 13:47:32.258	Sports	English             
619	NEIGHBORS CHARADE	2006	0.99	161	R	2025-07-13 13:47:32.258	Sports	English             
628	NORTHWEST POLISH	2006	2.99	172	PG	2025-07-13 13:47:32.258	Sports	English             
631	NOVOCAINE FLIGHT	2006	0.99	64	G	2025-07-13 13:47:32.258	Sports	English             
667	PEACH INNOCENT	2006	2.99	160	PG-13	2025-07-13 13:47:32.258	Sports	English             
668	PEAK FOREVER	2006	4.99	80	PG	2025-07-13 13:47:32.258	Sports	English             
671	PERDITION FARGO	2006	4.99	99	NC-17	2025-07-13 13:47:32.258	Sports	English             
676	PHILADELPHIA WIFE	2006	4.99	137	PG-13	2025-07-13 13:47:32.258	Sports	English             
678	PICKUP DRIVING	2006	2.99	77	G	2025-07-13 13:47:32.258	Sports	English             
681	PIRATES ROXANNE	2006	0.99	100	PG	2025-07-13 13:47:32.258	Sports	English             
691	POSEIDON FOREVER	2006	4.99	159	PG-13	2025-07-13 13:47:32.258	Sports	English             
719	RECORDS ZORRO	2006	4.99	182	PG	2025-07-13 13:47:32.258	Sports	English             
729	RIDER CADDYSHACK	2006	2.99	177	PG	2025-07-13 13:47:32.258	Sports	English             
733	RIVER OUTLAW	2006	0.99	149	PG-13	2025-07-13 13:47:32.258	Sports	English             
745	ROSES TREASURE	2006	4.99	162	PG-13	2025-07-13 13:47:32.258	Sports	English             
763	SATISFACTION CONFIDENTIAL	2006	4.99	75	G	2025-07-13 13:47:32.258	Sports	English             
764	SATURDAY LAMBS	2006	4.99	150	G	2025-07-13 13:47:32.258	Sports	English             
773	SEABISCUIT PUNK	2006	2.99	112	NC-17	2025-07-13 13:47:32.258	Sports	English             
777	SECRETARY ROUGE	2006	4.99	158	PG	2025-07-13 13:47:32.258	Sports	English             
779	SENSE GREEK	2006	4.99	54	R	2025-07-13 13:47:32.258	Sports	English             
782	SHAKESPEARE SADDLE	2006	2.99	60	PG-13	2025-07-13 13:47:32.258	Sports	English             
796	SIERRA DIVIDE	2006	0.99	135	NC-17	2025-07-13 13:47:32.258	Sports	English             
809	SLIPPER FIDELITY	2006	0.99	156	PG-13	2025-07-13 13:47:32.258	Sports	English             
813	SMOOCHY CONTROL	2006	0.99	184	R	2025-07-13 13:47:32.258	Sports	English             
836	SQUAD FISH	2006	2.99	136	PG	2025-07-13 13:47:32.258	Sports	English             
841	STAR OPERATION	2006	2.99	181	PG	2025-07-13 13:47:32.258	Sports	English             
844	STEERS ARMAGEDDON	2006	4.99	140	PG	2025-07-13 13:47:32.258	Sports	English             
851	STRAIGHT HOURS	2006	0.99	151	R	2025-07-13 13:47:32.258	Sports	English             
875	TALENTED HOMICIDE	2006	0.99	173	PG	2025-07-13 13:47:32.258	Sports	English             
890	TIGHTS DAWN	2006	0.99	172	R	2025-07-13 13:47:32.258	Sports	English             
898	TOURIST PELICAN	2006	4.99	152	PG-13	2025-07-13 13:47:32.258	Sports	English             
902	TRADING PINOCCHIO	2006	4.99	170	PG	2025-07-13 13:47:32.258	Sports	English             
917	TUXEDO MILE	2006	2.99	152	R	2025-07-13 13:47:32.258	Sports	English             
940	VICTORY ACADEMY	2006	0.99	64	PG-13	2025-07-13 13:47:32.258	Sports	English             
294	EXPECATIONS NATURAL	2006	4.99	138	PG-13	2025-07-13 13:47:32.258	Travel	English             
299	FACTORY DRAGON	2006	0.99	144	PG-13	2025-07-13 13:47:32.258	Travel	English             
307	FELLOWSHIP AUTUMN	2006	4.99	77	NC-17	2025-07-13 13:47:32.258	Travel	English             
339	FROGMEN BREAKING	2006	0.99	111	R	2025-07-13 13:47:32.258	Travel	English             
342	FUGITIVE MAGUIRE	2006	4.99	83	R	2025-07-13 13:47:32.258	Travel	English             
347	GAMES BOWFINGER	2006	4.99	119	PG-13	2025-07-13 13:47:32.258	Travel	English             
386	GUMP DATE	2006	4.99	53	NC-17	2025-07-13 13:47:32.258	Travel	English             
405	HAUNTED ANTITRUST	2006	4.99	76	NC-17	2025-07-13 13:47:32.258	Travel	English             
434	HORROR REIGN	2006	0.99	139	R	2025-07-13 13:47:32.258	Travel	English             
451	IGBY MAKER	2006	4.99	160	NC-17	2025-07-13 13:47:32.258	Travel	English             
\.


--
-- TOC entry 4895 (class 0 OID 50845)
-- Dependencies: 220
-- Data for Name: dim_staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_staff (staff_id, full_name, store_id, active, fecha_carga) FROM stdin;
1	Mike Hillyer	1	t	2025-07-13 16:45:05.551
2	Jon Stephens	2	t	2025-07-13 16:45:05.736
\.


--
-- TOC entry 4896 (class 0 OID 50850)
-- Dependencies: 221
-- Data for Name: dim_store; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_store (store_id, manager, country, city, fecha_carga) FROM stdin;
2	Jon Stephens	Australia	Woodridge	2025-07-13 16:15:01.715
1	Mike Hillyer	Canada	Lethbridge	2025-07-13 16:15:02.02
\.


--
-- TOC entry 4898 (class 0 OID 50929)
-- Dependencies: 223
-- Data for Name: dim_tiempo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dim_tiempo (tiempo_id, fecha, anio, trimestre, mes, nombre_mes, dia, nombre_dia, dia_semana, es_fin_de_semana) FROM stdin;
20100101	2010-01-01	2010	1	1	Enero	1	Viernes	5	f
20100102	2010-01-02	2010	1	1	Enero	2	Sábado	6	t
20100103	2010-01-03	2010	1	1	Enero	3	Domingo	7	t
20100104	2010-01-04	2010	1	1	Enero	4	Lunes	1	f
20100105	2010-01-05	2010	1	1	Enero	5	Martes	2	f
20100106	2010-01-06	2010	1	1	Enero	6	Miércoles	3	f
20100107	2010-01-07	2010	1	1	Enero	7	Jueves	4	f
20100108	2010-01-08	2010	1	1	Enero	8	Viernes	5	f
20100109	2010-01-09	2010	1	1	Enero	9	Sábado	6	t
20100110	2010-01-10	2010	1	1	Enero	10	Domingo	7	t
20100111	2010-01-11	2010	1	1	Enero	11	Lunes	1	f
20100112	2010-01-12	2010	1	1	Enero	12	Martes	2	f
20100113	2010-01-13	2010	1	1	Enero	13	Miércoles	3	f
20100114	2010-01-14	2010	1	1	Enero	14	Jueves	4	f
20100115	2010-01-15	2010	1	1	Enero	15	Viernes	5	f
20100116	2010-01-16	2010	1	1	Enero	16	Sábado	6	t
20100117	2010-01-17	2010	1	1	Enero	17	Domingo	7	t
20100118	2010-01-18	2010	1	1	Enero	18	Lunes	1	f
20100119	2010-01-19	2010	1	1	Enero	19	Martes	2	f
20100120	2010-01-20	2010	1	1	Enero	20	Miércoles	3	f
20100121	2010-01-21	2010	1	1	Enero	21	Jueves	4	f
20100122	2010-01-22	2010	1	1	Enero	22	Viernes	5	f
20100123	2010-01-23	2010	1	1	Enero	23	Sábado	6	t
20100124	2010-01-24	2010	1	1	Enero	24	Domingo	7	t
20100125	2010-01-25	2010	1	1	Enero	25	Lunes	1	f
20100126	2010-01-26	2010	1	1	Enero	26	Martes	2	f
20100127	2010-01-27	2010	1	1	Enero	27	Miércoles	3	f
20100128	2010-01-28	2010	1	1	Enero	28	Jueves	4	f
20100129	2010-01-29	2010	1	1	Enero	29	Viernes	5	f
20100130	2010-01-30	2010	1	1	Enero	30	Sábado	6	t
20100131	2010-01-31	2010	1	1	Enero	31	Domingo	7	t
20100201	2010-02-01	2010	1	2	Febrero	1	Lunes	1	f
20100202	2010-02-02	2010	1	2	Febrero	2	Martes	2	f
20100203	2010-02-03	2010	1	2	Febrero	3	Miércoles	3	f
20100204	2010-02-04	2010	1	2	Febrero	4	Jueves	4	f
20100205	2010-02-05	2010	1	2	Febrero	5	Viernes	5	f
20100206	2010-02-06	2010	1	2	Febrero	6	Sábado	6	t
20100207	2010-02-07	2010	1	2	Febrero	7	Domingo	7	t
20100208	2010-02-08	2010	1	2	Febrero	8	Lunes	1	f
20100209	2010-02-09	2010	1	2	Febrero	9	Martes	2	f
20100210	2010-02-10	2010	1	2	Febrero	10	Miércoles	3	f
20100211	2010-02-11	2010	1	2	Febrero	11	Jueves	4	f
20100212	2010-02-12	2010	1	2	Febrero	12	Viernes	5	f
20100213	2010-02-13	2010	1	2	Febrero	13	Sábado	6	t
20100214	2010-02-14	2010	1	2	Febrero	14	Domingo	7	t
20100215	2010-02-15	2010	1	2	Febrero	15	Lunes	1	f
20100216	2010-02-16	2010	1	2	Febrero	16	Martes	2	f
20100217	2010-02-17	2010	1	2	Febrero	17	Miércoles	3	f
20100218	2010-02-18	2010	1	2	Febrero	18	Jueves	4	f
20100219	2010-02-19	2010	1	2	Febrero	19	Viernes	5	f
20100220	2010-02-20	2010	1	2	Febrero	20	Sábado	6	t
20100221	2010-02-21	2010	1	2	Febrero	21	Domingo	7	t
20100222	2010-02-22	2010	1	2	Febrero	22	Lunes	1	f
20100223	2010-02-23	2010	1	2	Febrero	23	Martes	2	f
20100224	2010-02-24	2010	1	2	Febrero	24	Miércoles	3	f
20100225	2010-02-25	2010	1	2	Febrero	25	Jueves	4	f
20100226	2010-02-26	2010	1	2	Febrero	26	Viernes	5	f
20100227	2010-02-27	2010	1	2	Febrero	27	Sábado	6	t
20100228	2010-02-28	2010	1	2	Febrero	28	Domingo	7	t
20100301	2010-03-01	2010	1	3	Marzo	1	Lunes	1	f
20100302	2010-03-02	2010	1	3	Marzo	2	Martes	2	f
20100303	2010-03-03	2010	1	3	Marzo	3	Miércoles	3	f
20100304	2010-03-04	2010	1	3	Marzo	4	Jueves	4	f
20100305	2010-03-05	2010	1	3	Marzo	5	Viernes	5	f
20100306	2010-03-06	2010	1	3	Marzo	6	Sábado	6	t
20100307	2010-03-07	2010	1	3	Marzo	7	Domingo	7	t
20100308	2010-03-08	2010	1	3	Marzo	8	Lunes	1	f
20100309	2010-03-09	2010	1	3	Marzo	9	Martes	2	f
20100310	2010-03-10	2010	1	3	Marzo	10	Miércoles	3	f
20100311	2010-03-11	2010	1	3	Marzo	11	Jueves	4	f
20100312	2010-03-12	2010	1	3	Marzo	12	Viernes	5	f
20100313	2010-03-13	2010	1	3	Marzo	13	Sábado	6	t
20100314	2010-03-14	2010	1	3	Marzo	14	Domingo	7	t
20100315	2010-03-15	2010	1	3	Marzo	15	Lunes	1	f
20100316	2010-03-16	2010	1	3	Marzo	16	Martes	2	f
20100317	2010-03-17	2010	1	3	Marzo	17	Miércoles	3	f
20100318	2010-03-18	2010	1	3	Marzo	18	Jueves	4	f
20100319	2010-03-19	2010	1	3	Marzo	19	Viernes	5	f
20100320	2010-03-20	2010	1	3	Marzo	20	Sábado	6	t
20100321	2010-03-21	2010	1	3	Marzo	21	Domingo	7	t
20100322	2010-03-22	2010	1	3	Marzo	22	Lunes	1	f
20100323	2010-03-23	2010	1	3	Marzo	23	Martes	2	f
20100324	2010-03-24	2010	1	3	Marzo	24	Miércoles	3	f
20100325	2010-03-25	2010	1	3	Marzo	25	Jueves	4	f
20100326	2010-03-26	2010	1	3	Marzo	26	Viernes	5	f
20100327	2010-03-27	2010	1	3	Marzo	27	Sábado	6	t
20100328	2010-03-28	2010	1	3	Marzo	28	Domingo	7	t
20100329	2010-03-29	2010	1	3	Marzo	29	Lunes	1	f
20100330	2010-03-30	2010	1	3	Marzo	30	Martes	2	f
20100331	2010-03-31	2010	1	3	Marzo	31	Miércoles	3	f
20100401	2010-04-01	2010	2	4	Abril	1	Jueves	4	f
20100402	2010-04-02	2010	2	4	Abril	2	Viernes	5	f
20100403	2010-04-03	2010	2	4	Abril	3	Sábado	6	t
20100404	2010-04-04	2010	2	4	Abril	4	Domingo	7	t
20100405	2010-04-05	2010	2	4	Abril	5	Lunes	1	f
20100406	2010-04-06	2010	2	4	Abril	6	Martes	2	f
20100407	2010-04-07	2010	2	4	Abril	7	Miércoles	3	f
20100408	2010-04-08	2010	2	4	Abril	8	Jueves	4	f
20100409	2010-04-09	2010	2	4	Abril	9	Viernes	5	f
20100410	2010-04-10	2010	2	4	Abril	10	Sábado	6	t
20100411	2010-04-11	2010	2	4	Abril	11	Domingo	7	t
20100412	2010-04-12	2010	2	4	Abril	12	Lunes	1	f
20100413	2010-04-13	2010	2	4	Abril	13	Martes	2	f
20100414	2010-04-14	2010	2	4	Abril	14	Miércoles	3	f
20100415	2010-04-15	2010	2	4	Abril	15	Jueves	4	f
20100416	2010-04-16	2010	2	4	Abril	16	Viernes	5	f
20100417	2010-04-17	2010	2	4	Abril	17	Sábado	6	t
20100418	2010-04-18	2010	2	4	Abril	18	Domingo	7	t
20100419	2010-04-19	2010	2	4	Abril	19	Lunes	1	f
20100420	2010-04-20	2010	2	4	Abril	20	Martes	2	f
20100421	2010-04-21	2010	2	4	Abril	21	Miércoles	3	f
20100422	2010-04-22	2010	2	4	Abril	22	Jueves	4	f
20100423	2010-04-23	2010	2	4	Abril	23	Viernes	5	f
20100424	2010-04-24	2010	2	4	Abril	24	Sábado	6	t
20100425	2010-04-25	2010	2	4	Abril	25	Domingo	7	t
20100426	2010-04-26	2010	2	4	Abril	26	Lunes	1	f
20100427	2010-04-27	2010	2	4	Abril	27	Martes	2	f
20100428	2010-04-28	2010	2	4	Abril	28	Miércoles	3	f
20100429	2010-04-29	2010	2	4	Abril	29	Jueves	4	f
20100430	2010-04-30	2010	2	4	Abril	30	Viernes	5	f
20100501	2010-05-01	2010	2	5	Mayo	1	Sábado	6	t
20100502	2010-05-02	2010	2	5	Mayo	2	Domingo	7	t
20100503	2010-05-03	2010	2	5	Mayo	3	Lunes	1	f
20100504	2010-05-04	2010	2	5	Mayo	4	Martes	2	f
20100505	2010-05-05	2010	2	5	Mayo	5	Miércoles	3	f
20100506	2010-05-06	2010	2	5	Mayo	6	Jueves	4	f
20100507	2010-05-07	2010	2	5	Mayo	7	Viernes	5	f
20100508	2010-05-08	2010	2	5	Mayo	8	Sábado	6	t
20100509	2010-05-09	2010	2	5	Mayo	9	Domingo	7	t
20100510	2010-05-10	2010	2	5	Mayo	10	Lunes	1	f
20100511	2010-05-11	2010	2	5	Mayo	11	Martes	2	f
20100512	2010-05-12	2010	2	5	Mayo	12	Miércoles	3	f
20100513	2010-05-13	2010	2	5	Mayo	13	Jueves	4	f
20100514	2010-05-14	2010	2	5	Mayo	14	Viernes	5	f
20100515	2010-05-15	2010	2	5	Mayo	15	Sábado	6	t
20100516	2010-05-16	2010	2	5	Mayo	16	Domingo	7	t
20100517	2010-05-17	2010	2	5	Mayo	17	Lunes	1	f
20100518	2010-05-18	2010	2	5	Mayo	18	Martes	2	f
20100519	2010-05-19	2010	2	5	Mayo	19	Miércoles	3	f
20100520	2010-05-20	2010	2	5	Mayo	20	Jueves	4	f
20100521	2010-05-21	2010	2	5	Mayo	21	Viernes	5	f
20100522	2010-05-22	2010	2	5	Mayo	22	Sábado	6	t
20100523	2010-05-23	2010	2	5	Mayo	23	Domingo	7	t
20100524	2010-05-24	2010	2	5	Mayo	24	Lunes	1	f
20100525	2010-05-25	2010	2	5	Mayo	25	Martes	2	f
20100526	2010-05-26	2010	2	5	Mayo	26	Miércoles	3	f
20100527	2010-05-27	2010	2	5	Mayo	27	Jueves	4	f
20100528	2010-05-28	2010	2	5	Mayo	28	Viernes	5	f
20100529	2010-05-29	2010	2	5	Mayo	29	Sábado	6	t
20100530	2010-05-30	2010	2	5	Mayo	30	Domingo	7	t
20100531	2010-05-31	2010	2	5	Mayo	31	Lunes	1	f
20100601	2010-06-01	2010	2	6	Junio	1	Martes	2	f
20100602	2010-06-02	2010	2	6	Junio	2	Miércoles	3	f
20100603	2010-06-03	2010	2	6	Junio	3	Jueves	4	f
20100604	2010-06-04	2010	2	6	Junio	4	Viernes	5	f
20100605	2010-06-05	2010	2	6	Junio	5	Sábado	6	t
20100606	2010-06-06	2010	2	6	Junio	6	Domingo	7	t
20100607	2010-06-07	2010	2	6	Junio	7	Lunes	1	f
20100608	2010-06-08	2010	2	6	Junio	8	Martes	2	f
20100609	2010-06-09	2010	2	6	Junio	9	Miércoles	3	f
20100610	2010-06-10	2010	2	6	Junio	10	Jueves	4	f
20100611	2010-06-11	2010	2	6	Junio	11	Viernes	5	f
20100612	2010-06-12	2010	2	6	Junio	12	Sábado	6	t
20100613	2010-06-13	2010	2	6	Junio	13	Domingo	7	t
20100614	2010-06-14	2010	2	6	Junio	14	Lunes	1	f
20100615	2010-06-15	2010	2	6	Junio	15	Martes	2	f
20100616	2010-06-16	2010	2	6	Junio	16	Miércoles	3	f
20100617	2010-06-17	2010	2	6	Junio	17	Jueves	4	f
20100618	2010-06-18	2010	2	6	Junio	18	Viernes	5	f
20100619	2010-06-19	2010	2	6	Junio	19	Sábado	6	t
20100620	2010-06-20	2010	2	6	Junio	20	Domingo	7	t
20100621	2010-06-21	2010	2	6	Junio	21	Lunes	1	f
20100622	2010-06-22	2010	2	6	Junio	22	Martes	2	f
20100623	2010-06-23	2010	2	6	Junio	23	Miércoles	3	f
20100624	2010-06-24	2010	2	6	Junio	24	Jueves	4	f
20100625	2010-06-25	2010	2	6	Junio	25	Viernes	5	f
20100626	2010-06-26	2010	2	6	Junio	26	Sábado	6	t
20100627	2010-06-27	2010	2	6	Junio	27	Domingo	7	t
20100628	2010-06-28	2010	2	6	Junio	28	Lunes	1	f
20100629	2010-06-29	2010	2	6	Junio	29	Martes	2	f
20100630	2010-06-30	2010	2	6	Junio	30	Miércoles	3	f
20100701	2010-07-01	2010	3	7	Julio	1	Jueves	4	f
20100702	2010-07-02	2010	3	7	Julio	2	Viernes	5	f
20100703	2010-07-03	2010	3	7	Julio	3	Sábado	6	t
20100704	2010-07-04	2010	3	7	Julio	4	Domingo	7	t
20100705	2010-07-05	2010	3	7	Julio	5	Lunes	1	f
20100706	2010-07-06	2010	3	7	Julio	6	Martes	2	f
20100707	2010-07-07	2010	3	7	Julio	7	Miércoles	3	f
20100708	2010-07-08	2010	3	7	Julio	8	Jueves	4	f
20100709	2010-07-09	2010	3	7	Julio	9	Viernes	5	f
20100710	2010-07-10	2010	3	7	Julio	10	Sábado	6	t
20100711	2010-07-11	2010	3	7	Julio	11	Domingo	7	t
20100712	2010-07-12	2010	3	7	Julio	12	Lunes	1	f
20100713	2010-07-13	2010	3	7	Julio	13	Martes	2	f
20100714	2010-07-14	2010	3	7	Julio	14	Miércoles	3	f
20100715	2010-07-15	2010	3	7	Julio	15	Jueves	4	f
20100716	2010-07-16	2010	3	7	Julio	16	Viernes	5	f
20100717	2010-07-17	2010	3	7	Julio	17	Sábado	6	t
20100718	2010-07-18	2010	3	7	Julio	18	Domingo	7	t
20100719	2010-07-19	2010	3	7	Julio	19	Lunes	1	f
20100720	2010-07-20	2010	3	7	Julio	20	Martes	2	f
20100721	2010-07-21	2010	3	7	Julio	21	Miércoles	3	f
20100722	2010-07-22	2010	3	7	Julio	22	Jueves	4	f
20100723	2010-07-23	2010	3	7	Julio	23	Viernes	5	f
20100724	2010-07-24	2010	3	7	Julio	24	Sábado	6	t
20100725	2010-07-25	2010	3	7	Julio	25	Domingo	7	t
20100726	2010-07-26	2010	3	7	Julio	26	Lunes	1	f
20100727	2010-07-27	2010	3	7	Julio	27	Martes	2	f
20100728	2010-07-28	2010	3	7	Julio	28	Miércoles	3	f
20100729	2010-07-29	2010	3	7	Julio	29	Jueves	4	f
20100730	2010-07-30	2010	3	7	Julio	30	Viernes	5	f
20100731	2010-07-31	2010	3	7	Julio	31	Sábado	6	t
20100801	2010-08-01	2010	3	8	Agosto	1	Domingo	7	t
20100802	2010-08-02	2010	3	8	Agosto	2	Lunes	1	f
20100803	2010-08-03	2010	3	8	Agosto	3	Martes	2	f
20100804	2010-08-04	2010	3	8	Agosto	4	Miércoles	3	f
20100805	2010-08-05	2010	3	8	Agosto	5	Jueves	4	f
20100806	2010-08-06	2010	3	8	Agosto	6	Viernes	5	f
20100807	2010-08-07	2010	3	8	Agosto	7	Sábado	6	t
20100808	2010-08-08	2010	3	8	Agosto	8	Domingo	7	t
20100809	2010-08-09	2010	3	8	Agosto	9	Lunes	1	f
20100810	2010-08-10	2010	3	8	Agosto	10	Martes	2	f
20100811	2010-08-11	2010	3	8	Agosto	11	Miércoles	3	f
20100812	2010-08-12	2010	3	8	Agosto	12	Jueves	4	f
20100813	2010-08-13	2010	3	8	Agosto	13	Viernes	5	f
20100814	2010-08-14	2010	3	8	Agosto	14	Sábado	6	t
20100815	2010-08-15	2010	3	8	Agosto	15	Domingo	7	t
20100816	2010-08-16	2010	3	8	Agosto	16	Lunes	1	f
20100817	2010-08-17	2010	3	8	Agosto	17	Martes	2	f
20100818	2010-08-18	2010	3	8	Agosto	18	Miércoles	3	f
20100819	2010-08-19	2010	3	8	Agosto	19	Jueves	4	f
20100820	2010-08-20	2010	3	8	Agosto	20	Viernes	5	f
20100821	2010-08-21	2010	3	8	Agosto	21	Sábado	6	t
20100822	2010-08-22	2010	3	8	Agosto	22	Domingo	7	t
20100823	2010-08-23	2010	3	8	Agosto	23	Lunes	1	f
20100824	2010-08-24	2010	3	8	Agosto	24	Martes	2	f
20100825	2010-08-25	2010	3	8	Agosto	25	Miércoles	3	f
20100826	2010-08-26	2010	3	8	Agosto	26	Jueves	4	f
20100827	2010-08-27	2010	3	8	Agosto	27	Viernes	5	f
20100828	2010-08-28	2010	3	8	Agosto	28	Sábado	6	t
20100829	2010-08-29	2010	3	8	Agosto	29	Domingo	7	t
20100830	2010-08-30	2010	3	8	Agosto	30	Lunes	1	f
20100831	2010-08-31	2010	3	8	Agosto	31	Martes	2	f
20100901	2010-09-01	2010	3	9	Septiembre	1	Miércoles	3	f
20100902	2010-09-02	2010	3	9	Septiembre	2	Jueves	4	f
20100903	2010-09-03	2010	3	9	Septiembre	3	Viernes	5	f
20100904	2010-09-04	2010	3	9	Septiembre	4	Sábado	6	t
20100905	2010-09-05	2010	3	9	Septiembre	5	Domingo	7	t
20100906	2010-09-06	2010	3	9	Septiembre	6	Lunes	1	f
20100907	2010-09-07	2010	3	9	Septiembre	7	Martes	2	f
20100908	2010-09-08	2010	3	9	Septiembre	8	Miércoles	3	f
20100909	2010-09-09	2010	3	9	Septiembre	9	Jueves	4	f
20100910	2010-09-10	2010	3	9	Septiembre	10	Viernes	5	f
20100911	2010-09-11	2010	3	9	Septiembre	11	Sábado	6	t
20100912	2010-09-12	2010	3	9	Septiembre	12	Domingo	7	t
20100913	2010-09-13	2010	3	9	Septiembre	13	Lunes	1	f
20100914	2010-09-14	2010	3	9	Septiembre	14	Martes	2	f
20100915	2010-09-15	2010	3	9	Septiembre	15	Miércoles	3	f
20100916	2010-09-16	2010	3	9	Septiembre	16	Jueves	4	f
20100917	2010-09-17	2010	3	9	Septiembre	17	Viernes	5	f
20100918	2010-09-18	2010	3	9	Septiembre	18	Sábado	6	t
20100919	2010-09-19	2010	3	9	Septiembre	19	Domingo	7	t
20100920	2010-09-20	2010	3	9	Septiembre	20	Lunes	1	f
20100921	2010-09-21	2010	3	9	Septiembre	21	Martes	2	f
20100922	2010-09-22	2010	3	9	Septiembre	22	Miércoles	3	f
20100923	2010-09-23	2010	3	9	Septiembre	23	Jueves	4	f
20100924	2010-09-24	2010	3	9	Septiembre	24	Viernes	5	f
20100925	2010-09-25	2010	3	9	Septiembre	25	Sábado	6	t
20100926	2010-09-26	2010	3	9	Septiembre	26	Domingo	7	t
20100927	2010-09-27	2010	3	9	Septiembre	27	Lunes	1	f
20100928	2010-09-28	2010	3	9	Septiembre	28	Martes	2	f
20100929	2010-09-29	2010	3	9	Septiembre	29	Miércoles	3	f
20100930	2010-09-30	2010	3	9	Septiembre	30	Jueves	4	f
20101001	2010-10-01	2010	4	10	Octubre	1	Viernes	5	f
20101002	2010-10-02	2010	4	10	Octubre	2	Sábado	6	t
20101003	2010-10-03	2010	4	10	Octubre	3	Domingo	7	t
20101004	2010-10-04	2010	4	10	Octubre	4	Lunes	1	f
20101005	2010-10-05	2010	4	10	Octubre	5	Martes	2	f
20101006	2010-10-06	2010	4	10	Octubre	6	Miércoles	3	f
20101007	2010-10-07	2010	4	10	Octubre	7	Jueves	4	f
20101008	2010-10-08	2010	4	10	Octubre	8	Viernes	5	f
20101009	2010-10-09	2010	4	10	Octubre	9	Sábado	6	t
20101010	2010-10-10	2010	4	10	Octubre	10	Domingo	7	t
20101011	2010-10-11	2010	4	10	Octubre	11	Lunes	1	f
20101012	2010-10-12	2010	4	10	Octubre	12	Martes	2	f
20101013	2010-10-13	2010	4	10	Octubre	13	Miércoles	3	f
20101014	2010-10-14	2010	4	10	Octubre	14	Jueves	4	f
20101015	2010-10-15	2010	4	10	Octubre	15	Viernes	5	f
20101016	2010-10-16	2010	4	10	Octubre	16	Sábado	6	t
20101017	2010-10-17	2010	4	10	Octubre	17	Domingo	7	t
20101018	2010-10-18	2010	4	10	Octubre	18	Lunes	1	f
20101019	2010-10-19	2010	4	10	Octubre	19	Martes	2	f
20101020	2010-10-20	2010	4	10	Octubre	20	Miércoles	3	f
20101021	2010-10-21	2010	4	10	Octubre	21	Jueves	4	f
20101022	2010-10-22	2010	4	10	Octubre	22	Viernes	5	f
20101023	2010-10-23	2010	4	10	Octubre	23	Sábado	6	t
20101024	2010-10-24	2010	4	10	Octubre	24	Domingo	7	t
20101025	2010-10-25	2010	4	10	Octubre	25	Lunes	1	f
20101026	2010-10-26	2010	4	10	Octubre	26	Martes	2	f
20101027	2010-10-27	2010	4	10	Octubre	27	Miércoles	3	f
20101028	2010-10-28	2010	4	10	Octubre	28	Jueves	4	f
20101029	2010-10-29	2010	4	10	Octubre	29	Viernes	5	f
20101030	2010-10-30	2010	4	10	Octubre	30	Sábado	6	t
20101031	2010-10-31	2010	4	10	Octubre	31	Domingo	7	t
20101101	2010-11-01	2010	4	11	Noviembre	1	Lunes	1	f
20101102	2010-11-02	2010	4	11	Noviembre	2	Martes	2	f
20101103	2010-11-03	2010	4	11	Noviembre	3	Miércoles	3	f
20101104	2010-11-04	2010	4	11	Noviembre	4	Jueves	4	f
20101105	2010-11-05	2010	4	11	Noviembre	5	Viernes	5	f
20101106	2010-11-06	2010	4	11	Noviembre	6	Sábado	6	t
20101107	2010-11-07	2010	4	11	Noviembre	7	Domingo	7	t
20101108	2010-11-08	2010	4	11	Noviembre	8	Lunes	1	f
20101109	2010-11-09	2010	4	11	Noviembre	9	Martes	2	f
20101110	2010-11-10	2010	4	11	Noviembre	10	Miércoles	3	f
20101111	2010-11-11	2010	4	11	Noviembre	11	Jueves	4	f
20101112	2010-11-12	2010	4	11	Noviembre	12	Viernes	5	f
20101113	2010-11-13	2010	4	11	Noviembre	13	Sábado	6	t
20101114	2010-11-14	2010	4	11	Noviembre	14	Domingo	7	t
20101115	2010-11-15	2010	4	11	Noviembre	15	Lunes	1	f
20101116	2010-11-16	2010	4	11	Noviembre	16	Martes	2	f
20101117	2010-11-17	2010	4	11	Noviembre	17	Miércoles	3	f
20101118	2010-11-18	2010	4	11	Noviembre	18	Jueves	4	f
20101119	2010-11-19	2010	4	11	Noviembre	19	Viernes	5	f
20101120	2010-11-20	2010	4	11	Noviembre	20	Sábado	6	t
20101121	2010-11-21	2010	4	11	Noviembre	21	Domingo	7	t
20101122	2010-11-22	2010	4	11	Noviembre	22	Lunes	1	f
20101123	2010-11-23	2010	4	11	Noviembre	23	Martes	2	f
20101124	2010-11-24	2010	4	11	Noviembre	24	Miércoles	3	f
20101125	2010-11-25	2010	4	11	Noviembre	25	Jueves	4	f
20101126	2010-11-26	2010	4	11	Noviembre	26	Viernes	5	f
20101127	2010-11-27	2010	4	11	Noviembre	27	Sábado	6	t
20101128	2010-11-28	2010	4	11	Noviembre	28	Domingo	7	t
20101129	2010-11-29	2010	4	11	Noviembre	29	Lunes	1	f
20101130	2010-11-30	2010	4	11	Noviembre	30	Martes	2	f
20101201	2010-12-01	2010	4	12	Diciembre	1	Miércoles	3	f
20101202	2010-12-02	2010	4	12	Diciembre	2	Jueves	4	f
20101203	2010-12-03	2010	4	12	Diciembre	3	Viernes	5	f
20101204	2010-12-04	2010	4	12	Diciembre	4	Sábado	6	t
20101205	2010-12-05	2010	4	12	Diciembre	5	Domingo	7	t
20101206	2010-12-06	2010	4	12	Diciembre	6	Lunes	1	f
20101207	2010-12-07	2010	4	12	Diciembre	7	Martes	2	f
20101208	2010-12-08	2010	4	12	Diciembre	8	Miércoles	3	f
20101209	2010-12-09	2010	4	12	Diciembre	9	Jueves	4	f
20101210	2010-12-10	2010	4	12	Diciembre	10	Viernes	5	f
20101211	2010-12-11	2010	4	12	Diciembre	11	Sábado	6	t
20101212	2010-12-12	2010	4	12	Diciembre	12	Domingo	7	t
20101213	2010-12-13	2010	4	12	Diciembre	13	Lunes	1	f
20101214	2010-12-14	2010	4	12	Diciembre	14	Martes	2	f
20101215	2010-12-15	2010	4	12	Diciembre	15	Miércoles	3	f
20101216	2010-12-16	2010	4	12	Diciembre	16	Jueves	4	f
20101217	2010-12-17	2010	4	12	Diciembre	17	Viernes	5	f
20101218	2010-12-18	2010	4	12	Diciembre	18	Sábado	6	t
20101219	2010-12-19	2010	4	12	Diciembre	19	Domingo	7	t
20101220	2010-12-20	2010	4	12	Diciembre	20	Lunes	1	f
20101221	2010-12-21	2010	4	12	Diciembre	21	Martes	2	f
20101222	2010-12-22	2010	4	12	Diciembre	22	Miércoles	3	f
20101223	2010-12-23	2010	4	12	Diciembre	23	Jueves	4	f
20101224	2010-12-24	2010	4	12	Diciembre	24	Viernes	5	f
20101225	2010-12-25	2010	4	12	Diciembre	25	Sábado	6	t
20101226	2010-12-26	2010	4	12	Diciembre	26	Domingo	7	t
20101227	2010-12-27	2010	4	12	Diciembre	27	Lunes	1	f
20101228	2010-12-28	2010	4	12	Diciembre	28	Martes	2	f
20101229	2010-12-29	2010	4	12	Diciembre	29	Miércoles	3	f
20101230	2010-12-30	2010	4	12	Diciembre	30	Jueves	4	f
20101231	2010-12-31	2010	4	12	Diciembre	31	Viernes	5	f
20110101	2011-01-01	2011	1	1	Enero	1	Sábado	6	t
20110102	2011-01-02	2011	1	1	Enero	2	Domingo	7	t
20110103	2011-01-03	2011	1	1	Enero	3	Lunes	1	f
20110104	2011-01-04	2011	1	1	Enero	4	Martes	2	f
20110105	2011-01-05	2011	1	1	Enero	5	Miércoles	3	f
20110106	2011-01-06	2011	1	1	Enero	6	Jueves	4	f
20110107	2011-01-07	2011	1	1	Enero	7	Viernes	5	f
20110108	2011-01-08	2011	1	1	Enero	8	Sábado	6	t
20110109	2011-01-09	2011	1	1	Enero	9	Domingo	7	t
20110110	2011-01-10	2011	1	1	Enero	10	Lunes	1	f
20110111	2011-01-11	2011	1	1	Enero	11	Martes	2	f
20110112	2011-01-12	2011	1	1	Enero	12	Miércoles	3	f
20110113	2011-01-13	2011	1	1	Enero	13	Jueves	4	f
20110114	2011-01-14	2011	1	1	Enero	14	Viernes	5	f
20110115	2011-01-15	2011	1	1	Enero	15	Sábado	6	t
20110116	2011-01-16	2011	1	1	Enero	16	Domingo	7	t
20110117	2011-01-17	2011	1	1	Enero	17	Lunes	1	f
20110118	2011-01-18	2011	1	1	Enero	18	Martes	2	f
20110119	2011-01-19	2011	1	1	Enero	19	Miércoles	3	f
20110120	2011-01-20	2011	1	1	Enero	20	Jueves	4	f
20110121	2011-01-21	2011	1	1	Enero	21	Viernes	5	f
20110122	2011-01-22	2011	1	1	Enero	22	Sábado	6	t
20110123	2011-01-23	2011	1	1	Enero	23	Domingo	7	t
20110124	2011-01-24	2011	1	1	Enero	24	Lunes	1	f
20110125	2011-01-25	2011	1	1	Enero	25	Martes	2	f
20110126	2011-01-26	2011	1	1	Enero	26	Miércoles	3	f
20110127	2011-01-27	2011	1	1	Enero	27	Jueves	4	f
20110128	2011-01-28	2011	1	1	Enero	28	Viernes	5	f
20110129	2011-01-29	2011	1	1	Enero	29	Sábado	6	t
20110130	2011-01-30	2011	1	1	Enero	30	Domingo	7	t
20110131	2011-01-31	2011	1	1	Enero	31	Lunes	1	f
20110201	2011-02-01	2011	1	2	Febrero	1	Martes	2	f
20110202	2011-02-02	2011	1	2	Febrero	2	Miércoles	3	f
20110203	2011-02-03	2011	1	2	Febrero	3	Jueves	4	f
20110204	2011-02-04	2011	1	2	Febrero	4	Viernes	5	f
20110205	2011-02-05	2011	1	2	Febrero	5	Sábado	6	t
20110206	2011-02-06	2011	1	2	Febrero	6	Domingo	7	t
20110207	2011-02-07	2011	1	2	Febrero	7	Lunes	1	f
20110208	2011-02-08	2011	1	2	Febrero	8	Martes	2	f
20110209	2011-02-09	2011	1	2	Febrero	9	Miércoles	3	f
20110210	2011-02-10	2011	1	2	Febrero	10	Jueves	4	f
20110211	2011-02-11	2011	1	2	Febrero	11	Viernes	5	f
20110212	2011-02-12	2011	1	2	Febrero	12	Sábado	6	t
20110213	2011-02-13	2011	1	2	Febrero	13	Domingo	7	t
20110214	2011-02-14	2011	1	2	Febrero	14	Lunes	1	f
20110215	2011-02-15	2011	1	2	Febrero	15	Martes	2	f
20110216	2011-02-16	2011	1	2	Febrero	16	Miércoles	3	f
20110217	2011-02-17	2011	1	2	Febrero	17	Jueves	4	f
20110218	2011-02-18	2011	1	2	Febrero	18	Viernes	5	f
20110219	2011-02-19	2011	1	2	Febrero	19	Sábado	6	t
20110220	2011-02-20	2011	1	2	Febrero	20	Domingo	7	t
20110221	2011-02-21	2011	1	2	Febrero	21	Lunes	1	f
20110222	2011-02-22	2011	1	2	Febrero	22	Martes	2	f
20110223	2011-02-23	2011	1	2	Febrero	23	Miércoles	3	f
20110224	2011-02-24	2011	1	2	Febrero	24	Jueves	4	f
20110225	2011-02-25	2011	1	2	Febrero	25	Viernes	5	f
20110226	2011-02-26	2011	1	2	Febrero	26	Sábado	6	t
20110227	2011-02-27	2011	1	2	Febrero	27	Domingo	7	t
20110228	2011-02-28	2011	1	2	Febrero	28	Lunes	1	f
20110301	2011-03-01	2011	1	3	Marzo	1	Martes	2	f
20110302	2011-03-02	2011	1	3	Marzo	2	Miércoles	3	f
20110303	2011-03-03	2011	1	3	Marzo	3	Jueves	4	f
20110304	2011-03-04	2011	1	3	Marzo	4	Viernes	5	f
20110305	2011-03-05	2011	1	3	Marzo	5	Sábado	6	t
20110306	2011-03-06	2011	1	3	Marzo	6	Domingo	7	t
20110307	2011-03-07	2011	1	3	Marzo	7	Lunes	1	f
20110308	2011-03-08	2011	1	3	Marzo	8	Martes	2	f
20110309	2011-03-09	2011	1	3	Marzo	9	Miércoles	3	f
20110310	2011-03-10	2011	1	3	Marzo	10	Jueves	4	f
20110311	2011-03-11	2011	1	3	Marzo	11	Viernes	5	f
20110312	2011-03-12	2011	1	3	Marzo	12	Sábado	6	t
20110313	2011-03-13	2011	1	3	Marzo	13	Domingo	7	t
20110314	2011-03-14	2011	1	3	Marzo	14	Lunes	1	f
20110315	2011-03-15	2011	1	3	Marzo	15	Martes	2	f
20110316	2011-03-16	2011	1	3	Marzo	16	Miércoles	3	f
20110317	2011-03-17	2011	1	3	Marzo	17	Jueves	4	f
20110318	2011-03-18	2011	1	3	Marzo	18	Viernes	5	f
20110319	2011-03-19	2011	1	3	Marzo	19	Sábado	6	t
20110320	2011-03-20	2011	1	3	Marzo	20	Domingo	7	t
20110321	2011-03-21	2011	1	3	Marzo	21	Lunes	1	f
20110322	2011-03-22	2011	1	3	Marzo	22	Martes	2	f
20110323	2011-03-23	2011	1	3	Marzo	23	Miércoles	3	f
20110324	2011-03-24	2011	1	3	Marzo	24	Jueves	4	f
20110325	2011-03-25	2011	1	3	Marzo	25	Viernes	5	f
20110326	2011-03-26	2011	1	3	Marzo	26	Sábado	6	t
20110327	2011-03-27	2011	1	3	Marzo	27	Domingo	7	t
20110328	2011-03-28	2011	1	3	Marzo	28	Lunes	1	f
20110329	2011-03-29	2011	1	3	Marzo	29	Martes	2	f
20110330	2011-03-30	2011	1	3	Marzo	30	Miércoles	3	f
20110331	2011-03-31	2011	1	3	Marzo	31	Jueves	4	f
20110401	2011-04-01	2011	2	4	Abril	1	Viernes	5	f
20110402	2011-04-02	2011	2	4	Abril	2	Sábado	6	t
20110403	2011-04-03	2011	2	4	Abril	3	Domingo	7	t
20110404	2011-04-04	2011	2	4	Abril	4	Lunes	1	f
20110405	2011-04-05	2011	2	4	Abril	5	Martes	2	f
20110406	2011-04-06	2011	2	4	Abril	6	Miércoles	3	f
20110407	2011-04-07	2011	2	4	Abril	7	Jueves	4	f
20110408	2011-04-08	2011	2	4	Abril	8	Viernes	5	f
20110409	2011-04-09	2011	2	4	Abril	9	Sábado	6	t
20110410	2011-04-10	2011	2	4	Abril	10	Domingo	7	t
20110411	2011-04-11	2011	2	4	Abril	11	Lunes	1	f
20110412	2011-04-12	2011	2	4	Abril	12	Martes	2	f
20110413	2011-04-13	2011	2	4	Abril	13	Miércoles	3	f
20110414	2011-04-14	2011	2	4	Abril	14	Jueves	4	f
20110415	2011-04-15	2011	2	4	Abril	15	Viernes	5	f
20110416	2011-04-16	2011	2	4	Abril	16	Sábado	6	t
20110417	2011-04-17	2011	2	4	Abril	17	Domingo	7	t
20110418	2011-04-18	2011	2	4	Abril	18	Lunes	1	f
20110419	2011-04-19	2011	2	4	Abril	19	Martes	2	f
20110420	2011-04-20	2011	2	4	Abril	20	Miércoles	3	f
20110421	2011-04-21	2011	2	4	Abril	21	Jueves	4	f
20110422	2011-04-22	2011	2	4	Abril	22	Viernes	5	f
20110423	2011-04-23	2011	2	4	Abril	23	Sábado	6	t
20110424	2011-04-24	2011	2	4	Abril	24	Domingo	7	t
20110425	2011-04-25	2011	2	4	Abril	25	Lunes	1	f
20110426	2011-04-26	2011	2	4	Abril	26	Martes	2	f
20110427	2011-04-27	2011	2	4	Abril	27	Miércoles	3	f
20110428	2011-04-28	2011	2	4	Abril	28	Jueves	4	f
20110429	2011-04-29	2011	2	4	Abril	29	Viernes	5	f
20110430	2011-04-30	2011	2	4	Abril	30	Sábado	6	t
20110501	2011-05-01	2011	2	5	Mayo	1	Domingo	7	t
20110502	2011-05-02	2011	2	5	Mayo	2	Lunes	1	f
20110503	2011-05-03	2011	2	5	Mayo	3	Martes	2	f
20110504	2011-05-04	2011	2	5	Mayo	4	Miércoles	3	f
20110505	2011-05-05	2011	2	5	Mayo	5	Jueves	4	f
20110506	2011-05-06	2011	2	5	Mayo	6	Viernes	5	f
20110507	2011-05-07	2011	2	5	Mayo	7	Sábado	6	t
20110508	2011-05-08	2011	2	5	Mayo	8	Domingo	7	t
20110509	2011-05-09	2011	2	5	Mayo	9	Lunes	1	f
20110510	2011-05-10	2011	2	5	Mayo	10	Martes	2	f
20110511	2011-05-11	2011	2	5	Mayo	11	Miércoles	3	f
20110512	2011-05-12	2011	2	5	Mayo	12	Jueves	4	f
20110513	2011-05-13	2011	2	5	Mayo	13	Viernes	5	f
20110514	2011-05-14	2011	2	5	Mayo	14	Sábado	6	t
20110515	2011-05-15	2011	2	5	Mayo	15	Domingo	7	t
20110516	2011-05-16	2011	2	5	Mayo	16	Lunes	1	f
20110517	2011-05-17	2011	2	5	Mayo	17	Martes	2	f
20110518	2011-05-18	2011	2	5	Mayo	18	Miércoles	3	f
20110519	2011-05-19	2011	2	5	Mayo	19	Jueves	4	f
20110520	2011-05-20	2011	2	5	Mayo	20	Viernes	5	f
20110521	2011-05-21	2011	2	5	Mayo	21	Sábado	6	t
20110522	2011-05-22	2011	2	5	Mayo	22	Domingo	7	t
20110523	2011-05-23	2011	2	5	Mayo	23	Lunes	1	f
20110524	2011-05-24	2011	2	5	Mayo	24	Martes	2	f
20110525	2011-05-25	2011	2	5	Mayo	25	Miércoles	3	f
20110526	2011-05-26	2011	2	5	Mayo	26	Jueves	4	f
20110527	2011-05-27	2011	2	5	Mayo	27	Viernes	5	f
20110528	2011-05-28	2011	2	5	Mayo	28	Sábado	6	t
20110529	2011-05-29	2011	2	5	Mayo	29	Domingo	7	t
20110530	2011-05-30	2011	2	5	Mayo	30	Lunes	1	f
20110531	2011-05-31	2011	2	5	Mayo	31	Martes	2	f
20110601	2011-06-01	2011	2	6	Junio	1	Miércoles	3	f
20110602	2011-06-02	2011	2	6	Junio	2	Jueves	4	f
20110603	2011-06-03	2011	2	6	Junio	3	Viernes	5	f
20110604	2011-06-04	2011	2	6	Junio	4	Sábado	6	t
20110605	2011-06-05	2011	2	6	Junio	5	Domingo	7	t
20110606	2011-06-06	2011	2	6	Junio	6	Lunes	1	f
20110607	2011-06-07	2011	2	6	Junio	7	Martes	2	f
20110608	2011-06-08	2011	2	6	Junio	8	Miércoles	3	f
20110609	2011-06-09	2011	2	6	Junio	9	Jueves	4	f
20110610	2011-06-10	2011	2	6	Junio	10	Viernes	5	f
20110611	2011-06-11	2011	2	6	Junio	11	Sábado	6	t
20110612	2011-06-12	2011	2	6	Junio	12	Domingo	7	t
20110613	2011-06-13	2011	2	6	Junio	13	Lunes	1	f
20110614	2011-06-14	2011	2	6	Junio	14	Martes	2	f
20110615	2011-06-15	2011	2	6	Junio	15	Miércoles	3	f
20110616	2011-06-16	2011	2	6	Junio	16	Jueves	4	f
20110617	2011-06-17	2011	2	6	Junio	17	Viernes	5	f
20110618	2011-06-18	2011	2	6	Junio	18	Sábado	6	t
20110619	2011-06-19	2011	2	6	Junio	19	Domingo	7	t
20110620	2011-06-20	2011	2	6	Junio	20	Lunes	1	f
20110621	2011-06-21	2011	2	6	Junio	21	Martes	2	f
20110622	2011-06-22	2011	2	6	Junio	22	Miércoles	3	f
20110623	2011-06-23	2011	2	6	Junio	23	Jueves	4	f
20110624	2011-06-24	2011	2	6	Junio	24	Viernes	5	f
20110625	2011-06-25	2011	2	6	Junio	25	Sábado	6	t
20110626	2011-06-26	2011	2	6	Junio	26	Domingo	7	t
20110627	2011-06-27	2011	2	6	Junio	27	Lunes	1	f
20110628	2011-06-28	2011	2	6	Junio	28	Martes	2	f
20110629	2011-06-29	2011	2	6	Junio	29	Miércoles	3	f
20110630	2011-06-30	2011	2	6	Junio	30	Jueves	4	f
20110701	2011-07-01	2011	3	7	Julio	1	Viernes	5	f
20110702	2011-07-02	2011	3	7	Julio	2	Sábado	6	t
20110703	2011-07-03	2011	3	7	Julio	3	Domingo	7	t
20110704	2011-07-04	2011	3	7	Julio	4	Lunes	1	f
20110705	2011-07-05	2011	3	7	Julio	5	Martes	2	f
20110706	2011-07-06	2011	3	7	Julio	6	Miércoles	3	f
20110707	2011-07-07	2011	3	7	Julio	7	Jueves	4	f
20110708	2011-07-08	2011	3	7	Julio	8	Viernes	5	f
20110709	2011-07-09	2011	3	7	Julio	9	Sábado	6	t
20110710	2011-07-10	2011	3	7	Julio	10	Domingo	7	t
20110711	2011-07-11	2011	3	7	Julio	11	Lunes	1	f
20110712	2011-07-12	2011	3	7	Julio	12	Martes	2	f
20110713	2011-07-13	2011	3	7	Julio	13	Miércoles	3	f
20110714	2011-07-14	2011	3	7	Julio	14	Jueves	4	f
20110715	2011-07-15	2011	3	7	Julio	15	Viernes	5	f
20110716	2011-07-16	2011	3	7	Julio	16	Sábado	6	t
20110717	2011-07-17	2011	3	7	Julio	17	Domingo	7	t
20110718	2011-07-18	2011	3	7	Julio	18	Lunes	1	f
20110719	2011-07-19	2011	3	7	Julio	19	Martes	2	f
20110720	2011-07-20	2011	3	7	Julio	20	Miércoles	3	f
20110721	2011-07-21	2011	3	7	Julio	21	Jueves	4	f
20110722	2011-07-22	2011	3	7	Julio	22	Viernes	5	f
20110723	2011-07-23	2011	3	7	Julio	23	Sábado	6	t
20110724	2011-07-24	2011	3	7	Julio	24	Domingo	7	t
20110725	2011-07-25	2011	3	7	Julio	25	Lunes	1	f
20110726	2011-07-26	2011	3	7	Julio	26	Martes	2	f
20110727	2011-07-27	2011	3	7	Julio	27	Miércoles	3	f
20110728	2011-07-28	2011	3	7	Julio	28	Jueves	4	f
20110729	2011-07-29	2011	3	7	Julio	29	Viernes	5	f
20110730	2011-07-30	2011	3	7	Julio	30	Sábado	6	t
20110731	2011-07-31	2011	3	7	Julio	31	Domingo	7	t
20110801	2011-08-01	2011	3	8	Agosto	1	Lunes	1	f
20110802	2011-08-02	2011	3	8	Agosto	2	Martes	2	f
20110803	2011-08-03	2011	3	8	Agosto	3	Miércoles	3	f
20110804	2011-08-04	2011	3	8	Agosto	4	Jueves	4	f
20110805	2011-08-05	2011	3	8	Agosto	5	Viernes	5	f
20110806	2011-08-06	2011	3	8	Agosto	6	Sábado	6	t
20110807	2011-08-07	2011	3	8	Agosto	7	Domingo	7	t
20110808	2011-08-08	2011	3	8	Agosto	8	Lunes	1	f
20110809	2011-08-09	2011	3	8	Agosto	9	Martes	2	f
20110810	2011-08-10	2011	3	8	Agosto	10	Miércoles	3	f
20110811	2011-08-11	2011	3	8	Agosto	11	Jueves	4	f
20110812	2011-08-12	2011	3	8	Agosto	12	Viernes	5	f
20110813	2011-08-13	2011	3	8	Agosto	13	Sábado	6	t
20110814	2011-08-14	2011	3	8	Agosto	14	Domingo	7	t
20110815	2011-08-15	2011	3	8	Agosto	15	Lunes	1	f
20110816	2011-08-16	2011	3	8	Agosto	16	Martes	2	f
20110817	2011-08-17	2011	3	8	Agosto	17	Miércoles	3	f
20110818	2011-08-18	2011	3	8	Agosto	18	Jueves	4	f
20110819	2011-08-19	2011	3	8	Agosto	19	Viernes	5	f
20110820	2011-08-20	2011	3	8	Agosto	20	Sábado	6	t
20110821	2011-08-21	2011	3	8	Agosto	21	Domingo	7	t
20110822	2011-08-22	2011	3	8	Agosto	22	Lunes	1	f
20110823	2011-08-23	2011	3	8	Agosto	23	Martes	2	f
20110824	2011-08-24	2011	3	8	Agosto	24	Miércoles	3	f
20110825	2011-08-25	2011	3	8	Agosto	25	Jueves	4	f
20110826	2011-08-26	2011	3	8	Agosto	26	Viernes	5	f
20110827	2011-08-27	2011	3	8	Agosto	27	Sábado	6	t
20110828	2011-08-28	2011	3	8	Agosto	28	Domingo	7	t
20110829	2011-08-29	2011	3	8	Agosto	29	Lunes	1	f
20110830	2011-08-30	2011	3	8	Agosto	30	Martes	2	f
20110831	2011-08-31	2011	3	8	Agosto	31	Miércoles	3	f
20110901	2011-09-01	2011	3	9	Septiembre	1	Jueves	4	f
20110902	2011-09-02	2011	3	9	Septiembre	2	Viernes	5	f
20110903	2011-09-03	2011	3	9	Septiembre	3	Sábado	6	t
20110904	2011-09-04	2011	3	9	Septiembre	4	Domingo	7	t
20110905	2011-09-05	2011	3	9	Septiembre	5	Lunes	1	f
20110906	2011-09-06	2011	3	9	Septiembre	6	Martes	2	f
20110907	2011-09-07	2011	3	9	Septiembre	7	Miércoles	3	f
20110908	2011-09-08	2011	3	9	Septiembre	8	Jueves	4	f
20110909	2011-09-09	2011	3	9	Septiembre	9	Viernes	5	f
20110910	2011-09-10	2011	3	9	Septiembre	10	Sábado	6	t
20110911	2011-09-11	2011	3	9	Septiembre	11	Domingo	7	t
20110912	2011-09-12	2011	3	9	Septiembre	12	Lunes	1	f
20110913	2011-09-13	2011	3	9	Septiembre	13	Martes	2	f
20110914	2011-09-14	2011	3	9	Septiembre	14	Miércoles	3	f
20110915	2011-09-15	2011	3	9	Septiembre	15	Jueves	4	f
20110916	2011-09-16	2011	3	9	Septiembre	16	Viernes	5	f
20110917	2011-09-17	2011	3	9	Septiembre	17	Sábado	6	t
20110918	2011-09-18	2011	3	9	Septiembre	18	Domingo	7	t
20110919	2011-09-19	2011	3	9	Septiembre	19	Lunes	1	f
20110920	2011-09-20	2011	3	9	Septiembre	20	Martes	2	f
20110921	2011-09-21	2011	3	9	Septiembre	21	Miércoles	3	f
20110922	2011-09-22	2011	3	9	Septiembre	22	Jueves	4	f
20110923	2011-09-23	2011	3	9	Septiembre	23	Viernes	5	f
20110924	2011-09-24	2011	3	9	Septiembre	24	Sábado	6	t
20110925	2011-09-25	2011	3	9	Septiembre	25	Domingo	7	t
20110926	2011-09-26	2011	3	9	Septiembre	26	Lunes	1	f
20110927	2011-09-27	2011	3	9	Septiembre	27	Martes	2	f
20110928	2011-09-28	2011	3	9	Septiembre	28	Miércoles	3	f
20110929	2011-09-29	2011	3	9	Septiembre	29	Jueves	4	f
20110930	2011-09-30	2011	3	9	Septiembre	30	Viernes	5	f
20111001	2011-10-01	2011	4	10	Octubre	1	Sábado	6	t
20111002	2011-10-02	2011	4	10	Octubre	2	Domingo	7	t
20111003	2011-10-03	2011	4	10	Octubre	3	Lunes	1	f
20111004	2011-10-04	2011	4	10	Octubre	4	Martes	2	f
20111005	2011-10-05	2011	4	10	Octubre	5	Miércoles	3	f
20111006	2011-10-06	2011	4	10	Octubre	6	Jueves	4	f
20111007	2011-10-07	2011	4	10	Octubre	7	Viernes	5	f
20111008	2011-10-08	2011	4	10	Octubre	8	Sábado	6	t
20111009	2011-10-09	2011	4	10	Octubre	9	Domingo	7	t
20111010	2011-10-10	2011	4	10	Octubre	10	Lunes	1	f
20111011	2011-10-11	2011	4	10	Octubre	11	Martes	2	f
20111012	2011-10-12	2011	4	10	Octubre	12	Miércoles	3	f
20111013	2011-10-13	2011	4	10	Octubre	13	Jueves	4	f
20111014	2011-10-14	2011	4	10	Octubre	14	Viernes	5	f
20111015	2011-10-15	2011	4	10	Octubre	15	Sábado	6	t
20111016	2011-10-16	2011	4	10	Octubre	16	Domingo	7	t
20111017	2011-10-17	2011	4	10	Octubre	17	Lunes	1	f
20111018	2011-10-18	2011	4	10	Octubre	18	Martes	2	f
20111019	2011-10-19	2011	4	10	Octubre	19	Miércoles	3	f
20111020	2011-10-20	2011	4	10	Octubre	20	Jueves	4	f
20111021	2011-10-21	2011	4	10	Octubre	21	Viernes	5	f
20111022	2011-10-22	2011	4	10	Octubre	22	Sábado	6	t
20111023	2011-10-23	2011	4	10	Octubre	23	Domingo	7	t
20111024	2011-10-24	2011	4	10	Octubre	24	Lunes	1	f
20111025	2011-10-25	2011	4	10	Octubre	25	Martes	2	f
20111026	2011-10-26	2011	4	10	Octubre	26	Miércoles	3	f
20111027	2011-10-27	2011	4	10	Octubre	27	Jueves	4	f
20111028	2011-10-28	2011	4	10	Octubre	28	Viernes	5	f
20111029	2011-10-29	2011	4	10	Octubre	29	Sábado	6	t
20111030	2011-10-30	2011	4	10	Octubre	30	Domingo	7	t
20111031	2011-10-31	2011	4	10	Octubre	31	Lunes	1	f
20111101	2011-11-01	2011	4	11	Noviembre	1	Martes	2	f
20111102	2011-11-02	2011	4	11	Noviembre	2	Miércoles	3	f
20111103	2011-11-03	2011	4	11	Noviembre	3	Jueves	4	f
20111104	2011-11-04	2011	4	11	Noviembre	4	Viernes	5	f
20111105	2011-11-05	2011	4	11	Noviembre	5	Sábado	6	t
20111106	2011-11-06	2011	4	11	Noviembre	6	Domingo	7	t
20111107	2011-11-07	2011	4	11	Noviembre	7	Lunes	1	f
20111108	2011-11-08	2011	4	11	Noviembre	8	Martes	2	f
20111109	2011-11-09	2011	4	11	Noviembre	9	Miércoles	3	f
20111110	2011-11-10	2011	4	11	Noviembre	10	Jueves	4	f
20111111	2011-11-11	2011	4	11	Noviembre	11	Viernes	5	f
20111112	2011-11-12	2011	4	11	Noviembre	12	Sábado	6	t
20111113	2011-11-13	2011	4	11	Noviembre	13	Domingo	7	t
20111114	2011-11-14	2011	4	11	Noviembre	14	Lunes	1	f
20111115	2011-11-15	2011	4	11	Noviembre	15	Martes	2	f
20111116	2011-11-16	2011	4	11	Noviembre	16	Miércoles	3	f
20111117	2011-11-17	2011	4	11	Noviembre	17	Jueves	4	f
20111118	2011-11-18	2011	4	11	Noviembre	18	Viernes	5	f
20111119	2011-11-19	2011	4	11	Noviembre	19	Sábado	6	t
20111120	2011-11-20	2011	4	11	Noviembre	20	Domingo	7	t
20111121	2011-11-21	2011	4	11	Noviembre	21	Lunes	1	f
20111122	2011-11-22	2011	4	11	Noviembre	22	Martes	2	f
20111123	2011-11-23	2011	4	11	Noviembre	23	Miércoles	3	f
20111124	2011-11-24	2011	4	11	Noviembre	24	Jueves	4	f
20111125	2011-11-25	2011	4	11	Noviembre	25	Viernes	5	f
20111126	2011-11-26	2011	4	11	Noviembre	26	Sábado	6	t
20111127	2011-11-27	2011	4	11	Noviembre	27	Domingo	7	t
20111128	2011-11-28	2011	4	11	Noviembre	28	Lunes	1	f
20111129	2011-11-29	2011	4	11	Noviembre	29	Martes	2	f
20111130	2011-11-30	2011	4	11	Noviembre	30	Miércoles	3	f
20111201	2011-12-01	2011	4	12	Diciembre	1	Jueves	4	f
20111202	2011-12-02	2011	4	12	Diciembre	2	Viernes	5	f
20111203	2011-12-03	2011	4	12	Diciembre	3	Sábado	6	t
20111204	2011-12-04	2011	4	12	Diciembre	4	Domingo	7	t
20111205	2011-12-05	2011	4	12	Diciembre	5	Lunes	1	f
20111206	2011-12-06	2011	4	12	Diciembre	6	Martes	2	f
20111207	2011-12-07	2011	4	12	Diciembre	7	Miércoles	3	f
20111208	2011-12-08	2011	4	12	Diciembre	8	Jueves	4	f
20111209	2011-12-09	2011	4	12	Diciembre	9	Viernes	5	f
20111210	2011-12-10	2011	4	12	Diciembre	10	Sábado	6	t
20111211	2011-12-11	2011	4	12	Diciembre	11	Domingo	7	t
20111212	2011-12-12	2011	4	12	Diciembre	12	Lunes	1	f
20111213	2011-12-13	2011	4	12	Diciembre	13	Martes	2	f
20111214	2011-12-14	2011	4	12	Diciembre	14	Miércoles	3	f
20111215	2011-12-15	2011	4	12	Diciembre	15	Jueves	4	f
20111216	2011-12-16	2011	4	12	Diciembre	16	Viernes	5	f
20111217	2011-12-17	2011	4	12	Diciembre	17	Sábado	6	t
20111218	2011-12-18	2011	4	12	Diciembre	18	Domingo	7	t
20111219	2011-12-19	2011	4	12	Diciembre	19	Lunes	1	f
20111220	2011-12-20	2011	4	12	Diciembre	20	Martes	2	f
20111221	2011-12-21	2011	4	12	Diciembre	21	Miércoles	3	f
20111222	2011-12-22	2011	4	12	Diciembre	22	Jueves	4	f
20111223	2011-12-23	2011	4	12	Diciembre	23	Viernes	5	f
20111224	2011-12-24	2011	4	12	Diciembre	24	Sábado	6	t
20111225	2011-12-25	2011	4	12	Diciembre	25	Domingo	7	t
20111226	2011-12-26	2011	4	12	Diciembre	26	Lunes	1	f
20111227	2011-12-27	2011	4	12	Diciembre	27	Martes	2	f
20111228	2011-12-28	2011	4	12	Diciembre	28	Miércoles	3	f
20111229	2011-12-29	2011	4	12	Diciembre	29	Jueves	4	f
20111230	2011-12-30	2011	4	12	Diciembre	30	Viernes	5	f
20111231	2011-12-31	2011	4	12	Diciembre	31	Sábado	6	t
20120101	2012-01-01	2012	1	1	Enero	1	Domingo	7	t
20120102	2012-01-02	2012	1	1	Enero	2	Lunes	1	f
20120103	2012-01-03	2012	1	1	Enero	3	Martes	2	f
20120104	2012-01-04	2012	1	1	Enero	4	Miércoles	3	f
20120105	2012-01-05	2012	1	1	Enero	5	Jueves	4	f
20120106	2012-01-06	2012	1	1	Enero	6	Viernes	5	f
20120107	2012-01-07	2012	1	1	Enero	7	Sábado	6	t
20120108	2012-01-08	2012	1	1	Enero	8	Domingo	7	t
20120109	2012-01-09	2012	1	1	Enero	9	Lunes	1	f
20120110	2012-01-10	2012	1	1	Enero	10	Martes	2	f
20120111	2012-01-11	2012	1	1	Enero	11	Miércoles	3	f
20120112	2012-01-12	2012	1	1	Enero	12	Jueves	4	f
20120113	2012-01-13	2012	1	1	Enero	13	Viernes	5	f
20120114	2012-01-14	2012	1	1	Enero	14	Sábado	6	t
20120115	2012-01-15	2012	1	1	Enero	15	Domingo	7	t
20120116	2012-01-16	2012	1	1	Enero	16	Lunes	1	f
20120117	2012-01-17	2012	1	1	Enero	17	Martes	2	f
20120118	2012-01-18	2012	1	1	Enero	18	Miércoles	3	f
20120119	2012-01-19	2012	1	1	Enero	19	Jueves	4	f
20120120	2012-01-20	2012	1	1	Enero	20	Viernes	5	f
20120121	2012-01-21	2012	1	1	Enero	21	Sábado	6	t
20120122	2012-01-22	2012	1	1	Enero	22	Domingo	7	t
20120123	2012-01-23	2012	1	1	Enero	23	Lunes	1	f
20120124	2012-01-24	2012	1	1	Enero	24	Martes	2	f
20120125	2012-01-25	2012	1	1	Enero	25	Miércoles	3	f
20120126	2012-01-26	2012	1	1	Enero	26	Jueves	4	f
20120127	2012-01-27	2012	1	1	Enero	27	Viernes	5	f
20120128	2012-01-28	2012	1	1	Enero	28	Sábado	6	t
20120129	2012-01-29	2012	1	1	Enero	29	Domingo	7	t
20120130	2012-01-30	2012	1	1	Enero	30	Lunes	1	f
20120131	2012-01-31	2012	1	1	Enero	31	Martes	2	f
20120201	2012-02-01	2012	1	2	Febrero	1	Miércoles	3	f
20120202	2012-02-02	2012	1	2	Febrero	2	Jueves	4	f
20120203	2012-02-03	2012	1	2	Febrero	3	Viernes	5	f
20120204	2012-02-04	2012	1	2	Febrero	4	Sábado	6	t
20120205	2012-02-05	2012	1	2	Febrero	5	Domingo	7	t
20120206	2012-02-06	2012	1	2	Febrero	6	Lunes	1	f
20120207	2012-02-07	2012	1	2	Febrero	7	Martes	2	f
20120208	2012-02-08	2012	1	2	Febrero	8	Miércoles	3	f
20120209	2012-02-09	2012	1	2	Febrero	9	Jueves	4	f
20120210	2012-02-10	2012	1	2	Febrero	10	Viernes	5	f
20120211	2012-02-11	2012	1	2	Febrero	11	Sábado	6	t
20120212	2012-02-12	2012	1	2	Febrero	12	Domingo	7	t
20120213	2012-02-13	2012	1	2	Febrero	13	Lunes	1	f
20120214	2012-02-14	2012	1	2	Febrero	14	Martes	2	f
20120215	2012-02-15	2012	1	2	Febrero	15	Miércoles	3	f
20120216	2012-02-16	2012	1	2	Febrero	16	Jueves	4	f
20120217	2012-02-17	2012	1	2	Febrero	17	Viernes	5	f
20120218	2012-02-18	2012	1	2	Febrero	18	Sábado	6	t
20120219	2012-02-19	2012	1	2	Febrero	19	Domingo	7	t
20120220	2012-02-20	2012	1	2	Febrero	20	Lunes	1	f
20120221	2012-02-21	2012	1	2	Febrero	21	Martes	2	f
20120222	2012-02-22	2012	1	2	Febrero	22	Miércoles	3	f
20120223	2012-02-23	2012	1	2	Febrero	23	Jueves	4	f
20120224	2012-02-24	2012	1	2	Febrero	24	Viernes	5	f
20120225	2012-02-25	2012	1	2	Febrero	25	Sábado	6	t
20120226	2012-02-26	2012	1	2	Febrero	26	Domingo	7	t
20120227	2012-02-27	2012	1	2	Febrero	27	Lunes	1	f
20120228	2012-02-28	2012	1	2	Febrero	28	Martes	2	f
20120229	2012-02-29	2012	1	2	Febrero	29	Miércoles	3	f
20120301	2012-03-01	2012	1	3	Marzo	1	Jueves	4	f
20120302	2012-03-02	2012	1	3	Marzo	2	Viernes	5	f
20120303	2012-03-03	2012	1	3	Marzo	3	Sábado	6	t
20120304	2012-03-04	2012	1	3	Marzo	4	Domingo	7	t
20120305	2012-03-05	2012	1	3	Marzo	5	Lunes	1	f
20120306	2012-03-06	2012	1	3	Marzo	6	Martes	2	f
20120307	2012-03-07	2012	1	3	Marzo	7	Miércoles	3	f
20120308	2012-03-08	2012	1	3	Marzo	8	Jueves	4	f
20120309	2012-03-09	2012	1	3	Marzo	9	Viernes	5	f
20120310	2012-03-10	2012	1	3	Marzo	10	Sábado	6	t
20120311	2012-03-11	2012	1	3	Marzo	11	Domingo	7	t
20120312	2012-03-12	2012	1	3	Marzo	12	Lunes	1	f
20120313	2012-03-13	2012	1	3	Marzo	13	Martes	2	f
20120314	2012-03-14	2012	1	3	Marzo	14	Miércoles	3	f
20120315	2012-03-15	2012	1	3	Marzo	15	Jueves	4	f
20120316	2012-03-16	2012	1	3	Marzo	16	Viernes	5	f
20120317	2012-03-17	2012	1	3	Marzo	17	Sábado	6	t
20120318	2012-03-18	2012	1	3	Marzo	18	Domingo	7	t
20120319	2012-03-19	2012	1	3	Marzo	19	Lunes	1	f
20120320	2012-03-20	2012	1	3	Marzo	20	Martes	2	f
20120321	2012-03-21	2012	1	3	Marzo	21	Miércoles	3	f
20120322	2012-03-22	2012	1	3	Marzo	22	Jueves	4	f
20120323	2012-03-23	2012	1	3	Marzo	23	Viernes	5	f
20120324	2012-03-24	2012	1	3	Marzo	24	Sábado	6	t
20120325	2012-03-25	2012	1	3	Marzo	25	Domingo	7	t
20120326	2012-03-26	2012	1	3	Marzo	26	Lunes	1	f
20120327	2012-03-27	2012	1	3	Marzo	27	Martes	2	f
20120328	2012-03-28	2012	1	3	Marzo	28	Miércoles	3	f
20120329	2012-03-29	2012	1	3	Marzo	29	Jueves	4	f
20120330	2012-03-30	2012	1	3	Marzo	30	Viernes	5	f
20120331	2012-03-31	2012	1	3	Marzo	31	Sábado	6	t
20120401	2012-04-01	2012	2	4	Abril	1	Domingo	7	t
20120402	2012-04-02	2012	2	4	Abril	2	Lunes	1	f
20120403	2012-04-03	2012	2	4	Abril	3	Martes	2	f
20120404	2012-04-04	2012	2	4	Abril	4	Miércoles	3	f
20120405	2012-04-05	2012	2	4	Abril	5	Jueves	4	f
20120406	2012-04-06	2012	2	4	Abril	6	Viernes	5	f
20120407	2012-04-07	2012	2	4	Abril	7	Sábado	6	t
20120408	2012-04-08	2012	2	4	Abril	8	Domingo	7	t
20120409	2012-04-09	2012	2	4	Abril	9	Lunes	1	f
20120410	2012-04-10	2012	2	4	Abril	10	Martes	2	f
20120411	2012-04-11	2012	2	4	Abril	11	Miércoles	3	f
20120412	2012-04-12	2012	2	4	Abril	12	Jueves	4	f
20120413	2012-04-13	2012	2	4	Abril	13	Viernes	5	f
20120414	2012-04-14	2012	2	4	Abril	14	Sábado	6	t
20120415	2012-04-15	2012	2	4	Abril	15	Domingo	7	t
20120416	2012-04-16	2012	2	4	Abril	16	Lunes	1	f
20120417	2012-04-17	2012	2	4	Abril	17	Martes	2	f
20120418	2012-04-18	2012	2	4	Abril	18	Miércoles	3	f
20120419	2012-04-19	2012	2	4	Abril	19	Jueves	4	f
20120420	2012-04-20	2012	2	4	Abril	20	Viernes	5	f
20120421	2012-04-21	2012	2	4	Abril	21	Sábado	6	t
20120422	2012-04-22	2012	2	4	Abril	22	Domingo	7	t
20120423	2012-04-23	2012	2	4	Abril	23	Lunes	1	f
20120424	2012-04-24	2012	2	4	Abril	24	Martes	2	f
20120425	2012-04-25	2012	2	4	Abril	25	Miércoles	3	f
20120426	2012-04-26	2012	2	4	Abril	26	Jueves	4	f
20120427	2012-04-27	2012	2	4	Abril	27	Viernes	5	f
20120428	2012-04-28	2012	2	4	Abril	28	Sábado	6	t
20120429	2012-04-29	2012	2	4	Abril	29	Domingo	7	t
20120430	2012-04-30	2012	2	4	Abril	30	Lunes	1	f
20120501	2012-05-01	2012	2	5	Mayo	1	Martes	2	f
20120502	2012-05-02	2012	2	5	Mayo	2	Miércoles	3	f
20120503	2012-05-03	2012	2	5	Mayo	3	Jueves	4	f
20120504	2012-05-04	2012	2	5	Mayo	4	Viernes	5	f
20120505	2012-05-05	2012	2	5	Mayo	5	Sábado	6	t
20120506	2012-05-06	2012	2	5	Mayo	6	Domingo	7	t
20120507	2012-05-07	2012	2	5	Mayo	7	Lunes	1	f
20120508	2012-05-08	2012	2	5	Mayo	8	Martes	2	f
20120509	2012-05-09	2012	2	5	Mayo	9	Miércoles	3	f
20120510	2012-05-10	2012	2	5	Mayo	10	Jueves	4	f
20120511	2012-05-11	2012	2	5	Mayo	11	Viernes	5	f
20120512	2012-05-12	2012	2	5	Mayo	12	Sábado	6	t
20120513	2012-05-13	2012	2	5	Mayo	13	Domingo	7	t
20120514	2012-05-14	2012	2	5	Mayo	14	Lunes	1	f
20120515	2012-05-15	2012	2	5	Mayo	15	Martes	2	f
20120516	2012-05-16	2012	2	5	Mayo	16	Miércoles	3	f
20120517	2012-05-17	2012	2	5	Mayo	17	Jueves	4	f
20120518	2012-05-18	2012	2	5	Mayo	18	Viernes	5	f
20120519	2012-05-19	2012	2	5	Mayo	19	Sábado	6	t
20120520	2012-05-20	2012	2	5	Mayo	20	Domingo	7	t
20120521	2012-05-21	2012	2	5	Mayo	21	Lunes	1	f
20120522	2012-05-22	2012	2	5	Mayo	22	Martes	2	f
20120523	2012-05-23	2012	2	5	Mayo	23	Miércoles	3	f
20120524	2012-05-24	2012	2	5	Mayo	24	Jueves	4	f
20120525	2012-05-25	2012	2	5	Mayo	25	Viernes	5	f
20120526	2012-05-26	2012	2	5	Mayo	26	Sábado	6	t
20120527	2012-05-27	2012	2	5	Mayo	27	Domingo	7	t
20120528	2012-05-28	2012	2	5	Mayo	28	Lunes	1	f
20120529	2012-05-29	2012	2	5	Mayo	29	Martes	2	f
20120530	2012-05-30	2012	2	5	Mayo	30	Miércoles	3	f
20120531	2012-05-31	2012	2	5	Mayo	31	Jueves	4	f
20120601	2012-06-01	2012	2	6	Junio	1	Viernes	5	f
20120602	2012-06-02	2012	2	6	Junio	2	Sábado	6	t
20120603	2012-06-03	2012	2	6	Junio	3	Domingo	7	t
20120604	2012-06-04	2012	2	6	Junio	4	Lunes	1	f
20120605	2012-06-05	2012	2	6	Junio	5	Martes	2	f
20120606	2012-06-06	2012	2	6	Junio	6	Miércoles	3	f
20120607	2012-06-07	2012	2	6	Junio	7	Jueves	4	f
20120608	2012-06-08	2012	2	6	Junio	8	Viernes	5	f
20120609	2012-06-09	2012	2	6	Junio	9	Sábado	6	t
20120610	2012-06-10	2012	2	6	Junio	10	Domingo	7	t
20120611	2012-06-11	2012	2	6	Junio	11	Lunes	1	f
20120612	2012-06-12	2012	2	6	Junio	12	Martes	2	f
20120613	2012-06-13	2012	2	6	Junio	13	Miércoles	3	f
20120614	2012-06-14	2012	2	6	Junio	14	Jueves	4	f
20120615	2012-06-15	2012	2	6	Junio	15	Viernes	5	f
20120616	2012-06-16	2012	2	6	Junio	16	Sábado	6	t
20120617	2012-06-17	2012	2	6	Junio	17	Domingo	7	t
20120618	2012-06-18	2012	2	6	Junio	18	Lunes	1	f
20120619	2012-06-19	2012	2	6	Junio	19	Martes	2	f
20120620	2012-06-20	2012	2	6	Junio	20	Miércoles	3	f
20120621	2012-06-21	2012	2	6	Junio	21	Jueves	4	f
20120622	2012-06-22	2012	2	6	Junio	22	Viernes	5	f
20120623	2012-06-23	2012	2	6	Junio	23	Sábado	6	t
20120624	2012-06-24	2012	2	6	Junio	24	Domingo	7	t
20120625	2012-06-25	2012	2	6	Junio	25	Lunes	1	f
20120626	2012-06-26	2012	2	6	Junio	26	Martes	2	f
20120627	2012-06-27	2012	2	6	Junio	27	Miércoles	3	f
20120628	2012-06-28	2012	2	6	Junio	28	Jueves	4	f
20120629	2012-06-29	2012	2	6	Junio	29	Viernes	5	f
20120630	2012-06-30	2012	2	6	Junio	30	Sábado	6	t
20120701	2012-07-01	2012	3	7	Julio	1	Domingo	7	t
20120702	2012-07-02	2012	3	7	Julio	2	Lunes	1	f
20120703	2012-07-03	2012	3	7	Julio	3	Martes	2	f
20120704	2012-07-04	2012	3	7	Julio	4	Miércoles	3	f
20120705	2012-07-05	2012	3	7	Julio	5	Jueves	4	f
20120706	2012-07-06	2012	3	7	Julio	6	Viernes	5	f
20120707	2012-07-07	2012	3	7	Julio	7	Sábado	6	t
20120708	2012-07-08	2012	3	7	Julio	8	Domingo	7	t
20120709	2012-07-09	2012	3	7	Julio	9	Lunes	1	f
20120710	2012-07-10	2012	3	7	Julio	10	Martes	2	f
20120711	2012-07-11	2012	3	7	Julio	11	Miércoles	3	f
20120712	2012-07-12	2012	3	7	Julio	12	Jueves	4	f
20120713	2012-07-13	2012	3	7	Julio	13	Viernes	5	f
20120714	2012-07-14	2012	3	7	Julio	14	Sábado	6	t
20120715	2012-07-15	2012	3	7	Julio	15	Domingo	7	t
20120716	2012-07-16	2012	3	7	Julio	16	Lunes	1	f
20120717	2012-07-17	2012	3	7	Julio	17	Martes	2	f
20120718	2012-07-18	2012	3	7	Julio	18	Miércoles	3	f
20120719	2012-07-19	2012	3	7	Julio	19	Jueves	4	f
20120720	2012-07-20	2012	3	7	Julio	20	Viernes	5	f
20120721	2012-07-21	2012	3	7	Julio	21	Sábado	6	t
20120722	2012-07-22	2012	3	7	Julio	22	Domingo	7	t
20120723	2012-07-23	2012	3	7	Julio	23	Lunes	1	f
20120724	2012-07-24	2012	3	7	Julio	24	Martes	2	f
20120725	2012-07-25	2012	3	7	Julio	25	Miércoles	3	f
20120726	2012-07-26	2012	3	7	Julio	26	Jueves	4	f
20120727	2012-07-27	2012	3	7	Julio	27	Viernes	5	f
20120728	2012-07-28	2012	3	7	Julio	28	Sábado	6	t
20120729	2012-07-29	2012	3	7	Julio	29	Domingo	7	t
20120730	2012-07-30	2012	3	7	Julio	30	Lunes	1	f
20120731	2012-07-31	2012	3	7	Julio	31	Martes	2	f
20120801	2012-08-01	2012	3	8	Agosto	1	Miércoles	3	f
20120802	2012-08-02	2012	3	8	Agosto	2	Jueves	4	f
20120803	2012-08-03	2012	3	8	Agosto	3	Viernes	5	f
20120804	2012-08-04	2012	3	8	Agosto	4	Sábado	6	t
20120805	2012-08-05	2012	3	8	Agosto	5	Domingo	7	t
20120806	2012-08-06	2012	3	8	Agosto	6	Lunes	1	f
20120807	2012-08-07	2012	3	8	Agosto	7	Martes	2	f
20120808	2012-08-08	2012	3	8	Agosto	8	Miércoles	3	f
20120809	2012-08-09	2012	3	8	Agosto	9	Jueves	4	f
20120810	2012-08-10	2012	3	8	Agosto	10	Viernes	5	f
20120811	2012-08-11	2012	3	8	Agosto	11	Sábado	6	t
20120812	2012-08-12	2012	3	8	Agosto	12	Domingo	7	t
20120813	2012-08-13	2012	3	8	Agosto	13	Lunes	1	f
20120814	2012-08-14	2012	3	8	Agosto	14	Martes	2	f
20120815	2012-08-15	2012	3	8	Agosto	15	Miércoles	3	f
20120816	2012-08-16	2012	3	8	Agosto	16	Jueves	4	f
20120817	2012-08-17	2012	3	8	Agosto	17	Viernes	5	f
20120818	2012-08-18	2012	3	8	Agosto	18	Sábado	6	t
20120819	2012-08-19	2012	3	8	Agosto	19	Domingo	7	t
20120820	2012-08-20	2012	3	8	Agosto	20	Lunes	1	f
20120821	2012-08-21	2012	3	8	Agosto	21	Martes	2	f
20120822	2012-08-22	2012	3	8	Agosto	22	Miércoles	3	f
20120823	2012-08-23	2012	3	8	Agosto	23	Jueves	4	f
20120824	2012-08-24	2012	3	8	Agosto	24	Viernes	5	f
20120825	2012-08-25	2012	3	8	Agosto	25	Sábado	6	t
20120826	2012-08-26	2012	3	8	Agosto	26	Domingo	7	t
20120827	2012-08-27	2012	3	8	Agosto	27	Lunes	1	f
20120828	2012-08-28	2012	3	8	Agosto	28	Martes	2	f
20120829	2012-08-29	2012	3	8	Agosto	29	Miércoles	3	f
20120830	2012-08-30	2012	3	8	Agosto	30	Jueves	4	f
20120831	2012-08-31	2012	3	8	Agosto	31	Viernes	5	f
20120901	2012-09-01	2012	3	9	Septiembre	1	Sábado	6	t
20120902	2012-09-02	2012	3	9	Septiembre	2	Domingo	7	t
20120903	2012-09-03	2012	3	9	Septiembre	3	Lunes	1	f
20120904	2012-09-04	2012	3	9	Septiembre	4	Martes	2	f
20120905	2012-09-05	2012	3	9	Septiembre	5	Miércoles	3	f
20120906	2012-09-06	2012	3	9	Septiembre	6	Jueves	4	f
20120907	2012-09-07	2012	3	9	Septiembre	7	Viernes	5	f
20120908	2012-09-08	2012	3	9	Septiembre	8	Sábado	6	t
20120909	2012-09-09	2012	3	9	Septiembre	9	Domingo	7	t
20120910	2012-09-10	2012	3	9	Septiembre	10	Lunes	1	f
20120911	2012-09-11	2012	3	9	Septiembre	11	Martes	2	f
20120912	2012-09-12	2012	3	9	Septiembre	12	Miércoles	3	f
20120913	2012-09-13	2012	3	9	Septiembre	13	Jueves	4	f
20120914	2012-09-14	2012	3	9	Septiembre	14	Viernes	5	f
20120915	2012-09-15	2012	3	9	Septiembre	15	Sábado	6	t
20120916	2012-09-16	2012	3	9	Septiembre	16	Domingo	7	t
20120917	2012-09-17	2012	3	9	Septiembre	17	Lunes	1	f
20120918	2012-09-18	2012	3	9	Septiembre	18	Martes	2	f
20120919	2012-09-19	2012	3	9	Septiembre	19	Miércoles	3	f
20120920	2012-09-20	2012	3	9	Septiembre	20	Jueves	4	f
20120921	2012-09-21	2012	3	9	Septiembre	21	Viernes	5	f
20120922	2012-09-22	2012	3	9	Septiembre	22	Sábado	6	t
20120923	2012-09-23	2012	3	9	Septiembre	23	Domingo	7	t
20120924	2012-09-24	2012	3	9	Septiembre	24	Lunes	1	f
20120925	2012-09-25	2012	3	9	Septiembre	25	Martes	2	f
20120926	2012-09-26	2012	3	9	Septiembre	26	Miércoles	3	f
20120927	2012-09-27	2012	3	9	Septiembre	27	Jueves	4	f
20120928	2012-09-28	2012	3	9	Septiembre	28	Viernes	5	f
20120929	2012-09-29	2012	3	9	Septiembre	29	Sábado	6	t
20120930	2012-09-30	2012	3	9	Septiembre	30	Domingo	7	t
20121001	2012-10-01	2012	4	10	Octubre	1	Lunes	1	f
20121002	2012-10-02	2012	4	10	Octubre	2	Martes	2	f
20121003	2012-10-03	2012	4	10	Octubre	3	Miércoles	3	f
20121004	2012-10-04	2012	4	10	Octubre	4	Jueves	4	f
20121005	2012-10-05	2012	4	10	Octubre	5	Viernes	5	f
20121006	2012-10-06	2012	4	10	Octubre	6	Sábado	6	t
20121007	2012-10-07	2012	4	10	Octubre	7	Domingo	7	t
20121008	2012-10-08	2012	4	10	Octubre	8	Lunes	1	f
20121009	2012-10-09	2012	4	10	Octubre	9	Martes	2	f
20121010	2012-10-10	2012	4	10	Octubre	10	Miércoles	3	f
20121011	2012-10-11	2012	4	10	Octubre	11	Jueves	4	f
20121012	2012-10-12	2012	4	10	Octubre	12	Viernes	5	f
20121013	2012-10-13	2012	4	10	Octubre	13	Sábado	6	t
20121014	2012-10-14	2012	4	10	Octubre	14	Domingo	7	t
20121015	2012-10-15	2012	4	10	Octubre	15	Lunes	1	f
20121016	2012-10-16	2012	4	10	Octubre	16	Martes	2	f
20121017	2012-10-17	2012	4	10	Octubre	17	Miércoles	3	f
20121018	2012-10-18	2012	4	10	Octubre	18	Jueves	4	f
20121019	2012-10-19	2012	4	10	Octubre	19	Viernes	5	f
20121020	2012-10-20	2012	4	10	Octubre	20	Sábado	6	t
20121021	2012-10-21	2012	4	10	Octubre	21	Domingo	7	t
20121022	2012-10-22	2012	4	10	Octubre	22	Lunes	1	f
20121023	2012-10-23	2012	4	10	Octubre	23	Martes	2	f
20121024	2012-10-24	2012	4	10	Octubre	24	Miércoles	3	f
20121025	2012-10-25	2012	4	10	Octubre	25	Jueves	4	f
20121026	2012-10-26	2012	4	10	Octubre	26	Viernes	5	f
20121027	2012-10-27	2012	4	10	Octubre	27	Sábado	6	t
20121028	2012-10-28	2012	4	10	Octubre	28	Domingo	7	t
20121029	2012-10-29	2012	4	10	Octubre	29	Lunes	1	f
20121030	2012-10-30	2012	4	10	Octubre	30	Martes	2	f
20121031	2012-10-31	2012	4	10	Octubre	31	Miércoles	3	f
20121101	2012-11-01	2012	4	11	Noviembre	1	Jueves	4	f
20121102	2012-11-02	2012	4	11	Noviembre	2	Viernes	5	f
20121103	2012-11-03	2012	4	11	Noviembre	3	Sábado	6	t
20121104	2012-11-04	2012	4	11	Noviembre	4	Domingo	7	t
20121105	2012-11-05	2012	4	11	Noviembre	5	Lunes	1	f
20121106	2012-11-06	2012	4	11	Noviembre	6	Martes	2	f
20121107	2012-11-07	2012	4	11	Noviembre	7	Miércoles	3	f
20121108	2012-11-08	2012	4	11	Noviembre	8	Jueves	4	f
20121109	2012-11-09	2012	4	11	Noviembre	9	Viernes	5	f
20121110	2012-11-10	2012	4	11	Noviembre	10	Sábado	6	t
20121111	2012-11-11	2012	4	11	Noviembre	11	Domingo	7	t
20121112	2012-11-12	2012	4	11	Noviembre	12	Lunes	1	f
20121113	2012-11-13	2012	4	11	Noviembre	13	Martes	2	f
20121114	2012-11-14	2012	4	11	Noviembre	14	Miércoles	3	f
20121115	2012-11-15	2012	4	11	Noviembre	15	Jueves	4	f
20121116	2012-11-16	2012	4	11	Noviembre	16	Viernes	5	f
20121117	2012-11-17	2012	4	11	Noviembre	17	Sábado	6	t
20121118	2012-11-18	2012	4	11	Noviembre	18	Domingo	7	t
20121119	2012-11-19	2012	4	11	Noviembre	19	Lunes	1	f
20121120	2012-11-20	2012	4	11	Noviembre	20	Martes	2	f
20121121	2012-11-21	2012	4	11	Noviembre	21	Miércoles	3	f
20121122	2012-11-22	2012	4	11	Noviembre	22	Jueves	4	f
20121123	2012-11-23	2012	4	11	Noviembre	23	Viernes	5	f
20121124	2012-11-24	2012	4	11	Noviembre	24	Sábado	6	t
20121125	2012-11-25	2012	4	11	Noviembre	25	Domingo	7	t
20121126	2012-11-26	2012	4	11	Noviembre	26	Lunes	1	f
20121127	2012-11-27	2012	4	11	Noviembre	27	Martes	2	f
20121128	2012-11-28	2012	4	11	Noviembre	28	Miércoles	3	f
20121129	2012-11-29	2012	4	11	Noviembre	29	Jueves	4	f
20121130	2012-11-30	2012	4	11	Noviembre	30	Viernes	5	f
20121201	2012-12-01	2012	4	12	Diciembre	1	Sábado	6	t
20121202	2012-12-02	2012	4	12	Diciembre	2	Domingo	7	t
20121203	2012-12-03	2012	4	12	Diciembre	3	Lunes	1	f
20121204	2012-12-04	2012	4	12	Diciembre	4	Martes	2	f
20121205	2012-12-05	2012	4	12	Diciembre	5	Miércoles	3	f
20121206	2012-12-06	2012	4	12	Diciembre	6	Jueves	4	f
20121207	2012-12-07	2012	4	12	Diciembre	7	Viernes	5	f
20121208	2012-12-08	2012	4	12	Diciembre	8	Sábado	6	t
20121209	2012-12-09	2012	4	12	Diciembre	9	Domingo	7	t
20121210	2012-12-10	2012	4	12	Diciembre	10	Lunes	1	f
20121211	2012-12-11	2012	4	12	Diciembre	11	Martes	2	f
20121212	2012-12-12	2012	4	12	Diciembre	12	Miércoles	3	f
20121213	2012-12-13	2012	4	12	Diciembre	13	Jueves	4	f
20121214	2012-12-14	2012	4	12	Diciembre	14	Viernes	5	f
20121215	2012-12-15	2012	4	12	Diciembre	15	Sábado	6	t
20121216	2012-12-16	2012	4	12	Diciembre	16	Domingo	7	t
20121217	2012-12-17	2012	4	12	Diciembre	17	Lunes	1	f
20121218	2012-12-18	2012	4	12	Diciembre	18	Martes	2	f
20121219	2012-12-19	2012	4	12	Diciembre	19	Miércoles	3	f
20121220	2012-12-20	2012	4	12	Diciembre	20	Jueves	4	f
20121221	2012-12-21	2012	4	12	Diciembre	21	Viernes	5	f
20121222	2012-12-22	2012	4	12	Diciembre	22	Sábado	6	t
20121223	2012-12-23	2012	4	12	Diciembre	23	Domingo	7	t
20121224	2012-12-24	2012	4	12	Diciembre	24	Lunes	1	f
20121225	2012-12-25	2012	4	12	Diciembre	25	Martes	2	f
20121226	2012-12-26	2012	4	12	Diciembre	26	Miércoles	3	f
20121227	2012-12-27	2012	4	12	Diciembre	27	Jueves	4	f
20121228	2012-12-28	2012	4	12	Diciembre	28	Viernes	5	f
20121229	2012-12-29	2012	4	12	Diciembre	29	Sábado	6	t
20121230	2012-12-30	2012	4	12	Diciembre	30	Domingo	7	t
20121231	2012-12-31	2012	4	12	Diciembre	31	Lunes	1	f
20130101	2013-01-01	2013	1	1	Enero	1	Martes	2	f
20130102	2013-01-02	2013	1	1	Enero	2	Miércoles	3	f
20130103	2013-01-03	2013	1	1	Enero	3	Jueves	4	f
20130104	2013-01-04	2013	1	1	Enero	4	Viernes	5	f
20130105	2013-01-05	2013	1	1	Enero	5	Sábado	6	t
20130106	2013-01-06	2013	1	1	Enero	6	Domingo	7	t
20130107	2013-01-07	2013	1	1	Enero	7	Lunes	1	f
20130108	2013-01-08	2013	1	1	Enero	8	Martes	2	f
20130109	2013-01-09	2013	1	1	Enero	9	Miércoles	3	f
20130110	2013-01-10	2013	1	1	Enero	10	Jueves	4	f
20130111	2013-01-11	2013	1	1	Enero	11	Viernes	5	f
20130112	2013-01-12	2013	1	1	Enero	12	Sábado	6	t
20130113	2013-01-13	2013	1	1	Enero	13	Domingo	7	t
20130114	2013-01-14	2013	1	1	Enero	14	Lunes	1	f
20130115	2013-01-15	2013	1	1	Enero	15	Martes	2	f
20130116	2013-01-16	2013	1	1	Enero	16	Miércoles	3	f
20130117	2013-01-17	2013	1	1	Enero	17	Jueves	4	f
20130118	2013-01-18	2013	1	1	Enero	18	Viernes	5	f
20130119	2013-01-19	2013	1	1	Enero	19	Sábado	6	t
20130120	2013-01-20	2013	1	1	Enero	20	Domingo	7	t
20130121	2013-01-21	2013	1	1	Enero	21	Lunes	1	f
20130122	2013-01-22	2013	1	1	Enero	22	Martes	2	f
20130123	2013-01-23	2013	1	1	Enero	23	Miércoles	3	f
20130124	2013-01-24	2013	1	1	Enero	24	Jueves	4	f
20130125	2013-01-25	2013	1	1	Enero	25	Viernes	5	f
20130126	2013-01-26	2013	1	1	Enero	26	Sábado	6	t
20130127	2013-01-27	2013	1	1	Enero	27	Domingo	7	t
20130128	2013-01-28	2013	1	1	Enero	28	Lunes	1	f
20130129	2013-01-29	2013	1	1	Enero	29	Martes	2	f
20130130	2013-01-30	2013	1	1	Enero	30	Miércoles	3	f
20130131	2013-01-31	2013	1	1	Enero	31	Jueves	4	f
20130201	2013-02-01	2013	1	2	Febrero	1	Viernes	5	f
20130202	2013-02-02	2013	1	2	Febrero	2	Sábado	6	t
20130203	2013-02-03	2013	1	2	Febrero	3	Domingo	7	t
20130204	2013-02-04	2013	1	2	Febrero	4	Lunes	1	f
20130205	2013-02-05	2013	1	2	Febrero	5	Martes	2	f
20130206	2013-02-06	2013	1	2	Febrero	6	Miércoles	3	f
20130207	2013-02-07	2013	1	2	Febrero	7	Jueves	4	f
20130208	2013-02-08	2013	1	2	Febrero	8	Viernes	5	f
20130209	2013-02-09	2013	1	2	Febrero	9	Sábado	6	t
20130210	2013-02-10	2013	1	2	Febrero	10	Domingo	7	t
20130211	2013-02-11	2013	1	2	Febrero	11	Lunes	1	f
20130212	2013-02-12	2013	1	2	Febrero	12	Martes	2	f
20130213	2013-02-13	2013	1	2	Febrero	13	Miércoles	3	f
20130214	2013-02-14	2013	1	2	Febrero	14	Jueves	4	f
20130215	2013-02-15	2013	1	2	Febrero	15	Viernes	5	f
20130216	2013-02-16	2013	1	2	Febrero	16	Sábado	6	t
20130217	2013-02-17	2013	1	2	Febrero	17	Domingo	7	t
20130218	2013-02-18	2013	1	2	Febrero	18	Lunes	1	f
20130219	2013-02-19	2013	1	2	Febrero	19	Martes	2	f
20130220	2013-02-20	2013	1	2	Febrero	20	Miércoles	3	f
20130221	2013-02-21	2013	1	2	Febrero	21	Jueves	4	f
20130222	2013-02-22	2013	1	2	Febrero	22	Viernes	5	f
20130223	2013-02-23	2013	1	2	Febrero	23	Sábado	6	t
20130224	2013-02-24	2013	1	2	Febrero	24	Domingo	7	t
20130225	2013-02-25	2013	1	2	Febrero	25	Lunes	1	f
20130226	2013-02-26	2013	1	2	Febrero	26	Martes	2	f
20130227	2013-02-27	2013	1	2	Febrero	27	Miércoles	3	f
20130228	2013-02-28	2013	1	2	Febrero	28	Jueves	4	f
20130301	2013-03-01	2013	1	3	Marzo	1	Viernes	5	f
20130302	2013-03-02	2013	1	3	Marzo	2	Sábado	6	t
20130303	2013-03-03	2013	1	3	Marzo	3	Domingo	7	t
20130304	2013-03-04	2013	1	3	Marzo	4	Lunes	1	f
20130305	2013-03-05	2013	1	3	Marzo	5	Martes	2	f
20130306	2013-03-06	2013	1	3	Marzo	6	Miércoles	3	f
20130307	2013-03-07	2013	1	3	Marzo	7	Jueves	4	f
20130308	2013-03-08	2013	1	3	Marzo	8	Viernes	5	f
20130309	2013-03-09	2013	1	3	Marzo	9	Sábado	6	t
20130310	2013-03-10	2013	1	3	Marzo	10	Domingo	7	t
20130311	2013-03-11	2013	1	3	Marzo	11	Lunes	1	f
20130312	2013-03-12	2013	1	3	Marzo	12	Martes	2	f
20130313	2013-03-13	2013	1	3	Marzo	13	Miércoles	3	f
20130314	2013-03-14	2013	1	3	Marzo	14	Jueves	4	f
20130315	2013-03-15	2013	1	3	Marzo	15	Viernes	5	f
20130316	2013-03-16	2013	1	3	Marzo	16	Sábado	6	t
20130317	2013-03-17	2013	1	3	Marzo	17	Domingo	7	t
20130318	2013-03-18	2013	1	3	Marzo	18	Lunes	1	f
20130319	2013-03-19	2013	1	3	Marzo	19	Martes	2	f
20130320	2013-03-20	2013	1	3	Marzo	20	Miércoles	3	f
20130321	2013-03-21	2013	1	3	Marzo	21	Jueves	4	f
20130322	2013-03-22	2013	1	3	Marzo	22	Viernes	5	f
20130323	2013-03-23	2013	1	3	Marzo	23	Sábado	6	t
20130324	2013-03-24	2013	1	3	Marzo	24	Domingo	7	t
20130325	2013-03-25	2013	1	3	Marzo	25	Lunes	1	f
20130326	2013-03-26	2013	1	3	Marzo	26	Martes	2	f
20130327	2013-03-27	2013	1	3	Marzo	27	Miércoles	3	f
20130328	2013-03-28	2013	1	3	Marzo	28	Jueves	4	f
20130329	2013-03-29	2013	1	3	Marzo	29	Viernes	5	f
20130330	2013-03-30	2013	1	3	Marzo	30	Sábado	6	t
20130331	2013-03-31	2013	1	3	Marzo	31	Domingo	7	t
20130401	2013-04-01	2013	2	4	Abril	1	Lunes	1	f
20130402	2013-04-02	2013	2	4	Abril	2	Martes	2	f
20130403	2013-04-03	2013	2	4	Abril	3	Miércoles	3	f
20130404	2013-04-04	2013	2	4	Abril	4	Jueves	4	f
20130405	2013-04-05	2013	2	4	Abril	5	Viernes	5	f
20130406	2013-04-06	2013	2	4	Abril	6	Sábado	6	t
20130407	2013-04-07	2013	2	4	Abril	7	Domingo	7	t
20130408	2013-04-08	2013	2	4	Abril	8	Lunes	1	f
20130409	2013-04-09	2013	2	4	Abril	9	Martes	2	f
20130410	2013-04-10	2013	2	4	Abril	10	Miércoles	3	f
20130411	2013-04-11	2013	2	4	Abril	11	Jueves	4	f
20130412	2013-04-12	2013	2	4	Abril	12	Viernes	5	f
20130413	2013-04-13	2013	2	4	Abril	13	Sábado	6	t
20130414	2013-04-14	2013	2	4	Abril	14	Domingo	7	t
20130415	2013-04-15	2013	2	4	Abril	15	Lunes	1	f
20130416	2013-04-16	2013	2	4	Abril	16	Martes	2	f
20130417	2013-04-17	2013	2	4	Abril	17	Miércoles	3	f
20130418	2013-04-18	2013	2	4	Abril	18	Jueves	4	f
20130419	2013-04-19	2013	2	4	Abril	19	Viernes	5	f
20130420	2013-04-20	2013	2	4	Abril	20	Sábado	6	t
20130421	2013-04-21	2013	2	4	Abril	21	Domingo	7	t
20130422	2013-04-22	2013	2	4	Abril	22	Lunes	1	f
20130423	2013-04-23	2013	2	4	Abril	23	Martes	2	f
20130424	2013-04-24	2013	2	4	Abril	24	Miércoles	3	f
20130425	2013-04-25	2013	2	4	Abril	25	Jueves	4	f
20130426	2013-04-26	2013	2	4	Abril	26	Viernes	5	f
20130427	2013-04-27	2013	2	4	Abril	27	Sábado	6	t
20130428	2013-04-28	2013	2	4	Abril	28	Domingo	7	t
20130429	2013-04-29	2013	2	4	Abril	29	Lunes	1	f
20130430	2013-04-30	2013	2	4	Abril	30	Martes	2	f
20130501	2013-05-01	2013	2	5	Mayo	1	Miércoles	3	f
20130502	2013-05-02	2013	2	5	Mayo	2	Jueves	4	f
20130503	2013-05-03	2013	2	5	Mayo	3	Viernes	5	f
20130504	2013-05-04	2013	2	5	Mayo	4	Sábado	6	t
20130505	2013-05-05	2013	2	5	Mayo	5	Domingo	7	t
20130506	2013-05-06	2013	2	5	Mayo	6	Lunes	1	f
20130507	2013-05-07	2013	2	5	Mayo	7	Martes	2	f
20130508	2013-05-08	2013	2	5	Mayo	8	Miércoles	3	f
20130509	2013-05-09	2013	2	5	Mayo	9	Jueves	4	f
20130510	2013-05-10	2013	2	5	Mayo	10	Viernes	5	f
20130511	2013-05-11	2013	2	5	Mayo	11	Sábado	6	t
20130512	2013-05-12	2013	2	5	Mayo	12	Domingo	7	t
20130513	2013-05-13	2013	2	5	Mayo	13	Lunes	1	f
20130514	2013-05-14	2013	2	5	Mayo	14	Martes	2	f
20130515	2013-05-15	2013	2	5	Mayo	15	Miércoles	3	f
20130516	2013-05-16	2013	2	5	Mayo	16	Jueves	4	f
20130517	2013-05-17	2013	2	5	Mayo	17	Viernes	5	f
20130518	2013-05-18	2013	2	5	Mayo	18	Sábado	6	t
20130519	2013-05-19	2013	2	5	Mayo	19	Domingo	7	t
20130520	2013-05-20	2013	2	5	Mayo	20	Lunes	1	f
20130521	2013-05-21	2013	2	5	Mayo	21	Martes	2	f
20130522	2013-05-22	2013	2	5	Mayo	22	Miércoles	3	f
20130523	2013-05-23	2013	2	5	Mayo	23	Jueves	4	f
20130524	2013-05-24	2013	2	5	Mayo	24	Viernes	5	f
20130525	2013-05-25	2013	2	5	Mayo	25	Sábado	6	t
20130526	2013-05-26	2013	2	5	Mayo	26	Domingo	7	t
20130527	2013-05-27	2013	2	5	Mayo	27	Lunes	1	f
20130528	2013-05-28	2013	2	5	Mayo	28	Martes	2	f
20130529	2013-05-29	2013	2	5	Mayo	29	Miércoles	3	f
20130530	2013-05-30	2013	2	5	Mayo	30	Jueves	4	f
20130531	2013-05-31	2013	2	5	Mayo	31	Viernes	5	f
20130601	2013-06-01	2013	2	6	Junio	1	Sábado	6	t
20130602	2013-06-02	2013	2	6	Junio	2	Domingo	7	t
20130603	2013-06-03	2013	2	6	Junio	3	Lunes	1	f
20130604	2013-06-04	2013	2	6	Junio	4	Martes	2	f
20130605	2013-06-05	2013	2	6	Junio	5	Miércoles	3	f
20130606	2013-06-06	2013	2	6	Junio	6	Jueves	4	f
20130607	2013-06-07	2013	2	6	Junio	7	Viernes	5	f
20130608	2013-06-08	2013	2	6	Junio	8	Sábado	6	t
20130609	2013-06-09	2013	2	6	Junio	9	Domingo	7	t
20130610	2013-06-10	2013	2	6	Junio	10	Lunes	1	f
20130611	2013-06-11	2013	2	6	Junio	11	Martes	2	f
20130612	2013-06-12	2013	2	6	Junio	12	Miércoles	3	f
20130613	2013-06-13	2013	2	6	Junio	13	Jueves	4	f
20130614	2013-06-14	2013	2	6	Junio	14	Viernes	5	f
20130615	2013-06-15	2013	2	6	Junio	15	Sábado	6	t
20130616	2013-06-16	2013	2	6	Junio	16	Domingo	7	t
20130617	2013-06-17	2013	2	6	Junio	17	Lunes	1	f
20130618	2013-06-18	2013	2	6	Junio	18	Martes	2	f
20130619	2013-06-19	2013	2	6	Junio	19	Miércoles	3	f
20130620	2013-06-20	2013	2	6	Junio	20	Jueves	4	f
20130621	2013-06-21	2013	2	6	Junio	21	Viernes	5	f
20130622	2013-06-22	2013	2	6	Junio	22	Sábado	6	t
20130623	2013-06-23	2013	2	6	Junio	23	Domingo	7	t
20130624	2013-06-24	2013	2	6	Junio	24	Lunes	1	f
20130625	2013-06-25	2013	2	6	Junio	25	Martes	2	f
20130626	2013-06-26	2013	2	6	Junio	26	Miércoles	3	f
20130627	2013-06-27	2013	2	6	Junio	27	Jueves	4	f
20130628	2013-06-28	2013	2	6	Junio	28	Viernes	5	f
20130629	2013-06-29	2013	2	6	Junio	29	Sábado	6	t
20130630	2013-06-30	2013	2	6	Junio	30	Domingo	7	t
20130701	2013-07-01	2013	3	7	Julio	1	Lunes	1	f
20130702	2013-07-02	2013	3	7	Julio	2	Martes	2	f
20130703	2013-07-03	2013	3	7	Julio	3	Miércoles	3	f
20130704	2013-07-04	2013	3	7	Julio	4	Jueves	4	f
20130705	2013-07-05	2013	3	7	Julio	5	Viernes	5	f
20130706	2013-07-06	2013	3	7	Julio	6	Sábado	6	t
20130707	2013-07-07	2013	3	7	Julio	7	Domingo	7	t
20130708	2013-07-08	2013	3	7	Julio	8	Lunes	1	f
20130709	2013-07-09	2013	3	7	Julio	9	Martes	2	f
20130710	2013-07-10	2013	3	7	Julio	10	Miércoles	3	f
20130711	2013-07-11	2013	3	7	Julio	11	Jueves	4	f
20130712	2013-07-12	2013	3	7	Julio	12	Viernes	5	f
20130713	2013-07-13	2013	3	7	Julio	13	Sábado	6	t
20130714	2013-07-14	2013	3	7	Julio	14	Domingo	7	t
20130715	2013-07-15	2013	3	7	Julio	15	Lunes	1	f
20130716	2013-07-16	2013	3	7	Julio	16	Martes	2	f
20130717	2013-07-17	2013	3	7	Julio	17	Miércoles	3	f
20130718	2013-07-18	2013	3	7	Julio	18	Jueves	4	f
20130719	2013-07-19	2013	3	7	Julio	19	Viernes	5	f
20130720	2013-07-20	2013	3	7	Julio	20	Sábado	6	t
20130721	2013-07-21	2013	3	7	Julio	21	Domingo	7	t
20130722	2013-07-22	2013	3	7	Julio	22	Lunes	1	f
20130723	2013-07-23	2013	3	7	Julio	23	Martes	2	f
20130724	2013-07-24	2013	3	7	Julio	24	Miércoles	3	f
20130725	2013-07-25	2013	3	7	Julio	25	Jueves	4	f
20130726	2013-07-26	2013	3	7	Julio	26	Viernes	5	f
20130727	2013-07-27	2013	3	7	Julio	27	Sábado	6	t
20130728	2013-07-28	2013	3	7	Julio	28	Domingo	7	t
20130729	2013-07-29	2013	3	7	Julio	29	Lunes	1	f
20130730	2013-07-30	2013	3	7	Julio	30	Martes	2	f
20130731	2013-07-31	2013	3	7	Julio	31	Miércoles	3	f
20130801	2013-08-01	2013	3	8	Agosto	1	Jueves	4	f
20130802	2013-08-02	2013	3	8	Agosto	2	Viernes	5	f
20130803	2013-08-03	2013	3	8	Agosto	3	Sábado	6	t
20130804	2013-08-04	2013	3	8	Agosto	4	Domingo	7	t
20130805	2013-08-05	2013	3	8	Agosto	5	Lunes	1	f
20130806	2013-08-06	2013	3	8	Agosto	6	Martes	2	f
20130807	2013-08-07	2013	3	8	Agosto	7	Miércoles	3	f
20130808	2013-08-08	2013	3	8	Agosto	8	Jueves	4	f
20130809	2013-08-09	2013	3	8	Agosto	9	Viernes	5	f
20130810	2013-08-10	2013	3	8	Agosto	10	Sábado	6	t
20130811	2013-08-11	2013	3	8	Agosto	11	Domingo	7	t
20130812	2013-08-12	2013	3	8	Agosto	12	Lunes	1	f
20130813	2013-08-13	2013	3	8	Agosto	13	Martes	2	f
20130814	2013-08-14	2013	3	8	Agosto	14	Miércoles	3	f
20130815	2013-08-15	2013	3	8	Agosto	15	Jueves	4	f
20130816	2013-08-16	2013	3	8	Agosto	16	Viernes	5	f
20130817	2013-08-17	2013	3	8	Agosto	17	Sábado	6	t
20130818	2013-08-18	2013	3	8	Agosto	18	Domingo	7	t
20130819	2013-08-19	2013	3	8	Agosto	19	Lunes	1	f
20130820	2013-08-20	2013	3	8	Agosto	20	Martes	2	f
20130821	2013-08-21	2013	3	8	Agosto	21	Miércoles	3	f
20130822	2013-08-22	2013	3	8	Agosto	22	Jueves	4	f
20130823	2013-08-23	2013	3	8	Agosto	23	Viernes	5	f
20130824	2013-08-24	2013	3	8	Agosto	24	Sábado	6	t
20130825	2013-08-25	2013	3	8	Agosto	25	Domingo	7	t
20130826	2013-08-26	2013	3	8	Agosto	26	Lunes	1	f
20130827	2013-08-27	2013	3	8	Agosto	27	Martes	2	f
20130828	2013-08-28	2013	3	8	Agosto	28	Miércoles	3	f
20130829	2013-08-29	2013	3	8	Agosto	29	Jueves	4	f
20130830	2013-08-30	2013	3	8	Agosto	30	Viernes	5	f
20130831	2013-08-31	2013	3	8	Agosto	31	Sábado	6	t
20130901	2013-09-01	2013	3	9	Septiembre	1	Domingo	7	t
20130902	2013-09-02	2013	3	9	Septiembre	2	Lunes	1	f
20130903	2013-09-03	2013	3	9	Septiembre	3	Martes	2	f
20130904	2013-09-04	2013	3	9	Septiembre	4	Miércoles	3	f
20130905	2013-09-05	2013	3	9	Septiembre	5	Jueves	4	f
20130906	2013-09-06	2013	3	9	Septiembre	6	Viernes	5	f
20130907	2013-09-07	2013	3	9	Septiembre	7	Sábado	6	t
20130908	2013-09-08	2013	3	9	Septiembre	8	Domingo	7	t
20130909	2013-09-09	2013	3	9	Septiembre	9	Lunes	1	f
20130910	2013-09-10	2013	3	9	Septiembre	10	Martes	2	f
20130911	2013-09-11	2013	3	9	Septiembre	11	Miércoles	3	f
20130912	2013-09-12	2013	3	9	Septiembre	12	Jueves	4	f
20130913	2013-09-13	2013	3	9	Septiembre	13	Viernes	5	f
20130914	2013-09-14	2013	3	9	Septiembre	14	Sábado	6	t
20130915	2013-09-15	2013	3	9	Septiembre	15	Domingo	7	t
20130916	2013-09-16	2013	3	9	Septiembre	16	Lunes	1	f
20130917	2013-09-17	2013	3	9	Septiembre	17	Martes	2	f
20130918	2013-09-18	2013	3	9	Septiembre	18	Miércoles	3	f
20130919	2013-09-19	2013	3	9	Septiembre	19	Jueves	4	f
20130920	2013-09-20	2013	3	9	Septiembre	20	Viernes	5	f
20130921	2013-09-21	2013	3	9	Septiembre	21	Sábado	6	t
20130922	2013-09-22	2013	3	9	Septiembre	22	Domingo	7	t
20130923	2013-09-23	2013	3	9	Septiembre	23	Lunes	1	f
20130924	2013-09-24	2013	3	9	Septiembre	24	Martes	2	f
20130925	2013-09-25	2013	3	9	Septiembre	25	Miércoles	3	f
20130926	2013-09-26	2013	3	9	Septiembre	26	Jueves	4	f
20130927	2013-09-27	2013	3	9	Septiembre	27	Viernes	5	f
20130928	2013-09-28	2013	3	9	Septiembre	28	Sábado	6	t
20130929	2013-09-29	2013	3	9	Septiembre	29	Domingo	7	t
20130930	2013-09-30	2013	3	9	Septiembre	30	Lunes	1	f
20131001	2013-10-01	2013	4	10	Octubre	1	Martes	2	f
20131002	2013-10-02	2013	4	10	Octubre	2	Miércoles	3	f
20131003	2013-10-03	2013	4	10	Octubre	3	Jueves	4	f
20131004	2013-10-04	2013	4	10	Octubre	4	Viernes	5	f
20131005	2013-10-05	2013	4	10	Octubre	5	Sábado	6	t
20131006	2013-10-06	2013	4	10	Octubre	6	Domingo	7	t
20131007	2013-10-07	2013	4	10	Octubre	7	Lunes	1	f
20131008	2013-10-08	2013	4	10	Octubre	8	Martes	2	f
20131009	2013-10-09	2013	4	10	Octubre	9	Miércoles	3	f
20131010	2013-10-10	2013	4	10	Octubre	10	Jueves	4	f
20131011	2013-10-11	2013	4	10	Octubre	11	Viernes	5	f
20131012	2013-10-12	2013	4	10	Octubre	12	Sábado	6	t
20131013	2013-10-13	2013	4	10	Octubre	13	Domingo	7	t
20131014	2013-10-14	2013	4	10	Octubre	14	Lunes	1	f
20131015	2013-10-15	2013	4	10	Octubre	15	Martes	2	f
20131016	2013-10-16	2013	4	10	Octubre	16	Miércoles	3	f
20131017	2013-10-17	2013	4	10	Octubre	17	Jueves	4	f
20131018	2013-10-18	2013	4	10	Octubre	18	Viernes	5	f
20131019	2013-10-19	2013	4	10	Octubre	19	Sábado	6	t
20131020	2013-10-20	2013	4	10	Octubre	20	Domingo	7	t
20131021	2013-10-21	2013	4	10	Octubre	21	Lunes	1	f
20131022	2013-10-22	2013	4	10	Octubre	22	Martes	2	f
20131023	2013-10-23	2013	4	10	Octubre	23	Miércoles	3	f
20131024	2013-10-24	2013	4	10	Octubre	24	Jueves	4	f
20131025	2013-10-25	2013	4	10	Octubre	25	Viernes	5	f
20131026	2013-10-26	2013	4	10	Octubre	26	Sábado	6	t
20131027	2013-10-27	2013	4	10	Octubre	27	Domingo	7	t
20131028	2013-10-28	2013	4	10	Octubre	28	Lunes	1	f
20131029	2013-10-29	2013	4	10	Octubre	29	Martes	2	f
20131030	2013-10-30	2013	4	10	Octubre	30	Miércoles	3	f
20131031	2013-10-31	2013	4	10	Octubre	31	Jueves	4	f
20131101	2013-11-01	2013	4	11	Noviembre	1	Viernes	5	f
20131102	2013-11-02	2013	4	11	Noviembre	2	Sábado	6	t
20131103	2013-11-03	2013	4	11	Noviembre	3	Domingo	7	t
20131104	2013-11-04	2013	4	11	Noviembre	4	Lunes	1	f
20131105	2013-11-05	2013	4	11	Noviembre	5	Martes	2	f
20131106	2013-11-06	2013	4	11	Noviembre	6	Miércoles	3	f
20131107	2013-11-07	2013	4	11	Noviembre	7	Jueves	4	f
20131108	2013-11-08	2013	4	11	Noviembre	8	Viernes	5	f
20131109	2013-11-09	2013	4	11	Noviembre	9	Sábado	6	t
20131110	2013-11-10	2013	4	11	Noviembre	10	Domingo	7	t
20131111	2013-11-11	2013	4	11	Noviembre	11	Lunes	1	f
20131112	2013-11-12	2013	4	11	Noviembre	12	Martes	2	f
20131113	2013-11-13	2013	4	11	Noviembre	13	Miércoles	3	f
20131114	2013-11-14	2013	4	11	Noviembre	14	Jueves	4	f
20131115	2013-11-15	2013	4	11	Noviembre	15	Viernes	5	f
20131116	2013-11-16	2013	4	11	Noviembre	16	Sábado	6	t
20131117	2013-11-17	2013	4	11	Noviembre	17	Domingo	7	t
20131118	2013-11-18	2013	4	11	Noviembre	18	Lunes	1	f
20131119	2013-11-19	2013	4	11	Noviembre	19	Martes	2	f
20131120	2013-11-20	2013	4	11	Noviembre	20	Miércoles	3	f
20131121	2013-11-21	2013	4	11	Noviembre	21	Jueves	4	f
20131122	2013-11-22	2013	4	11	Noviembre	22	Viernes	5	f
20131123	2013-11-23	2013	4	11	Noviembre	23	Sábado	6	t
20131124	2013-11-24	2013	4	11	Noviembre	24	Domingo	7	t
20131125	2013-11-25	2013	4	11	Noviembre	25	Lunes	1	f
20131126	2013-11-26	2013	4	11	Noviembre	26	Martes	2	f
20131127	2013-11-27	2013	4	11	Noviembre	27	Miércoles	3	f
20131128	2013-11-28	2013	4	11	Noviembre	28	Jueves	4	f
20131129	2013-11-29	2013	4	11	Noviembre	29	Viernes	5	f
20131130	2013-11-30	2013	4	11	Noviembre	30	Sábado	6	t
20131201	2013-12-01	2013	4	12	Diciembre	1	Domingo	7	t
20131202	2013-12-02	2013	4	12	Diciembre	2	Lunes	1	f
20131203	2013-12-03	2013	4	12	Diciembre	3	Martes	2	f
20131204	2013-12-04	2013	4	12	Diciembre	4	Miércoles	3	f
20131205	2013-12-05	2013	4	12	Diciembre	5	Jueves	4	f
20131206	2013-12-06	2013	4	12	Diciembre	6	Viernes	5	f
20131207	2013-12-07	2013	4	12	Diciembre	7	Sábado	6	t
20131208	2013-12-08	2013	4	12	Diciembre	8	Domingo	7	t
20131209	2013-12-09	2013	4	12	Diciembre	9	Lunes	1	f
20131210	2013-12-10	2013	4	12	Diciembre	10	Martes	2	f
20131211	2013-12-11	2013	4	12	Diciembre	11	Miércoles	3	f
20131212	2013-12-12	2013	4	12	Diciembre	12	Jueves	4	f
20131213	2013-12-13	2013	4	12	Diciembre	13	Viernes	5	f
20131214	2013-12-14	2013	4	12	Diciembre	14	Sábado	6	t
20131215	2013-12-15	2013	4	12	Diciembre	15	Domingo	7	t
20131216	2013-12-16	2013	4	12	Diciembre	16	Lunes	1	f
20131217	2013-12-17	2013	4	12	Diciembre	17	Martes	2	f
20131218	2013-12-18	2013	4	12	Diciembre	18	Miércoles	3	f
20131219	2013-12-19	2013	4	12	Diciembre	19	Jueves	4	f
20131220	2013-12-20	2013	4	12	Diciembre	20	Viernes	5	f
20131221	2013-12-21	2013	4	12	Diciembre	21	Sábado	6	t
20131222	2013-12-22	2013	4	12	Diciembre	22	Domingo	7	t
20131223	2013-12-23	2013	4	12	Diciembre	23	Lunes	1	f
20131224	2013-12-24	2013	4	12	Diciembre	24	Martes	2	f
20131225	2013-12-25	2013	4	12	Diciembre	25	Miércoles	3	f
20131226	2013-12-26	2013	4	12	Diciembre	26	Jueves	4	f
20131227	2013-12-27	2013	4	12	Diciembre	27	Viernes	5	f
20131228	2013-12-28	2013	4	12	Diciembre	28	Sábado	6	t
20131229	2013-12-29	2013	4	12	Diciembre	29	Domingo	7	t
20131230	2013-12-30	2013	4	12	Diciembre	30	Lunes	1	f
20131231	2013-12-31	2013	4	12	Diciembre	31	Martes	2	f
20140101	2014-01-01	2014	1	1	Enero	1	Miércoles	3	f
20140102	2014-01-02	2014	1	1	Enero	2	Jueves	4	f
20140103	2014-01-03	2014	1	1	Enero	3	Viernes	5	f
20140104	2014-01-04	2014	1	1	Enero	4	Sábado	6	t
20140105	2014-01-05	2014	1	1	Enero	5	Domingo	7	t
20140106	2014-01-06	2014	1	1	Enero	6	Lunes	1	f
20140107	2014-01-07	2014	1	1	Enero	7	Martes	2	f
20140108	2014-01-08	2014	1	1	Enero	8	Miércoles	3	f
20140109	2014-01-09	2014	1	1	Enero	9	Jueves	4	f
20140110	2014-01-10	2014	1	1	Enero	10	Viernes	5	f
20140111	2014-01-11	2014	1	1	Enero	11	Sábado	6	t
20140112	2014-01-12	2014	1	1	Enero	12	Domingo	7	t
20140113	2014-01-13	2014	1	1	Enero	13	Lunes	1	f
20140114	2014-01-14	2014	1	1	Enero	14	Martes	2	f
20140115	2014-01-15	2014	1	1	Enero	15	Miércoles	3	f
20140116	2014-01-16	2014	1	1	Enero	16	Jueves	4	f
20140117	2014-01-17	2014	1	1	Enero	17	Viernes	5	f
20140118	2014-01-18	2014	1	1	Enero	18	Sábado	6	t
20140119	2014-01-19	2014	1	1	Enero	19	Domingo	7	t
20140120	2014-01-20	2014	1	1	Enero	20	Lunes	1	f
20140121	2014-01-21	2014	1	1	Enero	21	Martes	2	f
20140122	2014-01-22	2014	1	1	Enero	22	Miércoles	3	f
20140123	2014-01-23	2014	1	1	Enero	23	Jueves	4	f
20140124	2014-01-24	2014	1	1	Enero	24	Viernes	5	f
20140125	2014-01-25	2014	1	1	Enero	25	Sábado	6	t
20140126	2014-01-26	2014	1	1	Enero	26	Domingo	7	t
20140127	2014-01-27	2014	1	1	Enero	27	Lunes	1	f
20140128	2014-01-28	2014	1	1	Enero	28	Martes	2	f
20140129	2014-01-29	2014	1	1	Enero	29	Miércoles	3	f
20140130	2014-01-30	2014	1	1	Enero	30	Jueves	4	f
20140131	2014-01-31	2014	1	1	Enero	31	Viernes	5	f
20140201	2014-02-01	2014	1	2	Febrero	1	Sábado	6	t
20140202	2014-02-02	2014	1	2	Febrero	2	Domingo	7	t
20140203	2014-02-03	2014	1	2	Febrero	3	Lunes	1	f
20140204	2014-02-04	2014	1	2	Febrero	4	Martes	2	f
20140205	2014-02-05	2014	1	2	Febrero	5	Miércoles	3	f
20140206	2014-02-06	2014	1	2	Febrero	6	Jueves	4	f
20140207	2014-02-07	2014	1	2	Febrero	7	Viernes	5	f
20140208	2014-02-08	2014	1	2	Febrero	8	Sábado	6	t
20140209	2014-02-09	2014	1	2	Febrero	9	Domingo	7	t
20140210	2014-02-10	2014	1	2	Febrero	10	Lunes	1	f
20140211	2014-02-11	2014	1	2	Febrero	11	Martes	2	f
20140212	2014-02-12	2014	1	2	Febrero	12	Miércoles	3	f
20140213	2014-02-13	2014	1	2	Febrero	13	Jueves	4	f
20140214	2014-02-14	2014	1	2	Febrero	14	Viernes	5	f
20140215	2014-02-15	2014	1	2	Febrero	15	Sábado	6	t
20140216	2014-02-16	2014	1	2	Febrero	16	Domingo	7	t
20140217	2014-02-17	2014	1	2	Febrero	17	Lunes	1	f
20140218	2014-02-18	2014	1	2	Febrero	18	Martes	2	f
20140219	2014-02-19	2014	1	2	Febrero	19	Miércoles	3	f
20140220	2014-02-20	2014	1	2	Febrero	20	Jueves	4	f
20140221	2014-02-21	2014	1	2	Febrero	21	Viernes	5	f
20140222	2014-02-22	2014	1	2	Febrero	22	Sábado	6	t
20140223	2014-02-23	2014	1	2	Febrero	23	Domingo	7	t
20140224	2014-02-24	2014	1	2	Febrero	24	Lunes	1	f
20140225	2014-02-25	2014	1	2	Febrero	25	Martes	2	f
20140226	2014-02-26	2014	1	2	Febrero	26	Miércoles	3	f
20140227	2014-02-27	2014	1	2	Febrero	27	Jueves	4	f
20140228	2014-02-28	2014	1	2	Febrero	28	Viernes	5	f
20140301	2014-03-01	2014	1	3	Marzo	1	Sábado	6	t
20140302	2014-03-02	2014	1	3	Marzo	2	Domingo	7	t
20140303	2014-03-03	2014	1	3	Marzo	3	Lunes	1	f
20140304	2014-03-04	2014	1	3	Marzo	4	Martes	2	f
20140305	2014-03-05	2014	1	3	Marzo	5	Miércoles	3	f
20140306	2014-03-06	2014	1	3	Marzo	6	Jueves	4	f
20140307	2014-03-07	2014	1	3	Marzo	7	Viernes	5	f
20140308	2014-03-08	2014	1	3	Marzo	8	Sábado	6	t
20140309	2014-03-09	2014	1	3	Marzo	9	Domingo	7	t
20140310	2014-03-10	2014	1	3	Marzo	10	Lunes	1	f
20140311	2014-03-11	2014	1	3	Marzo	11	Martes	2	f
20140312	2014-03-12	2014	1	3	Marzo	12	Miércoles	3	f
20140313	2014-03-13	2014	1	3	Marzo	13	Jueves	4	f
20140314	2014-03-14	2014	1	3	Marzo	14	Viernes	5	f
20140315	2014-03-15	2014	1	3	Marzo	15	Sábado	6	t
20140316	2014-03-16	2014	1	3	Marzo	16	Domingo	7	t
20140317	2014-03-17	2014	1	3	Marzo	17	Lunes	1	f
20140318	2014-03-18	2014	1	3	Marzo	18	Martes	2	f
20140319	2014-03-19	2014	1	3	Marzo	19	Miércoles	3	f
20140320	2014-03-20	2014	1	3	Marzo	20	Jueves	4	f
20140321	2014-03-21	2014	1	3	Marzo	21	Viernes	5	f
20140322	2014-03-22	2014	1	3	Marzo	22	Sábado	6	t
20140323	2014-03-23	2014	1	3	Marzo	23	Domingo	7	t
20140324	2014-03-24	2014	1	3	Marzo	24	Lunes	1	f
20140325	2014-03-25	2014	1	3	Marzo	25	Martes	2	f
20140326	2014-03-26	2014	1	3	Marzo	26	Miércoles	3	f
20140327	2014-03-27	2014	1	3	Marzo	27	Jueves	4	f
20140328	2014-03-28	2014	1	3	Marzo	28	Viernes	5	f
20140329	2014-03-29	2014	1	3	Marzo	29	Sábado	6	t
20140330	2014-03-30	2014	1	3	Marzo	30	Domingo	7	t
20140331	2014-03-31	2014	1	3	Marzo	31	Lunes	1	f
20140401	2014-04-01	2014	2	4	Abril	1	Martes	2	f
20140402	2014-04-02	2014	2	4	Abril	2	Miércoles	3	f
20140403	2014-04-03	2014	2	4	Abril	3	Jueves	4	f
20140404	2014-04-04	2014	2	4	Abril	4	Viernes	5	f
20140405	2014-04-05	2014	2	4	Abril	5	Sábado	6	t
20140406	2014-04-06	2014	2	4	Abril	6	Domingo	7	t
20140407	2014-04-07	2014	2	4	Abril	7	Lunes	1	f
20140408	2014-04-08	2014	2	4	Abril	8	Martes	2	f
20140409	2014-04-09	2014	2	4	Abril	9	Miércoles	3	f
20140410	2014-04-10	2014	2	4	Abril	10	Jueves	4	f
20140411	2014-04-11	2014	2	4	Abril	11	Viernes	5	f
20140412	2014-04-12	2014	2	4	Abril	12	Sábado	6	t
20140413	2014-04-13	2014	2	4	Abril	13	Domingo	7	t
20140414	2014-04-14	2014	2	4	Abril	14	Lunes	1	f
20140415	2014-04-15	2014	2	4	Abril	15	Martes	2	f
20140416	2014-04-16	2014	2	4	Abril	16	Miércoles	3	f
20140417	2014-04-17	2014	2	4	Abril	17	Jueves	4	f
20140418	2014-04-18	2014	2	4	Abril	18	Viernes	5	f
20140419	2014-04-19	2014	2	4	Abril	19	Sábado	6	t
20140420	2014-04-20	2014	2	4	Abril	20	Domingo	7	t
20140421	2014-04-21	2014	2	4	Abril	21	Lunes	1	f
20140422	2014-04-22	2014	2	4	Abril	22	Martes	2	f
20140423	2014-04-23	2014	2	4	Abril	23	Miércoles	3	f
20140424	2014-04-24	2014	2	4	Abril	24	Jueves	4	f
20140425	2014-04-25	2014	2	4	Abril	25	Viernes	5	f
20140426	2014-04-26	2014	2	4	Abril	26	Sábado	6	t
20140427	2014-04-27	2014	2	4	Abril	27	Domingo	7	t
20140428	2014-04-28	2014	2	4	Abril	28	Lunes	1	f
20140429	2014-04-29	2014	2	4	Abril	29	Martes	2	f
20140430	2014-04-30	2014	2	4	Abril	30	Miércoles	3	f
20140501	2014-05-01	2014	2	5	Mayo	1	Jueves	4	f
20140502	2014-05-02	2014	2	5	Mayo	2	Viernes	5	f
20140503	2014-05-03	2014	2	5	Mayo	3	Sábado	6	t
20140504	2014-05-04	2014	2	5	Mayo	4	Domingo	7	t
20140505	2014-05-05	2014	2	5	Mayo	5	Lunes	1	f
20140506	2014-05-06	2014	2	5	Mayo	6	Martes	2	f
20140507	2014-05-07	2014	2	5	Mayo	7	Miércoles	3	f
20140508	2014-05-08	2014	2	5	Mayo	8	Jueves	4	f
20140509	2014-05-09	2014	2	5	Mayo	9	Viernes	5	f
20140510	2014-05-10	2014	2	5	Mayo	10	Sábado	6	t
20140511	2014-05-11	2014	2	5	Mayo	11	Domingo	7	t
20140512	2014-05-12	2014	2	5	Mayo	12	Lunes	1	f
20140513	2014-05-13	2014	2	5	Mayo	13	Martes	2	f
20140514	2014-05-14	2014	2	5	Mayo	14	Miércoles	3	f
20140515	2014-05-15	2014	2	5	Mayo	15	Jueves	4	f
20140516	2014-05-16	2014	2	5	Mayo	16	Viernes	5	f
20140517	2014-05-17	2014	2	5	Mayo	17	Sábado	6	t
20140518	2014-05-18	2014	2	5	Mayo	18	Domingo	7	t
20140519	2014-05-19	2014	2	5	Mayo	19	Lunes	1	f
20140520	2014-05-20	2014	2	5	Mayo	20	Martes	2	f
20140521	2014-05-21	2014	2	5	Mayo	21	Miércoles	3	f
20140522	2014-05-22	2014	2	5	Mayo	22	Jueves	4	f
20140523	2014-05-23	2014	2	5	Mayo	23	Viernes	5	f
20140524	2014-05-24	2014	2	5	Mayo	24	Sábado	6	t
20140525	2014-05-25	2014	2	5	Mayo	25	Domingo	7	t
20140526	2014-05-26	2014	2	5	Mayo	26	Lunes	1	f
20140527	2014-05-27	2014	2	5	Mayo	27	Martes	2	f
20140528	2014-05-28	2014	2	5	Mayo	28	Miércoles	3	f
20140529	2014-05-29	2014	2	5	Mayo	29	Jueves	4	f
20140530	2014-05-30	2014	2	5	Mayo	30	Viernes	5	f
20140531	2014-05-31	2014	2	5	Mayo	31	Sábado	6	t
20140601	2014-06-01	2014	2	6	Junio	1	Domingo	7	t
20140602	2014-06-02	2014	2	6	Junio	2	Lunes	1	f
20140603	2014-06-03	2014	2	6	Junio	3	Martes	2	f
20140604	2014-06-04	2014	2	6	Junio	4	Miércoles	3	f
20140605	2014-06-05	2014	2	6	Junio	5	Jueves	4	f
20140606	2014-06-06	2014	2	6	Junio	6	Viernes	5	f
20140607	2014-06-07	2014	2	6	Junio	7	Sábado	6	t
20140608	2014-06-08	2014	2	6	Junio	8	Domingo	7	t
20140609	2014-06-09	2014	2	6	Junio	9	Lunes	1	f
20140610	2014-06-10	2014	2	6	Junio	10	Martes	2	f
20140611	2014-06-11	2014	2	6	Junio	11	Miércoles	3	f
20140612	2014-06-12	2014	2	6	Junio	12	Jueves	4	f
20140613	2014-06-13	2014	2	6	Junio	13	Viernes	5	f
20140614	2014-06-14	2014	2	6	Junio	14	Sábado	6	t
20140615	2014-06-15	2014	2	6	Junio	15	Domingo	7	t
20140616	2014-06-16	2014	2	6	Junio	16	Lunes	1	f
20140617	2014-06-17	2014	2	6	Junio	17	Martes	2	f
20140618	2014-06-18	2014	2	6	Junio	18	Miércoles	3	f
20140619	2014-06-19	2014	2	6	Junio	19	Jueves	4	f
20140620	2014-06-20	2014	2	6	Junio	20	Viernes	5	f
20140621	2014-06-21	2014	2	6	Junio	21	Sábado	6	t
20140622	2014-06-22	2014	2	6	Junio	22	Domingo	7	t
20140623	2014-06-23	2014	2	6	Junio	23	Lunes	1	f
20140624	2014-06-24	2014	2	6	Junio	24	Martes	2	f
20140625	2014-06-25	2014	2	6	Junio	25	Miércoles	3	f
20140626	2014-06-26	2014	2	6	Junio	26	Jueves	4	f
20140627	2014-06-27	2014	2	6	Junio	27	Viernes	5	f
20140628	2014-06-28	2014	2	6	Junio	28	Sábado	6	t
20140629	2014-06-29	2014	2	6	Junio	29	Domingo	7	t
20140630	2014-06-30	2014	2	6	Junio	30	Lunes	1	f
20140701	2014-07-01	2014	3	7	Julio	1	Martes	2	f
20140702	2014-07-02	2014	3	7	Julio	2	Miércoles	3	f
20140703	2014-07-03	2014	3	7	Julio	3	Jueves	4	f
20140704	2014-07-04	2014	3	7	Julio	4	Viernes	5	f
20140705	2014-07-05	2014	3	7	Julio	5	Sábado	6	t
20140706	2014-07-06	2014	3	7	Julio	6	Domingo	7	t
20140707	2014-07-07	2014	3	7	Julio	7	Lunes	1	f
20140708	2014-07-08	2014	3	7	Julio	8	Martes	2	f
20140709	2014-07-09	2014	3	7	Julio	9	Miércoles	3	f
20140710	2014-07-10	2014	3	7	Julio	10	Jueves	4	f
20140711	2014-07-11	2014	3	7	Julio	11	Viernes	5	f
20140712	2014-07-12	2014	3	7	Julio	12	Sábado	6	t
20140713	2014-07-13	2014	3	7	Julio	13	Domingo	7	t
20140714	2014-07-14	2014	3	7	Julio	14	Lunes	1	f
20140715	2014-07-15	2014	3	7	Julio	15	Martes	2	f
20140716	2014-07-16	2014	3	7	Julio	16	Miércoles	3	f
20140717	2014-07-17	2014	3	7	Julio	17	Jueves	4	f
20140718	2014-07-18	2014	3	7	Julio	18	Viernes	5	f
20140719	2014-07-19	2014	3	7	Julio	19	Sábado	6	t
20140720	2014-07-20	2014	3	7	Julio	20	Domingo	7	t
20140721	2014-07-21	2014	3	7	Julio	21	Lunes	1	f
20140722	2014-07-22	2014	3	7	Julio	22	Martes	2	f
20140723	2014-07-23	2014	3	7	Julio	23	Miércoles	3	f
20140724	2014-07-24	2014	3	7	Julio	24	Jueves	4	f
20140725	2014-07-25	2014	3	7	Julio	25	Viernes	5	f
20140726	2014-07-26	2014	3	7	Julio	26	Sábado	6	t
20140727	2014-07-27	2014	3	7	Julio	27	Domingo	7	t
20140728	2014-07-28	2014	3	7	Julio	28	Lunes	1	f
20140729	2014-07-29	2014	3	7	Julio	29	Martes	2	f
20140730	2014-07-30	2014	3	7	Julio	30	Miércoles	3	f
20140731	2014-07-31	2014	3	7	Julio	31	Jueves	4	f
20140801	2014-08-01	2014	3	8	Agosto	1	Viernes	5	f
20140802	2014-08-02	2014	3	8	Agosto	2	Sábado	6	t
20140803	2014-08-03	2014	3	8	Agosto	3	Domingo	7	t
20140804	2014-08-04	2014	3	8	Agosto	4	Lunes	1	f
20140805	2014-08-05	2014	3	8	Agosto	5	Martes	2	f
20140806	2014-08-06	2014	3	8	Agosto	6	Miércoles	3	f
20140807	2014-08-07	2014	3	8	Agosto	7	Jueves	4	f
20140808	2014-08-08	2014	3	8	Agosto	8	Viernes	5	f
20140809	2014-08-09	2014	3	8	Agosto	9	Sábado	6	t
20140810	2014-08-10	2014	3	8	Agosto	10	Domingo	7	t
20140811	2014-08-11	2014	3	8	Agosto	11	Lunes	1	f
20140812	2014-08-12	2014	3	8	Agosto	12	Martes	2	f
20140813	2014-08-13	2014	3	8	Agosto	13	Miércoles	3	f
20140814	2014-08-14	2014	3	8	Agosto	14	Jueves	4	f
20140815	2014-08-15	2014	3	8	Agosto	15	Viernes	5	f
20140816	2014-08-16	2014	3	8	Agosto	16	Sábado	6	t
20140817	2014-08-17	2014	3	8	Agosto	17	Domingo	7	t
20140818	2014-08-18	2014	3	8	Agosto	18	Lunes	1	f
20140819	2014-08-19	2014	3	8	Agosto	19	Martes	2	f
20140820	2014-08-20	2014	3	8	Agosto	20	Miércoles	3	f
20140821	2014-08-21	2014	3	8	Agosto	21	Jueves	4	f
20140822	2014-08-22	2014	3	8	Agosto	22	Viernes	5	f
20140823	2014-08-23	2014	3	8	Agosto	23	Sábado	6	t
20140824	2014-08-24	2014	3	8	Agosto	24	Domingo	7	t
20140825	2014-08-25	2014	3	8	Agosto	25	Lunes	1	f
20140826	2014-08-26	2014	3	8	Agosto	26	Martes	2	f
20140827	2014-08-27	2014	3	8	Agosto	27	Miércoles	3	f
20140828	2014-08-28	2014	3	8	Agosto	28	Jueves	4	f
20140829	2014-08-29	2014	3	8	Agosto	29	Viernes	5	f
20140830	2014-08-30	2014	3	8	Agosto	30	Sábado	6	t
20140831	2014-08-31	2014	3	8	Agosto	31	Domingo	7	t
20140901	2014-09-01	2014	3	9	Septiembre	1	Lunes	1	f
20140902	2014-09-02	2014	3	9	Septiembre	2	Martes	2	f
20140903	2014-09-03	2014	3	9	Septiembre	3	Miércoles	3	f
20140904	2014-09-04	2014	3	9	Septiembre	4	Jueves	4	f
20140905	2014-09-05	2014	3	9	Septiembre	5	Viernes	5	f
20140906	2014-09-06	2014	3	9	Septiembre	6	Sábado	6	t
20140907	2014-09-07	2014	3	9	Septiembre	7	Domingo	7	t
20140908	2014-09-08	2014	3	9	Septiembre	8	Lunes	1	f
20140909	2014-09-09	2014	3	9	Septiembre	9	Martes	2	f
20140910	2014-09-10	2014	3	9	Septiembre	10	Miércoles	3	f
20140911	2014-09-11	2014	3	9	Septiembre	11	Jueves	4	f
20140912	2014-09-12	2014	3	9	Septiembre	12	Viernes	5	f
20140913	2014-09-13	2014	3	9	Septiembre	13	Sábado	6	t
20140914	2014-09-14	2014	3	9	Septiembre	14	Domingo	7	t
20140915	2014-09-15	2014	3	9	Septiembre	15	Lunes	1	f
20140916	2014-09-16	2014	3	9	Septiembre	16	Martes	2	f
20140917	2014-09-17	2014	3	9	Septiembre	17	Miércoles	3	f
20140918	2014-09-18	2014	3	9	Septiembre	18	Jueves	4	f
20140919	2014-09-19	2014	3	9	Septiembre	19	Viernes	5	f
20140920	2014-09-20	2014	3	9	Septiembre	20	Sábado	6	t
20140921	2014-09-21	2014	3	9	Septiembre	21	Domingo	7	t
20140922	2014-09-22	2014	3	9	Septiembre	22	Lunes	1	f
20140923	2014-09-23	2014	3	9	Septiembre	23	Martes	2	f
20140924	2014-09-24	2014	3	9	Septiembre	24	Miércoles	3	f
20140925	2014-09-25	2014	3	9	Septiembre	25	Jueves	4	f
20140926	2014-09-26	2014	3	9	Septiembre	26	Viernes	5	f
20140927	2014-09-27	2014	3	9	Septiembre	27	Sábado	6	t
20140928	2014-09-28	2014	3	9	Septiembre	28	Domingo	7	t
20140929	2014-09-29	2014	3	9	Septiembre	29	Lunes	1	f
20140930	2014-09-30	2014	3	9	Septiembre	30	Martes	2	f
20141001	2014-10-01	2014	4	10	Octubre	1	Miércoles	3	f
20141002	2014-10-02	2014	4	10	Octubre	2	Jueves	4	f
20141003	2014-10-03	2014	4	10	Octubre	3	Viernes	5	f
20141004	2014-10-04	2014	4	10	Octubre	4	Sábado	6	t
20141005	2014-10-05	2014	4	10	Octubre	5	Domingo	7	t
20141006	2014-10-06	2014	4	10	Octubre	6	Lunes	1	f
20141007	2014-10-07	2014	4	10	Octubre	7	Martes	2	f
20141008	2014-10-08	2014	4	10	Octubre	8	Miércoles	3	f
20141009	2014-10-09	2014	4	10	Octubre	9	Jueves	4	f
20141010	2014-10-10	2014	4	10	Octubre	10	Viernes	5	f
20141011	2014-10-11	2014	4	10	Octubre	11	Sábado	6	t
20141012	2014-10-12	2014	4	10	Octubre	12	Domingo	7	t
20141013	2014-10-13	2014	4	10	Octubre	13	Lunes	1	f
20141014	2014-10-14	2014	4	10	Octubre	14	Martes	2	f
20141015	2014-10-15	2014	4	10	Octubre	15	Miércoles	3	f
20141016	2014-10-16	2014	4	10	Octubre	16	Jueves	4	f
20141017	2014-10-17	2014	4	10	Octubre	17	Viernes	5	f
20141018	2014-10-18	2014	4	10	Octubre	18	Sábado	6	t
20141019	2014-10-19	2014	4	10	Octubre	19	Domingo	7	t
20141020	2014-10-20	2014	4	10	Octubre	20	Lunes	1	f
20141021	2014-10-21	2014	4	10	Octubre	21	Martes	2	f
20141022	2014-10-22	2014	4	10	Octubre	22	Miércoles	3	f
20141023	2014-10-23	2014	4	10	Octubre	23	Jueves	4	f
20141024	2014-10-24	2014	4	10	Octubre	24	Viernes	5	f
20141025	2014-10-25	2014	4	10	Octubre	25	Sábado	6	t
20141026	2014-10-26	2014	4	10	Octubre	26	Domingo	7	t
20141027	2014-10-27	2014	4	10	Octubre	27	Lunes	1	f
20141028	2014-10-28	2014	4	10	Octubre	28	Martes	2	f
20141029	2014-10-29	2014	4	10	Octubre	29	Miércoles	3	f
20141030	2014-10-30	2014	4	10	Octubre	30	Jueves	4	f
20141031	2014-10-31	2014	4	10	Octubre	31	Viernes	5	f
20141101	2014-11-01	2014	4	11	Noviembre	1	Sábado	6	t
20141102	2014-11-02	2014	4	11	Noviembre	2	Domingo	7	t
20141103	2014-11-03	2014	4	11	Noviembre	3	Lunes	1	f
20141104	2014-11-04	2014	4	11	Noviembre	4	Martes	2	f
20141105	2014-11-05	2014	4	11	Noviembre	5	Miércoles	3	f
20141106	2014-11-06	2014	4	11	Noviembre	6	Jueves	4	f
20141107	2014-11-07	2014	4	11	Noviembre	7	Viernes	5	f
20141108	2014-11-08	2014	4	11	Noviembre	8	Sábado	6	t
20141109	2014-11-09	2014	4	11	Noviembre	9	Domingo	7	t
20141110	2014-11-10	2014	4	11	Noviembre	10	Lunes	1	f
20141111	2014-11-11	2014	4	11	Noviembre	11	Martes	2	f
20141112	2014-11-12	2014	4	11	Noviembre	12	Miércoles	3	f
20141113	2014-11-13	2014	4	11	Noviembre	13	Jueves	4	f
20141114	2014-11-14	2014	4	11	Noviembre	14	Viernes	5	f
20141115	2014-11-15	2014	4	11	Noviembre	15	Sábado	6	t
20141116	2014-11-16	2014	4	11	Noviembre	16	Domingo	7	t
20141117	2014-11-17	2014	4	11	Noviembre	17	Lunes	1	f
20141118	2014-11-18	2014	4	11	Noviembre	18	Martes	2	f
20141119	2014-11-19	2014	4	11	Noviembre	19	Miércoles	3	f
20141120	2014-11-20	2014	4	11	Noviembre	20	Jueves	4	f
20141121	2014-11-21	2014	4	11	Noviembre	21	Viernes	5	f
20141122	2014-11-22	2014	4	11	Noviembre	22	Sábado	6	t
20141123	2014-11-23	2014	4	11	Noviembre	23	Domingo	7	t
20141124	2014-11-24	2014	4	11	Noviembre	24	Lunes	1	f
20141125	2014-11-25	2014	4	11	Noviembre	25	Martes	2	f
20141126	2014-11-26	2014	4	11	Noviembre	26	Miércoles	3	f
20141127	2014-11-27	2014	4	11	Noviembre	27	Jueves	4	f
20141128	2014-11-28	2014	4	11	Noviembre	28	Viernes	5	f
20141129	2014-11-29	2014	4	11	Noviembre	29	Sábado	6	t
20141130	2014-11-30	2014	4	11	Noviembre	30	Domingo	7	t
20141201	2014-12-01	2014	4	12	Diciembre	1	Lunes	1	f
20141202	2014-12-02	2014	4	12	Diciembre	2	Martes	2	f
20141203	2014-12-03	2014	4	12	Diciembre	3	Miércoles	3	f
20141204	2014-12-04	2014	4	12	Diciembre	4	Jueves	4	f
20141205	2014-12-05	2014	4	12	Diciembre	5	Viernes	5	f
20141206	2014-12-06	2014	4	12	Diciembre	6	Sábado	6	t
20141207	2014-12-07	2014	4	12	Diciembre	7	Domingo	7	t
20141208	2014-12-08	2014	4	12	Diciembre	8	Lunes	1	f
20141209	2014-12-09	2014	4	12	Diciembre	9	Martes	2	f
20141210	2014-12-10	2014	4	12	Diciembre	10	Miércoles	3	f
20141211	2014-12-11	2014	4	12	Diciembre	11	Jueves	4	f
20141212	2014-12-12	2014	4	12	Diciembre	12	Viernes	5	f
20141213	2014-12-13	2014	4	12	Diciembre	13	Sábado	6	t
20141214	2014-12-14	2014	4	12	Diciembre	14	Domingo	7	t
20141215	2014-12-15	2014	4	12	Diciembre	15	Lunes	1	f
20141216	2014-12-16	2014	4	12	Diciembre	16	Martes	2	f
20141217	2014-12-17	2014	4	12	Diciembre	17	Miércoles	3	f
20141218	2014-12-18	2014	4	12	Diciembre	18	Jueves	4	f
20141219	2014-12-19	2014	4	12	Diciembre	19	Viernes	5	f
20141220	2014-12-20	2014	4	12	Diciembre	20	Sábado	6	t
20141221	2014-12-21	2014	4	12	Diciembre	21	Domingo	7	t
20141222	2014-12-22	2014	4	12	Diciembre	22	Lunes	1	f
20141223	2014-12-23	2014	4	12	Diciembre	23	Martes	2	f
20141224	2014-12-24	2014	4	12	Diciembre	24	Miércoles	3	f
20141225	2014-12-25	2014	4	12	Diciembre	25	Jueves	4	f
20141226	2014-12-26	2014	4	12	Diciembre	26	Viernes	5	f
20141227	2014-12-27	2014	4	12	Diciembre	27	Sábado	6	t
20141228	2014-12-28	2014	4	12	Diciembre	28	Domingo	7	t
20141229	2014-12-29	2014	4	12	Diciembre	29	Lunes	1	f
20141230	2014-12-30	2014	4	12	Diciembre	30	Martes	2	f
20141231	2014-12-31	2014	4	12	Diciembre	31	Miércoles	3	f
20150101	2015-01-01	2015	1	1	Enero	1	Jueves	4	f
20150102	2015-01-02	2015	1	1	Enero	2	Viernes	5	f
20150103	2015-01-03	2015	1	1	Enero	3	Sábado	6	t
20150104	2015-01-04	2015	1	1	Enero	4	Domingo	7	t
20150105	2015-01-05	2015	1	1	Enero	5	Lunes	1	f
20150106	2015-01-06	2015	1	1	Enero	6	Martes	2	f
20150107	2015-01-07	2015	1	1	Enero	7	Miércoles	3	f
20150108	2015-01-08	2015	1	1	Enero	8	Jueves	4	f
20150109	2015-01-09	2015	1	1	Enero	9	Viernes	5	f
20150110	2015-01-10	2015	1	1	Enero	10	Sábado	6	t
20150111	2015-01-11	2015	1	1	Enero	11	Domingo	7	t
20150112	2015-01-12	2015	1	1	Enero	12	Lunes	1	f
20150113	2015-01-13	2015	1	1	Enero	13	Martes	2	f
20150114	2015-01-14	2015	1	1	Enero	14	Miércoles	3	f
20150115	2015-01-15	2015	1	1	Enero	15	Jueves	4	f
20150116	2015-01-16	2015	1	1	Enero	16	Viernes	5	f
20150117	2015-01-17	2015	1	1	Enero	17	Sábado	6	t
20150118	2015-01-18	2015	1	1	Enero	18	Domingo	7	t
20150119	2015-01-19	2015	1	1	Enero	19	Lunes	1	f
20150120	2015-01-20	2015	1	1	Enero	20	Martes	2	f
20150121	2015-01-21	2015	1	1	Enero	21	Miércoles	3	f
20150122	2015-01-22	2015	1	1	Enero	22	Jueves	4	f
20150123	2015-01-23	2015	1	1	Enero	23	Viernes	5	f
20150124	2015-01-24	2015	1	1	Enero	24	Sábado	6	t
20150125	2015-01-25	2015	1	1	Enero	25	Domingo	7	t
20150126	2015-01-26	2015	1	1	Enero	26	Lunes	1	f
20150127	2015-01-27	2015	1	1	Enero	27	Martes	2	f
20150128	2015-01-28	2015	1	1	Enero	28	Miércoles	3	f
20150129	2015-01-29	2015	1	1	Enero	29	Jueves	4	f
20150130	2015-01-30	2015	1	1	Enero	30	Viernes	5	f
20150131	2015-01-31	2015	1	1	Enero	31	Sábado	6	t
20150201	2015-02-01	2015	1	2	Febrero	1	Domingo	7	t
20150202	2015-02-02	2015	1	2	Febrero	2	Lunes	1	f
20150203	2015-02-03	2015	1	2	Febrero	3	Martes	2	f
20150204	2015-02-04	2015	1	2	Febrero	4	Miércoles	3	f
20150205	2015-02-05	2015	1	2	Febrero	5	Jueves	4	f
20150206	2015-02-06	2015	1	2	Febrero	6	Viernes	5	f
20150207	2015-02-07	2015	1	2	Febrero	7	Sábado	6	t
20150208	2015-02-08	2015	1	2	Febrero	8	Domingo	7	t
20150209	2015-02-09	2015	1	2	Febrero	9	Lunes	1	f
20150210	2015-02-10	2015	1	2	Febrero	10	Martes	2	f
20150211	2015-02-11	2015	1	2	Febrero	11	Miércoles	3	f
20150212	2015-02-12	2015	1	2	Febrero	12	Jueves	4	f
20150213	2015-02-13	2015	1	2	Febrero	13	Viernes	5	f
20150214	2015-02-14	2015	1	2	Febrero	14	Sábado	6	t
20150215	2015-02-15	2015	1	2	Febrero	15	Domingo	7	t
20150216	2015-02-16	2015	1	2	Febrero	16	Lunes	1	f
20150217	2015-02-17	2015	1	2	Febrero	17	Martes	2	f
20150218	2015-02-18	2015	1	2	Febrero	18	Miércoles	3	f
20150219	2015-02-19	2015	1	2	Febrero	19	Jueves	4	f
20150220	2015-02-20	2015	1	2	Febrero	20	Viernes	5	f
20150221	2015-02-21	2015	1	2	Febrero	21	Sábado	6	t
20150222	2015-02-22	2015	1	2	Febrero	22	Domingo	7	t
20150223	2015-02-23	2015	1	2	Febrero	23	Lunes	1	f
20150224	2015-02-24	2015	1	2	Febrero	24	Martes	2	f
20150225	2015-02-25	2015	1	2	Febrero	25	Miércoles	3	f
20150226	2015-02-26	2015	1	2	Febrero	26	Jueves	4	f
20150227	2015-02-27	2015	1	2	Febrero	27	Viernes	5	f
20150228	2015-02-28	2015	1	2	Febrero	28	Sábado	6	t
20150301	2015-03-01	2015	1	3	Marzo	1	Domingo	7	t
20150302	2015-03-02	2015	1	3	Marzo	2	Lunes	1	f
20150303	2015-03-03	2015	1	3	Marzo	3	Martes	2	f
20150304	2015-03-04	2015	1	3	Marzo	4	Miércoles	3	f
20150305	2015-03-05	2015	1	3	Marzo	5	Jueves	4	f
20150306	2015-03-06	2015	1	3	Marzo	6	Viernes	5	f
20150307	2015-03-07	2015	1	3	Marzo	7	Sábado	6	t
20150308	2015-03-08	2015	1	3	Marzo	8	Domingo	7	t
20150309	2015-03-09	2015	1	3	Marzo	9	Lunes	1	f
20150310	2015-03-10	2015	1	3	Marzo	10	Martes	2	f
20150311	2015-03-11	2015	1	3	Marzo	11	Miércoles	3	f
20150312	2015-03-12	2015	1	3	Marzo	12	Jueves	4	f
20150313	2015-03-13	2015	1	3	Marzo	13	Viernes	5	f
20150314	2015-03-14	2015	1	3	Marzo	14	Sábado	6	t
20150315	2015-03-15	2015	1	3	Marzo	15	Domingo	7	t
20150316	2015-03-16	2015	1	3	Marzo	16	Lunes	1	f
20150317	2015-03-17	2015	1	3	Marzo	17	Martes	2	f
20150318	2015-03-18	2015	1	3	Marzo	18	Miércoles	3	f
20150319	2015-03-19	2015	1	3	Marzo	19	Jueves	4	f
20150320	2015-03-20	2015	1	3	Marzo	20	Viernes	5	f
20150321	2015-03-21	2015	1	3	Marzo	21	Sábado	6	t
20150322	2015-03-22	2015	1	3	Marzo	22	Domingo	7	t
20150323	2015-03-23	2015	1	3	Marzo	23	Lunes	1	f
20150324	2015-03-24	2015	1	3	Marzo	24	Martes	2	f
20150325	2015-03-25	2015	1	3	Marzo	25	Miércoles	3	f
20150326	2015-03-26	2015	1	3	Marzo	26	Jueves	4	f
20150327	2015-03-27	2015	1	3	Marzo	27	Viernes	5	f
20150328	2015-03-28	2015	1	3	Marzo	28	Sábado	6	t
20150329	2015-03-29	2015	1	3	Marzo	29	Domingo	7	t
20150330	2015-03-30	2015	1	3	Marzo	30	Lunes	1	f
20150331	2015-03-31	2015	1	3	Marzo	31	Martes	2	f
20150401	2015-04-01	2015	2	4	Abril	1	Miércoles	3	f
20150402	2015-04-02	2015	2	4	Abril	2	Jueves	4	f
20150403	2015-04-03	2015	2	4	Abril	3	Viernes	5	f
20150404	2015-04-04	2015	2	4	Abril	4	Sábado	6	t
20150405	2015-04-05	2015	2	4	Abril	5	Domingo	7	t
20150406	2015-04-06	2015	2	4	Abril	6	Lunes	1	f
20150407	2015-04-07	2015	2	4	Abril	7	Martes	2	f
20150408	2015-04-08	2015	2	4	Abril	8	Miércoles	3	f
20150409	2015-04-09	2015	2	4	Abril	9	Jueves	4	f
20150410	2015-04-10	2015	2	4	Abril	10	Viernes	5	f
20150411	2015-04-11	2015	2	4	Abril	11	Sábado	6	t
20150412	2015-04-12	2015	2	4	Abril	12	Domingo	7	t
20150413	2015-04-13	2015	2	4	Abril	13	Lunes	1	f
20150414	2015-04-14	2015	2	4	Abril	14	Martes	2	f
20150415	2015-04-15	2015	2	4	Abril	15	Miércoles	3	f
20150416	2015-04-16	2015	2	4	Abril	16	Jueves	4	f
20150417	2015-04-17	2015	2	4	Abril	17	Viernes	5	f
20150418	2015-04-18	2015	2	4	Abril	18	Sábado	6	t
20150419	2015-04-19	2015	2	4	Abril	19	Domingo	7	t
20150420	2015-04-20	2015	2	4	Abril	20	Lunes	1	f
20150421	2015-04-21	2015	2	4	Abril	21	Martes	2	f
20150422	2015-04-22	2015	2	4	Abril	22	Miércoles	3	f
20150423	2015-04-23	2015	2	4	Abril	23	Jueves	4	f
20150424	2015-04-24	2015	2	4	Abril	24	Viernes	5	f
20150425	2015-04-25	2015	2	4	Abril	25	Sábado	6	t
20150426	2015-04-26	2015	2	4	Abril	26	Domingo	7	t
20150427	2015-04-27	2015	2	4	Abril	27	Lunes	1	f
20150428	2015-04-28	2015	2	4	Abril	28	Martes	2	f
20150429	2015-04-29	2015	2	4	Abril	29	Miércoles	3	f
20150430	2015-04-30	2015	2	4	Abril	30	Jueves	4	f
20150501	2015-05-01	2015	2	5	Mayo	1	Viernes	5	f
20150502	2015-05-02	2015	2	5	Mayo	2	Sábado	6	t
20150503	2015-05-03	2015	2	5	Mayo	3	Domingo	7	t
20150504	2015-05-04	2015	2	5	Mayo	4	Lunes	1	f
20150505	2015-05-05	2015	2	5	Mayo	5	Martes	2	f
20150506	2015-05-06	2015	2	5	Mayo	6	Miércoles	3	f
20150507	2015-05-07	2015	2	5	Mayo	7	Jueves	4	f
20150508	2015-05-08	2015	2	5	Mayo	8	Viernes	5	f
20150509	2015-05-09	2015	2	5	Mayo	9	Sábado	6	t
20150510	2015-05-10	2015	2	5	Mayo	10	Domingo	7	t
20150511	2015-05-11	2015	2	5	Mayo	11	Lunes	1	f
20150512	2015-05-12	2015	2	5	Mayo	12	Martes	2	f
20150513	2015-05-13	2015	2	5	Mayo	13	Miércoles	3	f
20150514	2015-05-14	2015	2	5	Mayo	14	Jueves	4	f
20150515	2015-05-15	2015	2	5	Mayo	15	Viernes	5	f
20150516	2015-05-16	2015	2	5	Mayo	16	Sábado	6	t
20150517	2015-05-17	2015	2	5	Mayo	17	Domingo	7	t
20150518	2015-05-18	2015	2	5	Mayo	18	Lunes	1	f
20150519	2015-05-19	2015	2	5	Mayo	19	Martes	2	f
20150520	2015-05-20	2015	2	5	Mayo	20	Miércoles	3	f
20150521	2015-05-21	2015	2	5	Mayo	21	Jueves	4	f
20150522	2015-05-22	2015	2	5	Mayo	22	Viernes	5	f
20150523	2015-05-23	2015	2	5	Mayo	23	Sábado	6	t
20150524	2015-05-24	2015	2	5	Mayo	24	Domingo	7	t
20150525	2015-05-25	2015	2	5	Mayo	25	Lunes	1	f
20150526	2015-05-26	2015	2	5	Mayo	26	Martes	2	f
20150527	2015-05-27	2015	2	5	Mayo	27	Miércoles	3	f
20150528	2015-05-28	2015	2	5	Mayo	28	Jueves	4	f
20150529	2015-05-29	2015	2	5	Mayo	29	Viernes	5	f
20150530	2015-05-30	2015	2	5	Mayo	30	Sábado	6	t
20150531	2015-05-31	2015	2	5	Mayo	31	Domingo	7	t
20150601	2015-06-01	2015	2	6	Junio	1	Lunes	1	f
20150602	2015-06-02	2015	2	6	Junio	2	Martes	2	f
20150603	2015-06-03	2015	2	6	Junio	3	Miércoles	3	f
20150604	2015-06-04	2015	2	6	Junio	4	Jueves	4	f
20150605	2015-06-05	2015	2	6	Junio	5	Viernes	5	f
20150606	2015-06-06	2015	2	6	Junio	6	Sábado	6	t
20150607	2015-06-07	2015	2	6	Junio	7	Domingo	7	t
20150608	2015-06-08	2015	2	6	Junio	8	Lunes	1	f
20150609	2015-06-09	2015	2	6	Junio	9	Martes	2	f
20150610	2015-06-10	2015	2	6	Junio	10	Miércoles	3	f
20150611	2015-06-11	2015	2	6	Junio	11	Jueves	4	f
20150612	2015-06-12	2015	2	6	Junio	12	Viernes	5	f
20150613	2015-06-13	2015	2	6	Junio	13	Sábado	6	t
20150614	2015-06-14	2015	2	6	Junio	14	Domingo	7	t
20150615	2015-06-15	2015	2	6	Junio	15	Lunes	1	f
20150616	2015-06-16	2015	2	6	Junio	16	Martes	2	f
20150617	2015-06-17	2015	2	6	Junio	17	Miércoles	3	f
20150618	2015-06-18	2015	2	6	Junio	18	Jueves	4	f
20150619	2015-06-19	2015	2	6	Junio	19	Viernes	5	f
20150620	2015-06-20	2015	2	6	Junio	20	Sábado	6	t
20150621	2015-06-21	2015	2	6	Junio	21	Domingo	7	t
20150622	2015-06-22	2015	2	6	Junio	22	Lunes	1	f
20150623	2015-06-23	2015	2	6	Junio	23	Martes	2	f
20150624	2015-06-24	2015	2	6	Junio	24	Miércoles	3	f
20150625	2015-06-25	2015	2	6	Junio	25	Jueves	4	f
20150626	2015-06-26	2015	2	6	Junio	26	Viernes	5	f
20150627	2015-06-27	2015	2	6	Junio	27	Sábado	6	t
20150628	2015-06-28	2015	2	6	Junio	28	Domingo	7	t
20150629	2015-06-29	2015	2	6	Junio	29	Lunes	1	f
20150630	2015-06-30	2015	2	6	Junio	30	Martes	2	f
20150701	2015-07-01	2015	3	7	Julio	1	Miércoles	3	f
20150702	2015-07-02	2015	3	7	Julio	2	Jueves	4	f
20150703	2015-07-03	2015	3	7	Julio	3	Viernes	5	f
20150704	2015-07-04	2015	3	7	Julio	4	Sábado	6	t
20150705	2015-07-05	2015	3	7	Julio	5	Domingo	7	t
20150706	2015-07-06	2015	3	7	Julio	6	Lunes	1	f
20150707	2015-07-07	2015	3	7	Julio	7	Martes	2	f
20150708	2015-07-08	2015	3	7	Julio	8	Miércoles	3	f
20150709	2015-07-09	2015	3	7	Julio	9	Jueves	4	f
20150710	2015-07-10	2015	3	7	Julio	10	Viernes	5	f
20150711	2015-07-11	2015	3	7	Julio	11	Sábado	6	t
20150712	2015-07-12	2015	3	7	Julio	12	Domingo	7	t
20150713	2015-07-13	2015	3	7	Julio	13	Lunes	1	f
20150714	2015-07-14	2015	3	7	Julio	14	Martes	2	f
20150715	2015-07-15	2015	3	7	Julio	15	Miércoles	3	f
20150716	2015-07-16	2015	3	7	Julio	16	Jueves	4	f
20150717	2015-07-17	2015	3	7	Julio	17	Viernes	5	f
20150718	2015-07-18	2015	3	7	Julio	18	Sábado	6	t
20150719	2015-07-19	2015	3	7	Julio	19	Domingo	7	t
20150720	2015-07-20	2015	3	7	Julio	20	Lunes	1	f
20150721	2015-07-21	2015	3	7	Julio	21	Martes	2	f
20150722	2015-07-22	2015	3	7	Julio	22	Miércoles	3	f
20150723	2015-07-23	2015	3	7	Julio	23	Jueves	4	f
20150724	2015-07-24	2015	3	7	Julio	24	Viernes	5	f
20150725	2015-07-25	2015	3	7	Julio	25	Sábado	6	t
20150726	2015-07-26	2015	3	7	Julio	26	Domingo	7	t
20150727	2015-07-27	2015	3	7	Julio	27	Lunes	1	f
20150728	2015-07-28	2015	3	7	Julio	28	Martes	2	f
20150729	2015-07-29	2015	3	7	Julio	29	Miércoles	3	f
20150730	2015-07-30	2015	3	7	Julio	30	Jueves	4	f
20150731	2015-07-31	2015	3	7	Julio	31	Viernes	5	f
20150801	2015-08-01	2015	3	8	Agosto	1	Sábado	6	t
20150802	2015-08-02	2015	3	8	Agosto	2	Domingo	7	t
20150803	2015-08-03	2015	3	8	Agosto	3	Lunes	1	f
20150804	2015-08-04	2015	3	8	Agosto	4	Martes	2	f
20150805	2015-08-05	2015	3	8	Agosto	5	Miércoles	3	f
20150806	2015-08-06	2015	3	8	Agosto	6	Jueves	4	f
20150807	2015-08-07	2015	3	8	Agosto	7	Viernes	5	f
20150808	2015-08-08	2015	3	8	Agosto	8	Sábado	6	t
20150809	2015-08-09	2015	3	8	Agosto	9	Domingo	7	t
20150810	2015-08-10	2015	3	8	Agosto	10	Lunes	1	f
20150811	2015-08-11	2015	3	8	Agosto	11	Martes	2	f
20150812	2015-08-12	2015	3	8	Agosto	12	Miércoles	3	f
20150813	2015-08-13	2015	3	8	Agosto	13	Jueves	4	f
20150814	2015-08-14	2015	3	8	Agosto	14	Viernes	5	f
20150815	2015-08-15	2015	3	8	Agosto	15	Sábado	6	t
20150816	2015-08-16	2015	3	8	Agosto	16	Domingo	7	t
20150817	2015-08-17	2015	3	8	Agosto	17	Lunes	1	f
20150818	2015-08-18	2015	3	8	Agosto	18	Martes	2	f
20150819	2015-08-19	2015	3	8	Agosto	19	Miércoles	3	f
20150820	2015-08-20	2015	3	8	Agosto	20	Jueves	4	f
20150821	2015-08-21	2015	3	8	Agosto	21	Viernes	5	f
20150822	2015-08-22	2015	3	8	Agosto	22	Sábado	6	t
20150823	2015-08-23	2015	3	8	Agosto	23	Domingo	7	t
20150824	2015-08-24	2015	3	8	Agosto	24	Lunes	1	f
20150825	2015-08-25	2015	3	8	Agosto	25	Martes	2	f
20150826	2015-08-26	2015	3	8	Agosto	26	Miércoles	3	f
20150827	2015-08-27	2015	3	8	Agosto	27	Jueves	4	f
20150828	2015-08-28	2015	3	8	Agosto	28	Viernes	5	f
20150829	2015-08-29	2015	3	8	Agosto	29	Sábado	6	t
20150830	2015-08-30	2015	3	8	Agosto	30	Domingo	7	t
20150831	2015-08-31	2015	3	8	Agosto	31	Lunes	1	f
20150901	2015-09-01	2015	3	9	Septiembre	1	Martes	2	f
20150902	2015-09-02	2015	3	9	Septiembre	2	Miércoles	3	f
20150903	2015-09-03	2015	3	9	Septiembre	3	Jueves	4	f
20150904	2015-09-04	2015	3	9	Septiembre	4	Viernes	5	f
20150905	2015-09-05	2015	3	9	Septiembre	5	Sábado	6	t
20150906	2015-09-06	2015	3	9	Septiembre	6	Domingo	7	t
20150907	2015-09-07	2015	3	9	Septiembre	7	Lunes	1	f
20150908	2015-09-08	2015	3	9	Septiembre	8	Martes	2	f
20150909	2015-09-09	2015	3	9	Septiembre	9	Miércoles	3	f
20150910	2015-09-10	2015	3	9	Septiembre	10	Jueves	4	f
20150911	2015-09-11	2015	3	9	Septiembre	11	Viernes	5	f
20150912	2015-09-12	2015	3	9	Septiembre	12	Sábado	6	t
20150913	2015-09-13	2015	3	9	Septiembre	13	Domingo	7	t
20150914	2015-09-14	2015	3	9	Septiembre	14	Lunes	1	f
20150915	2015-09-15	2015	3	9	Septiembre	15	Martes	2	f
20150916	2015-09-16	2015	3	9	Septiembre	16	Miércoles	3	f
20150917	2015-09-17	2015	3	9	Septiembre	17	Jueves	4	f
20150918	2015-09-18	2015	3	9	Septiembre	18	Viernes	5	f
20150919	2015-09-19	2015	3	9	Septiembre	19	Sábado	6	t
20150920	2015-09-20	2015	3	9	Septiembre	20	Domingo	7	t
20150921	2015-09-21	2015	3	9	Septiembre	21	Lunes	1	f
20150922	2015-09-22	2015	3	9	Septiembre	22	Martes	2	f
20150923	2015-09-23	2015	3	9	Septiembre	23	Miércoles	3	f
20150924	2015-09-24	2015	3	9	Septiembre	24	Jueves	4	f
20150925	2015-09-25	2015	3	9	Septiembre	25	Viernes	5	f
20150926	2015-09-26	2015	3	9	Septiembre	26	Sábado	6	t
20150927	2015-09-27	2015	3	9	Septiembre	27	Domingo	7	t
20150928	2015-09-28	2015	3	9	Septiembre	28	Lunes	1	f
20150929	2015-09-29	2015	3	9	Septiembre	29	Martes	2	f
20150930	2015-09-30	2015	3	9	Septiembre	30	Miércoles	3	f
20151001	2015-10-01	2015	4	10	Octubre	1	Jueves	4	f
20151002	2015-10-02	2015	4	10	Octubre	2	Viernes	5	f
20151003	2015-10-03	2015	4	10	Octubre	3	Sábado	6	t
20151004	2015-10-04	2015	4	10	Octubre	4	Domingo	7	t
20151005	2015-10-05	2015	4	10	Octubre	5	Lunes	1	f
20151006	2015-10-06	2015	4	10	Octubre	6	Martes	2	f
20151007	2015-10-07	2015	4	10	Octubre	7	Miércoles	3	f
20151008	2015-10-08	2015	4	10	Octubre	8	Jueves	4	f
20151009	2015-10-09	2015	4	10	Octubre	9	Viernes	5	f
20151010	2015-10-10	2015	4	10	Octubre	10	Sábado	6	t
20151011	2015-10-11	2015	4	10	Octubre	11	Domingo	7	t
20151012	2015-10-12	2015	4	10	Octubre	12	Lunes	1	f
20151013	2015-10-13	2015	4	10	Octubre	13	Martes	2	f
20151014	2015-10-14	2015	4	10	Octubre	14	Miércoles	3	f
20151015	2015-10-15	2015	4	10	Octubre	15	Jueves	4	f
20151016	2015-10-16	2015	4	10	Octubre	16	Viernes	5	f
20151017	2015-10-17	2015	4	10	Octubre	17	Sábado	6	t
20151018	2015-10-18	2015	4	10	Octubre	18	Domingo	7	t
20151019	2015-10-19	2015	4	10	Octubre	19	Lunes	1	f
20151020	2015-10-20	2015	4	10	Octubre	20	Martes	2	f
20151021	2015-10-21	2015	4	10	Octubre	21	Miércoles	3	f
20151022	2015-10-22	2015	4	10	Octubre	22	Jueves	4	f
20151023	2015-10-23	2015	4	10	Octubre	23	Viernes	5	f
20151024	2015-10-24	2015	4	10	Octubre	24	Sábado	6	t
20151025	2015-10-25	2015	4	10	Octubre	25	Domingo	7	t
20151026	2015-10-26	2015	4	10	Octubre	26	Lunes	1	f
20151027	2015-10-27	2015	4	10	Octubre	27	Martes	2	f
20151028	2015-10-28	2015	4	10	Octubre	28	Miércoles	3	f
20151029	2015-10-29	2015	4	10	Octubre	29	Jueves	4	f
20151030	2015-10-30	2015	4	10	Octubre	30	Viernes	5	f
20151031	2015-10-31	2015	4	10	Octubre	31	Sábado	6	t
20151101	2015-11-01	2015	4	11	Noviembre	1	Domingo	7	t
20151102	2015-11-02	2015	4	11	Noviembre	2	Lunes	1	f
20151103	2015-11-03	2015	4	11	Noviembre	3	Martes	2	f
20151104	2015-11-04	2015	4	11	Noviembre	4	Miércoles	3	f
20151105	2015-11-05	2015	4	11	Noviembre	5	Jueves	4	f
20151106	2015-11-06	2015	4	11	Noviembre	6	Viernes	5	f
20151107	2015-11-07	2015	4	11	Noviembre	7	Sábado	6	t
20151108	2015-11-08	2015	4	11	Noviembre	8	Domingo	7	t
20151109	2015-11-09	2015	4	11	Noviembre	9	Lunes	1	f
20151110	2015-11-10	2015	4	11	Noviembre	10	Martes	2	f
20151111	2015-11-11	2015	4	11	Noviembre	11	Miércoles	3	f
20151112	2015-11-12	2015	4	11	Noviembre	12	Jueves	4	f
20151113	2015-11-13	2015	4	11	Noviembre	13	Viernes	5	f
20151114	2015-11-14	2015	4	11	Noviembre	14	Sábado	6	t
20151115	2015-11-15	2015	4	11	Noviembre	15	Domingo	7	t
20151116	2015-11-16	2015	4	11	Noviembre	16	Lunes	1	f
20151117	2015-11-17	2015	4	11	Noviembre	17	Martes	2	f
20151118	2015-11-18	2015	4	11	Noviembre	18	Miércoles	3	f
20151119	2015-11-19	2015	4	11	Noviembre	19	Jueves	4	f
20151120	2015-11-20	2015	4	11	Noviembre	20	Viernes	5	f
20151121	2015-11-21	2015	4	11	Noviembre	21	Sábado	6	t
20151122	2015-11-22	2015	4	11	Noviembre	22	Domingo	7	t
20151123	2015-11-23	2015	4	11	Noviembre	23	Lunes	1	f
20151124	2015-11-24	2015	4	11	Noviembre	24	Martes	2	f
20151125	2015-11-25	2015	4	11	Noviembre	25	Miércoles	3	f
20151126	2015-11-26	2015	4	11	Noviembre	26	Jueves	4	f
20151127	2015-11-27	2015	4	11	Noviembre	27	Viernes	5	f
20151128	2015-11-28	2015	4	11	Noviembre	28	Sábado	6	t
20151129	2015-11-29	2015	4	11	Noviembre	29	Domingo	7	t
20151130	2015-11-30	2015	4	11	Noviembre	30	Lunes	1	f
20151201	2015-12-01	2015	4	12	Diciembre	1	Martes	2	f
20151202	2015-12-02	2015	4	12	Diciembre	2	Miércoles	3	f
20151203	2015-12-03	2015	4	12	Diciembre	3	Jueves	4	f
20151204	2015-12-04	2015	4	12	Diciembre	4	Viernes	5	f
20151205	2015-12-05	2015	4	12	Diciembre	5	Sábado	6	t
20151206	2015-12-06	2015	4	12	Diciembre	6	Domingo	7	t
20151207	2015-12-07	2015	4	12	Diciembre	7	Lunes	1	f
20151208	2015-12-08	2015	4	12	Diciembre	8	Martes	2	f
20151209	2015-12-09	2015	4	12	Diciembre	9	Miércoles	3	f
20151210	2015-12-10	2015	4	12	Diciembre	10	Jueves	4	f
20151211	2015-12-11	2015	4	12	Diciembre	11	Viernes	5	f
20151212	2015-12-12	2015	4	12	Diciembre	12	Sábado	6	t
20151213	2015-12-13	2015	4	12	Diciembre	13	Domingo	7	t
20151214	2015-12-14	2015	4	12	Diciembre	14	Lunes	1	f
20151215	2015-12-15	2015	4	12	Diciembre	15	Martes	2	f
20151216	2015-12-16	2015	4	12	Diciembre	16	Miércoles	3	f
20151217	2015-12-17	2015	4	12	Diciembre	17	Jueves	4	f
20151218	2015-12-18	2015	4	12	Diciembre	18	Viernes	5	f
20151219	2015-12-19	2015	4	12	Diciembre	19	Sábado	6	t
20151220	2015-12-20	2015	4	12	Diciembre	20	Domingo	7	t
20151221	2015-12-21	2015	4	12	Diciembre	21	Lunes	1	f
20151222	2015-12-22	2015	4	12	Diciembre	22	Martes	2	f
20151223	2015-12-23	2015	4	12	Diciembre	23	Miércoles	3	f
20151224	2015-12-24	2015	4	12	Diciembre	24	Jueves	4	f
20151225	2015-12-25	2015	4	12	Diciembre	25	Viernes	5	f
20151226	2015-12-26	2015	4	12	Diciembre	26	Sábado	6	t
20151227	2015-12-27	2015	4	12	Diciembre	27	Domingo	7	t
20151228	2015-12-28	2015	4	12	Diciembre	28	Lunes	1	f
20151229	2015-12-29	2015	4	12	Diciembre	29	Martes	2	f
20151230	2015-12-30	2015	4	12	Diciembre	30	Miércoles	3	f
20151231	2015-12-31	2015	4	12	Diciembre	31	Jueves	4	f
20160101	2016-01-01	2016	1	1	Enero	1	Viernes	5	f
20160102	2016-01-02	2016	1	1	Enero	2	Sábado	6	t
20160103	2016-01-03	2016	1	1	Enero	3	Domingo	7	t
20160104	2016-01-04	2016	1	1	Enero	4	Lunes	1	f
20160105	2016-01-05	2016	1	1	Enero	5	Martes	2	f
20160106	2016-01-06	2016	1	1	Enero	6	Miércoles	3	f
20160107	2016-01-07	2016	1	1	Enero	7	Jueves	4	f
20160108	2016-01-08	2016	1	1	Enero	8	Viernes	5	f
20160109	2016-01-09	2016	1	1	Enero	9	Sábado	6	t
20160110	2016-01-10	2016	1	1	Enero	10	Domingo	7	t
20160111	2016-01-11	2016	1	1	Enero	11	Lunes	1	f
20160112	2016-01-12	2016	1	1	Enero	12	Martes	2	f
20160113	2016-01-13	2016	1	1	Enero	13	Miércoles	3	f
20160114	2016-01-14	2016	1	1	Enero	14	Jueves	4	f
20160115	2016-01-15	2016	1	1	Enero	15	Viernes	5	f
20160116	2016-01-16	2016	1	1	Enero	16	Sábado	6	t
20160117	2016-01-17	2016	1	1	Enero	17	Domingo	7	t
20160118	2016-01-18	2016	1	1	Enero	18	Lunes	1	f
20160119	2016-01-19	2016	1	1	Enero	19	Martes	2	f
20160120	2016-01-20	2016	1	1	Enero	20	Miércoles	3	f
20160121	2016-01-21	2016	1	1	Enero	21	Jueves	4	f
20160122	2016-01-22	2016	1	1	Enero	22	Viernes	5	f
20160123	2016-01-23	2016	1	1	Enero	23	Sábado	6	t
20160124	2016-01-24	2016	1	1	Enero	24	Domingo	7	t
20160125	2016-01-25	2016	1	1	Enero	25	Lunes	1	f
20160126	2016-01-26	2016	1	1	Enero	26	Martes	2	f
20160127	2016-01-27	2016	1	1	Enero	27	Miércoles	3	f
20160128	2016-01-28	2016	1	1	Enero	28	Jueves	4	f
20160129	2016-01-29	2016	1	1	Enero	29	Viernes	5	f
20160130	2016-01-30	2016	1	1	Enero	30	Sábado	6	t
20160131	2016-01-31	2016	1	1	Enero	31	Domingo	7	t
20160201	2016-02-01	2016	1	2	Febrero	1	Lunes	1	f
20160202	2016-02-02	2016	1	2	Febrero	2	Martes	2	f
20160203	2016-02-03	2016	1	2	Febrero	3	Miércoles	3	f
20160204	2016-02-04	2016	1	2	Febrero	4	Jueves	4	f
20160205	2016-02-05	2016	1	2	Febrero	5	Viernes	5	f
20160206	2016-02-06	2016	1	2	Febrero	6	Sábado	6	t
20160207	2016-02-07	2016	1	2	Febrero	7	Domingo	7	t
20160208	2016-02-08	2016	1	2	Febrero	8	Lunes	1	f
20160209	2016-02-09	2016	1	2	Febrero	9	Martes	2	f
20160210	2016-02-10	2016	1	2	Febrero	10	Miércoles	3	f
20160211	2016-02-11	2016	1	2	Febrero	11	Jueves	4	f
20160212	2016-02-12	2016	1	2	Febrero	12	Viernes	5	f
20160213	2016-02-13	2016	1	2	Febrero	13	Sábado	6	t
20160214	2016-02-14	2016	1	2	Febrero	14	Domingo	7	t
20160215	2016-02-15	2016	1	2	Febrero	15	Lunes	1	f
20160216	2016-02-16	2016	1	2	Febrero	16	Martes	2	f
20160217	2016-02-17	2016	1	2	Febrero	17	Miércoles	3	f
20160218	2016-02-18	2016	1	2	Febrero	18	Jueves	4	f
20160219	2016-02-19	2016	1	2	Febrero	19	Viernes	5	f
20160220	2016-02-20	2016	1	2	Febrero	20	Sábado	6	t
20160221	2016-02-21	2016	1	2	Febrero	21	Domingo	7	t
20160222	2016-02-22	2016	1	2	Febrero	22	Lunes	1	f
20160223	2016-02-23	2016	1	2	Febrero	23	Martes	2	f
20160224	2016-02-24	2016	1	2	Febrero	24	Miércoles	3	f
20160225	2016-02-25	2016	1	2	Febrero	25	Jueves	4	f
20160226	2016-02-26	2016	1	2	Febrero	26	Viernes	5	f
20160227	2016-02-27	2016	1	2	Febrero	27	Sábado	6	t
20160228	2016-02-28	2016	1	2	Febrero	28	Domingo	7	t
20160229	2016-02-29	2016	1	2	Febrero	29	Lunes	1	f
20160301	2016-03-01	2016	1	3	Marzo	1	Martes	2	f
20160302	2016-03-02	2016	1	3	Marzo	2	Miércoles	3	f
20160303	2016-03-03	2016	1	3	Marzo	3	Jueves	4	f
20160304	2016-03-04	2016	1	3	Marzo	4	Viernes	5	f
20160305	2016-03-05	2016	1	3	Marzo	5	Sábado	6	t
20160306	2016-03-06	2016	1	3	Marzo	6	Domingo	7	t
20160307	2016-03-07	2016	1	3	Marzo	7	Lunes	1	f
20160308	2016-03-08	2016	1	3	Marzo	8	Martes	2	f
20160309	2016-03-09	2016	1	3	Marzo	9	Miércoles	3	f
20160310	2016-03-10	2016	1	3	Marzo	10	Jueves	4	f
20160311	2016-03-11	2016	1	3	Marzo	11	Viernes	5	f
20160312	2016-03-12	2016	1	3	Marzo	12	Sábado	6	t
20160313	2016-03-13	2016	1	3	Marzo	13	Domingo	7	t
20160314	2016-03-14	2016	1	3	Marzo	14	Lunes	1	f
20160315	2016-03-15	2016	1	3	Marzo	15	Martes	2	f
20160316	2016-03-16	2016	1	3	Marzo	16	Miércoles	3	f
20160317	2016-03-17	2016	1	3	Marzo	17	Jueves	4	f
20160318	2016-03-18	2016	1	3	Marzo	18	Viernes	5	f
20160319	2016-03-19	2016	1	3	Marzo	19	Sábado	6	t
20160320	2016-03-20	2016	1	3	Marzo	20	Domingo	7	t
20160321	2016-03-21	2016	1	3	Marzo	21	Lunes	1	f
20160322	2016-03-22	2016	1	3	Marzo	22	Martes	2	f
20160323	2016-03-23	2016	1	3	Marzo	23	Miércoles	3	f
20160324	2016-03-24	2016	1	3	Marzo	24	Jueves	4	f
20160325	2016-03-25	2016	1	3	Marzo	25	Viernes	5	f
20160326	2016-03-26	2016	1	3	Marzo	26	Sábado	6	t
20160327	2016-03-27	2016	1	3	Marzo	27	Domingo	7	t
20160328	2016-03-28	2016	1	3	Marzo	28	Lunes	1	f
20160329	2016-03-29	2016	1	3	Marzo	29	Martes	2	f
20160330	2016-03-30	2016	1	3	Marzo	30	Miércoles	3	f
20160331	2016-03-31	2016	1	3	Marzo	31	Jueves	4	f
20160401	2016-04-01	2016	2	4	Abril	1	Viernes	5	f
20160402	2016-04-02	2016	2	4	Abril	2	Sábado	6	t
20160403	2016-04-03	2016	2	4	Abril	3	Domingo	7	t
20160404	2016-04-04	2016	2	4	Abril	4	Lunes	1	f
20160405	2016-04-05	2016	2	4	Abril	5	Martes	2	f
20160406	2016-04-06	2016	2	4	Abril	6	Miércoles	3	f
20160407	2016-04-07	2016	2	4	Abril	7	Jueves	4	f
20160408	2016-04-08	2016	2	4	Abril	8	Viernes	5	f
20160409	2016-04-09	2016	2	4	Abril	9	Sábado	6	t
20160410	2016-04-10	2016	2	4	Abril	10	Domingo	7	t
20160411	2016-04-11	2016	2	4	Abril	11	Lunes	1	f
20160412	2016-04-12	2016	2	4	Abril	12	Martes	2	f
20160413	2016-04-13	2016	2	4	Abril	13	Miércoles	3	f
20160414	2016-04-14	2016	2	4	Abril	14	Jueves	4	f
20160415	2016-04-15	2016	2	4	Abril	15	Viernes	5	f
20160416	2016-04-16	2016	2	4	Abril	16	Sábado	6	t
20160417	2016-04-17	2016	2	4	Abril	17	Domingo	7	t
20160418	2016-04-18	2016	2	4	Abril	18	Lunes	1	f
20160419	2016-04-19	2016	2	4	Abril	19	Martes	2	f
20160420	2016-04-20	2016	2	4	Abril	20	Miércoles	3	f
20160421	2016-04-21	2016	2	4	Abril	21	Jueves	4	f
20160422	2016-04-22	2016	2	4	Abril	22	Viernes	5	f
20160423	2016-04-23	2016	2	4	Abril	23	Sábado	6	t
20160424	2016-04-24	2016	2	4	Abril	24	Domingo	7	t
20160425	2016-04-25	2016	2	4	Abril	25	Lunes	1	f
20160426	2016-04-26	2016	2	4	Abril	26	Martes	2	f
20160427	2016-04-27	2016	2	4	Abril	27	Miércoles	3	f
20160428	2016-04-28	2016	2	4	Abril	28	Jueves	4	f
20160429	2016-04-29	2016	2	4	Abril	29	Viernes	5	f
20160430	2016-04-30	2016	2	4	Abril	30	Sábado	6	t
20160501	2016-05-01	2016	2	5	Mayo	1	Domingo	7	t
20160502	2016-05-02	2016	2	5	Mayo	2	Lunes	1	f
20160503	2016-05-03	2016	2	5	Mayo	3	Martes	2	f
20160504	2016-05-04	2016	2	5	Mayo	4	Miércoles	3	f
20160505	2016-05-05	2016	2	5	Mayo	5	Jueves	4	f
20160506	2016-05-06	2016	2	5	Mayo	6	Viernes	5	f
20160507	2016-05-07	2016	2	5	Mayo	7	Sábado	6	t
20160508	2016-05-08	2016	2	5	Mayo	8	Domingo	7	t
20160509	2016-05-09	2016	2	5	Mayo	9	Lunes	1	f
20160510	2016-05-10	2016	2	5	Mayo	10	Martes	2	f
20160511	2016-05-11	2016	2	5	Mayo	11	Miércoles	3	f
20160512	2016-05-12	2016	2	5	Mayo	12	Jueves	4	f
20160513	2016-05-13	2016	2	5	Mayo	13	Viernes	5	f
20160514	2016-05-14	2016	2	5	Mayo	14	Sábado	6	t
20160515	2016-05-15	2016	2	5	Mayo	15	Domingo	7	t
20160516	2016-05-16	2016	2	5	Mayo	16	Lunes	1	f
20160517	2016-05-17	2016	2	5	Mayo	17	Martes	2	f
20160518	2016-05-18	2016	2	5	Mayo	18	Miércoles	3	f
20160519	2016-05-19	2016	2	5	Mayo	19	Jueves	4	f
20160520	2016-05-20	2016	2	5	Mayo	20	Viernes	5	f
20160521	2016-05-21	2016	2	5	Mayo	21	Sábado	6	t
20160522	2016-05-22	2016	2	5	Mayo	22	Domingo	7	t
20160523	2016-05-23	2016	2	5	Mayo	23	Lunes	1	f
20160524	2016-05-24	2016	2	5	Mayo	24	Martes	2	f
20160525	2016-05-25	2016	2	5	Mayo	25	Miércoles	3	f
20160526	2016-05-26	2016	2	5	Mayo	26	Jueves	4	f
20160527	2016-05-27	2016	2	5	Mayo	27	Viernes	5	f
20160528	2016-05-28	2016	2	5	Mayo	28	Sábado	6	t
20160529	2016-05-29	2016	2	5	Mayo	29	Domingo	7	t
20160530	2016-05-30	2016	2	5	Mayo	30	Lunes	1	f
20160531	2016-05-31	2016	2	5	Mayo	31	Martes	2	f
20160601	2016-06-01	2016	2	6	Junio	1	Miércoles	3	f
20160602	2016-06-02	2016	2	6	Junio	2	Jueves	4	f
20160603	2016-06-03	2016	2	6	Junio	3	Viernes	5	f
20160604	2016-06-04	2016	2	6	Junio	4	Sábado	6	t
20160605	2016-06-05	2016	2	6	Junio	5	Domingo	7	t
20160606	2016-06-06	2016	2	6	Junio	6	Lunes	1	f
20160607	2016-06-07	2016	2	6	Junio	7	Martes	2	f
20160608	2016-06-08	2016	2	6	Junio	8	Miércoles	3	f
20160609	2016-06-09	2016	2	6	Junio	9	Jueves	4	f
20160610	2016-06-10	2016	2	6	Junio	10	Viernes	5	f
20160611	2016-06-11	2016	2	6	Junio	11	Sábado	6	t
20160612	2016-06-12	2016	2	6	Junio	12	Domingo	7	t
20160613	2016-06-13	2016	2	6	Junio	13	Lunes	1	f
20160614	2016-06-14	2016	2	6	Junio	14	Martes	2	f
20160615	2016-06-15	2016	2	6	Junio	15	Miércoles	3	f
20160616	2016-06-16	2016	2	6	Junio	16	Jueves	4	f
20160617	2016-06-17	2016	2	6	Junio	17	Viernes	5	f
20160618	2016-06-18	2016	2	6	Junio	18	Sábado	6	t
20160619	2016-06-19	2016	2	6	Junio	19	Domingo	7	t
20160620	2016-06-20	2016	2	6	Junio	20	Lunes	1	f
20160621	2016-06-21	2016	2	6	Junio	21	Martes	2	f
20160622	2016-06-22	2016	2	6	Junio	22	Miércoles	3	f
20160623	2016-06-23	2016	2	6	Junio	23	Jueves	4	f
20160624	2016-06-24	2016	2	6	Junio	24	Viernes	5	f
20160625	2016-06-25	2016	2	6	Junio	25	Sábado	6	t
20160626	2016-06-26	2016	2	6	Junio	26	Domingo	7	t
20160627	2016-06-27	2016	2	6	Junio	27	Lunes	1	f
20160628	2016-06-28	2016	2	6	Junio	28	Martes	2	f
20160629	2016-06-29	2016	2	6	Junio	29	Miércoles	3	f
20160630	2016-06-30	2016	2	6	Junio	30	Jueves	4	f
20160701	2016-07-01	2016	3	7	Julio	1	Viernes	5	f
20160702	2016-07-02	2016	3	7	Julio	2	Sábado	6	t
20160703	2016-07-03	2016	3	7	Julio	3	Domingo	7	t
20160704	2016-07-04	2016	3	7	Julio	4	Lunes	1	f
20160705	2016-07-05	2016	3	7	Julio	5	Martes	2	f
20160706	2016-07-06	2016	3	7	Julio	6	Miércoles	3	f
20160707	2016-07-07	2016	3	7	Julio	7	Jueves	4	f
20160708	2016-07-08	2016	3	7	Julio	8	Viernes	5	f
20160709	2016-07-09	2016	3	7	Julio	9	Sábado	6	t
20160710	2016-07-10	2016	3	7	Julio	10	Domingo	7	t
20160711	2016-07-11	2016	3	7	Julio	11	Lunes	1	f
20160712	2016-07-12	2016	3	7	Julio	12	Martes	2	f
20160713	2016-07-13	2016	3	7	Julio	13	Miércoles	3	f
20160714	2016-07-14	2016	3	7	Julio	14	Jueves	4	f
20160715	2016-07-15	2016	3	7	Julio	15	Viernes	5	f
20160716	2016-07-16	2016	3	7	Julio	16	Sábado	6	t
20160717	2016-07-17	2016	3	7	Julio	17	Domingo	7	t
20160718	2016-07-18	2016	3	7	Julio	18	Lunes	1	f
20160719	2016-07-19	2016	3	7	Julio	19	Martes	2	f
20160720	2016-07-20	2016	3	7	Julio	20	Miércoles	3	f
20160721	2016-07-21	2016	3	7	Julio	21	Jueves	4	f
20160722	2016-07-22	2016	3	7	Julio	22	Viernes	5	f
20160723	2016-07-23	2016	3	7	Julio	23	Sábado	6	t
20160724	2016-07-24	2016	3	7	Julio	24	Domingo	7	t
20160725	2016-07-25	2016	3	7	Julio	25	Lunes	1	f
20160726	2016-07-26	2016	3	7	Julio	26	Martes	2	f
20160727	2016-07-27	2016	3	7	Julio	27	Miércoles	3	f
20160728	2016-07-28	2016	3	7	Julio	28	Jueves	4	f
20160729	2016-07-29	2016	3	7	Julio	29	Viernes	5	f
20160730	2016-07-30	2016	3	7	Julio	30	Sábado	6	t
20160731	2016-07-31	2016	3	7	Julio	31	Domingo	7	t
20160801	2016-08-01	2016	3	8	Agosto	1	Lunes	1	f
20160802	2016-08-02	2016	3	8	Agosto	2	Martes	2	f
20160803	2016-08-03	2016	3	8	Agosto	3	Miércoles	3	f
20160804	2016-08-04	2016	3	8	Agosto	4	Jueves	4	f
20160805	2016-08-05	2016	3	8	Agosto	5	Viernes	5	f
20160806	2016-08-06	2016	3	8	Agosto	6	Sábado	6	t
20160807	2016-08-07	2016	3	8	Agosto	7	Domingo	7	t
20160808	2016-08-08	2016	3	8	Agosto	8	Lunes	1	f
20160809	2016-08-09	2016	3	8	Agosto	9	Martes	2	f
20160810	2016-08-10	2016	3	8	Agosto	10	Miércoles	3	f
20160811	2016-08-11	2016	3	8	Agosto	11	Jueves	4	f
20160812	2016-08-12	2016	3	8	Agosto	12	Viernes	5	f
20160813	2016-08-13	2016	3	8	Agosto	13	Sábado	6	t
20160814	2016-08-14	2016	3	8	Agosto	14	Domingo	7	t
20160815	2016-08-15	2016	3	8	Agosto	15	Lunes	1	f
20160816	2016-08-16	2016	3	8	Agosto	16	Martes	2	f
20160817	2016-08-17	2016	3	8	Agosto	17	Miércoles	3	f
20160818	2016-08-18	2016	3	8	Agosto	18	Jueves	4	f
20160819	2016-08-19	2016	3	8	Agosto	19	Viernes	5	f
20160820	2016-08-20	2016	3	8	Agosto	20	Sábado	6	t
20160821	2016-08-21	2016	3	8	Agosto	21	Domingo	7	t
20160822	2016-08-22	2016	3	8	Agosto	22	Lunes	1	f
20160823	2016-08-23	2016	3	8	Agosto	23	Martes	2	f
20160824	2016-08-24	2016	3	8	Agosto	24	Miércoles	3	f
20160825	2016-08-25	2016	3	8	Agosto	25	Jueves	4	f
20160826	2016-08-26	2016	3	8	Agosto	26	Viernes	5	f
20160827	2016-08-27	2016	3	8	Agosto	27	Sábado	6	t
20160828	2016-08-28	2016	3	8	Agosto	28	Domingo	7	t
20160829	2016-08-29	2016	3	8	Agosto	29	Lunes	1	f
20160830	2016-08-30	2016	3	8	Agosto	30	Martes	2	f
20160831	2016-08-31	2016	3	8	Agosto	31	Miércoles	3	f
20160901	2016-09-01	2016	3	9	Septiembre	1	Jueves	4	f
20160902	2016-09-02	2016	3	9	Septiembre	2	Viernes	5	f
20160903	2016-09-03	2016	3	9	Septiembre	3	Sábado	6	t
20160904	2016-09-04	2016	3	9	Septiembre	4	Domingo	7	t
20160905	2016-09-05	2016	3	9	Septiembre	5	Lunes	1	f
20160906	2016-09-06	2016	3	9	Septiembre	6	Martes	2	f
20160907	2016-09-07	2016	3	9	Septiembre	7	Miércoles	3	f
20160908	2016-09-08	2016	3	9	Septiembre	8	Jueves	4	f
20160909	2016-09-09	2016	3	9	Septiembre	9	Viernes	5	f
20160910	2016-09-10	2016	3	9	Septiembre	10	Sábado	6	t
20160911	2016-09-11	2016	3	9	Septiembre	11	Domingo	7	t
20160912	2016-09-12	2016	3	9	Septiembre	12	Lunes	1	f
20160913	2016-09-13	2016	3	9	Septiembre	13	Martes	2	f
20160914	2016-09-14	2016	3	9	Septiembre	14	Miércoles	3	f
20160915	2016-09-15	2016	3	9	Septiembre	15	Jueves	4	f
20160916	2016-09-16	2016	3	9	Septiembre	16	Viernes	5	f
20160917	2016-09-17	2016	3	9	Septiembre	17	Sábado	6	t
20160918	2016-09-18	2016	3	9	Septiembre	18	Domingo	7	t
20160919	2016-09-19	2016	3	9	Septiembre	19	Lunes	1	f
20160920	2016-09-20	2016	3	9	Septiembre	20	Martes	2	f
20160921	2016-09-21	2016	3	9	Septiembre	21	Miércoles	3	f
20160922	2016-09-22	2016	3	9	Septiembre	22	Jueves	4	f
20160923	2016-09-23	2016	3	9	Septiembre	23	Viernes	5	f
20160924	2016-09-24	2016	3	9	Septiembre	24	Sábado	6	t
20160925	2016-09-25	2016	3	9	Septiembre	25	Domingo	7	t
20160926	2016-09-26	2016	3	9	Septiembre	26	Lunes	1	f
20160927	2016-09-27	2016	3	9	Septiembre	27	Martes	2	f
20160928	2016-09-28	2016	3	9	Septiembre	28	Miércoles	3	f
20160929	2016-09-29	2016	3	9	Septiembre	29	Jueves	4	f
20160930	2016-09-30	2016	3	9	Septiembre	30	Viernes	5	f
20161001	2016-10-01	2016	4	10	Octubre	1	Sábado	6	t
20161002	2016-10-02	2016	4	10	Octubre	2	Domingo	7	t
20161003	2016-10-03	2016	4	10	Octubre	3	Lunes	1	f
20161004	2016-10-04	2016	4	10	Octubre	4	Martes	2	f
20161005	2016-10-05	2016	4	10	Octubre	5	Miércoles	3	f
20161006	2016-10-06	2016	4	10	Octubre	6	Jueves	4	f
20161007	2016-10-07	2016	4	10	Octubre	7	Viernes	5	f
20161008	2016-10-08	2016	4	10	Octubre	8	Sábado	6	t
20161009	2016-10-09	2016	4	10	Octubre	9	Domingo	7	t
20161010	2016-10-10	2016	4	10	Octubre	10	Lunes	1	f
20161011	2016-10-11	2016	4	10	Octubre	11	Martes	2	f
20161012	2016-10-12	2016	4	10	Octubre	12	Miércoles	3	f
20161013	2016-10-13	2016	4	10	Octubre	13	Jueves	4	f
20161014	2016-10-14	2016	4	10	Octubre	14	Viernes	5	f
20161015	2016-10-15	2016	4	10	Octubre	15	Sábado	6	t
20161016	2016-10-16	2016	4	10	Octubre	16	Domingo	7	t
20161017	2016-10-17	2016	4	10	Octubre	17	Lunes	1	f
20161018	2016-10-18	2016	4	10	Octubre	18	Martes	2	f
20161019	2016-10-19	2016	4	10	Octubre	19	Miércoles	3	f
20161020	2016-10-20	2016	4	10	Octubre	20	Jueves	4	f
20161021	2016-10-21	2016	4	10	Octubre	21	Viernes	5	f
20161022	2016-10-22	2016	4	10	Octubre	22	Sábado	6	t
20161023	2016-10-23	2016	4	10	Octubre	23	Domingo	7	t
20161024	2016-10-24	2016	4	10	Octubre	24	Lunes	1	f
20161025	2016-10-25	2016	4	10	Octubre	25	Martes	2	f
20161026	2016-10-26	2016	4	10	Octubre	26	Miércoles	3	f
20161027	2016-10-27	2016	4	10	Octubre	27	Jueves	4	f
20161028	2016-10-28	2016	4	10	Octubre	28	Viernes	5	f
20161029	2016-10-29	2016	4	10	Octubre	29	Sábado	6	t
20161030	2016-10-30	2016	4	10	Octubre	30	Domingo	7	t
20161031	2016-10-31	2016	4	10	Octubre	31	Lunes	1	f
20161101	2016-11-01	2016	4	11	Noviembre	1	Martes	2	f
20161102	2016-11-02	2016	4	11	Noviembre	2	Miércoles	3	f
20161103	2016-11-03	2016	4	11	Noviembre	3	Jueves	4	f
20161104	2016-11-04	2016	4	11	Noviembre	4	Viernes	5	f
20161105	2016-11-05	2016	4	11	Noviembre	5	Sábado	6	t
20161106	2016-11-06	2016	4	11	Noviembre	6	Domingo	7	t
20161107	2016-11-07	2016	4	11	Noviembre	7	Lunes	1	f
20161108	2016-11-08	2016	4	11	Noviembre	8	Martes	2	f
20161109	2016-11-09	2016	4	11	Noviembre	9	Miércoles	3	f
20161110	2016-11-10	2016	4	11	Noviembre	10	Jueves	4	f
20161111	2016-11-11	2016	4	11	Noviembre	11	Viernes	5	f
20161112	2016-11-12	2016	4	11	Noviembre	12	Sábado	6	t
20161113	2016-11-13	2016	4	11	Noviembre	13	Domingo	7	t
20161114	2016-11-14	2016	4	11	Noviembre	14	Lunes	1	f
20161115	2016-11-15	2016	4	11	Noviembre	15	Martes	2	f
20161116	2016-11-16	2016	4	11	Noviembre	16	Miércoles	3	f
20161117	2016-11-17	2016	4	11	Noviembre	17	Jueves	4	f
20161118	2016-11-18	2016	4	11	Noviembre	18	Viernes	5	f
20161119	2016-11-19	2016	4	11	Noviembre	19	Sábado	6	t
20161120	2016-11-20	2016	4	11	Noviembre	20	Domingo	7	t
20161121	2016-11-21	2016	4	11	Noviembre	21	Lunes	1	f
20161122	2016-11-22	2016	4	11	Noviembre	22	Martes	2	f
20161123	2016-11-23	2016	4	11	Noviembre	23	Miércoles	3	f
20161124	2016-11-24	2016	4	11	Noviembre	24	Jueves	4	f
20161125	2016-11-25	2016	4	11	Noviembre	25	Viernes	5	f
20161126	2016-11-26	2016	4	11	Noviembre	26	Sábado	6	t
20161127	2016-11-27	2016	4	11	Noviembre	27	Domingo	7	t
20161128	2016-11-28	2016	4	11	Noviembre	28	Lunes	1	f
20161129	2016-11-29	2016	4	11	Noviembre	29	Martes	2	f
20161130	2016-11-30	2016	4	11	Noviembre	30	Miércoles	3	f
20161201	2016-12-01	2016	4	12	Diciembre	1	Jueves	4	f
20161202	2016-12-02	2016	4	12	Diciembre	2	Viernes	5	f
20161203	2016-12-03	2016	4	12	Diciembre	3	Sábado	6	t
20161204	2016-12-04	2016	4	12	Diciembre	4	Domingo	7	t
20161205	2016-12-05	2016	4	12	Diciembre	5	Lunes	1	f
20161206	2016-12-06	2016	4	12	Diciembre	6	Martes	2	f
20161207	2016-12-07	2016	4	12	Diciembre	7	Miércoles	3	f
20161208	2016-12-08	2016	4	12	Diciembre	8	Jueves	4	f
20161209	2016-12-09	2016	4	12	Diciembre	9	Viernes	5	f
20161210	2016-12-10	2016	4	12	Diciembre	10	Sábado	6	t
20161211	2016-12-11	2016	4	12	Diciembre	11	Domingo	7	t
20161212	2016-12-12	2016	4	12	Diciembre	12	Lunes	1	f
20161213	2016-12-13	2016	4	12	Diciembre	13	Martes	2	f
20161214	2016-12-14	2016	4	12	Diciembre	14	Miércoles	3	f
20161215	2016-12-15	2016	4	12	Diciembre	15	Jueves	4	f
20161216	2016-12-16	2016	4	12	Diciembre	16	Viernes	5	f
20161217	2016-12-17	2016	4	12	Diciembre	17	Sábado	6	t
20161218	2016-12-18	2016	4	12	Diciembre	18	Domingo	7	t
20161219	2016-12-19	2016	4	12	Diciembre	19	Lunes	1	f
20161220	2016-12-20	2016	4	12	Diciembre	20	Martes	2	f
20161221	2016-12-21	2016	4	12	Diciembre	21	Miércoles	3	f
20161222	2016-12-22	2016	4	12	Diciembre	22	Jueves	4	f
20161223	2016-12-23	2016	4	12	Diciembre	23	Viernes	5	f
20161224	2016-12-24	2016	4	12	Diciembre	24	Sábado	6	t
20161225	2016-12-25	2016	4	12	Diciembre	25	Domingo	7	t
20161226	2016-12-26	2016	4	12	Diciembre	26	Lunes	1	f
20161227	2016-12-27	2016	4	12	Diciembre	27	Martes	2	f
20161228	2016-12-28	2016	4	12	Diciembre	28	Miércoles	3	f
20161229	2016-12-29	2016	4	12	Diciembre	29	Jueves	4	f
20161230	2016-12-30	2016	4	12	Diciembre	30	Viernes	5	f
20161231	2016-12-31	2016	4	12	Diciembre	31	Sábado	6	t
20170101	2017-01-01	2017	1	1	Enero	1	Domingo	7	t
20170102	2017-01-02	2017	1	1	Enero	2	Lunes	1	f
20170103	2017-01-03	2017	1	1	Enero	3	Martes	2	f
20170104	2017-01-04	2017	1	1	Enero	4	Miércoles	3	f
20170105	2017-01-05	2017	1	1	Enero	5	Jueves	4	f
20170106	2017-01-06	2017	1	1	Enero	6	Viernes	5	f
20170107	2017-01-07	2017	1	1	Enero	7	Sábado	6	t
20170108	2017-01-08	2017	1	1	Enero	8	Domingo	7	t
20170109	2017-01-09	2017	1	1	Enero	9	Lunes	1	f
20170110	2017-01-10	2017	1	1	Enero	10	Martes	2	f
20170111	2017-01-11	2017	1	1	Enero	11	Miércoles	3	f
20170112	2017-01-12	2017	1	1	Enero	12	Jueves	4	f
20170113	2017-01-13	2017	1	1	Enero	13	Viernes	5	f
20170114	2017-01-14	2017	1	1	Enero	14	Sábado	6	t
20170115	2017-01-15	2017	1	1	Enero	15	Domingo	7	t
20170116	2017-01-16	2017	1	1	Enero	16	Lunes	1	f
20170117	2017-01-17	2017	1	1	Enero	17	Martes	2	f
20170118	2017-01-18	2017	1	1	Enero	18	Miércoles	3	f
20170119	2017-01-19	2017	1	1	Enero	19	Jueves	4	f
20170120	2017-01-20	2017	1	1	Enero	20	Viernes	5	f
20170121	2017-01-21	2017	1	1	Enero	21	Sábado	6	t
20170122	2017-01-22	2017	1	1	Enero	22	Domingo	7	t
20170123	2017-01-23	2017	1	1	Enero	23	Lunes	1	f
20170124	2017-01-24	2017	1	1	Enero	24	Martes	2	f
20170125	2017-01-25	2017	1	1	Enero	25	Miércoles	3	f
20170126	2017-01-26	2017	1	1	Enero	26	Jueves	4	f
20170127	2017-01-27	2017	1	1	Enero	27	Viernes	5	f
20170128	2017-01-28	2017	1	1	Enero	28	Sábado	6	t
20170129	2017-01-29	2017	1	1	Enero	29	Domingo	7	t
20170130	2017-01-30	2017	1	1	Enero	30	Lunes	1	f
20170131	2017-01-31	2017	1	1	Enero	31	Martes	2	f
20170201	2017-02-01	2017	1	2	Febrero	1	Miércoles	3	f
20170202	2017-02-02	2017	1	2	Febrero	2	Jueves	4	f
20170203	2017-02-03	2017	1	2	Febrero	3	Viernes	5	f
20170204	2017-02-04	2017	1	2	Febrero	4	Sábado	6	t
20170205	2017-02-05	2017	1	2	Febrero	5	Domingo	7	t
20170206	2017-02-06	2017	1	2	Febrero	6	Lunes	1	f
20170207	2017-02-07	2017	1	2	Febrero	7	Martes	2	f
20170208	2017-02-08	2017	1	2	Febrero	8	Miércoles	3	f
20170209	2017-02-09	2017	1	2	Febrero	9	Jueves	4	f
20170210	2017-02-10	2017	1	2	Febrero	10	Viernes	5	f
20170211	2017-02-11	2017	1	2	Febrero	11	Sábado	6	t
20170212	2017-02-12	2017	1	2	Febrero	12	Domingo	7	t
20170213	2017-02-13	2017	1	2	Febrero	13	Lunes	1	f
20170214	2017-02-14	2017	1	2	Febrero	14	Martes	2	f
20170215	2017-02-15	2017	1	2	Febrero	15	Miércoles	3	f
20170216	2017-02-16	2017	1	2	Febrero	16	Jueves	4	f
20170217	2017-02-17	2017	1	2	Febrero	17	Viernes	5	f
20170218	2017-02-18	2017	1	2	Febrero	18	Sábado	6	t
20170219	2017-02-19	2017	1	2	Febrero	19	Domingo	7	t
20170220	2017-02-20	2017	1	2	Febrero	20	Lunes	1	f
20170221	2017-02-21	2017	1	2	Febrero	21	Martes	2	f
20170222	2017-02-22	2017	1	2	Febrero	22	Miércoles	3	f
20170223	2017-02-23	2017	1	2	Febrero	23	Jueves	4	f
20170224	2017-02-24	2017	1	2	Febrero	24	Viernes	5	f
20170225	2017-02-25	2017	1	2	Febrero	25	Sábado	6	t
20170226	2017-02-26	2017	1	2	Febrero	26	Domingo	7	t
20170227	2017-02-27	2017	1	2	Febrero	27	Lunes	1	f
20170228	2017-02-28	2017	1	2	Febrero	28	Martes	2	f
20170301	2017-03-01	2017	1	3	Marzo	1	Miércoles	3	f
20170302	2017-03-02	2017	1	3	Marzo	2	Jueves	4	f
20170303	2017-03-03	2017	1	3	Marzo	3	Viernes	5	f
20170304	2017-03-04	2017	1	3	Marzo	4	Sábado	6	t
20170305	2017-03-05	2017	1	3	Marzo	5	Domingo	7	t
20170306	2017-03-06	2017	1	3	Marzo	6	Lunes	1	f
20170307	2017-03-07	2017	1	3	Marzo	7	Martes	2	f
20170308	2017-03-08	2017	1	3	Marzo	8	Miércoles	3	f
20170309	2017-03-09	2017	1	3	Marzo	9	Jueves	4	f
20170310	2017-03-10	2017	1	3	Marzo	10	Viernes	5	f
20170311	2017-03-11	2017	1	3	Marzo	11	Sábado	6	t
20170312	2017-03-12	2017	1	3	Marzo	12	Domingo	7	t
20170313	2017-03-13	2017	1	3	Marzo	13	Lunes	1	f
20170314	2017-03-14	2017	1	3	Marzo	14	Martes	2	f
20170315	2017-03-15	2017	1	3	Marzo	15	Miércoles	3	f
20170316	2017-03-16	2017	1	3	Marzo	16	Jueves	4	f
20170317	2017-03-17	2017	1	3	Marzo	17	Viernes	5	f
20170318	2017-03-18	2017	1	3	Marzo	18	Sábado	6	t
20170319	2017-03-19	2017	1	3	Marzo	19	Domingo	7	t
20170320	2017-03-20	2017	1	3	Marzo	20	Lunes	1	f
20170321	2017-03-21	2017	1	3	Marzo	21	Martes	2	f
20170322	2017-03-22	2017	1	3	Marzo	22	Miércoles	3	f
20170323	2017-03-23	2017	1	3	Marzo	23	Jueves	4	f
20170324	2017-03-24	2017	1	3	Marzo	24	Viernes	5	f
20170325	2017-03-25	2017	1	3	Marzo	25	Sábado	6	t
20170326	2017-03-26	2017	1	3	Marzo	26	Domingo	7	t
20170327	2017-03-27	2017	1	3	Marzo	27	Lunes	1	f
20170328	2017-03-28	2017	1	3	Marzo	28	Martes	2	f
20170329	2017-03-29	2017	1	3	Marzo	29	Miércoles	3	f
20170330	2017-03-30	2017	1	3	Marzo	30	Jueves	4	f
20170331	2017-03-31	2017	1	3	Marzo	31	Viernes	5	f
20170401	2017-04-01	2017	2	4	Abril	1	Sábado	6	t
20170402	2017-04-02	2017	2	4	Abril	2	Domingo	7	t
20170403	2017-04-03	2017	2	4	Abril	3	Lunes	1	f
20170404	2017-04-04	2017	2	4	Abril	4	Martes	2	f
20170405	2017-04-05	2017	2	4	Abril	5	Miércoles	3	f
20170406	2017-04-06	2017	2	4	Abril	6	Jueves	4	f
20170407	2017-04-07	2017	2	4	Abril	7	Viernes	5	f
20170408	2017-04-08	2017	2	4	Abril	8	Sábado	6	t
20170409	2017-04-09	2017	2	4	Abril	9	Domingo	7	t
20170410	2017-04-10	2017	2	4	Abril	10	Lunes	1	f
20170411	2017-04-11	2017	2	4	Abril	11	Martes	2	f
20170412	2017-04-12	2017	2	4	Abril	12	Miércoles	3	f
20170413	2017-04-13	2017	2	4	Abril	13	Jueves	4	f
20170414	2017-04-14	2017	2	4	Abril	14	Viernes	5	f
20170415	2017-04-15	2017	2	4	Abril	15	Sábado	6	t
20170416	2017-04-16	2017	2	4	Abril	16	Domingo	7	t
20170417	2017-04-17	2017	2	4	Abril	17	Lunes	1	f
20170418	2017-04-18	2017	2	4	Abril	18	Martes	2	f
20170419	2017-04-19	2017	2	4	Abril	19	Miércoles	3	f
20170420	2017-04-20	2017	2	4	Abril	20	Jueves	4	f
20170421	2017-04-21	2017	2	4	Abril	21	Viernes	5	f
20170422	2017-04-22	2017	2	4	Abril	22	Sábado	6	t
20170423	2017-04-23	2017	2	4	Abril	23	Domingo	7	t
20170424	2017-04-24	2017	2	4	Abril	24	Lunes	1	f
20170425	2017-04-25	2017	2	4	Abril	25	Martes	2	f
20170426	2017-04-26	2017	2	4	Abril	26	Miércoles	3	f
20170427	2017-04-27	2017	2	4	Abril	27	Jueves	4	f
20170428	2017-04-28	2017	2	4	Abril	28	Viernes	5	f
20170429	2017-04-29	2017	2	4	Abril	29	Sábado	6	t
20170430	2017-04-30	2017	2	4	Abril	30	Domingo	7	t
20170501	2017-05-01	2017	2	5	Mayo	1	Lunes	1	f
20170502	2017-05-02	2017	2	5	Mayo	2	Martes	2	f
20170503	2017-05-03	2017	2	5	Mayo	3	Miércoles	3	f
20170504	2017-05-04	2017	2	5	Mayo	4	Jueves	4	f
20170505	2017-05-05	2017	2	5	Mayo	5	Viernes	5	f
20170506	2017-05-06	2017	2	5	Mayo	6	Sábado	6	t
20170507	2017-05-07	2017	2	5	Mayo	7	Domingo	7	t
20170508	2017-05-08	2017	2	5	Mayo	8	Lunes	1	f
20170509	2017-05-09	2017	2	5	Mayo	9	Martes	2	f
20170510	2017-05-10	2017	2	5	Mayo	10	Miércoles	3	f
20170511	2017-05-11	2017	2	5	Mayo	11	Jueves	4	f
20170512	2017-05-12	2017	2	5	Mayo	12	Viernes	5	f
20170513	2017-05-13	2017	2	5	Mayo	13	Sábado	6	t
20170514	2017-05-14	2017	2	5	Mayo	14	Domingo	7	t
20170515	2017-05-15	2017	2	5	Mayo	15	Lunes	1	f
20170516	2017-05-16	2017	2	5	Mayo	16	Martes	2	f
20170517	2017-05-17	2017	2	5	Mayo	17	Miércoles	3	f
20170518	2017-05-18	2017	2	5	Mayo	18	Jueves	4	f
20170519	2017-05-19	2017	2	5	Mayo	19	Viernes	5	f
20170520	2017-05-20	2017	2	5	Mayo	20	Sábado	6	t
20170521	2017-05-21	2017	2	5	Mayo	21	Domingo	7	t
20170522	2017-05-22	2017	2	5	Mayo	22	Lunes	1	f
20170523	2017-05-23	2017	2	5	Mayo	23	Martes	2	f
20170524	2017-05-24	2017	2	5	Mayo	24	Miércoles	3	f
20170525	2017-05-25	2017	2	5	Mayo	25	Jueves	4	f
20170526	2017-05-26	2017	2	5	Mayo	26	Viernes	5	f
20170527	2017-05-27	2017	2	5	Mayo	27	Sábado	6	t
20170528	2017-05-28	2017	2	5	Mayo	28	Domingo	7	t
20170529	2017-05-29	2017	2	5	Mayo	29	Lunes	1	f
20170530	2017-05-30	2017	2	5	Mayo	30	Martes	2	f
20170531	2017-05-31	2017	2	5	Mayo	31	Miércoles	3	f
20170601	2017-06-01	2017	2	6	Junio	1	Jueves	4	f
20170602	2017-06-02	2017	2	6	Junio	2	Viernes	5	f
20170603	2017-06-03	2017	2	6	Junio	3	Sábado	6	t
20170604	2017-06-04	2017	2	6	Junio	4	Domingo	7	t
20170605	2017-06-05	2017	2	6	Junio	5	Lunes	1	f
20170606	2017-06-06	2017	2	6	Junio	6	Martes	2	f
20170607	2017-06-07	2017	2	6	Junio	7	Miércoles	3	f
20170608	2017-06-08	2017	2	6	Junio	8	Jueves	4	f
20170609	2017-06-09	2017	2	6	Junio	9	Viernes	5	f
20170610	2017-06-10	2017	2	6	Junio	10	Sábado	6	t
20170611	2017-06-11	2017	2	6	Junio	11	Domingo	7	t
20170612	2017-06-12	2017	2	6	Junio	12	Lunes	1	f
20170613	2017-06-13	2017	2	6	Junio	13	Martes	2	f
20170614	2017-06-14	2017	2	6	Junio	14	Miércoles	3	f
20170615	2017-06-15	2017	2	6	Junio	15	Jueves	4	f
20170616	2017-06-16	2017	2	6	Junio	16	Viernes	5	f
20170617	2017-06-17	2017	2	6	Junio	17	Sábado	6	t
20170618	2017-06-18	2017	2	6	Junio	18	Domingo	7	t
20170619	2017-06-19	2017	2	6	Junio	19	Lunes	1	f
20170620	2017-06-20	2017	2	6	Junio	20	Martes	2	f
20170621	2017-06-21	2017	2	6	Junio	21	Miércoles	3	f
20170622	2017-06-22	2017	2	6	Junio	22	Jueves	4	f
20170623	2017-06-23	2017	2	6	Junio	23	Viernes	5	f
20170624	2017-06-24	2017	2	6	Junio	24	Sábado	6	t
20170625	2017-06-25	2017	2	6	Junio	25	Domingo	7	t
20170626	2017-06-26	2017	2	6	Junio	26	Lunes	1	f
20170627	2017-06-27	2017	2	6	Junio	27	Martes	2	f
20170628	2017-06-28	2017	2	6	Junio	28	Miércoles	3	f
20170629	2017-06-29	2017	2	6	Junio	29	Jueves	4	f
20170630	2017-06-30	2017	2	6	Junio	30	Viernes	5	f
20170701	2017-07-01	2017	3	7	Julio	1	Sábado	6	t
20170702	2017-07-02	2017	3	7	Julio	2	Domingo	7	t
20170703	2017-07-03	2017	3	7	Julio	3	Lunes	1	f
20170704	2017-07-04	2017	3	7	Julio	4	Martes	2	f
20170705	2017-07-05	2017	3	7	Julio	5	Miércoles	3	f
20170706	2017-07-06	2017	3	7	Julio	6	Jueves	4	f
20170707	2017-07-07	2017	3	7	Julio	7	Viernes	5	f
20170708	2017-07-08	2017	3	7	Julio	8	Sábado	6	t
20170709	2017-07-09	2017	3	7	Julio	9	Domingo	7	t
20170710	2017-07-10	2017	3	7	Julio	10	Lunes	1	f
20170711	2017-07-11	2017	3	7	Julio	11	Martes	2	f
20170712	2017-07-12	2017	3	7	Julio	12	Miércoles	3	f
20170713	2017-07-13	2017	3	7	Julio	13	Jueves	4	f
20170714	2017-07-14	2017	3	7	Julio	14	Viernes	5	f
20170715	2017-07-15	2017	3	7	Julio	15	Sábado	6	t
20170716	2017-07-16	2017	3	7	Julio	16	Domingo	7	t
20170717	2017-07-17	2017	3	7	Julio	17	Lunes	1	f
20170718	2017-07-18	2017	3	7	Julio	18	Martes	2	f
20170719	2017-07-19	2017	3	7	Julio	19	Miércoles	3	f
20170720	2017-07-20	2017	3	7	Julio	20	Jueves	4	f
20170721	2017-07-21	2017	3	7	Julio	21	Viernes	5	f
20170722	2017-07-22	2017	3	7	Julio	22	Sábado	6	t
20170723	2017-07-23	2017	3	7	Julio	23	Domingo	7	t
20170724	2017-07-24	2017	3	7	Julio	24	Lunes	1	f
20170725	2017-07-25	2017	3	7	Julio	25	Martes	2	f
20170726	2017-07-26	2017	3	7	Julio	26	Miércoles	3	f
20170727	2017-07-27	2017	3	7	Julio	27	Jueves	4	f
20170728	2017-07-28	2017	3	7	Julio	28	Viernes	5	f
20170729	2017-07-29	2017	3	7	Julio	29	Sábado	6	t
20170730	2017-07-30	2017	3	7	Julio	30	Domingo	7	t
20170731	2017-07-31	2017	3	7	Julio	31	Lunes	1	f
20170801	2017-08-01	2017	3	8	Agosto	1	Martes	2	f
20170802	2017-08-02	2017	3	8	Agosto	2	Miércoles	3	f
20170803	2017-08-03	2017	3	8	Agosto	3	Jueves	4	f
20170804	2017-08-04	2017	3	8	Agosto	4	Viernes	5	f
20170805	2017-08-05	2017	3	8	Agosto	5	Sábado	6	t
20170806	2017-08-06	2017	3	8	Agosto	6	Domingo	7	t
20170807	2017-08-07	2017	3	8	Agosto	7	Lunes	1	f
20170808	2017-08-08	2017	3	8	Agosto	8	Martes	2	f
20170809	2017-08-09	2017	3	8	Agosto	9	Miércoles	3	f
20170810	2017-08-10	2017	3	8	Agosto	10	Jueves	4	f
20170811	2017-08-11	2017	3	8	Agosto	11	Viernes	5	f
20170812	2017-08-12	2017	3	8	Agosto	12	Sábado	6	t
20170813	2017-08-13	2017	3	8	Agosto	13	Domingo	7	t
20170814	2017-08-14	2017	3	8	Agosto	14	Lunes	1	f
20170815	2017-08-15	2017	3	8	Agosto	15	Martes	2	f
20170816	2017-08-16	2017	3	8	Agosto	16	Miércoles	3	f
20170817	2017-08-17	2017	3	8	Agosto	17	Jueves	4	f
20170818	2017-08-18	2017	3	8	Agosto	18	Viernes	5	f
20170819	2017-08-19	2017	3	8	Agosto	19	Sábado	6	t
20170820	2017-08-20	2017	3	8	Agosto	20	Domingo	7	t
20170821	2017-08-21	2017	3	8	Agosto	21	Lunes	1	f
20170822	2017-08-22	2017	3	8	Agosto	22	Martes	2	f
20170823	2017-08-23	2017	3	8	Agosto	23	Miércoles	3	f
20170824	2017-08-24	2017	3	8	Agosto	24	Jueves	4	f
20170825	2017-08-25	2017	3	8	Agosto	25	Viernes	5	f
20170826	2017-08-26	2017	3	8	Agosto	26	Sábado	6	t
20170827	2017-08-27	2017	3	8	Agosto	27	Domingo	7	t
20170828	2017-08-28	2017	3	8	Agosto	28	Lunes	1	f
20170829	2017-08-29	2017	3	8	Agosto	29	Martes	2	f
20170830	2017-08-30	2017	3	8	Agosto	30	Miércoles	3	f
20170831	2017-08-31	2017	3	8	Agosto	31	Jueves	4	f
20170901	2017-09-01	2017	3	9	Septiembre	1	Viernes	5	f
20170902	2017-09-02	2017	3	9	Septiembre	2	Sábado	6	t
20170903	2017-09-03	2017	3	9	Septiembre	3	Domingo	7	t
20170904	2017-09-04	2017	3	9	Septiembre	4	Lunes	1	f
20170905	2017-09-05	2017	3	9	Septiembre	5	Martes	2	f
20170906	2017-09-06	2017	3	9	Septiembre	6	Miércoles	3	f
20170907	2017-09-07	2017	3	9	Septiembre	7	Jueves	4	f
20170908	2017-09-08	2017	3	9	Septiembre	8	Viernes	5	f
20170909	2017-09-09	2017	3	9	Septiembre	9	Sábado	6	t
20170910	2017-09-10	2017	3	9	Septiembre	10	Domingo	7	t
20170911	2017-09-11	2017	3	9	Septiembre	11	Lunes	1	f
20170912	2017-09-12	2017	3	9	Septiembre	12	Martes	2	f
20170913	2017-09-13	2017	3	9	Septiembre	13	Miércoles	3	f
20170914	2017-09-14	2017	3	9	Septiembre	14	Jueves	4	f
20170915	2017-09-15	2017	3	9	Septiembre	15	Viernes	5	f
20170916	2017-09-16	2017	3	9	Septiembre	16	Sábado	6	t
20170917	2017-09-17	2017	3	9	Septiembre	17	Domingo	7	t
20170918	2017-09-18	2017	3	9	Septiembre	18	Lunes	1	f
20170919	2017-09-19	2017	3	9	Septiembre	19	Martes	2	f
20170920	2017-09-20	2017	3	9	Septiembre	20	Miércoles	3	f
20170921	2017-09-21	2017	3	9	Septiembre	21	Jueves	4	f
20170922	2017-09-22	2017	3	9	Septiembre	22	Viernes	5	f
20170923	2017-09-23	2017	3	9	Septiembre	23	Sábado	6	t
20170924	2017-09-24	2017	3	9	Septiembre	24	Domingo	7	t
20170925	2017-09-25	2017	3	9	Septiembre	25	Lunes	1	f
20170926	2017-09-26	2017	3	9	Septiembre	26	Martes	2	f
20170927	2017-09-27	2017	3	9	Septiembre	27	Miércoles	3	f
20170928	2017-09-28	2017	3	9	Septiembre	28	Jueves	4	f
20170929	2017-09-29	2017	3	9	Septiembre	29	Viernes	5	f
20170930	2017-09-30	2017	3	9	Septiembre	30	Sábado	6	t
20171001	2017-10-01	2017	4	10	Octubre	1	Domingo	7	t
20171002	2017-10-02	2017	4	10	Octubre	2	Lunes	1	f
20171003	2017-10-03	2017	4	10	Octubre	3	Martes	2	f
20171004	2017-10-04	2017	4	10	Octubre	4	Miércoles	3	f
20171005	2017-10-05	2017	4	10	Octubre	5	Jueves	4	f
20171006	2017-10-06	2017	4	10	Octubre	6	Viernes	5	f
20171007	2017-10-07	2017	4	10	Octubre	7	Sábado	6	t
20171008	2017-10-08	2017	4	10	Octubre	8	Domingo	7	t
20171009	2017-10-09	2017	4	10	Octubre	9	Lunes	1	f
20171010	2017-10-10	2017	4	10	Octubre	10	Martes	2	f
20171011	2017-10-11	2017	4	10	Octubre	11	Miércoles	3	f
20171012	2017-10-12	2017	4	10	Octubre	12	Jueves	4	f
20171013	2017-10-13	2017	4	10	Octubre	13	Viernes	5	f
20171014	2017-10-14	2017	4	10	Octubre	14	Sábado	6	t
20171015	2017-10-15	2017	4	10	Octubre	15	Domingo	7	t
20171016	2017-10-16	2017	4	10	Octubre	16	Lunes	1	f
20171017	2017-10-17	2017	4	10	Octubre	17	Martes	2	f
20171018	2017-10-18	2017	4	10	Octubre	18	Miércoles	3	f
20171019	2017-10-19	2017	4	10	Octubre	19	Jueves	4	f
20171020	2017-10-20	2017	4	10	Octubre	20	Viernes	5	f
20171021	2017-10-21	2017	4	10	Octubre	21	Sábado	6	t
20171022	2017-10-22	2017	4	10	Octubre	22	Domingo	7	t
20171023	2017-10-23	2017	4	10	Octubre	23	Lunes	1	f
20171024	2017-10-24	2017	4	10	Octubre	24	Martes	2	f
20171025	2017-10-25	2017	4	10	Octubre	25	Miércoles	3	f
20171026	2017-10-26	2017	4	10	Octubre	26	Jueves	4	f
20171027	2017-10-27	2017	4	10	Octubre	27	Viernes	5	f
20171028	2017-10-28	2017	4	10	Octubre	28	Sábado	6	t
20171029	2017-10-29	2017	4	10	Octubre	29	Domingo	7	t
20171030	2017-10-30	2017	4	10	Octubre	30	Lunes	1	f
20171031	2017-10-31	2017	4	10	Octubre	31	Martes	2	f
20171101	2017-11-01	2017	4	11	Noviembre	1	Miércoles	3	f
20171102	2017-11-02	2017	4	11	Noviembre	2	Jueves	4	f
20171103	2017-11-03	2017	4	11	Noviembre	3	Viernes	5	f
20171104	2017-11-04	2017	4	11	Noviembre	4	Sábado	6	t
20171105	2017-11-05	2017	4	11	Noviembre	5	Domingo	7	t
20171106	2017-11-06	2017	4	11	Noviembre	6	Lunes	1	f
20171107	2017-11-07	2017	4	11	Noviembre	7	Martes	2	f
20171108	2017-11-08	2017	4	11	Noviembre	8	Miércoles	3	f
20171109	2017-11-09	2017	4	11	Noviembre	9	Jueves	4	f
20171110	2017-11-10	2017	4	11	Noviembre	10	Viernes	5	f
20171111	2017-11-11	2017	4	11	Noviembre	11	Sábado	6	t
20171112	2017-11-12	2017	4	11	Noviembre	12	Domingo	7	t
20171113	2017-11-13	2017	4	11	Noviembre	13	Lunes	1	f
20171114	2017-11-14	2017	4	11	Noviembre	14	Martes	2	f
20171115	2017-11-15	2017	4	11	Noviembre	15	Miércoles	3	f
20171116	2017-11-16	2017	4	11	Noviembre	16	Jueves	4	f
20171117	2017-11-17	2017	4	11	Noviembre	17	Viernes	5	f
20171118	2017-11-18	2017	4	11	Noviembre	18	Sábado	6	t
20171119	2017-11-19	2017	4	11	Noviembre	19	Domingo	7	t
20171120	2017-11-20	2017	4	11	Noviembre	20	Lunes	1	f
20171121	2017-11-21	2017	4	11	Noviembre	21	Martes	2	f
20171122	2017-11-22	2017	4	11	Noviembre	22	Miércoles	3	f
20171123	2017-11-23	2017	4	11	Noviembre	23	Jueves	4	f
20171124	2017-11-24	2017	4	11	Noviembre	24	Viernes	5	f
20171125	2017-11-25	2017	4	11	Noviembre	25	Sábado	6	t
20171126	2017-11-26	2017	4	11	Noviembre	26	Domingo	7	t
20171127	2017-11-27	2017	4	11	Noviembre	27	Lunes	1	f
20171128	2017-11-28	2017	4	11	Noviembre	28	Martes	2	f
20171129	2017-11-29	2017	4	11	Noviembre	29	Miércoles	3	f
20171130	2017-11-30	2017	4	11	Noviembre	30	Jueves	4	f
20171201	2017-12-01	2017	4	12	Diciembre	1	Viernes	5	f
20171202	2017-12-02	2017	4	12	Diciembre	2	Sábado	6	t
20171203	2017-12-03	2017	4	12	Diciembre	3	Domingo	7	t
20171204	2017-12-04	2017	4	12	Diciembre	4	Lunes	1	f
20171205	2017-12-05	2017	4	12	Diciembre	5	Martes	2	f
20171206	2017-12-06	2017	4	12	Diciembre	6	Miércoles	3	f
20171207	2017-12-07	2017	4	12	Diciembre	7	Jueves	4	f
20171208	2017-12-08	2017	4	12	Diciembre	8	Viernes	5	f
20171209	2017-12-09	2017	4	12	Diciembre	9	Sábado	6	t
20171210	2017-12-10	2017	4	12	Diciembre	10	Domingo	7	t
20171211	2017-12-11	2017	4	12	Diciembre	11	Lunes	1	f
20171212	2017-12-12	2017	4	12	Diciembre	12	Martes	2	f
20171213	2017-12-13	2017	4	12	Diciembre	13	Miércoles	3	f
20171214	2017-12-14	2017	4	12	Diciembre	14	Jueves	4	f
20171215	2017-12-15	2017	4	12	Diciembre	15	Viernes	5	f
20171216	2017-12-16	2017	4	12	Diciembre	16	Sábado	6	t
20171217	2017-12-17	2017	4	12	Diciembre	17	Domingo	7	t
20171218	2017-12-18	2017	4	12	Diciembre	18	Lunes	1	f
20171219	2017-12-19	2017	4	12	Diciembre	19	Martes	2	f
20171220	2017-12-20	2017	4	12	Diciembre	20	Miércoles	3	f
20171221	2017-12-21	2017	4	12	Diciembre	21	Jueves	4	f
20171222	2017-12-22	2017	4	12	Diciembre	22	Viernes	5	f
20171223	2017-12-23	2017	4	12	Diciembre	23	Sábado	6	t
20171224	2017-12-24	2017	4	12	Diciembre	24	Domingo	7	t
20171225	2017-12-25	2017	4	12	Diciembre	25	Lunes	1	f
20171226	2017-12-26	2017	4	12	Diciembre	26	Martes	2	f
20171227	2017-12-27	2017	4	12	Diciembre	27	Miércoles	3	f
20171228	2017-12-28	2017	4	12	Diciembre	28	Jueves	4	f
20171229	2017-12-29	2017	4	12	Diciembre	29	Viernes	5	f
20171230	2017-12-30	2017	4	12	Diciembre	30	Sábado	6	t
20171231	2017-12-31	2017	4	12	Diciembre	31	Domingo	7	t
20180101	2018-01-01	2018	1	1	Enero	1	Lunes	1	f
20180102	2018-01-02	2018	1	1	Enero	2	Martes	2	f
20180103	2018-01-03	2018	1	1	Enero	3	Miércoles	3	f
20180104	2018-01-04	2018	1	1	Enero	4	Jueves	4	f
20180105	2018-01-05	2018	1	1	Enero	5	Viernes	5	f
20180106	2018-01-06	2018	1	1	Enero	6	Sábado	6	t
20180107	2018-01-07	2018	1	1	Enero	7	Domingo	7	t
20180108	2018-01-08	2018	1	1	Enero	8	Lunes	1	f
20180109	2018-01-09	2018	1	1	Enero	9	Martes	2	f
20180110	2018-01-10	2018	1	1	Enero	10	Miércoles	3	f
20180111	2018-01-11	2018	1	1	Enero	11	Jueves	4	f
20180112	2018-01-12	2018	1	1	Enero	12	Viernes	5	f
20180113	2018-01-13	2018	1	1	Enero	13	Sábado	6	t
20180114	2018-01-14	2018	1	1	Enero	14	Domingo	7	t
20180115	2018-01-15	2018	1	1	Enero	15	Lunes	1	f
20180116	2018-01-16	2018	1	1	Enero	16	Martes	2	f
20180117	2018-01-17	2018	1	1	Enero	17	Miércoles	3	f
20180118	2018-01-18	2018	1	1	Enero	18	Jueves	4	f
20180119	2018-01-19	2018	1	1	Enero	19	Viernes	5	f
20180120	2018-01-20	2018	1	1	Enero	20	Sábado	6	t
20180121	2018-01-21	2018	1	1	Enero	21	Domingo	7	t
20180122	2018-01-22	2018	1	1	Enero	22	Lunes	1	f
20180123	2018-01-23	2018	1	1	Enero	23	Martes	2	f
20180124	2018-01-24	2018	1	1	Enero	24	Miércoles	3	f
20180125	2018-01-25	2018	1	1	Enero	25	Jueves	4	f
20180126	2018-01-26	2018	1	1	Enero	26	Viernes	5	f
20180127	2018-01-27	2018	1	1	Enero	27	Sábado	6	t
20180128	2018-01-28	2018	1	1	Enero	28	Domingo	7	t
20180129	2018-01-29	2018	1	1	Enero	29	Lunes	1	f
20180130	2018-01-30	2018	1	1	Enero	30	Martes	2	f
20180131	2018-01-31	2018	1	1	Enero	31	Miércoles	3	f
20180201	2018-02-01	2018	1	2	Febrero	1	Jueves	4	f
20180202	2018-02-02	2018	1	2	Febrero	2	Viernes	5	f
20180203	2018-02-03	2018	1	2	Febrero	3	Sábado	6	t
20180204	2018-02-04	2018	1	2	Febrero	4	Domingo	7	t
20180205	2018-02-05	2018	1	2	Febrero	5	Lunes	1	f
20180206	2018-02-06	2018	1	2	Febrero	6	Martes	2	f
20180207	2018-02-07	2018	1	2	Febrero	7	Miércoles	3	f
20180208	2018-02-08	2018	1	2	Febrero	8	Jueves	4	f
20180209	2018-02-09	2018	1	2	Febrero	9	Viernes	5	f
20180210	2018-02-10	2018	1	2	Febrero	10	Sábado	6	t
20180211	2018-02-11	2018	1	2	Febrero	11	Domingo	7	t
20180212	2018-02-12	2018	1	2	Febrero	12	Lunes	1	f
20180213	2018-02-13	2018	1	2	Febrero	13	Martes	2	f
20180214	2018-02-14	2018	1	2	Febrero	14	Miércoles	3	f
20180215	2018-02-15	2018	1	2	Febrero	15	Jueves	4	f
20180216	2018-02-16	2018	1	2	Febrero	16	Viernes	5	f
20180217	2018-02-17	2018	1	2	Febrero	17	Sábado	6	t
20180218	2018-02-18	2018	1	2	Febrero	18	Domingo	7	t
20180219	2018-02-19	2018	1	2	Febrero	19	Lunes	1	f
20180220	2018-02-20	2018	1	2	Febrero	20	Martes	2	f
20180221	2018-02-21	2018	1	2	Febrero	21	Miércoles	3	f
20180222	2018-02-22	2018	1	2	Febrero	22	Jueves	4	f
20180223	2018-02-23	2018	1	2	Febrero	23	Viernes	5	f
20180224	2018-02-24	2018	1	2	Febrero	24	Sábado	6	t
20180225	2018-02-25	2018	1	2	Febrero	25	Domingo	7	t
20180226	2018-02-26	2018	1	2	Febrero	26	Lunes	1	f
20180227	2018-02-27	2018	1	2	Febrero	27	Martes	2	f
20180228	2018-02-28	2018	1	2	Febrero	28	Miércoles	3	f
20180301	2018-03-01	2018	1	3	Marzo	1	Jueves	4	f
20180302	2018-03-02	2018	1	3	Marzo	2	Viernes	5	f
20180303	2018-03-03	2018	1	3	Marzo	3	Sábado	6	t
20180304	2018-03-04	2018	1	3	Marzo	4	Domingo	7	t
20180305	2018-03-05	2018	1	3	Marzo	5	Lunes	1	f
20180306	2018-03-06	2018	1	3	Marzo	6	Martes	2	f
20180307	2018-03-07	2018	1	3	Marzo	7	Miércoles	3	f
20180308	2018-03-08	2018	1	3	Marzo	8	Jueves	4	f
20180309	2018-03-09	2018	1	3	Marzo	9	Viernes	5	f
20180310	2018-03-10	2018	1	3	Marzo	10	Sábado	6	t
20180311	2018-03-11	2018	1	3	Marzo	11	Domingo	7	t
20180312	2018-03-12	2018	1	3	Marzo	12	Lunes	1	f
20180313	2018-03-13	2018	1	3	Marzo	13	Martes	2	f
20180314	2018-03-14	2018	1	3	Marzo	14	Miércoles	3	f
20180315	2018-03-15	2018	1	3	Marzo	15	Jueves	4	f
20180316	2018-03-16	2018	1	3	Marzo	16	Viernes	5	f
20180317	2018-03-17	2018	1	3	Marzo	17	Sábado	6	t
20180318	2018-03-18	2018	1	3	Marzo	18	Domingo	7	t
20180319	2018-03-19	2018	1	3	Marzo	19	Lunes	1	f
20180320	2018-03-20	2018	1	3	Marzo	20	Martes	2	f
20180321	2018-03-21	2018	1	3	Marzo	21	Miércoles	3	f
20180322	2018-03-22	2018	1	3	Marzo	22	Jueves	4	f
20180323	2018-03-23	2018	1	3	Marzo	23	Viernes	5	f
20180324	2018-03-24	2018	1	3	Marzo	24	Sábado	6	t
20180325	2018-03-25	2018	1	3	Marzo	25	Domingo	7	t
20180326	2018-03-26	2018	1	3	Marzo	26	Lunes	1	f
20180327	2018-03-27	2018	1	3	Marzo	27	Martes	2	f
20180328	2018-03-28	2018	1	3	Marzo	28	Miércoles	3	f
20180329	2018-03-29	2018	1	3	Marzo	29	Jueves	4	f
20180330	2018-03-30	2018	1	3	Marzo	30	Viernes	5	f
20180331	2018-03-31	2018	1	3	Marzo	31	Sábado	6	t
20180401	2018-04-01	2018	2	4	Abril	1	Domingo	7	t
20180402	2018-04-02	2018	2	4	Abril	2	Lunes	1	f
20180403	2018-04-03	2018	2	4	Abril	3	Martes	2	f
20180404	2018-04-04	2018	2	4	Abril	4	Miércoles	3	f
20180405	2018-04-05	2018	2	4	Abril	5	Jueves	4	f
20180406	2018-04-06	2018	2	4	Abril	6	Viernes	5	f
20180407	2018-04-07	2018	2	4	Abril	7	Sábado	6	t
20180408	2018-04-08	2018	2	4	Abril	8	Domingo	7	t
20180409	2018-04-09	2018	2	4	Abril	9	Lunes	1	f
20180410	2018-04-10	2018	2	4	Abril	10	Martes	2	f
20180411	2018-04-11	2018	2	4	Abril	11	Miércoles	3	f
20180412	2018-04-12	2018	2	4	Abril	12	Jueves	4	f
20180413	2018-04-13	2018	2	4	Abril	13	Viernes	5	f
20180414	2018-04-14	2018	2	4	Abril	14	Sábado	6	t
20180415	2018-04-15	2018	2	4	Abril	15	Domingo	7	t
20180416	2018-04-16	2018	2	4	Abril	16	Lunes	1	f
20180417	2018-04-17	2018	2	4	Abril	17	Martes	2	f
20180418	2018-04-18	2018	2	4	Abril	18	Miércoles	3	f
20180419	2018-04-19	2018	2	4	Abril	19	Jueves	4	f
20180420	2018-04-20	2018	2	4	Abril	20	Viernes	5	f
20180421	2018-04-21	2018	2	4	Abril	21	Sábado	6	t
20180422	2018-04-22	2018	2	4	Abril	22	Domingo	7	t
20180423	2018-04-23	2018	2	4	Abril	23	Lunes	1	f
20180424	2018-04-24	2018	2	4	Abril	24	Martes	2	f
20180425	2018-04-25	2018	2	4	Abril	25	Miércoles	3	f
20180426	2018-04-26	2018	2	4	Abril	26	Jueves	4	f
20180427	2018-04-27	2018	2	4	Abril	27	Viernes	5	f
20180428	2018-04-28	2018	2	4	Abril	28	Sábado	6	t
20180429	2018-04-29	2018	2	4	Abril	29	Domingo	7	t
20180430	2018-04-30	2018	2	4	Abril	30	Lunes	1	f
20180501	2018-05-01	2018	2	5	Mayo	1	Martes	2	f
20180502	2018-05-02	2018	2	5	Mayo	2	Miércoles	3	f
20180503	2018-05-03	2018	2	5	Mayo	3	Jueves	4	f
20180504	2018-05-04	2018	2	5	Mayo	4	Viernes	5	f
20180505	2018-05-05	2018	2	5	Mayo	5	Sábado	6	t
20180506	2018-05-06	2018	2	5	Mayo	6	Domingo	7	t
20180507	2018-05-07	2018	2	5	Mayo	7	Lunes	1	f
20180508	2018-05-08	2018	2	5	Mayo	8	Martes	2	f
20180509	2018-05-09	2018	2	5	Mayo	9	Miércoles	3	f
20180510	2018-05-10	2018	2	5	Mayo	10	Jueves	4	f
20180511	2018-05-11	2018	2	5	Mayo	11	Viernes	5	f
20180512	2018-05-12	2018	2	5	Mayo	12	Sábado	6	t
20180513	2018-05-13	2018	2	5	Mayo	13	Domingo	7	t
20180514	2018-05-14	2018	2	5	Mayo	14	Lunes	1	f
20180515	2018-05-15	2018	2	5	Mayo	15	Martes	2	f
20180516	2018-05-16	2018	2	5	Mayo	16	Miércoles	3	f
20180517	2018-05-17	2018	2	5	Mayo	17	Jueves	4	f
20180518	2018-05-18	2018	2	5	Mayo	18	Viernes	5	f
20180519	2018-05-19	2018	2	5	Mayo	19	Sábado	6	t
20180520	2018-05-20	2018	2	5	Mayo	20	Domingo	7	t
20180521	2018-05-21	2018	2	5	Mayo	21	Lunes	1	f
20180522	2018-05-22	2018	2	5	Mayo	22	Martes	2	f
20180523	2018-05-23	2018	2	5	Mayo	23	Miércoles	3	f
20180524	2018-05-24	2018	2	5	Mayo	24	Jueves	4	f
20180525	2018-05-25	2018	2	5	Mayo	25	Viernes	5	f
20180526	2018-05-26	2018	2	5	Mayo	26	Sábado	6	t
20180527	2018-05-27	2018	2	5	Mayo	27	Domingo	7	t
20180528	2018-05-28	2018	2	5	Mayo	28	Lunes	1	f
20180529	2018-05-29	2018	2	5	Mayo	29	Martes	2	f
20180530	2018-05-30	2018	2	5	Mayo	30	Miércoles	3	f
20180531	2018-05-31	2018	2	5	Mayo	31	Jueves	4	f
20180601	2018-06-01	2018	2	6	Junio	1	Viernes	5	f
20180602	2018-06-02	2018	2	6	Junio	2	Sábado	6	t
20180603	2018-06-03	2018	2	6	Junio	3	Domingo	7	t
20180604	2018-06-04	2018	2	6	Junio	4	Lunes	1	f
20180605	2018-06-05	2018	2	6	Junio	5	Martes	2	f
20180606	2018-06-06	2018	2	6	Junio	6	Miércoles	3	f
20180607	2018-06-07	2018	2	6	Junio	7	Jueves	4	f
20180608	2018-06-08	2018	2	6	Junio	8	Viernes	5	f
20180609	2018-06-09	2018	2	6	Junio	9	Sábado	6	t
20180610	2018-06-10	2018	2	6	Junio	10	Domingo	7	t
20180611	2018-06-11	2018	2	6	Junio	11	Lunes	1	f
20180612	2018-06-12	2018	2	6	Junio	12	Martes	2	f
20180613	2018-06-13	2018	2	6	Junio	13	Miércoles	3	f
20180614	2018-06-14	2018	2	6	Junio	14	Jueves	4	f
20180615	2018-06-15	2018	2	6	Junio	15	Viernes	5	f
20180616	2018-06-16	2018	2	6	Junio	16	Sábado	6	t
20180617	2018-06-17	2018	2	6	Junio	17	Domingo	7	t
20180618	2018-06-18	2018	2	6	Junio	18	Lunes	1	f
20180619	2018-06-19	2018	2	6	Junio	19	Martes	2	f
20180620	2018-06-20	2018	2	6	Junio	20	Miércoles	3	f
20180621	2018-06-21	2018	2	6	Junio	21	Jueves	4	f
20180622	2018-06-22	2018	2	6	Junio	22	Viernes	5	f
20180623	2018-06-23	2018	2	6	Junio	23	Sábado	6	t
20180624	2018-06-24	2018	2	6	Junio	24	Domingo	7	t
20180625	2018-06-25	2018	2	6	Junio	25	Lunes	1	f
20180626	2018-06-26	2018	2	6	Junio	26	Martes	2	f
20180627	2018-06-27	2018	2	6	Junio	27	Miércoles	3	f
20180628	2018-06-28	2018	2	6	Junio	28	Jueves	4	f
20180629	2018-06-29	2018	2	6	Junio	29	Viernes	5	f
20180630	2018-06-30	2018	2	6	Junio	30	Sábado	6	t
20180701	2018-07-01	2018	3	7	Julio	1	Domingo	7	t
20180702	2018-07-02	2018	3	7	Julio	2	Lunes	1	f
20180703	2018-07-03	2018	3	7	Julio	3	Martes	2	f
20180704	2018-07-04	2018	3	7	Julio	4	Miércoles	3	f
20180705	2018-07-05	2018	3	7	Julio	5	Jueves	4	f
20180706	2018-07-06	2018	3	7	Julio	6	Viernes	5	f
20180707	2018-07-07	2018	3	7	Julio	7	Sábado	6	t
20180708	2018-07-08	2018	3	7	Julio	8	Domingo	7	t
20180709	2018-07-09	2018	3	7	Julio	9	Lunes	1	f
20180710	2018-07-10	2018	3	7	Julio	10	Martes	2	f
20180711	2018-07-11	2018	3	7	Julio	11	Miércoles	3	f
20180712	2018-07-12	2018	3	7	Julio	12	Jueves	4	f
20180713	2018-07-13	2018	3	7	Julio	13	Viernes	5	f
20180714	2018-07-14	2018	3	7	Julio	14	Sábado	6	t
20180715	2018-07-15	2018	3	7	Julio	15	Domingo	7	t
20180716	2018-07-16	2018	3	7	Julio	16	Lunes	1	f
20180717	2018-07-17	2018	3	7	Julio	17	Martes	2	f
20180718	2018-07-18	2018	3	7	Julio	18	Miércoles	3	f
20180719	2018-07-19	2018	3	7	Julio	19	Jueves	4	f
20180720	2018-07-20	2018	3	7	Julio	20	Viernes	5	f
20180721	2018-07-21	2018	3	7	Julio	21	Sábado	6	t
20180722	2018-07-22	2018	3	7	Julio	22	Domingo	7	t
20180723	2018-07-23	2018	3	7	Julio	23	Lunes	1	f
20180724	2018-07-24	2018	3	7	Julio	24	Martes	2	f
20180725	2018-07-25	2018	3	7	Julio	25	Miércoles	3	f
20180726	2018-07-26	2018	3	7	Julio	26	Jueves	4	f
20180727	2018-07-27	2018	3	7	Julio	27	Viernes	5	f
20180728	2018-07-28	2018	3	7	Julio	28	Sábado	6	t
20180729	2018-07-29	2018	3	7	Julio	29	Domingo	7	t
20180730	2018-07-30	2018	3	7	Julio	30	Lunes	1	f
20180731	2018-07-31	2018	3	7	Julio	31	Martes	2	f
20180801	2018-08-01	2018	3	8	Agosto	1	Miércoles	3	f
20180802	2018-08-02	2018	3	8	Agosto	2	Jueves	4	f
20180803	2018-08-03	2018	3	8	Agosto	3	Viernes	5	f
20180804	2018-08-04	2018	3	8	Agosto	4	Sábado	6	t
20180805	2018-08-05	2018	3	8	Agosto	5	Domingo	7	t
20180806	2018-08-06	2018	3	8	Agosto	6	Lunes	1	f
20180807	2018-08-07	2018	3	8	Agosto	7	Martes	2	f
20180808	2018-08-08	2018	3	8	Agosto	8	Miércoles	3	f
20180809	2018-08-09	2018	3	8	Agosto	9	Jueves	4	f
20180810	2018-08-10	2018	3	8	Agosto	10	Viernes	5	f
20180811	2018-08-11	2018	3	8	Agosto	11	Sábado	6	t
20180812	2018-08-12	2018	3	8	Agosto	12	Domingo	7	t
20180813	2018-08-13	2018	3	8	Agosto	13	Lunes	1	f
20180814	2018-08-14	2018	3	8	Agosto	14	Martes	2	f
20180815	2018-08-15	2018	3	8	Agosto	15	Miércoles	3	f
20180816	2018-08-16	2018	3	8	Agosto	16	Jueves	4	f
20180817	2018-08-17	2018	3	8	Agosto	17	Viernes	5	f
20180818	2018-08-18	2018	3	8	Agosto	18	Sábado	6	t
20180819	2018-08-19	2018	3	8	Agosto	19	Domingo	7	t
20180820	2018-08-20	2018	3	8	Agosto	20	Lunes	1	f
20180821	2018-08-21	2018	3	8	Agosto	21	Martes	2	f
20180822	2018-08-22	2018	3	8	Agosto	22	Miércoles	3	f
20180823	2018-08-23	2018	3	8	Agosto	23	Jueves	4	f
20180824	2018-08-24	2018	3	8	Agosto	24	Viernes	5	f
20180825	2018-08-25	2018	3	8	Agosto	25	Sábado	6	t
20180826	2018-08-26	2018	3	8	Agosto	26	Domingo	7	t
20180827	2018-08-27	2018	3	8	Agosto	27	Lunes	1	f
20180828	2018-08-28	2018	3	8	Agosto	28	Martes	2	f
20180829	2018-08-29	2018	3	8	Agosto	29	Miércoles	3	f
20180830	2018-08-30	2018	3	8	Agosto	30	Jueves	4	f
20180831	2018-08-31	2018	3	8	Agosto	31	Viernes	5	f
20180901	2018-09-01	2018	3	9	Septiembre	1	Sábado	6	t
20180902	2018-09-02	2018	3	9	Septiembre	2	Domingo	7	t
20180903	2018-09-03	2018	3	9	Septiembre	3	Lunes	1	f
20180904	2018-09-04	2018	3	9	Septiembre	4	Martes	2	f
20180905	2018-09-05	2018	3	9	Septiembre	5	Miércoles	3	f
20180906	2018-09-06	2018	3	9	Septiembre	6	Jueves	4	f
20180907	2018-09-07	2018	3	9	Septiembre	7	Viernes	5	f
20180908	2018-09-08	2018	3	9	Septiembre	8	Sábado	6	t
20180909	2018-09-09	2018	3	9	Septiembre	9	Domingo	7	t
20180910	2018-09-10	2018	3	9	Septiembre	10	Lunes	1	f
20180911	2018-09-11	2018	3	9	Septiembre	11	Martes	2	f
20180912	2018-09-12	2018	3	9	Septiembre	12	Miércoles	3	f
20180913	2018-09-13	2018	3	9	Septiembre	13	Jueves	4	f
20180914	2018-09-14	2018	3	9	Septiembre	14	Viernes	5	f
20180915	2018-09-15	2018	3	9	Septiembre	15	Sábado	6	t
20180916	2018-09-16	2018	3	9	Septiembre	16	Domingo	7	t
20180917	2018-09-17	2018	3	9	Septiembre	17	Lunes	1	f
20180918	2018-09-18	2018	3	9	Septiembre	18	Martes	2	f
20180919	2018-09-19	2018	3	9	Septiembre	19	Miércoles	3	f
20180920	2018-09-20	2018	3	9	Septiembre	20	Jueves	4	f
20180921	2018-09-21	2018	3	9	Septiembre	21	Viernes	5	f
20180922	2018-09-22	2018	3	9	Septiembre	22	Sábado	6	t
20180923	2018-09-23	2018	3	9	Septiembre	23	Domingo	7	t
20180924	2018-09-24	2018	3	9	Septiembre	24	Lunes	1	f
20180925	2018-09-25	2018	3	9	Septiembre	25	Martes	2	f
20180926	2018-09-26	2018	3	9	Septiembre	26	Miércoles	3	f
20180927	2018-09-27	2018	3	9	Septiembre	27	Jueves	4	f
20180928	2018-09-28	2018	3	9	Septiembre	28	Viernes	5	f
20180929	2018-09-29	2018	3	9	Septiembre	29	Sábado	6	t
20180930	2018-09-30	2018	3	9	Septiembre	30	Domingo	7	t
20181001	2018-10-01	2018	4	10	Octubre	1	Lunes	1	f
20181002	2018-10-02	2018	4	10	Octubre	2	Martes	2	f
20181003	2018-10-03	2018	4	10	Octubre	3	Miércoles	3	f
20181004	2018-10-04	2018	4	10	Octubre	4	Jueves	4	f
20181005	2018-10-05	2018	4	10	Octubre	5	Viernes	5	f
20181006	2018-10-06	2018	4	10	Octubre	6	Sábado	6	t
20181007	2018-10-07	2018	4	10	Octubre	7	Domingo	7	t
20181008	2018-10-08	2018	4	10	Octubre	8	Lunes	1	f
20181009	2018-10-09	2018	4	10	Octubre	9	Martes	2	f
20181010	2018-10-10	2018	4	10	Octubre	10	Miércoles	3	f
20181011	2018-10-11	2018	4	10	Octubre	11	Jueves	4	f
20181012	2018-10-12	2018	4	10	Octubre	12	Viernes	5	f
20181013	2018-10-13	2018	4	10	Octubre	13	Sábado	6	t
20181014	2018-10-14	2018	4	10	Octubre	14	Domingo	7	t
20181015	2018-10-15	2018	4	10	Octubre	15	Lunes	1	f
20181016	2018-10-16	2018	4	10	Octubre	16	Martes	2	f
20181017	2018-10-17	2018	4	10	Octubre	17	Miércoles	3	f
20181018	2018-10-18	2018	4	10	Octubre	18	Jueves	4	f
20181019	2018-10-19	2018	4	10	Octubre	19	Viernes	5	f
20181020	2018-10-20	2018	4	10	Octubre	20	Sábado	6	t
20181021	2018-10-21	2018	4	10	Octubre	21	Domingo	7	t
20181022	2018-10-22	2018	4	10	Octubre	22	Lunes	1	f
20181023	2018-10-23	2018	4	10	Octubre	23	Martes	2	f
20181024	2018-10-24	2018	4	10	Octubre	24	Miércoles	3	f
20181025	2018-10-25	2018	4	10	Octubre	25	Jueves	4	f
20181026	2018-10-26	2018	4	10	Octubre	26	Viernes	5	f
20181027	2018-10-27	2018	4	10	Octubre	27	Sábado	6	t
20181028	2018-10-28	2018	4	10	Octubre	28	Domingo	7	t
20181029	2018-10-29	2018	4	10	Octubre	29	Lunes	1	f
20181030	2018-10-30	2018	4	10	Octubre	30	Martes	2	f
20181031	2018-10-31	2018	4	10	Octubre	31	Miércoles	3	f
20181101	2018-11-01	2018	4	11	Noviembre	1	Jueves	4	f
20181102	2018-11-02	2018	4	11	Noviembre	2	Viernes	5	f
20181103	2018-11-03	2018	4	11	Noviembre	3	Sábado	6	t
20181104	2018-11-04	2018	4	11	Noviembre	4	Domingo	7	t
20181105	2018-11-05	2018	4	11	Noviembre	5	Lunes	1	f
20181106	2018-11-06	2018	4	11	Noviembre	6	Martes	2	f
20181107	2018-11-07	2018	4	11	Noviembre	7	Miércoles	3	f
20181108	2018-11-08	2018	4	11	Noviembre	8	Jueves	4	f
20181109	2018-11-09	2018	4	11	Noviembre	9	Viernes	5	f
20181110	2018-11-10	2018	4	11	Noviembre	10	Sábado	6	t
20181111	2018-11-11	2018	4	11	Noviembre	11	Domingo	7	t
20181112	2018-11-12	2018	4	11	Noviembre	12	Lunes	1	f
20181113	2018-11-13	2018	4	11	Noviembre	13	Martes	2	f
20181114	2018-11-14	2018	4	11	Noviembre	14	Miércoles	3	f
20181115	2018-11-15	2018	4	11	Noviembre	15	Jueves	4	f
20181116	2018-11-16	2018	4	11	Noviembre	16	Viernes	5	f
20181117	2018-11-17	2018	4	11	Noviembre	17	Sábado	6	t
20181118	2018-11-18	2018	4	11	Noviembre	18	Domingo	7	t
20181119	2018-11-19	2018	4	11	Noviembre	19	Lunes	1	f
20181120	2018-11-20	2018	4	11	Noviembre	20	Martes	2	f
20181121	2018-11-21	2018	4	11	Noviembre	21	Miércoles	3	f
20181122	2018-11-22	2018	4	11	Noviembre	22	Jueves	4	f
20181123	2018-11-23	2018	4	11	Noviembre	23	Viernes	5	f
20181124	2018-11-24	2018	4	11	Noviembre	24	Sábado	6	t
20181125	2018-11-25	2018	4	11	Noviembre	25	Domingo	7	t
20181126	2018-11-26	2018	4	11	Noviembre	26	Lunes	1	f
20181127	2018-11-27	2018	4	11	Noviembre	27	Martes	2	f
20181128	2018-11-28	2018	4	11	Noviembre	28	Miércoles	3	f
20181129	2018-11-29	2018	4	11	Noviembre	29	Jueves	4	f
20181130	2018-11-30	2018	4	11	Noviembre	30	Viernes	5	f
20181201	2018-12-01	2018	4	12	Diciembre	1	Sábado	6	t
20181202	2018-12-02	2018	4	12	Diciembre	2	Domingo	7	t
20181203	2018-12-03	2018	4	12	Diciembre	3	Lunes	1	f
20181204	2018-12-04	2018	4	12	Diciembre	4	Martes	2	f
20181205	2018-12-05	2018	4	12	Diciembre	5	Miércoles	3	f
20181206	2018-12-06	2018	4	12	Diciembre	6	Jueves	4	f
20181207	2018-12-07	2018	4	12	Diciembre	7	Viernes	5	f
20181208	2018-12-08	2018	4	12	Diciembre	8	Sábado	6	t
20181209	2018-12-09	2018	4	12	Diciembre	9	Domingo	7	t
20181210	2018-12-10	2018	4	12	Diciembre	10	Lunes	1	f
20181211	2018-12-11	2018	4	12	Diciembre	11	Martes	2	f
20181212	2018-12-12	2018	4	12	Diciembre	12	Miércoles	3	f
20181213	2018-12-13	2018	4	12	Diciembre	13	Jueves	4	f
20181214	2018-12-14	2018	4	12	Diciembre	14	Viernes	5	f
20181215	2018-12-15	2018	4	12	Diciembre	15	Sábado	6	t
20181216	2018-12-16	2018	4	12	Diciembre	16	Domingo	7	t
20181217	2018-12-17	2018	4	12	Diciembre	17	Lunes	1	f
20181218	2018-12-18	2018	4	12	Diciembre	18	Martes	2	f
20181219	2018-12-19	2018	4	12	Diciembre	19	Miércoles	3	f
20181220	2018-12-20	2018	4	12	Diciembre	20	Jueves	4	f
20181221	2018-12-21	2018	4	12	Diciembre	21	Viernes	5	f
20181222	2018-12-22	2018	4	12	Diciembre	22	Sábado	6	t
20181223	2018-12-23	2018	4	12	Diciembre	23	Domingo	7	t
20181224	2018-12-24	2018	4	12	Diciembre	24	Lunes	1	f
20181225	2018-12-25	2018	4	12	Diciembre	25	Martes	2	f
20181226	2018-12-26	2018	4	12	Diciembre	26	Miércoles	3	f
20181227	2018-12-27	2018	4	12	Diciembre	27	Jueves	4	f
20181228	2018-12-28	2018	4	12	Diciembre	28	Viernes	5	f
20181229	2018-12-29	2018	4	12	Diciembre	29	Sábado	6	t
20181230	2018-12-30	2018	4	12	Diciembre	30	Domingo	7	t
20181231	2018-12-31	2018	4	12	Diciembre	31	Lunes	1	f
20190101	2019-01-01	2019	1	1	Enero	1	Martes	2	f
20190102	2019-01-02	2019	1	1	Enero	2	Miércoles	3	f
20190103	2019-01-03	2019	1	1	Enero	3	Jueves	4	f
20190104	2019-01-04	2019	1	1	Enero	4	Viernes	5	f
20190105	2019-01-05	2019	1	1	Enero	5	Sábado	6	t
20190106	2019-01-06	2019	1	1	Enero	6	Domingo	7	t
20190107	2019-01-07	2019	1	1	Enero	7	Lunes	1	f
20190108	2019-01-08	2019	1	1	Enero	8	Martes	2	f
20190109	2019-01-09	2019	1	1	Enero	9	Miércoles	3	f
20190110	2019-01-10	2019	1	1	Enero	10	Jueves	4	f
20190111	2019-01-11	2019	1	1	Enero	11	Viernes	5	f
20190112	2019-01-12	2019	1	1	Enero	12	Sábado	6	t
20190113	2019-01-13	2019	1	1	Enero	13	Domingo	7	t
20190114	2019-01-14	2019	1	1	Enero	14	Lunes	1	f
20190115	2019-01-15	2019	1	1	Enero	15	Martes	2	f
20190116	2019-01-16	2019	1	1	Enero	16	Miércoles	3	f
20190117	2019-01-17	2019	1	1	Enero	17	Jueves	4	f
20190118	2019-01-18	2019	1	1	Enero	18	Viernes	5	f
20190119	2019-01-19	2019	1	1	Enero	19	Sábado	6	t
20190120	2019-01-20	2019	1	1	Enero	20	Domingo	7	t
20190121	2019-01-21	2019	1	1	Enero	21	Lunes	1	f
20190122	2019-01-22	2019	1	1	Enero	22	Martes	2	f
20190123	2019-01-23	2019	1	1	Enero	23	Miércoles	3	f
20190124	2019-01-24	2019	1	1	Enero	24	Jueves	4	f
20190125	2019-01-25	2019	1	1	Enero	25	Viernes	5	f
20190126	2019-01-26	2019	1	1	Enero	26	Sábado	6	t
20190127	2019-01-27	2019	1	1	Enero	27	Domingo	7	t
20190128	2019-01-28	2019	1	1	Enero	28	Lunes	1	f
20190129	2019-01-29	2019	1	1	Enero	29	Martes	2	f
20190130	2019-01-30	2019	1	1	Enero	30	Miércoles	3	f
20190131	2019-01-31	2019	1	1	Enero	31	Jueves	4	f
20190201	2019-02-01	2019	1	2	Febrero	1	Viernes	5	f
20190202	2019-02-02	2019	1	2	Febrero	2	Sábado	6	t
20190203	2019-02-03	2019	1	2	Febrero	3	Domingo	7	t
20190204	2019-02-04	2019	1	2	Febrero	4	Lunes	1	f
20190205	2019-02-05	2019	1	2	Febrero	5	Martes	2	f
20190206	2019-02-06	2019	1	2	Febrero	6	Miércoles	3	f
20190207	2019-02-07	2019	1	2	Febrero	7	Jueves	4	f
20190208	2019-02-08	2019	1	2	Febrero	8	Viernes	5	f
20190209	2019-02-09	2019	1	2	Febrero	9	Sábado	6	t
20190210	2019-02-10	2019	1	2	Febrero	10	Domingo	7	t
20190211	2019-02-11	2019	1	2	Febrero	11	Lunes	1	f
20190212	2019-02-12	2019	1	2	Febrero	12	Martes	2	f
20190213	2019-02-13	2019	1	2	Febrero	13	Miércoles	3	f
20190214	2019-02-14	2019	1	2	Febrero	14	Jueves	4	f
20190215	2019-02-15	2019	1	2	Febrero	15	Viernes	5	f
20190216	2019-02-16	2019	1	2	Febrero	16	Sábado	6	t
20190217	2019-02-17	2019	1	2	Febrero	17	Domingo	7	t
20190218	2019-02-18	2019	1	2	Febrero	18	Lunes	1	f
20190219	2019-02-19	2019	1	2	Febrero	19	Martes	2	f
20190220	2019-02-20	2019	1	2	Febrero	20	Miércoles	3	f
20190221	2019-02-21	2019	1	2	Febrero	21	Jueves	4	f
20190222	2019-02-22	2019	1	2	Febrero	22	Viernes	5	f
20190223	2019-02-23	2019	1	2	Febrero	23	Sábado	6	t
20190224	2019-02-24	2019	1	2	Febrero	24	Domingo	7	t
20190225	2019-02-25	2019	1	2	Febrero	25	Lunes	1	f
20190226	2019-02-26	2019	1	2	Febrero	26	Martes	2	f
20190227	2019-02-27	2019	1	2	Febrero	27	Miércoles	3	f
20190228	2019-02-28	2019	1	2	Febrero	28	Jueves	4	f
20190301	2019-03-01	2019	1	3	Marzo	1	Viernes	5	f
20190302	2019-03-02	2019	1	3	Marzo	2	Sábado	6	t
20190303	2019-03-03	2019	1	3	Marzo	3	Domingo	7	t
20190304	2019-03-04	2019	1	3	Marzo	4	Lunes	1	f
20190305	2019-03-05	2019	1	3	Marzo	5	Martes	2	f
20190306	2019-03-06	2019	1	3	Marzo	6	Miércoles	3	f
20190307	2019-03-07	2019	1	3	Marzo	7	Jueves	4	f
20190308	2019-03-08	2019	1	3	Marzo	8	Viernes	5	f
20190309	2019-03-09	2019	1	3	Marzo	9	Sábado	6	t
20190310	2019-03-10	2019	1	3	Marzo	10	Domingo	7	t
20190311	2019-03-11	2019	1	3	Marzo	11	Lunes	1	f
20190312	2019-03-12	2019	1	3	Marzo	12	Martes	2	f
20190313	2019-03-13	2019	1	3	Marzo	13	Miércoles	3	f
20190314	2019-03-14	2019	1	3	Marzo	14	Jueves	4	f
20190315	2019-03-15	2019	1	3	Marzo	15	Viernes	5	f
20190316	2019-03-16	2019	1	3	Marzo	16	Sábado	6	t
20190317	2019-03-17	2019	1	3	Marzo	17	Domingo	7	t
20190318	2019-03-18	2019	1	3	Marzo	18	Lunes	1	f
20190319	2019-03-19	2019	1	3	Marzo	19	Martes	2	f
20190320	2019-03-20	2019	1	3	Marzo	20	Miércoles	3	f
20190321	2019-03-21	2019	1	3	Marzo	21	Jueves	4	f
20190322	2019-03-22	2019	1	3	Marzo	22	Viernes	5	f
20190323	2019-03-23	2019	1	3	Marzo	23	Sábado	6	t
20190324	2019-03-24	2019	1	3	Marzo	24	Domingo	7	t
20190325	2019-03-25	2019	1	3	Marzo	25	Lunes	1	f
20190326	2019-03-26	2019	1	3	Marzo	26	Martes	2	f
20190327	2019-03-27	2019	1	3	Marzo	27	Miércoles	3	f
20190328	2019-03-28	2019	1	3	Marzo	28	Jueves	4	f
20190329	2019-03-29	2019	1	3	Marzo	29	Viernes	5	f
20190330	2019-03-30	2019	1	3	Marzo	30	Sábado	6	t
20190331	2019-03-31	2019	1	3	Marzo	31	Domingo	7	t
20190401	2019-04-01	2019	2	4	Abril	1	Lunes	1	f
20190402	2019-04-02	2019	2	4	Abril	2	Martes	2	f
20190403	2019-04-03	2019	2	4	Abril	3	Miércoles	3	f
20190404	2019-04-04	2019	2	4	Abril	4	Jueves	4	f
20190405	2019-04-05	2019	2	4	Abril	5	Viernes	5	f
20190406	2019-04-06	2019	2	4	Abril	6	Sábado	6	t
20190407	2019-04-07	2019	2	4	Abril	7	Domingo	7	t
20190408	2019-04-08	2019	2	4	Abril	8	Lunes	1	f
20190409	2019-04-09	2019	2	4	Abril	9	Martes	2	f
20190410	2019-04-10	2019	2	4	Abril	10	Miércoles	3	f
20190411	2019-04-11	2019	2	4	Abril	11	Jueves	4	f
20190412	2019-04-12	2019	2	4	Abril	12	Viernes	5	f
20190413	2019-04-13	2019	2	4	Abril	13	Sábado	6	t
20190414	2019-04-14	2019	2	4	Abril	14	Domingo	7	t
20190415	2019-04-15	2019	2	4	Abril	15	Lunes	1	f
20190416	2019-04-16	2019	2	4	Abril	16	Martes	2	f
20190417	2019-04-17	2019	2	4	Abril	17	Miércoles	3	f
20190418	2019-04-18	2019	2	4	Abril	18	Jueves	4	f
20190419	2019-04-19	2019	2	4	Abril	19	Viernes	5	f
20190420	2019-04-20	2019	2	4	Abril	20	Sábado	6	t
20190421	2019-04-21	2019	2	4	Abril	21	Domingo	7	t
20190422	2019-04-22	2019	2	4	Abril	22	Lunes	1	f
20190423	2019-04-23	2019	2	4	Abril	23	Martes	2	f
20190424	2019-04-24	2019	2	4	Abril	24	Miércoles	3	f
20190425	2019-04-25	2019	2	4	Abril	25	Jueves	4	f
20190426	2019-04-26	2019	2	4	Abril	26	Viernes	5	f
20190427	2019-04-27	2019	2	4	Abril	27	Sábado	6	t
20190428	2019-04-28	2019	2	4	Abril	28	Domingo	7	t
20190429	2019-04-29	2019	2	4	Abril	29	Lunes	1	f
20190430	2019-04-30	2019	2	4	Abril	30	Martes	2	f
20190501	2019-05-01	2019	2	5	Mayo	1	Miércoles	3	f
20190502	2019-05-02	2019	2	5	Mayo	2	Jueves	4	f
20190503	2019-05-03	2019	2	5	Mayo	3	Viernes	5	f
20190504	2019-05-04	2019	2	5	Mayo	4	Sábado	6	t
20190505	2019-05-05	2019	2	5	Mayo	5	Domingo	7	t
20190506	2019-05-06	2019	2	5	Mayo	6	Lunes	1	f
20190507	2019-05-07	2019	2	5	Mayo	7	Martes	2	f
20190508	2019-05-08	2019	2	5	Mayo	8	Miércoles	3	f
20190509	2019-05-09	2019	2	5	Mayo	9	Jueves	4	f
20190510	2019-05-10	2019	2	5	Mayo	10	Viernes	5	f
20190511	2019-05-11	2019	2	5	Mayo	11	Sábado	6	t
20190512	2019-05-12	2019	2	5	Mayo	12	Domingo	7	t
20190513	2019-05-13	2019	2	5	Mayo	13	Lunes	1	f
20190514	2019-05-14	2019	2	5	Mayo	14	Martes	2	f
20190515	2019-05-15	2019	2	5	Mayo	15	Miércoles	3	f
20190516	2019-05-16	2019	2	5	Mayo	16	Jueves	4	f
20190517	2019-05-17	2019	2	5	Mayo	17	Viernes	5	f
20190518	2019-05-18	2019	2	5	Mayo	18	Sábado	6	t
20190519	2019-05-19	2019	2	5	Mayo	19	Domingo	7	t
20190520	2019-05-20	2019	2	5	Mayo	20	Lunes	1	f
20190521	2019-05-21	2019	2	5	Mayo	21	Martes	2	f
20190522	2019-05-22	2019	2	5	Mayo	22	Miércoles	3	f
20190523	2019-05-23	2019	2	5	Mayo	23	Jueves	4	f
20190524	2019-05-24	2019	2	5	Mayo	24	Viernes	5	f
20190525	2019-05-25	2019	2	5	Mayo	25	Sábado	6	t
20190526	2019-05-26	2019	2	5	Mayo	26	Domingo	7	t
20190527	2019-05-27	2019	2	5	Mayo	27	Lunes	1	f
20190528	2019-05-28	2019	2	5	Mayo	28	Martes	2	f
20190529	2019-05-29	2019	2	5	Mayo	29	Miércoles	3	f
20190530	2019-05-30	2019	2	5	Mayo	30	Jueves	4	f
20190531	2019-05-31	2019	2	5	Mayo	31	Viernes	5	f
20190601	2019-06-01	2019	2	6	Junio	1	Sábado	6	t
20190602	2019-06-02	2019	2	6	Junio	2	Domingo	7	t
20190603	2019-06-03	2019	2	6	Junio	3	Lunes	1	f
20190604	2019-06-04	2019	2	6	Junio	4	Martes	2	f
20190605	2019-06-05	2019	2	6	Junio	5	Miércoles	3	f
20190606	2019-06-06	2019	2	6	Junio	6	Jueves	4	f
20190607	2019-06-07	2019	2	6	Junio	7	Viernes	5	f
20190608	2019-06-08	2019	2	6	Junio	8	Sábado	6	t
20190609	2019-06-09	2019	2	6	Junio	9	Domingo	7	t
20190610	2019-06-10	2019	2	6	Junio	10	Lunes	1	f
20190611	2019-06-11	2019	2	6	Junio	11	Martes	2	f
20190612	2019-06-12	2019	2	6	Junio	12	Miércoles	3	f
20190613	2019-06-13	2019	2	6	Junio	13	Jueves	4	f
20190614	2019-06-14	2019	2	6	Junio	14	Viernes	5	f
20190615	2019-06-15	2019	2	6	Junio	15	Sábado	6	t
20190616	2019-06-16	2019	2	6	Junio	16	Domingo	7	t
20190617	2019-06-17	2019	2	6	Junio	17	Lunes	1	f
20190618	2019-06-18	2019	2	6	Junio	18	Martes	2	f
20190619	2019-06-19	2019	2	6	Junio	19	Miércoles	3	f
20190620	2019-06-20	2019	2	6	Junio	20	Jueves	4	f
20190621	2019-06-21	2019	2	6	Junio	21	Viernes	5	f
20190622	2019-06-22	2019	2	6	Junio	22	Sábado	6	t
20190623	2019-06-23	2019	2	6	Junio	23	Domingo	7	t
20190624	2019-06-24	2019	2	6	Junio	24	Lunes	1	f
20190625	2019-06-25	2019	2	6	Junio	25	Martes	2	f
20190626	2019-06-26	2019	2	6	Junio	26	Miércoles	3	f
20190627	2019-06-27	2019	2	6	Junio	27	Jueves	4	f
20190628	2019-06-28	2019	2	6	Junio	28	Viernes	5	f
20190629	2019-06-29	2019	2	6	Junio	29	Sábado	6	t
20190630	2019-06-30	2019	2	6	Junio	30	Domingo	7	t
20190701	2019-07-01	2019	3	7	Julio	1	Lunes	1	f
20190702	2019-07-02	2019	3	7	Julio	2	Martes	2	f
20190703	2019-07-03	2019	3	7	Julio	3	Miércoles	3	f
20190704	2019-07-04	2019	3	7	Julio	4	Jueves	4	f
20190705	2019-07-05	2019	3	7	Julio	5	Viernes	5	f
20190706	2019-07-06	2019	3	7	Julio	6	Sábado	6	t
20190707	2019-07-07	2019	3	7	Julio	7	Domingo	7	t
20190708	2019-07-08	2019	3	7	Julio	8	Lunes	1	f
20190709	2019-07-09	2019	3	7	Julio	9	Martes	2	f
20190710	2019-07-10	2019	3	7	Julio	10	Miércoles	3	f
20190711	2019-07-11	2019	3	7	Julio	11	Jueves	4	f
20190712	2019-07-12	2019	3	7	Julio	12	Viernes	5	f
20190713	2019-07-13	2019	3	7	Julio	13	Sábado	6	t
20190714	2019-07-14	2019	3	7	Julio	14	Domingo	7	t
20190715	2019-07-15	2019	3	7	Julio	15	Lunes	1	f
20190716	2019-07-16	2019	3	7	Julio	16	Martes	2	f
20190717	2019-07-17	2019	3	7	Julio	17	Miércoles	3	f
20190718	2019-07-18	2019	3	7	Julio	18	Jueves	4	f
20190719	2019-07-19	2019	3	7	Julio	19	Viernes	5	f
20190720	2019-07-20	2019	3	7	Julio	20	Sábado	6	t
20190721	2019-07-21	2019	3	7	Julio	21	Domingo	7	t
20190722	2019-07-22	2019	3	7	Julio	22	Lunes	1	f
20190723	2019-07-23	2019	3	7	Julio	23	Martes	2	f
20190724	2019-07-24	2019	3	7	Julio	24	Miércoles	3	f
20190725	2019-07-25	2019	3	7	Julio	25	Jueves	4	f
20190726	2019-07-26	2019	3	7	Julio	26	Viernes	5	f
20190727	2019-07-27	2019	3	7	Julio	27	Sábado	6	t
20190728	2019-07-28	2019	3	7	Julio	28	Domingo	7	t
20190729	2019-07-29	2019	3	7	Julio	29	Lunes	1	f
20190730	2019-07-30	2019	3	7	Julio	30	Martes	2	f
20190731	2019-07-31	2019	3	7	Julio	31	Miércoles	3	f
20190801	2019-08-01	2019	3	8	Agosto	1	Jueves	4	f
20190802	2019-08-02	2019	3	8	Agosto	2	Viernes	5	f
20190803	2019-08-03	2019	3	8	Agosto	3	Sábado	6	t
20190804	2019-08-04	2019	3	8	Agosto	4	Domingo	7	t
20190805	2019-08-05	2019	3	8	Agosto	5	Lunes	1	f
20190806	2019-08-06	2019	3	8	Agosto	6	Martes	2	f
20190807	2019-08-07	2019	3	8	Agosto	7	Miércoles	3	f
20190808	2019-08-08	2019	3	8	Agosto	8	Jueves	4	f
20190809	2019-08-09	2019	3	8	Agosto	9	Viernes	5	f
20190810	2019-08-10	2019	3	8	Agosto	10	Sábado	6	t
20190811	2019-08-11	2019	3	8	Agosto	11	Domingo	7	t
20190812	2019-08-12	2019	3	8	Agosto	12	Lunes	1	f
20190813	2019-08-13	2019	3	8	Agosto	13	Martes	2	f
20190814	2019-08-14	2019	3	8	Agosto	14	Miércoles	3	f
20190815	2019-08-15	2019	3	8	Agosto	15	Jueves	4	f
20190816	2019-08-16	2019	3	8	Agosto	16	Viernes	5	f
20190817	2019-08-17	2019	3	8	Agosto	17	Sábado	6	t
20190818	2019-08-18	2019	3	8	Agosto	18	Domingo	7	t
20190819	2019-08-19	2019	3	8	Agosto	19	Lunes	1	f
20190820	2019-08-20	2019	3	8	Agosto	20	Martes	2	f
20190821	2019-08-21	2019	3	8	Agosto	21	Miércoles	3	f
20190822	2019-08-22	2019	3	8	Agosto	22	Jueves	4	f
20190823	2019-08-23	2019	3	8	Agosto	23	Viernes	5	f
20190824	2019-08-24	2019	3	8	Agosto	24	Sábado	6	t
20190825	2019-08-25	2019	3	8	Agosto	25	Domingo	7	t
20190826	2019-08-26	2019	3	8	Agosto	26	Lunes	1	f
20190827	2019-08-27	2019	3	8	Agosto	27	Martes	2	f
20190828	2019-08-28	2019	3	8	Agosto	28	Miércoles	3	f
20190829	2019-08-29	2019	3	8	Agosto	29	Jueves	4	f
20190830	2019-08-30	2019	3	8	Agosto	30	Viernes	5	f
20190831	2019-08-31	2019	3	8	Agosto	31	Sábado	6	t
20190901	2019-09-01	2019	3	9	Septiembre	1	Domingo	7	t
20190902	2019-09-02	2019	3	9	Septiembre	2	Lunes	1	f
20190903	2019-09-03	2019	3	9	Septiembre	3	Martes	2	f
20190904	2019-09-04	2019	3	9	Septiembre	4	Miércoles	3	f
20190905	2019-09-05	2019	3	9	Septiembre	5	Jueves	4	f
20190906	2019-09-06	2019	3	9	Septiembre	6	Viernes	5	f
20190907	2019-09-07	2019	3	9	Septiembre	7	Sábado	6	t
20190908	2019-09-08	2019	3	9	Septiembre	8	Domingo	7	t
20190909	2019-09-09	2019	3	9	Septiembre	9	Lunes	1	f
20190910	2019-09-10	2019	3	9	Septiembre	10	Martes	2	f
20190911	2019-09-11	2019	3	9	Septiembre	11	Miércoles	3	f
20190912	2019-09-12	2019	3	9	Septiembre	12	Jueves	4	f
20190913	2019-09-13	2019	3	9	Septiembre	13	Viernes	5	f
20190914	2019-09-14	2019	3	9	Septiembre	14	Sábado	6	t
20190915	2019-09-15	2019	3	9	Septiembre	15	Domingo	7	t
20190916	2019-09-16	2019	3	9	Septiembre	16	Lunes	1	f
20190917	2019-09-17	2019	3	9	Septiembre	17	Martes	2	f
20190918	2019-09-18	2019	3	9	Septiembre	18	Miércoles	3	f
20190919	2019-09-19	2019	3	9	Septiembre	19	Jueves	4	f
20190920	2019-09-20	2019	3	9	Septiembre	20	Viernes	5	f
20190921	2019-09-21	2019	3	9	Septiembre	21	Sábado	6	t
20190922	2019-09-22	2019	3	9	Septiembre	22	Domingo	7	t
20190923	2019-09-23	2019	3	9	Septiembre	23	Lunes	1	f
20190924	2019-09-24	2019	3	9	Septiembre	24	Martes	2	f
20190925	2019-09-25	2019	3	9	Septiembre	25	Miércoles	3	f
20190926	2019-09-26	2019	3	9	Septiembre	26	Jueves	4	f
20190927	2019-09-27	2019	3	9	Septiembre	27	Viernes	5	f
20190928	2019-09-28	2019	3	9	Septiembre	28	Sábado	6	t
20190929	2019-09-29	2019	3	9	Septiembre	29	Domingo	7	t
20190930	2019-09-30	2019	3	9	Septiembre	30	Lunes	1	f
20191001	2019-10-01	2019	4	10	Octubre	1	Martes	2	f
20191002	2019-10-02	2019	4	10	Octubre	2	Miércoles	3	f
20191003	2019-10-03	2019	4	10	Octubre	3	Jueves	4	f
20191004	2019-10-04	2019	4	10	Octubre	4	Viernes	5	f
20191005	2019-10-05	2019	4	10	Octubre	5	Sábado	6	t
20191006	2019-10-06	2019	4	10	Octubre	6	Domingo	7	t
20191007	2019-10-07	2019	4	10	Octubre	7	Lunes	1	f
20191008	2019-10-08	2019	4	10	Octubre	8	Martes	2	f
20191009	2019-10-09	2019	4	10	Octubre	9	Miércoles	3	f
20191010	2019-10-10	2019	4	10	Octubre	10	Jueves	4	f
20191011	2019-10-11	2019	4	10	Octubre	11	Viernes	5	f
20191012	2019-10-12	2019	4	10	Octubre	12	Sábado	6	t
20191013	2019-10-13	2019	4	10	Octubre	13	Domingo	7	t
20191014	2019-10-14	2019	4	10	Octubre	14	Lunes	1	f
20191015	2019-10-15	2019	4	10	Octubre	15	Martes	2	f
20191016	2019-10-16	2019	4	10	Octubre	16	Miércoles	3	f
20191017	2019-10-17	2019	4	10	Octubre	17	Jueves	4	f
20191018	2019-10-18	2019	4	10	Octubre	18	Viernes	5	f
20191019	2019-10-19	2019	4	10	Octubre	19	Sábado	6	t
20191020	2019-10-20	2019	4	10	Octubre	20	Domingo	7	t
20191021	2019-10-21	2019	4	10	Octubre	21	Lunes	1	f
20191022	2019-10-22	2019	4	10	Octubre	22	Martes	2	f
20191023	2019-10-23	2019	4	10	Octubre	23	Miércoles	3	f
20191024	2019-10-24	2019	4	10	Octubre	24	Jueves	4	f
20191025	2019-10-25	2019	4	10	Octubre	25	Viernes	5	f
20191026	2019-10-26	2019	4	10	Octubre	26	Sábado	6	t
20191027	2019-10-27	2019	4	10	Octubre	27	Domingo	7	t
20191028	2019-10-28	2019	4	10	Octubre	28	Lunes	1	f
20191029	2019-10-29	2019	4	10	Octubre	29	Martes	2	f
20191030	2019-10-30	2019	4	10	Octubre	30	Miércoles	3	f
20191031	2019-10-31	2019	4	10	Octubre	31	Jueves	4	f
20191101	2019-11-01	2019	4	11	Noviembre	1	Viernes	5	f
20191102	2019-11-02	2019	4	11	Noviembre	2	Sábado	6	t
20191103	2019-11-03	2019	4	11	Noviembre	3	Domingo	7	t
20191104	2019-11-04	2019	4	11	Noviembre	4	Lunes	1	f
20191105	2019-11-05	2019	4	11	Noviembre	5	Martes	2	f
20191106	2019-11-06	2019	4	11	Noviembre	6	Miércoles	3	f
20191107	2019-11-07	2019	4	11	Noviembre	7	Jueves	4	f
20191108	2019-11-08	2019	4	11	Noviembre	8	Viernes	5	f
20191109	2019-11-09	2019	4	11	Noviembre	9	Sábado	6	t
20191110	2019-11-10	2019	4	11	Noviembre	10	Domingo	7	t
20191111	2019-11-11	2019	4	11	Noviembre	11	Lunes	1	f
20191112	2019-11-12	2019	4	11	Noviembre	12	Martes	2	f
20191113	2019-11-13	2019	4	11	Noviembre	13	Miércoles	3	f
20191114	2019-11-14	2019	4	11	Noviembre	14	Jueves	4	f
20191115	2019-11-15	2019	4	11	Noviembre	15	Viernes	5	f
20191116	2019-11-16	2019	4	11	Noviembre	16	Sábado	6	t
20191117	2019-11-17	2019	4	11	Noviembre	17	Domingo	7	t
20191118	2019-11-18	2019	4	11	Noviembre	18	Lunes	1	f
20191119	2019-11-19	2019	4	11	Noviembre	19	Martes	2	f
20191120	2019-11-20	2019	4	11	Noviembre	20	Miércoles	3	f
20191121	2019-11-21	2019	4	11	Noviembre	21	Jueves	4	f
20191122	2019-11-22	2019	4	11	Noviembre	22	Viernes	5	f
20191123	2019-11-23	2019	4	11	Noviembre	23	Sábado	6	t
20191124	2019-11-24	2019	4	11	Noviembre	24	Domingo	7	t
20191125	2019-11-25	2019	4	11	Noviembre	25	Lunes	1	f
20191126	2019-11-26	2019	4	11	Noviembre	26	Martes	2	f
20191127	2019-11-27	2019	4	11	Noviembre	27	Miércoles	3	f
20191128	2019-11-28	2019	4	11	Noviembre	28	Jueves	4	f
20191129	2019-11-29	2019	4	11	Noviembre	29	Viernes	5	f
20191130	2019-11-30	2019	4	11	Noviembre	30	Sábado	6	t
20191201	2019-12-01	2019	4	12	Diciembre	1	Domingo	7	t
20191202	2019-12-02	2019	4	12	Diciembre	2	Lunes	1	f
20191203	2019-12-03	2019	4	12	Diciembre	3	Martes	2	f
20191204	2019-12-04	2019	4	12	Diciembre	4	Miércoles	3	f
20191205	2019-12-05	2019	4	12	Diciembre	5	Jueves	4	f
20191206	2019-12-06	2019	4	12	Diciembre	6	Viernes	5	f
20191207	2019-12-07	2019	4	12	Diciembre	7	Sábado	6	t
20191208	2019-12-08	2019	4	12	Diciembre	8	Domingo	7	t
20191209	2019-12-09	2019	4	12	Diciembre	9	Lunes	1	f
20191210	2019-12-10	2019	4	12	Diciembre	10	Martes	2	f
20191211	2019-12-11	2019	4	12	Diciembre	11	Miércoles	3	f
20191212	2019-12-12	2019	4	12	Diciembre	12	Jueves	4	f
20191213	2019-12-13	2019	4	12	Diciembre	13	Viernes	5	f
20191214	2019-12-14	2019	4	12	Diciembre	14	Sábado	6	t
20191215	2019-12-15	2019	4	12	Diciembre	15	Domingo	7	t
20191216	2019-12-16	2019	4	12	Diciembre	16	Lunes	1	f
20191217	2019-12-17	2019	4	12	Diciembre	17	Martes	2	f
20191218	2019-12-18	2019	4	12	Diciembre	18	Miércoles	3	f
20191219	2019-12-19	2019	4	12	Diciembre	19	Jueves	4	f
20191220	2019-12-20	2019	4	12	Diciembre	20	Viernes	5	f
20191221	2019-12-21	2019	4	12	Diciembre	21	Sábado	6	t
20191222	2019-12-22	2019	4	12	Diciembre	22	Domingo	7	t
20191223	2019-12-23	2019	4	12	Diciembre	23	Lunes	1	f
20191224	2019-12-24	2019	4	12	Diciembre	24	Martes	2	f
20191225	2019-12-25	2019	4	12	Diciembre	25	Miércoles	3	f
20191226	2019-12-26	2019	4	12	Diciembre	26	Jueves	4	f
20191227	2019-12-27	2019	4	12	Diciembre	27	Viernes	5	f
20191228	2019-12-28	2019	4	12	Diciembre	28	Sábado	6	t
20191229	2019-12-29	2019	4	12	Diciembre	29	Domingo	7	t
20191230	2019-12-30	2019	4	12	Diciembre	30	Lunes	1	f
20191231	2019-12-31	2019	4	12	Diciembre	31	Martes	2	f
20200101	2020-01-01	2020	1	1	Enero	1	Miércoles	3	f
20200102	2020-01-02	2020	1	1	Enero	2	Jueves	4	f
20200103	2020-01-03	2020	1	1	Enero	3	Viernes	5	f
20200104	2020-01-04	2020	1	1	Enero	4	Sábado	6	t
20200105	2020-01-05	2020	1	1	Enero	5	Domingo	7	t
20200106	2020-01-06	2020	1	1	Enero	6	Lunes	1	f
20200107	2020-01-07	2020	1	1	Enero	7	Martes	2	f
20200108	2020-01-08	2020	1	1	Enero	8	Miércoles	3	f
20200109	2020-01-09	2020	1	1	Enero	9	Jueves	4	f
20200110	2020-01-10	2020	1	1	Enero	10	Viernes	5	f
20200111	2020-01-11	2020	1	1	Enero	11	Sábado	6	t
20200112	2020-01-12	2020	1	1	Enero	12	Domingo	7	t
20200113	2020-01-13	2020	1	1	Enero	13	Lunes	1	f
20200114	2020-01-14	2020	1	1	Enero	14	Martes	2	f
20200115	2020-01-15	2020	1	1	Enero	15	Miércoles	3	f
20200116	2020-01-16	2020	1	1	Enero	16	Jueves	4	f
20200117	2020-01-17	2020	1	1	Enero	17	Viernes	5	f
20200118	2020-01-18	2020	1	1	Enero	18	Sábado	6	t
20200119	2020-01-19	2020	1	1	Enero	19	Domingo	7	t
20200120	2020-01-20	2020	1	1	Enero	20	Lunes	1	f
20200121	2020-01-21	2020	1	1	Enero	21	Martes	2	f
20200122	2020-01-22	2020	1	1	Enero	22	Miércoles	3	f
20200123	2020-01-23	2020	1	1	Enero	23	Jueves	4	f
20200124	2020-01-24	2020	1	1	Enero	24	Viernes	5	f
20200125	2020-01-25	2020	1	1	Enero	25	Sábado	6	t
20200126	2020-01-26	2020	1	1	Enero	26	Domingo	7	t
20200127	2020-01-27	2020	1	1	Enero	27	Lunes	1	f
20200128	2020-01-28	2020	1	1	Enero	28	Martes	2	f
20200129	2020-01-29	2020	1	1	Enero	29	Miércoles	3	f
20200130	2020-01-30	2020	1	1	Enero	30	Jueves	4	f
20200131	2020-01-31	2020	1	1	Enero	31	Viernes	5	f
20200201	2020-02-01	2020	1	2	Febrero	1	Sábado	6	t
20200202	2020-02-02	2020	1	2	Febrero	2	Domingo	7	t
20200203	2020-02-03	2020	1	2	Febrero	3	Lunes	1	f
20200204	2020-02-04	2020	1	2	Febrero	4	Martes	2	f
20200205	2020-02-05	2020	1	2	Febrero	5	Miércoles	3	f
20200206	2020-02-06	2020	1	2	Febrero	6	Jueves	4	f
20200207	2020-02-07	2020	1	2	Febrero	7	Viernes	5	f
20200208	2020-02-08	2020	1	2	Febrero	8	Sábado	6	t
20200209	2020-02-09	2020	1	2	Febrero	9	Domingo	7	t
20200210	2020-02-10	2020	1	2	Febrero	10	Lunes	1	f
20200211	2020-02-11	2020	1	2	Febrero	11	Martes	2	f
20200212	2020-02-12	2020	1	2	Febrero	12	Miércoles	3	f
20200213	2020-02-13	2020	1	2	Febrero	13	Jueves	4	f
20200214	2020-02-14	2020	1	2	Febrero	14	Viernes	5	f
20200215	2020-02-15	2020	1	2	Febrero	15	Sábado	6	t
20200216	2020-02-16	2020	1	2	Febrero	16	Domingo	7	t
20200217	2020-02-17	2020	1	2	Febrero	17	Lunes	1	f
20200218	2020-02-18	2020	1	2	Febrero	18	Martes	2	f
20200219	2020-02-19	2020	1	2	Febrero	19	Miércoles	3	f
20200220	2020-02-20	2020	1	2	Febrero	20	Jueves	4	f
20200221	2020-02-21	2020	1	2	Febrero	21	Viernes	5	f
20200222	2020-02-22	2020	1	2	Febrero	22	Sábado	6	t
20200223	2020-02-23	2020	1	2	Febrero	23	Domingo	7	t
20200224	2020-02-24	2020	1	2	Febrero	24	Lunes	1	f
20200225	2020-02-25	2020	1	2	Febrero	25	Martes	2	f
20200226	2020-02-26	2020	1	2	Febrero	26	Miércoles	3	f
20200227	2020-02-27	2020	1	2	Febrero	27	Jueves	4	f
20200228	2020-02-28	2020	1	2	Febrero	28	Viernes	5	f
20200229	2020-02-29	2020	1	2	Febrero	29	Sábado	6	t
20200301	2020-03-01	2020	1	3	Marzo	1	Domingo	7	t
20200302	2020-03-02	2020	1	3	Marzo	2	Lunes	1	f
20200303	2020-03-03	2020	1	3	Marzo	3	Martes	2	f
20200304	2020-03-04	2020	1	3	Marzo	4	Miércoles	3	f
20200305	2020-03-05	2020	1	3	Marzo	5	Jueves	4	f
20200306	2020-03-06	2020	1	3	Marzo	6	Viernes	5	f
20200307	2020-03-07	2020	1	3	Marzo	7	Sábado	6	t
20200308	2020-03-08	2020	1	3	Marzo	8	Domingo	7	t
20200309	2020-03-09	2020	1	3	Marzo	9	Lunes	1	f
20200310	2020-03-10	2020	1	3	Marzo	10	Martes	2	f
20200311	2020-03-11	2020	1	3	Marzo	11	Miércoles	3	f
20200312	2020-03-12	2020	1	3	Marzo	12	Jueves	4	f
20200313	2020-03-13	2020	1	3	Marzo	13	Viernes	5	f
20200314	2020-03-14	2020	1	3	Marzo	14	Sábado	6	t
20200315	2020-03-15	2020	1	3	Marzo	15	Domingo	7	t
20200316	2020-03-16	2020	1	3	Marzo	16	Lunes	1	f
20200317	2020-03-17	2020	1	3	Marzo	17	Martes	2	f
20200318	2020-03-18	2020	1	3	Marzo	18	Miércoles	3	f
20200319	2020-03-19	2020	1	3	Marzo	19	Jueves	4	f
20200320	2020-03-20	2020	1	3	Marzo	20	Viernes	5	f
20200321	2020-03-21	2020	1	3	Marzo	21	Sábado	6	t
20200322	2020-03-22	2020	1	3	Marzo	22	Domingo	7	t
20200323	2020-03-23	2020	1	3	Marzo	23	Lunes	1	f
20200324	2020-03-24	2020	1	3	Marzo	24	Martes	2	f
20200325	2020-03-25	2020	1	3	Marzo	25	Miércoles	3	f
20200326	2020-03-26	2020	1	3	Marzo	26	Jueves	4	f
20200327	2020-03-27	2020	1	3	Marzo	27	Viernes	5	f
20200328	2020-03-28	2020	1	3	Marzo	28	Sábado	6	t
20200329	2020-03-29	2020	1	3	Marzo	29	Domingo	7	t
20200330	2020-03-30	2020	1	3	Marzo	30	Lunes	1	f
20200331	2020-03-31	2020	1	3	Marzo	31	Martes	2	f
20200401	2020-04-01	2020	2	4	Abril	1	Miércoles	3	f
20200402	2020-04-02	2020	2	4	Abril	2	Jueves	4	f
20200403	2020-04-03	2020	2	4	Abril	3	Viernes	5	f
20200404	2020-04-04	2020	2	4	Abril	4	Sábado	6	t
20200405	2020-04-05	2020	2	4	Abril	5	Domingo	7	t
20200406	2020-04-06	2020	2	4	Abril	6	Lunes	1	f
20200407	2020-04-07	2020	2	4	Abril	7	Martes	2	f
20200408	2020-04-08	2020	2	4	Abril	8	Miércoles	3	f
20200409	2020-04-09	2020	2	4	Abril	9	Jueves	4	f
20200410	2020-04-10	2020	2	4	Abril	10	Viernes	5	f
20200411	2020-04-11	2020	2	4	Abril	11	Sábado	6	t
20200412	2020-04-12	2020	2	4	Abril	12	Domingo	7	t
20200413	2020-04-13	2020	2	4	Abril	13	Lunes	1	f
20200414	2020-04-14	2020	2	4	Abril	14	Martes	2	f
20200415	2020-04-15	2020	2	4	Abril	15	Miércoles	3	f
20200416	2020-04-16	2020	2	4	Abril	16	Jueves	4	f
20200417	2020-04-17	2020	2	4	Abril	17	Viernes	5	f
20200418	2020-04-18	2020	2	4	Abril	18	Sábado	6	t
20200419	2020-04-19	2020	2	4	Abril	19	Domingo	7	t
20200420	2020-04-20	2020	2	4	Abril	20	Lunes	1	f
20200421	2020-04-21	2020	2	4	Abril	21	Martes	2	f
20200422	2020-04-22	2020	2	4	Abril	22	Miércoles	3	f
20200423	2020-04-23	2020	2	4	Abril	23	Jueves	4	f
20200424	2020-04-24	2020	2	4	Abril	24	Viernes	5	f
20200425	2020-04-25	2020	2	4	Abril	25	Sábado	6	t
20200426	2020-04-26	2020	2	4	Abril	26	Domingo	7	t
20200427	2020-04-27	2020	2	4	Abril	27	Lunes	1	f
20200428	2020-04-28	2020	2	4	Abril	28	Martes	2	f
20200429	2020-04-29	2020	2	4	Abril	29	Miércoles	3	f
20200430	2020-04-30	2020	2	4	Abril	30	Jueves	4	f
20200501	2020-05-01	2020	2	5	Mayo	1	Viernes	5	f
20200502	2020-05-02	2020	2	5	Mayo	2	Sábado	6	t
20200503	2020-05-03	2020	2	5	Mayo	3	Domingo	7	t
20200504	2020-05-04	2020	2	5	Mayo	4	Lunes	1	f
20200505	2020-05-05	2020	2	5	Mayo	5	Martes	2	f
20200506	2020-05-06	2020	2	5	Mayo	6	Miércoles	3	f
20200507	2020-05-07	2020	2	5	Mayo	7	Jueves	4	f
20200508	2020-05-08	2020	2	5	Mayo	8	Viernes	5	f
20200509	2020-05-09	2020	2	5	Mayo	9	Sábado	6	t
20200510	2020-05-10	2020	2	5	Mayo	10	Domingo	7	t
20200511	2020-05-11	2020	2	5	Mayo	11	Lunes	1	f
20200512	2020-05-12	2020	2	5	Mayo	12	Martes	2	f
20200513	2020-05-13	2020	2	5	Mayo	13	Miércoles	3	f
20200514	2020-05-14	2020	2	5	Mayo	14	Jueves	4	f
20200515	2020-05-15	2020	2	5	Mayo	15	Viernes	5	f
20200516	2020-05-16	2020	2	5	Mayo	16	Sábado	6	t
20200517	2020-05-17	2020	2	5	Mayo	17	Domingo	7	t
20200518	2020-05-18	2020	2	5	Mayo	18	Lunes	1	f
20200519	2020-05-19	2020	2	5	Mayo	19	Martes	2	f
20200520	2020-05-20	2020	2	5	Mayo	20	Miércoles	3	f
20200521	2020-05-21	2020	2	5	Mayo	21	Jueves	4	f
20200522	2020-05-22	2020	2	5	Mayo	22	Viernes	5	f
20200523	2020-05-23	2020	2	5	Mayo	23	Sábado	6	t
20200524	2020-05-24	2020	2	5	Mayo	24	Domingo	7	t
20200525	2020-05-25	2020	2	5	Mayo	25	Lunes	1	f
20200526	2020-05-26	2020	2	5	Mayo	26	Martes	2	f
20200527	2020-05-27	2020	2	5	Mayo	27	Miércoles	3	f
20200528	2020-05-28	2020	2	5	Mayo	28	Jueves	4	f
20200529	2020-05-29	2020	2	5	Mayo	29	Viernes	5	f
20200530	2020-05-30	2020	2	5	Mayo	30	Sábado	6	t
20200531	2020-05-31	2020	2	5	Mayo	31	Domingo	7	t
20200601	2020-06-01	2020	2	6	Junio	1	Lunes	1	f
20200602	2020-06-02	2020	2	6	Junio	2	Martes	2	f
20200603	2020-06-03	2020	2	6	Junio	3	Miércoles	3	f
20200604	2020-06-04	2020	2	6	Junio	4	Jueves	4	f
20200605	2020-06-05	2020	2	6	Junio	5	Viernes	5	f
20200606	2020-06-06	2020	2	6	Junio	6	Sábado	6	t
20200607	2020-06-07	2020	2	6	Junio	7	Domingo	7	t
20200608	2020-06-08	2020	2	6	Junio	8	Lunes	1	f
20200609	2020-06-09	2020	2	6	Junio	9	Martes	2	f
20200610	2020-06-10	2020	2	6	Junio	10	Miércoles	3	f
20200611	2020-06-11	2020	2	6	Junio	11	Jueves	4	f
20200612	2020-06-12	2020	2	6	Junio	12	Viernes	5	f
20200613	2020-06-13	2020	2	6	Junio	13	Sábado	6	t
20200614	2020-06-14	2020	2	6	Junio	14	Domingo	7	t
20200615	2020-06-15	2020	2	6	Junio	15	Lunes	1	f
20200616	2020-06-16	2020	2	6	Junio	16	Martes	2	f
20200617	2020-06-17	2020	2	6	Junio	17	Miércoles	3	f
20200618	2020-06-18	2020	2	6	Junio	18	Jueves	4	f
20200619	2020-06-19	2020	2	6	Junio	19	Viernes	5	f
20200620	2020-06-20	2020	2	6	Junio	20	Sábado	6	t
20200621	2020-06-21	2020	2	6	Junio	21	Domingo	7	t
20200622	2020-06-22	2020	2	6	Junio	22	Lunes	1	f
20200623	2020-06-23	2020	2	6	Junio	23	Martes	2	f
20200624	2020-06-24	2020	2	6	Junio	24	Miércoles	3	f
20200625	2020-06-25	2020	2	6	Junio	25	Jueves	4	f
20200626	2020-06-26	2020	2	6	Junio	26	Viernes	5	f
20200627	2020-06-27	2020	2	6	Junio	27	Sábado	6	t
20200628	2020-06-28	2020	2	6	Junio	28	Domingo	7	t
20200629	2020-06-29	2020	2	6	Junio	29	Lunes	1	f
20200630	2020-06-30	2020	2	6	Junio	30	Martes	2	f
20200701	2020-07-01	2020	3	7	Julio	1	Miércoles	3	f
20200702	2020-07-02	2020	3	7	Julio	2	Jueves	4	f
20200703	2020-07-03	2020	3	7	Julio	3	Viernes	5	f
20200704	2020-07-04	2020	3	7	Julio	4	Sábado	6	t
20200705	2020-07-05	2020	3	7	Julio	5	Domingo	7	t
20200706	2020-07-06	2020	3	7	Julio	6	Lunes	1	f
20200707	2020-07-07	2020	3	7	Julio	7	Martes	2	f
20200708	2020-07-08	2020	3	7	Julio	8	Miércoles	3	f
20200709	2020-07-09	2020	3	7	Julio	9	Jueves	4	f
20200710	2020-07-10	2020	3	7	Julio	10	Viernes	5	f
20200711	2020-07-11	2020	3	7	Julio	11	Sábado	6	t
20200712	2020-07-12	2020	3	7	Julio	12	Domingo	7	t
20200713	2020-07-13	2020	3	7	Julio	13	Lunes	1	f
20200714	2020-07-14	2020	3	7	Julio	14	Martes	2	f
20200715	2020-07-15	2020	3	7	Julio	15	Miércoles	3	f
20200716	2020-07-16	2020	3	7	Julio	16	Jueves	4	f
20200717	2020-07-17	2020	3	7	Julio	17	Viernes	5	f
20200718	2020-07-18	2020	3	7	Julio	18	Sábado	6	t
20200719	2020-07-19	2020	3	7	Julio	19	Domingo	7	t
20200720	2020-07-20	2020	3	7	Julio	20	Lunes	1	f
20200721	2020-07-21	2020	3	7	Julio	21	Martes	2	f
20200722	2020-07-22	2020	3	7	Julio	22	Miércoles	3	f
20200723	2020-07-23	2020	3	7	Julio	23	Jueves	4	f
20200724	2020-07-24	2020	3	7	Julio	24	Viernes	5	f
20200725	2020-07-25	2020	3	7	Julio	25	Sábado	6	t
20200726	2020-07-26	2020	3	7	Julio	26	Domingo	7	t
20200727	2020-07-27	2020	3	7	Julio	27	Lunes	1	f
20200728	2020-07-28	2020	3	7	Julio	28	Martes	2	f
20200729	2020-07-29	2020	3	7	Julio	29	Miércoles	3	f
20200730	2020-07-30	2020	3	7	Julio	30	Jueves	4	f
20200731	2020-07-31	2020	3	7	Julio	31	Viernes	5	f
20200801	2020-08-01	2020	3	8	Agosto	1	Sábado	6	t
20200802	2020-08-02	2020	3	8	Agosto	2	Domingo	7	t
20200803	2020-08-03	2020	3	8	Agosto	3	Lunes	1	f
20200804	2020-08-04	2020	3	8	Agosto	4	Martes	2	f
20200805	2020-08-05	2020	3	8	Agosto	5	Miércoles	3	f
20200806	2020-08-06	2020	3	8	Agosto	6	Jueves	4	f
20200807	2020-08-07	2020	3	8	Agosto	7	Viernes	5	f
20200808	2020-08-08	2020	3	8	Agosto	8	Sábado	6	t
20200809	2020-08-09	2020	3	8	Agosto	9	Domingo	7	t
20200810	2020-08-10	2020	3	8	Agosto	10	Lunes	1	f
20200811	2020-08-11	2020	3	8	Agosto	11	Martes	2	f
20200812	2020-08-12	2020	3	8	Agosto	12	Miércoles	3	f
20200813	2020-08-13	2020	3	8	Agosto	13	Jueves	4	f
20200814	2020-08-14	2020	3	8	Agosto	14	Viernes	5	f
20200815	2020-08-15	2020	3	8	Agosto	15	Sábado	6	t
20200816	2020-08-16	2020	3	8	Agosto	16	Domingo	7	t
20200817	2020-08-17	2020	3	8	Agosto	17	Lunes	1	f
20200818	2020-08-18	2020	3	8	Agosto	18	Martes	2	f
20200819	2020-08-19	2020	3	8	Agosto	19	Miércoles	3	f
20200820	2020-08-20	2020	3	8	Agosto	20	Jueves	4	f
20200821	2020-08-21	2020	3	8	Agosto	21	Viernes	5	f
20200822	2020-08-22	2020	3	8	Agosto	22	Sábado	6	t
20200823	2020-08-23	2020	3	8	Agosto	23	Domingo	7	t
20200824	2020-08-24	2020	3	8	Agosto	24	Lunes	1	f
20200825	2020-08-25	2020	3	8	Agosto	25	Martes	2	f
20200826	2020-08-26	2020	3	8	Agosto	26	Miércoles	3	f
20200827	2020-08-27	2020	3	8	Agosto	27	Jueves	4	f
20200828	2020-08-28	2020	3	8	Agosto	28	Viernes	5	f
20200829	2020-08-29	2020	3	8	Agosto	29	Sábado	6	t
20200830	2020-08-30	2020	3	8	Agosto	30	Domingo	7	t
20200831	2020-08-31	2020	3	8	Agosto	31	Lunes	1	f
20200901	2020-09-01	2020	3	9	Septiembre	1	Martes	2	f
20200902	2020-09-02	2020	3	9	Septiembre	2	Miércoles	3	f
20200903	2020-09-03	2020	3	9	Septiembre	3	Jueves	4	f
20200904	2020-09-04	2020	3	9	Septiembre	4	Viernes	5	f
20200905	2020-09-05	2020	3	9	Septiembre	5	Sábado	6	t
20200906	2020-09-06	2020	3	9	Septiembre	6	Domingo	7	t
20200907	2020-09-07	2020	3	9	Septiembre	7	Lunes	1	f
20200908	2020-09-08	2020	3	9	Septiembre	8	Martes	2	f
20200909	2020-09-09	2020	3	9	Septiembre	9	Miércoles	3	f
20200910	2020-09-10	2020	3	9	Septiembre	10	Jueves	4	f
20200911	2020-09-11	2020	3	9	Septiembre	11	Viernes	5	f
20200912	2020-09-12	2020	3	9	Septiembre	12	Sábado	6	t
20200913	2020-09-13	2020	3	9	Septiembre	13	Domingo	7	t
20200914	2020-09-14	2020	3	9	Septiembre	14	Lunes	1	f
20200915	2020-09-15	2020	3	9	Septiembre	15	Martes	2	f
20200916	2020-09-16	2020	3	9	Septiembre	16	Miércoles	3	f
20200917	2020-09-17	2020	3	9	Septiembre	17	Jueves	4	f
20200918	2020-09-18	2020	3	9	Septiembre	18	Viernes	5	f
20200919	2020-09-19	2020	3	9	Septiembre	19	Sábado	6	t
20200920	2020-09-20	2020	3	9	Septiembre	20	Domingo	7	t
20200921	2020-09-21	2020	3	9	Septiembre	21	Lunes	1	f
20200922	2020-09-22	2020	3	9	Septiembre	22	Martes	2	f
20200923	2020-09-23	2020	3	9	Septiembre	23	Miércoles	3	f
20200924	2020-09-24	2020	3	9	Septiembre	24	Jueves	4	f
20200925	2020-09-25	2020	3	9	Septiembre	25	Viernes	5	f
20200926	2020-09-26	2020	3	9	Septiembre	26	Sábado	6	t
20200927	2020-09-27	2020	3	9	Septiembre	27	Domingo	7	t
20200928	2020-09-28	2020	3	9	Septiembre	28	Lunes	1	f
20200929	2020-09-29	2020	3	9	Septiembre	29	Martes	2	f
20200930	2020-09-30	2020	3	9	Septiembre	30	Miércoles	3	f
20201001	2020-10-01	2020	4	10	Octubre	1	Jueves	4	f
20201002	2020-10-02	2020	4	10	Octubre	2	Viernes	5	f
20201003	2020-10-03	2020	4	10	Octubre	3	Sábado	6	t
20201004	2020-10-04	2020	4	10	Octubre	4	Domingo	7	t
20201005	2020-10-05	2020	4	10	Octubre	5	Lunes	1	f
20201006	2020-10-06	2020	4	10	Octubre	6	Martes	2	f
20201007	2020-10-07	2020	4	10	Octubre	7	Miércoles	3	f
20201008	2020-10-08	2020	4	10	Octubre	8	Jueves	4	f
20201009	2020-10-09	2020	4	10	Octubre	9	Viernes	5	f
20201010	2020-10-10	2020	4	10	Octubre	10	Sábado	6	t
20201011	2020-10-11	2020	4	10	Octubre	11	Domingo	7	t
20201012	2020-10-12	2020	4	10	Octubre	12	Lunes	1	f
20201013	2020-10-13	2020	4	10	Octubre	13	Martes	2	f
20201014	2020-10-14	2020	4	10	Octubre	14	Miércoles	3	f
20201015	2020-10-15	2020	4	10	Octubre	15	Jueves	4	f
20201016	2020-10-16	2020	4	10	Octubre	16	Viernes	5	f
20201017	2020-10-17	2020	4	10	Octubre	17	Sábado	6	t
20201018	2020-10-18	2020	4	10	Octubre	18	Domingo	7	t
20201019	2020-10-19	2020	4	10	Octubre	19	Lunes	1	f
20201020	2020-10-20	2020	4	10	Octubre	20	Martes	2	f
20201021	2020-10-21	2020	4	10	Octubre	21	Miércoles	3	f
20201022	2020-10-22	2020	4	10	Octubre	22	Jueves	4	f
20201023	2020-10-23	2020	4	10	Octubre	23	Viernes	5	f
20201024	2020-10-24	2020	4	10	Octubre	24	Sábado	6	t
20201025	2020-10-25	2020	4	10	Octubre	25	Domingo	7	t
20201026	2020-10-26	2020	4	10	Octubre	26	Lunes	1	f
20201027	2020-10-27	2020	4	10	Octubre	27	Martes	2	f
20201028	2020-10-28	2020	4	10	Octubre	28	Miércoles	3	f
20201029	2020-10-29	2020	4	10	Octubre	29	Jueves	4	f
20201030	2020-10-30	2020	4	10	Octubre	30	Viernes	5	f
20201031	2020-10-31	2020	4	10	Octubre	31	Sábado	6	t
20201101	2020-11-01	2020	4	11	Noviembre	1	Domingo	7	t
20201102	2020-11-02	2020	4	11	Noviembre	2	Lunes	1	f
20201103	2020-11-03	2020	4	11	Noviembre	3	Martes	2	f
20201104	2020-11-04	2020	4	11	Noviembre	4	Miércoles	3	f
20201105	2020-11-05	2020	4	11	Noviembre	5	Jueves	4	f
20201106	2020-11-06	2020	4	11	Noviembre	6	Viernes	5	f
20201107	2020-11-07	2020	4	11	Noviembre	7	Sábado	6	t
20201108	2020-11-08	2020	4	11	Noviembre	8	Domingo	7	t
20201109	2020-11-09	2020	4	11	Noviembre	9	Lunes	1	f
20201110	2020-11-10	2020	4	11	Noviembre	10	Martes	2	f
20201111	2020-11-11	2020	4	11	Noviembre	11	Miércoles	3	f
20201112	2020-11-12	2020	4	11	Noviembre	12	Jueves	4	f
20201113	2020-11-13	2020	4	11	Noviembre	13	Viernes	5	f
20201114	2020-11-14	2020	4	11	Noviembre	14	Sábado	6	t
20201115	2020-11-15	2020	4	11	Noviembre	15	Domingo	7	t
20201116	2020-11-16	2020	4	11	Noviembre	16	Lunes	1	f
20201117	2020-11-17	2020	4	11	Noviembre	17	Martes	2	f
20201118	2020-11-18	2020	4	11	Noviembre	18	Miércoles	3	f
20201119	2020-11-19	2020	4	11	Noviembre	19	Jueves	4	f
20201120	2020-11-20	2020	4	11	Noviembre	20	Viernes	5	f
20201121	2020-11-21	2020	4	11	Noviembre	21	Sábado	6	t
20201122	2020-11-22	2020	4	11	Noviembre	22	Domingo	7	t
20201123	2020-11-23	2020	4	11	Noviembre	23	Lunes	1	f
20201124	2020-11-24	2020	4	11	Noviembre	24	Martes	2	f
20201125	2020-11-25	2020	4	11	Noviembre	25	Miércoles	3	f
20201126	2020-11-26	2020	4	11	Noviembre	26	Jueves	4	f
20201127	2020-11-27	2020	4	11	Noviembre	27	Viernes	5	f
20201128	2020-11-28	2020	4	11	Noviembre	28	Sábado	6	t
20201129	2020-11-29	2020	4	11	Noviembre	29	Domingo	7	t
20201130	2020-11-30	2020	4	11	Noviembre	30	Lunes	1	f
20201201	2020-12-01	2020	4	12	Diciembre	1	Martes	2	f
20201202	2020-12-02	2020	4	12	Diciembre	2	Miércoles	3	f
20201203	2020-12-03	2020	4	12	Diciembre	3	Jueves	4	f
20201204	2020-12-04	2020	4	12	Diciembre	4	Viernes	5	f
20201205	2020-12-05	2020	4	12	Diciembre	5	Sábado	6	t
20201206	2020-12-06	2020	4	12	Diciembre	6	Domingo	7	t
20201207	2020-12-07	2020	4	12	Diciembre	7	Lunes	1	f
20201208	2020-12-08	2020	4	12	Diciembre	8	Martes	2	f
20201209	2020-12-09	2020	4	12	Diciembre	9	Miércoles	3	f
20201210	2020-12-10	2020	4	12	Diciembre	10	Jueves	4	f
20201211	2020-12-11	2020	4	12	Diciembre	11	Viernes	5	f
20201212	2020-12-12	2020	4	12	Diciembre	12	Sábado	6	t
20201213	2020-12-13	2020	4	12	Diciembre	13	Domingo	7	t
20201214	2020-12-14	2020	4	12	Diciembre	14	Lunes	1	f
20201215	2020-12-15	2020	4	12	Diciembre	15	Martes	2	f
20201216	2020-12-16	2020	4	12	Diciembre	16	Miércoles	3	f
20201217	2020-12-17	2020	4	12	Diciembre	17	Jueves	4	f
20201218	2020-12-18	2020	4	12	Diciembre	18	Viernes	5	f
20201219	2020-12-19	2020	4	12	Diciembre	19	Sábado	6	t
20201220	2020-12-20	2020	4	12	Diciembre	20	Domingo	7	t
20201221	2020-12-21	2020	4	12	Diciembre	21	Lunes	1	f
20201222	2020-12-22	2020	4	12	Diciembre	22	Martes	2	f
20201223	2020-12-23	2020	4	12	Diciembre	23	Miércoles	3	f
20201224	2020-12-24	2020	4	12	Diciembre	24	Jueves	4	f
20201225	2020-12-25	2020	4	12	Diciembre	25	Viernes	5	f
20201226	2020-12-26	2020	4	12	Diciembre	26	Sábado	6	t
20201227	2020-12-27	2020	4	12	Diciembre	27	Domingo	7	t
20201228	2020-12-28	2020	4	12	Diciembre	28	Lunes	1	f
20201229	2020-12-29	2020	4	12	Diciembre	29	Martes	2	f
20201230	2020-12-30	2020	4	12	Diciembre	30	Miércoles	3	f
20201231	2020-12-31	2020	4	12	Diciembre	31	Jueves	4	f
20210101	2021-01-01	2021	1	1	Enero	1	Viernes	5	f
20210102	2021-01-02	2021	1	1	Enero	2	Sábado	6	t
20210103	2021-01-03	2021	1	1	Enero	3	Domingo	7	t
20210104	2021-01-04	2021	1	1	Enero	4	Lunes	1	f
20210105	2021-01-05	2021	1	1	Enero	5	Martes	2	f
20210106	2021-01-06	2021	1	1	Enero	6	Miércoles	3	f
20210107	2021-01-07	2021	1	1	Enero	7	Jueves	4	f
20210108	2021-01-08	2021	1	1	Enero	8	Viernes	5	f
20210109	2021-01-09	2021	1	1	Enero	9	Sábado	6	t
20210110	2021-01-10	2021	1	1	Enero	10	Domingo	7	t
20210111	2021-01-11	2021	1	1	Enero	11	Lunes	1	f
20210112	2021-01-12	2021	1	1	Enero	12	Martes	2	f
20210113	2021-01-13	2021	1	1	Enero	13	Miércoles	3	f
20210114	2021-01-14	2021	1	1	Enero	14	Jueves	4	f
20210115	2021-01-15	2021	1	1	Enero	15	Viernes	5	f
20210116	2021-01-16	2021	1	1	Enero	16	Sábado	6	t
20210117	2021-01-17	2021	1	1	Enero	17	Domingo	7	t
20210118	2021-01-18	2021	1	1	Enero	18	Lunes	1	f
20210119	2021-01-19	2021	1	1	Enero	19	Martes	2	f
20210120	2021-01-20	2021	1	1	Enero	20	Miércoles	3	f
20210121	2021-01-21	2021	1	1	Enero	21	Jueves	4	f
20210122	2021-01-22	2021	1	1	Enero	22	Viernes	5	f
20210123	2021-01-23	2021	1	1	Enero	23	Sábado	6	t
20210124	2021-01-24	2021	1	1	Enero	24	Domingo	7	t
20210125	2021-01-25	2021	1	1	Enero	25	Lunes	1	f
20210126	2021-01-26	2021	1	1	Enero	26	Martes	2	f
20210127	2021-01-27	2021	1	1	Enero	27	Miércoles	3	f
20210128	2021-01-28	2021	1	1	Enero	28	Jueves	4	f
20210129	2021-01-29	2021	1	1	Enero	29	Viernes	5	f
20210130	2021-01-30	2021	1	1	Enero	30	Sábado	6	t
20210131	2021-01-31	2021	1	1	Enero	31	Domingo	7	t
20210201	2021-02-01	2021	1	2	Febrero	1	Lunes	1	f
20210202	2021-02-02	2021	1	2	Febrero	2	Martes	2	f
20210203	2021-02-03	2021	1	2	Febrero	3	Miércoles	3	f
20210204	2021-02-04	2021	1	2	Febrero	4	Jueves	4	f
20210205	2021-02-05	2021	1	2	Febrero	5	Viernes	5	f
20210206	2021-02-06	2021	1	2	Febrero	6	Sábado	6	t
20210207	2021-02-07	2021	1	2	Febrero	7	Domingo	7	t
20210208	2021-02-08	2021	1	2	Febrero	8	Lunes	1	f
20210209	2021-02-09	2021	1	2	Febrero	9	Martes	2	f
20210210	2021-02-10	2021	1	2	Febrero	10	Miércoles	3	f
20210211	2021-02-11	2021	1	2	Febrero	11	Jueves	4	f
20210212	2021-02-12	2021	1	2	Febrero	12	Viernes	5	f
20210213	2021-02-13	2021	1	2	Febrero	13	Sábado	6	t
20210214	2021-02-14	2021	1	2	Febrero	14	Domingo	7	t
20210215	2021-02-15	2021	1	2	Febrero	15	Lunes	1	f
20210216	2021-02-16	2021	1	2	Febrero	16	Martes	2	f
20210217	2021-02-17	2021	1	2	Febrero	17	Miércoles	3	f
20210218	2021-02-18	2021	1	2	Febrero	18	Jueves	4	f
20210219	2021-02-19	2021	1	2	Febrero	19	Viernes	5	f
20210220	2021-02-20	2021	1	2	Febrero	20	Sábado	6	t
20210221	2021-02-21	2021	1	2	Febrero	21	Domingo	7	t
20210222	2021-02-22	2021	1	2	Febrero	22	Lunes	1	f
20210223	2021-02-23	2021	1	2	Febrero	23	Martes	2	f
20210224	2021-02-24	2021	1	2	Febrero	24	Miércoles	3	f
20210225	2021-02-25	2021	1	2	Febrero	25	Jueves	4	f
20210226	2021-02-26	2021	1	2	Febrero	26	Viernes	5	f
20210227	2021-02-27	2021	1	2	Febrero	27	Sábado	6	t
20210228	2021-02-28	2021	1	2	Febrero	28	Domingo	7	t
20210301	2021-03-01	2021	1	3	Marzo	1	Lunes	1	f
20210302	2021-03-02	2021	1	3	Marzo	2	Martes	2	f
20210303	2021-03-03	2021	1	3	Marzo	3	Miércoles	3	f
20210304	2021-03-04	2021	1	3	Marzo	4	Jueves	4	f
20210305	2021-03-05	2021	1	3	Marzo	5	Viernes	5	f
20210306	2021-03-06	2021	1	3	Marzo	6	Sábado	6	t
20210307	2021-03-07	2021	1	3	Marzo	7	Domingo	7	t
20210308	2021-03-08	2021	1	3	Marzo	8	Lunes	1	f
20210309	2021-03-09	2021	1	3	Marzo	9	Martes	2	f
20210310	2021-03-10	2021	1	3	Marzo	10	Miércoles	3	f
20210311	2021-03-11	2021	1	3	Marzo	11	Jueves	4	f
20210312	2021-03-12	2021	1	3	Marzo	12	Viernes	5	f
20210313	2021-03-13	2021	1	3	Marzo	13	Sábado	6	t
20210314	2021-03-14	2021	1	3	Marzo	14	Domingo	7	t
20210315	2021-03-15	2021	1	3	Marzo	15	Lunes	1	f
20210316	2021-03-16	2021	1	3	Marzo	16	Martes	2	f
20210317	2021-03-17	2021	1	3	Marzo	17	Miércoles	3	f
20210318	2021-03-18	2021	1	3	Marzo	18	Jueves	4	f
20210319	2021-03-19	2021	1	3	Marzo	19	Viernes	5	f
20210320	2021-03-20	2021	1	3	Marzo	20	Sábado	6	t
20210321	2021-03-21	2021	1	3	Marzo	21	Domingo	7	t
20210322	2021-03-22	2021	1	3	Marzo	22	Lunes	1	f
20210323	2021-03-23	2021	1	3	Marzo	23	Martes	2	f
20210324	2021-03-24	2021	1	3	Marzo	24	Miércoles	3	f
20210325	2021-03-25	2021	1	3	Marzo	25	Jueves	4	f
20210326	2021-03-26	2021	1	3	Marzo	26	Viernes	5	f
20210327	2021-03-27	2021	1	3	Marzo	27	Sábado	6	t
20210328	2021-03-28	2021	1	3	Marzo	28	Domingo	7	t
20210329	2021-03-29	2021	1	3	Marzo	29	Lunes	1	f
20210330	2021-03-30	2021	1	3	Marzo	30	Martes	2	f
20210331	2021-03-31	2021	1	3	Marzo	31	Miércoles	3	f
20210401	2021-04-01	2021	2	4	Abril	1	Jueves	4	f
20210402	2021-04-02	2021	2	4	Abril	2	Viernes	5	f
20210403	2021-04-03	2021	2	4	Abril	3	Sábado	6	t
20210404	2021-04-04	2021	2	4	Abril	4	Domingo	7	t
20210405	2021-04-05	2021	2	4	Abril	5	Lunes	1	f
20210406	2021-04-06	2021	2	4	Abril	6	Martes	2	f
20210407	2021-04-07	2021	2	4	Abril	7	Miércoles	3	f
20210408	2021-04-08	2021	2	4	Abril	8	Jueves	4	f
20210409	2021-04-09	2021	2	4	Abril	9	Viernes	5	f
20210410	2021-04-10	2021	2	4	Abril	10	Sábado	6	t
20210411	2021-04-11	2021	2	4	Abril	11	Domingo	7	t
20210412	2021-04-12	2021	2	4	Abril	12	Lunes	1	f
20210413	2021-04-13	2021	2	4	Abril	13	Martes	2	f
20210414	2021-04-14	2021	2	4	Abril	14	Miércoles	3	f
20210415	2021-04-15	2021	2	4	Abril	15	Jueves	4	f
20210416	2021-04-16	2021	2	4	Abril	16	Viernes	5	f
20210417	2021-04-17	2021	2	4	Abril	17	Sábado	6	t
20210418	2021-04-18	2021	2	4	Abril	18	Domingo	7	t
20210419	2021-04-19	2021	2	4	Abril	19	Lunes	1	f
20210420	2021-04-20	2021	2	4	Abril	20	Martes	2	f
20210421	2021-04-21	2021	2	4	Abril	21	Miércoles	3	f
20210422	2021-04-22	2021	2	4	Abril	22	Jueves	4	f
20210423	2021-04-23	2021	2	4	Abril	23	Viernes	5	f
20210424	2021-04-24	2021	2	4	Abril	24	Sábado	6	t
20210425	2021-04-25	2021	2	4	Abril	25	Domingo	7	t
20210426	2021-04-26	2021	2	4	Abril	26	Lunes	1	f
20210427	2021-04-27	2021	2	4	Abril	27	Martes	2	f
20210428	2021-04-28	2021	2	4	Abril	28	Miércoles	3	f
20210429	2021-04-29	2021	2	4	Abril	29	Jueves	4	f
20210430	2021-04-30	2021	2	4	Abril	30	Viernes	5	f
20210501	2021-05-01	2021	2	5	Mayo	1	Sábado	6	t
20210502	2021-05-02	2021	2	5	Mayo	2	Domingo	7	t
20210503	2021-05-03	2021	2	5	Mayo	3	Lunes	1	f
20210504	2021-05-04	2021	2	5	Mayo	4	Martes	2	f
20210505	2021-05-05	2021	2	5	Mayo	5	Miércoles	3	f
20210506	2021-05-06	2021	2	5	Mayo	6	Jueves	4	f
20210507	2021-05-07	2021	2	5	Mayo	7	Viernes	5	f
20210508	2021-05-08	2021	2	5	Mayo	8	Sábado	6	t
20210509	2021-05-09	2021	2	5	Mayo	9	Domingo	7	t
20210510	2021-05-10	2021	2	5	Mayo	10	Lunes	1	f
20210511	2021-05-11	2021	2	5	Mayo	11	Martes	2	f
20210512	2021-05-12	2021	2	5	Mayo	12	Miércoles	3	f
20210513	2021-05-13	2021	2	5	Mayo	13	Jueves	4	f
20210514	2021-05-14	2021	2	5	Mayo	14	Viernes	5	f
20210515	2021-05-15	2021	2	5	Mayo	15	Sábado	6	t
20210516	2021-05-16	2021	2	5	Mayo	16	Domingo	7	t
20210517	2021-05-17	2021	2	5	Mayo	17	Lunes	1	f
20210518	2021-05-18	2021	2	5	Mayo	18	Martes	2	f
20210519	2021-05-19	2021	2	5	Mayo	19	Miércoles	3	f
20210520	2021-05-20	2021	2	5	Mayo	20	Jueves	4	f
20210521	2021-05-21	2021	2	5	Mayo	21	Viernes	5	f
20210522	2021-05-22	2021	2	5	Mayo	22	Sábado	6	t
20210523	2021-05-23	2021	2	5	Mayo	23	Domingo	7	t
20210524	2021-05-24	2021	2	5	Mayo	24	Lunes	1	f
20210525	2021-05-25	2021	2	5	Mayo	25	Martes	2	f
20210526	2021-05-26	2021	2	5	Mayo	26	Miércoles	3	f
20210527	2021-05-27	2021	2	5	Mayo	27	Jueves	4	f
20210528	2021-05-28	2021	2	5	Mayo	28	Viernes	5	f
20210529	2021-05-29	2021	2	5	Mayo	29	Sábado	6	t
20210530	2021-05-30	2021	2	5	Mayo	30	Domingo	7	t
20210531	2021-05-31	2021	2	5	Mayo	31	Lunes	1	f
20210601	2021-06-01	2021	2	6	Junio	1	Martes	2	f
20210602	2021-06-02	2021	2	6	Junio	2	Miércoles	3	f
20210603	2021-06-03	2021	2	6	Junio	3	Jueves	4	f
20210604	2021-06-04	2021	2	6	Junio	4	Viernes	5	f
20210605	2021-06-05	2021	2	6	Junio	5	Sábado	6	t
20210606	2021-06-06	2021	2	6	Junio	6	Domingo	7	t
20210607	2021-06-07	2021	2	6	Junio	7	Lunes	1	f
20210608	2021-06-08	2021	2	6	Junio	8	Martes	2	f
20210609	2021-06-09	2021	2	6	Junio	9	Miércoles	3	f
20210610	2021-06-10	2021	2	6	Junio	10	Jueves	4	f
20210611	2021-06-11	2021	2	6	Junio	11	Viernes	5	f
20210612	2021-06-12	2021	2	6	Junio	12	Sábado	6	t
20210613	2021-06-13	2021	2	6	Junio	13	Domingo	7	t
20210614	2021-06-14	2021	2	6	Junio	14	Lunes	1	f
20210615	2021-06-15	2021	2	6	Junio	15	Martes	2	f
20210616	2021-06-16	2021	2	6	Junio	16	Miércoles	3	f
20210617	2021-06-17	2021	2	6	Junio	17	Jueves	4	f
20210618	2021-06-18	2021	2	6	Junio	18	Viernes	5	f
20210619	2021-06-19	2021	2	6	Junio	19	Sábado	6	t
20210620	2021-06-20	2021	2	6	Junio	20	Domingo	7	t
20210621	2021-06-21	2021	2	6	Junio	21	Lunes	1	f
20210622	2021-06-22	2021	2	6	Junio	22	Martes	2	f
20210623	2021-06-23	2021	2	6	Junio	23	Miércoles	3	f
20210624	2021-06-24	2021	2	6	Junio	24	Jueves	4	f
20210625	2021-06-25	2021	2	6	Junio	25	Viernes	5	f
20210626	2021-06-26	2021	2	6	Junio	26	Sábado	6	t
20210627	2021-06-27	2021	2	6	Junio	27	Domingo	7	t
20210628	2021-06-28	2021	2	6	Junio	28	Lunes	1	f
20210629	2021-06-29	2021	2	6	Junio	29	Martes	2	f
20210630	2021-06-30	2021	2	6	Junio	30	Miércoles	3	f
20210701	2021-07-01	2021	3	7	Julio	1	Jueves	4	f
20210702	2021-07-02	2021	3	7	Julio	2	Viernes	5	f
20210703	2021-07-03	2021	3	7	Julio	3	Sábado	6	t
20210704	2021-07-04	2021	3	7	Julio	4	Domingo	7	t
20210705	2021-07-05	2021	3	7	Julio	5	Lunes	1	f
20210706	2021-07-06	2021	3	7	Julio	6	Martes	2	f
20210707	2021-07-07	2021	3	7	Julio	7	Miércoles	3	f
20210708	2021-07-08	2021	3	7	Julio	8	Jueves	4	f
20210709	2021-07-09	2021	3	7	Julio	9	Viernes	5	f
20210710	2021-07-10	2021	3	7	Julio	10	Sábado	6	t
20210711	2021-07-11	2021	3	7	Julio	11	Domingo	7	t
20210712	2021-07-12	2021	3	7	Julio	12	Lunes	1	f
20210713	2021-07-13	2021	3	7	Julio	13	Martes	2	f
20210714	2021-07-14	2021	3	7	Julio	14	Miércoles	3	f
20210715	2021-07-15	2021	3	7	Julio	15	Jueves	4	f
20210716	2021-07-16	2021	3	7	Julio	16	Viernes	5	f
20210717	2021-07-17	2021	3	7	Julio	17	Sábado	6	t
20210718	2021-07-18	2021	3	7	Julio	18	Domingo	7	t
20210719	2021-07-19	2021	3	7	Julio	19	Lunes	1	f
20210720	2021-07-20	2021	3	7	Julio	20	Martes	2	f
20210721	2021-07-21	2021	3	7	Julio	21	Miércoles	3	f
20210722	2021-07-22	2021	3	7	Julio	22	Jueves	4	f
20210723	2021-07-23	2021	3	7	Julio	23	Viernes	5	f
20210724	2021-07-24	2021	3	7	Julio	24	Sábado	6	t
20210725	2021-07-25	2021	3	7	Julio	25	Domingo	7	t
20210726	2021-07-26	2021	3	7	Julio	26	Lunes	1	f
20210727	2021-07-27	2021	3	7	Julio	27	Martes	2	f
20210728	2021-07-28	2021	3	7	Julio	28	Miércoles	3	f
20210729	2021-07-29	2021	3	7	Julio	29	Jueves	4	f
20210730	2021-07-30	2021	3	7	Julio	30	Viernes	5	f
20210731	2021-07-31	2021	3	7	Julio	31	Sábado	6	t
20210801	2021-08-01	2021	3	8	Agosto	1	Domingo	7	t
20210802	2021-08-02	2021	3	8	Agosto	2	Lunes	1	f
20210803	2021-08-03	2021	3	8	Agosto	3	Martes	2	f
20210804	2021-08-04	2021	3	8	Agosto	4	Miércoles	3	f
20210805	2021-08-05	2021	3	8	Agosto	5	Jueves	4	f
20210806	2021-08-06	2021	3	8	Agosto	6	Viernes	5	f
20210807	2021-08-07	2021	3	8	Agosto	7	Sábado	6	t
20210808	2021-08-08	2021	3	8	Agosto	8	Domingo	7	t
20210809	2021-08-09	2021	3	8	Agosto	9	Lunes	1	f
20210810	2021-08-10	2021	3	8	Agosto	10	Martes	2	f
20210811	2021-08-11	2021	3	8	Agosto	11	Miércoles	3	f
20210812	2021-08-12	2021	3	8	Agosto	12	Jueves	4	f
20210813	2021-08-13	2021	3	8	Agosto	13	Viernes	5	f
20210814	2021-08-14	2021	3	8	Agosto	14	Sábado	6	t
20210815	2021-08-15	2021	3	8	Agosto	15	Domingo	7	t
20210816	2021-08-16	2021	3	8	Agosto	16	Lunes	1	f
20210817	2021-08-17	2021	3	8	Agosto	17	Martes	2	f
20210818	2021-08-18	2021	3	8	Agosto	18	Miércoles	3	f
20210819	2021-08-19	2021	3	8	Agosto	19	Jueves	4	f
20210820	2021-08-20	2021	3	8	Agosto	20	Viernes	5	f
20210821	2021-08-21	2021	3	8	Agosto	21	Sábado	6	t
20210822	2021-08-22	2021	3	8	Agosto	22	Domingo	7	t
20210823	2021-08-23	2021	3	8	Agosto	23	Lunes	1	f
20210824	2021-08-24	2021	3	8	Agosto	24	Martes	2	f
20210825	2021-08-25	2021	3	8	Agosto	25	Miércoles	3	f
20210826	2021-08-26	2021	3	8	Agosto	26	Jueves	4	f
20210827	2021-08-27	2021	3	8	Agosto	27	Viernes	5	f
20210828	2021-08-28	2021	3	8	Agosto	28	Sábado	6	t
20210829	2021-08-29	2021	3	8	Agosto	29	Domingo	7	t
20210830	2021-08-30	2021	3	8	Agosto	30	Lunes	1	f
20210831	2021-08-31	2021	3	8	Agosto	31	Martes	2	f
20210901	2021-09-01	2021	3	9	Septiembre	1	Miércoles	3	f
20210902	2021-09-02	2021	3	9	Septiembre	2	Jueves	4	f
20210903	2021-09-03	2021	3	9	Septiembre	3	Viernes	5	f
20210904	2021-09-04	2021	3	9	Septiembre	4	Sábado	6	t
20210905	2021-09-05	2021	3	9	Septiembre	5	Domingo	7	t
20210906	2021-09-06	2021	3	9	Septiembre	6	Lunes	1	f
20210907	2021-09-07	2021	3	9	Septiembre	7	Martes	2	f
20210908	2021-09-08	2021	3	9	Septiembre	8	Miércoles	3	f
20210909	2021-09-09	2021	3	9	Septiembre	9	Jueves	4	f
20210910	2021-09-10	2021	3	9	Septiembre	10	Viernes	5	f
20210911	2021-09-11	2021	3	9	Septiembre	11	Sábado	6	t
20210912	2021-09-12	2021	3	9	Septiembre	12	Domingo	7	t
20210913	2021-09-13	2021	3	9	Septiembre	13	Lunes	1	f
20210914	2021-09-14	2021	3	9	Septiembre	14	Martes	2	f
20210915	2021-09-15	2021	3	9	Septiembre	15	Miércoles	3	f
20210916	2021-09-16	2021	3	9	Septiembre	16	Jueves	4	f
20210917	2021-09-17	2021	3	9	Septiembre	17	Viernes	5	f
20210918	2021-09-18	2021	3	9	Septiembre	18	Sábado	6	t
20210919	2021-09-19	2021	3	9	Septiembre	19	Domingo	7	t
20210920	2021-09-20	2021	3	9	Septiembre	20	Lunes	1	f
20210921	2021-09-21	2021	3	9	Septiembre	21	Martes	2	f
20210922	2021-09-22	2021	3	9	Septiembre	22	Miércoles	3	f
20210923	2021-09-23	2021	3	9	Septiembre	23	Jueves	4	f
20210924	2021-09-24	2021	3	9	Septiembre	24	Viernes	5	f
20210925	2021-09-25	2021	3	9	Septiembre	25	Sábado	6	t
20210926	2021-09-26	2021	3	9	Septiembre	26	Domingo	7	t
20210927	2021-09-27	2021	3	9	Septiembre	27	Lunes	1	f
20210928	2021-09-28	2021	3	9	Septiembre	28	Martes	2	f
20210929	2021-09-29	2021	3	9	Septiembre	29	Miércoles	3	f
20210930	2021-09-30	2021	3	9	Septiembre	30	Jueves	4	f
20211001	2021-10-01	2021	4	10	Octubre	1	Viernes	5	f
20211002	2021-10-02	2021	4	10	Octubre	2	Sábado	6	t
20211003	2021-10-03	2021	4	10	Octubre	3	Domingo	7	t
20211004	2021-10-04	2021	4	10	Octubre	4	Lunes	1	f
20211005	2021-10-05	2021	4	10	Octubre	5	Martes	2	f
20211006	2021-10-06	2021	4	10	Octubre	6	Miércoles	3	f
20211007	2021-10-07	2021	4	10	Octubre	7	Jueves	4	f
20211008	2021-10-08	2021	4	10	Octubre	8	Viernes	5	f
20211009	2021-10-09	2021	4	10	Octubre	9	Sábado	6	t
20211010	2021-10-10	2021	4	10	Octubre	10	Domingo	7	t
20211011	2021-10-11	2021	4	10	Octubre	11	Lunes	1	f
20211012	2021-10-12	2021	4	10	Octubre	12	Martes	2	f
20211013	2021-10-13	2021	4	10	Octubre	13	Miércoles	3	f
20211014	2021-10-14	2021	4	10	Octubre	14	Jueves	4	f
20211015	2021-10-15	2021	4	10	Octubre	15	Viernes	5	f
20211016	2021-10-16	2021	4	10	Octubre	16	Sábado	6	t
20211017	2021-10-17	2021	4	10	Octubre	17	Domingo	7	t
20211018	2021-10-18	2021	4	10	Octubre	18	Lunes	1	f
20211019	2021-10-19	2021	4	10	Octubre	19	Martes	2	f
20211020	2021-10-20	2021	4	10	Octubre	20	Miércoles	3	f
20211021	2021-10-21	2021	4	10	Octubre	21	Jueves	4	f
20211022	2021-10-22	2021	4	10	Octubre	22	Viernes	5	f
20211023	2021-10-23	2021	4	10	Octubre	23	Sábado	6	t
20211024	2021-10-24	2021	4	10	Octubre	24	Domingo	7	t
20211025	2021-10-25	2021	4	10	Octubre	25	Lunes	1	f
20211026	2021-10-26	2021	4	10	Octubre	26	Martes	2	f
20211027	2021-10-27	2021	4	10	Octubre	27	Miércoles	3	f
20211028	2021-10-28	2021	4	10	Octubre	28	Jueves	4	f
20211029	2021-10-29	2021	4	10	Octubre	29	Viernes	5	f
20211030	2021-10-30	2021	4	10	Octubre	30	Sábado	6	t
20211031	2021-10-31	2021	4	10	Octubre	31	Domingo	7	t
20211101	2021-11-01	2021	4	11	Noviembre	1	Lunes	1	f
20211102	2021-11-02	2021	4	11	Noviembre	2	Martes	2	f
20211103	2021-11-03	2021	4	11	Noviembre	3	Miércoles	3	f
20211104	2021-11-04	2021	4	11	Noviembre	4	Jueves	4	f
20211105	2021-11-05	2021	4	11	Noviembre	5	Viernes	5	f
20211106	2021-11-06	2021	4	11	Noviembre	6	Sábado	6	t
20211107	2021-11-07	2021	4	11	Noviembre	7	Domingo	7	t
20211108	2021-11-08	2021	4	11	Noviembre	8	Lunes	1	f
20211109	2021-11-09	2021	4	11	Noviembre	9	Martes	2	f
20211110	2021-11-10	2021	4	11	Noviembre	10	Miércoles	3	f
20211111	2021-11-11	2021	4	11	Noviembre	11	Jueves	4	f
20211112	2021-11-12	2021	4	11	Noviembre	12	Viernes	5	f
20211113	2021-11-13	2021	4	11	Noviembre	13	Sábado	6	t
20211114	2021-11-14	2021	4	11	Noviembre	14	Domingo	7	t
20211115	2021-11-15	2021	4	11	Noviembre	15	Lunes	1	f
20211116	2021-11-16	2021	4	11	Noviembre	16	Martes	2	f
20211117	2021-11-17	2021	4	11	Noviembre	17	Miércoles	3	f
20211118	2021-11-18	2021	4	11	Noviembre	18	Jueves	4	f
20211119	2021-11-19	2021	4	11	Noviembre	19	Viernes	5	f
20211120	2021-11-20	2021	4	11	Noviembre	20	Sábado	6	t
20211121	2021-11-21	2021	4	11	Noviembre	21	Domingo	7	t
20211122	2021-11-22	2021	4	11	Noviembre	22	Lunes	1	f
20211123	2021-11-23	2021	4	11	Noviembre	23	Martes	2	f
20211124	2021-11-24	2021	4	11	Noviembre	24	Miércoles	3	f
20211125	2021-11-25	2021	4	11	Noviembre	25	Jueves	4	f
20211126	2021-11-26	2021	4	11	Noviembre	26	Viernes	5	f
20211127	2021-11-27	2021	4	11	Noviembre	27	Sábado	6	t
20211128	2021-11-28	2021	4	11	Noviembre	28	Domingo	7	t
20211129	2021-11-29	2021	4	11	Noviembre	29	Lunes	1	f
20211130	2021-11-30	2021	4	11	Noviembre	30	Martes	2	f
20211201	2021-12-01	2021	4	12	Diciembre	1	Miércoles	3	f
20211202	2021-12-02	2021	4	12	Diciembre	2	Jueves	4	f
20211203	2021-12-03	2021	4	12	Diciembre	3	Viernes	5	f
20211204	2021-12-04	2021	4	12	Diciembre	4	Sábado	6	t
20211205	2021-12-05	2021	4	12	Diciembre	5	Domingo	7	t
20211206	2021-12-06	2021	4	12	Diciembre	6	Lunes	1	f
20211207	2021-12-07	2021	4	12	Diciembre	7	Martes	2	f
20211208	2021-12-08	2021	4	12	Diciembre	8	Miércoles	3	f
20211209	2021-12-09	2021	4	12	Diciembre	9	Jueves	4	f
20211210	2021-12-10	2021	4	12	Diciembre	10	Viernes	5	f
20211211	2021-12-11	2021	4	12	Diciembre	11	Sábado	6	t
20211212	2021-12-12	2021	4	12	Diciembre	12	Domingo	7	t
20211213	2021-12-13	2021	4	12	Diciembre	13	Lunes	1	f
20211214	2021-12-14	2021	4	12	Diciembre	14	Martes	2	f
20211215	2021-12-15	2021	4	12	Diciembre	15	Miércoles	3	f
20211216	2021-12-16	2021	4	12	Diciembre	16	Jueves	4	f
20211217	2021-12-17	2021	4	12	Diciembre	17	Viernes	5	f
20211218	2021-12-18	2021	4	12	Diciembre	18	Sábado	6	t
20211219	2021-12-19	2021	4	12	Diciembre	19	Domingo	7	t
20211220	2021-12-20	2021	4	12	Diciembre	20	Lunes	1	f
20211221	2021-12-21	2021	4	12	Diciembre	21	Martes	2	f
20211222	2021-12-22	2021	4	12	Diciembre	22	Miércoles	3	f
20211223	2021-12-23	2021	4	12	Diciembre	23	Jueves	4	f
20211224	2021-12-24	2021	4	12	Diciembre	24	Viernes	5	f
20211225	2021-12-25	2021	4	12	Diciembre	25	Sábado	6	t
20211226	2021-12-26	2021	4	12	Diciembre	26	Domingo	7	t
20211227	2021-12-27	2021	4	12	Diciembre	27	Lunes	1	f
20211228	2021-12-28	2021	4	12	Diciembre	28	Martes	2	f
20211229	2021-12-29	2021	4	12	Diciembre	29	Miércoles	3	f
20211230	2021-12-30	2021	4	12	Diciembre	30	Jueves	4	f
20211231	2021-12-31	2021	4	12	Diciembre	31	Viernes	5	f
20220101	2022-01-01	2022	1	1	Enero	1	Sábado	6	t
20220102	2022-01-02	2022	1	1	Enero	2	Domingo	7	t
20220103	2022-01-03	2022	1	1	Enero	3	Lunes	1	f
20220104	2022-01-04	2022	1	1	Enero	4	Martes	2	f
20220105	2022-01-05	2022	1	1	Enero	5	Miércoles	3	f
20220106	2022-01-06	2022	1	1	Enero	6	Jueves	4	f
20220107	2022-01-07	2022	1	1	Enero	7	Viernes	5	f
20220108	2022-01-08	2022	1	1	Enero	8	Sábado	6	t
20220109	2022-01-09	2022	1	1	Enero	9	Domingo	7	t
20220110	2022-01-10	2022	1	1	Enero	10	Lunes	1	f
20220111	2022-01-11	2022	1	1	Enero	11	Martes	2	f
20220112	2022-01-12	2022	1	1	Enero	12	Miércoles	3	f
20220113	2022-01-13	2022	1	1	Enero	13	Jueves	4	f
20220114	2022-01-14	2022	1	1	Enero	14	Viernes	5	f
20220115	2022-01-15	2022	1	1	Enero	15	Sábado	6	t
20220116	2022-01-16	2022	1	1	Enero	16	Domingo	7	t
20220117	2022-01-17	2022	1	1	Enero	17	Lunes	1	f
20220118	2022-01-18	2022	1	1	Enero	18	Martes	2	f
20220119	2022-01-19	2022	1	1	Enero	19	Miércoles	3	f
20220120	2022-01-20	2022	1	1	Enero	20	Jueves	4	f
20220121	2022-01-21	2022	1	1	Enero	21	Viernes	5	f
20220122	2022-01-22	2022	1	1	Enero	22	Sábado	6	t
20220123	2022-01-23	2022	1	1	Enero	23	Domingo	7	t
20220124	2022-01-24	2022	1	1	Enero	24	Lunes	1	f
20220125	2022-01-25	2022	1	1	Enero	25	Martes	2	f
20220126	2022-01-26	2022	1	1	Enero	26	Miércoles	3	f
20220127	2022-01-27	2022	1	1	Enero	27	Jueves	4	f
20220128	2022-01-28	2022	1	1	Enero	28	Viernes	5	f
20220129	2022-01-29	2022	1	1	Enero	29	Sábado	6	t
20220130	2022-01-30	2022	1	1	Enero	30	Domingo	7	t
20220131	2022-01-31	2022	1	1	Enero	31	Lunes	1	f
20220201	2022-02-01	2022	1	2	Febrero	1	Martes	2	f
20220202	2022-02-02	2022	1	2	Febrero	2	Miércoles	3	f
20220203	2022-02-03	2022	1	2	Febrero	3	Jueves	4	f
20220204	2022-02-04	2022	1	2	Febrero	4	Viernes	5	f
20220205	2022-02-05	2022	1	2	Febrero	5	Sábado	6	t
20220206	2022-02-06	2022	1	2	Febrero	6	Domingo	7	t
20220207	2022-02-07	2022	1	2	Febrero	7	Lunes	1	f
20220208	2022-02-08	2022	1	2	Febrero	8	Martes	2	f
20220209	2022-02-09	2022	1	2	Febrero	9	Miércoles	3	f
20220210	2022-02-10	2022	1	2	Febrero	10	Jueves	4	f
20220211	2022-02-11	2022	1	2	Febrero	11	Viernes	5	f
20220212	2022-02-12	2022	1	2	Febrero	12	Sábado	6	t
20220213	2022-02-13	2022	1	2	Febrero	13	Domingo	7	t
20220214	2022-02-14	2022	1	2	Febrero	14	Lunes	1	f
20220215	2022-02-15	2022	1	2	Febrero	15	Martes	2	f
20220216	2022-02-16	2022	1	2	Febrero	16	Miércoles	3	f
20220217	2022-02-17	2022	1	2	Febrero	17	Jueves	4	f
20220218	2022-02-18	2022	1	2	Febrero	18	Viernes	5	f
20220219	2022-02-19	2022	1	2	Febrero	19	Sábado	6	t
20220220	2022-02-20	2022	1	2	Febrero	20	Domingo	7	t
20220221	2022-02-21	2022	1	2	Febrero	21	Lunes	1	f
20220222	2022-02-22	2022	1	2	Febrero	22	Martes	2	f
20220223	2022-02-23	2022	1	2	Febrero	23	Miércoles	3	f
20220224	2022-02-24	2022	1	2	Febrero	24	Jueves	4	f
20220225	2022-02-25	2022	1	2	Febrero	25	Viernes	5	f
20220226	2022-02-26	2022	1	2	Febrero	26	Sábado	6	t
20220227	2022-02-27	2022	1	2	Febrero	27	Domingo	7	t
20220228	2022-02-28	2022	1	2	Febrero	28	Lunes	1	f
20220301	2022-03-01	2022	1	3	Marzo	1	Martes	2	f
20220302	2022-03-02	2022	1	3	Marzo	2	Miércoles	3	f
20220303	2022-03-03	2022	1	3	Marzo	3	Jueves	4	f
20220304	2022-03-04	2022	1	3	Marzo	4	Viernes	5	f
20220305	2022-03-05	2022	1	3	Marzo	5	Sábado	6	t
20220306	2022-03-06	2022	1	3	Marzo	6	Domingo	7	t
20220307	2022-03-07	2022	1	3	Marzo	7	Lunes	1	f
20220308	2022-03-08	2022	1	3	Marzo	8	Martes	2	f
20220309	2022-03-09	2022	1	3	Marzo	9	Miércoles	3	f
20220310	2022-03-10	2022	1	3	Marzo	10	Jueves	4	f
20220311	2022-03-11	2022	1	3	Marzo	11	Viernes	5	f
20220312	2022-03-12	2022	1	3	Marzo	12	Sábado	6	t
20220313	2022-03-13	2022	1	3	Marzo	13	Domingo	7	t
20220314	2022-03-14	2022	1	3	Marzo	14	Lunes	1	f
20220315	2022-03-15	2022	1	3	Marzo	15	Martes	2	f
20220316	2022-03-16	2022	1	3	Marzo	16	Miércoles	3	f
20220317	2022-03-17	2022	1	3	Marzo	17	Jueves	4	f
20220318	2022-03-18	2022	1	3	Marzo	18	Viernes	5	f
20220319	2022-03-19	2022	1	3	Marzo	19	Sábado	6	t
20220320	2022-03-20	2022	1	3	Marzo	20	Domingo	7	t
20220321	2022-03-21	2022	1	3	Marzo	21	Lunes	1	f
20220322	2022-03-22	2022	1	3	Marzo	22	Martes	2	f
20220323	2022-03-23	2022	1	3	Marzo	23	Miércoles	3	f
20220324	2022-03-24	2022	1	3	Marzo	24	Jueves	4	f
20220325	2022-03-25	2022	1	3	Marzo	25	Viernes	5	f
20220326	2022-03-26	2022	1	3	Marzo	26	Sábado	6	t
20220327	2022-03-27	2022	1	3	Marzo	27	Domingo	7	t
20220328	2022-03-28	2022	1	3	Marzo	28	Lunes	1	f
20220329	2022-03-29	2022	1	3	Marzo	29	Martes	2	f
20220330	2022-03-30	2022	1	3	Marzo	30	Miércoles	3	f
20220331	2022-03-31	2022	1	3	Marzo	31	Jueves	4	f
20220401	2022-04-01	2022	2	4	Abril	1	Viernes	5	f
20220402	2022-04-02	2022	2	4	Abril	2	Sábado	6	t
20220403	2022-04-03	2022	2	4	Abril	3	Domingo	7	t
20220404	2022-04-04	2022	2	4	Abril	4	Lunes	1	f
20220405	2022-04-05	2022	2	4	Abril	5	Martes	2	f
20220406	2022-04-06	2022	2	4	Abril	6	Miércoles	3	f
20220407	2022-04-07	2022	2	4	Abril	7	Jueves	4	f
20220408	2022-04-08	2022	2	4	Abril	8	Viernes	5	f
20220409	2022-04-09	2022	2	4	Abril	9	Sábado	6	t
20220410	2022-04-10	2022	2	4	Abril	10	Domingo	7	t
20220411	2022-04-11	2022	2	4	Abril	11	Lunes	1	f
20220412	2022-04-12	2022	2	4	Abril	12	Martes	2	f
20220413	2022-04-13	2022	2	4	Abril	13	Miércoles	3	f
20220414	2022-04-14	2022	2	4	Abril	14	Jueves	4	f
20220415	2022-04-15	2022	2	4	Abril	15	Viernes	5	f
20220416	2022-04-16	2022	2	4	Abril	16	Sábado	6	t
20220417	2022-04-17	2022	2	4	Abril	17	Domingo	7	t
20220418	2022-04-18	2022	2	4	Abril	18	Lunes	1	f
20220419	2022-04-19	2022	2	4	Abril	19	Martes	2	f
20220420	2022-04-20	2022	2	4	Abril	20	Miércoles	3	f
20220421	2022-04-21	2022	2	4	Abril	21	Jueves	4	f
20220422	2022-04-22	2022	2	4	Abril	22	Viernes	5	f
20220423	2022-04-23	2022	2	4	Abril	23	Sábado	6	t
20220424	2022-04-24	2022	2	4	Abril	24	Domingo	7	t
20220425	2022-04-25	2022	2	4	Abril	25	Lunes	1	f
20220426	2022-04-26	2022	2	4	Abril	26	Martes	2	f
20220427	2022-04-27	2022	2	4	Abril	27	Miércoles	3	f
20220428	2022-04-28	2022	2	4	Abril	28	Jueves	4	f
20220429	2022-04-29	2022	2	4	Abril	29	Viernes	5	f
20220430	2022-04-30	2022	2	4	Abril	30	Sábado	6	t
20220501	2022-05-01	2022	2	5	Mayo	1	Domingo	7	t
20220502	2022-05-02	2022	2	5	Mayo	2	Lunes	1	f
20220503	2022-05-03	2022	2	5	Mayo	3	Martes	2	f
20220504	2022-05-04	2022	2	5	Mayo	4	Miércoles	3	f
20220505	2022-05-05	2022	2	5	Mayo	5	Jueves	4	f
20220506	2022-05-06	2022	2	5	Mayo	6	Viernes	5	f
20220507	2022-05-07	2022	2	5	Mayo	7	Sábado	6	t
20220508	2022-05-08	2022	2	5	Mayo	8	Domingo	7	t
20220509	2022-05-09	2022	2	5	Mayo	9	Lunes	1	f
20220510	2022-05-10	2022	2	5	Mayo	10	Martes	2	f
20220511	2022-05-11	2022	2	5	Mayo	11	Miércoles	3	f
20220512	2022-05-12	2022	2	5	Mayo	12	Jueves	4	f
20220513	2022-05-13	2022	2	5	Mayo	13	Viernes	5	f
20220514	2022-05-14	2022	2	5	Mayo	14	Sábado	6	t
20220515	2022-05-15	2022	2	5	Mayo	15	Domingo	7	t
20220516	2022-05-16	2022	2	5	Mayo	16	Lunes	1	f
20220517	2022-05-17	2022	2	5	Mayo	17	Martes	2	f
20220518	2022-05-18	2022	2	5	Mayo	18	Miércoles	3	f
20220519	2022-05-19	2022	2	5	Mayo	19	Jueves	4	f
20220520	2022-05-20	2022	2	5	Mayo	20	Viernes	5	f
20220521	2022-05-21	2022	2	5	Mayo	21	Sábado	6	t
20220522	2022-05-22	2022	2	5	Mayo	22	Domingo	7	t
20220523	2022-05-23	2022	2	5	Mayo	23	Lunes	1	f
20220524	2022-05-24	2022	2	5	Mayo	24	Martes	2	f
20220525	2022-05-25	2022	2	5	Mayo	25	Miércoles	3	f
20220526	2022-05-26	2022	2	5	Mayo	26	Jueves	4	f
20220527	2022-05-27	2022	2	5	Mayo	27	Viernes	5	f
20220528	2022-05-28	2022	2	5	Mayo	28	Sábado	6	t
20220529	2022-05-29	2022	2	5	Mayo	29	Domingo	7	t
20220530	2022-05-30	2022	2	5	Mayo	30	Lunes	1	f
20220531	2022-05-31	2022	2	5	Mayo	31	Martes	2	f
20220601	2022-06-01	2022	2	6	Junio	1	Miércoles	3	f
20220602	2022-06-02	2022	2	6	Junio	2	Jueves	4	f
20220603	2022-06-03	2022	2	6	Junio	3	Viernes	5	f
20220604	2022-06-04	2022	2	6	Junio	4	Sábado	6	t
20220605	2022-06-05	2022	2	6	Junio	5	Domingo	7	t
20220606	2022-06-06	2022	2	6	Junio	6	Lunes	1	f
20220607	2022-06-07	2022	2	6	Junio	7	Martes	2	f
20220608	2022-06-08	2022	2	6	Junio	8	Miércoles	3	f
20220609	2022-06-09	2022	2	6	Junio	9	Jueves	4	f
20220610	2022-06-10	2022	2	6	Junio	10	Viernes	5	f
20220611	2022-06-11	2022	2	6	Junio	11	Sábado	6	t
20220612	2022-06-12	2022	2	6	Junio	12	Domingo	7	t
20220613	2022-06-13	2022	2	6	Junio	13	Lunes	1	f
20220614	2022-06-14	2022	2	6	Junio	14	Martes	2	f
20220615	2022-06-15	2022	2	6	Junio	15	Miércoles	3	f
20220616	2022-06-16	2022	2	6	Junio	16	Jueves	4	f
20220617	2022-06-17	2022	2	6	Junio	17	Viernes	5	f
20220618	2022-06-18	2022	2	6	Junio	18	Sábado	6	t
20220619	2022-06-19	2022	2	6	Junio	19	Domingo	7	t
20220620	2022-06-20	2022	2	6	Junio	20	Lunes	1	f
20220621	2022-06-21	2022	2	6	Junio	21	Martes	2	f
20220622	2022-06-22	2022	2	6	Junio	22	Miércoles	3	f
20220623	2022-06-23	2022	2	6	Junio	23	Jueves	4	f
20220624	2022-06-24	2022	2	6	Junio	24	Viernes	5	f
20220625	2022-06-25	2022	2	6	Junio	25	Sábado	6	t
20220626	2022-06-26	2022	2	6	Junio	26	Domingo	7	t
20220627	2022-06-27	2022	2	6	Junio	27	Lunes	1	f
20220628	2022-06-28	2022	2	6	Junio	28	Martes	2	f
20220629	2022-06-29	2022	2	6	Junio	29	Miércoles	3	f
20220630	2022-06-30	2022	2	6	Junio	30	Jueves	4	f
20220701	2022-07-01	2022	3	7	Julio	1	Viernes	5	f
20220702	2022-07-02	2022	3	7	Julio	2	Sábado	6	t
20220703	2022-07-03	2022	3	7	Julio	3	Domingo	7	t
20220704	2022-07-04	2022	3	7	Julio	4	Lunes	1	f
20220705	2022-07-05	2022	3	7	Julio	5	Martes	2	f
20220706	2022-07-06	2022	3	7	Julio	6	Miércoles	3	f
20220707	2022-07-07	2022	3	7	Julio	7	Jueves	4	f
20220708	2022-07-08	2022	3	7	Julio	8	Viernes	5	f
20220709	2022-07-09	2022	3	7	Julio	9	Sábado	6	t
20220710	2022-07-10	2022	3	7	Julio	10	Domingo	7	t
20220711	2022-07-11	2022	3	7	Julio	11	Lunes	1	f
20220712	2022-07-12	2022	3	7	Julio	12	Martes	2	f
20220713	2022-07-13	2022	3	7	Julio	13	Miércoles	3	f
20220714	2022-07-14	2022	3	7	Julio	14	Jueves	4	f
20220715	2022-07-15	2022	3	7	Julio	15	Viernes	5	f
20220716	2022-07-16	2022	3	7	Julio	16	Sábado	6	t
20220717	2022-07-17	2022	3	7	Julio	17	Domingo	7	t
20220718	2022-07-18	2022	3	7	Julio	18	Lunes	1	f
20220719	2022-07-19	2022	3	7	Julio	19	Martes	2	f
20220720	2022-07-20	2022	3	7	Julio	20	Miércoles	3	f
20220721	2022-07-21	2022	3	7	Julio	21	Jueves	4	f
20220722	2022-07-22	2022	3	7	Julio	22	Viernes	5	f
20220723	2022-07-23	2022	3	7	Julio	23	Sábado	6	t
20220724	2022-07-24	2022	3	7	Julio	24	Domingo	7	t
20220725	2022-07-25	2022	3	7	Julio	25	Lunes	1	f
20220726	2022-07-26	2022	3	7	Julio	26	Martes	2	f
20220727	2022-07-27	2022	3	7	Julio	27	Miércoles	3	f
20220728	2022-07-28	2022	3	7	Julio	28	Jueves	4	f
20220729	2022-07-29	2022	3	7	Julio	29	Viernes	5	f
20220730	2022-07-30	2022	3	7	Julio	30	Sábado	6	t
20220731	2022-07-31	2022	3	7	Julio	31	Domingo	7	t
20220801	2022-08-01	2022	3	8	Agosto	1	Lunes	1	f
20220802	2022-08-02	2022	3	8	Agosto	2	Martes	2	f
20220803	2022-08-03	2022	3	8	Agosto	3	Miércoles	3	f
20220804	2022-08-04	2022	3	8	Agosto	4	Jueves	4	f
20220805	2022-08-05	2022	3	8	Agosto	5	Viernes	5	f
20220806	2022-08-06	2022	3	8	Agosto	6	Sábado	6	t
20220807	2022-08-07	2022	3	8	Agosto	7	Domingo	7	t
20220808	2022-08-08	2022	3	8	Agosto	8	Lunes	1	f
20220809	2022-08-09	2022	3	8	Agosto	9	Martes	2	f
20220810	2022-08-10	2022	3	8	Agosto	10	Miércoles	3	f
20220811	2022-08-11	2022	3	8	Agosto	11	Jueves	4	f
20220812	2022-08-12	2022	3	8	Agosto	12	Viernes	5	f
20220813	2022-08-13	2022	3	8	Agosto	13	Sábado	6	t
20220814	2022-08-14	2022	3	8	Agosto	14	Domingo	7	t
20220815	2022-08-15	2022	3	8	Agosto	15	Lunes	1	f
20220816	2022-08-16	2022	3	8	Agosto	16	Martes	2	f
20220817	2022-08-17	2022	3	8	Agosto	17	Miércoles	3	f
20220818	2022-08-18	2022	3	8	Agosto	18	Jueves	4	f
20220819	2022-08-19	2022	3	8	Agosto	19	Viernes	5	f
20220820	2022-08-20	2022	3	8	Agosto	20	Sábado	6	t
20220821	2022-08-21	2022	3	8	Agosto	21	Domingo	7	t
20220822	2022-08-22	2022	3	8	Agosto	22	Lunes	1	f
20220823	2022-08-23	2022	3	8	Agosto	23	Martes	2	f
20220824	2022-08-24	2022	3	8	Agosto	24	Miércoles	3	f
20220825	2022-08-25	2022	3	8	Agosto	25	Jueves	4	f
20220826	2022-08-26	2022	3	8	Agosto	26	Viernes	5	f
20220827	2022-08-27	2022	3	8	Agosto	27	Sábado	6	t
20220828	2022-08-28	2022	3	8	Agosto	28	Domingo	7	t
20220829	2022-08-29	2022	3	8	Agosto	29	Lunes	1	f
20220830	2022-08-30	2022	3	8	Agosto	30	Martes	2	f
20220831	2022-08-31	2022	3	8	Agosto	31	Miércoles	3	f
20220901	2022-09-01	2022	3	9	Septiembre	1	Jueves	4	f
20220902	2022-09-02	2022	3	9	Septiembre	2	Viernes	5	f
20220903	2022-09-03	2022	3	9	Septiembre	3	Sábado	6	t
20220904	2022-09-04	2022	3	9	Septiembre	4	Domingo	7	t
20220905	2022-09-05	2022	3	9	Septiembre	5	Lunes	1	f
20220906	2022-09-06	2022	3	9	Septiembre	6	Martes	2	f
20220907	2022-09-07	2022	3	9	Septiembre	7	Miércoles	3	f
20220908	2022-09-08	2022	3	9	Septiembre	8	Jueves	4	f
20220909	2022-09-09	2022	3	9	Septiembre	9	Viernes	5	f
20220910	2022-09-10	2022	3	9	Septiembre	10	Sábado	6	t
20220911	2022-09-11	2022	3	9	Septiembre	11	Domingo	7	t
20220912	2022-09-12	2022	3	9	Septiembre	12	Lunes	1	f
20220913	2022-09-13	2022	3	9	Septiembre	13	Martes	2	f
20220914	2022-09-14	2022	3	9	Septiembre	14	Miércoles	3	f
20220915	2022-09-15	2022	3	9	Septiembre	15	Jueves	4	f
20220916	2022-09-16	2022	3	9	Septiembre	16	Viernes	5	f
20220917	2022-09-17	2022	3	9	Septiembre	17	Sábado	6	t
20220918	2022-09-18	2022	3	9	Septiembre	18	Domingo	7	t
20220919	2022-09-19	2022	3	9	Septiembre	19	Lunes	1	f
20220920	2022-09-20	2022	3	9	Septiembre	20	Martes	2	f
20220921	2022-09-21	2022	3	9	Septiembre	21	Miércoles	3	f
20220922	2022-09-22	2022	3	9	Septiembre	22	Jueves	4	f
20220923	2022-09-23	2022	3	9	Septiembre	23	Viernes	5	f
20220924	2022-09-24	2022	3	9	Septiembre	24	Sábado	6	t
20220925	2022-09-25	2022	3	9	Septiembre	25	Domingo	7	t
20220926	2022-09-26	2022	3	9	Septiembre	26	Lunes	1	f
20220927	2022-09-27	2022	3	9	Septiembre	27	Martes	2	f
20220928	2022-09-28	2022	3	9	Septiembre	28	Miércoles	3	f
20220929	2022-09-29	2022	3	9	Septiembre	29	Jueves	4	f
20220930	2022-09-30	2022	3	9	Septiembre	30	Viernes	5	f
20221001	2022-10-01	2022	4	10	Octubre	1	Sábado	6	t
20221002	2022-10-02	2022	4	10	Octubre	2	Domingo	7	t
20221003	2022-10-03	2022	4	10	Octubre	3	Lunes	1	f
20221004	2022-10-04	2022	4	10	Octubre	4	Martes	2	f
20221005	2022-10-05	2022	4	10	Octubre	5	Miércoles	3	f
20221006	2022-10-06	2022	4	10	Octubre	6	Jueves	4	f
20221007	2022-10-07	2022	4	10	Octubre	7	Viernes	5	f
20221008	2022-10-08	2022	4	10	Octubre	8	Sábado	6	t
20221009	2022-10-09	2022	4	10	Octubre	9	Domingo	7	t
20221010	2022-10-10	2022	4	10	Octubre	10	Lunes	1	f
20221011	2022-10-11	2022	4	10	Octubre	11	Martes	2	f
20221012	2022-10-12	2022	4	10	Octubre	12	Miércoles	3	f
20221013	2022-10-13	2022	4	10	Octubre	13	Jueves	4	f
20221014	2022-10-14	2022	4	10	Octubre	14	Viernes	5	f
20221015	2022-10-15	2022	4	10	Octubre	15	Sábado	6	t
20221016	2022-10-16	2022	4	10	Octubre	16	Domingo	7	t
20221017	2022-10-17	2022	4	10	Octubre	17	Lunes	1	f
20221018	2022-10-18	2022	4	10	Octubre	18	Martes	2	f
20221019	2022-10-19	2022	4	10	Octubre	19	Miércoles	3	f
20221020	2022-10-20	2022	4	10	Octubre	20	Jueves	4	f
20221021	2022-10-21	2022	4	10	Octubre	21	Viernes	5	f
20221022	2022-10-22	2022	4	10	Octubre	22	Sábado	6	t
20221023	2022-10-23	2022	4	10	Octubre	23	Domingo	7	t
20221024	2022-10-24	2022	4	10	Octubre	24	Lunes	1	f
20221025	2022-10-25	2022	4	10	Octubre	25	Martes	2	f
20221026	2022-10-26	2022	4	10	Octubre	26	Miércoles	3	f
20221027	2022-10-27	2022	4	10	Octubre	27	Jueves	4	f
20221028	2022-10-28	2022	4	10	Octubre	28	Viernes	5	f
20221029	2022-10-29	2022	4	10	Octubre	29	Sábado	6	t
20221030	2022-10-30	2022	4	10	Octubre	30	Domingo	7	t
20221031	2022-10-31	2022	4	10	Octubre	31	Lunes	1	f
20221101	2022-11-01	2022	4	11	Noviembre	1	Martes	2	f
20221102	2022-11-02	2022	4	11	Noviembre	2	Miércoles	3	f
20221103	2022-11-03	2022	4	11	Noviembre	3	Jueves	4	f
20221104	2022-11-04	2022	4	11	Noviembre	4	Viernes	5	f
20221105	2022-11-05	2022	4	11	Noviembre	5	Sábado	6	t
20221106	2022-11-06	2022	4	11	Noviembre	6	Domingo	7	t
20221107	2022-11-07	2022	4	11	Noviembre	7	Lunes	1	f
20221108	2022-11-08	2022	4	11	Noviembre	8	Martes	2	f
20221109	2022-11-09	2022	4	11	Noviembre	9	Miércoles	3	f
20221110	2022-11-10	2022	4	11	Noviembre	10	Jueves	4	f
20221111	2022-11-11	2022	4	11	Noviembre	11	Viernes	5	f
20221112	2022-11-12	2022	4	11	Noviembre	12	Sábado	6	t
20221113	2022-11-13	2022	4	11	Noviembre	13	Domingo	7	t
20221114	2022-11-14	2022	4	11	Noviembre	14	Lunes	1	f
20221115	2022-11-15	2022	4	11	Noviembre	15	Martes	2	f
20221116	2022-11-16	2022	4	11	Noviembre	16	Miércoles	3	f
20221117	2022-11-17	2022	4	11	Noviembre	17	Jueves	4	f
20221118	2022-11-18	2022	4	11	Noviembre	18	Viernes	5	f
20221119	2022-11-19	2022	4	11	Noviembre	19	Sábado	6	t
20221120	2022-11-20	2022	4	11	Noviembre	20	Domingo	7	t
20221121	2022-11-21	2022	4	11	Noviembre	21	Lunes	1	f
20221122	2022-11-22	2022	4	11	Noviembre	22	Martes	2	f
20221123	2022-11-23	2022	4	11	Noviembre	23	Miércoles	3	f
20221124	2022-11-24	2022	4	11	Noviembre	24	Jueves	4	f
20221125	2022-11-25	2022	4	11	Noviembre	25	Viernes	5	f
20221126	2022-11-26	2022	4	11	Noviembre	26	Sábado	6	t
20221127	2022-11-27	2022	4	11	Noviembre	27	Domingo	7	t
20221128	2022-11-28	2022	4	11	Noviembre	28	Lunes	1	f
20221129	2022-11-29	2022	4	11	Noviembre	29	Martes	2	f
20221130	2022-11-30	2022	4	11	Noviembre	30	Miércoles	3	f
20221201	2022-12-01	2022	4	12	Diciembre	1	Jueves	4	f
20221202	2022-12-02	2022	4	12	Diciembre	2	Viernes	5	f
20221203	2022-12-03	2022	4	12	Diciembre	3	Sábado	6	t
20221204	2022-12-04	2022	4	12	Diciembre	4	Domingo	7	t
20221205	2022-12-05	2022	4	12	Diciembre	5	Lunes	1	f
20221206	2022-12-06	2022	4	12	Diciembre	6	Martes	2	f
20221207	2022-12-07	2022	4	12	Diciembre	7	Miércoles	3	f
20221208	2022-12-08	2022	4	12	Diciembre	8	Jueves	4	f
20221209	2022-12-09	2022	4	12	Diciembre	9	Viernes	5	f
20221210	2022-12-10	2022	4	12	Diciembre	10	Sábado	6	t
20221211	2022-12-11	2022	4	12	Diciembre	11	Domingo	7	t
20221212	2022-12-12	2022	4	12	Diciembre	12	Lunes	1	f
20221213	2022-12-13	2022	4	12	Diciembre	13	Martes	2	f
20221214	2022-12-14	2022	4	12	Diciembre	14	Miércoles	3	f
20221215	2022-12-15	2022	4	12	Diciembre	15	Jueves	4	f
20221216	2022-12-16	2022	4	12	Diciembre	16	Viernes	5	f
20221217	2022-12-17	2022	4	12	Diciembre	17	Sábado	6	t
20221218	2022-12-18	2022	4	12	Diciembre	18	Domingo	7	t
20221219	2022-12-19	2022	4	12	Diciembre	19	Lunes	1	f
20221220	2022-12-20	2022	4	12	Diciembre	20	Martes	2	f
20221221	2022-12-21	2022	4	12	Diciembre	21	Miércoles	3	f
20221222	2022-12-22	2022	4	12	Diciembre	22	Jueves	4	f
20221223	2022-12-23	2022	4	12	Diciembre	23	Viernes	5	f
20221224	2022-12-24	2022	4	12	Diciembre	24	Sábado	6	t
20221225	2022-12-25	2022	4	12	Diciembre	25	Domingo	7	t
20221226	2022-12-26	2022	4	12	Diciembre	26	Lunes	1	f
20221227	2022-12-27	2022	4	12	Diciembre	27	Martes	2	f
20221228	2022-12-28	2022	4	12	Diciembre	28	Miércoles	3	f
20221229	2022-12-29	2022	4	12	Diciembre	29	Jueves	4	f
20221230	2022-12-30	2022	4	12	Diciembre	30	Viernes	5	f
20221231	2022-12-31	2022	4	12	Diciembre	31	Sábado	6	t
20230101	2023-01-01	2023	1	1	Enero	1	Domingo	7	t
20230102	2023-01-02	2023	1	1	Enero	2	Lunes	1	f
20230103	2023-01-03	2023	1	1	Enero	3	Martes	2	f
20230104	2023-01-04	2023	1	1	Enero	4	Miércoles	3	f
20230105	2023-01-05	2023	1	1	Enero	5	Jueves	4	f
20230106	2023-01-06	2023	1	1	Enero	6	Viernes	5	f
20230107	2023-01-07	2023	1	1	Enero	7	Sábado	6	t
20230108	2023-01-08	2023	1	1	Enero	8	Domingo	7	t
20230109	2023-01-09	2023	1	1	Enero	9	Lunes	1	f
20230110	2023-01-10	2023	1	1	Enero	10	Martes	2	f
20230111	2023-01-11	2023	1	1	Enero	11	Miércoles	3	f
20230112	2023-01-12	2023	1	1	Enero	12	Jueves	4	f
20230113	2023-01-13	2023	1	1	Enero	13	Viernes	5	f
20230114	2023-01-14	2023	1	1	Enero	14	Sábado	6	t
20230115	2023-01-15	2023	1	1	Enero	15	Domingo	7	t
20230116	2023-01-16	2023	1	1	Enero	16	Lunes	1	f
20230117	2023-01-17	2023	1	1	Enero	17	Martes	2	f
20230118	2023-01-18	2023	1	1	Enero	18	Miércoles	3	f
20230119	2023-01-19	2023	1	1	Enero	19	Jueves	4	f
20230120	2023-01-20	2023	1	1	Enero	20	Viernes	5	f
20230121	2023-01-21	2023	1	1	Enero	21	Sábado	6	t
20230122	2023-01-22	2023	1	1	Enero	22	Domingo	7	t
20230123	2023-01-23	2023	1	1	Enero	23	Lunes	1	f
20230124	2023-01-24	2023	1	1	Enero	24	Martes	2	f
20230125	2023-01-25	2023	1	1	Enero	25	Miércoles	3	f
20230126	2023-01-26	2023	1	1	Enero	26	Jueves	4	f
20230127	2023-01-27	2023	1	1	Enero	27	Viernes	5	f
20230128	2023-01-28	2023	1	1	Enero	28	Sábado	6	t
20230129	2023-01-29	2023	1	1	Enero	29	Domingo	7	t
20230130	2023-01-30	2023	1	1	Enero	30	Lunes	1	f
20230131	2023-01-31	2023	1	1	Enero	31	Martes	2	f
20230201	2023-02-01	2023	1	2	Febrero	1	Miércoles	3	f
20230202	2023-02-02	2023	1	2	Febrero	2	Jueves	4	f
20230203	2023-02-03	2023	1	2	Febrero	3	Viernes	5	f
20230204	2023-02-04	2023	1	2	Febrero	4	Sábado	6	t
20230205	2023-02-05	2023	1	2	Febrero	5	Domingo	7	t
20230206	2023-02-06	2023	1	2	Febrero	6	Lunes	1	f
20230207	2023-02-07	2023	1	2	Febrero	7	Martes	2	f
20230208	2023-02-08	2023	1	2	Febrero	8	Miércoles	3	f
20230209	2023-02-09	2023	1	2	Febrero	9	Jueves	4	f
20230210	2023-02-10	2023	1	2	Febrero	10	Viernes	5	f
20230211	2023-02-11	2023	1	2	Febrero	11	Sábado	6	t
20230212	2023-02-12	2023	1	2	Febrero	12	Domingo	7	t
20230213	2023-02-13	2023	1	2	Febrero	13	Lunes	1	f
20230214	2023-02-14	2023	1	2	Febrero	14	Martes	2	f
20230215	2023-02-15	2023	1	2	Febrero	15	Miércoles	3	f
20230216	2023-02-16	2023	1	2	Febrero	16	Jueves	4	f
20230217	2023-02-17	2023	1	2	Febrero	17	Viernes	5	f
20230218	2023-02-18	2023	1	2	Febrero	18	Sábado	6	t
20230219	2023-02-19	2023	1	2	Febrero	19	Domingo	7	t
20230220	2023-02-20	2023	1	2	Febrero	20	Lunes	1	f
20230221	2023-02-21	2023	1	2	Febrero	21	Martes	2	f
20230222	2023-02-22	2023	1	2	Febrero	22	Miércoles	3	f
20230223	2023-02-23	2023	1	2	Febrero	23	Jueves	4	f
20230224	2023-02-24	2023	1	2	Febrero	24	Viernes	5	f
20230225	2023-02-25	2023	1	2	Febrero	25	Sábado	6	t
20230226	2023-02-26	2023	1	2	Febrero	26	Domingo	7	t
20230227	2023-02-27	2023	1	2	Febrero	27	Lunes	1	f
20230228	2023-02-28	2023	1	2	Febrero	28	Martes	2	f
20230301	2023-03-01	2023	1	3	Marzo	1	Miércoles	3	f
20230302	2023-03-02	2023	1	3	Marzo	2	Jueves	4	f
20230303	2023-03-03	2023	1	3	Marzo	3	Viernes	5	f
20230304	2023-03-04	2023	1	3	Marzo	4	Sábado	6	t
20230305	2023-03-05	2023	1	3	Marzo	5	Domingo	7	t
20230306	2023-03-06	2023	1	3	Marzo	6	Lunes	1	f
20230307	2023-03-07	2023	1	3	Marzo	7	Martes	2	f
20230308	2023-03-08	2023	1	3	Marzo	8	Miércoles	3	f
20230309	2023-03-09	2023	1	3	Marzo	9	Jueves	4	f
20230310	2023-03-10	2023	1	3	Marzo	10	Viernes	5	f
20230311	2023-03-11	2023	1	3	Marzo	11	Sábado	6	t
20230312	2023-03-12	2023	1	3	Marzo	12	Domingo	7	t
20230313	2023-03-13	2023	1	3	Marzo	13	Lunes	1	f
20230314	2023-03-14	2023	1	3	Marzo	14	Martes	2	f
20230315	2023-03-15	2023	1	3	Marzo	15	Miércoles	3	f
20230316	2023-03-16	2023	1	3	Marzo	16	Jueves	4	f
20230317	2023-03-17	2023	1	3	Marzo	17	Viernes	5	f
20230318	2023-03-18	2023	1	3	Marzo	18	Sábado	6	t
20230319	2023-03-19	2023	1	3	Marzo	19	Domingo	7	t
20230320	2023-03-20	2023	1	3	Marzo	20	Lunes	1	f
20230321	2023-03-21	2023	1	3	Marzo	21	Martes	2	f
20230322	2023-03-22	2023	1	3	Marzo	22	Miércoles	3	f
20230323	2023-03-23	2023	1	3	Marzo	23	Jueves	4	f
20230324	2023-03-24	2023	1	3	Marzo	24	Viernes	5	f
20230325	2023-03-25	2023	1	3	Marzo	25	Sábado	6	t
20230326	2023-03-26	2023	1	3	Marzo	26	Domingo	7	t
20230327	2023-03-27	2023	1	3	Marzo	27	Lunes	1	f
20230328	2023-03-28	2023	1	3	Marzo	28	Martes	2	f
20230329	2023-03-29	2023	1	3	Marzo	29	Miércoles	3	f
20230330	2023-03-30	2023	1	3	Marzo	30	Jueves	4	f
20230331	2023-03-31	2023	1	3	Marzo	31	Viernes	5	f
20230401	2023-04-01	2023	2	4	Abril	1	Sábado	6	t
20230402	2023-04-02	2023	2	4	Abril	2	Domingo	7	t
20230403	2023-04-03	2023	2	4	Abril	3	Lunes	1	f
20230404	2023-04-04	2023	2	4	Abril	4	Martes	2	f
20230405	2023-04-05	2023	2	4	Abril	5	Miércoles	3	f
20230406	2023-04-06	2023	2	4	Abril	6	Jueves	4	f
20230407	2023-04-07	2023	2	4	Abril	7	Viernes	5	f
20230408	2023-04-08	2023	2	4	Abril	8	Sábado	6	t
20230409	2023-04-09	2023	2	4	Abril	9	Domingo	7	t
20230410	2023-04-10	2023	2	4	Abril	10	Lunes	1	f
20230411	2023-04-11	2023	2	4	Abril	11	Martes	2	f
20230412	2023-04-12	2023	2	4	Abril	12	Miércoles	3	f
20230413	2023-04-13	2023	2	4	Abril	13	Jueves	4	f
20230414	2023-04-14	2023	2	4	Abril	14	Viernes	5	f
20230415	2023-04-15	2023	2	4	Abril	15	Sábado	6	t
20230416	2023-04-16	2023	2	4	Abril	16	Domingo	7	t
20230417	2023-04-17	2023	2	4	Abril	17	Lunes	1	f
20230418	2023-04-18	2023	2	4	Abril	18	Martes	2	f
20230419	2023-04-19	2023	2	4	Abril	19	Miércoles	3	f
20230420	2023-04-20	2023	2	4	Abril	20	Jueves	4	f
20230421	2023-04-21	2023	2	4	Abril	21	Viernes	5	f
20230422	2023-04-22	2023	2	4	Abril	22	Sábado	6	t
20230423	2023-04-23	2023	2	4	Abril	23	Domingo	7	t
20230424	2023-04-24	2023	2	4	Abril	24	Lunes	1	f
20230425	2023-04-25	2023	2	4	Abril	25	Martes	2	f
20230426	2023-04-26	2023	2	4	Abril	26	Miércoles	3	f
20230427	2023-04-27	2023	2	4	Abril	27	Jueves	4	f
20230428	2023-04-28	2023	2	4	Abril	28	Viernes	5	f
20230429	2023-04-29	2023	2	4	Abril	29	Sábado	6	t
20230430	2023-04-30	2023	2	4	Abril	30	Domingo	7	t
20230501	2023-05-01	2023	2	5	Mayo	1	Lunes	1	f
20230502	2023-05-02	2023	2	5	Mayo	2	Martes	2	f
20230503	2023-05-03	2023	2	5	Mayo	3	Miércoles	3	f
20230504	2023-05-04	2023	2	5	Mayo	4	Jueves	4	f
20230505	2023-05-05	2023	2	5	Mayo	5	Viernes	5	f
20230506	2023-05-06	2023	2	5	Mayo	6	Sábado	6	t
20230507	2023-05-07	2023	2	5	Mayo	7	Domingo	7	t
20230508	2023-05-08	2023	2	5	Mayo	8	Lunes	1	f
20230509	2023-05-09	2023	2	5	Mayo	9	Martes	2	f
20230510	2023-05-10	2023	2	5	Mayo	10	Miércoles	3	f
20230511	2023-05-11	2023	2	5	Mayo	11	Jueves	4	f
20230512	2023-05-12	2023	2	5	Mayo	12	Viernes	5	f
20230513	2023-05-13	2023	2	5	Mayo	13	Sábado	6	t
20230514	2023-05-14	2023	2	5	Mayo	14	Domingo	7	t
20230515	2023-05-15	2023	2	5	Mayo	15	Lunes	1	f
20230516	2023-05-16	2023	2	5	Mayo	16	Martes	2	f
20230517	2023-05-17	2023	2	5	Mayo	17	Miércoles	3	f
20230518	2023-05-18	2023	2	5	Mayo	18	Jueves	4	f
20230519	2023-05-19	2023	2	5	Mayo	19	Viernes	5	f
20230520	2023-05-20	2023	2	5	Mayo	20	Sábado	6	t
20230521	2023-05-21	2023	2	5	Mayo	21	Domingo	7	t
20230522	2023-05-22	2023	2	5	Mayo	22	Lunes	1	f
20230523	2023-05-23	2023	2	5	Mayo	23	Martes	2	f
20230524	2023-05-24	2023	2	5	Mayo	24	Miércoles	3	f
20230525	2023-05-25	2023	2	5	Mayo	25	Jueves	4	f
20230526	2023-05-26	2023	2	5	Mayo	26	Viernes	5	f
20230527	2023-05-27	2023	2	5	Mayo	27	Sábado	6	t
20230528	2023-05-28	2023	2	5	Mayo	28	Domingo	7	t
20230529	2023-05-29	2023	2	5	Mayo	29	Lunes	1	f
20230530	2023-05-30	2023	2	5	Mayo	30	Martes	2	f
20230531	2023-05-31	2023	2	5	Mayo	31	Miércoles	3	f
20230601	2023-06-01	2023	2	6	Junio	1	Jueves	4	f
20230602	2023-06-02	2023	2	6	Junio	2	Viernes	5	f
20230603	2023-06-03	2023	2	6	Junio	3	Sábado	6	t
20230604	2023-06-04	2023	2	6	Junio	4	Domingo	7	t
20230605	2023-06-05	2023	2	6	Junio	5	Lunes	1	f
20230606	2023-06-06	2023	2	6	Junio	6	Martes	2	f
20230607	2023-06-07	2023	2	6	Junio	7	Miércoles	3	f
20230608	2023-06-08	2023	2	6	Junio	8	Jueves	4	f
20230609	2023-06-09	2023	2	6	Junio	9	Viernes	5	f
20230610	2023-06-10	2023	2	6	Junio	10	Sábado	6	t
20230611	2023-06-11	2023	2	6	Junio	11	Domingo	7	t
20230612	2023-06-12	2023	2	6	Junio	12	Lunes	1	f
20230613	2023-06-13	2023	2	6	Junio	13	Martes	2	f
20230614	2023-06-14	2023	2	6	Junio	14	Miércoles	3	f
20230615	2023-06-15	2023	2	6	Junio	15	Jueves	4	f
20230616	2023-06-16	2023	2	6	Junio	16	Viernes	5	f
20230617	2023-06-17	2023	2	6	Junio	17	Sábado	6	t
20230618	2023-06-18	2023	2	6	Junio	18	Domingo	7	t
20230619	2023-06-19	2023	2	6	Junio	19	Lunes	1	f
20230620	2023-06-20	2023	2	6	Junio	20	Martes	2	f
20230621	2023-06-21	2023	2	6	Junio	21	Miércoles	3	f
20230622	2023-06-22	2023	2	6	Junio	22	Jueves	4	f
20230623	2023-06-23	2023	2	6	Junio	23	Viernes	5	f
20230624	2023-06-24	2023	2	6	Junio	24	Sábado	6	t
20230625	2023-06-25	2023	2	6	Junio	25	Domingo	7	t
20230626	2023-06-26	2023	2	6	Junio	26	Lunes	1	f
20230627	2023-06-27	2023	2	6	Junio	27	Martes	2	f
20230628	2023-06-28	2023	2	6	Junio	28	Miércoles	3	f
20230629	2023-06-29	2023	2	6	Junio	29	Jueves	4	f
20230630	2023-06-30	2023	2	6	Junio	30	Viernes	5	f
20230701	2023-07-01	2023	3	7	Julio	1	Sábado	6	t
20230702	2023-07-02	2023	3	7	Julio	2	Domingo	7	t
20230703	2023-07-03	2023	3	7	Julio	3	Lunes	1	f
20230704	2023-07-04	2023	3	7	Julio	4	Martes	2	f
20230705	2023-07-05	2023	3	7	Julio	5	Miércoles	3	f
20230706	2023-07-06	2023	3	7	Julio	6	Jueves	4	f
20230707	2023-07-07	2023	3	7	Julio	7	Viernes	5	f
20230708	2023-07-08	2023	3	7	Julio	8	Sábado	6	t
20230709	2023-07-09	2023	3	7	Julio	9	Domingo	7	t
20230710	2023-07-10	2023	3	7	Julio	10	Lunes	1	f
20230711	2023-07-11	2023	3	7	Julio	11	Martes	2	f
20230712	2023-07-12	2023	3	7	Julio	12	Miércoles	3	f
20230713	2023-07-13	2023	3	7	Julio	13	Jueves	4	f
20230714	2023-07-14	2023	3	7	Julio	14	Viernes	5	f
20230715	2023-07-15	2023	3	7	Julio	15	Sábado	6	t
20230716	2023-07-16	2023	3	7	Julio	16	Domingo	7	t
20230717	2023-07-17	2023	3	7	Julio	17	Lunes	1	f
20230718	2023-07-18	2023	3	7	Julio	18	Martes	2	f
20230719	2023-07-19	2023	3	7	Julio	19	Miércoles	3	f
20230720	2023-07-20	2023	3	7	Julio	20	Jueves	4	f
20230721	2023-07-21	2023	3	7	Julio	21	Viernes	5	f
20230722	2023-07-22	2023	3	7	Julio	22	Sábado	6	t
20230723	2023-07-23	2023	3	7	Julio	23	Domingo	7	t
20230724	2023-07-24	2023	3	7	Julio	24	Lunes	1	f
20230725	2023-07-25	2023	3	7	Julio	25	Martes	2	f
20230726	2023-07-26	2023	3	7	Julio	26	Miércoles	3	f
20230727	2023-07-27	2023	3	7	Julio	27	Jueves	4	f
20230728	2023-07-28	2023	3	7	Julio	28	Viernes	5	f
20230729	2023-07-29	2023	3	7	Julio	29	Sábado	6	t
20230730	2023-07-30	2023	3	7	Julio	30	Domingo	7	t
20230731	2023-07-31	2023	3	7	Julio	31	Lunes	1	f
20230801	2023-08-01	2023	3	8	Agosto	1	Martes	2	f
20230802	2023-08-02	2023	3	8	Agosto	2	Miércoles	3	f
20230803	2023-08-03	2023	3	8	Agosto	3	Jueves	4	f
20230804	2023-08-04	2023	3	8	Agosto	4	Viernes	5	f
20230805	2023-08-05	2023	3	8	Agosto	5	Sábado	6	t
20230806	2023-08-06	2023	3	8	Agosto	6	Domingo	7	t
20230807	2023-08-07	2023	3	8	Agosto	7	Lunes	1	f
20230808	2023-08-08	2023	3	8	Agosto	8	Martes	2	f
20230809	2023-08-09	2023	3	8	Agosto	9	Miércoles	3	f
20230810	2023-08-10	2023	3	8	Agosto	10	Jueves	4	f
20230811	2023-08-11	2023	3	8	Agosto	11	Viernes	5	f
20230812	2023-08-12	2023	3	8	Agosto	12	Sábado	6	t
20230813	2023-08-13	2023	3	8	Agosto	13	Domingo	7	t
20230814	2023-08-14	2023	3	8	Agosto	14	Lunes	1	f
20230815	2023-08-15	2023	3	8	Agosto	15	Martes	2	f
20230816	2023-08-16	2023	3	8	Agosto	16	Miércoles	3	f
20230817	2023-08-17	2023	3	8	Agosto	17	Jueves	4	f
20230818	2023-08-18	2023	3	8	Agosto	18	Viernes	5	f
20230819	2023-08-19	2023	3	8	Agosto	19	Sábado	6	t
20230820	2023-08-20	2023	3	8	Agosto	20	Domingo	7	t
20230821	2023-08-21	2023	3	8	Agosto	21	Lunes	1	f
20230822	2023-08-22	2023	3	8	Agosto	22	Martes	2	f
20230823	2023-08-23	2023	3	8	Agosto	23	Miércoles	3	f
20230824	2023-08-24	2023	3	8	Agosto	24	Jueves	4	f
20230825	2023-08-25	2023	3	8	Agosto	25	Viernes	5	f
20230826	2023-08-26	2023	3	8	Agosto	26	Sábado	6	t
20230827	2023-08-27	2023	3	8	Agosto	27	Domingo	7	t
20230828	2023-08-28	2023	3	8	Agosto	28	Lunes	1	f
20230829	2023-08-29	2023	3	8	Agosto	29	Martes	2	f
20230830	2023-08-30	2023	3	8	Agosto	30	Miércoles	3	f
20230831	2023-08-31	2023	3	8	Agosto	31	Jueves	4	f
20230901	2023-09-01	2023	3	9	Septiembre	1	Viernes	5	f
20230902	2023-09-02	2023	3	9	Septiembre	2	Sábado	6	t
20230903	2023-09-03	2023	3	9	Septiembre	3	Domingo	7	t
20230904	2023-09-04	2023	3	9	Septiembre	4	Lunes	1	f
20230905	2023-09-05	2023	3	9	Septiembre	5	Martes	2	f
20230906	2023-09-06	2023	3	9	Septiembre	6	Miércoles	3	f
20230907	2023-09-07	2023	3	9	Septiembre	7	Jueves	4	f
20230908	2023-09-08	2023	3	9	Septiembre	8	Viernes	5	f
20230909	2023-09-09	2023	3	9	Septiembre	9	Sábado	6	t
20230910	2023-09-10	2023	3	9	Septiembre	10	Domingo	7	t
20230911	2023-09-11	2023	3	9	Septiembre	11	Lunes	1	f
20230912	2023-09-12	2023	3	9	Septiembre	12	Martes	2	f
20230913	2023-09-13	2023	3	9	Septiembre	13	Miércoles	3	f
20230914	2023-09-14	2023	3	9	Septiembre	14	Jueves	4	f
20230915	2023-09-15	2023	3	9	Septiembre	15	Viernes	5	f
20230916	2023-09-16	2023	3	9	Septiembre	16	Sábado	6	t
20230917	2023-09-17	2023	3	9	Septiembre	17	Domingo	7	t
20230918	2023-09-18	2023	3	9	Septiembre	18	Lunes	1	f
20230919	2023-09-19	2023	3	9	Septiembre	19	Martes	2	f
20230920	2023-09-20	2023	3	9	Septiembre	20	Miércoles	3	f
20230921	2023-09-21	2023	3	9	Septiembre	21	Jueves	4	f
20230922	2023-09-22	2023	3	9	Septiembre	22	Viernes	5	f
20230923	2023-09-23	2023	3	9	Septiembre	23	Sábado	6	t
20230924	2023-09-24	2023	3	9	Septiembre	24	Domingo	7	t
20230925	2023-09-25	2023	3	9	Septiembre	25	Lunes	1	f
20230926	2023-09-26	2023	3	9	Septiembre	26	Martes	2	f
20230927	2023-09-27	2023	3	9	Septiembre	27	Miércoles	3	f
20230928	2023-09-28	2023	3	9	Septiembre	28	Jueves	4	f
20230929	2023-09-29	2023	3	9	Septiembre	29	Viernes	5	f
20230930	2023-09-30	2023	3	9	Septiembre	30	Sábado	6	t
20231001	2023-10-01	2023	4	10	Octubre	1	Domingo	7	t
20231002	2023-10-02	2023	4	10	Octubre	2	Lunes	1	f
20231003	2023-10-03	2023	4	10	Octubre	3	Martes	2	f
20231004	2023-10-04	2023	4	10	Octubre	4	Miércoles	3	f
20231005	2023-10-05	2023	4	10	Octubre	5	Jueves	4	f
20231006	2023-10-06	2023	4	10	Octubre	6	Viernes	5	f
20231007	2023-10-07	2023	4	10	Octubre	7	Sábado	6	t
20231008	2023-10-08	2023	4	10	Octubre	8	Domingo	7	t
20231009	2023-10-09	2023	4	10	Octubre	9	Lunes	1	f
20231010	2023-10-10	2023	4	10	Octubre	10	Martes	2	f
20231011	2023-10-11	2023	4	10	Octubre	11	Miércoles	3	f
20231012	2023-10-12	2023	4	10	Octubre	12	Jueves	4	f
20231013	2023-10-13	2023	4	10	Octubre	13	Viernes	5	f
20231014	2023-10-14	2023	4	10	Octubre	14	Sábado	6	t
20231015	2023-10-15	2023	4	10	Octubre	15	Domingo	7	t
20231016	2023-10-16	2023	4	10	Octubre	16	Lunes	1	f
20231017	2023-10-17	2023	4	10	Octubre	17	Martes	2	f
20231018	2023-10-18	2023	4	10	Octubre	18	Miércoles	3	f
20231019	2023-10-19	2023	4	10	Octubre	19	Jueves	4	f
20231020	2023-10-20	2023	4	10	Octubre	20	Viernes	5	f
20231021	2023-10-21	2023	4	10	Octubre	21	Sábado	6	t
20231022	2023-10-22	2023	4	10	Octubre	22	Domingo	7	t
20231023	2023-10-23	2023	4	10	Octubre	23	Lunes	1	f
20231024	2023-10-24	2023	4	10	Octubre	24	Martes	2	f
20231025	2023-10-25	2023	4	10	Octubre	25	Miércoles	3	f
20231026	2023-10-26	2023	4	10	Octubre	26	Jueves	4	f
20231027	2023-10-27	2023	4	10	Octubre	27	Viernes	5	f
20231028	2023-10-28	2023	4	10	Octubre	28	Sábado	6	t
20231029	2023-10-29	2023	4	10	Octubre	29	Domingo	7	t
20231030	2023-10-30	2023	4	10	Octubre	30	Lunes	1	f
20231031	2023-10-31	2023	4	10	Octubre	31	Martes	2	f
20231101	2023-11-01	2023	4	11	Noviembre	1	Miércoles	3	f
20231102	2023-11-02	2023	4	11	Noviembre	2	Jueves	4	f
20231103	2023-11-03	2023	4	11	Noviembre	3	Viernes	5	f
20231104	2023-11-04	2023	4	11	Noviembre	4	Sábado	6	t
20231105	2023-11-05	2023	4	11	Noviembre	5	Domingo	7	t
20231106	2023-11-06	2023	4	11	Noviembre	6	Lunes	1	f
20231107	2023-11-07	2023	4	11	Noviembre	7	Martes	2	f
20231108	2023-11-08	2023	4	11	Noviembre	8	Miércoles	3	f
20231109	2023-11-09	2023	4	11	Noviembre	9	Jueves	4	f
20231110	2023-11-10	2023	4	11	Noviembre	10	Viernes	5	f
20231111	2023-11-11	2023	4	11	Noviembre	11	Sábado	6	t
20231112	2023-11-12	2023	4	11	Noviembre	12	Domingo	7	t
20231113	2023-11-13	2023	4	11	Noviembre	13	Lunes	1	f
20231114	2023-11-14	2023	4	11	Noviembre	14	Martes	2	f
20231115	2023-11-15	2023	4	11	Noviembre	15	Miércoles	3	f
20231116	2023-11-16	2023	4	11	Noviembre	16	Jueves	4	f
20231117	2023-11-17	2023	4	11	Noviembre	17	Viernes	5	f
20231118	2023-11-18	2023	4	11	Noviembre	18	Sábado	6	t
20231119	2023-11-19	2023	4	11	Noviembre	19	Domingo	7	t
20231120	2023-11-20	2023	4	11	Noviembre	20	Lunes	1	f
20231121	2023-11-21	2023	4	11	Noviembre	21	Martes	2	f
20231122	2023-11-22	2023	4	11	Noviembre	22	Miércoles	3	f
20231123	2023-11-23	2023	4	11	Noviembre	23	Jueves	4	f
20231124	2023-11-24	2023	4	11	Noviembre	24	Viernes	5	f
20231125	2023-11-25	2023	4	11	Noviembre	25	Sábado	6	t
20231126	2023-11-26	2023	4	11	Noviembre	26	Domingo	7	t
20231127	2023-11-27	2023	4	11	Noviembre	27	Lunes	1	f
20231128	2023-11-28	2023	4	11	Noviembre	28	Martes	2	f
20231129	2023-11-29	2023	4	11	Noviembre	29	Miércoles	3	f
20231130	2023-11-30	2023	4	11	Noviembre	30	Jueves	4	f
20231201	2023-12-01	2023	4	12	Diciembre	1	Viernes	5	f
20231202	2023-12-02	2023	4	12	Diciembre	2	Sábado	6	t
20231203	2023-12-03	2023	4	12	Diciembre	3	Domingo	7	t
20231204	2023-12-04	2023	4	12	Diciembre	4	Lunes	1	f
20231205	2023-12-05	2023	4	12	Diciembre	5	Martes	2	f
20231206	2023-12-06	2023	4	12	Diciembre	6	Miércoles	3	f
20231207	2023-12-07	2023	4	12	Diciembre	7	Jueves	4	f
20231208	2023-12-08	2023	4	12	Diciembre	8	Viernes	5	f
20231209	2023-12-09	2023	4	12	Diciembre	9	Sábado	6	t
20231210	2023-12-10	2023	4	12	Diciembre	10	Domingo	7	t
20231211	2023-12-11	2023	4	12	Diciembre	11	Lunes	1	f
20231212	2023-12-12	2023	4	12	Diciembre	12	Martes	2	f
20231213	2023-12-13	2023	4	12	Diciembre	13	Miércoles	3	f
20231214	2023-12-14	2023	4	12	Diciembre	14	Jueves	4	f
20231215	2023-12-15	2023	4	12	Diciembre	15	Viernes	5	f
20231216	2023-12-16	2023	4	12	Diciembre	16	Sábado	6	t
20231217	2023-12-17	2023	4	12	Diciembre	17	Domingo	7	t
20231218	2023-12-18	2023	4	12	Diciembre	18	Lunes	1	f
20231219	2023-12-19	2023	4	12	Diciembre	19	Martes	2	f
20231220	2023-12-20	2023	4	12	Diciembre	20	Miércoles	3	f
20231221	2023-12-21	2023	4	12	Diciembre	21	Jueves	4	f
20231222	2023-12-22	2023	4	12	Diciembre	22	Viernes	5	f
20231223	2023-12-23	2023	4	12	Diciembre	23	Sábado	6	t
20231224	2023-12-24	2023	4	12	Diciembre	24	Domingo	7	t
20231225	2023-12-25	2023	4	12	Diciembre	25	Lunes	1	f
20231226	2023-12-26	2023	4	12	Diciembre	26	Martes	2	f
20231227	2023-12-27	2023	4	12	Diciembre	27	Miércoles	3	f
20231228	2023-12-28	2023	4	12	Diciembre	28	Jueves	4	f
20231229	2023-12-29	2023	4	12	Diciembre	29	Viernes	5	f
20231230	2023-12-30	2023	4	12	Diciembre	30	Sábado	6	t
20231231	2023-12-31	2023	4	12	Diciembre	31	Domingo	7	t
20240101	2024-01-01	2024	1	1	Enero	1	Lunes	1	f
20240102	2024-01-02	2024	1	1	Enero	2	Martes	2	f
20240103	2024-01-03	2024	1	1	Enero	3	Miércoles	3	f
20240104	2024-01-04	2024	1	1	Enero	4	Jueves	4	f
20240105	2024-01-05	2024	1	1	Enero	5	Viernes	5	f
20240106	2024-01-06	2024	1	1	Enero	6	Sábado	6	t
20240107	2024-01-07	2024	1	1	Enero	7	Domingo	7	t
20240108	2024-01-08	2024	1	1	Enero	8	Lunes	1	f
20240109	2024-01-09	2024	1	1	Enero	9	Martes	2	f
20240110	2024-01-10	2024	1	1	Enero	10	Miércoles	3	f
20240111	2024-01-11	2024	1	1	Enero	11	Jueves	4	f
20240112	2024-01-12	2024	1	1	Enero	12	Viernes	5	f
20240113	2024-01-13	2024	1	1	Enero	13	Sábado	6	t
20240114	2024-01-14	2024	1	1	Enero	14	Domingo	7	t
20240115	2024-01-15	2024	1	1	Enero	15	Lunes	1	f
20240116	2024-01-16	2024	1	1	Enero	16	Martes	2	f
20240117	2024-01-17	2024	1	1	Enero	17	Miércoles	3	f
20240118	2024-01-18	2024	1	1	Enero	18	Jueves	4	f
20240119	2024-01-19	2024	1	1	Enero	19	Viernes	5	f
20240120	2024-01-20	2024	1	1	Enero	20	Sábado	6	t
20240121	2024-01-21	2024	1	1	Enero	21	Domingo	7	t
20240122	2024-01-22	2024	1	1	Enero	22	Lunes	1	f
20240123	2024-01-23	2024	1	1	Enero	23	Martes	2	f
20240124	2024-01-24	2024	1	1	Enero	24	Miércoles	3	f
20240125	2024-01-25	2024	1	1	Enero	25	Jueves	4	f
20240126	2024-01-26	2024	1	1	Enero	26	Viernes	5	f
20240127	2024-01-27	2024	1	1	Enero	27	Sábado	6	t
20240128	2024-01-28	2024	1	1	Enero	28	Domingo	7	t
20240129	2024-01-29	2024	1	1	Enero	29	Lunes	1	f
20240130	2024-01-30	2024	1	1	Enero	30	Martes	2	f
20240131	2024-01-31	2024	1	1	Enero	31	Miércoles	3	f
20240201	2024-02-01	2024	1	2	Febrero	1	Jueves	4	f
20240202	2024-02-02	2024	1	2	Febrero	2	Viernes	5	f
20240203	2024-02-03	2024	1	2	Febrero	3	Sábado	6	t
20240204	2024-02-04	2024	1	2	Febrero	4	Domingo	7	t
20240205	2024-02-05	2024	1	2	Febrero	5	Lunes	1	f
20240206	2024-02-06	2024	1	2	Febrero	6	Martes	2	f
20240207	2024-02-07	2024	1	2	Febrero	7	Miércoles	3	f
20240208	2024-02-08	2024	1	2	Febrero	8	Jueves	4	f
20240209	2024-02-09	2024	1	2	Febrero	9	Viernes	5	f
20240210	2024-02-10	2024	1	2	Febrero	10	Sábado	6	t
20240211	2024-02-11	2024	1	2	Febrero	11	Domingo	7	t
20240212	2024-02-12	2024	1	2	Febrero	12	Lunes	1	f
20240213	2024-02-13	2024	1	2	Febrero	13	Martes	2	f
20240214	2024-02-14	2024	1	2	Febrero	14	Miércoles	3	f
20240215	2024-02-15	2024	1	2	Febrero	15	Jueves	4	f
20240216	2024-02-16	2024	1	2	Febrero	16	Viernes	5	f
20240217	2024-02-17	2024	1	2	Febrero	17	Sábado	6	t
20240218	2024-02-18	2024	1	2	Febrero	18	Domingo	7	t
20240219	2024-02-19	2024	1	2	Febrero	19	Lunes	1	f
20240220	2024-02-20	2024	1	2	Febrero	20	Martes	2	f
20240221	2024-02-21	2024	1	2	Febrero	21	Miércoles	3	f
20240222	2024-02-22	2024	1	2	Febrero	22	Jueves	4	f
20240223	2024-02-23	2024	1	2	Febrero	23	Viernes	5	f
20240224	2024-02-24	2024	1	2	Febrero	24	Sábado	6	t
20240225	2024-02-25	2024	1	2	Febrero	25	Domingo	7	t
20240226	2024-02-26	2024	1	2	Febrero	26	Lunes	1	f
20240227	2024-02-27	2024	1	2	Febrero	27	Martes	2	f
20240228	2024-02-28	2024	1	2	Febrero	28	Miércoles	3	f
20240229	2024-02-29	2024	1	2	Febrero	29	Jueves	4	f
20240301	2024-03-01	2024	1	3	Marzo	1	Viernes	5	f
20240302	2024-03-02	2024	1	3	Marzo	2	Sábado	6	t
20240303	2024-03-03	2024	1	3	Marzo	3	Domingo	7	t
20240304	2024-03-04	2024	1	3	Marzo	4	Lunes	1	f
20240305	2024-03-05	2024	1	3	Marzo	5	Martes	2	f
20240306	2024-03-06	2024	1	3	Marzo	6	Miércoles	3	f
20240307	2024-03-07	2024	1	3	Marzo	7	Jueves	4	f
20240308	2024-03-08	2024	1	3	Marzo	8	Viernes	5	f
20240309	2024-03-09	2024	1	3	Marzo	9	Sábado	6	t
20240310	2024-03-10	2024	1	3	Marzo	10	Domingo	7	t
20240311	2024-03-11	2024	1	3	Marzo	11	Lunes	1	f
20240312	2024-03-12	2024	1	3	Marzo	12	Martes	2	f
20240313	2024-03-13	2024	1	3	Marzo	13	Miércoles	3	f
20240314	2024-03-14	2024	1	3	Marzo	14	Jueves	4	f
20240315	2024-03-15	2024	1	3	Marzo	15	Viernes	5	f
20240316	2024-03-16	2024	1	3	Marzo	16	Sábado	6	t
20240317	2024-03-17	2024	1	3	Marzo	17	Domingo	7	t
20240318	2024-03-18	2024	1	3	Marzo	18	Lunes	1	f
20240319	2024-03-19	2024	1	3	Marzo	19	Martes	2	f
20240320	2024-03-20	2024	1	3	Marzo	20	Miércoles	3	f
20240321	2024-03-21	2024	1	3	Marzo	21	Jueves	4	f
20240322	2024-03-22	2024	1	3	Marzo	22	Viernes	5	f
20240323	2024-03-23	2024	1	3	Marzo	23	Sábado	6	t
20240324	2024-03-24	2024	1	3	Marzo	24	Domingo	7	t
20240325	2024-03-25	2024	1	3	Marzo	25	Lunes	1	f
20240326	2024-03-26	2024	1	3	Marzo	26	Martes	2	f
20240327	2024-03-27	2024	1	3	Marzo	27	Miércoles	3	f
20240328	2024-03-28	2024	1	3	Marzo	28	Jueves	4	f
20240329	2024-03-29	2024	1	3	Marzo	29	Viernes	5	f
20240330	2024-03-30	2024	1	3	Marzo	30	Sábado	6	t
20240331	2024-03-31	2024	1	3	Marzo	31	Domingo	7	t
20240401	2024-04-01	2024	2	4	Abril	1	Lunes	1	f
20240402	2024-04-02	2024	2	4	Abril	2	Martes	2	f
20240403	2024-04-03	2024	2	4	Abril	3	Miércoles	3	f
20240404	2024-04-04	2024	2	4	Abril	4	Jueves	4	f
20240405	2024-04-05	2024	2	4	Abril	5	Viernes	5	f
20240406	2024-04-06	2024	2	4	Abril	6	Sábado	6	t
20240407	2024-04-07	2024	2	4	Abril	7	Domingo	7	t
20240408	2024-04-08	2024	2	4	Abril	8	Lunes	1	f
20240409	2024-04-09	2024	2	4	Abril	9	Martes	2	f
20240410	2024-04-10	2024	2	4	Abril	10	Miércoles	3	f
20240411	2024-04-11	2024	2	4	Abril	11	Jueves	4	f
20240412	2024-04-12	2024	2	4	Abril	12	Viernes	5	f
20240413	2024-04-13	2024	2	4	Abril	13	Sábado	6	t
20240414	2024-04-14	2024	2	4	Abril	14	Domingo	7	t
20240415	2024-04-15	2024	2	4	Abril	15	Lunes	1	f
20240416	2024-04-16	2024	2	4	Abril	16	Martes	2	f
20240417	2024-04-17	2024	2	4	Abril	17	Miércoles	3	f
20240418	2024-04-18	2024	2	4	Abril	18	Jueves	4	f
20240419	2024-04-19	2024	2	4	Abril	19	Viernes	5	f
20240420	2024-04-20	2024	2	4	Abril	20	Sábado	6	t
20240421	2024-04-21	2024	2	4	Abril	21	Domingo	7	t
20240422	2024-04-22	2024	2	4	Abril	22	Lunes	1	f
20240423	2024-04-23	2024	2	4	Abril	23	Martes	2	f
20240424	2024-04-24	2024	2	4	Abril	24	Miércoles	3	f
20240425	2024-04-25	2024	2	4	Abril	25	Jueves	4	f
20240426	2024-04-26	2024	2	4	Abril	26	Viernes	5	f
20240427	2024-04-27	2024	2	4	Abril	27	Sábado	6	t
20240428	2024-04-28	2024	2	4	Abril	28	Domingo	7	t
20240429	2024-04-29	2024	2	4	Abril	29	Lunes	1	f
20240430	2024-04-30	2024	2	4	Abril	30	Martes	2	f
20240501	2024-05-01	2024	2	5	Mayo	1	Miércoles	3	f
20240502	2024-05-02	2024	2	5	Mayo	2	Jueves	4	f
20240503	2024-05-03	2024	2	5	Mayo	3	Viernes	5	f
20240504	2024-05-04	2024	2	5	Mayo	4	Sábado	6	t
20240505	2024-05-05	2024	2	5	Mayo	5	Domingo	7	t
20240506	2024-05-06	2024	2	5	Mayo	6	Lunes	1	f
20240507	2024-05-07	2024	2	5	Mayo	7	Martes	2	f
20240508	2024-05-08	2024	2	5	Mayo	8	Miércoles	3	f
20240509	2024-05-09	2024	2	5	Mayo	9	Jueves	4	f
20240510	2024-05-10	2024	2	5	Mayo	10	Viernes	5	f
20240511	2024-05-11	2024	2	5	Mayo	11	Sábado	6	t
20240512	2024-05-12	2024	2	5	Mayo	12	Domingo	7	t
20240513	2024-05-13	2024	2	5	Mayo	13	Lunes	1	f
20240514	2024-05-14	2024	2	5	Mayo	14	Martes	2	f
20240515	2024-05-15	2024	2	5	Mayo	15	Miércoles	3	f
20240516	2024-05-16	2024	2	5	Mayo	16	Jueves	4	f
20240517	2024-05-17	2024	2	5	Mayo	17	Viernes	5	f
20240518	2024-05-18	2024	2	5	Mayo	18	Sábado	6	t
20240519	2024-05-19	2024	2	5	Mayo	19	Domingo	7	t
20240520	2024-05-20	2024	2	5	Mayo	20	Lunes	1	f
20240521	2024-05-21	2024	2	5	Mayo	21	Martes	2	f
20240522	2024-05-22	2024	2	5	Mayo	22	Miércoles	3	f
20240523	2024-05-23	2024	2	5	Mayo	23	Jueves	4	f
20240524	2024-05-24	2024	2	5	Mayo	24	Viernes	5	f
20240525	2024-05-25	2024	2	5	Mayo	25	Sábado	6	t
20240526	2024-05-26	2024	2	5	Mayo	26	Domingo	7	t
20240527	2024-05-27	2024	2	5	Mayo	27	Lunes	1	f
20240528	2024-05-28	2024	2	5	Mayo	28	Martes	2	f
20240529	2024-05-29	2024	2	5	Mayo	29	Miércoles	3	f
20240530	2024-05-30	2024	2	5	Mayo	30	Jueves	4	f
20240531	2024-05-31	2024	2	5	Mayo	31	Viernes	5	f
20240601	2024-06-01	2024	2	6	Junio	1	Sábado	6	t
20240602	2024-06-02	2024	2	6	Junio	2	Domingo	7	t
20240603	2024-06-03	2024	2	6	Junio	3	Lunes	1	f
20240604	2024-06-04	2024	2	6	Junio	4	Martes	2	f
20240605	2024-06-05	2024	2	6	Junio	5	Miércoles	3	f
20240606	2024-06-06	2024	2	6	Junio	6	Jueves	4	f
20240607	2024-06-07	2024	2	6	Junio	7	Viernes	5	f
20240608	2024-06-08	2024	2	6	Junio	8	Sábado	6	t
20240609	2024-06-09	2024	2	6	Junio	9	Domingo	7	t
20240610	2024-06-10	2024	2	6	Junio	10	Lunes	1	f
20240611	2024-06-11	2024	2	6	Junio	11	Martes	2	f
20240612	2024-06-12	2024	2	6	Junio	12	Miércoles	3	f
20240613	2024-06-13	2024	2	6	Junio	13	Jueves	4	f
20240614	2024-06-14	2024	2	6	Junio	14	Viernes	5	f
20240615	2024-06-15	2024	2	6	Junio	15	Sábado	6	t
20240616	2024-06-16	2024	2	6	Junio	16	Domingo	7	t
20240617	2024-06-17	2024	2	6	Junio	17	Lunes	1	f
20240618	2024-06-18	2024	2	6	Junio	18	Martes	2	f
20240619	2024-06-19	2024	2	6	Junio	19	Miércoles	3	f
20240620	2024-06-20	2024	2	6	Junio	20	Jueves	4	f
20240621	2024-06-21	2024	2	6	Junio	21	Viernes	5	f
20240622	2024-06-22	2024	2	6	Junio	22	Sábado	6	t
20240623	2024-06-23	2024	2	6	Junio	23	Domingo	7	t
20240624	2024-06-24	2024	2	6	Junio	24	Lunes	1	f
20240625	2024-06-25	2024	2	6	Junio	25	Martes	2	f
20240626	2024-06-26	2024	2	6	Junio	26	Miércoles	3	f
20240627	2024-06-27	2024	2	6	Junio	27	Jueves	4	f
20240628	2024-06-28	2024	2	6	Junio	28	Viernes	5	f
20240629	2024-06-29	2024	2	6	Junio	29	Sábado	6	t
20240630	2024-06-30	2024	2	6	Junio	30	Domingo	7	t
20240701	2024-07-01	2024	3	7	Julio	1	Lunes	1	f
20240702	2024-07-02	2024	3	7	Julio	2	Martes	2	f
20240703	2024-07-03	2024	3	7	Julio	3	Miércoles	3	f
20240704	2024-07-04	2024	3	7	Julio	4	Jueves	4	f
20240705	2024-07-05	2024	3	7	Julio	5	Viernes	5	f
20240706	2024-07-06	2024	3	7	Julio	6	Sábado	6	t
20240707	2024-07-07	2024	3	7	Julio	7	Domingo	7	t
20240708	2024-07-08	2024	3	7	Julio	8	Lunes	1	f
20240709	2024-07-09	2024	3	7	Julio	9	Martes	2	f
20240710	2024-07-10	2024	3	7	Julio	10	Miércoles	3	f
20240711	2024-07-11	2024	3	7	Julio	11	Jueves	4	f
20240712	2024-07-12	2024	3	7	Julio	12	Viernes	5	f
20240713	2024-07-13	2024	3	7	Julio	13	Sábado	6	t
20240714	2024-07-14	2024	3	7	Julio	14	Domingo	7	t
20240715	2024-07-15	2024	3	7	Julio	15	Lunes	1	f
20240716	2024-07-16	2024	3	7	Julio	16	Martes	2	f
20240717	2024-07-17	2024	3	7	Julio	17	Miércoles	3	f
20240718	2024-07-18	2024	3	7	Julio	18	Jueves	4	f
20240719	2024-07-19	2024	3	7	Julio	19	Viernes	5	f
20240720	2024-07-20	2024	3	7	Julio	20	Sábado	6	t
20240721	2024-07-21	2024	3	7	Julio	21	Domingo	7	t
20240722	2024-07-22	2024	3	7	Julio	22	Lunes	1	f
20240723	2024-07-23	2024	3	7	Julio	23	Martes	2	f
20240724	2024-07-24	2024	3	7	Julio	24	Miércoles	3	f
20240725	2024-07-25	2024	3	7	Julio	25	Jueves	4	f
20240726	2024-07-26	2024	3	7	Julio	26	Viernes	5	f
20240727	2024-07-27	2024	3	7	Julio	27	Sábado	6	t
20240728	2024-07-28	2024	3	7	Julio	28	Domingo	7	t
20240729	2024-07-29	2024	3	7	Julio	29	Lunes	1	f
20240730	2024-07-30	2024	3	7	Julio	30	Martes	2	f
20240731	2024-07-31	2024	3	7	Julio	31	Miércoles	3	f
20240801	2024-08-01	2024	3	8	Agosto	1	Jueves	4	f
20240802	2024-08-02	2024	3	8	Agosto	2	Viernes	5	f
20240803	2024-08-03	2024	3	8	Agosto	3	Sábado	6	t
20240804	2024-08-04	2024	3	8	Agosto	4	Domingo	7	t
20240805	2024-08-05	2024	3	8	Agosto	5	Lunes	1	f
20240806	2024-08-06	2024	3	8	Agosto	6	Martes	2	f
20240807	2024-08-07	2024	3	8	Agosto	7	Miércoles	3	f
20240808	2024-08-08	2024	3	8	Agosto	8	Jueves	4	f
20240809	2024-08-09	2024	3	8	Agosto	9	Viernes	5	f
20240810	2024-08-10	2024	3	8	Agosto	10	Sábado	6	t
20240811	2024-08-11	2024	3	8	Agosto	11	Domingo	7	t
20240812	2024-08-12	2024	3	8	Agosto	12	Lunes	1	f
20240813	2024-08-13	2024	3	8	Agosto	13	Martes	2	f
20240814	2024-08-14	2024	3	8	Agosto	14	Miércoles	3	f
20240815	2024-08-15	2024	3	8	Agosto	15	Jueves	4	f
20240816	2024-08-16	2024	3	8	Agosto	16	Viernes	5	f
20240817	2024-08-17	2024	3	8	Agosto	17	Sábado	6	t
20240818	2024-08-18	2024	3	8	Agosto	18	Domingo	7	t
20240819	2024-08-19	2024	3	8	Agosto	19	Lunes	1	f
20240820	2024-08-20	2024	3	8	Agosto	20	Martes	2	f
20240821	2024-08-21	2024	3	8	Agosto	21	Miércoles	3	f
20240822	2024-08-22	2024	3	8	Agosto	22	Jueves	4	f
20240823	2024-08-23	2024	3	8	Agosto	23	Viernes	5	f
20240824	2024-08-24	2024	3	8	Agosto	24	Sábado	6	t
20240825	2024-08-25	2024	3	8	Agosto	25	Domingo	7	t
20240826	2024-08-26	2024	3	8	Agosto	26	Lunes	1	f
20240827	2024-08-27	2024	3	8	Agosto	27	Martes	2	f
20240828	2024-08-28	2024	3	8	Agosto	28	Miércoles	3	f
20240829	2024-08-29	2024	3	8	Agosto	29	Jueves	4	f
20240830	2024-08-30	2024	3	8	Agosto	30	Viernes	5	f
20240831	2024-08-31	2024	3	8	Agosto	31	Sábado	6	t
20240901	2024-09-01	2024	3	9	Septiembre	1	Domingo	7	t
20240902	2024-09-02	2024	3	9	Septiembre	2	Lunes	1	f
20240903	2024-09-03	2024	3	9	Septiembre	3	Martes	2	f
20240904	2024-09-04	2024	3	9	Septiembre	4	Miércoles	3	f
20240905	2024-09-05	2024	3	9	Septiembre	5	Jueves	4	f
20240906	2024-09-06	2024	3	9	Septiembre	6	Viernes	5	f
20240907	2024-09-07	2024	3	9	Septiembre	7	Sábado	6	t
20240908	2024-09-08	2024	3	9	Septiembre	8	Domingo	7	t
20240909	2024-09-09	2024	3	9	Septiembre	9	Lunes	1	f
20240910	2024-09-10	2024	3	9	Septiembre	10	Martes	2	f
20240911	2024-09-11	2024	3	9	Septiembre	11	Miércoles	3	f
20240912	2024-09-12	2024	3	9	Septiembre	12	Jueves	4	f
20240913	2024-09-13	2024	3	9	Septiembre	13	Viernes	5	f
20240914	2024-09-14	2024	3	9	Septiembre	14	Sábado	6	t
20240915	2024-09-15	2024	3	9	Septiembre	15	Domingo	7	t
20240916	2024-09-16	2024	3	9	Septiembre	16	Lunes	1	f
20240917	2024-09-17	2024	3	9	Septiembre	17	Martes	2	f
20240918	2024-09-18	2024	3	9	Septiembre	18	Miércoles	3	f
20240919	2024-09-19	2024	3	9	Septiembre	19	Jueves	4	f
20240920	2024-09-20	2024	3	9	Septiembre	20	Viernes	5	f
20240921	2024-09-21	2024	3	9	Septiembre	21	Sábado	6	t
20240922	2024-09-22	2024	3	9	Septiembre	22	Domingo	7	t
20240923	2024-09-23	2024	3	9	Septiembre	23	Lunes	1	f
20240924	2024-09-24	2024	3	9	Septiembre	24	Martes	2	f
20240925	2024-09-25	2024	3	9	Septiembre	25	Miércoles	3	f
20240926	2024-09-26	2024	3	9	Septiembre	26	Jueves	4	f
20240927	2024-09-27	2024	3	9	Septiembre	27	Viernes	5	f
20240928	2024-09-28	2024	3	9	Septiembre	28	Sábado	6	t
20240929	2024-09-29	2024	3	9	Septiembre	29	Domingo	7	t
20240930	2024-09-30	2024	3	9	Septiembre	30	Lunes	1	f
20241001	2024-10-01	2024	4	10	Octubre	1	Martes	2	f
20241002	2024-10-02	2024	4	10	Octubre	2	Miércoles	3	f
20241003	2024-10-03	2024	4	10	Octubre	3	Jueves	4	f
20241004	2024-10-04	2024	4	10	Octubre	4	Viernes	5	f
20241005	2024-10-05	2024	4	10	Octubre	5	Sábado	6	t
20241006	2024-10-06	2024	4	10	Octubre	6	Domingo	7	t
20241007	2024-10-07	2024	4	10	Octubre	7	Lunes	1	f
20241008	2024-10-08	2024	4	10	Octubre	8	Martes	2	f
20241009	2024-10-09	2024	4	10	Octubre	9	Miércoles	3	f
20241010	2024-10-10	2024	4	10	Octubre	10	Jueves	4	f
20241011	2024-10-11	2024	4	10	Octubre	11	Viernes	5	f
20241012	2024-10-12	2024	4	10	Octubre	12	Sábado	6	t
20241013	2024-10-13	2024	4	10	Octubre	13	Domingo	7	t
20241014	2024-10-14	2024	4	10	Octubre	14	Lunes	1	f
20241015	2024-10-15	2024	4	10	Octubre	15	Martes	2	f
20241016	2024-10-16	2024	4	10	Octubre	16	Miércoles	3	f
20241017	2024-10-17	2024	4	10	Octubre	17	Jueves	4	f
20241018	2024-10-18	2024	4	10	Octubre	18	Viernes	5	f
20241019	2024-10-19	2024	4	10	Octubre	19	Sábado	6	t
20241020	2024-10-20	2024	4	10	Octubre	20	Domingo	7	t
20241021	2024-10-21	2024	4	10	Octubre	21	Lunes	1	f
20241022	2024-10-22	2024	4	10	Octubre	22	Martes	2	f
20241023	2024-10-23	2024	4	10	Octubre	23	Miércoles	3	f
20241024	2024-10-24	2024	4	10	Octubre	24	Jueves	4	f
20241025	2024-10-25	2024	4	10	Octubre	25	Viernes	5	f
20241026	2024-10-26	2024	4	10	Octubre	26	Sábado	6	t
20241027	2024-10-27	2024	4	10	Octubre	27	Domingo	7	t
20241028	2024-10-28	2024	4	10	Octubre	28	Lunes	1	f
20241029	2024-10-29	2024	4	10	Octubre	29	Martes	2	f
20241030	2024-10-30	2024	4	10	Octubre	30	Miércoles	3	f
20241031	2024-10-31	2024	4	10	Octubre	31	Jueves	4	f
20241101	2024-11-01	2024	4	11	Noviembre	1	Viernes	5	f
20241102	2024-11-02	2024	4	11	Noviembre	2	Sábado	6	t
20241103	2024-11-03	2024	4	11	Noviembre	3	Domingo	7	t
20241104	2024-11-04	2024	4	11	Noviembre	4	Lunes	1	f
20241105	2024-11-05	2024	4	11	Noviembre	5	Martes	2	f
20241106	2024-11-06	2024	4	11	Noviembre	6	Miércoles	3	f
20241107	2024-11-07	2024	4	11	Noviembre	7	Jueves	4	f
20241108	2024-11-08	2024	4	11	Noviembre	8	Viernes	5	f
20241109	2024-11-09	2024	4	11	Noviembre	9	Sábado	6	t
20241110	2024-11-10	2024	4	11	Noviembre	10	Domingo	7	t
20241111	2024-11-11	2024	4	11	Noviembre	11	Lunes	1	f
20241112	2024-11-12	2024	4	11	Noviembre	12	Martes	2	f
20241113	2024-11-13	2024	4	11	Noviembre	13	Miércoles	3	f
20241114	2024-11-14	2024	4	11	Noviembre	14	Jueves	4	f
20241115	2024-11-15	2024	4	11	Noviembre	15	Viernes	5	f
20241116	2024-11-16	2024	4	11	Noviembre	16	Sábado	6	t
20241117	2024-11-17	2024	4	11	Noviembre	17	Domingo	7	t
20241118	2024-11-18	2024	4	11	Noviembre	18	Lunes	1	f
20241119	2024-11-19	2024	4	11	Noviembre	19	Martes	2	f
20241120	2024-11-20	2024	4	11	Noviembre	20	Miércoles	3	f
20241121	2024-11-21	2024	4	11	Noviembre	21	Jueves	4	f
20241122	2024-11-22	2024	4	11	Noviembre	22	Viernes	5	f
20241123	2024-11-23	2024	4	11	Noviembre	23	Sábado	6	t
20241124	2024-11-24	2024	4	11	Noviembre	24	Domingo	7	t
20241125	2024-11-25	2024	4	11	Noviembre	25	Lunes	1	f
20241126	2024-11-26	2024	4	11	Noviembre	26	Martes	2	f
20241127	2024-11-27	2024	4	11	Noviembre	27	Miércoles	3	f
20241128	2024-11-28	2024	4	11	Noviembre	28	Jueves	4	f
20241129	2024-11-29	2024	4	11	Noviembre	29	Viernes	5	f
20241130	2024-11-30	2024	4	11	Noviembre	30	Sábado	6	t
20241201	2024-12-01	2024	4	12	Diciembre	1	Domingo	7	t
20241202	2024-12-02	2024	4	12	Diciembre	2	Lunes	1	f
20241203	2024-12-03	2024	4	12	Diciembre	3	Martes	2	f
20241204	2024-12-04	2024	4	12	Diciembre	4	Miércoles	3	f
20241205	2024-12-05	2024	4	12	Diciembre	5	Jueves	4	f
20241206	2024-12-06	2024	4	12	Diciembre	6	Viernes	5	f
20241207	2024-12-07	2024	4	12	Diciembre	7	Sábado	6	t
20241208	2024-12-08	2024	4	12	Diciembre	8	Domingo	7	t
20241209	2024-12-09	2024	4	12	Diciembre	9	Lunes	1	f
20241210	2024-12-10	2024	4	12	Diciembre	10	Martes	2	f
20241211	2024-12-11	2024	4	12	Diciembre	11	Miércoles	3	f
20241212	2024-12-12	2024	4	12	Diciembre	12	Jueves	4	f
20241213	2024-12-13	2024	4	12	Diciembre	13	Viernes	5	f
20241214	2024-12-14	2024	4	12	Diciembre	14	Sábado	6	t
20241215	2024-12-15	2024	4	12	Diciembre	15	Domingo	7	t
20241216	2024-12-16	2024	4	12	Diciembre	16	Lunes	1	f
20241217	2024-12-17	2024	4	12	Diciembre	17	Martes	2	f
20241218	2024-12-18	2024	4	12	Diciembre	18	Miércoles	3	f
20241219	2024-12-19	2024	4	12	Diciembre	19	Jueves	4	f
20241220	2024-12-20	2024	4	12	Diciembre	20	Viernes	5	f
20241221	2024-12-21	2024	4	12	Diciembre	21	Sábado	6	t
20241222	2024-12-22	2024	4	12	Diciembre	22	Domingo	7	t
20241223	2024-12-23	2024	4	12	Diciembre	23	Lunes	1	f
20241224	2024-12-24	2024	4	12	Diciembre	24	Martes	2	f
20241225	2024-12-25	2024	4	12	Diciembre	25	Miércoles	3	f
20241226	2024-12-26	2024	4	12	Diciembre	26	Jueves	4	f
20241227	2024-12-27	2024	4	12	Diciembre	27	Viernes	5	f
20241228	2024-12-28	2024	4	12	Diciembre	28	Sábado	6	t
20241229	2024-12-29	2024	4	12	Diciembre	29	Domingo	7	t
20241230	2024-12-30	2024	4	12	Diciembre	30	Lunes	1	f
20241231	2024-12-31	2024	4	12	Diciembre	31	Martes	2	f
20250101	2025-01-01	2025	1	1	Enero	1	Miércoles	3	f
20250102	2025-01-02	2025	1	1	Enero	2	Jueves	4	f
20250103	2025-01-03	2025	1	1	Enero	3	Viernes	5	f
20250104	2025-01-04	2025	1	1	Enero	4	Sábado	6	t
20250105	2025-01-05	2025	1	1	Enero	5	Domingo	7	t
20250106	2025-01-06	2025	1	1	Enero	6	Lunes	1	f
20250107	2025-01-07	2025	1	1	Enero	7	Martes	2	f
20250108	2025-01-08	2025	1	1	Enero	8	Miércoles	3	f
20250109	2025-01-09	2025	1	1	Enero	9	Jueves	4	f
20250110	2025-01-10	2025	1	1	Enero	10	Viernes	5	f
20250111	2025-01-11	2025	1	1	Enero	11	Sábado	6	t
20250112	2025-01-12	2025	1	1	Enero	12	Domingo	7	t
20250113	2025-01-13	2025	1	1	Enero	13	Lunes	1	f
20250114	2025-01-14	2025	1	1	Enero	14	Martes	2	f
20250115	2025-01-15	2025	1	1	Enero	15	Miércoles	3	f
20250116	2025-01-16	2025	1	1	Enero	16	Jueves	4	f
20250117	2025-01-17	2025	1	1	Enero	17	Viernes	5	f
20250118	2025-01-18	2025	1	1	Enero	18	Sábado	6	t
20250119	2025-01-19	2025	1	1	Enero	19	Domingo	7	t
20250120	2025-01-20	2025	1	1	Enero	20	Lunes	1	f
20250121	2025-01-21	2025	1	1	Enero	21	Martes	2	f
20250122	2025-01-22	2025	1	1	Enero	22	Miércoles	3	f
20250123	2025-01-23	2025	1	1	Enero	23	Jueves	4	f
20250124	2025-01-24	2025	1	1	Enero	24	Viernes	5	f
20250125	2025-01-25	2025	1	1	Enero	25	Sábado	6	t
20250126	2025-01-26	2025	1	1	Enero	26	Domingo	7	t
20250127	2025-01-27	2025	1	1	Enero	27	Lunes	1	f
20250128	2025-01-28	2025	1	1	Enero	28	Martes	2	f
20250129	2025-01-29	2025	1	1	Enero	29	Miércoles	3	f
20250130	2025-01-30	2025	1	1	Enero	30	Jueves	4	f
20250131	2025-01-31	2025	1	1	Enero	31	Viernes	5	f
20250201	2025-02-01	2025	1	2	Febrero	1	Sábado	6	t
20250202	2025-02-02	2025	1	2	Febrero	2	Domingo	7	t
20250203	2025-02-03	2025	1	2	Febrero	3	Lunes	1	f
20250204	2025-02-04	2025	1	2	Febrero	4	Martes	2	f
20250205	2025-02-05	2025	1	2	Febrero	5	Miércoles	3	f
20250206	2025-02-06	2025	1	2	Febrero	6	Jueves	4	f
20250207	2025-02-07	2025	1	2	Febrero	7	Viernes	5	f
20250208	2025-02-08	2025	1	2	Febrero	8	Sábado	6	t
20250209	2025-02-09	2025	1	2	Febrero	9	Domingo	7	t
20250210	2025-02-10	2025	1	2	Febrero	10	Lunes	1	f
20250211	2025-02-11	2025	1	2	Febrero	11	Martes	2	f
20250212	2025-02-12	2025	1	2	Febrero	12	Miércoles	3	f
20250213	2025-02-13	2025	1	2	Febrero	13	Jueves	4	f
20250214	2025-02-14	2025	1	2	Febrero	14	Viernes	5	f
20250215	2025-02-15	2025	1	2	Febrero	15	Sábado	6	t
20250216	2025-02-16	2025	1	2	Febrero	16	Domingo	7	t
20250217	2025-02-17	2025	1	2	Febrero	17	Lunes	1	f
20250218	2025-02-18	2025	1	2	Febrero	18	Martes	2	f
20250219	2025-02-19	2025	1	2	Febrero	19	Miércoles	3	f
20250220	2025-02-20	2025	1	2	Febrero	20	Jueves	4	f
20250221	2025-02-21	2025	1	2	Febrero	21	Viernes	5	f
20250222	2025-02-22	2025	1	2	Febrero	22	Sábado	6	t
20250223	2025-02-23	2025	1	2	Febrero	23	Domingo	7	t
20250224	2025-02-24	2025	1	2	Febrero	24	Lunes	1	f
20250225	2025-02-25	2025	1	2	Febrero	25	Martes	2	f
20250226	2025-02-26	2025	1	2	Febrero	26	Miércoles	3	f
20250227	2025-02-27	2025	1	2	Febrero	27	Jueves	4	f
20250228	2025-02-28	2025	1	2	Febrero	28	Viernes	5	f
20250301	2025-03-01	2025	1	3	Marzo	1	Sábado	6	t
20250302	2025-03-02	2025	1	3	Marzo	2	Domingo	7	t
20250303	2025-03-03	2025	1	3	Marzo	3	Lunes	1	f
20250304	2025-03-04	2025	1	3	Marzo	4	Martes	2	f
20250305	2025-03-05	2025	1	3	Marzo	5	Miércoles	3	f
20250306	2025-03-06	2025	1	3	Marzo	6	Jueves	4	f
20250307	2025-03-07	2025	1	3	Marzo	7	Viernes	5	f
20250308	2025-03-08	2025	1	3	Marzo	8	Sábado	6	t
20250309	2025-03-09	2025	1	3	Marzo	9	Domingo	7	t
20250310	2025-03-10	2025	1	3	Marzo	10	Lunes	1	f
20250311	2025-03-11	2025	1	3	Marzo	11	Martes	2	f
20250312	2025-03-12	2025	1	3	Marzo	12	Miércoles	3	f
20250313	2025-03-13	2025	1	3	Marzo	13	Jueves	4	f
20250314	2025-03-14	2025	1	3	Marzo	14	Viernes	5	f
20250315	2025-03-15	2025	1	3	Marzo	15	Sábado	6	t
20250316	2025-03-16	2025	1	3	Marzo	16	Domingo	7	t
20250317	2025-03-17	2025	1	3	Marzo	17	Lunes	1	f
20250318	2025-03-18	2025	1	3	Marzo	18	Martes	2	f
20250319	2025-03-19	2025	1	3	Marzo	19	Miércoles	3	f
20250320	2025-03-20	2025	1	3	Marzo	20	Jueves	4	f
20250321	2025-03-21	2025	1	3	Marzo	21	Viernes	5	f
20250322	2025-03-22	2025	1	3	Marzo	22	Sábado	6	t
20250323	2025-03-23	2025	1	3	Marzo	23	Domingo	7	t
20250324	2025-03-24	2025	1	3	Marzo	24	Lunes	1	f
20250325	2025-03-25	2025	1	3	Marzo	25	Martes	2	f
20250326	2025-03-26	2025	1	3	Marzo	26	Miércoles	3	f
20250327	2025-03-27	2025	1	3	Marzo	27	Jueves	4	f
20250328	2025-03-28	2025	1	3	Marzo	28	Viernes	5	f
20250329	2025-03-29	2025	1	3	Marzo	29	Sábado	6	t
20250330	2025-03-30	2025	1	3	Marzo	30	Domingo	7	t
20250331	2025-03-31	2025	1	3	Marzo	31	Lunes	1	f
20250401	2025-04-01	2025	2	4	Abril	1	Martes	2	f
20250402	2025-04-02	2025	2	4	Abril	2	Miércoles	3	f
20250403	2025-04-03	2025	2	4	Abril	3	Jueves	4	f
20250404	2025-04-04	2025	2	4	Abril	4	Viernes	5	f
20250405	2025-04-05	2025	2	4	Abril	5	Sábado	6	t
20250406	2025-04-06	2025	2	4	Abril	6	Domingo	7	t
20250407	2025-04-07	2025	2	4	Abril	7	Lunes	1	f
20250408	2025-04-08	2025	2	4	Abril	8	Martes	2	f
20250409	2025-04-09	2025	2	4	Abril	9	Miércoles	3	f
20250410	2025-04-10	2025	2	4	Abril	10	Jueves	4	f
20250411	2025-04-11	2025	2	4	Abril	11	Viernes	5	f
20250412	2025-04-12	2025	2	4	Abril	12	Sábado	6	t
20250413	2025-04-13	2025	2	4	Abril	13	Domingo	7	t
20250414	2025-04-14	2025	2	4	Abril	14	Lunes	1	f
20250415	2025-04-15	2025	2	4	Abril	15	Martes	2	f
20250416	2025-04-16	2025	2	4	Abril	16	Miércoles	3	f
20250417	2025-04-17	2025	2	4	Abril	17	Jueves	4	f
20250418	2025-04-18	2025	2	4	Abril	18	Viernes	5	f
20250419	2025-04-19	2025	2	4	Abril	19	Sábado	6	t
20250420	2025-04-20	2025	2	4	Abril	20	Domingo	7	t
20250421	2025-04-21	2025	2	4	Abril	21	Lunes	1	f
20250422	2025-04-22	2025	2	4	Abril	22	Martes	2	f
20250423	2025-04-23	2025	2	4	Abril	23	Miércoles	3	f
20250424	2025-04-24	2025	2	4	Abril	24	Jueves	4	f
20250425	2025-04-25	2025	2	4	Abril	25	Viernes	5	f
20250426	2025-04-26	2025	2	4	Abril	26	Sábado	6	t
20250427	2025-04-27	2025	2	4	Abril	27	Domingo	7	t
20250428	2025-04-28	2025	2	4	Abril	28	Lunes	1	f
20250429	2025-04-29	2025	2	4	Abril	29	Martes	2	f
20250430	2025-04-30	2025	2	4	Abril	30	Miércoles	3	f
20250501	2025-05-01	2025	2	5	Mayo	1	Jueves	4	f
20250502	2025-05-02	2025	2	5	Mayo	2	Viernes	5	f
20250503	2025-05-03	2025	2	5	Mayo	3	Sábado	6	t
20250504	2025-05-04	2025	2	5	Mayo	4	Domingo	7	t
20250505	2025-05-05	2025	2	5	Mayo	5	Lunes	1	f
20250506	2025-05-06	2025	2	5	Mayo	6	Martes	2	f
20250507	2025-05-07	2025	2	5	Mayo	7	Miércoles	3	f
20250508	2025-05-08	2025	2	5	Mayo	8	Jueves	4	f
20250509	2025-05-09	2025	2	5	Mayo	9	Viernes	5	f
20250510	2025-05-10	2025	2	5	Mayo	10	Sábado	6	t
20250511	2025-05-11	2025	2	5	Mayo	11	Domingo	7	t
20250512	2025-05-12	2025	2	5	Mayo	12	Lunes	1	f
20250513	2025-05-13	2025	2	5	Mayo	13	Martes	2	f
20250514	2025-05-14	2025	2	5	Mayo	14	Miércoles	3	f
20250515	2025-05-15	2025	2	5	Mayo	15	Jueves	4	f
20250516	2025-05-16	2025	2	5	Mayo	16	Viernes	5	f
20250517	2025-05-17	2025	2	5	Mayo	17	Sábado	6	t
20250518	2025-05-18	2025	2	5	Mayo	18	Domingo	7	t
20250519	2025-05-19	2025	2	5	Mayo	19	Lunes	1	f
20250520	2025-05-20	2025	2	5	Mayo	20	Martes	2	f
20250521	2025-05-21	2025	2	5	Mayo	21	Miércoles	3	f
20250522	2025-05-22	2025	2	5	Mayo	22	Jueves	4	f
20250523	2025-05-23	2025	2	5	Mayo	23	Viernes	5	f
20250524	2025-05-24	2025	2	5	Mayo	24	Sábado	6	t
20250525	2025-05-25	2025	2	5	Mayo	25	Domingo	7	t
20250526	2025-05-26	2025	2	5	Mayo	26	Lunes	1	f
20250527	2025-05-27	2025	2	5	Mayo	27	Martes	2	f
20250528	2025-05-28	2025	2	5	Mayo	28	Miércoles	3	f
20250529	2025-05-29	2025	2	5	Mayo	29	Jueves	4	f
20250530	2025-05-30	2025	2	5	Mayo	30	Viernes	5	f
20250531	2025-05-31	2025	2	5	Mayo	31	Sábado	6	t
20250601	2025-06-01	2025	2	6	Junio	1	Domingo	7	t
20250602	2025-06-02	2025	2	6	Junio	2	Lunes	1	f
20250603	2025-06-03	2025	2	6	Junio	3	Martes	2	f
20250604	2025-06-04	2025	2	6	Junio	4	Miércoles	3	f
20250605	2025-06-05	2025	2	6	Junio	5	Jueves	4	f
20250606	2025-06-06	2025	2	6	Junio	6	Viernes	5	f
20250607	2025-06-07	2025	2	6	Junio	7	Sábado	6	t
20250608	2025-06-08	2025	2	6	Junio	8	Domingo	7	t
20250609	2025-06-09	2025	2	6	Junio	9	Lunes	1	f
20250610	2025-06-10	2025	2	6	Junio	10	Martes	2	f
20250611	2025-06-11	2025	2	6	Junio	11	Miércoles	3	f
20250612	2025-06-12	2025	2	6	Junio	12	Jueves	4	f
20250613	2025-06-13	2025	2	6	Junio	13	Viernes	5	f
20250614	2025-06-14	2025	2	6	Junio	14	Sábado	6	t
20250615	2025-06-15	2025	2	6	Junio	15	Domingo	7	t
20250616	2025-06-16	2025	2	6	Junio	16	Lunes	1	f
20250617	2025-06-17	2025	2	6	Junio	17	Martes	2	f
20250618	2025-06-18	2025	2	6	Junio	18	Miércoles	3	f
20250619	2025-06-19	2025	2	6	Junio	19	Jueves	4	f
20250620	2025-06-20	2025	2	6	Junio	20	Viernes	5	f
20250621	2025-06-21	2025	2	6	Junio	21	Sábado	6	t
20250622	2025-06-22	2025	2	6	Junio	22	Domingo	7	t
20250623	2025-06-23	2025	2	6	Junio	23	Lunes	1	f
20250624	2025-06-24	2025	2	6	Junio	24	Martes	2	f
20250625	2025-06-25	2025	2	6	Junio	25	Miércoles	3	f
20250626	2025-06-26	2025	2	6	Junio	26	Jueves	4	f
20250627	2025-06-27	2025	2	6	Junio	27	Viernes	5	f
20250628	2025-06-28	2025	2	6	Junio	28	Sábado	6	t
20250629	2025-06-29	2025	2	6	Junio	29	Domingo	7	t
20250630	2025-06-30	2025	2	6	Junio	30	Lunes	1	f
20250701	2025-07-01	2025	3	7	Julio	1	Martes	2	f
20250702	2025-07-02	2025	3	7	Julio	2	Miércoles	3	f
20250703	2025-07-03	2025	3	7	Julio	3	Jueves	4	f
20250704	2025-07-04	2025	3	7	Julio	4	Viernes	5	f
20250705	2025-07-05	2025	3	7	Julio	5	Sábado	6	t
20250706	2025-07-06	2025	3	7	Julio	6	Domingo	7	t
20250707	2025-07-07	2025	3	7	Julio	7	Lunes	1	f
20250708	2025-07-08	2025	3	7	Julio	8	Martes	2	f
20250709	2025-07-09	2025	3	7	Julio	9	Miércoles	3	f
20250710	2025-07-10	2025	3	7	Julio	10	Jueves	4	f
20250711	2025-07-11	2025	3	7	Julio	11	Viernes	5	f
20250712	2025-07-12	2025	3	7	Julio	12	Sábado	6	t
20250713	2025-07-13	2025	3	7	Julio	13	Domingo	7	t
20250714	2025-07-14	2025	3	7	Julio	14	Lunes	1	f
20250715	2025-07-15	2025	3	7	Julio	15	Martes	2	f
20250716	2025-07-16	2025	3	7	Julio	16	Miércoles	3	f
20250717	2025-07-17	2025	3	7	Julio	17	Jueves	4	f
20250718	2025-07-18	2025	3	7	Julio	18	Viernes	5	f
20250719	2025-07-19	2025	3	7	Julio	19	Sábado	6	t
20250720	2025-07-20	2025	3	7	Julio	20	Domingo	7	t
20250721	2025-07-21	2025	3	7	Julio	21	Lunes	1	f
20250722	2025-07-22	2025	3	7	Julio	22	Martes	2	f
20250723	2025-07-23	2025	3	7	Julio	23	Miércoles	3	f
20250724	2025-07-24	2025	3	7	Julio	24	Jueves	4	f
20250725	2025-07-25	2025	3	7	Julio	25	Viernes	5	f
20250726	2025-07-26	2025	3	7	Julio	26	Sábado	6	t
20250727	2025-07-27	2025	3	7	Julio	27	Domingo	7	t
20250728	2025-07-28	2025	3	7	Julio	28	Lunes	1	f
20250729	2025-07-29	2025	3	7	Julio	29	Martes	2	f
20250730	2025-07-30	2025	3	7	Julio	30	Miércoles	3	f
20250731	2025-07-31	2025	3	7	Julio	31	Jueves	4	f
20250801	2025-08-01	2025	3	8	Agosto	1	Viernes	5	f
20250802	2025-08-02	2025	3	8	Agosto	2	Sábado	6	t
20250803	2025-08-03	2025	3	8	Agosto	3	Domingo	7	t
20250804	2025-08-04	2025	3	8	Agosto	4	Lunes	1	f
20250805	2025-08-05	2025	3	8	Agosto	5	Martes	2	f
20250806	2025-08-06	2025	3	8	Agosto	6	Miércoles	3	f
20250807	2025-08-07	2025	3	8	Agosto	7	Jueves	4	f
20250808	2025-08-08	2025	3	8	Agosto	8	Viernes	5	f
20250809	2025-08-09	2025	3	8	Agosto	9	Sábado	6	t
20250810	2025-08-10	2025	3	8	Agosto	10	Domingo	7	t
20250811	2025-08-11	2025	3	8	Agosto	11	Lunes	1	f
20250812	2025-08-12	2025	3	8	Agosto	12	Martes	2	f
20250813	2025-08-13	2025	3	8	Agosto	13	Miércoles	3	f
20250814	2025-08-14	2025	3	8	Agosto	14	Jueves	4	f
20250815	2025-08-15	2025	3	8	Agosto	15	Viernes	5	f
20250816	2025-08-16	2025	3	8	Agosto	16	Sábado	6	t
20250817	2025-08-17	2025	3	8	Agosto	17	Domingo	7	t
20250818	2025-08-18	2025	3	8	Agosto	18	Lunes	1	f
20250819	2025-08-19	2025	3	8	Agosto	19	Martes	2	f
20250820	2025-08-20	2025	3	8	Agosto	20	Miércoles	3	f
20250821	2025-08-21	2025	3	8	Agosto	21	Jueves	4	f
20250822	2025-08-22	2025	3	8	Agosto	22	Viernes	5	f
20250823	2025-08-23	2025	3	8	Agosto	23	Sábado	6	t
20250824	2025-08-24	2025	3	8	Agosto	24	Domingo	7	t
20250825	2025-08-25	2025	3	8	Agosto	25	Lunes	1	f
20250826	2025-08-26	2025	3	8	Agosto	26	Martes	2	f
20250827	2025-08-27	2025	3	8	Agosto	27	Miércoles	3	f
20250828	2025-08-28	2025	3	8	Agosto	28	Jueves	4	f
20250829	2025-08-29	2025	3	8	Agosto	29	Viernes	5	f
20250830	2025-08-30	2025	3	8	Agosto	30	Sábado	6	t
20250831	2025-08-31	2025	3	8	Agosto	31	Domingo	7	t
20250901	2025-09-01	2025	3	9	Septiembre	1	Lunes	1	f
20250902	2025-09-02	2025	3	9	Septiembre	2	Martes	2	f
20250903	2025-09-03	2025	3	9	Septiembre	3	Miércoles	3	f
20250904	2025-09-04	2025	3	9	Septiembre	4	Jueves	4	f
20250905	2025-09-05	2025	3	9	Septiembre	5	Viernes	5	f
20250906	2025-09-06	2025	3	9	Septiembre	6	Sábado	6	t
20250907	2025-09-07	2025	3	9	Septiembre	7	Domingo	7	t
20250908	2025-09-08	2025	3	9	Septiembre	8	Lunes	1	f
20250909	2025-09-09	2025	3	9	Septiembre	9	Martes	2	f
20250910	2025-09-10	2025	3	9	Septiembre	10	Miércoles	3	f
20250911	2025-09-11	2025	3	9	Septiembre	11	Jueves	4	f
20250912	2025-09-12	2025	3	9	Septiembre	12	Viernes	5	f
20250913	2025-09-13	2025	3	9	Septiembre	13	Sábado	6	t
20250914	2025-09-14	2025	3	9	Septiembre	14	Domingo	7	t
20250915	2025-09-15	2025	3	9	Septiembre	15	Lunes	1	f
20250916	2025-09-16	2025	3	9	Septiembre	16	Martes	2	f
20250917	2025-09-17	2025	3	9	Septiembre	17	Miércoles	3	f
20250918	2025-09-18	2025	3	9	Septiembre	18	Jueves	4	f
20250919	2025-09-19	2025	3	9	Septiembre	19	Viernes	5	f
20250920	2025-09-20	2025	3	9	Septiembre	20	Sábado	6	t
20250921	2025-09-21	2025	3	9	Septiembre	21	Domingo	7	t
20250922	2025-09-22	2025	3	9	Septiembre	22	Lunes	1	f
20250923	2025-09-23	2025	3	9	Septiembre	23	Martes	2	f
20250924	2025-09-24	2025	3	9	Septiembre	24	Miércoles	3	f
20250925	2025-09-25	2025	3	9	Septiembre	25	Jueves	4	f
20250926	2025-09-26	2025	3	9	Septiembre	26	Viernes	5	f
20250927	2025-09-27	2025	3	9	Septiembre	27	Sábado	6	t
20250928	2025-09-28	2025	3	9	Septiembre	28	Domingo	7	t
20250929	2025-09-29	2025	3	9	Septiembre	29	Lunes	1	f
20250930	2025-09-30	2025	3	9	Septiembre	30	Martes	2	f
20251001	2025-10-01	2025	4	10	Octubre	1	Miércoles	3	f
20251002	2025-10-02	2025	4	10	Octubre	2	Jueves	4	f
20251003	2025-10-03	2025	4	10	Octubre	3	Viernes	5	f
20251004	2025-10-04	2025	4	10	Octubre	4	Sábado	6	t
20251005	2025-10-05	2025	4	10	Octubre	5	Domingo	7	t
20251006	2025-10-06	2025	4	10	Octubre	6	Lunes	1	f
20251007	2025-10-07	2025	4	10	Octubre	7	Martes	2	f
20251008	2025-10-08	2025	4	10	Octubre	8	Miércoles	3	f
20251009	2025-10-09	2025	4	10	Octubre	9	Jueves	4	f
20251010	2025-10-10	2025	4	10	Octubre	10	Viernes	5	f
20251011	2025-10-11	2025	4	10	Octubre	11	Sábado	6	t
20251012	2025-10-12	2025	4	10	Octubre	12	Domingo	7	t
20251013	2025-10-13	2025	4	10	Octubre	13	Lunes	1	f
20251014	2025-10-14	2025	4	10	Octubre	14	Martes	2	f
20251015	2025-10-15	2025	4	10	Octubre	15	Miércoles	3	f
20251016	2025-10-16	2025	4	10	Octubre	16	Jueves	4	f
20251017	2025-10-17	2025	4	10	Octubre	17	Viernes	5	f
20251018	2025-10-18	2025	4	10	Octubre	18	Sábado	6	t
20251019	2025-10-19	2025	4	10	Octubre	19	Domingo	7	t
20251020	2025-10-20	2025	4	10	Octubre	20	Lunes	1	f
20251021	2025-10-21	2025	4	10	Octubre	21	Martes	2	f
20251022	2025-10-22	2025	4	10	Octubre	22	Miércoles	3	f
20251023	2025-10-23	2025	4	10	Octubre	23	Jueves	4	f
20251024	2025-10-24	2025	4	10	Octubre	24	Viernes	5	f
20251025	2025-10-25	2025	4	10	Octubre	25	Sábado	6	t
20251026	2025-10-26	2025	4	10	Octubre	26	Domingo	7	t
20251027	2025-10-27	2025	4	10	Octubre	27	Lunes	1	f
20251028	2025-10-28	2025	4	10	Octubre	28	Martes	2	f
20251029	2025-10-29	2025	4	10	Octubre	29	Miércoles	3	f
20251030	2025-10-30	2025	4	10	Octubre	30	Jueves	4	f
20251031	2025-10-31	2025	4	10	Octubre	31	Viernes	5	f
20251101	2025-11-01	2025	4	11	Noviembre	1	Sábado	6	t
20251102	2025-11-02	2025	4	11	Noviembre	2	Domingo	7	t
20251103	2025-11-03	2025	4	11	Noviembre	3	Lunes	1	f
20251104	2025-11-04	2025	4	11	Noviembre	4	Martes	2	f
20251105	2025-11-05	2025	4	11	Noviembre	5	Miércoles	3	f
20251106	2025-11-06	2025	4	11	Noviembre	6	Jueves	4	f
20251107	2025-11-07	2025	4	11	Noviembre	7	Viernes	5	f
20251108	2025-11-08	2025	4	11	Noviembre	8	Sábado	6	t
20251109	2025-11-09	2025	4	11	Noviembre	9	Domingo	7	t
20251110	2025-11-10	2025	4	11	Noviembre	10	Lunes	1	f
20251111	2025-11-11	2025	4	11	Noviembre	11	Martes	2	f
20251112	2025-11-12	2025	4	11	Noviembre	12	Miércoles	3	f
20251113	2025-11-13	2025	4	11	Noviembre	13	Jueves	4	f
20251114	2025-11-14	2025	4	11	Noviembre	14	Viernes	5	f
20251115	2025-11-15	2025	4	11	Noviembre	15	Sábado	6	t
20251116	2025-11-16	2025	4	11	Noviembre	16	Domingo	7	t
20251117	2025-11-17	2025	4	11	Noviembre	17	Lunes	1	f
20251118	2025-11-18	2025	4	11	Noviembre	18	Martes	2	f
20251119	2025-11-19	2025	4	11	Noviembre	19	Miércoles	3	f
20251120	2025-11-20	2025	4	11	Noviembre	20	Jueves	4	f
20251121	2025-11-21	2025	4	11	Noviembre	21	Viernes	5	f
20251122	2025-11-22	2025	4	11	Noviembre	22	Sábado	6	t
20251123	2025-11-23	2025	4	11	Noviembre	23	Domingo	7	t
20251124	2025-11-24	2025	4	11	Noviembre	24	Lunes	1	f
20251125	2025-11-25	2025	4	11	Noviembre	25	Martes	2	f
20251126	2025-11-26	2025	4	11	Noviembre	26	Miércoles	3	f
20251127	2025-11-27	2025	4	11	Noviembre	27	Jueves	4	f
20251128	2025-11-28	2025	4	11	Noviembre	28	Viernes	5	f
20251129	2025-11-29	2025	4	11	Noviembre	29	Sábado	6	t
20251130	2025-11-30	2025	4	11	Noviembre	30	Domingo	7	t
20251201	2025-12-01	2025	4	12	Diciembre	1	Lunes	1	f
20251202	2025-12-02	2025	4	12	Diciembre	2	Martes	2	f
20251203	2025-12-03	2025	4	12	Diciembre	3	Miércoles	3	f
20251204	2025-12-04	2025	4	12	Diciembre	4	Jueves	4	f
20251205	2025-12-05	2025	4	12	Diciembre	5	Viernes	5	f
20251206	2025-12-06	2025	4	12	Diciembre	6	Sábado	6	t
20251207	2025-12-07	2025	4	12	Diciembre	7	Domingo	7	t
20251208	2025-12-08	2025	4	12	Diciembre	8	Lunes	1	f
20251209	2025-12-09	2025	4	12	Diciembre	9	Martes	2	f
20251210	2025-12-10	2025	4	12	Diciembre	10	Miércoles	3	f
20251211	2025-12-11	2025	4	12	Diciembre	11	Jueves	4	f
20251212	2025-12-12	2025	4	12	Diciembre	12	Viernes	5	f
20251213	2025-12-13	2025	4	12	Diciembre	13	Sábado	6	t
20251214	2025-12-14	2025	4	12	Diciembre	14	Domingo	7	t
20251215	2025-12-15	2025	4	12	Diciembre	15	Lunes	1	f
20251216	2025-12-16	2025	4	12	Diciembre	16	Martes	2	f
20251217	2025-12-17	2025	4	12	Diciembre	17	Miércoles	3	f
20251218	2025-12-18	2025	4	12	Diciembre	18	Jueves	4	f
20251219	2025-12-19	2025	4	12	Diciembre	19	Viernes	5	f
20251220	2025-12-20	2025	4	12	Diciembre	20	Sábado	6	t
20251221	2025-12-21	2025	4	12	Diciembre	21	Domingo	7	t
20251222	2025-12-22	2025	4	12	Diciembre	22	Lunes	1	f
20251223	2025-12-23	2025	4	12	Diciembre	23	Martes	2	f
20251224	2025-12-24	2025	4	12	Diciembre	24	Miércoles	3	f
20251225	2025-12-25	2025	4	12	Diciembre	25	Jueves	4	f
20251226	2025-12-26	2025	4	12	Diciembre	26	Viernes	5	f
20251227	2025-12-27	2025	4	12	Diciembre	27	Sábado	6	t
20251228	2025-12-28	2025	4	12	Diciembre	28	Domingo	7	t
20251229	2025-12-29	2025	4	12	Diciembre	29	Lunes	1	f
20251230	2025-12-30	2025	4	12	Diciembre	30	Martes	2	f
20251231	2025-12-31	2025	4	12	Diciembre	31	Miércoles	3	f
20260101	2026-01-01	2026	1	1	Enero	1	Jueves	4	f
20260102	2026-01-02	2026	1	1	Enero	2	Viernes	5	f
20260103	2026-01-03	2026	1	1	Enero	3	Sábado	6	t
20260104	2026-01-04	2026	1	1	Enero	4	Domingo	7	t
20260105	2026-01-05	2026	1	1	Enero	5	Lunes	1	f
20260106	2026-01-06	2026	1	1	Enero	6	Martes	2	f
20260107	2026-01-07	2026	1	1	Enero	7	Miércoles	3	f
20260108	2026-01-08	2026	1	1	Enero	8	Jueves	4	f
20260109	2026-01-09	2026	1	1	Enero	9	Viernes	5	f
20260110	2026-01-10	2026	1	1	Enero	10	Sábado	6	t
20260111	2026-01-11	2026	1	1	Enero	11	Domingo	7	t
20260112	2026-01-12	2026	1	1	Enero	12	Lunes	1	f
20260113	2026-01-13	2026	1	1	Enero	13	Martes	2	f
20260114	2026-01-14	2026	1	1	Enero	14	Miércoles	3	f
20260115	2026-01-15	2026	1	1	Enero	15	Jueves	4	f
20260116	2026-01-16	2026	1	1	Enero	16	Viernes	5	f
20260117	2026-01-17	2026	1	1	Enero	17	Sábado	6	t
20260118	2026-01-18	2026	1	1	Enero	18	Domingo	7	t
20260119	2026-01-19	2026	1	1	Enero	19	Lunes	1	f
20260120	2026-01-20	2026	1	1	Enero	20	Martes	2	f
20260121	2026-01-21	2026	1	1	Enero	21	Miércoles	3	f
20260122	2026-01-22	2026	1	1	Enero	22	Jueves	4	f
20260123	2026-01-23	2026	1	1	Enero	23	Viernes	5	f
20260124	2026-01-24	2026	1	1	Enero	24	Sábado	6	t
20260125	2026-01-25	2026	1	1	Enero	25	Domingo	7	t
20260126	2026-01-26	2026	1	1	Enero	26	Lunes	1	f
20260127	2026-01-27	2026	1	1	Enero	27	Martes	2	f
20260128	2026-01-28	2026	1	1	Enero	28	Miércoles	3	f
20260129	2026-01-29	2026	1	1	Enero	29	Jueves	4	f
20260130	2026-01-30	2026	1	1	Enero	30	Viernes	5	f
20260131	2026-01-31	2026	1	1	Enero	31	Sábado	6	t
20260201	2026-02-01	2026	1	2	Febrero	1	Domingo	7	t
20260202	2026-02-02	2026	1	2	Febrero	2	Lunes	1	f
20260203	2026-02-03	2026	1	2	Febrero	3	Martes	2	f
20260204	2026-02-04	2026	1	2	Febrero	4	Miércoles	3	f
20260205	2026-02-05	2026	1	2	Febrero	5	Jueves	4	f
20260206	2026-02-06	2026	1	2	Febrero	6	Viernes	5	f
20260207	2026-02-07	2026	1	2	Febrero	7	Sábado	6	t
20260208	2026-02-08	2026	1	2	Febrero	8	Domingo	7	t
20260209	2026-02-09	2026	1	2	Febrero	9	Lunes	1	f
20260210	2026-02-10	2026	1	2	Febrero	10	Martes	2	f
20260211	2026-02-11	2026	1	2	Febrero	11	Miércoles	3	f
20260212	2026-02-12	2026	1	2	Febrero	12	Jueves	4	f
20260213	2026-02-13	2026	1	2	Febrero	13	Viernes	5	f
20260214	2026-02-14	2026	1	2	Febrero	14	Sábado	6	t
20260215	2026-02-15	2026	1	2	Febrero	15	Domingo	7	t
20260216	2026-02-16	2026	1	2	Febrero	16	Lunes	1	f
20260217	2026-02-17	2026	1	2	Febrero	17	Martes	2	f
20260218	2026-02-18	2026	1	2	Febrero	18	Miércoles	3	f
20260219	2026-02-19	2026	1	2	Febrero	19	Jueves	4	f
20260220	2026-02-20	2026	1	2	Febrero	20	Viernes	5	f
20260221	2026-02-21	2026	1	2	Febrero	21	Sábado	6	t
20260222	2026-02-22	2026	1	2	Febrero	22	Domingo	7	t
20260223	2026-02-23	2026	1	2	Febrero	23	Lunes	1	f
20260224	2026-02-24	2026	1	2	Febrero	24	Martes	2	f
20260225	2026-02-25	2026	1	2	Febrero	25	Miércoles	3	f
20260226	2026-02-26	2026	1	2	Febrero	26	Jueves	4	f
20260227	2026-02-27	2026	1	2	Febrero	27	Viernes	5	f
20260228	2026-02-28	2026	1	2	Febrero	28	Sábado	6	t
20260301	2026-03-01	2026	1	3	Marzo	1	Domingo	7	t
20260302	2026-03-02	2026	1	3	Marzo	2	Lunes	1	f
20260303	2026-03-03	2026	1	3	Marzo	3	Martes	2	f
20260304	2026-03-04	2026	1	3	Marzo	4	Miércoles	3	f
20260305	2026-03-05	2026	1	3	Marzo	5	Jueves	4	f
20260306	2026-03-06	2026	1	3	Marzo	6	Viernes	5	f
20260307	2026-03-07	2026	1	3	Marzo	7	Sábado	6	t
20260308	2026-03-08	2026	1	3	Marzo	8	Domingo	7	t
20260309	2026-03-09	2026	1	3	Marzo	9	Lunes	1	f
20260310	2026-03-10	2026	1	3	Marzo	10	Martes	2	f
20260311	2026-03-11	2026	1	3	Marzo	11	Miércoles	3	f
20260312	2026-03-12	2026	1	3	Marzo	12	Jueves	4	f
20260313	2026-03-13	2026	1	3	Marzo	13	Viernes	5	f
20260314	2026-03-14	2026	1	3	Marzo	14	Sábado	6	t
20260315	2026-03-15	2026	1	3	Marzo	15	Domingo	7	t
20260316	2026-03-16	2026	1	3	Marzo	16	Lunes	1	f
20260317	2026-03-17	2026	1	3	Marzo	17	Martes	2	f
20260318	2026-03-18	2026	1	3	Marzo	18	Miércoles	3	f
20260319	2026-03-19	2026	1	3	Marzo	19	Jueves	4	f
20260320	2026-03-20	2026	1	3	Marzo	20	Viernes	5	f
20260321	2026-03-21	2026	1	3	Marzo	21	Sábado	6	t
20260322	2026-03-22	2026	1	3	Marzo	22	Domingo	7	t
20260323	2026-03-23	2026	1	3	Marzo	23	Lunes	1	f
20260324	2026-03-24	2026	1	3	Marzo	24	Martes	2	f
20260325	2026-03-25	2026	1	3	Marzo	25	Miércoles	3	f
20260326	2026-03-26	2026	1	3	Marzo	26	Jueves	4	f
20260327	2026-03-27	2026	1	3	Marzo	27	Viernes	5	f
20260328	2026-03-28	2026	1	3	Marzo	28	Sábado	6	t
20260329	2026-03-29	2026	1	3	Marzo	29	Domingo	7	t
20260330	2026-03-30	2026	1	3	Marzo	30	Lunes	1	f
20260331	2026-03-31	2026	1	3	Marzo	31	Martes	2	f
20260401	2026-04-01	2026	2	4	Abril	1	Miércoles	3	f
20260402	2026-04-02	2026	2	4	Abril	2	Jueves	4	f
20260403	2026-04-03	2026	2	4	Abril	3	Viernes	5	f
20260404	2026-04-04	2026	2	4	Abril	4	Sábado	6	t
20260405	2026-04-05	2026	2	4	Abril	5	Domingo	7	t
20260406	2026-04-06	2026	2	4	Abril	6	Lunes	1	f
20260407	2026-04-07	2026	2	4	Abril	7	Martes	2	f
20260408	2026-04-08	2026	2	4	Abril	8	Miércoles	3	f
20260409	2026-04-09	2026	2	4	Abril	9	Jueves	4	f
20260410	2026-04-10	2026	2	4	Abril	10	Viernes	5	f
20260411	2026-04-11	2026	2	4	Abril	11	Sábado	6	t
20260412	2026-04-12	2026	2	4	Abril	12	Domingo	7	t
20260413	2026-04-13	2026	2	4	Abril	13	Lunes	1	f
20260414	2026-04-14	2026	2	4	Abril	14	Martes	2	f
20260415	2026-04-15	2026	2	4	Abril	15	Miércoles	3	f
20260416	2026-04-16	2026	2	4	Abril	16	Jueves	4	f
20260417	2026-04-17	2026	2	4	Abril	17	Viernes	5	f
20260418	2026-04-18	2026	2	4	Abril	18	Sábado	6	t
20260419	2026-04-19	2026	2	4	Abril	19	Domingo	7	t
20260420	2026-04-20	2026	2	4	Abril	20	Lunes	1	f
20260421	2026-04-21	2026	2	4	Abril	21	Martes	2	f
20260422	2026-04-22	2026	2	4	Abril	22	Miércoles	3	f
20260423	2026-04-23	2026	2	4	Abril	23	Jueves	4	f
20260424	2026-04-24	2026	2	4	Abril	24	Viernes	5	f
20260425	2026-04-25	2026	2	4	Abril	25	Sábado	6	t
20260426	2026-04-26	2026	2	4	Abril	26	Domingo	7	t
20260427	2026-04-27	2026	2	4	Abril	27	Lunes	1	f
20260428	2026-04-28	2026	2	4	Abril	28	Martes	2	f
20260429	2026-04-29	2026	2	4	Abril	29	Miércoles	3	f
20260430	2026-04-30	2026	2	4	Abril	30	Jueves	4	f
20260501	2026-05-01	2026	2	5	Mayo	1	Viernes	5	f
20260502	2026-05-02	2026	2	5	Mayo	2	Sábado	6	t
20260503	2026-05-03	2026	2	5	Mayo	3	Domingo	7	t
20260504	2026-05-04	2026	2	5	Mayo	4	Lunes	1	f
20260505	2026-05-05	2026	2	5	Mayo	5	Martes	2	f
20260506	2026-05-06	2026	2	5	Mayo	6	Miércoles	3	f
20260507	2026-05-07	2026	2	5	Mayo	7	Jueves	4	f
20260508	2026-05-08	2026	2	5	Mayo	8	Viernes	5	f
20260509	2026-05-09	2026	2	5	Mayo	9	Sábado	6	t
20260510	2026-05-10	2026	2	5	Mayo	10	Domingo	7	t
20260511	2026-05-11	2026	2	5	Mayo	11	Lunes	1	f
20260512	2026-05-12	2026	2	5	Mayo	12	Martes	2	f
20260513	2026-05-13	2026	2	5	Mayo	13	Miércoles	3	f
20260514	2026-05-14	2026	2	5	Mayo	14	Jueves	4	f
20260515	2026-05-15	2026	2	5	Mayo	15	Viernes	5	f
20260516	2026-05-16	2026	2	5	Mayo	16	Sábado	6	t
20260517	2026-05-17	2026	2	5	Mayo	17	Domingo	7	t
20260518	2026-05-18	2026	2	5	Mayo	18	Lunes	1	f
20260519	2026-05-19	2026	2	5	Mayo	19	Martes	2	f
20260520	2026-05-20	2026	2	5	Mayo	20	Miércoles	3	f
20260521	2026-05-21	2026	2	5	Mayo	21	Jueves	4	f
20260522	2026-05-22	2026	2	5	Mayo	22	Viernes	5	f
20260523	2026-05-23	2026	2	5	Mayo	23	Sábado	6	t
20260524	2026-05-24	2026	2	5	Mayo	24	Domingo	7	t
20260525	2026-05-25	2026	2	5	Mayo	25	Lunes	1	f
20260526	2026-05-26	2026	2	5	Mayo	26	Martes	2	f
20260527	2026-05-27	2026	2	5	Mayo	27	Miércoles	3	f
20260528	2026-05-28	2026	2	5	Mayo	28	Jueves	4	f
20260529	2026-05-29	2026	2	5	Mayo	29	Viernes	5	f
20260530	2026-05-30	2026	2	5	Mayo	30	Sábado	6	t
20260531	2026-05-31	2026	2	5	Mayo	31	Domingo	7	t
20260601	2026-06-01	2026	2	6	Junio	1	Lunes	1	f
20260602	2026-06-02	2026	2	6	Junio	2	Martes	2	f
20260603	2026-06-03	2026	2	6	Junio	3	Miércoles	3	f
20260604	2026-06-04	2026	2	6	Junio	4	Jueves	4	f
20260605	2026-06-05	2026	2	6	Junio	5	Viernes	5	f
20260606	2026-06-06	2026	2	6	Junio	6	Sábado	6	t
20260607	2026-06-07	2026	2	6	Junio	7	Domingo	7	t
20260608	2026-06-08	2026	2	6	Junio	8	Lunes	1	f
20260609	2026-06-09	2026	2	6	Junio	9	Martes	2	f
20260610	2026-06-10	2026	2	6	Junio	10	Miércoles	3	f
20260611	2026-06-11	2026	2	6	Junio	11	Jueves	4	f
20260612	2026-06-12	2026	2	6	Junio	12	Viernes	5	f
20260613	2026-06-13	2026	2	6	Junio	13	Sábado	6	t
20260614	2026-06-14	2026	2	6	Junio	14	Domingo	7	t
20260615	2026-06-15	2026	2	6	Junio	15	Lunes	1	f
20260616	2026-06-16	2026	2	6	Junio	16	Martes	2	f
20260617	2026-06-17	2026	2	6	Junio	17	Miércoles	3	f
20260618	2026-06-18	2026	2	6	Junio	18	Jueves	4	f
20260619	2026-06-19	2026	2	6	Junio	19	Viernes	5	f
20260620	2026-06-20	2026	2	6	Junio	20	Sábado	6	t
20260621	2026-06-21	2026	2	6	Junio	21	Domingo	7	t
20260622	2026-06-22	2026	2	6	Junio	22	Lunes	1	f
20260623	2026-06-23	2026	2	6	Junio	23	Martes	2	f
20260624	2026-06-24	2026	2	6	Junio	24	Miércoles	3	f
20260625	2026-06-25	2026	2	6	Junio	25	Jueves	4	f
20260626	2026-06-26	2026	2	6	Junio	26	Viernes	5	f
20260627	2026-06-27	2026	2	6	Junio	27	Sábado	6	t
20260628	2026-06-28	2026	2	6	Junio	28	Domingo	7	t
20260629	2026-06-29	2026	2	6	Junio	29	Lunes	1	f
20260630	2026-06-30	2026	2	6	Junio	30	Martes	2	f
20260701	2026-07-01	2026	3	7	Julio	1	Miércoles	3	f
20260702	2026-07-02	2026	3	7	Julio	2	Jueves	4	f
20260703	2026-07-03	2026	3	7	Julio	3	Viernes	5	f
20260704	2026-07-04	2026	3	7	Julio	4	Sábado	6	t
20260705	2026-07-05	2026	3	7	Julio	5	Domingo	7	t
20260706	2026-07-06	2026	3	7	Julio	6	Lunes	1	f
20260707	2026-07-07	2026	3	7	Julio	7	Martes	2	f
20260708	2026-07-08	2026	3	7	Julio	8	Miércoles	3	f
20260709	2026-07-09	2026	3	7	Julio	9	Jueves	4	f
20260710	2026-07-10	2026	3	7	Julio	10	Viernes	5	f
20260711	2026-07-11	2026	3	7	Julio	11	Sábado	6	t
20260712	2026-07-12	2026	3	7	Julio	12	Domingo	7	t
20260713	2026-07-13	2026	3	7	Julio	13	Lunes	1	f
20260714	2026-07-14	2026	3	7	Julio	14	Martes	2	f
20260715	2026-07-15	2026	3	7	Julio	15	Miércoles	3	f
20260716	2026-07-16	2026	3	7	Julio	16	Jueves	4	f
20260717	2026-07-17	2026	3	7	Julio	17	Viernes	5	f
20260718	2026-07-18	2026	3	7	Julio	18	Sábado	6	t
20260719	2026-07-19	2026	3	7	Julio	19	Domingo	7	t
20260720	2026-07-20	2026	3	7	Julio	20	Lunes	1	f
20260721	2026-07-21	2026	3	7	Julio	21	Martes	2	f
20260722	2026-07-22	2026	3	7	Julio	22	Miércoles	3	f
20260723	2026-07-23	2026	3	7	Julio	23	Jueves	4	f
20260724	2026-07-24	2026	3	7	Julio	24	Viernes	5	f
20260725	2026-07-25	2026	3	7	Julio	25	Sábado	6	t
20260726	2026-07-26	2026	3	7	Julio	26	Domingo	7	t
20260727	2026-07-27	2026	3	7	Julio	27	Lunes	1	f
20260728	2026-07-28	2026	3	7	Julio	28	Martes	2	f
20260729	2026-07-29	2026	3	7	Julio	29	Miércoles	3	f
20260730	2026-07-30	2026	3	7	Julio	30	Jueves	4	f
20260731	2026-07-31	2026	3	7	Julio	31	Viernes	5	f
20260801	2026-08-01	2026	3	8	Agosto	1	Sábado	6	t
20260802	2026-08-02	2026	3	8	Agosto	2	Domingo	7	t
20260803	2026-08-03	2026	3	8	Agosto	3	Lunes	1	f
20260804	2026-08-04	2026	3	8	Agosto	4	Martes	2	f
20260805	2026-08-05	2026	3	8	Agosto	5	Miércoles	3	f
20260806	2026-08-06	2026	3	8	Agosto	6	Jueves	4	f
20260807	2026-08-07	2026	3	8	Agosto	7	Viernes	5	f
20260808	2026-08-08	2026	3	8	Agosto	8	Sábado	6	t
20260809	2026-08-09	2026	3	8	Agosto	9	Domingo	7	t
20260810	2026-08-10	2026	3	8	Agosto	10	Lunes	1	f
20260811	2026-08-11	2026	3	8	Agosto	11	Martes	2	f
20260812	2026-08-12	2026	3	8	Agosto	12	Miércoles	3	f
20260813	2026-08-13	2026	3	8	Agosto	13	Jueves	4	f
20260814	2026-08-14	2026	3	8	Agosto	14	Viernes	5	f
20260815	2026-08-15	2026	3	8	Agosto	15	Sábado	6	t
20260816	2026-08-16	2026	3	8	Agosto	16	Domingo	7	t
20260817	2026-08-17	2026	3	8	Agosto	17	Lunes	1	f
20260818	2026-08-18	2026	3	8	Agosto	18	Martes	2	f
20260819	2026-08-19	2026	3	8	Agosto	19	Miércoles	3	f
20260820	2026-08-20	2026	3	8	Agosto	20	Jueves	4	f
20260821	2026-08-21	2026	3	8	Agosto	21	Viernes	5	f
20260822	2026-08-22	2026	3	8	Agosto	22	Sábado	6	t
20260823	2026-08-23	2026	3	8	Agosto	23	Domingo	7	t
20260824	2026-08-24	2026	3	8	Agosto	24	Lunes	1	f
20260825	2026-08-25	2026	3	8	Agosto	25	Martes	2	f
20260826	2026-08-26	2026	3	8	Agosto	26	Miércoles	3	f
20260827	2026-08-27	2026	3	8	Agosto	27	Jueves	4	f
20260828	2026-08-28	2026	3	8	Agosto	28	Viernes	5	f
20260829	2026-08-29	2026	3	8	Agosto	29	Sábado	6	t
20260830	2026-08-30	2026	3	8	Agosto	30	Domingo	7	t
20260831	2026-08-31	2026	3	8	Agosto	31	Lunes	1	f
20260901	2026-09-01	2026	3	9	Septiembre	1	Martes	2	f
20260902	2026-09-02	2026	3	9	Septiembre	2	Miércoles	3	f
20260903	2026-09-03	2026	3	9	Septiembre	3	Jueves	4	f
20260904	2026-09-04	2026	3	9	Septiembre	4	Viernes	5	f
20260905	2026-09-05	2026	3	9	Septiembre	5	Sábado	6	t
20260906	2026-09-06	2026	3	9	Septiembre	6	Domingo	7	t
20260907	2026-09-07	2026	3	9	Septiembre	7	Lunes	1	f
20260908	2026-09-08	2026	3	9	Septiembre	8	Martes	2	f
20260909	2026-09-09	2026	3	9	Septiembre	9	Miércoles	3	f
20260910	2026-09-10	2026	3	9	Septiembre	10	Jueves	4	f
20260911	2026-09-11	2026	3	9	Septiembre	11	Viernes	5	f
20260912	2026-09-12	2026	3	9	Septiembre	12	Sábado	6	t
20260913	2026-09-13	2026	3	9	Septiembre	13	Domingo	7	t
20260914	2026-09-14	2026	3	9	Septiembre	14	Lunes	1	f
20260915	2026-09-15	2026	3	9	Septiembre	15	Martes	2	f
20260916	2026-09-16	2026	3	9	Septiembre	16	Miércoles	3	f
20260917	2026-09-17	2026	3	9	Septiembre	17	Jueves	4	f
20260918	2026-09-18	2026	3	9	Septiembre	18	Viernes	5	f
20260919	2026-09-19	2026	3	9	Septiembre	19	Sábado	6	t
20260920	2026-09-20	2026	3	9	Septiembre	20	Domingo	7	t
20260921	2026-09-21	2026	3	9	Septiembre	21	Lunes	1	f
20260922	2026-09-22	2026	3	9	Septiembre	22	Martes	2	f
20260923	2026-09-23	2026	3	9	Septiembre	23	Miércoles	3	f
20260924	2026-09-24	2026	3	9	Septiembre	24	Jueves	4	f
20260925	2026-09-25	2026	3	9	Septiembre	25	Viernes	5	f
20260926	2026-09-26	2026	3	9	Septiembre	26	Sábado	6	t
20260927	2026-09-27	2026	3	9	Septiembre	27	Domingo	7	t
20260928	2026-09-28	2026	3	9	Septiembre	28	Lunes	1	f
20260929	2026-09-29	2026	3	9	Septiembre	29	Martes	2	f
20260930	2026-09-30	2026	3	9	Septiembre	30	Miércoles	3	f
20261001	2026-10-01	2026	4	10	Octubre	1	Jueves	4	f
20261002	2026-10-02	2026	4	10	Octubre	2	Viernes	5	f
20261003	2026-10-03	2026	4	10	Octubre	3	Sábado	6	t
20261004	2026-10-04	2026	4	10	Octubre	4	Domingo	7	t
20261005	2026-10-05	2026	4	10	Octubre	5	Lunes	1	f
20261006	2026-10-06	2026	4	10	Octubre	6	Martes	2	f
20261007	2026-10-07	2026	4	10	Octubre	7	Miércoles	3	f
20261008	2026-10-08	2026	4	10	Octubre	8	Jueves	4	f
20261009	2026-10-09	2026	4	10	Octubre	9	Viernes	5	f
20261010	2026-10-10	2026	4	10	Octubre	10	Sábado	6	t
20261011	2026-10-11	2026	4	10	Octubre	11	Domingo	7	t
20261012	2026-10-12	2026	4	10	Octubre	12	Lunes	1	f
20261013	2026-10-13	2026	4	10	Octubre	13	Martes	2	f
20261014	2026-10-14	2026	4	10	Octubre	14	Miércoles	3	f
20261015	2026-10-15	2026	4	10	Octubre	15	Jueves	4	f
20261016	2026-10-16	2026	4	10	Octubre	16	Viernes	5	f
20261017	2026-10-17	2026	4	10	Octubre	17	Sábado	6	t
20261018	2026-10-18	2026	4	10	Octubre	18	Domingo	7	t
20261019	2026-10-19	2026	4	10	Octubre	19	Lunes	1	f
20261020	2026-10-20	2026	4	10	Octubre	20	Martes	2	f
20261021	2026-10-21	2026	4	10	Octubre	21	Miércoles	3	f
20261022	2026-10-22	2026	4	10	Octubre	22	Jueves	4	f
20261023	2026-10-23	2026	4	10	Octubre	23	Viernes	5	f
20261024	2026-10-24	2026	4	10	Octubre	24	Sábado	6	t
20261025	2026-10-25	2026	4	10	Octubre	25	Domingo	7	t
20261026	2026-10-26	2026	4	10	Octubre	26	Lunes	1	f
20261027	2026-10-27	2026	4	10	Octubre	27	Martes	2	f
20261028	2026-10-28	2026	4	10	Octubre	28	Miércoles	3	f
20261029	2026-10-29	2026	4	10	Octubre	29	Jueves	4	f
20261030	2026-10-30	2026	4	10	Octubre	30	Viernes	5	f
20261031	2026-10-31	2026	4	10	Octubre	31	Sábado	6	t
20261101	2026-11-01	2026	4	11	Noviembre	1	Domingo	7	t
20261102	2026-11-02	2026	4	11	Noviembre	2	Lunes	1	f
20261103	2026-11-03	2026	4	11	Noviembre	3	Martes	2	f
20261104	2026-11-04	2026	4	11	Noviembre	4	Miércoles	3	f
20261105	2026-11-05	2026	4	11	Noviembre	5	Jueves	4	f
20261106	2026-11-06	2026	4	11	Noviembre	6	Viernes	5	f
20261107	2026-11-07	2026	4	11	Noviembre	7	Sábado	6	t
20261108	2026-11-08	2026	4	11	Noviembre	8	Domingo	7	t
20261109	2026-11-09	2026	4	11	Noviembre	9	Lunes	1	f
20261110	2026-11-10	2026	4	11	Noviembre	10	Martes	2	f
20261111	2026-11-11	2026	4	11	Noviembre	11	Miércoles	3	f
20261112	2026-11-12	2026	4	11	Noviembre	12	Jueves	4	f
20261113	2026-11-13	2026	4	11	Noviembre	13	Viernes	5	f
20261114	2026-11-14	2026	4	11	Noviembre	14	Sábado	6	t
20261115	2026-11-15	2026	4	11	Noviembre	15	Domingo	7	t
20261116	2026-11-16	2026	4	11	Noviembre	16	Lunes	1	f
20261117	2026-11-17	2026	4	11	Noviembre	17	Martes	2	f
20261118	2026-11-18	2026	4	11	Noviembre	18	Miércoles	3	f
20261119	2026-11-19	2026	4	11	Noviembre	19	Jueves	4	f
20261120	2026-11-20	2026	4	11	Noviembre	20	Viernes	5	f
20261121	2026-11-21	2026	4	11	Noviembre	21	Sábado	6	t
20261122	2026-11-22	2026	4	11	Noviembre	22	Domingo	7	t
20261123	2026-11-23	2026	4	11	Noviembre	23	Lunes	1	f
20261124	2026-11-24	2026	4	11	Noviembre	24	Martes	2	f
20261125	2026-11-25	2026	4	11	Noviembre	25	Miércoles	3	f
20261126	2026-11-26	2026	4	11	Noviembre	26	Jueves	4	f
20261127	2026-11-27	2026	4	11	Noviembre	27	Viernes	5	f
20261128	2026-11-28	2026	4	11	Noviembre	28	Sábado	6	t
20261129	2026-11-29	2026	4	11	Noviembre	29	Domingo	7	t
20261130	2026-11-30	2026	4	11	Noviembre	30	Lunes	1	f
20261201	2026-12-01	2026	4	12	Diciembre	1	Martes	2	f
20261202	2026-12-02	2026	4	12	Diciembre	2	Miércoles	3	f
20261203	2026-12-03	2026	4	12	Diciembre	3	Jueves	4	f
20261204	2026-12-04	2026	4	12	Diciembre	4	Viernes	5	f
20261205	2026-12-05	2026	4	12	Diciembre	5	Sábado	6	t
20261206	2026-12-06	2026	4	12	Diciembre	6	Domingo	7	t
20261207	2026-12-07	2026	4	12	Diciembre	7	Lunes	1	f
20261208	2026-12-08	2026	4	12	Diciembre	8	Martes	2	f
20261209	2026-12-09	2026	4	12	Diciembre	9	Miércoles	3	f
20261210	2026-12-10	2026	4	12	Diciembre	10	Jueves	4	f
20261211	2026-12-11	2026	4	12	Diciembre	11	Viernes	5	f
20261212	2026-12-12	2026	4	12	Diciembre	12	Sábado	6	t
20261213	2026-12-13	2026	4	12	Diciembre	13	Domingo	7	t
20261214	2026-12-14	2026	4	12	Diciembre	14	Lunes	1	f
20261215	2026-12-15	2026	4	12	Diciembre	15	Martes	2	f
20261216	2026-12-16	2026	4	12	Diciembre	16	Miércoles	3	f
20261217	2026-12-17	2026	4	12	Diciembre	17	Jueves	4	f
20261218	2026-12-18	2026	4	12	Diciembre	18	Viernes	5	f
20261219	2026-12-19	2026	4	12	Diciembre	19	Sábado	6	t
20261220	2026-12-20	2026	4	12	Diciembre	20	Domingo	7	t
20261221	2026-12-21	2026	4	12	Diciembre	21	Lunes	1	f
20261222	2026-12-22	2026	4	12	Diciembre	22	Martes	2	f
20261223	2026-12-23	2026	4	12	Diciembre	23	Miércoles	3	f
20261224	2026-12-24	2026	4	12	Diciembre	24	Jueves	4	f
20261225	2026-12-25	2026	4	12	Diciembre	25	Viernes	5	f
20261226	2026-12-26	2026	4	12	Diciembre	26	Sábado	6	t
20261227	2026-12-27	2026	4	12	Diciembre	27	Domingo	7	t
20261228	2026-12-28	2026	4	12	Diciembre	28	Lunes	1	f
20261229	2026-12-29	2026	4	12	Diciembre	29	Martes	2	f
20261230	2026-12-30	2026	4	12	Diciembre	30	Miércoles	3	f
20261231	2026-12-31	2026	4	12	Diciembre	31	Jueves	4	f
20270101	2027-01-01	2027	1	1	Enero	1	Viernes	5	f
20270102	2027-01-02	2027	1	1	Enero	2	Sábado	6	t
20270103	2027-01-03	2027	1	1	Enero	3	Domingo	7	t
20270104	2027-01-04	2027	1	1	Enero	4	Lunes	1	f
20270105	2027-01-05	2027	1	1	Enero	5	Martes	2	f
20270106	2027-01-06	2027	1	1	Enero	6	Miércoles	3	f
20270107	2027-01-07	2027	1	1	Enero	7	Jueves	4	f
20270108	2027-01-08	2027	1	1	Enero	8	Viernes	5	f
20270109	2027-01-09	2027	1	1	Enero	9	Sábado	6	t
20270110	2027-01-10	2027	1	1	Enero	10	Domingo	7	t
20270111	2027-01-11	2027	1	1	Enero	11	Lunes	1	f
20270112	2027-01-12	2027	1	1	Enero	12	Martes	2	f
20270113	2027-01-13	2027	1	1	Enero	13	Miércoles	3	f
20270114	2027-01-14	2027	1	1	Enero	14	Jueves	4	f
20270115	2027-01-15	2027	1	1	Enero	15	Viernes	5	f
20270116	2027-01-16	2027	1	1	Enero	16	Sábado	6	t
20270117	2027-01-17	2027	1	1	Enero	17	Domingo	7	t
20270118	2027-01-18	2027	1	1	Enero	18	Lunes	1	f
20270119	2027-01-19	2027	1	1	Enero	19	Martes	2	f
20270120	2027-01-20	2027	1	1	Enero	20	Miércoles	3	f
20270121	2027-01-21	2027	1	1	Enero	21	Jueves	4	f
20270122	2027-01-22	2027	1	1	Enero	22	Viernes	5	f
20270123	2027-01-23	2027	1	1	Enero	23	Sábado	6	t
20270124	2027-01-24	2027	1	1	Enero	24	Domingo	7	t
20270125	2027-01-25	2027	1	1	Enero	25	Lunes	1	f
20270126	2027-01-26	2027	1	1	Enero	26	Martes	2	f
20270127	2027-01-27	2027	1	1	Enero	27	Miércoles	3	f
20270128	2027-01-28	2027	1	1	Enero	28	Jueves	4	f
20270129	2027-01-29	2027	1	1	Enero	29	Viernes	5	f
20270130	2027-01-30	2027	1	1	Enero	30	Sábado	6	t
20270131	2027-01-31	2027	1	1	Enero	31	Domingo	7	t
20270201	2027-02-01	2027	1	2	Febrero	1	Lunes	1	f
20270202	2027-02-02	2027	1	2	Febrero	2	Martes	2	f
20270203	2027-02-03	2027	1	2	Febrero	3	Miércoles	3	f
20270204	2027-02-04	2027	1	2	Febrero	4	Jueves	4	f
20270205	2027-02-05	2027	1	2	Febrero	5	Viernes	5	f
20270206	2027-02-06	2027	1	2	Febrero	6	Sábado	6	t
20270207	2027-02-07	2027	1	2	Febrero	7	Domingo	7	t
20270208	2027-02-08	2027	1	2	Febrero	8	Lunes	1	f
20270209	2027-02-09	2027	1	2	Febrero	9	Martes	2	f
20270210	2027-02-10	2027	1	2	Febrero	10	Miércoles	3	f
20270211	2027-02-11	2027	1	2	Febrero	11	Jueves	4	f
20270212	2027-02-12	2027	1	2	Febrero	12	Viernes	5	f
20270213	2027-02-13	2027	1	2	Febrero	13	Sábado	6	t
20270214	2027-02-14	2027	1	2	Febrero	14	Domingo	7	t
20270215	2027-02-15	2027	1	2	Febrero	15	Lunes	1	f
20270216	2027-02-16	2027	1	2	Febrero	16	Martes	2	f
20270217	2027-02-17	2027	1	2	Febrero	17	Miércoles	3	f
20270218	2027-02-18	2027	1	2	Febrero	18	Jueves	4	f
20270219	2027-02-19	2027	1	2	Febrero	19	Viernes	5	f
20270220	2027-02-20	2027	1	2	Febrero	20	Sábado	6	t
20270221	2027-02-21	2027	1	2	Febrero	21	Domingo	7	t
20270222	2027-02-22	2027	1	2	Febrero	22	Lunes	1	f
20270223	2027-02-23	2027	1	2	Febrero	23	Martes	2	f
20270224	2027-02-24	2027	1	2	Febrero	24	Miércoles	3	f
20270225	2027-02-25	2027	1	2	Febrero	25	Jueves	4	f
20270226	2027-02-26	2027	1	2	Febrero	26	Viernes	5	f
20270227	2027-02-27	2027	1	2	Febrero	27	Sábado	6	t
20270228	2027-02-28	2027	1	2	Febrero	28	Domingo	7	t
20270301	2027-03-01	2027	1	3	Marzo	1	Lunes	1	f
20270302	2027-03-02	2027	1	3	Marzo	2	Martes	2	f
20270303	2027-03-03	2027	1	3	Marzo	3	Miércoles	3	f
20270304	2027-03-04	2027	1	3	Marzo	4	Jueves	4	f
20270305	2027-03-05	2027	1	3	Marzo	5	Viernes	5	f
20270306	2027-03-06	2027	1	3	Marzo	6	Sábado	6	t
20270307	2027-03-07	2027	1	3	Marzo	7	Domingo	7	t
20270308	2027-03-08	2027	1	3	Marzo	8	Lunes	1	f
20270309	2027-03-09	2027	1	3	Marzo	9	Martes	2	f
20270310	2027-03-10	2027	1	3	Marzo	10	Miércoles	3	f
20270311	2027-03-11	2027	1	3	Marzo	11	Jueves	4	f
20270312	2027-03-12	2027	1	3	Marzo	12	Viernes	5	f
20270313	2027-03-13	2027	1	3	Marzo	13	Sábado	6	t
20270314	2027-03-14	2027	1	3	Marzo	14	Domingo	7	t
20270315	2027-03-15	2027	1	3	Marzo	15	Lunes	1	f
20270316	2027-03-16	2027	1	3	Marzo	16	Martes	2	f
20270317	2027-03-17	2027	1	3	Marzo	17	Miércoles	3	f
20270318	2027-03-18	2027	1	3	Marzo	18	Jueves	4	f
20270319	2027-03-19	2027	1	3	Marzo	19	Viernes	5	f
20270320	2027-03-20	2027	1	3	Marzo	20	Sábado	6	t
20270321	2027-03-21	2027	1	3	Marzo	21	Domingo	7	t
20270322	2027-03-22	2027	1	3	Marzo	22	Lunes	1	f
20270323	2027-03-23	2027	1	3	Marzo	23	Martes	2	f
20270324	2027-03-24	2027	1	3	Marzo	24	Miércoles	3	f
20270325	2027-03-25	2027	1	3	Marzo	25	Jueves	4	f
20270326	2027-03-26	2027	1	3	Marzo	26	Viernes	5	f
20270327	2027-03-27	2027	1	3	Marzo	27	Sábado	6	t
20270328	2027-03-28	2027	1	3	Marzo	28	Domingo	7	t
20270329	2027-03-29	2027	1	3	Marzo	29	Lunes	1	f
20270330	2027-03-30	2027	1	3	Marzo	30	Martes	2	f
20270331	2027-03-31	2027	1	3	Marzo	31	Miércoles	3	f
20270401	2027-04-01	2027	2	4	Abril	1	Jueves	4	f
20270402	2027-04-02	2027	2	4	Abril	2	Viernes	5	f
20270403	2027-04-03	2027	2	4	Abril	3	Sábado	6	t
20270404	2027-04-04	2027	2	4	Abril	4	Domingo	7	t
20270405	2027-04-05	2027	2	4	Abril	5	Lunes	1	f
20270406	2027-04-06	2027	2	4	Abril	6	Martes	2	f
20270407	2027-04-07	2027	2	4	Abril	7	Miércoles	3	f
20270408	2027-04-08	2027	2	4	Abril	8	Jueves	4	f
20270409	2027-04-09	2027	2	4	Abril	9	Viernes	5	f
20270410	2027-04-10	2027	2	4	Abril	10	Sábado	6	t
20270411	2027-04-11	2027	2	4	Abril	11	Domingo	7	t
20270412	2027-04-12	2027	2	4	Abril	12	Lunes	1	f
20270413	2027-04-13	2027	2	4	Abril	13	Martes	2	f
20270414	2027-04-14	2027	2	4	Abril	14	Miércoles	3	f
20270415	2027-04-15	2027	2	4	Abril	15	Jueves	4	f
20270416	2027-04-16	2027	2	4	Abril	16	Viernes	5	f
20270417	2027-04-17	2027	2	4	Abril	17	Sábado	6	t
20270418	2027-04-18	2027	2	4	Abril	18	Domingo	7	t
20270419	2027-04-19	2027	2	4	Abril	19	Lunes	1	f
20270420	2027-04-20	2027	2	4	Abril	20	Martes	2	f
20270421	2027-04-21	2027	2	4	Abril	21	Miércoles	3	f
20270422	2027-04-22	2027	2	4	Abril	22	Jueves	4	f
20270423	2027-04-23	2027	2	4	Abril	23	Viernes	5	f
20270424	2027-04-24	2027	2	4	Abril	24	Sábado	6	t
20270425	2027-04-25	2027	2	4	Abril	25	Domingo	7	t
20270426	2027-04-26	2027	2	4	Abril	26	Lunes	1	f
20270427	2027-04-27	2027	2	4	Abril	27	Martes	2	f
20270428	2027-04-28	2027	2	4	Abril	28	Miércoles	3	f
20270429	2027-04-29	2027	2	4	Abril	29	Jueves	4	f
20270430	2027-04-30	2027	2	4	Abril	30	Viernes	5	f
20270501	2027-05-01	2027	2	5	Mayo	1	Sábado	6	t
20270502	2027-05-02	2027	2	5	Mayo	2	Domingo	7	t
20270503	2027-05-03	2027	2	5	Mayo	3	Lunes	1	f
20270504	2027-05-04	2027	2	5	Mayo	4	Martes	2	f
20270505	2027-05-05	2027	2	5	Mayo	5	Miércoles	3	f
20270506	2027-05-06	2027	2	5	Mayo	6	Jueves	4	f
20270507	2027-05-07	2027	2	5	Mayo	7	Viernes	5	f
20270508	2027-05-08	2027	2	5	Mayo	8	Sábado	6	t
20270509	2027-05-09	2027	2	5	Mayo	9	Domingo	7	t
20270510	2027-05-10	2027	2	5	Mayo	10	Lunes	1	f
20270511	2027-05-11	2027	2	5	Mayo	11	Martes	2	f
20270512	2027-05-12	2027	2	5	Mayo	12	Miércoles	3	f
20270513	2027-05-13	2027	2	5	Mayo	13	Jueves	4	f
20270514	2027-05-14	2027	2	5	Mayo	14	Viernes	5	f
20270515	2027-05-15	2027	2	5	Mayo	15	Sábado	6	t
20270516	2027-05-16	2027	2	5	Mayo	16	Domingo	7	t
20270517	2027-05-17	2027	2	5	Mayo	17	Lunes	1	f
20270518	2027-05-18	2027	2	5	Mayo	18	Martes	2	f
20270519	2027-05-19	2027	2	5	Mayo	19	Miércoles	3	f
20270520	2027-05-20	2027	2	5	Mayo	20	Jueves	4	f
20270521	2027-05-21	2027	2	5	Mayo	21	Viernes	5	f
20270522	2027-05-22	2027	2	5	Mayo	22	Sábado	6	t
20270523	2027-05-23	2027	2	5	Mayo	23	Domingo	7	t
20270524	2027-05-24	2027	2	5	Mayo	24	Lunes	1	f
20270525	2027-05-25	2027	2	5	Mayo	25	Martes	2	f
20270526	2027-05-26	2027	2	5	Mayo	26	Miércoles	3	f
20270527	2027-05-27	2027	2	5	Mayo	27	Jueves	4	f
20270528	2027-05-28	2027	2	5	Mayo	28	Viernes	5	f
20270529	2027-05-29	2027	2	5	Mayo	29	Sábado	6	t
20270530	2027-05-30	2027	2	5	Mayo	30	Domingo	7	t
20270531	2027-05-31	2027	2	5	Mayo	31	Lunes	1	f
20270601	2027-06-01	2027	2	6	Junio	1	Martes	2	f
20270602	2027-06-02	2027	2	6	Junio	2	Miércoles	3	f
20270603	2027-06-03	2027	2	6	Junio	3	Jueves	4	f
20270604	2027-06-04	2027	2	6	Junio	4	Viernes	5	f
20270605	2027-06-05	2027	2	6	Junio	5	Sábado	6	t
20270606	2027-06-06	2027	2	6	Junio	6	Domingo	7	t
20270607	2027-06-07	2027	2	6	Junio	7	Lunes	1	f
20270608	2027-06-08	2027	2	6	Junio	8	Martes	2	f
20270609	2027-06-09	2027	2	6	Junio	9	Miércoles	3	f
20270610	2027-06-10	2027	2	6	Junio	10	Jueves	4	f
20270611	2027-06-11	2027	2	6	Junio	11	Viernes	5	f
20270612	2027-06-12	2027	2	6	Junio	12	Sábado	6	t
20270613	2027-06-13	2027	2	6	Junio	13	Domingo	7	t
20270614	2027-06-14	2027	2	6	Junio	14	Lunes	1	f
20270615	2027-06-15	2027	2	6	Junio	15	Martes	2	f
20270616	2027-06-16	2027	2	6	Junio	16	Miércoles	3	f
20270617	2027-06-17	2027	2	6	Junio	17	Jueves	4	f
20270618	2027-06-18	2027	2	6	Junio	18	Viernes	5	f
20270619	2027-06-19	2027	2	6	Junio	19	Sábado	6	t
20270620	2027-06-20	2027	2	6	Junio	20	Domingo	7	t
20270621	2027-06-21	2027	2	6	Junio	21	Lunes	1	f
20270622	2027-06-22	2027	2	6	Junio	22	Martes	2	f
20270623	2027-06-23	2027	2	6	Junio	23	Miércoles	3	f
20270624	2027-06-24	2027	2	6	Junio	24	Jueves	4	f
20270625	2027-06-25	2027	2	6	Junio	25	Viernes	5	f
20270626	2027-06-26	2027	2	6	Junio	26	Sábado	6	t
20270627	2027-06-27	2027	2	6	Junio	27	Domingo	7	t
20270628	2027-06-28	2027	2	6	Junio	28	Lunes	1	f
20270629	2027-06-29	2027	2	6	Junio	29	Martes	2	f
20270630	2027-06-30	2027	2	6	Junio	30	Miércoles	3	f
20270701	2027-07-01	2027	3	7	Julio	1	Jueves	4	f
20270702	2027-07-02	2027	3	7	Julio	2	Viernes	5	f
20270703	2027-07-03	2027	3	7	Julio	3	Sábado	6	t
20270704	2027-07-04	2027	3	7	Julio	4	Domingo	7	t
20270705	2027-07-05	2027	3	7	Julio	5	Lunes	1	f
20270706	2027-07-06	2027	3	7	Julio	6	Martes	2	f
20270707	2027-07-07	2027	3	7	Julio	7	Miércoles	3	f
20270708	2027-07-08	2027	3	7	Julio	8	Jueves	4	f
20270709	2027-07-09	2027	3	7	Julio	9	Viernes	5	f
20270710	2027-07-10	2027	3	7	Julio	10	Sábado	6	t
20270711	2027-07-11	2027	3	7	Julio	11	Domingo	7	t
20270712	2027-07-12	2027	3	7	Julio	12	Lunes	1	f
20270713	2027-07-13	2027	3	7	Julio	13	Martes	2	f
20270714	2027-07-14	2027	3	7	Julio	14	Miércoles	3	f
20270715	2027-07-15	2027	3	7	Julio	15	Jueves	4	f
20270716	2027-07-16	2027	3	7	Julio	16	Viernes	5	f
20270717	2027-07-17	2027	3	7	Julio	17	Sábado	6	t
20270718	2027-07-18	2027	3	7	Julio	18	Domingo	7	t
20270719	2027-07-19	2027	3	7	Julio	19	Lunes	1	f
20270720	2027-07-20	2027	3	7	Julio	20	Martes	2	f
20270721	2027-07-21	2027	3	7	Julio	21	Miércoles	3	f
20270722	2027-07-22	2027	3	7	Julio	22	Jueves	4	f
20270723	2027-07-23	2027	3	7	Julio	23	Viernes	5	f
20270724	2027-07-24	2027	3	7	Julio	24	Sábado	6	t
20270725	2027-07-25	2027	3	7	Julio	25	Domingo	7	t
20270726	2027-07-26	2027	3	7	Julio	26	Lunes	1	f
20270727	2027-07-27	2027	3	7	Julio	27	Martes	2	f
20270728	2027-07-28	2027	3	7	Julio	28	Miércoles	3	f
20270729	2027-07-29	2027	3	7	Julio	29	Jueves	4	f
20270730	2027-07-30	2027	3	7	Julio	30	Viernes	5	f
20270731	2027-07-31	2027	3	7	Julio	31	Sábado	6	t
20270801	2027-08-01	2027	3	8	Agosto	1	Domingo	7	t
20270802	2027-08-02	2027	3	8	Agosto	2	Lunes	1	f
20270803	2027-08-03	2027	3	8	Agosto	3	Martes	2	f
20270804	2027-08-04	2027	3	8	Agosto	4	Miércoles	3	f
20270805	2027-08-05	2027	3	8	Agosto	5	Jueves	4	f
20270806	2027-08-06	2027	3	8	Agosto	6	Viernes	5	f
20270807	2027-08-07	2027	3	8	Agosto	7	Sábado	6	t
20270808	2027-08-08	2027	3	8	Agosto	8	Domingo	7	t
20270809	2027-08-09	2027	3	8	Agosto	9	Lunes	1	f
20270810	2027-08-10	2027	3	8	Agosto	10	Martes	2	f
20270811	2027-08-11	2027	3	8	Agosto	11	Miércoles	3	f
20270812	2027-08-12	2027	3	8	Agosto	12	Jueves	4	f
20270813	2027-08-13	2027	3	8	Agosto	13	Viernes	5	f
20270814	2027-08-14	2027	3	8	Agosto	14	Sábado	6	t
20270815	2027-08-15	2027	3	8	Agosto	15	Domingo	7	t
20270816	2027-08-16	2027	3	8	Agosto	16	Lunes	1	f
20270817	2027-08-17	2027	3	8	Agosto	17	Martes	2	f
20270818	2027-08-18	2027	3	8	Agosto	18	Miércoles	3	f
20270819	2027-08-19	2027	3	8	Agosto	19	Jueves	4	f
20270820	2027-08-20	2027	3	8	Agosto	20	Viernes	5	f
20270821	2027-08-21	2027	3	8	Agosto	21	Sábado	6	t
20270822	2027-08-22	2027	3	8	Agosto	22	Domingo	7	t
20270823	2027-08-23	2027	3	8	Agosto	23	Lunes	1	f
20270824	2027-08-24	2027	3	8	Agosto	24	Martes	2	f
20270825	2027-08-25	2027	3	8	Agosto	25	Miércoles	3	f
20270826	2027-08-26	2027	3	8	Agosto	26	Jueves	4	f
20270827	2027-08-27	2027	3	8	Agosto	27	Viernes	5	f
20270828	2027-08-28	2027	3	8	Agosto	28	Sábado	6	t
20270829	2027-08-29	2027	3	8	Agosto	29	Domingo	7	t
20270830	2027-08-30	2027	3	8	Agosto	30	Lunes	1	f
20270831	2027-08-31	2027	3	8	Agosto	31	Martes	2	f
20270901	2027-09-01	2027	3	9	Septiembre	1	Miércoles	3	f
20270902	2027-09-02	2027	3	9	Septiembre	2	Jueves	4	f
20270903	2027-09-03	2027	3	9	Septiembre	3	Viernes	5	f
20270904	2027-09-04	2027	3	9	Septiembre	4	Sábado	6	t
20270905	2027-09-05	2027	3	9	Septiembre	5	Domingo	7	t
20270906	2027-09-06	2027	3	9	Septiembre	6	Lunes	1	f
20270907	2027-09-07	2027	3	9	Septiembre	7	Martes	2	f
20270908	2027-09-08	2027	3	9	Septiembre	8	Miércoles	3	f
20270909	2027-09-09	2027	3	9	Septiembre	9	Jueves	4	f
20270910	2027-09-10	2027	3	9	Septiembre	10	Viernes	5	f
20270911	2027-09-11	2027	3	9	Septiembre	11	Sábado	6	t
20270912	2027-09-12	2027	3	9	Septiembre	12	Domingo	7	t
20270913	2027-09-13	2027	3	9	Septiembre	13	Lunes	1	f
20270914	2027-09-14	2027	3	9	Septiembre	14	Martes	2	f
20270915	2027-09-15	2027	3	9	Septiembre	15	Miércoles	3	f
20270916	2027-09-16	2027	3	9	Septiembre	16	Jueves	4	f
20270917	2027-09-17	2027	3	9	Septiembre	17	Viernes	5	f
20270918	2027-09-18	2027	3	9	Septiembre	18	Sábado	6	t
20270919	2027-09-19	2027	3	9	Septiembre	19	Domingo	7	t
20270920	2027-09-20	2027	3	9	Septiembre	20	Lunes	1	f
20270921	2027-09-21	2027	3	9	Septiembre	21	Martes	2	f
20270922	2027-09-22	2027	3	9	Septiembre	22	Miércoles	3	f
20270923	2027-09-23	2027	3	9	Septiembre	23	Jueves	4	f
20270924	2027-09-24	2027	3	9	Septiembre	24	Viernes	5	f
20270925	2027-09-25	2027	3	9	Septiembre	25	Sábado	6	t
20270926	2027-09-26	2027	3	9	Septiembre	26	Domingo	7	t
20270927	2027-09-27	2027	3	9	Septiembre	27	Lunes	1	f
20270928	2027-09-28	2027	3	9	Septiembre	28	Martes	2	f
20270929	2027-09-29	2027	3	9	Septiembre	29	Miércoles	3	f
20270930	2027-09-30	2027	3	9	Septiembre	30	Jueves	4	f
20271001	2027-10-01	2027	4	10	Octubre	1	Viernes	5	f
20271002	2027-10-02	2027	4	10	Octubre	2	Sábado	6	t
20271003	2027-10-03	2027	4	10	Octubre	3	Domingo	7	t
20271004	2027-10-04	2027	4	10	Octubre	4	Lunes	1	f
20271005	2027-10-05	2027	4	10	Octubre	5	Martes	2	f
20271006	2027-10-06	2027	4	10	Octubre	6	Miércoles	3	f
20271007	2027-10-07	2027	4	10	Octubre	7	Jueves	4	f
20271008	2027-10-08	2027	4	10	Octubre	8	Viernes	5	f
20271009	2027-10-09	2027	4	10	Octubre	9	Sábado	6	t
20271010	2027-10-10	2027	4	10	Octubre	10	Domingo	7	t
20271011	2027-10-11	2027	4	10	Octubre	11	Lunes	1	f
20271012	2027-10-12	2027	4	10	Octubre	12	Martes	2	f
20271013	2027-10-13	2027	4	10	Octubre	13	Miércoles	3	f
20271014	2027-10-14	2027	4	10	Octubre	14	Jueves	4	f
20271015	2027-10-15	2027	4	10	Octubre	15	Viernes	5	f
20271016	2027-10-16	2027	4	10	Octubre	16	Sábado	6	t
20271017	2027-10-17	2027	4	10	Octubre	17	Domingo	7	t
20271018	2027-10-18	2027	4	10	Octubre	18	Lunes	1	f
20271019	2027-10-19	2027	4	10	Octubre	19	Martes	2	f
20271020	2027-10-20	2027	4	10	Octubre	20	Miércoles	3	f
20271021	2027-10-21	2027	4	10	Octubre	21	Jueves	4	f
20271022	2027-10-22	2027	4	10	Octubre	22	Viernes	5	f
20271023	2027-10-23	2027	4	10	Octubre	23	Sábado	6	t
20271024	2027-10-24	2027	4	10	Octubre	24	Domingo	7	t
20271025	2027-10-25	2027	4	10	Octubre	25	Lunes	1	f
20271026	2027-10-26	2027	4	10	Octubre	26	Martes	2	f
20271027	2027-10-27	2027	4	10	Octubre	27	Miércoles	3	f
20271028	2027-10-28	2027	4	10	Octubre	28	Jueves	4	f
20271029	2027-10-29	2027	4	10	Octubre	29	Viernes	5	f
20271030	2027-10-30	2027	4	10	Octubre	30	Sábado	6	t
20271031	2027-10-31	2027	4	10	Octubre	31	Domingo	7	t
20271101	2027-11-01	2027	4	11	Noviembre	1	Lunes	1	f
20271102	2027-11-02	2027	4	11	Noviembre	2	Martes	2	f
20271103	2027-11-03	2027	4	11	Noviembre	3	Miércoles	3	f
20271104	2027-11-04	2027	4	11	Noviembre	4	Jueves	4	f
20271105	2027-11-05	2027	4	11	Noviembre	5	Viernes	5	f
20271106	2027-11-06	2027	4	11	Noviembre	6	Sábado	6	t
20271107	2027-11-07	2027	4	11	Noviembre	7	Domingo	7	t
20271108	2027-11-08	2027	4	11	Noviembre	8	Lunes	1	f
20271109	2027-11-09	2027	4	11	Noviembre	9	Martes	2	f
20271110	2027-11-10	2027	4	11	Noviembre	10	Miércoles	3	f
20271111	2027-11-11	2027	4	11	Noviembre	11	Jueves	4	f
20271112	2027-11-12	2027	4	11	Noviembre	12	Viernes	5	f
20271113	2027-11-13	2027	4	11	Noviembre	13	Sábado	6	t
20271114	2027-11-14	2027	4	11	Noviembre	14	Domingo	7	t
20271115	2027-11-15	2027	4	11	Noviembre	15	Lunes	1	f
20271116	2027-11-16	2027	4	11	Noviembre	16	Martes	2	f
20271117	2027-11-17	2027	4	11	Noviembre	17	Miércoles	3	f
20271118	2027-11-18	2027	4	11	Noviembre	18	Jueves	4	f
20271119	2027-11-19	2027	4	11	Noviembre	19	Viernes	5	f
20271120	2027-11-20	2027	4	11	Noviembre	20	Sábado	6	t
20271121	2027-11-21	2027	4	11	Noviembre	21	Domingo	7	t
20271122	2027-11-22	2027	4	11	Noviembre	22	Lunes	1	f
20271123	2027-11-23	2027	4	11	Noviembre	23	Martes	2	f
20271124	2027-11-24	2027	4	11	Noviembre	24	Miércoles	3	f
20271125	2027-11-25	2027	4	11	Noviembre	25	Jueves	4	f
20271126	2027-11-26	2027	4	11	Noviembre	26	Viernes	5	f
20271127	2027-11-27	2027	4	11	Noviembre	27	Sábado	6	t
20271128	2027-11-28	2027	4	11	Noviembre	28	Domingo	7	t
20271129	2027-11-29	2027	4	11	Noviembre	29	Lunes	1	f
20271130	2027-11-30	2027	4	11	Noviembre	30	Martes	2	f
20271201	2027-12-01	2027	4	12	Diciembre	1	Miércoles	3	f
20271202	2027-12-02	2027	4	12	Diciembre	2	Jueves	4	f
20271203	2027-12-03	2027	4	12	Diciembre	3	Viernes	5	f
20271204	2027-12-04	2027	4	12	Diciembre	4	Sábado	6	t
20271205	2027-12-05	2027	4	12	Diciembre	5	Domingo	7	t
20271206	2027-12-06	2027	4	12	Diciembre	6	Lunes	1	f
20271207	2027-12-07	2027	4	12	Diciembre	7	Martes	2	f
20271208	2027-12-08	2027	4	12	Diciembre	8	Miércoles	3	f
20271209	2027-12-09	2027	4	12	Diciembre	9	Jueves	4	f
20271210	2027-12-10	2027	4	12	Diciembre	10	Viernes	5	f
20271211	2027-12-11	2027	4	12	Diciembre	11	Sábado	6	t
20271212	2027-12-12	2027	4	12	Diciembre	12	Domingo	7	t
20271213	2027-12-13	2027	4	12	Diciembre	13	Lunes	1	f
20271214	2027-12-14	2027	4	12	Diciembre	14	Martes	2	f
20271215	2027-12-15	2027	4	12	Diciembre	15	Miércoles	3	f
20271216	2027-12-16	2027	4	12	Diciembre	16	Jueves	4	f
20271217	2027-12-17	2027	4	12	Diciembre	17	Viernes	5	f
20271218	2027-12-18	2027	4	12	Diciembre	18	Sábado	6	t
20271219	2027-12-19	2027	4	12	Diciembre	19	Domingo	7	t
20271220	2027-12-20	2027	4	12	Diciembre	20	Lunes	1	f
20271221	2027-12-21	2027	4	12	Diciembre	21	Martes	2	f
20271222	2027-12-22	2027	4	12	Diciembre	22	Miércoles	3	f
20271223	2027-12-23	2027	4	12	Diciembre	23	Jueves	4	f
20271224	2027-12-24	2027	4	12	Diciembre	24	Viernes	5	f
20271225	2027-12-25	2027	4	12	Diciembre	25	Sábado	6	t
20271226	2027-12-26	2027	4	12	Diciembre	26	Domingo	7	t
20271227	2027-12-27	2027	4	12	Diciembre	27	Lunes	1	f
20271228	2027-12-28	2027	4	12	Diciembre	28	Martes	2	f
20271229	2027-12-29	2027	4	12	Diciembre	29	Miércoles	3	f
20271230	2027-12-30	2027	4	12	Diciembre	30	Jueves	4	f
20271231	2027-12-31	2027	4	12	Diciembre	31	Viernes	5	f
20280101	2028-01-01	2028	1	1	Enero	1	Sábado	6	t
20280102	2028-01-02	2028	1	1	Enero	2	Domingo	7	t
20280103	2028-01-03	2028	1	1	Enero	3	Lunes	1	f
20280104	2028-01-04	2028	1	1	Enero	4	Martes	2	f
20280105	2028-01-05	2028	1	1	Enero	5	Miércoles	3	f
20280106	2028-01-06	2028	1	1	Enero	6	Jueves	4	f
20280107	2028-01-07	2028	1	1	Enero	7	Viernes	5	f
20280108	2028-01-08	2028	1	1	Enero	8	Sábado	6	t
20280109	2028-01-09	2028	1	1	Enero	9	Domingo	7	t
20280110	2028-01-10	2028	1	1	Enero	10	Lunes	1	f
20280111	2028-01-11	2028	1	1	Enero	11	Martes	2	f
20280112	2028-01-12	2028	1	1	Enero	12	Miércoles	3	f
20280113	2028-01-13	2028	1	1	Enero	13	Jueves	4	f
20280114	2028-01-14	2028	1	1	Enero	14	Viernes	5	f
20280115	2028-01-15	2028	1	1	Enero	15	Sábado	6	t
20280116	2028-01-16	2028	1	1	Enero	16	Domingo	7	t
20280117	2028-01-17	2028	1	1	Enero	17	Lunes	1	f
20280118	2028-01-18	2028	1	1	Enero	18	Martes	2	f
20280119	2028-01-19	2028	1	1	Enero	19	Miércoles	3	f
20280120	2028-01-20	2028	1	1	Enero	20	Jueves	4	f
20280121	2028-01-21	2028	1	1	Enero	21	Viernes	5	f
20280122	2028-01-22	2028	1	1	Enero	22	Sábado	6	t
20280123	2028-01-23	2028	1	1	Enero	23	Domingo	7	t
20280124	2028-01-24	2028	1	1	Enero	24	Lunes	1	f
20280125	2028-01-25	2028	1	1	Enero	25	Martes	2	f
20280126	2028-01-26	2028	1	1	Enero	26	Miércoles	3	f
20280127	2028-01-27	2028	1	1	Enero	27	Jueves	4	f
20280128	2028-01-28	2028	1	1	Enero	28	Viernes	5	f
20280129	2028-01-29	2028	1	1	Enero	29	Sábado	6	t
20280130	2028-01-30	2028	1	1	Enero	30	Domingo	7	t
20280131	2028-01-31	2028	1	1	Enero	31	Lunes	1	f
20280201	2028-02-01	2028	1	2	Febrero	1	Martes	2	f
20280202	2028-02-02	2028	1	2	Febrero	2	Miércoles	3	f
20280203	2028-02-03	2028	1	2	Febrero	3	Jueves	4	f
20280204	2028-02-04	2028	1	2	Febrero	4	Viernes	5	f
20280205	2028-02-05	2028	1	2	Febrero	5	Sábado	6	t
20280206	2028-02-06	2028	1	2	Febrero	6	Domingo	7	t
20280207	2028-02-07	2028	1	2	Febrero	7	Lunes	1	f
20280208	2028-02-08	2028	1	2	Febrero	8	Martes	2	f
20280209	2028-02-09	2028	1	2	Febrero	9	Miércoles	3	f
20280210	2028-02-10	2028	1	2	Febrero	10	Jueves	4	f
20280211	2028-02-11	2028	1	2	Febrero	11	Viernes	5	f
20280212	2028-02-12	2028	1	2	Febrero	12	Sábado	6	t
20280213	2028-02-13	2028	1	2	Febrero	13	Domingo	7	t
20280214	2028-02-14	2028	1	2	Febrero	14	Lunes	1	f
20280215	2028-02-15	2028	1	2	Febrero	15	Martes	2	f
20280216	2028-02-16	2028	1	2	Febrero	16	Miércoles	3	f
20280217	2028-02-17	2028	1	2	Febrero	17	Jueves	4	f
20280218	2028-02-18	2028	1	2	Febrero	18	Viernes	5	f
20280219	2028-02-19	2028	1	2	Febrero	19	Sábado	6	t
20280220	2028-02-20	2028	1	2	Febrero	20	Domingo	7	t
20280221	2028-02-21	2028	1	2	Febrero	21	Lunes	1	f
20280222	2028-02-22	2028	1	2	Febrero	22	Martes	2	f
20280223	2028-02-23	2028	1	2	Febrero	23	Miércoles	3	f
20280224	2028-02-24	2028	1	2	Febrero	24	Jueves	4	f
20280225	2028-02-25	2028	1	2	Febrero	25	Viernes	5	f
20280226	2028-02-26	2028	1	2	Febrero	26	Sábado	6	t
20280227	2028-02-27	2028	1	2	Febrero	27	Domingo	7	t
20280228	2028-02-28	2028	1	2	Febrero	28	Lunes	1	f
20280229	2028-02-29	2028	1	2	Febrero	29	Martes	2	f
20280301	2028-03-01	2028	1	3	Marzo	1	Miércoles	3	f
20280302	2028-03-02	2028	1	3	Marzo	2	Jueves	4	f
20280303	2028-03-03	2028	1	3	Marzo	3	Viernes	5	f
20280304	2028-03-04	2028	1	3	Marzo	4	Sábado	6	t
20280305	2028-03-05	2028	1	3	Marzo	5	Domingo	7	t
20280306	2028-03-06	2028	1	3	Marzo	6	Lunes	1	f
20280307	2028-03-07	2028	1	3	Marzo	7	Martes	2	f
20280308	2028-03-08	2028	1	3	Marzo	8	Miércoles	3	f
20280309	2028-03-09	2028	1	3	Marzo	9	Jueves	4	f
20280310	2028-03-10	2028	1	3	Marzo	10	Viernes	5	f
20280311	2028-03-11	2028	1	3	Marzo	11	Sábado	6	t
20280312	2028-03-12	2028	1	3	Marzo	12	Domingo	7	t
20280313	2028-03-13	2028	1	3	Marzo	13	Lunes	1	f
20280314	2028-03-14	2028	1	3	Marzo	14	Martes	2	f
20280315	2028-03-15	2028	1	3	Marzo	15	Miércoles	3	f
20280316	2028-03-16	2028	1	3	Marzo	16	Jueves	4	f
20280317	2028-03-17	2028	1	3	Marzo	17	Viernes	5	f
20280318	2028-03-18	2028	1	3	Marzo	18	Sábado	6	t
20280319	2028-03-19	2028	1	3	Marzo	19	Domingo	7	t
20280320	2028-03-20	2028	1	3	Marzo	20	Lunes	1	f
20280321	2028-03-21	2028	1	3	Marzo	21	Martes	2	f
20280322	2028-03-22	2028	1	3	Marzo	22	Miércoles	3	f
20280323	2028-03-23	2028	1	3	Marzo	23	Jueves	4	f
20280324	2028-03-24	2028	1	3	Marzo	24	Viernes	5	f
20280325	2028-03-25	2028	1	3	Marzo	25	Sábado	6	t
20280326	2028-03-26	2028	1	3	Marzo	26	Domingo	7	t
20280327	2028-03-27	2028	1	3	Marzo	27	Lunes	1	f
20280328	2028-03-28	2028	1	3	Marzo	28	Martes	2	f
20280329	2028-03-29	2028	1	3	Marzo	29	Miércoles	3	f
20280330	2028-03-30	2028	1	3	Marzo	30	Jueves	4	f
20280331	2028-03-31	2028	1	3	Marzo	31	Viernes	5	f
20280401	2028-04-01	2028	2	4	Abril	1	Sábado	6	t
20280402	2028-04-02	2028	2	4	Abril	2	Domingo	7	t
20280403	2028-04-03	2028	2	4	Abril	3	Lunes	1	f
20280404	2028-04-04	2028	2	4	Abril	4	Martes	2	f
20280405	2028-04-05	2028	2	4	Abril	5	Miércoles	3	f
20280406	2028-04-06	2028	2	4	Abril	6	Jueves	4	f
20280407	2028-04-07	2028	2	4	Abril	7	Viernes	5	f
20280408	2028-04-08	2028	2	4	Abril	8	Sábado	6	t
20280409	2028-04-09	2028	2	4	Abril	9	Domingo	7	t
20280410	2028-04-10	2028	2	4	Abril	10	Lunes	1	f
20280411	2028-04-11	2028	2	4	Abril	11	Martes	2	f
20280412	2028-04-12	2028	2	4	Abril	12	Miércoles	3	f
20280413	2028-04-13	2028	2	4	Abril	13	Jueves	4	f
20280414	2028-04-14	2028	2	4	Abril	14	Viernes	5	f
20280415	2028-04-15	2028	2	4	Abril	15	Sábado	6	t
20280416	2028-04-16	2028	2	4	Abril	16	Domingo	7	t
20280417	2028-04-17	2028	2	4	Abril	17	Lunes	1	f
20280418	2028-04-18	2028	2	4	Abril	18	Martes	2	f
20280419	2028-04-19	2028	2	4	Abril	19	Miércoles	3	f
20280420	2028-04-20	2028	2	4	Abril	20	Jueves	4	f
20280421	2028-04-21	2028	2	4	Abril	21	Viernes	5	f
20280422	2028-04-22	2028	2	4	Abril	22	Sábado	6	t
20280423	2028-04-23	2028	2	4	Abril	23	Domingo	7	t
20280424	2028-04-24	2028	2	4	Abril	24	Lunes	1	f
20280425	2028-04-25	2028	2	4	Abril	25	Martes	2	f
20280426	2028-04-26	2028	2	4	Abril	26	Miércoles	3	f
20280427	2028-04-27	2028	2	4	Abril	27	Jueves	4	f
20280428	2028-04-28	2028	2	4	Abril	28	Viernes	5	f
20280429	2028-04-29	2028	2	4	Abril	29	Sábado	6	t
20280430	2028-04-30	2028	2	4	Abril	30	Domingo	7	t
20280501	2028-05-01	2028	2	5	Mayo	1	Lunes	1	f
20280502	2028-05-02	2028	2	5	Mayo	2	Martes	2	f
20280503	2028-05-03	2028	2	5	Mayo	3	Miércoles	3	f
20280504	2028-05-04	2028	2	5	Mayo	4	Jueves	4	f
20280505	2028-05-05	2028	2	5	Mayo	5	Viernes	5	f
20280506	2028-05-06	2028	2	5	Mayo	6	Sábado	6	t
20280507	2028-05-07	2028	2	5	Mayo	7	Domingo	7	t
20280508	2028-05-08	2028	2	5	Mayo	8	Lunes	1	f
20280509	2028-05-09	2028	2	5	Mayo	9	Martes	2	f
20280510	2028-05-10	2028	2	5	Mayo	10	Miércoles	3	f
20280511	2028-05-11	2028	2	5	Mayo	11	Jueves	4	f
20280512	2028-05-12	2028	2	5	Mayo	12	Viernes	5	f
20280513	2028-05-13	2028	2	5	Mayo	13	Sábado	6	t
20280514	2028-05-14	2028	2	5	Mayo	14	Domingo	7	t
20280515	2028-05-15	2028	2	5	Mayo	15	Lunes	1	f
20280516	2028-05-16	2028	2	5	Mayo	16	Martes	2	f
20280517	2028-05-17	2028	2	5	Mayo	17	Miércoles	3	f
20280518	2028-05-18	2028	2	5	Mayo	18	Jueves	4	f
20280519	2028-05-19	2028	2	5	Mayo	19	Viernes	5	f
20280520	2028-05-20	2028	2	5	Mayo	20	Sábado	6	t
20280521	2028-05-21	2028	2	5	Mayo	21	Domingo	7	t
20280522	2028-05-22	2028	2	5	Mayo	22	Lunes	1	f
20280523	2028-05-23	2028	2	5	Mayo	23	Martes	2	f
20280524	2028-05-24	2028	2	5	Mayo	24	Miércoles	3	f
20280525	2028-05-25	2028	2	5	Mayo	25	Jueves	4	f
20280526	2028-05-26	2028	2	5	Mayo	26	Viernes	5	f
20280527	2028-05-27	2028	2	5	Mayo	27	Sábado	6	t
20280528	2028-05-28	2028	2	5	Mayo	28	Domingo	7	t
20280529	2028-05-29	2028	2	5	Mayo	29	Lunes	1	f
20280530	2028-05-30	2028	2	5	Mayo	30	Martes	2	f
20280531	2028-05-31	2028	2	5	Mayo	31	Miércoles	3	f
20280601	2028-06-01	2028	2	6	Junio	1	Jueves	4	f
20280602	2028-06-02	2028	2	6	Junio	2	Viernes	5	f
20280603	2028-06-03	2028	2	6	Junio	3	Sábado	6	t
20280604	2028-06-04	2028	2	6	Junio	4	Domingo	7	t
20280605	2028-06-05	2028	2	6	Junio	5	Lunes	1	f
20280606	2028-06-06	2028	2	6	Junio	6	Martes	2	f
20280607	2028-06-07	2028	2	6	Junio	7	Miércoles	3	f
20280608	2028-06-08	2028	2	6	Junio	8	Jueves	4	f
20280609	2028-06-09	2028	2	6	Junio	9	Viernes	5	f
20280610	2028-06-10	2028	2	6	Junio	10	Sábado	6	t
20280611	2028-06-11	2028	2	6	Junio	11	Domingo	7	t
20280612	2028-06-12	2028	2	6	Junio	12	Lunes	1	f
20280613	2028-06-13	2028	2	6	Junio	13	Martes	2	f
20280614	2028-06-14	2028	2	6	Junio	14	Miércoles	3	f
20280615	2028-06-15	2028	2	6	Junio	15	Jueves	4	f
20280616	2028-06-16	2028	2	6	Junio	16	Viernes	5	f
20280617	2028-06-17	2028	2	6	Junio	17	Sábado	6	t
20280618	2028-06-18	2028	2	6	Junio	18	Domingo	7	t
20280619	2028-06-19	2028	2	6	Junio	19	Lunes	1	f
20280620	2028-06-20	2028	2	6	Junio	20	Martes	2	f
20280621	2028-06-21	2028	2	6	Junio	21	Miércoles	3	f
20280622	2028-06-22	2028	2	6	Junio	22	Jueves	4	f
20280623	2028-06-23	2028	2	6	Junio	23	Viernes	5	f
20280624	2028-06-24	2028	2	6	Junio	24	Sábado	6	t
20280625	2028-06-25	2028	2	6	Junio	25	Domingo	7	t
20280626	2028-06-26	2028	2	6	Junio	26	Lunes	1	f
20280627	2028-06-27	2028	2	6	Junio	27	Martes	2	f
20280628	2028-06-28	2028	2	6	Junio	28	Miércoles	3	f
20280629	2028-06-29	2028	2	6	Junio	29	Jueves	4	f
20280630	2028-06-30	2028	2	6	Junio	30	Viernes	5	f
20280701	2028-07-01	2028	3	7	Julio	1	Sábado	6	t
20280702	2028-07-02	2028	3	7	Julio	2	Domingo	7	t
20280703	2028-07-03	2028	3	7	Julio	3	Lunes	1	f
20280704	2028-07-04	2028	3	7	Julio	4	Martes	2	f
20280705	2028-07-05	2028	3	7	Julio	5	Miércoles	3	f
20280706	2028-07-06	2028	3	7	Julio	6	Jueves	4	f
20280707	2028-07-07	2028	3	7	Julio	7	Viernes	5	f
20280708	2028-07-08	2028	3	7	Julio	8	Sábado	6	t
20280709	2028-07-09	2028	3	7	Julio	9	Domingo	7	t
20280710	2028-07-10	2028	3	7	Julio	10	Lunes	1	f
20280711	2028-07-11	2028	3	7	Julio	11	Martes	2	f
20280712	2028-07-12	2028	3	7	Julio	12	Miércoles	3	f
20280713	2028-07-13	2028	3	7	Julio	13	Jueves	4	f
20280714	2028-07-14	2028	3	7	Julio	14	Viernes	5	f
20280715	2028-07-15	2028	3	7	Julio	15	Sábado	6	t
20280716	2028-07-16	2028	3	7	Julio	16	Domingo	7	t
20280717	2028-07-17	2028	3	7	Julio	17	Lunes	1	f
20280718	2028-07-18	2028	3	7	Julio	18	Martes	2	f
20280719	2028-07-19	2028	3	7	Julio	19	Miércoles	3	f
20280720	2028-07-20	2028	3	7	Julio	20	Jueves	4	f
20280721	2028-07-21	2028	3	7	Julio	21	Viernes	5	f
20280722	2028-07-22	2028	3	7	Julio	22	Sábado	6	t
20280723	2028-07-23	2028	3	7	Julio	23	Domingo	7	t
20280724	2028-07-24	2028	3	7	Julio	24	Lunes	1	f
20280725	2028-07-25	2028	3	7	Julio	25	Martes	2	f
20280726	2028-07-26	2028	3	7	Julio	26	Miércoles	3	f
20280727	2028-07-27	2028	3	7	Julio	27	Jueves	4	f
20280728	2028-07-28	2028	3	7	Julio	28	Viernes	5	f
20280729	2028-07-29	2028	3	7	Julio	29	Sábado	6	t
20280730	2028-07-30	2028	3	7	Julio	30	Domingo	7	t
20280731	2028-07-31	2028	3	7	Julio	31	Lunes	1	f
20280801	2028-08-01	2028	3	8	Agosto	1	Martes	2	f
20280802	2028-08-02	2028	3	8	Agosto	2	Miércoles	3	f
20280803	2028-08-03	2028	3	8	Agosto	3	Jueves	4	f
20280804	2028-08-04	2028	3	8	Agosto	4	Viernes	5	f
20280805	2028-08-05	2028	3	8	Agosto	5	Sábado	6	t
20280806	2028-08-06	2028	3	8	Agosto	6	Domingo	7	t
20280807	2028-08-07	2028	3	8	Agosto	7	Lunes	1	f
20280808	2028-08-08	2028	3	8	Agosto	8	Martes	2	f
20280809	2028-08-09	2028	3	8	Agosto	9	Miércoles	3	f
20280810	2028-08-10	2028	3	8	Agosto	10	Jueves	4	f
20280811	2028-08-11	2028	3	8	Agosto	11	Viernes	5	f
20280812	2028-08-12	2028	3	8	Agosto	12	Sábado	6	t
20280813	2028-08-13	2028	3	8	Agosto	13	Domingo	7	t
20280814	2028-08-14	2028	3	8	Agosto	14	Lunes	1	f
20280815	2028-08-15	2028	3	8	Agosto	15	Martes	2	f
20280816	2028-08-16	2028	3	8	Agosto	16	Miércoles	3	f
20280817	2028-08-17	2028	3	8	Agosto	17	Jueves	4	f
20280818	2028-08-18	2028	3	8	Agosto	18	Viernes	5	f
20280819	2028-08-19	2028	3	8	Agosto	19	Sábado	6	t
20280820	2028-08-20	2028	3	8	Agosto	20	Domingo	7	t
20280821	2028-08-21	2028	3	8	Agosto	21	Lunes	1	f
20280822	2028-08-22	2028	3	8	Agosto	22	Martes	2	f
20280823	2028-08-23	2028	3	8	Agosto	23	Miércoles	3	f
20280824	2028-08-24	2028	3	8	Agosto	24	Jueves	4	f
20280825	2028-08-25	2028	3	8	Agosto	25	Viernes	5	f
20280826	2028-08-26	2028	3	8	Agosto	26	Sábado	6	t
20280827	2028-08-27	2028	3	8	Agosto	27	Domingo	7	t
20280828	2028-08-28	2028	3	8	Agosto	28	Lunes	1	f
20280829	2028-08-29	2028	3	8	Agosto	29	Martes	2	f
20280830	2028-08-30	2028	3	8	Agosto	30	Miércoles	3	f
20280831	2028-08-31	2028	3	8	Agosto	31	Jueves	4	f
20280901	2028-09-01	2028	3	9	Septiembre	1	Viernes	5	f
20280902	2028-09-02	2028	3	9	Septiembre	2	Sábado	6	t
20280903	2028-09-03	2028	3	9	Septiembre	3	Domingo	7	t
20280904	2028-09-04	2028	3	9	Septiembre	4	Lunes	1	f
20280905	2028-09-05	2028	3	9	Septiembre	5	Martes	2	f
20280906	2028-09-06	2028	3	9	Septiembre	6	Miércoles	3	f
20280907	2028-09-07	2028	3	9	Septiembre	7	Jueves	4	f
20280908	2028-09-08	2028	3	9	Septiembre	8	Viernes	5	f
20280909	2028-09-09	2028	3	9	Septiembre	9	Sábado	6	t
20280910	2028-09-10	2028	3	9	Septiembre	10	Domingo	7	t
20280911	2028-09-11	2028	3	9	Septiembre	11	Lunes	1	f
20280912	2028-09-12	2028	3	9	Septiembre	12	Martes	2	f
20280913	2028-09-13	2028	3	9	Septiembre	13	Miércoles	3	f
20280914	2028-09-14	2028	3	9	Septiembre	14	Jueves	4	f
20280915	2028-09-15	2028	3	9	Septiembre	15	Viernes	5	f
20280916	2028-09-16	2028	3	9	Septiembre	16	Sábado	6	t
20280917	2028-09-17	2028	3	9	Septiembre	17	Domingo	7	t
20280918	2028-09-18	2028	3	9	Septiembre	18	Lunes	1	f
20280919	2028-09-19	2028	3	9	Septiembre	19	Martes	2	f
20280920	2028-09-20	2028	3	9	Septiembre	20	Miércoles	3	f
20280921	2028-09-21	2028	3	9	Septiembre	21	Jueves	4	f
20280922	2028-09-22	2028	3	9	Septiembre	22	Viernes	5	f
20280923	2028-09-23	2028	3	9	Septiembre	23	Sábado	6	t
20280924	2028-09-24	2028	3	9	Septiembre	24	Domingo	7	t
20280925	2028-09-25	2028	3	9	Septiembre	25	Lunes	1	f
20280926	2028-09-26	2028	3	9	Septiembre	26	Martes	2	f
20280927	2028-09-27	2028	3	9	Septiembre	27	Miércoles	3	f
20280928	2028-09-28	2028	3	9	Septiembre	28	Jueves	4	f
20280929	2028-09-29	2028	3	9	Septiembre	29	Viernes	5	f
20280930	2028-09-30	2028	3	9	Septiembre	30	Sábado	6	t
20281001	2028-10-01	2028	4	10	Octubre	1	Domingo	7	t
20281002	2028-10-02	2028	4	10	Octubre	2	Lunes	1	f
20281003	2028-10-03	2028	4	10	Octubre	3	Martes	2	f
20281004	2028-10-04	2028	4	10	Octubre	4	Miércoles	3	f
20281005	2028-10-05	2028	4	10	Octubre	5	Jueves	4	f
20281006	2028-10-06	2028	4	10	Octubre	6	Viernes	5	f
20281007	2028-10-07	2028	4	10	Octubre	7	Sábado	6	t
20281008	2028-10-08	2028	4	10	Octubre	8	Domingo	7	t
20281009	2028-10-09	2028	4	10	Octubre	9	Lunes	1	f
20281010	2028-10-10	2028	4	10	Octubre	10	Martes	2	f
20281011	2028-10-11	2028	4	10	Octubre	11	Miércoles	3	f
20281012	2028-10-12	2028	4	10	Octubre	12	Jueves	4	f
20281013	2028-10-13	2028	4	10	Octubre	13	Viernes	5	f
20281014	2028-10-14	2028	4	10	Octubre	14	Sábado	6	t
20281015	2028-10-15	2028	4	10	Octubre	15	Domingo	7	t
20281016	2028-10-16	2028	4	10	Octubre	16	Lunes	1	f
20281017	2028-10-17	2028	4	10	Octubre	17	Martes	2	f
20281018	2028-10-18	2028	4	10	Octubre	18	Miércoles	3	f
20281019	2028-10-19	2028	4	10	Octubre	19	Jueves	4	f
20281020	2028-10-20	2028	4	10	Octubre	20	Viernes	5	f
20281021	2028-10-21	2028	4	10	Octubre	21	Sábado	6	t
20281022	2028-10-22	2028	4	10	Octubre	22	Domingo	7	t
20281023	2028-10-23	2028	4	10	Octubre	23	Lunes	1	f
20281024	2028-10-24	2028	4	10	Octubre	24	Martes	2	f
20281025	2028-10-25	2028	4	10	Octubre	25	Miércoles	3	f
20281026	2028-10-26	2028	4	10	Octubre	26	Jueves	4	f
20281027	2028-10-27	2028	4	10	Octubre	27	Viernes	5	f
20281028	2028-10-28	2028	4	10	Octubre	28	Sábado	6	t
20281029	2028-10-29	2028	4	10	Octubre	29	Domingo	7	t
20281030	2028-10-30	2028	4	10	Octubre	30	Lunes	1	f
20281031	2028-10-31	2028	4	10	Octubre	31	Martes	2	f
20281101	2028-11-01	2028	4	11	Noviembre	1	Miércoles	3	f
20281102	2028-11-02	2028	4	11	Noviembre	2	Jueves	4	f
20281103	2028-11-03	2028	4	11	Noviembre	3	Viernes	5	f
20281104	2028-11-04	2028	4	11	Noviembre	4	Sábado	6	t
20281105	2028-11-05	2028	4	11	Noviembre	5	Domingo	7	t
20281106	2028-11-06	2028	4	11	Noviembre	6	Lunes	1	f
20281107	2028-11-07	2028	4	11	Noviembre	7	Martes	2	f
20281108	2028-11-08	2028	4	11	Noviembre	8	Miércoles	3	f
20281109	2028-11-09	2028	4	11	Noviembre	9	Jueves	4	f
20281110	2028-11-10	2028	4	11	Noviembre	10	Viernes	5	f
20281111	2028-11-11	2028	4	11	Noviembre	11	Sábado	6	t
20281112	2028-11-12	2028	4	11	Noviembre	12	Domingo	7	t
20281113	2028-11-13	2028	4	11	Noviembre	13	Lunes	1	f
20281114	2028-11-14	2028	4	11	Noviembre	14	Martes	2	f
20281115	2028-11-15	2028	4	11	Noviembre	15	Miércoles	3	f
20281116	2028-11-16	2028	4	11	Noviembre	16	Jueves	4	f
20281117	2028-11-17	2028	4	11	Noviembre	17	Viernes	5	f
20281118	2028-11-18	2028	4	11	Noviembre	18	Sábado	6	t
20281119	2028-11-19	2028	4	11	Noviembre	19	Domingo	7	t
20281120	2028-11-20	2028	4	11	Noviembre	20	Lunes	1	f
20281121	2028-11-21	2028	4	11	Noviembre	21	Martes	2	f
20281122	2028-11-22	2028	4	11	Noviembre	22	Miércoles	3	f
20281123	2028-11-23	2028	4	11	Noviembre	23	Jueves	4	f
20281124	2028-11-24	2028	4	11	Noviembre	24	Viernes	5	f
20281125	2028-11-25	2028	4	11	Noviembre	25	Sábado	6	t
20281126	2028-11-26	2028	4	11	Noviembre	26	Domingo	7	t
20281127	2028-11-27	2028	4	11	Noviembre	27	Lunes	1	f
20281128	2028-11-28	2028	4	11	Noviembre	28	Martes	2	f
20281129	2028-11-29	2028	4	11	Noviembre	29	Miércoles	3	f
20281130	2028-11-30	2028	4	11	Noviembre	30	Jueves	4	f
20281201	2028-12-01	2028	4	12	Diciembre	1	Viernes	5	f
20281202	2028-12-02	2028	4	12	Diciembre	2	Sábado	6	t
20281203	2028-12-03	2028	4	12	Diciembre	3	Domingo	7	t
20281204	2028-12-04	2028	4	12	Diciembre	4	Lunes	1	f
20281205	2028-12-05	2028	4	12	Diciembre	5	Martes	2	f
20281206	2028-12-06	2028	4	12	Diciembre	6	Miércoles	3	f
20281207	2028-12-07	2028	4	12	Diciembre	7	Jueves	4	f
20281208	2028-12-08	2028	4	12	Diciembre	8	Viernes	5	f
20281209	2028-12-09	2028	4	12	Diciembre	9	Sábado	6	t
20281210	2028-12-10	2028	4	12	Diciembre	10	Domingo	7	t
20281211	2028-12-11	2028	4	12	Diciembre	11	Lunes	1	f
20281212	2028-12-12	2028	4	12	Diciembre	12	Martes	2	f
20281213	2028-12-13	2028	4	12	Diciembre	13	Miércoles	3	f
20281214	2028-12-14	2028	4	12	Diciembre	14	Jueves	4	f
20281215	2028-12-15	2028	4	12	Diciembre	15	Viernes	5	f
20281216	2028-12-16	2028	4	12	Diciembre	16	Sábado	6	t
20281217	2028-12-17	2028	4	12	Diciembre	17	Domingo	7	t
20281218	2028-12-18	2028	4	12	Diciembre	18	Lunes	1	f
20281219	2028-12-19	2028	4	12	Diciembre	19	Martes	2	f
20281220	2028-12-20	2028	4	12	Diciembre	20	Miércoles	3	f
20281221	2028-12-21	2028	4	12	Diciembre	21	Jueves	4	f
20281222	2028-12-22	2028	4	12	Diciembre	22	Viernes	5	f
20281223	2028-12-23	2028	4	12	Diciembre	23	Sábado	6	t
20281224	2028-12-24	2028	4	12	Diciembre	24	Domingo	7	t
20281225	2028-12-25	2028	4	12	Diciembre	25	Lunes	1	f
20281226	2028-12-26	2028	4	12	Diciembre	26	Martes	2	f
20281227	2028-12-27	2028	4	12	Diciembre	27	Miércoles	3	f
20281228	2028-12-28	2028	4	12	Diciembre	28	Jueves	4	f
20281229	2028-12-29	2028	4	12	Diciembre	29	Viernes	5	f
20281230	2028-12-30	2028	4	12	Diciembre	30	Sábado	6	t
20281231	2028-12-31	2028	4	12	Diciembre	31	Domingo	7	t
20290101	2029-01-01	2029	1	1	Enero	1	Lunes	1	f
20290102	2029-01-02	2029	1	1	Enero	2	Martes	2	f
20290103	2029-01-03	2029	1	1	Enero	3	Miércoles	3	f
20290104	2029-01-04	2029	1	1	Enero	4	Jueves	4	f
20290105	2029-01-05	2029	1	1	Enero	5	Viernes	5	f
20290106	2029-01-06	2029	1	1	Enero	6	Sábado	6	t
20290107	2029-01-07	2029	1	1	Enero	7	Domingo	7	t
20290108	2029-01-08	2029	1	1	Enero	8	Lunes	1	f
20290109	2029-01-09	2029	1	1	Enero	9	Martes	2	f
20290110	2029-01-10	2029	1	1	Enero	10	Miércoles	3	f
20290111	2029-01-11	2029	1	1	Enero	11	Jueves	4	f
20290112	2029-01-12	2029	1	1	Enero	12	Viernes	5	f
20290113	2029-01-13	2029	1	1	Enero	13	Sábado	6	t
20290114	2029-01-14	2029	1	1	Enero	14	Domingo	7	t
20290115	2029-01-15	2029	1	1	Enero	15	Lunes	1	f
20290116	2029-01-16	2029	1	1	Enero	16	Martes	2	f
20290117	2029-01-17	2029	1	1	Enero	17	Miércoles	3	f
20290118	2029-01-18	2029	1	1	Enero	18	Jueves	4	f
20290119	2029-01-19	2029	1	1	Enero	19	Viernes	5	f
20290120	2029-01-20	2029	1	1	Enero	20	Sábado	6	t
20290121	2029-01-21	2029	1	1	Enero	21	Domingo	7	t
20290122	2029-01-22	2029	1	1	Enero	22	Lunes	1	f
20290123	2029-01-23	2029	1	1	Enero	23	Martes	2	f
20290124	2029-01-24	2029	1	1	Enero	24	Miércoles	3	f
20290125	2029-01-25	2029	1	1	Enero	25	Jueves	4	f
20290126	2029-01-26	2029	1	1	Enero	26	Viernes	5	f
20290127	2029-01-27	2029	1	1	Enero	27	Sábado	6	t
20290128	2029-01-28	2029	1	1	Enero	28	Domingo	7	t
20290129	2029-01-29	2029	1	1	Enero	29	Lunes	1	f
20290130	2029-01-30	2029	1	1	Enero	30	Martes	2	f
20290131	2029-01-31	2029	1	1	Enero	31	Miércoles	3	f
20290201	2029-02-01	2029	1	2	Febrero	1	Jueves	4	f
20290202	2029-02-02	2029	1	2	Febrero	2	Viernes	5	f
20290203	2029-02-03	2029	1	2	Febrero	3	Sábado	6	t
20290204	2029-02-04	2029	1	2	Febrero	4	Domingo	7	t
20290205	2029-02-05	2029	1	2	Febrero	5	Lunes	1	f
20290206	2029-02-06	2029	1	2	Febrero	6	Martes	2	f
20290207	2029-02-07	2029	1	2	Febrero	7	Miércoles	3	f
20290208	2029-02-08	2029	1	2	Febrero	8	Jueves	4	f
20290209	2029-02-09	2029	1	2	Febrero	9	Viernes	5	f
20290210	2029-02-10	2029	1	2	Febrero	10	Sábado	6	t
20290211	2029-02-11	2029	1	2	Febrero	11	Domingo	7	t
20290212	2029-02-12	2029	1	2	Febrero	12	Lunes	1	f
20290213	2029-02-13	2029	1	2	Febrero	13	Martes	2	f
20290214	2029-02-14	2029	1	2	Febrero	14	Miércoles	3	f
20290215	2029-02-15	2029	1	2	Febrero	15	Jueves	4	f
20290216	2029-02-16	2029	1	2	Febrero	16	Viernes	5	f
20290217	2029-02-17	2029	1	2	Febrero	17	Sábado	6	t
20290218	2029-02-18	2029	1	2	Febrero	18	Domingo	7	t
20290219	2029-02-19	2029	1	2	Febrero	19	Lunes	1	f
20290220	2029-02-20	2029	1	2	Febrero	20	Martes	2	f
20290221	2029-02-21	2029	1	2	Febrero	21	Miércoles	3	f
20290222	2029-02-22	2029	1	2	Febrero	22	Jueves	4	f
20290223	2029-02-23	2029	1	2	Febrero	23	Viernes	5	f
20290224	2029-02-24	2029	1	2	Febrero	24	Sábado	6	t
20290225	2029-02-25	2029	1	2	Febrero	25	Domingo	7	t
20290226	2029-02-26	2029	1	2	Febrero	26	Lunes	1	f
20290227	2029-02-27	2029	1	2	Febrero	27	Martes	2	f
20290228	2029-02-28	2029	1	2	Febrero	28	Miércoles	3	f
20290301	2029-03-01	2029	1	3	Marzo	1	Jueves	4	f
20290302	2029-03-02	2029	1	3	Marzo	2	Viernes	5	f
20290303	2029-03-03	2029	1	3	Marzo	3	Sábado	6	t
20290304	2029-03-04	2029	1	3	Marzo	4	Domingo	7	t
20290305	2029-03-05	2029	1	3	Marzo	5	Lunes	1	f
20290306	2029-03-06	2029	1	3	Marzo	6	Martes	2	f
20290307	2029-03-07	2029	1	3	Marzo	7	Miércoles	3	f
20290308	2029-03-08	2029	1	3	Marzo	8	Jueves	4	f
20290309	2029-03-09	2029	1	3	Marzo	9	Viernes	5	f
20290310	2029-03-10	2029	1	3	Marzo	10	Sábado	6	t
20290311	2029-03-11	2029	1	3	Marzo	11	Domingo	7	t
20290312	2029-03-12	2029	1	3	Marzo	12	Lunes	1	f
20290313	2029-03-13	2029	1	3	Marzo	13	Martes	2	f
20290314	2029-03-14	2029	1	3	Marzo	14	Miércoles	3	f
20290315	2029-03-15	2029	1	3	Marzo	15	Jueves	4	f
20290316	2029-03-16	2029	1	3	Marzo	16	Viernes	5	f
20290317	2029-03-17	2029	1	3	Marzo	17	Sábado	6	t
20290318	2029-03-18	2029	1	3	Marzo	18	Domingo	7	t
20290319	2029-03-19	2029	1	3	Marzo	19	Lunes	1	f
20290320	2029-03-20	2029	1	3	Marzo	20	Martes	2	f
20290321	2029-03-21	2029	1	3	Marzo	21	Miércoles	3	f
20290322	2029-03-22	2029	1	3	Marzo	22	Jueves	4	f
20290323	2029-03-23	2029	1	3	Marzo	23	Viernes	5	f
20290324	2029-03-24	2029	1	3	Marzo	24	Sábado	6	t
20290325	2029-03-25	2029	1	3	Marzo	25	Domingo	7	t
20290326	2029-03-26	2029	1	3	Marzo	26	Lunes	1	f
20290327	2029-03-27	2029	1	3	Marzo	27	Martes	2	f
20290328	2029-03-28	2029	1	3	Marzo	28	Miércoles	3	f
20290329	2029-03-29	2029	1	3	Marzo	29	Jueves	4	f
20290330	2029-03-30	2029	1	3	Marzo	30	Viernes	5	f
20290331	2029-03-31	2029	1	3	Marzo	31	Sábado	6	t
20290401	2029-04-01	2029	2	4	Abril	1	Domingo	7	t
20290402	2029-04-02	2029	2	4	Abril	2	Lunes	1	f
20290403	2029-04-03	2029	2	4	Abril	3	Martes	2	f
20290404	2029-04-04	2029	2	4	Abril	4	Miércoles	3	f
20290405	2029-04-05	2029	2	4	Abril	5	Jueves	4	f
20290406	2029-04-06	2029	2	4	Abril	6	Viernes	5	f
20290407	2029-04-07	2029	2	4	Abril	7	Sábado	6	t
20290408	2029-04-08	2029	2	4	Abril	8	Domingo	7	t
20290409	2029-04-09	2029	2	4	Abril	9	Lunes	1	f
20290410	2029-04-10	2029	2	4	Abril	10	Martes	2	f
20290411	2029-04-11	2029	2	4	Abril	11	Miércoles	3	f
20290412	2029-04-12	2029	2	4	Abril	12	Jueves	4	f
20290413	2029-04-13	2029	2	4	Abril	13	Viernes	5	f
20290414	2029-04-14	2029	2	4	Abril	14	Sábado	6	t
20290415	2029-04-15	2029	2	4	Abril	15	Domingo	7	t
20290416	2029-04-16	2029	2	4	Abril	16	Lunes	1	f
20290417	2029-04-17	2029	2	4	Abril	17	Martes	2	f
20290418	2029-04-18	2029	2	4	Abril	18	Miércoles	3	f
20290419	2029-04-19	2029	2	4	Abril	19	Jueves	4	f
20290420	2029-04-20	2029	2	4	Abril	20	Viernes	5	f
20290421	2029-04-21	2029	2	4	Abril	21	Sábado	6	t
20290422	2029-04-22	2029	2	4	Abril	22	Domingo	7	t
20290423	2029-04-23	2029	2	4	Abril	23	Lunes	1	f
20290424	2029-04-24	2029	2	4	Abril	24	Martes	2	f
20290425	2029-04-25	2029	2	4	Abril	25	Miércoles	3	f
20290426	2029-04-26	2029	2	4	Abril	26	Jueves	4	f
20290427	2029-04-27	2029	2	4	Abril	27	Viernes	5	f
20290428	2029-04-28	2029	2	4	Abril	28	Sábado	6	t
20290429	2029-04-29	2029	2	4	Abril	29	Domingo	7	t
20290430	2029-04-30	2029	2	4	Abril	30	Lunes	1	f
20290501	2029-05-01	2029	2	5	Mayo	1	Martes	2	f
20290502	2029-05-02	2029	2	5	Mayo	2	Miércoles	3	f
20290503	2029-05-03	2029	2	5	Mayo	3	Jueves	4	f
20290504	2029-05-04	2029	2	5	Mayo	4	Viernes	5	f
20290505	2029-05-05	2029	2	5	Mayo	5	Sábado	6	t
20290506	2029-05-06	2029	2	5	Mayo	6	Domingo	7	t
20290507	2029-05-07	2029	2	5	Mayo	7	Lunes	1	f
20290508	2029-05-08	2029	2	5	Mayo	8	Martes	2	f
20290509	2029-05-09	2029	2	5	Mayo	9	Miércoles	3	f
20290510	2029-05-10	2029	2	5	Mayo	10	Jueves	4	f
20290511	2029-05-11	2029	2	5	Mayo	11	Viernes	5	f
20290512	2029-05-12	2029	2	5	Mayo	12	Sábado	6	t
20290513	2029-05-13	2029	2	5	Mayo	13	Domingo	7	t
20290514	2029-05-14	2029	2	5	Mayo	14	Lunes	1	f
20290515	2029-05-15	2029	2	5	Mayo	15	Martes	2	f
20290516	2029-05-16	2029	2	5	Mayo	16	Miércoles	3	f
20290517	2029-05-17	2029	2	5	Mayo	17	Jueves	4	f
20290518	2029-05-18	2029	2	5	Mayo	18	Viernes	5	f
20290519	2029-05-19	2029	2	5	Mayo	19	Sábado	6	t
20290520	2029-05-20	2029	2	5	Mayo	20	Domingo	7	t
20290521	2029-05-21	2029	2	5	Mayo	21	Lunes	1	f
20290522	2029-05-22	2029	2	5	Mayo	22	Martes	2	f
20290523	2029-05-23	2029	2	5	Mayo	23	Miércoles	3	f
20290524	2029-05-24	2029	2	5	Mayo	24	Jueves	4	f
20290525	2029-05-25	2029	2	5	Mayo	25	Viernes	5	f
20290526	2029-05-26	2029	2	5	Mayo	26	Sábado	6	t
20290527	2029-05-27	2029	2	5	Mayo	27	Domingo	7	t
20290528	2029-05-28	2029	2	5	Mayo	28	Lunes	1	f
20290529	2029-05-29	2029	2	5	Mayo	29	Martes	2	f
20290530	2029-05-30	2029	2	5	Mayo	30	Miércoles	3	f
20290531	2029-05-31	2029	2	5	Mayo	31	Jueves	4	f
20290601	2029-06-01	2029	2	6	Junio	1	Viernes	5	f
20290602	2029-06-02	2029	2	6	Junio	2	Sábado	6	t
20290603	2029-06-03	2029	2	6	Junio	3	Domingo	7	t
20290604	2029-06-04	2029	2	6	Junio	4	Lunes	1	f
20290605	2029-06-05	2029	2	6	Junio	5	Martes	2	f
20290606	2029-06-06	2029	2	6	Junio	6	Miércoles	3	f
20290607	2029-06-07	2029	2	6	Junio	7	Jueves	4	f
20290608	2029-06-08	2029	2	6	Junio	8	Viernes	5	f
20290609	2029-06-09	2029	2	6	Junio	9	Sábado	6	t
20290610	2029-06-10	2029	2	6	Junio	10	Domingo	7	t
20290611	2029-06-11	2029	2	6	Junio	11	Lunes	1	f
20290612	2029-06-12	2029	2	6	Junio	12	Martes	2	f
20290613	2029-06-13	2029	2	6	Junio	13	Miércoles	3	f
20290614	2029-06-14	2029	2	6	Junio	14	Jueves	4	f
20290615	2029-06-15	2029	2	6	Junio	15	Viernes	5	f
20290616	2029-06-16	2029	2	6	Junio	16	Sábado	6	t
20290617	2029-06-17	2029	2	6	Junio	17	Domingo	7	t
20290618	2029-06-18	2029	2	6	Junio	18	Lunes	1	f
20290619	2029-06-19	2029	2	6	Junio	19	Martes	2	f
20290620	2029-06-20	2029	2	6	Junio	20	Miércoles	3	f
20290621	2029-06-21	2029	2	6	Junio	21	Jueves	4	f
20290622	2029-06-22	2029	2	6	Junio	22	Viernes	5	f
20290623	2029-06-23	2029	2	6	Junio	23	Sábado	6	t
20290624	2029-06-24	2029	2	6	Junio	24	Domingo	7	t
20290625	2029-06-25	2029	2	6	Junio	25	Lunes	1	f
20290626	2029-06-26	2029	2	6	Junio	26	Martes	2	f
20290627	2029-06-27	2029	2	6	Junio	27	Miércoles	3	f
20290628	2029-06-28	2029	2	6	Junio	28	Jueves	4	f
20290629	2029-06-29	2029	2	6	Junio	29	Viernes	5	f
20290630	2029-06-30	2029	2	6	Junio	30	Sábado	6	t
20290701	2029-07-01	2029	3	7	Julio	1	Domingo	7	t
20290702	2029-07-02	2029	3	7	Julio	2	Lunes	1	f
20290703	2029-07-03	2029	3	7	Julio	3	Martes	2	f
20290704	2029-07-04	2029	3	7	Julio	4	Miércoles	3	f
20290705	2029-07-05	2029	3	7	Julio	5	Jueves	4	f
20290706	2029-07-06	2029	3	7	Julio	6	Viernes	5	f
20290707	2029-07-07	2029	3	7	Julio	7	Sábado	6	t
20290708	2029-07-08	2029	3	7	Julio	8	Domingo	7	t
20290709	2029-07-09	2029	3	7	Julio	9	Lunes	1	f
20290710	2029-07-10	2029	3	7	Julio	10	Martes	2	f
20290711	2029-07-11	2029	3	7	Julio	11	Miércoles	3	f
20290712	2029-07-12	2029	3	7	Julio	12	Jueves	4	f
20290713	2029-07-13	2029	3	7	Julio	13	Viernes	5	f
20290714	2029-07-14	2029	3	7	Julio	14	Sábado	6	t
20290715	2029-07-15	2029	3	7	Julio	15	Domingo	7	t
20290716	2029-07-16	2029	3	7	Julio	16	Lunes	1	f
20290717	2029-07-17	2029	3	7	Julio	17	Martes	2	f
20290718	2029-07-18	2029	3	7	Julio	18	Miércoles	3	f
20290719	2029-07-19	2029	3	7	Julio	19	Jueves	4	f
20290720	2029-07-20	2029	3	7	Julio	20	Viernes	5	f
20290721	2029-07-21	2029	3	7	Julio	21	Sábado	6	t
20290722	2029-07-22	2029	3	7	Julio	22	Domingo	7	t
20290723	2029-07-23	2029	3	7	Julio	23	Lunes	1	f
20290724	2029-07-24	2029	3	7	Julio	24	Martes	2	f
20290725	2029-07-25	2029	3	7	Julio	25	Miércoles	3	f
20290726	2029-07-26	2029	3	7	Julio	26	Jueves	4	f
20290727	2029-07-27	2029	3	7	Julio	27	Viernes	5	f
20290728	2029-07-28	2029	3	7	Julio	28	Sábado	6	t
20290729	2029-07-29	2029	3	7	Julio	29	Domingo	7	t
20290730	2029-07-30	2029	3	7	Julio	30	Lunes	1	f
20290731	2029-07-31	2029	3	7	Julio	31	Martes	2	f
20290801	2029-08-01	2029	3	8	Agosto	1	Miércoles	3	f
20290802	2029-08-02	2029	3	8	Agosto	2	Jueves	4	f
20290803	2029-08-03	2029	3	8	Agosto	3	Viernes	5	f
20290804	2029-08-04	2029	3	8	Agosto	4	Sábado	6	t
20290805	2029-08-05	2029	3	8	Agosto	5	Domingo	7	t
20290806	2029-08-06	2029	3	8	Agosto	6	Lunes	1	f
20290807	2029-08-07	2029	3	8	Agosto	7	Martes	2	f
20290808	2029-08-08	2029	3	8	Agosto	8	Miércoles	3	f
20290809	2029-08-09	2029	3	8	Agosto	9	Jueves	4	f
20290810	2029-08-10	2029	3	8	Agosto	10	Viernes	5	f
20290811	2029-08-11	2029	3	8	Agosto	11	Sábado	6	t
20290812	2029-08-12	2029	3	8	Agosto	12	Domingo	7	t
20290813	2029-08-13	2029	3	8	Agosto	13	Lunes	1	f
20290814	2029-08-14	2029	3	8	Agosto	14	Martes	2	f
20290815	2029-08-15	2029	3	8	Agosto	15	Miércoles	3	f
20290816	2029-08-16	2029	3	8	Agosto	16	Jueves	4	f
20290817	2029-08-17	2029	3	8	Agosto	17	Viernes	5	f
20290818	2029-08-18	2029	3	8	Agosto	18	Sábado	6	t
20290819	2029-08-19	2029	3	8	Agosto	19	Domingo	7	t
20290820	2029-08-20	2029	3	8	Agosto	20	Lunes	1	f
20290821	2029-08-21	2029	3	8	Agosto	21	Martes	2	f
20290822	2029-08-22	2029	3	8	Agosto	22	Miércoles	3	f
20290823	2029-08-23	2029	3	8	Agosto	23	Jueves	4	f
20290824	2029-08-24	2029	3	8	Agosto	24	Viernes	5	f
20290825	2029-08-25	2029	3	8	Agosto	25	Sábado	6	t
20290826	2029-08-26	2029	3	8	Agosto	26	Domingo	7	t
20290827	2029-08-27	2029	3	8	Agosto	27	Lunes	1	f
20290828	2029-08-28	2029	3	8	Agosto	28	Martes	2	f
20290829	2029-08-29	2029	3	8	Agosto	29	Miércoles	3	f
20290830	2029-08-30	2029	3	8	Agosto	30	Jueves	4	f
20290831	2029-08-31	2029	3	8	Agosto	31	Viernes	5	f
20290901	2029-09-01	2029	3	9	Septiembre	1	Sábado	6	t
20290902	2029-09-02	2029	3	9	Septiembre	2	Domingo	7	t
20290903	2029-09-03	2029	3	9	Septiembre	3	Lunes	1	f
20290904	2029-09-04	2029	3	9	Septiembre	4	Martes	2	f
20290905	2029-09-05	2029	3	9	Septiembre	5	Miércoles	3	f
20290906	2029-09-06	2029	3	9	Septiembre	6	Jueves	4	f
20290907	2029-09-07	2029	3	9	Septiembre	7	Viernes	5	f
20290908	2029-09-08	2029	3	9	Septiembre	8	Sábado	6	t
20290909	2029-09-09	2029	3	9	Septiembre	9	Domingo	7	t
20290910	2029-09-10	2029	3	9	Septiembre	10	Lunes	1	f
20290911	2029-09-11	2029	3	9	Septiembre	11	Martes	2	f
20290912	2029-09-12	2029	3	9	Septiembre	12	Miércoles	3	f
20290913	2029-09-13	2029	3	9	Septiembre	13	Jueves	4	f
20290914	2029-09-14	2029	3	9	Septiembre	14	Viernes	5	f
20290915	2029-09-15	2029	3	9	Septiembre	15	Sábado	6	t
20290916	2029-09-16	2029	3	9	Septiembre	16	Domingo	7	t
20290917	2029-09-17	2029	3	9	Septiembre	17	Lunes	1	f
20290918	2029-09-18	2029	3	9	Septiembre	18	Martes	2	f
20290919	2029-09-19	2029	3	9	Septiembre	19	Miércoles	3	f
20290920	2029-09-20	2029	3	9	Septiembre	20	Jueves	4	f
20290921	2029-09-21	2029	3	9	Septiembre	21	Viernes	5	f
20290922	2029-09-22	2029	3	9	Septiembre	22	Sábado	6	t
20290923	2029-09-23	2029	3	9	Septiembre	23	Domingo	7	t
20290924	2029-09-24	2029	3	9	Septiembre	24	Lunes	1	f
20290925	2029-09-25	2029	3	9	Septiembre	25	Martes	2	f
20290926	2029-09-26	2029	3	9	Septiembre	26	Miércoles	3	f
20290927	2029-09-27	2029	3	9	Septiembre	27	Jueves	4	f
20290928	2029-09-28	2029	3	9	Septiembre	28	Viernes	5	f
20290929	2029-09-29	2029	3	9	Septiembre	29	Sábado	6	t
20290930	2029-09-30	2029	3	9	Septiembre	30	Domingo	7	t
20291001	2029-10-01	2029	4	10	Octubre	1	Lunes	1	f
20291002	2029-10-02	2029	4	10	Octubre	2	Martes	2	f
20291003	2029-10-03	2029	4	10	Octubre	3	Miércoles	3	f
20291004	2029-10-04	2029	4	10	Octubre	4	Jueves	4	f
20291005	2029-10-05	2029	4	10	Octubre	5	Viernes	5	f
20291006	2029-10-06	2029	4	10	Octubre	6	Sábado	6	t
20291007	2029-10-07	2029	4	10	Octubre	7	Domingo	7	t
20291008	2029-10-08	2029	4	10	Octubre	8	Lunes	1	f
20291009	2029-10-09	2029	4	10	Octubre	9	Martes	2	f
20291010	2029-10-10	2029	4	10	Octubre	10	Miércoles	3	f
20291011	2029-10-11	2029	4	10	Octubre	11	Jueves	4	f
20291012	2029-10-12	2029	4	10	Octubre	12	Viernes	5	f
20291013	2029-10-13	2029	4	10	Octubre	13	Sábado	6	t
20291014	2029-10-14	2029	4	10	Octubre	14	Domingo	7	t
20291015	2029-10-15	2029	4	10	Octubre	15	Lunes	1	f
20291016	2029-10-16	2029	4	10	Octubre	16	Martes	2	f
20291017	2029-10-17	2029	4	10	Octubre	17	Miércoles	3	f
20291018	2029-10-18	2029	4	10	Octubre	18	Jueves	4	f
20291019	2029-10-19	2029	4	10	Octubre	19	Viernes	5	f
20291020	2029-10-20	2029	4	10	Octubre	20	Sábado	6	t
20291021	2029-10-21	2029	4	10	Octubre	21	Domingo	7	t
20291022	2029-10-22	2029	4	10	Octubre	22	Lunes	1	f
20291023	2029-10-23	2029	4	10	Octubre	23	Martes	2	f
20291024	2029-10-24	2029	4	10	Octubre	24	Miércoles	3	f
20291025	2029-10-25	2029	4	10	Octubre	25	Jueves	4	f
20291026	2029-10-26	2029	4	10	Octubre	26	Viernes	5	f
20291027	2029-10-27	2029	4	10	Octubre	27	Sábado	6	t
20291028	2029-10-28	2029	4	10	Octubre	28	Domingo	7	t
20291029	2029-10-29	2029	4	10	Octubre	29	Lunes	1	f
20291030	2029-10-30	2029	4	10	Octubre	30	Martes	2	f
20291031	2029-10-31	2029	4	10	Octubre	31	Miércoles	3	f
20291101	2029-11-01	2029	4	11	Noviembre	1	Jueves	4	f
20291102	2029-11-02	2029	4	11	Noviembre	2	Viernes	5	f
20291103	2029-11-03	2029	4	11	Noviembre	3	Sábado	6	t
20291104	2029-11-04	2029	4	11	Noviembre	4	Domingo	7	t
20291105	2029-11-05	2029	4	11	Noviembre	5	Lunes	1	f
20291106	2029-11-06	2029	4	11	Noviembre	6	Martes	2	f
20291107	2029-11-07	2029	4	11	Noviembre	7	Miércoles	3	f
20291108	2029-11-08	2029	4	11	Noviembre	8	Jueves	4	f
20291109	2029-11-09	2029	4	11	Noviembre	9	Viernes	5	f
20291110	2029-11-10	2029	4	11	Noviembre	10	Sábado	6	t
20291111	2029-11-11	2029	4	11	Noviembre	11	Domingo	7	t
20291112	2029-11-12	2029	4	11	Noviembre	12	Lunes	1	f
20291113	2029-11-13	2029	4	11	Noviembre	13	Martes	2	f
20291114	2029-11-14	2029	4	11	Noviembre	14	Miércoles	3	f
20291115	2029-11-15	2029	4	11	Noviembre	15	Jueves	4	f
20291116	2029-11-16	2029	4	11	Noviembre	16	Viernes	5	f
20291117	2029-11-17	2029	4	11	Noviembre	17	Sábado	6	t
20291118	2029-11-18	2029	4	11	Noviembre	18	Domingo	7	t
20291119	2029-11-19	2029	4	11	Noviembre	19	Lunes	1	f
20291120	2029-11-20	2029	4	11	Noviembre	20	Martes	2	f
20291121	2029-11-21	2029	4	11	Noviembre	21	Miércoles	3	f
20291122	2029-11-22	2029	4	11	Noviembre	22	Jueves	4	f
20291123	2029-11-23	2029	4	11	Noviembre	23	Viernes	5	f
20291124	2029-11-24	2029	4	11	Noviembre	24	Sábado	6	t
20291125	2029-11-25	2029	4	11	Noviembre	25	Domingo	7	t
20291126	2029-11-26	2029	4	11	Noviembre	26	Lunes	1	f
20291127	2029-11-27	2029	4	11	Noviembre	27	Martes	2	f
20291128	2029-11-28	2029	4	11	Noviembre	28	Miércoles	3	f
20291129	2029-11-29	2029	4	11	Noviembre	29	Jueves	4	f
20291130	2029-11-30	2029	4	11	Noviembre	30	Viernes	5	f
20291201	2029-12-01	2029	4	12	Diciembre	1	Sábado	6	t
20291202	2029-12-02	2029	4	12	Diciembre	2	Domingo	7	t
20291203	2029-12-03	2029	4	12	Diciembre	3	Lunes	1	f
20291204	2029-12-04	2029	4	12	Diciembre	4	Martes	2	f
20291205	2029-12-05	2029	4	12	Diciembre	5	Miércoles	3	f
20291206	2029-12-06	2029	4	12	Diciembre	6	Jueves	4	f
20291207	2029-12-07	2029	4	12	Diciembre	7	Viernes	5	f
20291208	2029-12-08	2029	4	12	Diciembre	8	Sábado	6	t
20291209	2029-12-09	2029	4	12	Diciembre	9	Domingo	7	t
20291210	2029-12-10	2029	4	12	Diciembre	10	Lunes	1	f
20291211	2029-12-11	2029	4	12	Diciembre	11	Martes	2	f
20291212	2029-12-12	2029	4	12	Diciembre	12	Miércoles	3	f
20291213	2029-12-13	2029	4	12	Diciembre	13	Jueves	4	f
20291214	2029-12-14	2029	4	12	Diciembre	14	Viernes	5	f
20291215	2029-12-15	2029	4	12	Diciembre	15	Sábado	6	t
20291216	2029-12-16	2029	4	12	Diciembre	16	Domingo	7	t
20291217	2029-12-17	2029	4	12	Diciembre	17	Lunes	1	f
20291218	2029-12-18	2029	4	12	Diciembre	18	Martes	2	f
20291219	2029-12-19	2029	4	12	Diciembre	19	Miércoles	3	f
20291220	2029-12-20	2029	4	12	Diciembre	20	Jueves	4	f
20291221	2029-12-21	2029	4	12	Diciembre	21	Viernes	5	f
20291222	2029-12-22	2029	4	12	Diciembre	22	Sábado	6	t
20291223	2029-12-23	2029	4	12	Diciembre	23	Domingo	7	t
20291224	2029-12-24	2029	4	12	Diciembre	24	Lunes	1	f
20291225	2029-12-25	2029	4	12	Diciembre	25	Martes	2	f
20291226	2029-12-26	2029	4	12	Diciembre	26	Miércoles	3	f
20291227	2029-12-27	2029	4	12	Diciembre	27	Jueves	4	f
20291228	2029-12-28	2029	4	12	Diciembre	28	Viernes	5	f
20291229	2029-12-29	2029	4	12	Diciembre	29	Sábado	6	t
20291230	2029-12-30	2029	4	12	Diciembre	30	Domingo	7	t
20291231	2029-12-31	2029	4	12	Diciembre	31	Lunes	1	f
20300101	2030-01-01	2030	1	1	Enero	1	Martes	2	f
20300102	2030-01-02	2030	1	1	Enero	2	Miércoles	3	f
20300103	2030-01-03	2030	1	1	Enero	3	Jueves	4	f
20300104	2030-01-04	2030	1	1	Enero	4	Viernes	5	f
20300105	2030-01-05	2030	1	1	Enero	5	Sábado	6	t
20300106	2030-01-06	2030	1	1	Enero	6	Domingo	7	t
20300107	2030-01-07	2030	1	1	Enero	7	Lunes	1	f
20300108	2030-01-08	2030	1	1	Enero	8	Martes	2	f
20300109	2030-01-09	2030	1	1	Enero	9	Miércoles	3	f
20300110	2030-01-10	2030	1	1	Enero	10	Jueves	4	f
20300111	2030-01-11	2030	1	1	Enero	11	Viernes	5	f
20300112	2030-01-12	2030	1	1	Enero	12	Sábado	6	t
20300113	2030-01-13	2030	1	1	Enero	13	Domingo	7	t
20300114	2030-01-14	2030	1	1	Enero	14	Lunes	1	f
20300115	2030-01-15	2030	1	1	Enero	15	Martes	2	f
20300116	2030-01-16	2030	1	1	Enero	16	Miércoles	3	f
20300117	2030-01-17	2030	1	1	Enero	17	Jueves	4	f
20300118	2030-01-18	2030	1	1	Enero	18	Viernes	5	f
20300119	2030-01-19	2030	1	1	Enero	19	Sábado	6	t
20300120	2030-01-20	2030	1	1	Enero	20	Domingo	7	t
20300121	2030-01-21	2030	1	1	Enero	21	Lunes	1	f
20300122	2030-01-22	2030	1	1	Enero	22	Martes	2	f
20300123	2030-01-23	2030	1	1	Enero	23	Miércoles	3	f
20300124	2030-01-24	2030	1	1	Enero	24	Jueves	4	f
20300125	2030-01-25	2030	1	1	Enero	25	Viernes	5	f
20300126	2030-01-26	2030	1	1	Enero	26	Sábado	6	t
20300127	2030-01-27	2030	1	1	Enero	27	Domingo	7	t
20300128	2030-01-28	2030	1	1	Enero	28	Lunes	1	f
20300129	2030-01-29	2030	1	1	Enero	29	Martes	2	f
20300130	2030-01-30	2030	1	1	Enero	30	Miércoles	3	f
20300131	2030-01-31	2030	1	1	Enero	31	Jueves	4	f
20300201	2030-02-01	2030	1	2	Febrero	1	Viernes	5	f
20300202	2030-02-02	2030	1	2	Febrero	2	Sábado	6	t
20300203	2030-02-03	2030	1	2	Febrero	3	Domingo	7	t
20300204	2030-02-04	2030	1	2	Febrero	4	Lunes	1	f
20300205	2030-02-05	2030	1	2	Febrero	5	Martes	2	f
20300206	2030-02-06	2030	1	2	Febrero	6	Miércoles	3	f
20300207	2030-02-07	2030	1	2	Febrero	7	Jueves	4	f
20300208	2030-02-08	2030	1	2	Febrero	8	Viernes	5	f
20300209	2030-02-09	2030	1	2	Febrero	9	Sábado	6	t
20300210	2030-02-10	2030	1	2	Febrero	10	Domingo	7	t
20300211	2030-02-11	2030	1	2	Febrero	11	Lunes	1	f
20300212	2030-02-12	2030	1	2	Febrero	12	Martes	2	f
20300213	2030-02-13	2030	1	2	Febrero	13	Miércoles	3	f
20300214	2030-02-14	2030	1	2	Febrero	14	Jueves	4	f
20300215	2030-02-15	2030	1	2	Febrero	15	Viernes	5	f
20300216	2030-02-16	2030	1	2	Febrero	16	Sábado	6	t
20300217	2030-02-17	2030	1	2	Febrero	17	Domingo	7	t
20300218	2030-02-18	2030	1	2	Febrero	18	Lunes	1	f
20300219	2030-02-19	2030	1	2	Febrero	19	Martes	2	f
20300220	2030-02-20	2030	1	2	Febrero	20	Miércoles	3	f
20300221	2030-02-21	2030	1	2	Febrero	21	Jueves	4	f
20300222	2030-02-22	2030	1	2	Febrero	22	Viernes	5	f
20300223	2030-02-23	2030	1	2	Febrero	23	Sábado	6	t
20300224	2030-02-24	2030	1	2	Febrero	24	Domingo	7	t
20300225	2030-02-25	2030	1	2	Febrero	25	Lunes	1	f
20300226	2030-02-26	2030	1	2	Febrero	26	Martes	2	f
20300227	2030-02-27	2030	1	2	Febrero	27	Miércoles	3	f
20300228	2030-02-28	2030	1	2	Febrero	28	Jueves	4	f
20300301	2030-03-01	2030	1	3	Marzo	1	Viernes	5	f
20300302	2030-03-02	2030	1	3	Marzo	2	Sábado	6	t
20300303	2030-03-03	2030	1	3	Marzo	3	Domingo	7	t
20300304	2030-03-04	2030	1	3	Marzo	4	Lunes	1	f
20300305	2030-03-05	2030	1	3	Marzo	5	Martes	2	f
20300306	2030-03-06	2030	1	3	Marzo	6	Miércoles	3	f
20300307	2030-03-07	2030	1	3	Marzo	7	Jueves	4	f
20300308	2030-03-08	2030	1	3	Marzo	8	Viernes	5	f
20300309	2030-03-09	2030	1	3	Marzo	9	Sábado	6	t
20300310	2030-03-10	2030	1	3	Marzo	10	Domingo	7	t
20300311	2030-03-11	2030	1	3	Marzo	11	Lunes	1	f
20300312	2030-03-12	2030	1	3	Marzo	12	Martes	2	f
20300313	2030-03-13	2030	1	3	Marzo	13	Miércoles	3	f
20300314	2030-03-14	2030	1	3	Marzo	14	Jueves	4	f
20300315	2030-03-15	2030	1	3	Marzo	15	Viernes	5	f
20300316	2030-03-16	2030	1	3	Marzo	16	Sábado	6	t
20300317	2030-03-17	2030	1	3	Marzo	17	Domingo	7	t
20300318	2030-03-18	2030	1	3	Marzo	18	Lunes	1	f
20300319	2030-03-19	2030	1	3	Marzo	19	Martes	2	f
20300320	2030-03-20	2030	1	3	Marzo	20	Miércoles	3	f
20300321	2030-03-21	2030	1	3	Marzo	21	Jueves	4	f
20300322	2030-03-22	2030	1	3	Marzo	22	Viernes	5	f
20300323	2030-03-23	2030	1	3	Marzo	23	Sábado	6	t
20300324	2030-03-24	2030	1	3	Marzo	24	Domingo	7	t
20300325	2030-03-25	2030	1	3	Marzo	25	Lunes	1	f
20300326	2030-03-26	2030	1	3	Marzo	26	Martes	2	f
20300327	2030-03-27	2030	1	3	Marzo	27	Miércoles	3	f
20300328	2030-03-28	2030	1	3	Marzo	28	Jueves	4	f
20300329	2030-03-29	2030	1	3	Marzo	29	Viernes	5	f
20300330	2030-03-30	2030	1	3	Marzo	30	Sábado	6	t
20300331	2030-03-31	2030	1	3	Marzo	31	Domingo	7	t
20300401	2030-04-01	2030	2	4	Abril	1	Lunes	1	f
20300402	2030-04-02	2030	2	4	Abril	2	Martes	2	f
20300403	2030-04-03	2030	2	4	Abril	3	Miércoles	3	f
20300404	2030-04-04	2030	2	4	Abril	4	Jueves	4	f
20300405	2030-04-05	2030	2	4	Abril	5	Viernes	5	f
20300406	2030-04-06	2030	2	4	Abril	6	Sábado	6	t
20300407	2030-04-07	2030	2	4	Abril	7	Domingo	7	t
20300408	2030-04-08	2030	2	4	Abril	8	Lunes	1	f
20300409	2030-04-09	2030	2	4	Abril	9	Martes	2	f
20300410	2030-04-10	2030	2	4	Abril	10	Miércoles	3	f
20300411	2030-04-11	2030	2	4	Abril	11	Jueves	4	f
20300412	2030-04-12	2030	2	4	Abril	12	Viernes	5	f
20300413	2030-04-13	2030	2	4	Abril	13	Sábado	6	t
20300414	2030-04-14	2030	2	4	Abril	14	Domingo	7	t
20300415	2030-04-15	2030	2	4	Abril	15	Lunes	1	f
20300416	2030-04-16	2030	2	4	Abril	16	Martes	2	f
20300417	2030-04-17	2030	2	4	Abril	17	Miércoles	3	f
20300418	2030-04-18	2030	2	4	Abril	18	Jueves	4	f
20300419	2030-04-19	2030	2	4	Abril	19	Viernes	5	f
20300420	2030-04-20	2030	2	4	Abril	20	Sábado	6	t
20300421	2030-04-21	2030	2	4	Abril	21	Domingo	7	t
20300422	2030-04-22	2030	2	4	Abril	22	Lunes	1	f
20300423	2030-04-23	2030	2	4	Abril	23	Martes	2	f
20300424	2030-04-24	2030	2	4	Abril	24	Miércoles	3	f
20300425	2030-04-25	2030	2	4	Abril	25	Jueves	4	f
20300426	2030-04-26	2030	2	4	Abril	26	Viernes	5	f
20300427	2030-04-27	2030	2	4	Abril	27	Sábado	6	t
20300428	2030-04-28	2030	2	4	Abril	28	Domingo	7	t
20300429	2030-04-29	2030	2	4	Abril	29	Lunes	1	f
20300430	2030-04-30	2030	2	4	Abril	30	Martes	2	f
20300501	2030-05-01	2030	2	5	Mayo	1	Miércoles	3	f
20300502	2030-05-02	2030	2	5	Mayo	2	Jueves	4	f
20300503	2030-05-03	2030	2	5	Mayo	3	Viernes	5	f
20300504	2030-05-04	2030	2	5	Mayo	4	Sábado	6	t
20300505	2030-05-05	2030	2	5	Mayo	5	Domingo	7	t
20300506	2030-05-06	2030	2	5	Mayo	6	Lunes	1	f
20300507	2030-05-07	2030	2	5	Mayo	7	Martes	2	f
20300508	2030-05-08	2030	2	5	Mayo	8	Miércoles	3	f
20300509	2030-05-09	2030	2	5	Mayo	9	Jueves	4	f
20300510	2030-05-10	2030	2	5	Mayo	10	Viernes	5	f
20300511	2030-05-11	2030	2	5	Mayo	11	Sábado	6	t
20300512	2030-05-12	2030	2	5	Mayo	12	Domingo	7	t
20300513	2030-05-13	2030	2	5	Mayo	13	Lunes	1	f
20300514	2030-05-14	2030	2	5	Mayo	14	Martes	2	f
20300515	2030-05-15	2030	2	5	Mayo	15	Miércoles	3	f
20300516	2030-05-16	2030	2	5	Mayo	16	Jueves	4	f
20300517	2030-05-17	2030	2	5	Mayo	17	Viernes	5	f
20300518	2030-05-18	2030	2	5	Mayo	18	Sábado	6	t
20300519	2030-05-19	2030	2	5	Mayo	19	Domingo	7	t
20300520	2030-05-20	2030	2	5	Mayo	20	Lunes	1	f
20300521	2030-05-21	2030	2	5	Mayo	21	Martes	2	f
20300522	2030-05-22	2030	2	5	Mayo	22	Miércoles	3	f
20300523	2030-05-23	2030	2	5	Mayo	23	Jueves	4	f
20300524	2030-05-24	2030	2	5	Mayo	24	Viernes	5	f
20300525	2030-05-25	2030	2	5	Mayo	25	Sábado	6	t
20300526	2030-05-26	2030	2	5	Mayo	26	Domingo	7	t
20300527	2030-05-27	2030	2	5	Mayo	27	Lunes	1	f
20300528	2030-05-28	2030	2	5	Mayo	28	Martes	2	f
20300529	2030-05-29	2030	2	5	Mayo	29	Miércoles	3	f
20300530	2030-05-30	2030	2	5	Mayo	30	Jueves	4	f
20300531	2030-05-31	2030	2	5	Mayo	31	Viernes	5	f
20300601	2030-06-01	2030	2	6	Junio	1	Sábado	6	t
20300602	2030-06-02	2030	2	6	Junio	2	Domingo	7	t
20300603	2030-06-03	2030	2	6	Junio	3	Lunes	1	f
20300604	2030-06-04	2030	2	6	Junio	4	Martes	2	f
20300605	2030-06-05	2030	2	6	Junio	5	Miércoles	3	f
20300606	2030-06-06	2030	2	6	Junio	6	Jueves	4	f
20300607	2030-06-07	2030	2	6	Junio	7	Viernes	5	f
20300608	2030-06-08	2030	2	6	Junio	8	Sábado	6	t
20300609	2030-06-09	2030	2	6	Junio	9	Domingo	7	t
20300610	2030-06-10	2030	2	6	Junio	10	Lunes	1	f
20300611	2030-06-11	2030	2	6	Junio	11	Martes	2	f
20300612	2030-06-12	2030	2	6	Junio	12	Miércoles	3	f
20300613	2030-06-13	2030	2	6	Junio	13	Jueves	4	f
20300614	2030-06-14	2030	2	6	Junio	14	Viernes	5	f
20300615	2030-06-15	2030	2	6	Junio	15	Sábado	6	t
20300616	2030-06-16	2030	2	6	Junio	16	Domingo	7	t
20300617	2030-06-17	2030	2	6	Junio	17	Lunes	1	f
20300618	2030-06-18	2030	2	6	Junio	18	Martes	2	f
20300619	2030-06-19	2030	2	6	Junio	19	Miércoles	3	f
20300620	2030-06-20	2030	2	6	Junio	20	Jueves	4	f
20300621	2030-06-21	2030	2	6	Junio	21	Viernes	5	f
20300622	2030-06-22	2030	2	6	Junio	22	Sábado	6	t
20300623	2030-06-23	2030	2	6	Junio	23	Domingo	7	t
20300624	2030-06-24	2030	2	6	Junio	24	Lunes	1	f
20300625	2030-06-25	2030	2	6	Junio	25	Martes	2	f
20300626	2030-06-26	2030	2	6	Junio	26	Miércoles	3	f
20300627	2030-06-27	2030	2	6	Junio	27	Jueves	4	f
20300628	2030-06-28	2030	2	6	Junio	28	Viernes	5	f
20300629	2030-06-29	2030	2	6	Junio	29	Sábado	6	t
20300630	2030-06-30	2030	2	6	Junio	30	Domingo	7	t
20300701	2030-07-01	2030	3	7	Julio	1	Lunes	1	f
20300702	2030-07-02	2030	3	7	Julio	2	Martes	2	f
20300703	2030-07-03	2030	3	7	Julio	3	Miércoles	3	f
20300704	2030-07-04	2030	3	7	Julio	4	Jueves	4	f
20300705	2030-07-05	2030	3	7	Julio	5	Viernes	5	f
20300706	2030-07-06	2030	3	7	Julio	6	Sábado	6	t
20300707	2030-07-07	2030	3	7	Julio	7	Domingo	7	t
20300708	2030-07-08	2030	3	7	Julio	8	Lunes	1	f
20300709	2030-07-09	2030	3	7	Julio	9	Martes	2	f
20300710	2030-07-10	2030	3	7	Julio	10	Miércoles	3	f
20300711	2030-07-11	2030	3	7	Julio	11	Jueves	4	f
20300712	2030-07-12	2030	3	7	Julio	12	Viernes	5	f
20300713	2030-07-13	2030	3	7	Julio	13	Sábado	6	t
20300714	2030-07-14	2030	3	7	Julio	14	Domingo	7	t
20300715	2030-07-15	2030	3	7	Julio	15	Lunes	1	f
20300716	2030-07-16	2030	3	7	Julio	16	Martes	2	f
20300717	2030-07-17	2030	3	7	Julio	17	Miércoles	3	f
20300718	2030-07-18	2030	3	7	Julio	18	Jueves	4	f
20300719	2030-07-19	2030	3	7	Julio	19	Viernes	5	f
20300720	2030-07-20	2030	3	7	Julio	20	Sábado	6	t
20300721	2030-07-21	2030	3	7	Julio	21	Domingo	7	t
20300722	2030-07-22	2030	3	7	Julio	22	Lunes	1	f
20300723	2030-07-23	2030	3	7	Julio	23	Martes	2	f
20300724	2030-07-24	2030	3	7	Julio	24	Miércoles	3	f
20300725	2030-07-25	2030	3	7	Julio	25	Jueves	4	f
20300726	2030-07-26	2030	3	7	Julio	26	Viernes	5	f
20300727	2030-07-27	2030	3	7	Julio	27	Sábado	6	t
20300728	2030-07-28	2030	3	7	Julio	28	Domingo	7	t
20300729	2030-07-29	2030	3	7	Julio	29	Lunes	1	f
20300730	2030-07-30	2030	3	7	Julio	30	Martes	2	f
20300731	2030-07-31	2030	3	7	Julio	31	Miércoles	3	f
20300801	2030-08-01	2030	3	8	Agosto	1	Jueves	4	f
20300802	2030-08-02	2030	3	8	Agosto	2	Viernes	5	f
20300803	2030-08-03	2030	3	8	Agosto	3	Sábado	6	t
20300804	2030-08-04	2030	3	8	Agosto	4	Domingo	7	t
20300805	2030-08-05	2030	3	8	Agosto	5	Lunes	1	f
20300806	2030-08-06	2030	3	8	Agosto	6	Martes	2	f
20300807	2030-08-07	2030	3	8	Agosto	7	Miércoles	3	f
20300808	2030-08-08	2030	3	8	Agosto	8	Jueves	4	f
20300809	2030-08-09	2030	3	8	Agosto	9	Viernes	5	f
20300810	2030-08-10	2030	3	8	Agosto	10	Sábado	6	t
20300811	2030-08-11	2030	3	8	Agosto	11	Domingo	7	t
20300812	2030-08-12	2030	3	8	Agosto	12	Lunes	1	f
20300813	2030-08-13	2030	3	8	Agosto	13	Martes	2	f
20300814	2030-08-14	2030	3	8	Agosto	14	Miércoles	3	f
20300815	2030-08-15	2030	3	8	Agosto	15	Jueves	4	f
20300816	2030-08-16	2030	3	8	Agosto	16	Viernes	5	f
20300817	2030-08-17	2030	3	8	Agosto	17	Sábado	6	t
20300818	2030-08-18	2030	3	8	Agosto	18	Domingo	7	t
20300819	2030-08-19	2030	3	8	Agosto	19	Lunes	1	f
20300820	2030-08-20	2030	3	8	Agosto	20	Martes	2	f
20300821	2030-08-21	2030	3	8	Agosto	21	Miércoles	3	f
20300822	2030-08-22	2030	3	8	Agosto	22	Jueves	4	f
20300823	2030-08-23	2030	3	8	Agosto	23	Viernes	5	f
20300824	2030-08-24	2030	3	8	Agosto	24	Sábado	6	t
20300825	2030-08-25	2030	3	8	Agosto	25	Domingo	7	t
20300826	2030-08-26	2030	3	8	Agosto	26	Lunes	1	f
20300827	2030-08-27	2030	3	8	Agosto	27	Martes	2	f
20300828	2030-08-28	2030	3	8	Agosto	28	Miércoles	3	f
20300829	2030-08-29	2030	3	8	Agosto	29	Jueves	4	f
20300830	2030-08-30	2030	3	8	Agosto	30	Viernes	5	f
20300831	2030-08-31	2030	3	8	Agosto	31	Sábado	6	t
20300901	2030-09-01	2030	3	9	Septiembre	1	Domingo	7	t
20300902	2030-09-02	2030	3	9	Septiembre	2	Lunes	1	f
20300903	2030-09-03	2030	3	9	Septiembre	3	Martes	2	f
20300904	2030-09-04	2030	3	9	Septiembre	4	Miércoles	3	f
20300905	2030-09-05	2030	3	9	Septiembre	5	Jueves	4	f
20300906	2030-09-06	2030	3	9	Septiembre	6	Viernes	5	f
20300907	2030-09-07	2030	3	9	Septiembre	7	Sábado	6	t
20300908	2030-09-08	2030	3	9	Septiembre	8	Domingo	7	t
20300909	2030-09-09	2030	3	9	Septiembre	9	Lunes	1	f
20300910	2030-09-10	2030	3	9	Septiembre	10	Martes	2	f
20300911	2030-09-11	2030	3	9	Septiembre	11	Miércoles	3	f
20300912	2030-09-12	2030	3	9	Septiembre	12	Jueves	4	f
20300913	2030-09-13	2030	3	9	Septiembre	13	Viernes	5	f
20300914	2030-09-14	2030	3	9	Septiembre	14	Sábado	6	t
20300915	2030-09-15	2030	3	9	Septiembre	15	Domingo	7	t
20300916	2030-09-16	2030	3	9	Septiembre	16	Lunes	1	f
20300917	2030-09-17	2030	3	9	Septiembre	17	Martes	2	f
20300918	2030-09-18	2030	3	9	Septiembre	18	Miércoles	3	f
20300919	2030-09-19	2030	3	9	Septiembre	19	Jueves	4	f
20300920	2030-09-20	2030	3	9	Septiembre	20	Viernes	5	f
20300921	2030-09-21	2030	3	9	Septiembre	21	Sábado	6	t
20300922	2030-09-22	2030	3	9	Septiembre	22	Domingo	7	t
20300923	2030-09-23	2030	3	9	Septiembre	23	Lunes	1	f
20300924	2030-09-24	2030	3	9	Septiembre	24	Martes	2	f
20300925	2030-09-25	2030	3	9	Septiembre	25	Miércoles	3	f
20300926	2030-09-26	2030	3	9	Septiembre	26	Jueves	4	f
20300927	2030-09-27	2030	3	9	Septiembre	27	Viernes	5	f
20300928	2030-09-28	2030	3	9	Septiembre	28	Sábado	6	t
20300929	2030-09-29	2030	3	9	Septiembre	29	Domingo	7	t
20300930	2030-09-30	2030	3	9	Septiembre	30	Lunes	1	f
20301001	2030-10-01	2030	4	10	Octubre	1	Martes	2	f
20301002	2030-10-02	2030	4	10	Octubre	2	Miércoles	3	f
20301003	2030-10-03	2030	4	10	Octubre	3	Jueves	4	f
20301004	2030-10-04	2030	4	10	Octubre	4	Viernes	5	f
20301005	2030-10-05	2030	4	10	Octubre	5	Sábado	6	t
20301006	2030-10-06	2030	4	10	Octubre	6	Domingo	7	t
20301007	2030-10-07	2030	4	10	Octubre	7	Lunes	1	f
20301008	2030-10-08	2030	4	10	Octubre	8	Martes	2	f
20301009	2030-10-09	2030	4	10	Octubre	9	Miércoles	3	f
20301010	2030-10-10	2030	4	10	Octubre	10	Jueves	4	f
20301011	2030-10-11	2030	4	10	Octubre	11	Viernes	5	f
20301012	2030-10-12	2030	4	10	Octubre	12	Sábado	6	t
20301013	2030-10-13	2030	4	10	Octubre	13	Domingo	7	t
20301014	2030-10-14	2030	4	10	Octubre	14	Lunes	1	f
20301015	2030-10-15	2030	4	10	Octubre	15	Martes	2	f
20301016	2030-10-16	2030	4	10	Octubre	16	Miércoles	3	f
20301017	2030-10-17	2030	4	10	Octubre	17	Jueves	4	f
20301018	2030-10-18	2030	4	10	Octubre	18	Viernes	5	f
20301019	2030-10-19	2030	4	10	Octubre	19	Sábado	6	t
20301020	2030-10-20	2030	4	10	Octubre	20	Domingo	7	t
20301021	2030-10-21	2030	4	10	Octubre	21	Lunes	1	f
20301022	2030-10-22	2030	4	10	Octubre	22	Martes	2	f
20301023	2030-10-23	2030	4	10	Octubre	23	Miércoles	3	f
20301024	2030-10-24	2030	4	10	Octubre	24	Jueves	4	f
20301025	2030-10-25	2030	4	10	Octubre	25	Viernes	5	f
20301026	2030-10-26	2030	4	10	Octubre	26	Sábado	6	t
20301027	2030-10-27	2030	4	10	Octubre	27	Domingo	7	t
20301028	2030-10-28	2030	4	10	Octubre	28	Lunes	1	f
20301029	2030-10-29	2030	4	10	Octubre	29	Martes	2	f
20301030	2030-10-30	2030	4	10	Octubre	30	Miércoles	3	f
20301031	2030-10-31	2030	4	10	Octubre	31	Jueves	4	f
20301101	2030-11-01	2030	4	11	Noviembre	1	Viernes	5	f
20301102	2030-11-02	2030	4	11	Noviembre	2	Sábado	6	t
20301103	2030-11-03	2030	4	11	Noviembre	3	Domingo	7	t
20301104	2030-11-04	2030	4	11	Noviembre	4	Lunes	1	f
20301105	2030-11-05	2030	4	11	Noviembre	5	Martes	2	f
20301106	2030-11-06	2030	4	11	Noviembre	6	Miércoles	3	f
20301107	2030-11-07	2030	4	11	Noviembre	7	Jueves	4	f
20301108	2030-11-08	2030	4	11	Noviembre	8	Viernes	5	f
20301109	2030-11-09	2030	4	11	Noviembre	9	Sábado	6	t
20301110	2030-11-10	2030	4	11	Noviembre	10	Domingo	7	t
20301111	2030-11-11	2030	4	11	Noviembre	11	Lunes	1	f
20301112	2030-11-12	2030	4	11	Noviembre	12	Martes	2	f
20301113	2030-11-13	2030	4	11	Noviembre	13	Miércoles	3	f
20301114	2030-11-14	2030	4	11	Noviembre	14	Jueves	4	f
20301115	2030-11-15	2030	4	11	Noviembre	15	Viernes	5	f
20301116	2030-11-16	2030	4	11	Noviembre	16	Sábado	6	t
20301117	2030-11-17	2030	4	11	Noviembre	17	Domingo	7	t
20301118	2030-11-18	2030	4	11	Noviembre	18	Lunes	1	f
20301119	2030-11-19	2030	4	11	Noviembre	19	Martes	2	f
20301120	2030-11-20	2030	4	11	Noviembre	20	Miércoles	3	f
20301121	2030-11-21	2030	4	11	Noviembre	21	Jueves	4	f
20301122	2030-11-22	2030	4	11	Noviembre	22	Viernes	5	f
20301123	2030-11-23	2030	4	11	Noviembre	23	Sábado	6	t
20301124	2030-11-24	2030	4	11	Noviembre	24	Domingo	7	t
20301125	2030-11-25	2030	4	11	Noviembre	25	Lunes	1	f
20301126	2030-11-26	2030	4	11	Noviembre	26	Martes	2	f
20301127	2030-11-27	2030	4	11	Noviembre	27	Miércoles	3	f
20301128	2030-11-28	2030	4	11	Noviembre	28	Jueves	4	f
20301129	2030-11-29	2030	4	11	Noviembre	29	Viernes	5	f
20301130	2030-11-30	2030	4	11	Noviembre	30	Sábado	6	t
20301201	2030-12-01	2030	4	12	Diciembre	1	Domingo	7	t
20301202	2030-12-02	2030	4	12	Diciembre	2	Lunes	1	f
20301203	2030-12-03	2030	4	12	Diciembre	3	Martes	2	f
20301204	2030-12-04	2030	4	12	Diciembre	4	Miércoles	3	f
20301205	2030-12-05	2030	4	12	Diciembre	5	Jueves	4	f
20301206	2030-12-06	2030	4	12	Diciembre	6	Viernes	5	f
20301207	2030-12-07	2030	4	12	Diciembre	7	Sábado	6	t
20301208	2030-12-08	2030	4	12	Diciembre	8	Domingo	7	t
20301209	2030-12-09	2030	4	12	Diciembre	9	Lunes	1	f
20301210	2030-12-10	2030	4	12	Diciembre	10	Martes	2	f
20301211	2030-12-11	2030	4	12	Diciembre	11	Miércoles	3	f
20301212	2030-12-12	2030	4	12	Diciembre	12	Jueves	4	f
20301213	2030-12-13	2030	4	12	Diciembre	13	Viernes	5	f
20301214	2030-12-14	2030	4	12	Diciembre	14	Sábado	6	t
20301215	2030-12-15	2030	4	12	Diciembre	15	Domingo	7	t
20301216	2030-12-16	2030	4	12	Diciembre	16	Lunes	1	f
20301217	2030-12-17	2030	4	12	Diciembre	17	Martes	2	f
20301218	2030-12-18	2030	4	12	Diciembre	18	Miércoles	3	f
20301219	2030-12-19	2030	4	12	Diciembre	19	Jueves	4	f
20301220	2030-12-20	2030	4	12	Diciembre	20	Viernes	5	f
20301221	2030-12-21	2030	4	12	Diciembre	21	Sábado	6	t
20301222	2030-12-22	2030	4	12	Diciembre	22	Domingo	7	t
20301223	2030-12-23	2030	4	12	Diciembre	23	Lunes	1	f
20301224	2030-12-24	2030	4	12	Diciembre	24	Martes	2	f
20301225	2030-12-25	2030	4	12	Diciembre	25	Miércoles	3	f
20301226	2030-12-26	2030	4	12	Diciembre	26	Jueves	4	f
20301227	2030-12-27	2030	4	12	Diciembre	27	Viernes	5	f
20301228	2030-12-28	2030	4	12	Diciembre	28	Sábado	6	t
20301229	2030-12-29	2030	4	12	Diciembre	29	Domingo	7	t
20301230	2030-12-30	2030	4	12	Diciembre	30	Lunes	1	f
20301231	2030-12-31	2030	4	12	Diciembre	31	Martes	2	f
\.


--
-- TOC entry 4899 (class 0 OID 50942)
-- Dependencies: 224
-- Data for Name: fact_inventory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_inventory (tiempo_id, store_id, film_id, cantidad) FROM stdin;
20250713	1	1	4
20250713	1	4	4
20250713	1	6	3
20250713	1	7	2
20250713	1	9	3
20250713	1	10	4
20250713	1	11	4
20250713	1	12	3
20250713	1	15	2
20250713	1	16	2
20250713	1	17	3
20250713	1	18	3
20250713	1	19	4
20250713	1	20	3
20250713	1	21	2
20250713	1	22	4
20250713	1	23	3
20250713	1	24	4
20250713	1	25	4
20250713	1	26	2
20250713	1	27	4
20250713	1	28	3
20250713	1	29	2
20250713	1	30	2
20250713	1	31	4
20250713	1	35	4
20250713	1	37	4
20250713	1	39	3
20250713	1	43	3
20250713	1	44	2
20250713	1	45	4
20250713	1	48	2
20250713	1	49	3
20250713	1	50	3
20250713	1	51	2
20250713	1	53	2
20250713	1	54	3
20250713	1	55	4
20250713	1	56	3
20250713	1	57	4
20250713	1	59	3
20250713	1	60	3
20250713	1	61	4
20250713	1	63	2
20250713	1	66	3
20250713	1	67	2
20250713	1	68	2
20250713	1	69	4
20250713	1	70	2
20250713	1	72	4
20250713	1	73	4
20250713	1	74	3
20250713	1	76	3
20250713	1	77	4
20250713	1	78	3
20250713	1	79	3
20250713	1	80	4
20250713	1	81	4
20250713	1	82	2
20250713	1	83	3
20250713	1	84	4
20250713	1	86	4
20250713	1	89	3
20250713	1	90	3
20250713	1	91	4
20250713	1	92	2
20250713	1	94	2
20250713	1	95	2
20250713	1	96	3
20250713	1	97	4
20250713	1	98	3
20250713	1	99	3
20250713	1	100	4
20250713	1	101	4
20250713	1	103	4
20250713	1	105	2
20250713	1	106	2
20250713	1	109	4
20250713	1	110	4
20250713	1	112	4
20250713	1	114	4
20250713	1	115	3
20250713	1	116	2
20250713	1	117	4
20250713	1	118	4
20250713	1	119	3
20250713	1	120	3
20250713	1	121	3
20250713	1	122	4
20250713	1	123	2
20250713	1	127	4
20250713	1	129	3
20250713	1	130	2
20250713	1	131	4
20250713	1	132	4
20250713	1	133	2
20250713	1	135	3
20250713	1	136	3
20250713	1	138	2
20250713	1	139	4
20250713	1	140	2
20250713	1	141	3
20250713	1	142	3
20250713	1	143	4
20250713	1	146	3
20250713	1	147	3
20250713	1	149	3
20250713	1	150	2
20250713	1	151	2
20250713	1	152	4
20250713	1	153	4
20250713	1	154	3
20250713	1	155	2
20250713	1	158	2
20250713	1	159	4
20250713	1	160	2
20250713	1	161	2
20250713	1	162	3
20250713	1	164	2
20250713	1	165	3
20250713	1	166	4
20250713	1	167	4
20250713	1	168	2
20250713	1	169	2
20250713	1	170	2
20250713	1	172	4
20250713	1	173	3
20250713	1	174	4
20250713	1	175	2
20250713	1	176	2
20250713	1	178	2
20250713	1	179	4
20250713	1	181	3
20250713	1	182	2
20250713	1	183	3
20250713	1	184	2
20250713	1	185	2
20250713	1	186	2
20250713	1	188	3
20250713	1	189	2
20250713	1	191	3
20250713	1	193	4
20250713	1	194	2
20250713	1	196	2
20250713	1	197	2
20250713	1	199	4
20250713	1	200	4
20250713	1	201	4
20250713	1	202	3
20250713	1	204	4
20250713	1	205	4
20250713	1	206	4
20250713	1	207	4
20250713	1	208	3
20250713	1	209	4
20250713	1	211	2
20250713	1	212	3
20250713	1	213	4
20250713	1	215	3
20250713	1	216	2
20250713	1	218	4
20250713	1	219	4
20250713	1	220	4
20250713	1	222	2
20250713	1	224	2
20250713	1	225	3
20250713	1	226	2
20250713	1	227	3
20250713	1	228	3
20250713	1	229	2
20250713	1	230	2
20250713	1	231	4
20250713	1	232	3
20250713	1	233	4
20250713	1	234	4
20250713	1	235	2
20250713	1	237	2
20250713	1	238	2
20250713	1	239	4
20250713	1	241	4
20250713	1	242	2
20250713	1	243	2
20250713	1	244	4
20250713	1	245	3
20250713	1	247	3
20250713	1	249	2
20250713	1	251	2
20250713	1	252	3
20250713	1	253	4
20250713	1	254	2
20250713	1	255	4
20250713	1	259	2
20250713	1	261	2
20250713	1	263	4
20250713	1	265	4
20250713	1	266	4
20250713	1	267	4
20250713	1	269	2
20250713	1	270	3
20250713	1	271	3
20250713	1	272	4
20250713	1	273	4
20250713	1	274	3
20250713	1	275	3
20250713	1	276	4
20250713	1	277	3
20250713	1	278	2
20250713	1	279	2
20250713	1	280	4
20250713	1	281	2
20250713	1	282	3
20250713	1	283	3
20250713	1	284	3
20250713	1	285	3
20250713	1	286	2
20250713	1	287	2
20250713	1	288	2
20250713	1	289	2
20250713	1	290	3
20250713	1	291	4
20250713	1	292	3
20250713	1	293	2
20250713	1	294	2
20250713	1	295	4
20250713	1	296	4
20250713	1	298	2
20250713	1	299	4
20250713	1	300	2
20250713	1	301	4
20250713	1	302	2
20250713	1	303	4
20250713	1	304	4
20250713	1	305	4
20250713	1	306	3
20250713	1	307	3
20250713	1	308	2
20250713	1	309	2
20250713	1	310	2
20250713	1	311	3
20250713	1	313	4
20250713	1	314	2
20250713	1	317	4
20250713	1	319	3
20250713	1	320	3
20250713	1	321	4
20250713	1	322	4
20250713	1	324	3
20250713	1	326	2
20250713	1	327	4
20250713	1	329	3
20250713	1	330	4
20250713	1	331	4
20250713	1	333	2
20250713	1	334	2
20250713	1	335	2
20250713	1	336	3
20250713	1	337	2
20250713	1	340	2
20250713	1	341	4
20250713	1	342	4
20250713	1	343	2
20250713	1	344	3
20250713	1	345	3
20250713	1	346	2
20250713	1	347	4
20250713	1	349	4
20250713	1	350	4
20250713	1	351	3
20250713	1	353	2
20250713	1	354	3
20250713	1	356	4
20250713	1	358	4
20250713	1	360	4
20250713	1	361	4
20250713	1	362	2
20250713	1	363	3
20250713	1	364	3
20250713	1	365	2
20250713	1	366	4
20250713	1	367	4
20250713	1	368	2
20250713	1	369	4
20250713	1	370	3
20250713	1	371	3
20250713	1	372	2
20250713	1	373	3
20250713	1	374	3
20250713	1	375	2
20250713	1	376	4
20250713	1	377	3
20250713	1	378	4
20250713	1	380	2
20250713	1	381	2
20250713	1	382	4
20250713	1	383	3
20250713	1	385	2
20250713	1	387	3
20250713	1	388	3
20250713	1	389	2
20250713	1	390	3
20250713	1	391	4
20250713	1	392	4
20250713	1	393	2
20250713	1	394	4
20250713	1	395	3
20250713	1	397	3
20250713	1	400	2
20250713	1	401	2
20250713	1	402	3
20250713	1	403	4
20250713	1	406	2
20250713	1	407	2
20250713	1	408	4
20250713	1	409	4
20250713	1	410	3
20250713	1	411	2
20250713	1	412	4
20250713	1	413	3
20250713	1	414	3
20250713	1	415	3
20250713	1	416	2
20250713	1	417	4
20250713	1	418	4
20250713	1	420	2
20250713	1	423	2
20250713	1	424	3
20250713	1	427	4
20250713	1	428	4
20250713	1	429	2
20250713	1	432	3
20250713	1	433	4
20250713	1	434	4
20250713	1	435	2
20250713	1	436	3
20250713	1	437	2
20250713	1	438	2
20250713	1	439	4
20250713	1	440	2
20250713	1	441	2
20250713	1	442	3
20250713	1	443	3
20250713	1	444	4
20250713	1	445	3
20250713	1	446	2
20250713	1	447	4
20250713	1	448	2
20250713	1	450	3
20250713	1	451	2
20250713	1	453	3
20250713	1	454	2
20250713	1	455	4
20250713	1	456	2
20250713	1	457	2
20250713	1	458	2
20250713	1	460	4
20250713	1	461	2
20250713	1	462	2
20250713	1	463	3
20250713	1	464	4
20250713	1	465	2
20250713	1	466	2
20250713	1	467	4
20250713	1	468	4
20250713	1	470	2
20250713	1	471	3
20250713	1	473	2
20250713	1	476	3
20250713	1	478	2
20250713	1	479	2
20250713	1	480	2
20250713	1	481	3
20250713	1	482	3
20250713	1	483	3
20250713	1	484	4
20250713	1	486	4
20250713	1	488	2
20250713	1	489	4
20250713	1	490	2
20250713	1	491	2
20250713	1	492	2
20250713	1	494	4
20250713	1	496	2
20250713	1	498	2
20250713	1	499	2
20250713	1	500	4
20250713	1	501	3
20250713	1	502	4
20250713	1	503	3
20250713	1	504	4
20250713	1	506	4
20250713	1	510	4
20250713	1	511	2
20250713	1	512	2
20250713	1	514	2
20250713	1	518	2
20250713	1	520	2
20250713	1	521	4
20250713	1	523	2
20250713	1	524	2
20250713	1	525	4
20250713	1	527	2
20250713	1	528	3
20250713	1	529	4
20250713	1	530	3
20250713	1	531	4
20250713	1	533	3
20250713	1	534	2
20250713	1	535	4
20250713	1	536	3
20250713	1	539	2
20250713	1	540	3
20250713	1	542	4
20250713	1	543	2
20250713	1	544	2
20250713	1	545	4
20250713	1	548	2
20250713	1	549	2
20250713	1	550	3
20250713	1	551	3
20250713	1	554	4
20250713	1	555	3
20250713	1	556	3
20250713	1	557	2
20250713	1	559	4
20250713	1	560	3
20250713	1	561	4
20250713	1	562	4
20250713	1	563	4
20250713	1	565	2
20250713	1	566	2
20250713	1	567	2
20250713	1	568	2
20250713	1	569	2
20250713	1	570	2
20250713	1	571	2
20250713	1	572	4
20250713	1	573	4
20250713	1	574	2
20250713	1	575	2
20250713	1	577	3
20250713	1	578	2
20250713	1	579	4
20250713	1	580	4
20250713	1	581	3
20250713	1	583	3
20250713	1	584	2
20250713	1	586	4
20250713	1	587	3
20250713	1	590	3
20250713	1	592	2
20250713	1	594	3
20250713	1	595	4
20250713	1	596	2
20250713	1	598	4
20250713	1	599	3
20250713	1	600	2
20250713	1	601	3
20250713	1	602	2
20250713	1	603	4
20250713	1	606	2
20250713	1	608	2
20250713	1	609	4
20250713	1	610	2
20250713	1	611	4
20250713	1	613	2
20250713	1	614	3
20250713	1	616	2
20250713	1	617	3
20250713	1	619	2
20250713	1	620	2
20250713	1	621	4
20250713	1	623	2
20250713	1	624	3
20250713	1	625	3
20250713	1	628	3
20250713	1	631	3
20250713	1	632	3
20250713	1	636	3
20250713	1	637	2
20250713	1	638	4
20250713	1	641	3
20250713	1	643	3
20250713	1	644	3
20250713	1	645	3
20250713	1	646	3
20250713	1	647	3
20250713	1	648	4
20250713	1	649	2
20250713	1	650	2
20250713	1	651	2
20250713	1	652	4
20250713	1	653	2
20250713	1	654	2
20250713	1	655	3
20250713	1	657	4
20250713	1	660	2
20250713	1	661	4
20250713	1	662	2
20250713	1	663	3
20250713	1	664	2
20250713	1	665	4
20250713	1	666	3
20250713	1	667	2
20250713	1	668	2
20250713	1	670	4
20250713	1	672	2
20250713	1	673	2
20250713	1	674	3
20250713	1	675	2
20250713	1	676	2
20250713	1	677	3
20250713	1	678	4
20250713	1	679	2
20250713	1	680	2
20250713	1	681	3
20250713	1	682	3
20250713	1	683	4
20250713	1	686	4
20250713	1	687	3
20250713	1	689	4
20250713	1	690	4
20250713	1	691	3
20250713	1	693	2
20250713	1	694	4
20250713	1	695	2
20250713	1	696	2
20250713	1	697	4
20250713	1	698	4
20250713	1	699	2
20250713	1	702	4
20250713	1	704	2
20250713	1	705	4
20250713	1	706	2
20250713	1	707	2
20250713	1	708	2
20250713	1	709	2
20250713	1	710	4
20250713	1	715	4
20250713	1	716	2
20250713	1	717	2
20250713	1	719	2
20250713	1	720	3
20250713	1	721	2
20250713	1	722	2
20250713	1	723	4
20250713	1	724	2
20250713	1	725	3
20250713	1	727	2
20250713	1	728	3
20250713	1	730	4
20250713	1	732	4
20250713	1	733	4
20250713	1	734	2
20250713	1	735	3
20250713	1	736	4
20250713	1	737	2
20250713	1	738	4
20250713	1	739	2
20250713	1	741	4
20250713	1	743	2
20250713	1	744	2
20250713	1	745	4
20250713	1	746	2
20250713	1	747	2
20250713	1	748	4
20250713	1	749	2
20250713	1	750	3
20250713	1	753	4
20250713	1	755	4
20250713	1	757	3
20250713	1	759	2
20250713	1	760	3
20250713	1	763	3
20250713	1	764	4
20250713	1	765	4
20250713	1	766	3
20250713	1	767	4
20250713	1	768	3
20250713	1	771	3
20250713	1	772	4
20250713	1	773	4
20250713	1	774	4
20250713	1	775	3
20250713	1	776	2
20250713	1	777	3
20250713	1	778	4
20250713	1	782	3
20250713	1	783	4
20250713	1	784	3
20250713	1	785	4
20250713	1	786	3
20250713	1	787	3
20250713	1	788	2
20250713	1	789	4
20250713	1	790	4
20250713	1	791	2
20250713	1	793	4
20250713	1	794	2
20250713	1	795	4
20250713	1	796	2
20250713	1	797	2
20250713	1	798	2
20250713	1	799	2
20250713	1	800	2
20250713	1	803	4
20250713	1	804	4
20250713	1	805	2
20250713	1	806	3
20250713	1	807	3
20250713	1	810	4
20250713	1	811	3
20250713	1	812	3
20250713	1	814	3
20250713	1	815	3
20250713	1	816	4
20250713	1	817	2
20250713	1	818	3
20250713	1	819	3
20250713	1	820	4
20250713	1	823	3
20250713	1	825	3
20250713	1	827	2
20250713	1	829	2
20250713	1	831	3
20250713	1	832	4
20250713	1	833	3
20250713	1	835	4
20250713	1	836	3
20250713	1	838	2
20250713	1	840	4
20250713	1	841	3
20250713	1	842	2
20250713	1	843	4
20250713	1	844	2
20250713	1	845	4
20250713	1	846	4
20250713	1	848	3
20250713	1	849	4
20250713	1	850	3
20250713	1	851	3
20250713	1	852	4
20250713	1	853	3
20250713	1	855	2
20250713	1	856	4
20250713	1	857	3
20250713	1	859	3
20250713	1	861	3
20250713	1	862	3
20250713	1	863	4
20250713	1	864	4
20250713	1	865	4
20250713	1	867	4
20250713	1	868	3
20250713	1	869	4
20250713	1	870	4
20250713	1	871	2
20250713	1	873	4
20250713	1	875	3
20250713	1	876	2
20250713	1	877	3
20250713	1	879	4
20250713	1	880	4
20250713	1	882	4
20250713	1	885	2
20250713	1	886	4
20250713	1	887	4
20250713	1	888	4
20250713	1	889	3
20250713	1	890	3
20250713	1	891	3
20250713	1	892	3
20250713	1	893	4
20250713	1	894	3
20250713	1	895	4
20250713	1	896	2
20250713	1	897	4
20250713	1	898	3
20250713	1	899	3
20250713	1	900	2
20250713	1	901	4
20250713	1	902	4
20250713	1	904	2
20250713	1	905	3
20250713	1	906	2
20250713	1	907	4
20250713	1	908	2
20250713	1	911	4
20250713	1	912	3
20250713	1	913	4
20250713	1	914	2
20250713	1	915	4
20250713	1	916	2
20250713	1	917	3
20250713	1	919	4
20250713	1	920	3
20250713	1	921	2
20250713	1	922	3
20250713	1	924	2
20250713	1	925	3
20250713	1	927	4
20250713	1	928	3
20250713	1	929	4
20250713	1	930	3
20250713	1	932	2
20250713	1	933	3
20250713	1	936	2
20250713	1	937	2
20250713	1	938	4
20250713	1	940	3
20250713	1	941	4
20250713	1	942	2
20250713	1	944	2
20250713	1	945	4
20250713	1	947	2
20250713	1	948	2
20250713	1	949	4
20250713	1	951	3
20250713	1	952	3
20250713	1	953	4
20250713	1	956	4
20250713	1	957	3
20250713	1	958	3
20250713	1	959	2
20250713	1	961	3
20250713	1	962	4
20250713	1	963	2
20250713	1	964	3
20250713	1	965	2
20250713	1	966	2
20250713	1	967	3
20250713	1	968	3
20250713	1	969	4
20250713	1	970	3
20250713	1	971	4
20250713	1	972	3
20250713	1	973	4
20250713	1	974	2
20250713	1	975	2
20250713	1	976	2
20250713	1	978	3
20250713	1	979	4
20250713	1	980	3
20250713	1	981	3
20250713	1	982	3
20250713	1	983	3
20250713	1	984	2
20250713	1	985	4
20250713	1	986	4
20250713	1	987	2
20250713	1	988	3
20250713	1	989	4
20250713	1	991	2
20250713	1	993	4
20250713	1	994	3
20250713	1	995	4
20250713	1	996	2
20250713	1	997	2
20250713	1	999	2
20250713	1	1000	4
20250713	2	1	4
20250713	2	2	3
20250713	2	3	4
20250713	2	4	3
20250713	2	5	3
20250713	2	6	3
20250713	2	7	3
20250713	2	8	4
20250713	2	9	2
20250713	2	10	3
20250713	2	11	3
20250713	2	12	4
20250713	2	13	4
20250713	2	15	4
20250713	2	16	2
20250713	2	17	3
20250713	2	18	3
20250713	2	19	2
20250713	2	21	4
20250713	2	22	3
20250713	2	23	2
20250713	2	25	2
20250713	2	26	3
20250713	2	31	4
20250713	2	32	2
20250713	2	34	4
20250713	2	35	3
20250713	2	37	3
20250713	2	39	4
20250713	2	40	4
20250713	2	42	4
20250713	2	43	4
20250713	2	44	3
20250713	2	45	2
20250713	2	46	3
20250713	2	47	2
20250713	2	48	2
20250713	2	49	3
20250713	2	50	2
20250713	2	51	4
20250713	2	52	2
20250713	2	54	2
20250713	2	55	2
20250713	2	56	2
20250713	2	57	3
20250713	2	58	4
20250713	2	59	2
20250713	2	61	2
20250713	2	62	2
20250713	2	63	2
20250713	2	64	3
20250713	2	65	4
20250713	2	67	4
20250713	2	68	2
20250713	2	69	4
20250713	2	70	2
20250713	2	71	4
20250713	2	72	2
20250713	2	73	4
20250713	2	74	2
20250713	2	75	3
20250713	2	77	2
20250713	2	78	4
20250713	2	79	3
20250713	2	83	2
20250713	2	85	4
20250713	2	86	4
20250713	2	88	4
20250713	2	89	3
20250713	2	90	3
20250713	2	91	4
20250713	2	92	2
20250713	2	93	3
20250713	2	95	3
20250713	2	97	2
20250713	2	99	3
20250713	2	100	2
20250713	2	101	2
20250713	2	102	2
20250713	2	103	4
20250713	2	104	3
20250713	2	105	3
20250713	2	107	2
20250713	2	109	4
20250713	2	111	4
20250713	2	112	3
20250713	2	113	4
20250713	2	114	3
20250713	2	115	4
20250713	2	116	4
20250713	2	117	2
20250713	2	118	2
20250713	2	119	4
20250713	2	121	3
20250713	2	122	3
20250713	2	123	3
20250713	2	124	3
20250713	2	125	2
20250713	2	126	3
20250713	2	127	4
20250713	2	129	3
20250713	2	130	4
20250713	2	131	2
20250713	2	132	2
20250713	2	133	2
20250713	2	134	3
20250713	2	135	4
20250713	2	137	4
20250713	2	138	3
20250713	2	139	2
20250713	2	140	3
20250713	2	141	2
20250713	2	142	2
20250713	2	143	3
20250713	2	145	3
20250713	2	147	3
20250713	2	149	3
20250713	2	150	4
20250713	2	151	2
20250713	2	154	4
20250713	2	155	3
20250713	2	156	2
20250713	2	157	3
20250713	2	158	3
20250713	2	159	3
20250713	2	160	3
20250713	2	162	4
20250713	2	163	3
20250713	2	164	3
20250713	2	165	2
20250713	2	166	2
20250713	2	167	3
20250713	2	169	2
20250713	2	170	4
20250713	2	172	3
20250713	2	173	2
20250713	2	174	4
20250713	2	175	3
20250713	2	176	4
20250713	2	177	3
20250713	2	180	2
20250713	2	181	4
20250713	2	183	3
20250713	2	184	3
20250713	2	186	2
20250713	2	187	3
20250713	2	189	4
20250713	2	190	4
20250713	2	191	3
20250713	2	193	4
20250713	2	194	2
20250713	2	199	4
20250713	2	200	4
20250713	2	203	4
20250713	2	204	2
20250713	2	206	4
20250713	2	210	3
20250713	2	212	2
20250713	2	214	4
20250713	2	215	3
20250713	2	216	3
20250713	2	218	3
20250713	2	220	4
20250713	2	222	4
20250713	2	223	2
20250713	2	226	3
20250713	2	227	2
20250713	2	228	4
20250713	2	229	2
20250713	2	231	4
20250713	2	232	2
20250713	2	233	2
20250713	2	234	3
20250713	2	235	4
20250713	2	236	4
20250713	2	239	4
20250713	2	240	3
20250713	2	242	3
20250713	2	243	4
20250713	2	244	3
20250713	2	245	4
20250713	2	246	3
20250713	2	247	4
20250713	2	248	2
20250713	2	249	4
20250713	2	250	4
20250713	2	251	3
20250713	2	252	3
20250713	2	253	2
20250713	2	254	3
20250713	2	255	2
20250713	2	256	3
20250713	2	257	3
20250713	2	258	4
20250713	2	260	4
20250713	2	262	2
20250713	2	263	3
20250713	2	264	2
20250713	2	266	4
20250713	2	267	2
20250713	2	268	2
20250713	2	269	4
20250713	2	270	4
20250713	2	271	2
20250713	2	273	3
20250713	2	274	4
20250713	2	275	2
20250713	2	280	2
20250713	2	281	4
20250713	2	282	3
20250713	2	284	4
20250713	2	285	4
20250713	2	286	3
20250713	2	287	2
20250713	2	288	4
20250713	2	292	3
20250713	2	293	3
20250713	2	294	3
20250713	2	295	4
20250713	2	297	2
20250713	2	298	3
20250713	2	300	4
20250713	2	301	4
20250713	2	302	4
20250713	2	303	2
20250713	2	304	2
20250713	2	305	3
20250713	2	307	3
20250713	2	308	2
20250713	2	309	4
20250713	2	311	4
20250713	2	312	3
20250713	2	313	2
20250713	2	314	4
20250713	2	315	3
20250713	2	316	2
20250713	2	317	3
20250713	2	319	4
20250713	2	320	4
20250713	2	322	2
20250713	2	323	4
20250713	2	324	2
20250713	2	326	4
20250713	2	327	2
20250713	2	328	4
20250713	2	329	3
20250713	2	330	3
20250713	2	331	4
20250713	2	333	2
20250713	2	334	4
20250713	2	336	2
20250713	2	337	2
20250713	2	338	3
20250713	2	339	3
20250713	2	341	4
20250713	2	344	2
20250713	2	345	2
20250713	2	346	4
20250713	2	348	4
20250713	2	349	3
20250713	2	350	4
20250713	2	351	3
20250713	2	352	4
20250713	2	353	4
20250713	2	354	2
20250713	2	355	2
20250713	2	356	4
20250713	2	357	4
20250713	2	358	4
20250713	2	361	4
20250713	2	363	3
20250713	2	365	2
20250713	2	366	3
20250713	2	367	3
20250713	2	369	4
20250713	2	370	2
20250713	2	373	2
20250713	2	374	4
20250713	2	376	3
20250713	2	377	3
20250713	2	378	4
20250713	2	379	4
20250713	2	380	3
20250713	2	381	3
20250713	2	382	4
20250713	2	383	2
20250713	2	384	3
20250713	2	385	3
20250713	2	387	3
20250713	2	388	3
20250713	2	389	2
20250713	2	391	3
20250713	2	392	2
20250713	2	395	3
20250713	2	396	4
20250713	2	397	4
20250713	2	398	4
20250713	2	399	2
20250713	2	402	3
20250713	2	403	4
20250713	2	405	2
20250713	2	406	4
20250713	2	408	3
20250713	2	409	3
20250713	2	410	2
20250713	2	412	4
20250713	2	414	3
20250713	2	415	3
20250713	2	416	4
20250713	2	417	2
20250713	2	418	4
20250713	2	420	3
20250713	2	421	4
20250713	2	422	2
20250713	2	423	2
20250713	2	424	2
20250713	2	425	2
20250713	2	426	3
20250713	2	428	2
20250713	2	429	4
20250713	2	430	4
20250713	2	431	3
20250713	2	432	2
20250713	2	433	2
20250713	2	434	4
20250713	2	436	3
20250713	2	437	4
20250713	2	438	3
20250713	2	439	2
20250713	2	440	2
20250713	2	443	4
20250713	2	444	4
20250713	2	445	3
20250713	2	446	2
20250713	2	447	3
20250713	2	448	3
20250713	2	449	4
20250713	2	450	4
20250713	2	451	3
20250713	2	452	4
20250713	2	453	2
20250713	2	456	4
20250713	2	457	4
20250713	2	458	4
20250713	2	459	2
20250713	2	460	4
20250713	2	461	4
20250713	2	462	3
20250713	2	463	2
20250713	2	464	3
20250713	2	465	3
20250713	2	467	3
20250713	2	468	4
20250713	2	469	3
20250713	2	471	4
20250713	2	472	2
20250713	2	473	3
20250713	2	474	4
20250713	2	475	2
20250713	2	476	4
20250713	2	477	3
20250713	2	478	3
20250713	2	479	3
20250713	2	480	2
20250713	2	481	3
20250713	2	483	2
20250713	2	484	3
20250713	2	485	3
20250713	2	486	2
20250713	2	487	3
20250713	2	488	3
20250713	2	489	4
20250713	2	491	4
20250713	2	493	3
20250713	2	494	2
20250713	2	496	3
20250713	2	500	4
20250713	2	501	2
20250713	2	502	3
20250713	2	504	2
20250713	2	505	4
20250713	2	506	2
20250713	2	507	2
20250713	2	508	3
20250713	2	509	3
20250713	2	511	3
20250713	2	512	4
20250713	2	513	2
20250713	2	514	4
20250713	2	515	2
20250713	2	516	3
20250713	2	517	2
20250713	2	518	4
20250713	2	519	4
20250713	2	521	3
20250713	2	522	2
20250713	2	524	4
20250713	2	525	4
20250713	2	526	4
20250713	2	527	4
20250713	2	531	4
20250713	2	532	4
20250713	2	534	3
20250713	2	536	2
20250713	2	537	3
20250713	2	538	3
20250713	2	541	2
20250713	2	542	2
20250713	2	544	2
20250713	2	545	2
20250713	2	546	4
20250713	2	547	2
20250713	2	549	2
20250713	2	551	3
20250713	2	552	4
20250713	2	553	3
20250713	2	554	3
20250713	2	555	4
20250713	2	556	4
20250713	2	557	3
20250713	2	558	2
20250713	2	559	4
20250713	2	560	2
20250713	2	562	2
20250713	2	563	3
20250713	2	564	3
20250713	2	567	2
20250713	2	568	2
20250713	2	570	3
20250713	2	571	4
20250713	2	572	4
20250713	2	574	3
20250713	2	575	4
20250713	2	576	3
20250713	2	578	3
20250713	2	579	3
20250713	2	580	2
20250713	2	582	2
20250713	2	583	2
20250713	2	585	4
20250713	2	586	4
20250713	2	588	4
20250713	2	589	4
20250713	2	590	4
20250713	2	591	3
20250713	2	592	2
20250713	2	593	4
20250713	2	595	4
20250713	2	596	4
20250713	2	597	4
20250713	2	599	2
20250713	2	600	2
20250713	2	601	2
20250713	2	602	3
20250713	2	603	2
20250713	2	604	3
20250713	2	605	2
20250713	2	606	4
20250713	2	608	4
20250713	2	609	4
20250713	2	610	3
20250713	2	611	2
20250713	2	612	2
20250713	2	614	3
20250713	2	615	4
20250713	2	616	4
20250713	2	618	4
20250713	2	619	4
20250713	2	620	3
20250713	2	621	4
20250713	2	622	2
20250713	2	623	3
20250713	2	624	4
20250713	2	625	4
20250713	2	626	4
20250713	2	627	3
20250713	2	628	2
20250713	2	629	4
20250713	2	630	3
20250713	2	631	2
20250713	2	633	3
20250713	2	634	4
20250713	2	635	2
20250713	2	637	3
20250713	2	638	4
20250713	2	639	3
20250713	2	640	3
20250713	2	641	4
20250713	2	643	3
20250713	2	644	4
20250713	2	645	3
20250713	2	646	2
20250713	2	647	3
20250713	2	648	2
20250713	2	649	4
20250713	2	650	4
20250713	2	651	4
20250713	2	654	2
20250713	2	655	3
20250713	2	656	2
20250713	2	657	2
20250713	2	658	4
20250713	2	659	2
20250713	2	660	2
20250713	2	662	2
20250713	2	663	2
20250713	2	664	3
20250713	2	665	3
20250713	2	666	2
20250713	2	667	2
20250713	2	668	3
20250713	2	670	3
20250713	2	672	4
20250713	2	673	2
20250713	2	676	4
20250713	2	677	4
20250713	2	679	2
20250713	2	680	4
20250713	2	681	3
20250713	2	683	4
20250713	2	684	2
20250713	2	685	2
20250713	2	687	4
20250713	2	688	4
20250713	2	689	2
20250713	2	690	2
20250713	2	691	2
20250713	2	692	3
20250713	2	693	3
20250713	2	694	2
20250713	2	696	3
20250713	2	697	4
20250713	2	698	3
20250713	2	700	3
20250713	2	702	4
20250713	2	703	2
20250713	2	704	3
20250713	2	706	4
20250713	2	707	4
20250713	2	708	2
20250713	2	709	4
20250713	2	710	2
20250713	2	711	4
20250713	2	714	3
20250713	2	715	3
20250713	2	716	3
20250713	2	717	2
20250713	2	718	2
20250713	2	720	4
20250713	2	722	2
20250713	2	723	3
20250713	2	724	4
20250713	2	725	3
20250713	2	726	3
20250713	2	727	3
20250713	2	728	2
20250713	2	729	4
20250713	2	730	4
20250713	2	731	3
20250713	2	733	3
20250713	2	734	4
20250713	2	735	4
20250713	2	737	4
20250713	2	738	4
20250713	2	739	3
20250713	2	740	3
20250713	2	741	2
20250713	2	743	4
20250713	2	744	3
20250713	2	745	4
20250713	2	746	3
20250713	2	747	3
20250713	2	748	4
20250713	2	749	2
20250713	2	751	2
20250713	2	752	3
20250713	2	753	4
20250713	2	754	2
20250713	2	755	3
20250713	2	756	3
20250713	2	757	2
20250713	2	758	3
20250713	2	759	4
20250713	2	760	4
20250713	2	761	3
20250713	2	762	4
20250713	2	763	2
20250713	2	764	4
20250713	2	767	4
20250713	2	768	3
20250713	2	769	2
20250713	2	770	3
20250713	2	771	4
20250713	2	772	2
20250713	2	773	4
20250713	2	775	2
20250713	2	776	3
20250713	2	777	3
20250713	2	778	2
20250713	2	779	2
20250713	2	780	3
20250713	2	781	2
20250713	2	782	3
20250713	2	784	3
20250713	2	785	2
20250713	2	786	4
20250713	2	788	2
20250713	2	789	4
20250713	2	790	3
20250713	2	791	4
20250713	2	792	3
20250713	2	794	2
20250713	2	796	3
20250713	2	797	3
20250713	2	798	2
20250713	2	800	4
20250713	2	803	2
20250713	2	804	3
20250713	2	805	3
20250713	2	806	2
20250713	2	807	2
20250713	2	808	2
20250713	2	809	4
20250713	2	810	3
20250713	2	812	3
20250713	2	813	4
20250713	2	814	4
20250713	2	816	3
20250713	2	818	2
20250713	2	820	2
20250713	2	821	4
20250713	2	822	2
20250713	2	823	4
20250713	2	824	4
20250713	2	826	2
20250713	2	827	4
20250713	2	828	4
20250713	2	829	3
20250713	2	830	4
20250713	2	833	4
20250713	2	834	3
20250713	2	835	4
20250713	2	837	3
20250713	2	838	4
20250713	2	839	2
20250713	2	841	4
20250713	2	842	2
20250713	2	843	3
20250713	2	844	2
20250713	2	845	3
20250713	2	846	4
20250713	2	847	4
20250713	2	849	4
20250713	2	850	4
20250713	2	851	3
20250713	2	852	3
20250713	2	854	4
20250713	2	855	2
20250713	2	856	4
20250713	2	857	4
20250713	2	858	4
20250713	2	859	3
20250713	2	861	3
20250713	2	862	2
20250713	2	863	3
20250713	2	864	2
20250713	2	865	2
20250713	2	866	2
20250713	2	869	3
20250713	2	870	4
20250713	2	871	3
20250713	2	872	3
20250713	2	873	4
20250713	2	875	4
20250713	2	877	2
20250713	2	878	4
20250713	2	879	3
20250713	2	880	4
20250713	2	881	4
20250713	2	883	2
20250713	2	884	3
20250713	2	887	2
20250713	2	890	4
20250713	2	891	4
20250713	2	892	4
20250713	2	893	4
20250713	2	894	2
20250713	2	895	3
20250713	2	896	2
20250713	2	897	4
20250713	2	898	2
20250713	2	900	2
20250713	2	901	3
20250713	2	902	3
20250713	2	903	2
20250713	2	906	3
20250713	2	908	2
20250713	2	910	2
20250713	2	911	4
20250713	2	912	3
20250713	2	913	2
20250713	2	914	4
20250713	2	915	2
20250713	2	916	2
20250713	2	917	2
20250713	2	918	4
20250713	2	920	2
20250713	2	921	2
20250713	2	922	4
20250713	2	923	3
20250713	2	924	3
20250713	2	925	2
20250713	2	926	2
20250713	2	930	3
20250713	2	931	3
20250713	2	932	2
20250713	2	934	3
20250713	2	935	2
20250713	2	936	4
20250713	2	937	3
20250713	2	938	2
20250713	2	939	4
20250713	2	941	3
20250713	2	942	2
20250713	2	944	3
20250713	2	945	4
20250713	2	946	4
20250713	2	948	4
20250713	2	949	2
20250713	2	951	4
20250713	2	953	2
20250713	2	957	2
20250713	2	958	3
20250713	2	960	3
20250713	2	961	2
20250713	2	963	3
20250713	2	964	2
20250713	2	966	4
20250713	2	967	2
20250713	2	970	4
20250713	2	972	3
20250713	2	973	4
20250713	2	975	3
20250713	2	976	4
20250713	2	977	3
20250713	2	979	3
20250713	2	980	2
20250713	2	981	3
20250713	2	982	4
20250713	2	985	3
20250713	2	986	2
20250713	2	987	2
20250713	2	988	2
20250713	2	989	2
20250713	2	990	2
20250713	2	991	3
20250713	2	992	4
20250713	2	993	3
20250713	2	995	2
20250713	2	998	2
20250713	2	999	3
20250713	2	1000	4
\.


--
-- TOC entry 4897 (class 0 OID 50861)
-- Dependencies: 222
-- Data for Name: fact_rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fact_rental (rental_id, tiempo_id, customer_id, staff_id, fecha_carga, rental_date_id, payment_amount, payment_date_id) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 75578)
-- Dependencies: 225
-- Data for Name: geography; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geography (geography_id, country, city, postal_code, address) FROM stdin;
\.


--
-- TOC entry 4728 (class 2606 OID 50865)
-- Name: dim_actor dim_actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_actor
    ADD CONSTRAINT dim_actor_pkey PRIMARY KEY (actor_id);


--
-- TOC entry 4730 (class 2606 OID 50867)
-- Name: dim_customer dim_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4732 (class 2606 OID 50869)
-- Name: dim_film dim_film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_film
    ADD CONSTRAINT dim_film_pkey PRIMARY KEY (film_id);


--
-- TOC entry 4734 (class 2606 OID 50871)
-- Name: dim_staff dim_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_staff
    ADD CONSTRAINT dim_staff_pkey PRIMARY KEY (staff_id);


--
-- TOC entry 4736 (class 2606 OID 50873)
-- Name: dim_store dim_store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_store
    ADD CONSTRAINT dim_store_pkey PRIMARY KEY (store_id);


--
-- TOC entry 4740 (class 2606 OID 50933)
-- Name: dim_tiempo dim_tiempo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_tiempo
    ADD CONSTRAINT dim_tiempo_pkey PRIMARY KEY (tiempo_id);


--
-- TOC entry 4738 (class 2606 OID 50877)
-- Name: fact_rental fact_rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_pkey PRIMARY KEY (rental_id);


--
-- TOC entry 4744 (class 2606 OID 50955)
-- Name: fact_inventory fact_inventory_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_inventory
    ADD CONSTRAINT fact_inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES public.dim_film(film_id);


--
-- TOC entry 4745 (class 2606 OID 50950)
-- Name: fact_inventory fact_inventory_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_inventory
    ADD CONSTRAINT fact_inventory_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.dim_store(store_id);


--
-- TOC entry 4746 (class 2606 OID 50945)
-- Name: fact_inventory fact_inventory_tiempo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_inventory
    ADD CONSTRAINT fact_inventory_tiempo_id_fkey FOREIGN KEY (tiempo_id) REFERENCES public.dim_tiempo(tiempo_id);


--
-- TOC entry 4742 (class 2606 OID 50893)
-- Name: fact_rental fact_rental_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.dim_customer(customer_id);


--
-- TOC entry 4743 (class 2606 OID 50898)
-- Name: fact_rental fact_rental_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fact_rental
    ADD CONSTRAINT fact_rental_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES public.dim_staff(staff_id);


--
-- TOC entry 4741 (class 2606 OID 50908)
-- Name: dim_actor fk_film; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dim_actor
    ADD CONSTRAINT fk_film FOREIGN KEY (film_id) REFERENCES public.dim_film(film_id);


-- Completed on 2025-08-01 21:25:08

--
-- PostgreSQL database dump complete
--

