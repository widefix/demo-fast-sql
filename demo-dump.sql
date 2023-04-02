--
-- PostgreSQL database dump
--

-- D-- Dumped from database version 15.1 (Debian 15.1-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Debian 15.1-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id bigint NOT NULL,
    name character varying NOT NULL,
    slug character varying NOT NULL,
    "order" integer NOT NULL,
    active boolean NOT NULL,
    parent_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    description text,
    user_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    status character varying DEFAULT 'Open'::character varying,
    category character varying,
    experience character varying,
    existing_website character varying,
    existing_website_platform character varying,
    category_tasks character varying[],
    delivery_timeline character varying,
    budget character varying,
    language_preference character varying[],
    location_preference character varying,
    raw_json json,
    vendor_id bigint,
    project_data json,
    category_id bigint
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ratings (
    id bigint NOT NULL,
    reviewer_id bigint,
    reviewee_id bigint,
    rating integer,
    review text,
    project_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    user_id bigint,
    category_id bigint,
    status character varying DEFAULT 'pending'::character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    active boolean DEFAULT true
);


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    external_user_id bigint,
    account_id bigint,
    name character varying,
    email character varying,
    given_name character varying,
    family_name character varying,
    nickname character varying,
    picture character varying,
    employee_account boolean,
    developer_account boolean,
    user_type character varying,
    external_updated_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    ratings_total integer,
    ratings_count integer,
    languages character varying[],
    location character varying,
    website character varying,
    vendor_company character varying,
    terms_accepted_at timestamp(6) without time zone,
    about text,
    company_name character varying,
    scheduling_link character varying,
    paypal_email character varying,
    profile_url character varying,
    slug character varying,
    avatar character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2023-04-02 21:15:09.606065	2023-04-02 21:15:09.606065
schema_sha1	e2eb2df8ff377c7254f3a1404c0774e6c359ecce	2023-04-02 21:15:09.622842	2023-04-02 21:15:09.622842
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, slug, "order", active, parent_id, created_at, updated_at) FROM stdin;
1	Website setup and design	website-setup-design	1	t	\N	2023-01-13 00:24:26.730281	2023-01-13 00:24:26.730281
2	Website and landing page design	site-design	1	t	1	2023-01-13 00:24:26.740228	2023-01-13 00:24:26.740228
3	Expert Widefix site setup and guidance	site-setup	2	t	1	2023-01-13 00:24:26.74749	2023-01-13 00:24:26.74749
4	Custom coding, website development and troubleshooting	site-development	3	t	1	2023-01-13 00:24:26.75457	2023-01-13 00:24:26.75457
5	Content migration	content-migration	4	t	1	2023-01-13 00:24:26.761555	2023-01-13 00:24:26.761555
6	Search engine optimization	seo	5	t	1	2023-01-13 00:24:26.768431	2023-01-13 00:24:26.768431
7	Marketing and Sales	marketing-sales	2	f	\N	2023-01-13 00:24:26.775992	2023-01-13 00:24:26.775992
8	Sales funnels and lead magnets	sales-funnels	1	f	7	2023-01-13 00:24:26.782918	2023-01-13 00:24:26.782918
9	Advertising	advertising	2	f	7	2023-01-13 00:24:26.790073	2023-01-13 00:24:26.790073
10	Marketing and launch strategy/consulting	marketing-consulting	3	f	7	2023-01-13 00:24:26.79684	2023-01-13 00:24:26.79684
11	Email marketing and automation	email-marketing	4	f	7	2023-01-13 00:24:26.804103	2023-01-13 00:24:26.804103
12	Admin support	admin-support	3	f	\N	2023-01-13 00:24:26.811153	2023-01-13 00:24:26.811153
13	Virtual assistant services	va-services	1	f	12	2023-01-13 00:24:26.818813	2023-01-13 00:24:26.818813
14	Social media management	social-media	2	f	12	2023-01-13 00:24:26.82549	2023-01-13 00:24:26.82549
15	Accounting	accounting	3	f	12	2023-01-13 00:24:26.832311	2023-01-13 00:24:26.832311
16	Business strategy/consulting	business-consulting	4	f	12	2023-01-13 00:24:26.838793	2023-01-13 00:24:26.838793
17	Transcription	transcription	5	f	12	2023-01-13 00:24:26.845829	2023-01-13 00:24:26.845829
18	Content development	content-development	4	f	\N	2023-01-13 00:24:26.852689	2023-01-13 00:24:26.852689
19	Content creation/strategy	content-creation	1	f	18	2023-01-13 00:24:26.859214	2023-01-13 00:24:26.859214
20	Video editing	video-editing	2	f	18	2023-01-13 00:24:26.866065	2023-01-13 00:24:26.866065
21	Copywriting or editing	copywriting-editing	3	f	18	2023-01-13 00:24:26.87267	2023-01-13 00:24:26.87267
22	Podcast/audio editing	podcast-audio	4	f	18	2023-01-13 00:24:26.879701	2023-01-13 00:24:26.879701
23	Animation	animation	5	f	18	2023-01-13 00:24:26.888287	2023-01-13 00:24:26.888287
24	Visual design and branding	visual-design-branding	5	f	\N	2023-01-13 00:24:26.896324	2023-01-13 00:24:26.896324
25	Branding and logo design	branding-logo	1	f	24	2023-01-13 00:24:26.903279	2023-01-13 00:24:26.903279
26	eBook and document design	ebook-document	2	f	24	2023-01-13 00:24:26.910024	2023-01-13 00:24:26.910024
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.projects (id, description, user_id, created_at, updated_at, status, category, experience, existing_website, existing_website_platform, category_tasks, delivery_timeline, budget, language_preference, location_preference, raw_json, vendor_id, project_data, category_id) FROM stdin;
1	it's a test project	3	2022-09-29 20:10:46.751835	2023-01-17 23:22:42.275697	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English,French}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"it's a test project"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":4,"answer":"French"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"it's a test project","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English","French"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
2	This is the description	4	2022-10-05 18:12:15.048554	2023-01-17 23:22:42.302306	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	30 or more days	$1,000 - $2,499	{English,Portuguese}	Australia	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is the description"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":5,"answer":"30 or more days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":6,"answer":"Portuguese"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"Australia"}]}	2	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"30 or more days","description":"This is the description","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English","Portuguese"],"preferredLocation":"Australia","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
3	This is a test project from Chris User	1	2022-10-05 18:17:15.993303	2023-01-17 23:22:42.285312	Open	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	No, I don’t yet have a website set up and live for customers	Another platform	\N	7-10 days	Whatever it takes	{English,German}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":2,"answer":"No, I don’t yet have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":2,"answer":"Another platform"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a test project from Chris User"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":2,"answer":"7-10 days"},{"id":7,"question":"Which experts best fit your budget?","aid":3,"answer":"High-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":3,"answer":"German"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"Whatever it takes","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"7-10 days","description":"This is a test project from Chris User","hasWebsite":"No, I don’t yet have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","German"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Another platform","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme"],"websiteUrl":null}	2
4	This is a project from Chris User	1	2022-10-05 18:17:46.087209	2023-01-17 23:22:42.294129	Open	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	No, I don’t yet have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English,German}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":2,"answer":"No, I don’t yet have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a project from Chris User"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":3,"answer":"German"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"This is a project from Chris User","hasWebsite":"No, I don’t yet have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","German"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design landing pages"],"websiteUrl":null}	2
44	\N	9	2023-01-18 00:08:29.455991	2023-01-18 00:08:29.455991	Open	\N	\N	\N	\N	\N	\N	$5,000 - $9,999	{English}	United States	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines","Acquire inbound links","Guidance for bringing traffic to your website"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"I want the top spot! I want to be the best!","budget":"$5,000 - $9,999","preferredLanguages":["English"],"preferredLocation":"United States"}	1
5	This is a test project that will be closed immediately.	4	2022-10-05 18:21:28.644416	2023-01-17 23:22:42.313472	Closed	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	Yes, I already have a website set up and live for customers	Widefix	\N	30 or more days	$1,000 - $2,499	{Spanish,German}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"},{"aid":4,"answer":"Migrate my website content from another platform to Widefix"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a test project that will be closed immediately."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":5,"answer":"30 or more days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":2,"answer":"Spanish"},{"aid":3,"answer":"German"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"30 or more days","description":"This is a test project that will be closed immediately.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["Spanish","German"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme","Migrate my website content from another platform to Widefix"],"websiteUrl":null}	2
6	This project is testing that View Project goes to the correct project upon creation.	4	2022-10-05 18:23:10.155406	2023-01-17 23:22:42.322105	Closed	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	Yes, I already have a website set up and live for customers	Widefix	\N	30 or more days	$1,000 - $2,499	{English,Spanish}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This project is testing that View Project goes to the correct project upon creation."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":5,"answer":"30 or more days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":2,"answer":"Spanish"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"30 or more days","description":"This project is testing that View Project goes to the correct project upon creation.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","Spanish"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme"],"websiteUrl":null}	2
7	This is testing the View projects button	4	2022-10-05 18:58:28.841338	2023-01-17 23:22:42.346777	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	30 or more days	$1,000 - $2,499	{English,Spanish}	Andorra	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is testing the View projects button"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":5,"answer":"30 or more days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":2,"answer":"Spanish"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"Andorra"}]}	2	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"30 or more days","description":"This is testing the View projects button","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English","Spanish"],"preferredLocation":"Andorra","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
9	Here is a new project from Chris User!	1	2022-10-05 19:03:15.20962	2023-01-17 23:22:42.338957	Closed	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	Yes, I already have a website set up and live for customers	Widefix	\N	7-10 days	Whatever it takes	{German}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"Here is a new project from Chris User!"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":2,"answer":"7-10 days"},{"id":7,"question":"Which experts best fit your budget?","aid":3,"answer":"High-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":3,"answer":"German"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"Whatever it takes","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"7-10 days","description":"Here is a new project from Chris User!","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["German"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
45	\N	7	2023-01-18 21:26:30.310971	2023-01-30 23:47:30.512353	Complete	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"expertSiteSetup","subcategorySlug":"site-setup","subcategoryTitle":"Expert Widefix site setup and guidance","expertGuidance":["Website setup guidance"],"businessStage":"Expanding or scaling my business","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
10	This is a project I created to ensure project creation works for a user.	4	2022-10-10 18:02:41.116102	2023-01-17 23:22:42.380554	Open	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	No, I don’t yet have a website set up and live for customers	Another platform	\N	30 or more days	Less than $1,000 USD	{English,Spanish}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":2,"answer":"No, I don’t yet have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":2,"answer":"Another platform"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a project I created to ensure project creation works for a user."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":5,"answer":"30 or more days"},{"id":7,"question":"Which experts best fit your budget?","aid":1,"answer":"Low-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":2,"answer":"Spanish"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	2	{"budget":"Less than $1,000 USD","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"30 or more days","description":"This is a project I created to ensure project creation works for a user.","hasWebsite":"No, I don’t yet have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","Spanish"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Another platform","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme"],"websiteUrl":null}	2
11	This is a project to test closing functionality.	4	2022-10-11 18:01:14.14503	2023-01-17 23:22:42.388616	Closed	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	No, I don’t yet have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English,Spanish}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":2,"answer":"No, I don’t yet have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a project to test closing functionality."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":2,"answer":"Spanish"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"This is a project to test closing functionality.","hasWebsite":"No, I don’t yet have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","Spanish"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme"],"websiteUrl":null}	2
12	This is a project to test Mark as Complete functionality.	4	2022-10-11 18:01:42.050145	2023-01-17 23:22:42.397065	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a project to test Mark as Complete functionality."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	5	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"This is a project to test Mark as Complete functionality.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
13	Alpha	4	2022-10-12 17:24:58.973169	2023-01-17 23:22:42.406129	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"Alpha"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	5	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Alpha","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
46	\N	7	2023-01-18 21:26:56.666268	2023-01-18 21:26:56.666268	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Website"],"platform":"test","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
14	Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment. Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.	9	2022-10-18 18:14:33.850706	2023-01-17 23:22:42.330521	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment. Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	10	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment. Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
15	Canceled quote test project.	9	2022-10-19 16:30:22.109502	2023-01-17 23:22:42.355406	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"Canceled quote test project."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Canceled quote test project.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
16	This is a project created to test the admin	4	2022-10-19 17:48:49.798748	2023-01-17 23:22:42.415085	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English,German}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"This is a project created to test the admin"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":3,"answer":"German"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"This is a project created to test the admin","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English","German"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
17	A great yawning void!\n\n\n\n\n\n\nHuge tracts of land!\n\n\n\n\nThere's another line after this one!\n\n\n\n\n\n\nThis is that line.	9	2022-10-19 18:53:28.530728	2023-01-17 23:22:42.450917	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"A great yawning void!\\n\\n\\n\\n\\n\\n\\nHuge tracts of land!\\n\\n\\n\\n\\nThere's another line after this one!\\n\\n\\n\\n\\n\\n\\nThis is that line."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"A great yawning void!\\n\\n\\n\\n\\n\\n\\nHuge tracts of land!\\n\\n\\n\\n\\nThere's another line after this one!\\n\\n\\n\\n\\n\\n\\nThis is that line.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
18	Testing close updates	4	2022-10-21 16:50:28.264198	2023-01-17 23:22:42.423518	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"Testing close updates"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Testing close updates","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
19	Testing project close toast	4	2022-10-25 16:37:58.588518	2023-01-17 23:22:42.441803	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Feel free to include links to websites with designs similar to what you have in mind. ","answer":"Testing project close toast"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Testing project close toast","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
20	Testing toast messages	4	2022-10-28 19:26:55.06046	2023-01-17 23:22:42.363411	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Testing toast messages"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Testing toast messages","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
21	Testing complete toast message	4	2022-10-28 19:27:23.426114	2023-01-17 23:22:42.371549	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Testing complete toast message"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	5	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Testing complete toast message","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
22	testtttt	7	2022-11-02 21:38:54.341811	2023-01-17 23:22:42.468121	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"testtttt"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	6	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"testtttt","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
47	\N	7	2023-01-19 18:00:32.863737	2023-03-20 13:22:22.420599	Complete	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Website"],"platform":"tes","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
48	\N	7	2023-01-26 16:47:59.549404	2023-01-26 16:47:59.549404	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Website","Blog posts"],"platform":"test","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
23	asdf	4	2022-11-07 23:38:27.422478	2023-01-17 23:22:42.459519	Closed	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	No, I don’t yet have a website set up and live for customers	Another platform	\N	11-21 days	$1,000 - $2,499	{English,Portuguese}	United Kingdom	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":2,"answer":"No, I don’t yet have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":2,"answer":"Another platform"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"asdf"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":6,"answer":"Portuguese"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United Kingdom"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"asdf","hasWebsite":"No, I don’t yet have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","Portuguese"],"preferredLocation":"United Kingdom","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Another platform","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme"],"websiteUrl":null}	2
24	test	7	2022-11-09 20:12:00.392259	2023-01-17 23:22:42.476182	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"test"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"test","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
25	Creating a new project for Court to comment on with his vendor account.	4	2022-11-14 22:39:42.429677	2023-01-17 23:22:42.484393	Open	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English,Spanish}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Creating a new project for Court to comment on with his vendor account."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":2,"answer":"Spanish"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	5	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Creating a new project for Court to comment on with his vendor account.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English","Spanish"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
26	testing proposals and invoices	7	2022-12-05 20:59:24.613024	2023-01-17 23:22:42.509968	Complete	Website and landing page design	Moderately experienced — been using Widefix for a couple of years	Yes, I already have a website set up and live for customers	Another platform	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":2,"answer":"Moderately experienced — been using Widefix for a couple of years"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":2,"answer":"Another platform"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"testing proposals and invoices"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	6	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"testing proposals and invoices","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Another platform","websiteTasks":["Select, set up and customize website theme","Customize my existing website theme"],"websiteUrl":null}	2
100	\N	13	2023-03-09 23:48:50.679338	2023-03-09 23:48:50.679338	Open	\N	\N	\N	\N	\N	\N	$20,000 or more	{English}	United States	\N	\N	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"virtualAssistant","subcategorySlug":"va-services","subcategoryTitle":"Virtual assistant services","tasks":["Content migration"],"description":"This is the project I created with the new project routes. ","budget":"$20,000 or more","preferredLanguages":["English"],"preferredLocation":"United States"}	13
27	Testing Ben's new stuff.	9	2022-12-05 21:43:03.879332	2023-01-17 23:22:42.500817	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Testing Ben's new stuff."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	10	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Testing Ben's new stuff.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
28	This is the description	13	2022-12-08 22:08:37.939851	2023-01-17 23:22:42.492491	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"This is the description"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	14	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"This is the description","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
29	testttt	7	2022-12-12 18:03:59.710379	2023-01-17 23:22:42.518756	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"testttt"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	6	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"testttt","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
30	This project is to test the vendor going directly to conversations view instead of the project show view.	4	2022-12-13 19:10:29.856206	2023-01-17 23:22:42.527544	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"This project is to test the vendor going directly to conversations view instead of the project show view."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	5	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"This project is to test the vendor going directly to conversations view instead of the project show view.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
49	\N	7	2023-01-26 17:28:46.568075	2023-01-26 17:28:46.568075	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"customCoding","subcategorySlug":"site-development","subcategoryTitle":"Custom coding, website development and troubleshooting","developmentTasks":["Custom coding for your existing website"],"description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	1
31		7	2022-12-19 14:26:08.825938	2023-01-17 23:58:59.839693	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	1-7 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":""},{"id":6,"question":"What kind of delivery time are you looking for?","aid":1,"answer":"1-7 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"1-7 days","description":"","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
32	Total world domination	9	2023-01-03 22:31:50.479176	2023-01-17 23:22:42.54548	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Total world domination"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Total world domination","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
33		4	2023-01-09 18:33:07.568807	2023-01-17 23:22:42.55364	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":""},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
34	Test project for linking.	4	2023-01-12 19:26:06.381845	2023-01-17 23:22:42.561776	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	No location preference	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Test project for linking."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"No location preference"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Test project for linking.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"No location preference","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
50	\N	7	2023-01-26 17:29:52.592995	2023-03-22 09:48:47.48436	Complete	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	Australia	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Blog posts"],"platform":"test","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"Australia"}	1
51	\N	7	2023-01-26 17:30:39.048692	2023-01-26 17:30:39.048692	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
35	testing project creation after updating project table	9	2023-01-13 19:11:20.240065	2023-01-17 23:22:42.57025	Open	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"testing project creation after updating project table"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"testing project creation after updating project table","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
36	test	7	2023-01-13 20:17:39.465924	2023-01-17 23:58:48.350911	Closed	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"test"},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	\N	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"test","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"websiteUrl":null}	2
39	Project to test data migration/rake task.	9	2023-01-17 23:15:55.709137	2023-03-01 23:27:52.611104	Complete	Website and landing page design	New to Widefix — under one year	Yes, I already have a website set up and live for customers	Widefix	\N	11-21 days	$1,000 - $2,499	{English,Spanish,German,French}	United States	{"finalData":[{"id":1,"question":"Are you a new Widefix user or an old pro?","aid":1,"answer":"New to Widefix — under one year"},{"id":2,"question":"Do you already have a website for your business?","aid":1,"answer":"Yes, I already have a website set up and live for customers"},{"id":3,"question":"Is your existing website on Widefix or another platform?","aid":1,"answer":"Widefix"},{"id":4,"question":"What website set up tasks do you need help with?","answers":[{"aid":1,"answer":"Select, set up and customize website theme"},{"aid":2,"answer":"Design landing pages"},{"aid":3,"answer":"Customize my existing website theme"}]},{"id":5,"question":"Describe what you’re looking to achieve for your project. Include a link to your current site or page as well as links to websites with designs similar to what you have in mind. ","answer":"Project to test data migration/rake task."},{"id":6,"question":"What kind of delivery time are you looking for?","aid":3,"answer":"11-21 days"},{"id":7,"question":"Which experts best fit your budget?","aid":2,"answer":"Mid-priced experts"},{"id":8,"question":"What language do you prefer the expert to communicate in?","answers":[{"aid":1,"answer":"English"},{"aid":2,"answer":"Spanish"},{"aid":3,"answer":"German"},{"aid":4,"answer":"French"}]},{"id":9,"question":"Do you prefer to work with experts located in a certain country?","answer":"United States"}]}	10	{"budget":"$1,000 - $2,499","categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","deliveryTime":"11-21 days","description":"Project to test data migration/rake task.","hasWebsite":"Yes, I already have a website set up and live for customers","WidefixTenure":"New to Widefix — under one year","preferredLanguages":["English","Spanish","German","French"],"preferredLocation":"United States","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design landing pages","Customize my existing website theme"],"websiteUrl":null}	2
40	\N	7	2023-01-17 23:58:34.879473	2023-01-17 23:58:34.879473	Open	\N	\N	\N	\N	\N	\N	$1,000 - $2,499	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"customCoding","subcategorySlug":"site-development","subcategoryTitle":"Custom coding, website development and troubleshooting","developmentTasks":["Custom coding for your existing website","Custom app development"],"description":"test","budget":"$1,000 - $2,499","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
41	\N	4	2023-01-18 00:00:02.129113	2023-01-18 00:02:36.355348	Complete	\N	\N	\N	\N	\N	\N	I’m not sure	{English,Japanese}	United States	\N	5	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"expertSiteSetup","subcategorySlug":"site-setup","subcategoryTitle":"Expert Widefix site setup and guidance","expertGuidance":["Managing contacts, members and affiliates"],"businessStage":"Expanding or scaling my business","description":"This is the details.","budget":"I’m not sure","preferredLanguages":["English","Japanese"],"preferredLocation":"United States"}	1
42	\N	7	2023-01-18 00:00:48.076637	2023-01-18 00:00:48.076637	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English,French}	United States	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Community (e.g., migrate Facebook Group content to Widefix Communities)"],"platform":"Facebook Group","description":"i need 2 migrate","budget":"I’m not sure","preferredLanguages":["English","French"],"preferredLocation":"United States"}	1
43	\N	7	2023-01-18 00:05:49.305943	2023-01-18 00:05:49.305943	Open	\N	\N	\N	\N	\N	\N	Whatever it takes	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"Audit me.","budget":"Whatever it takes","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
52	\N	7	2023-01-27 20:14:02.139482	2023-02-02 02:01:07.807147	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"customCoding","subcategorySlug":"site-development","subcategoryTitle":"Custom coding, website development and troubleshooting","developmentTasks":["Technical troubleshooting"],"description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	4
53	\N	7	2023-01-27 20:14:57.010722	2023-01-27 20:14:57.010722	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	6
54	\N	7	2023-01-27 20:15:43.832182	2023-02-08 00:26:20.314648	Closed	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"expertSiteSetup","subcategorySlug":"site-setup","subcategoryTitle":"Expert Widefix site setup and guidance","expertGuidance":["Funnels, forms, events and automations"],"businessStage":"Expanding or scaling my business","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	3
55	\N	7	2023-01-30 20:24:42.50992	2023-01-30 20:24:42.50992	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"New to Widefix — under one year","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"google.com","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"description":"test","deliveryTime":"11-21 days","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	2
56	\N	7	2023-01-30 21:59:35.541553	2023-02-01 23:32:07.609832	Closed	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Blog posts","Community (e.g., migrate Facebook Group content to Widefix Communities)"],"platform":"test","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	5
57	\N	7	2023-01-30 23:39:29.700296	2023-02-02 17:53:42.082335	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"contentMigration","subcategorySlug":"content-migration","subcategoryTitle":"Content migration","contentType":["Website","Blog posts","Community (e.g., migrate Facebook Group content to Widefix Communities)"],"platform":"test","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	5
58	\N	7	2023-01-30 23:40:42.191958	2023-01-30 23:40:42.191958	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"New to Widefix — under one year","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"test.com","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"description":"test","deliveryTime":"11-21 days","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	2
59	\N	4	2023-01-30 23:54:28.662605	2023-01-30 23:54:28.662605	Open	\N	\N	\N	\N	\N	\N	$20,000 or more	{English,Japanese}	Afghanistan	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"customCoding","subcategorySlug":"site-development","subcategoryTitle":"Custom coding, website development and troubleshooting","developmentTasks":["Custom app development","Integration with another system or systems"],"description":"Blah, blah, blah.","budget":"$20,000 or more","preferredLanguages":["English","Japanese"],"preferredLocation":"Afghanistan"}	4
60	\N	7	2023-02-01 13:43:50.174593	2023-03-15 18:21:58.722704	Complete	\N	\N	\N	\N	\N	\N	$2,500 - $4,999	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"expertSiteSetup","subcategorySlug":"site-setup","subcategoryTitle":"Expert Widefix site setup and guidance","expertGuidance":["Website setup guidance"],"businessStage":"Planning to launch","description":"I need help with bringing my idea to life. I own an at-home Juice business and am wanting to take it full-time online. Can you help me bring my idea to life?","budget":"$2,500 - $4,999","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
61	\N	7	2023-02-01 19:58:12.873539	2023-02-01 20:03:12.156825	Closed	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"New to Widefix — under one year","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"asdf","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"description":"asdf","deliveryTime":"11-21 days","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
62	\N	7	2023-02-02 02:03:25.509558	2023-02-02 02:03:25.509558	Open	\N	\N	\N	\N	\N	\N	$1,000 - $2,499	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines","Acquire inbound links","Guidance for bringing traffic to your website"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"I need many, many things.","budget":"$1,000 - $2,499","preferredLanguages":["English"],"preferredLocation":"No location preference"}	6
63	\N	7	2023-02-02 02:09:56.093354	2023-02-02 02:09:56.093354	Open	\N	\N	\N	\N	\N	\N	$1,000 - $2,499	{English}	United States	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"New to Widefix — under one year","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"www.example.com","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design and set up landing pages","Customize my existing website theme"],"description":"lorem ipsum","deliveryTime":"11-21 days","budget":"$1,000 - $2,499","preferredLanguages":["English"],"preferredLocation":"United States"}	2
64	\N	7	2023-02-02 19:19:53.992401	2023-02-03 05:19:21.448026	Closed	\N	\N	\N	\N	\N	\N	$2,500 - $4,999	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines","Guidance for bringing traffic to your website"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"I am looking for an experienced SEO freelancer to help bring my site up in the rankings. It is a new site with blogs being posted monthly, I am not seeing much traffic and want that to change. I know that the content in my blogs and on my landing pages are helpful and solve problems, I just need more eyeballs on the content. I am looking to have this completed by March as I am going on maternity leave and want to know my site is working for me while I am away. ","budget":"$2,500 - $4,999","preferredLanguages":["English"],"preferredLocation":"No location preference"}	6
65	\N	4	2023-02-02 20:52:51.843588	2023-02-02 20:52:51.843588	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"marketingAndSales","categorySlug":"marketing-sales","categoryTitle":"Marketing and sales","subcategoryId":"salesFunnels","subcategorySlug":"sales-funnels","subcategoryTitle":"Sales funnels and lead magnets","contentStatus":"I’m just getting started.","businessStage":"Planning to launch","description":"Sales funnels and lead magnets","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	8
66	\N	4	2023-02-02 20:53:57.904437	2023-02-02 20:53:57.904437	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English,Spanish}	United States	\N	\N	{"categoryId":"marketingAndSales","categorySlug":"marketing-sales","categoryTitle":"Marketing and sales","subcategoryId":"advertising","subcategorySlug":"advertising","subcategoryTitle":"Advertising","typeOfHelp":"No. I’d like expert advice on strategy and next steps.","adPlatforms":["TikTok"],"monthlyBudget":"$500 - $1,000 per month","description":"Advertising","budget":"I’m not sure","preferredLanguages":["English","Spanish"],"preferredLocation":"United States"}	9
67	\N	4	2023-02-02 20:54:27.873857	2023-02-02 20:54:27.873857	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"marketingAndSales","categorySlug":"marketing-sales","categoryTitle":"Marketing and sales","subcategoryId":"marketingAndLaunchStrategy","subcategorySlug":"marketing-consulting","subcategoryTitle":"Marketing and launch strategy/consulting","marketingAreas":["Social media marketing","Email marketing"],"businessStage":"Planning to launch","description":"Marketing and launch strategy/consulting","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	10
68	\N	4	2023-02-02 20:54:58.094066	2023-02-02 20:54:58.094066	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"marketingAndSales","categorySlug":"marketing-sales","categoryTitle":"Marketing and sales","subcategoryId":"emailMarketing","subcategorySlug":"email-marketing","subcategoryTitle":"Email marketing and automation","emailMarketingTasks":["Email marketing content","Custom email templates"],"emailPlatforms":["AWeber","Mailchimp","ActiveCampaign"],"monthlyBudget":"$500 - $1,000 per month","description":"Email marketing and automation","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	11
69	\N	4	2023-02-02 20:55:30.536263	2023-02-02 20:55:30.536263	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"contentDevelopment","categorySlug":"content-development","categoryTitle":"Content development","subcategoryId":"contentCreation","subcategorySlug":"content-creation","subcategoryTitle":"Content creation/strategy","contentType":["Blog posts","Course content"],"businessStage":"Planning to launch","description":"Content creation/strategy","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	19
70	\N	4	2023-02-02 20:56:02.038798	2023-02-02 20:56:02.038798	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"contentDevelopment","categorySlug":"content-development","categoryTitle":"Content development","subcategoryId":"videoEditing","subcategorySlug":"video-editing","subcategoryTitle":"Video editing","helpType":["Editing existing videos","Creating new videos","Other"],"description":"Video editing","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	20
71	\N	4	2023-02-02 20:56:42.572477	2023-02-02 20:56:42.572477	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"contentDevelopment","categorySlug":"content-development","categoryTitle":"Content development","subcategoryId":"copywriting","subcategorySlug":"copywriting-editing","subcategoryTitle":"Copywriting or editing","contentType":["Course content","eBooks and documents","Blog posts"],"description":"Engage customers with professionally written content that pulls visitors in and converts them.","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	21
72	\N	4	2023-02-02 20:57:08.527089	2023-02-02 20:57:08.527089	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"contentDevelopment","categorySlug":"content-development","categoryTitle":"Content development","subcategoryId":"podcasting","subcategorySlug":"podcast-audio","subcategoryTitle":"Podcast/audio editing","contentType":["Podcast production","Voiceovers or narration"],"description":"Engage customers with professionally produced audio content.","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"United States"}	22
73	\N	4	2023-02-02 20:57:30.468639	2023-02-02 20:57:30.468639	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	United States	\N	\N	{"categoryId":"contentDevelopment","categorySlug":"content-development","categoryTitle":"Content development","subcategoryId":"animation","subcategorySlug":"animation","subcategoryTitle":"Animation","description":"Engage customers with professionally produced animations.","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"Australia"}	23
74	\N	7	2023-02-03 21:22:26.22972	2023-03-28 16:34:46.690322	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"virtualAssistant","subcategorySlug":"va-services","subcategoryTitle":"Virtual assistant services","tasks":["Customer support","Contact management","Site optimization","Documentation","Data entry"],"description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	13
75	\N	7	2023-02-03 21:23:06.194801	2023-02-03 21:23:06.194801	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"socialMedia","subcategorySlug":"social-media","subcategoryTitle":"Social media management","tasks":["Social media ad management","Social media content creation","Social media account management "],"platforms":["LinkedIn"],"description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	14
76	\N	7	2023-02-03 21:23:25.880899	2023-02-15 22:38:45.831319	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"accounting","subcategorySlug":"accounting","subcategoryTitle":"Accounting","businessStage":"Gaining momentum after launching","expectedDuration":"3 - 6 months","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	15
77	\N	7	2023-02-03 21:23:42.097656	2023-02-03 21:23:42.097656	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"businessStrategy","subcategorySlug":"business-consulting","subcategoryTitle":"Business strategy guidance","businessStage":"Gaining momentum after launching","description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	16
78	\N	7	2023-02-03 21:23:59.425723	2023-02-03 21:23:59.425723	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"transcription","subcategorySlug":"transcription","subcategoryTitle":"Transcription and translation","description":"testesteteststststs","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	17
79	\N	7	2023-02-03 21:25:16.84502	2023-02-03 21:25:16.84502	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"visualDesignAndBranding","categorySlug":"visual-design-branding","categoryTitle":"Visual design and branding","subcategoryId":"branding","subcategorySlug":"branding-logo","subcategoryTitle":"Branding and logo design","examples":"test","description":"test","deliveryTime":"A month","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	25
80	\N	7	2023-02-03 21:25:54.168498	2023-02-03 21:25:54.168498	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"visualDesignAndBranding","categorySlug":"visual-design-branding","categoryTitle":"Visual design and branding","subcategoryId":"ebooks","subcategorySlug":"ebook-document","subcategoryTitle":"eBook and document design","description":"test","deliveryTime":"A month","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	26
81	\N	7	2023-02-08 00:33:13.12132	2023-02-08 00:37:10.524919	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	2	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"Very experienced","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"description":"testing closed projects","deliveryTime":"I’m flexible","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	2
82	\N	7	2023-02-09 16:11:42.034595	2023-02-23 15:40:01.474329	Complete	\N	\N	\N	\N	\N	\N	Whatever it takes	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"test.com","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design and set up landing pages"],"description":"test","deliveryTime":"I’m flexible","budget":"Whatever it takes","preferredLanguages":["English"],"preferredLocation":"No location preference"}	2
83	\N	7	2023-02-09 16:13:31.490398	2023-02-09 16:24:06.488782	Closed	\N	\N	\N	\N	\N	\N	Whatever it takes	{English}	No location preference	\N	\N	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"accounting","subcategorySlug":"accounting","subcategoryTitle":"Accounting","businessStage":"Planning to launch","expectedDuration":"More than 6 months","description":"test","budget":"Whatever it takes","preferredLanguages":["English"],"preferredLocation":"No location preference"}	15
84	\N	7	2023-02-22 20:18:45.333384	2023-03-28 16:57:47.113784	Open	\N	\N	\N	\N	\N	\N	$10,000 - $19,999	{English}	No location preference	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"expertSiteSetup","subcategorySlug":"site-setup","subcategoryTitle":"Expert Widefix site setup and guidance","expertGuidance":["Website setup guidance"],"businessStage":"Planning to launch","description":"This is a test project to attract as many test experts as possible. ","budget":"$10,000 - $19,999","preferredLanguages":["English"],"preferredLocation":"No location preference"}	3
85	\N	7	2023-02-22 20:36:33.614144	2023-02-22 20:36:33.614144	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"New to Widefix — under one year","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme","Design and set up landing pages"],"description":"test project with blank field","deliveryTime":"2-3 weeks","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	2
86	\N	9	2023-03-01 23:31:42.062081	2023-03-01 23:35:15.556773	Complete	\N	\N	\N	\N	\N	\N	$1,000 - $2,499	{English}	United States	\N	10	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"expertSiteSetup","subcategorySlug":"site-setup","subcategoryTitle":"Expert Widefix site setup and guidance","expertGuidance":["Website setup guidance"],"businessStage":"Planning to launch","description":"I have no idea what I'm doing.","budget":"$1,000 - $2,499","preferredLanguages":["English"],"preferredLocation":"United States"}	3
101	\N	7	2023-03-10 17:16:42.18536	2023-03-10 17:16:42.18536	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"New to Widefix — under one year","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"test.com","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"description":"test","deliveryTime":"2-3 weeks","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	2
102	\N	7	2023-03-11 03:39:29.964141	2023-03-20 19:52:26.745354	Open	\N	\N	\N	\N	\N	\N	$2,500 - $4,999	{English}	United States	\N	6	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"websiteLandingPageDesign","subcategorySlug":"site-design","subcategoryTitle":"Website and landing page design","WidefixTenure":"Moderately experienced — been using Widefix for a couple of years","hasWebsite":"Yes, I already have a website set up and live for customers","websiteUrl":"www.Widefix.com","websiteOnOtherPlatform":"Widefix","websiteTasks":["Select, set up and customize website theme"],"description":"Project Title: Widefix Website Design and Development\\n\\nProject Description:\\nWe are a small business looking to launch a new website on the Widefix platform. We are seeking an experienced Widefix expert to design and develop our website, including creating custom pages, designing our online store, and integrating our payment gateway. We are also interested in having the expert provide ongoing maintenance and support as needed.\\n\\nScope:\\n\\nWebsite design and development on the Widefix platform\\nCustom page design and layout\\nOnline store design and setup\\nPayment gateway integration\\nOngoing website maintenance and support\\nVibes:\\nWe want our website to have a clean and modern look that reflects our brand's personality. We prefer a simple and straightforward design, with clear navigation and easy-to-use features.\\n\\nInspiration:\\nWe have created a Pinterest board with some design elements that we like. Please review this board for inspiration: [insert Pinterest board link here].\\n\\nTerms:\\nBy submitting this brief, we agree to the Widefix Expert Marketplace terms found on the policies page of the website. As a client, we agree to the terms and conditions set forth in the Client Terms document.\\n\\nNote: This is just a sample project description and should be customized to fit the specific needs of each client and project.","deliveryTime":"11-21 days","budget":"$2,500 - $4,999","preferredLanguages":["English"],"preferredLocation":"United States"}	1
103	\N	7	2023-03-13 15:03:53.094539	2023-03-13 15:03:53.094539	Open	\N	\N	\N	\N	\N	\N	Less than $1,000 USD	{English}	No location preference	\N	\N	{"categoryId":"websiteSetupAndDesign","categorySlug":"website-setup-design","categoryTitle":"Website setup and design","subcategoryId":"searchEngineOptimization","subcategorySlug":"seo","subcategoryTitle":"Search engine optimization","seoTasks":["Optimize your web pages for search engines"],"seoHelp":"No. I’d like an SEO audit and recommended next steps.","description":"I am looking for an expert to help me optimize my website and help me gain more traffic to my site that converts. ","budget":"Less than $1,000 USD","preferredLanguages":["English"],"preferredLocation":"No location preference"}	1
104	\N	7	2023-03-22 13:33:27.343233	2023-03-22 13:35:24.076917	Open	\N	\N	\N	\N	\N	\N	I’m not sure	{English}	No location preference	\N	6	{"categoryId":"adminSupport","categorySlug":"admin-support","categoryTitle":"Admin support","subcategoryId":"socialMedia","subcategorySlug":"social-media","subcategoryTitle":"Social media management","tasks":["Social media account management ","Social media ad management"],"platforms":["YouTube","Facebook"],"description":"test","budget":"I’m not sure","preferredLanguages":["English"],"preferredLocation":"No location preference"}	14
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ratings (id, reviewer_id, reviewee_id, rating, review, project_id, created_at, updated_at) FROM stdin;
1	4	2	4	Chris Vendor did an excellent job!	7	2022-10-05 19:21:55.896668	2022-10-05 19:21:55.896668
2	2	4	4	Ben Hays is awesome!	7	2022-10-05 19:22:38.77279	2022-10-05 19:22:38.77279
3	4	5	3	This is a rating to test mark as complete	12	2022-10-11 18:03:32.977626	2022-10-11 18:03:32.977626
4	4	5	5	Alpha project rating!	13	2022-10-12 17:28:16.619133	2022-10-12 17:28:16.619133
5	5	4	5	Alpha rating from vendor!	13	2022-10-12 17:28:48.950632	2022-10-12 17:28:48.950632
6	4	2	4	Thanks again!	2	2022-10-25 16:38:39.016546	2022-10-25 16:38:39.016546
7	4	5	4	Nice work!	21	2022-10-28 19:28:39.436139	2022-10-28 19:28:39.436139
8	9	10	5	Dude, this is great! Love it, keep up the good work.	27	2022-12-05 21:46:01.583185	2022-12-21 01:00:02.870475
9	4	5	4	This is more than 25 characters.	30	2022-12-14 20:50:42.09307	2022-12-14 20:50:42.09307
10	7	6	5	this is at least 24 characters	29	2022-12-14 20:59:11.991856	2022-12-14 20:59:11.991856
11	9	\N	5	A review outside the normal flow? Scandalous!	15	2022-12-21 22:29:53.28238	2022-12-21 22:29:53.28238
12	7	6	5	test test test test test 	26	2022-12-23 14:35:11.047002	2022-12-23 14:35:11.047002
13	6	7	5	testtesttesttesttesttesttest	26	2022-12-23 14:36:48.366411	2022-12-23 14:36:48.366411
14	4	5	5	Vito did an excellent job!	41	2023-01-18 00:02:36.365032	2023-01-18 00:02:36.365032
16	6	7	5	Cool client. Would work for again.	45	2023-01-30 23:53:07.193507	2023-01-30 23:53:07.193507
17	7	6	5	second review test test test	82	2023-02-09 16:26:10.268737	2023-02-23 15:40:01.518156
18	9	10	5	The best of all the rest!	39	2023-03-01 23:27:52.68548	2023-03-01 23:27:52.68548
19	10	9	5	Very nice human. So cool and wonderful.	39	2023-03-01 23:28:32.880234	2023-03-01 23:28:32.880234
20	9	10	5	Great job you're a winner. Keep it up.	86	2023-03-01 23:35:15.564763	2023-03-01 23:35:15.564763
34	7	6	5	I recently worked with [expert's name] on designing my website, and my experience was exceptional. Initially, [expert's name] was professional, attentive, and collaborative. They took the time to understand my needs and vision for the website and provided valuable insights and recommendations throughout the design process.\n\nWhat impressed me most about [expert's name] was their attention to detail and the quality of their work. They created a beautiful and functional website that exceeded my expectations. I was particularly impressed with the design elements and the user experience, which were visually appealing and easy to navigate.\n\nFurthermore, [expert's name] was always available to answer my questions and address my concerns. They were responsive and timely in their communications, which made the entire process seamless and enjoyable.\n\nOverall, I highly recommend [expert's name] to anyone looking for a talented and professional website designer. They indeed went above and beyond to deliver a fantastic product, and I am grateful for their expertise and dedication. I would give them a 5-star rating without hesitation.	60	2023-03-15 18:21:58.717452	2023-03-15 18:21:58.717452
35	7	6	5	Testing uncompletion. it's a test.	47	2023-03-20 13:22:22.376069	2023-03-20 13:22:22.376069
36	7	6	5	testing premature project closure	102	2023-03-20 19:52:26.858459	2023-03-20 19:52:26.858459
37	7	6	5	all was good I really appreciate the work done	50	2023-03-22 09:48:47.494212	2023-03-22 09:48:47.494212
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20230330161714
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.services (id, user_id, category_id, status, created_at, updated_at, active) FROM stdin;
1	2	2	approved	2023-01-24 21:06:34.759594	2023-01-24 21:06:34.759594	t
2	2	3	approved	2023-01-24 21:06:34.768796	2023-01-24 21:06:34.768796	t
3	2	4	approved	2023-01-24 21:06:34.77596	2023-01-24 21:06:34.77596	t
4	2	5	approved	2023-01-24 21:06:34.782781	2023-01-24 21:06:34.782781	t
5	2	6	approved	2023-01-24 21:06:34.790002	2023-01-24 21:06:34.790002	t
7	2	9	approved	2023-01-24 21:06:34.803863	2023-01-24 21:06:34.803863	t
8	2	10	approved	2023-01-24 21:06:34.810532	2023-01-24 21:06:34.810532	t
9	2	11	approved	2023-01-24 21:06:34.817099	2023-01-24 21:06:34.817099	t
10	2	13	approved	2023-01-24 21:06:34.823982	2023-01-24 21:06:34.823982	t
11	2	14	approved	2023-01-24 21:06:34.835738	2023-01-24 21:06:34.835738	t
12	2	15	approved	2023-01-24 21:06:34.842565	2023-01-24 21:06:34.842565	t
13	2	16	approved	2023-01-24 21:06:34.849476	2023-01-24 21:06:34.849476	t
14	2	17	approved	2023-01-24 21:06:34.856119	2023-01-24 21:06:34.856119	t
15	2	19	approved	2023-01-24 21:06:34.863189	2023-01-24 21:06:34.863189	t
16	2	20	approved	2023-01-24 21:06:34.87049	2023-01-24 21:06:34.87049	t
17	2	21	approved	2023-01-24 21:06:34.877067	2023-01-24 21:06:34.877067	t
18	2	22	approved	2023-01-24 21:06:34.884253	2023-01-24 21:06:34.884253	t
19	2	23	approved	2023-01-24 21:06:34.890834	2023-01-24 21:06:34.890834	t
20	2	25	approved	2023-01-24 21:06:34.897538	2023-01-24 21:06:34.897538	t
21	2	26	approved	2023-01-24 21:06:34.904271	2023-01-24 21:06:34.904271	t
23	6	3	approved	2023-01-24 21:06:34.919817	2023-02-14 00:10:29.285298	t
24	6	4	approved	2023-01-24 21:06:34.926481	2023-02-14 00:10:29.291591	t
25	6	5	approved	2023-01-24 21:06:34.933387	2023-02-14 00:10:29.298367	f
27	6	8	approved	2023-01-24 21:06:34.946638	2023-02-14 00:10:29.310734	t
28	6	9	approved	2023-01-24 21:06:34.953865	2023-02-14 00:10:29.316769	t
29	6	10	rejected	2023-01-24 21:06:34.960702	2023-02-14 00:09:58.220324	t
30	6	11	approved	2023-01-24 21:06:34.967588	2023-02-14 00:10:29.330445	t
31	6	13	approved	2023-01-24 21:06:34.974763	2023-02-14 00:10:29.342769	t
32	6	14	approved	2023-01-24 21:06:34.981566	2023-02-14 00:10:29.357553	t
33	6	15	approved	2023-01-24 21:06:34.988792	2023-02-14 00:10:29.369997	t
34	6	16	approved	2023-01-24 21:06:34.996003	2023-02-14 00:10:29.384188	f
35	6	17	approved	2023-01-24 21:06:35.003858	2023-02-14 00:10:29.39711	f
36	6	19	approved	2023-01-24 21:06:35.011906	2023-02-14 00:10:29.412728	t
37	6	20	approved	2023-01-24 21:06:35.021003	2023-02-14 00:10:29.42437	t
38	6	21	rejected	2023-01-24 21:06:35.028276	2023-02-14 00:09:42.827144	t
39	6	22	approved	2023-01-24 21:06:35.035259	2023-02-14 00:10:29.438809	t
40	6	23	approved	2023-01-24 21:06:35.041833	2023-02-14 00:10:29.455524	t
41	6	25	rejected	2023-01-24 21:06:35.048889	2023-01-24 21:06:35.048889	f
42	6	26	rejected	2023-01-24 21:06:35.05561	2023-01-24 21:06:35.05561	t
43	5	2	approved	2023-01-24 21:06:35.063554	2023-01-24 21:06:35.063554	t
44	5	3	approved	2023-01-24 21:06:35.070571	2023-01-24 21:06:35.070571	t
45	5	4	approved	2023-01-24 21:06:35.077282	2023-01-24 21:06:35.077282	f
46	5	5	approved	2023-01-24 21:06:35.084548	2023-01-24 21:06:35.084548	t
47	5	6	approved	2023-01-24 21:06:35.091396	2023-01-24 21:06:35.091396	t
48	5	8	approved	2023-01-24 21:06:35.098246	2023-01-24 21:06:35.098246	t
49	5	9	approved	2023-01-24 21:06:35.104866	2023-01-24 21:06:35.104866	t
50	5	10	approved	2023-01-24 21:06:35.11162	2023-01-24 21:06:35.11162	t
51	5	11	approved	2023-01-24 21:06:35.118443	2023-01-24 21:06:35.118443	t
52	5	13	approved	2023-01-24 21:06:35.125124	2023-01-24 21:06:35.125124	t
53	5	14	approved	2023-01-24 21:06:35.131985	2023-01-24 21:06:35.131985	f
54	5	15	approved	2023-01-24 21:06:35.138605	2023-01-24 21:06:35.138605	f
55	5	16	approved	2023-01-24 21:06:35.145652	2023-01-24 21:06:35.145652	t
56	5	17	approved	2023-01-24 21:06:35.15259	2023-01-24 21:06:35.15259	t
57	5	19	approved	2023-01-24 21:06:35.15929	2023-01-24 21:06:35.15929	t
58	5	20	approved	2023-01-24 21:06:35.165708	2023-01-24 21:06:35.165708	t
59	5	21	approved	2023-01-24 21:06:35.172109	2023-01-24 21:06:35.172109	t
60	5	22	approved	2023-01-24 21:06:35.178891	2023-01-24 21:06:35.178891	t
61	5	23	approved	2023-01-24 21:06:35.185614	2023-01-24 21:06:35.185614	t
62	5	25	approved	2023-01-24 21:06:35.194645	2023-01-24 21:06:35.194645	t
63	5	26	approved	2023-01-24 21:06:35.202571	2023-01-24 21:06:35.202571	t
64	14	2	approved	2023-01-24 21:06:35.210733	2023-01-24 21:06:35.210733	t
65	14	3	approved	2023-01-24 21:06:35.22286	2023-01-24 21:06:35.22286	t
66	14	4	approved	2023-01-24 21:06:35.229294	2023-01-24 21:06:35.229294	t
67	14	5	approved	2023-01-24 21:06:35.235679	2023-01-24 21:06:35.235679	t
68	14	6	approved	2023-01-24 21:06:35.242267	2023-01-24 21:06:35.242267	t
69	14	8	approved	2023-01-24 21:06:35.248783	2023-01-24 21:06:35.248783	t
70	14	9	approved	2023-01-24 21:06:35.255008	2023-01-24 21:06:35.255008	t
71	14	10	approved	2023-01-24 21:06:35.261585	2023-01-24 21:06:35.261585	t
72	14	11	approved	2023-01-24 21:06:35.267911	2023-01-24 21:06:35.267911	t
73	14	13	approved	2023-01-24 21:06:35.274339	2023-01-24 21:06:35.274339	t
74	14	14	approved	2023-01-24 21:06:35.28074	2023-01-24 21:06:35.28074	t
75	14	15	approved	2023-01-24 21:06:35.286854	2023-01-24 21:06:35.286854	t
76	14	16	approved	2023-01-24 21:06:35.293356	2023-01-24 21:06:35.293356	t
77	14	17	approved	2023-01-24 21:06:35.299657	2023-01-24 21:06:35.299657	t
78	14	19	approved	2023-01-24 21:06:35.316173	2023-01-24 21:06:35.316173	t
79	14	20	approved	2023-01-24 21:06:35.322784	2023-01-24 21:06:35.322784	t
80	14	21	approved	2023-01-24 21:06:35.32899	2023-01-24 21:06:35.32899	t
81	14	22	approved	2023-01-24 21:06:35.335412	2023-01-24 21:06:35.335412	t
82	14	23	approved	2023-01-24 21:06:35.341491	2023-01-24 21:06:35.341491	t
83	14	25	approved	2023-01-24 21:06:35.347877	2023-01-24 21:06:35.347877	t
84	14	26	approved	2023-01-24 21:06:35.354256	2023-01-24 21:06:35.354256	t
85	10	2	approved	2023-01-24 21:06:35.36207	2023-02-14 00:09:20.216018	t
86	10	3	approved	2023-01-24 21:06:35.368438	2023-02-14 00:09:20.222429	t
87	10	4	approved	2023-01-24 21:06:35.375535	2023-02-14 00:09:20.228784	t
88	10	5	approved	2023-01-24 21:06:35.383149	2023-02-14 00:09:20.234893	t
89	10	6	approved	2023-01-24 21:06:35.390169	2023-02-14 00:09:20.240882	t
90	10	8	approved	2023-01-24 21:06:35.396871	2023-02-14 00:09:20.247253	t
91	10	9	approved	2023-01-24 21:06:35.403885	2023-02-14 00:09:20.253183	t
92	10	10	approved	2023-01-24 21:06:35.410529	2023-02-14 00:09:20.259301	t
93	10	11	approved	2023-01-24 21:06:35.417613	2023-02-14 00:09:20.265691	t
94	10	13	approved	2023-01-24 21:06:35.428631	2023-02-14 00:09:20.272005	f
95	10	14	approved	2023-01-24 21:06:35.435117	2023-02-14 00:09:20.277906	f
96	10	15	approved	2023-01-24 21:06:35.441778	2023-02-14 00:09:20.283927	f
97	10	16	approved	2023-01-24 21:06:35.448255	2023-02-14 00:09:20.289773	f
98	10	17	approved	2023-01-24 21:06:35.455109	2023-02-14 00:09:20.295946	f
99	10	19	approved	2023-01-24 21:06:35.46242	2023-02-14 00:09:20.302122	t
100	10	20	approved	2023-01-24 21:06:35.468731	2023-02-14 00:09:20.308192	t
101	10	21	approved	2023-01-24 21:06:35.475322	2023-02-14 00:09:20.314354	t
102	10	22	approved	2023-01-24 21:06:35.491536	2023-02-14 00:09:20.323303	t
103	10	23	approved	2023-01-24 21:06:35.499006	2023-02-14 00:09:20.335496	t
104	10	25	rejected	2023-01-24 21:06:35.505771	2023-01-24 21:06:35.505771	f
105	10	26	rejected	2023-01-24 21:06:35.512322	2023-01-24 21:06:35.512322	f
106	17	2	approved	2023-02-07 23:05:06.599037	2023-02-13 23:47:52.050304	t
107	17	3	approved	2023-02-07 23:05:06.607063	2023-02-13 23:47:52.05656	t
108	17	8	approved	2023-02-07 23:05:06.61422	2023-02-13 23:47:52.099318	t
109	17	11	approved	2023-02-07 23:05:06.620714	2023-02-13 23:47:52.110341	t
110	17	13	approved	2023-02-07 23:05:06.627913	2023-02-13 23:47:52.120672	t
111	17	14	approved	2023-02-07 23:05:06.635057	2023-02-13 23:47:52.131764	t
112	17	19	approved	2023-02-07 23:05:06.641961	2023-02-13 23:47:52.143265	t
113	17	26	rejected	2023-02-07 23:05:06.648622	2023-02-13 23:45:36.941403	t
114	17	25	rejected	2023-02-07 23:05:06.659205	2023-02-13 23:45:36.935455	t
115	2	8	approved	2023-02-07 23:05:06.750258	2023-02-07 23:05:06.750258	t
116	6	2	approved	2023-02-07 23:05:06.816717	2023-02-14 00:10:29.277382	t
117	6	6	approved	2023-02-07 23:05:06.828126	2023-02-14 00:10:29.304698	t
118	17	4	approved	2023-02-13 23:44:42.169866	2023-02-13 23:47:52.062665	t
119	17	5	approved	2023-02-13 23:44:42.178076	2023-02-13 23:47:52.076625	t
120	17	6	approved	2023-02-13 23:44:42.185924	2023-02-13 23:47:52.086402	t
121	17	17	rejected	2023-02-13 23:44:42.220114	2023-02-13 23:47:29.537151	t
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, external_user_id, account_id, name, email, given_name, family_name, nickname, picture, employee_account, developer_account, user_type, external_updated_at, created_at, updated_at, ratings_total, ratings_count, languages, location, website, vendor_company, terms_accepted_at, about, company_name, scheduling_link, paypal_email, profile_url, slug, avatar) FROM stdin;
1	2147606198	104576	Chris User Wensel	christian+user@Widefix.com	Chris User	Wensel	christian+user	https://s.gravatar.com/avatar/2e6b2b407525aa795e49358094b2b128?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fcu.png	t	f	user	2023-01-19 12:59:28.188	2022-09-29 17:13:05.70255	2023-01-19 12:59:29.188969	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	2147606190	104576	Chris Vendor Wensel	christian+vendor@Widefix.com	Chris Vendor	Wensel	christian+vendor	https://s.gravatar.com/avatar/003b60a47c2e3f386e44f2270c51daea?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fcv.png	t	f	vendor	2023-02-27 19:51:57.359	2022-09-29 17:53:23.318203	2023-02-27 19:51:58.208165	8	2	{English}	United States	\N	\N	2023-02-08 00:34:22.01091	\N	\N	\N	\N	\N	\N	\N
3	2147554113	2147529536	Sean Flannagan	sean.flannagan@Widefix.com	Sean	Flannagan	sean.flannagan	https://s.gravatar.com/avatar/d39698cd417739537278f410269f7b5f?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fsf.png	t	f	kjadmin	2023-02-27 14:36:30.952	2022-09-29 17:54:29.560653	2023-02-27 18:15:07.700479	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	17	17	Ben Hays	ben@Widefix.com	Ben	Hays	ben	https://s.gravatar.com/avatar/17bb0613f5d2640abea7c62d6264cd21?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fbh.png	t	f	kjadmin	2023-02-21 19:45:40.598	2022-10-05 16:42:18.423127	2023-02-21 19:45:41.443148	9	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	2147636893	17	Vito Corleone	ben+vito@Widefix.com	Vito	Corleone	ben+vito	https://s.gravatar.com/avatar/f6daf7720b84a9c2f87d838d1d6ff446?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fvc.png	t	f	vendor	2023-03-28 23:32:03.533	2022-10-05 16:43:31.720902	2023-03-28 23:32:04.656585	21	5	{English,Spanish}	United States	https://apple.com	\N	2023-01-31 23:40:04.464659	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n	\N	https://Widefix.com	\N	\N	benzo	https://s3.amazonaws.com/experts-development-s3/file-uploads/avatars/76f240f-5e17-4063-a4c0-acf68704011f_chris_farley.webp
6	2147657239	2147596987	Expert Tester	sflannagan+expert@gmail.com	Expert	Tester	sflannagan+expert	https://s.gravatar.com/avatar/a965e0ec375f7182ea71addbc5b1b25f?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fet.png	f	f	vendor	2023-03-29 08:45:14.081	2022-10-08 23:27:13.357882	2023-03-29 08:45:15.751024	35	7	{English,Spanish}	United States	Widefix.com	\N	2023-02-01 22:16:20.427922	I'm the best person.\nwww.google.com\n\n- do\n- bullets\n- work?	Testing Company	calendly.com/seanatWidefix		\N	yeahyeah	https://s3.amazonaws.com/experts-development-s3/file-uploads/avatars/507cda4-561d-f336-d4-bec5bdaf3743_Mr_Natural-logo-E0FBF4029E-seeklogo.com.png
7	2147657240	2147596988	Client Tester	sflannagan+client@gmail.com	Client	Tester	sflannagan+client	https://s.gravatar.com/avatar/79596697dc36d106e4a83d01acfa5f98?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fct.png	f	f	user	2023-03-29 08:40:26.434	2022-10-10 22:25:56.540238	2023-03-29 08:40:27.449673	10	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	2147661266	2147599451	Court KJAdmin	court.mcfadzean+kjadmin@Widefix.com	Court	KJAdmin	court.mcfadzean+kjadmin	https://s.gravatar.com/avatar/96a75cc7d10c6d763a80f8c293ec8346?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fck.png	t	f	kjadmin	2023-03-16 23:14:38.228	2022-10-18 16:47:35.268551	2023-03-16 23:14:38.968032	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	2147661613	2147542166	User Expert	michael.zoller+user@Widefix.com	User	Expert	michael.zoller+user	https://s.gravatar.com/avatar/bc55874f8237b3e669bbf851fde4aca4?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fue.png	t	f	user	2023-03-01 22:27:34.086	2022-10-18 18:10:39.205598	2023-03-01 23:28:32.892653	5	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	2147661614	2147542166	Vendor Expert	michael.zoller+vendor@Widefix.com	Vendor	Expert	michael.zoller+vendor	https://s.gravatar.com/avatar/ce64b9596ba94f625bd53863d171249e?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fve.png	t	f	vendor	2023-03-10 19:39:13.015	2022-10-18 18:13:03.659886	2023-03-10 20:32:26.376892	15	3	{English}	United States	example.com	\N	2023-02-07 18:50:10.962218	\N	\N	\N	\N	\N	\N	\N
11	4143	4146	Court McFadzean	inboundpixels@gmail.com	Court	McFadzean	inboundpixels	https://s.gravatar.com/avatar/3a1f248ae32a10d60e6fc8d3e2aa72e3?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fcm.png	t	f	preuser	2022-10-19 00:21:04.75	2022-10-19 17:33:02.224211	2022-10-19 17:33:02.224211	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	2147666773	2147602829	Sean Flannagan	hi@alivelyexperiment.com	Sean	Flannagan	hi	https://s.gravatar.com/avatar/3e5a1ca1f3c65ad0a308e70a358edafd?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fsf.png	f	f	user	2022-11-02 21:44:42.774	2022-11-02 21:38:22.888934	2022-11-02 21:44:43.406459	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	2147664707	2147601640	Court Client	court.mcfadzean+client@Widefix.com	Court	Client	court.mcfadzean+client	https://s.gravatar.com/avatar/8801896be8986142f08bcb5dd0adbec3?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fcc.png	t	f	user	2023-03-16 23:12:55.276	2022-11-14 22:28:58.426112	2023-03-16 23:12:56.175196	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
14	2147661265	2147599450	Court Expert	court.mcfadzean+expert@Widefix.com	Court	Expert	court.mcfadzean+expert	https://s.gravatar.com/avatar/10c77bd54a367b6d8aa32ee4dbe18284?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fce.png	t	f	vendor	2023-03-16 23:11:05.533	2022-11-14 22:29:34.062	2023-03-16 23:11:25.712347	\N	\N	{English}	United States	test.com	\N	2023-02-02 23:56:33.331378					\N	\N	https://s3.amazonaws.com/experts-development-s3/file-uploads/avatars/864302-f6c-016b-2c6c-3fcaaa5d2f47_Headshot.png
15	2147573043	2147542166	Michael Zoller	michael.zoller@Widefix.com	Michael	Zoller	michael.zoller	https://s.gravatar.com/avatar/97fcdcdc0f2b8d6b696f03ef416f7e97?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fmz.png	t	f	kjadmin	2023-03-10 20:54:10.221	2022-11-15 15:36:59.99757	2023-03-10 20:54:10.974171	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
16	2147691103	2147618626	Expert KJAdmin	sflannagan+kjadmin@gmail.com	Expert	KJAdmin	sflannagan+kjadmin	https://s.gravatar.com/avatar/5cc1c1d47755f39d21ba6d988e5a8639?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fek.png	f	t	kjadmin	2023-03-15 18:35:15.854	2023-01-17 20:29:41.345526	2023-03-15 18:35:16.875339	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
17	2147698204	2147622787	Sean TestingExperts	sflannagan+testingexperts@gmail.com	Sean	TestingExperts	sflannagan+testingexperts	https://s.gravatar.com/avatar/68bc39f8f7f3ac5079b9c01ad1a5dc3c?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fst.png	f	f	vendor	2023-02-22 20:23:45.395	2023-02-07 21:51:48.997938	2023-02-22 20:23:45.920239	\N	\N	{English}	United States	Widefix.com	\N	2023-02-07 21:51:55.508157	\N	\N	\N	\N	\N	\N	\N
18	2147703214	2147529536	Sean Expert9	sflannagan+expert9@gmail.com	Sean	Expert9	sflannagan+expert9	https://s.gravatar.com/avatar/bfd32dcab1f7b64f3d55a8995c1a8f86?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fse.png	t	f	vendor	2023-02-22 21:12:09.879	2023-02-22 21:12:10.4018	2023-02-22 21:12:35.874489	\N	\N	{English}	United States	\N	\N	2023-02-22 21:12:35.874082	\N	\N	\N	\N	\N	\N	\N
34	63662	49344	Stephen Enriquez	stephen.enriquez@Widefix.com	Stephen	Enriquez	stephen.enriquez	https://s.gravatar.com/avatar/57b57e044634d5f7fe6902fcde3b8e18?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fse.png	f	f	user	2023-03-06 23:20:01.179	2023-03-07 15:46:03.123627	2023-03-07 15:46:03.123627	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
35	2147708651	2147529536	Sean Testing500	sflannagan+testing500@gmail.com	Sean	Testing500	sflannagan+testing500	https://s.gravatar.com/avatar/0dc61017e271a267d08aebb5a738cfd1?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fst.png	t	f	vendor	2023-03-10 20:33:56.622	2023-03-10 20:33:57.312818	2023-03-10 20:33:59.9104	\N	\N	{English}	United States	\N	\N	2023-03-10 20:33:59.909943	\N	\N	\N	\N	\N	\N	\N
36	2147702783	2147542166	Service Generation	michael.zoller+service@Widefix.com	Service	Generation	michael.zoller+service	https://s.gravatar.com/avatar/4d930d9e4f7ab36fcde74dc69cb4eff7?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fsg.png	t	f	vendor	2023-03-10 20:34:01.197	2023-03-10 20:34:02.036757	2023-03-10 20:34:05.683911	\N	\N	{English}	United States	\N	\N	2023-03-10 20:34:05.68348	\N	\N	\N	\N	\N	\N	\N
38	2147708667	2147542166	Service Gen2	michael.zoller+service2@Widefix.com	Service	Gen2	michael.zoller+service2	https://s.gravatar.com/avatar/2b6ca5a1b1f47c68b3742bb0ab0a959b?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fsg.png	t	f	vendor	2023-03-10 20:54:53.871	2023-03-10 20:54:54.609708	2023-03-10 20:54:58.216584	\N	\N	{English}	United States	\N	\N	2023-03-10 20:54:58.216142	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- Name: ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_categories_on_parent_id ON public.categories USING btree (parent_id);


--
-- Name: index_projects_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_category_id ON public.projects USING btree (category_id);


--
-- Name: index_projects_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_projects_on_user_id ON public.projects USING btree (user_id);


--
-- Name: index_services_on_category_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_services_on_category_id ON public.services USING btree (category_id);


--
-- Name: index_services_on_status; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_services_on_status ON public.services USING btree (status);


--
-- Name: index_services_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_services_on_user_id ON public.services USING btree (user_id);


--
-- Name: index_users_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_slug ON public.users USING btree (slug);


--
-- Name: unique_categories; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_categories ON public.categories USING btree (slug);


--
-- Name: projects fk_rails_2ad2693164; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_2ad2693164 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: categories fk_rails_82f48f7407; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_rails_82f48f7407 FOREIGN KEY (parent_id) REFERENCES public.categories(id);


--
-- Name: projects fk_rails_b872a6760a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT fk_rails_b872a6760a FOREIGN KEY (user_id) REFERENCES public.users(id);
