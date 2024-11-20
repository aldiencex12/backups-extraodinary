--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: agamas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agamas (
    id uuid NOT NULL,
    kode character varying(255) NOT NULL,
    nama character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.agamas OWNER TO postgres;

--
-- Name: backups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.backups (
    id bigint NOT NULL,
    filename character varying(255) NOT NULL,
    version character varying(255) NOT NULL,
    detail text NOT NULL,
    generated_date character varying(255) NOT NULL,
    bak_type character varying(255) DEFAULT 'BACKUP'::character varying NOT NULL,
    status character varying(255) DEFAULT 'SUCCESS'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.backups OWNER TO postgres;

--
-- Name: banksoal_chains; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banksoal_chains (
    id character varying(26) NOT NULL,
    banksoal_id uuid NOT NULL,
    chain text
);


ALTER TABLE public.banksoal_chains OWNER TO postgres;

--
-- Name: banksoal_summaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banksoal_summaries (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    total_done integer NOT NULL,
    avg_duration numeric(19,4) NOT NULL,
    total_schedule integer NOT NULL,
    lowest_duration integer NOT NULL,
    highest_duration integer NOT NULL,
    ds_duration numeric(19,6) NOT NULL,
    avg_result numeric(19,2) NOT NULL,
    ds_result numeric(19,6) NOT NULL,
    created_at timestamp(0) without time zone,
    avg_point numeric(19,2) NOT NULL,
    ds_point numeric(19,6) NOT NULL,
    lowest_result numeric(19,2) NOT NULL,
    highest_result numeric(19,2) NOT NULL,
    max_point numeric(19,2) NOT NULL,
    lowest_point numeric(19,2) NOT NULL,
    highest_point numeric(19,2) NOT NULL
);


ALTER TABLE public.banksoal_summaries OWNER TO postgres;

--
-- Name: banksoals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banksoals (
    id uuid NOT NULL,
    kode_banksoal character varying(100) NOT NULL,
    key_lock character varying(255),
    lock_by character varying(255),
    persen character varying(350) NOT NULL,
    matpel_id uuid NOT NULL,
    author uuid NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    competence_id uuid,
    code01_max integer DEFAULT 0 NOT NULL,
    code02_max integer DEFAULT 0 NOT NULL,
    code03_max integer DEFAULT 0 NOT NULL,
    code04_max integer DEFAULT 0 NOT NULL,
    code05_max integer DEFAULT 0 NOT NULL,
    code06_max integer DEFAULT 0 NOT NULL,
    code07_max integer DEFAULT 0 NOT NULL,
    code08_max integer DEFAULT 0 NOT NULL,
    code09_max integer DEFAULT 0 NOT NULL,
    code10_max integer DEFAULT 0 NOT NULL,
    code11_max integer DEFAULT 0 NOT NULL,
    code12_max integer DEFAULT 0 NOT NULL,
    code13_max integer DEFAULT 0 NOT NULL,
    code14_max integer DEFAULT 0 NOT NULL,
    is_locked boolean DEFAULT false NOT NULL,
    supports text,
    last_sequence integer DEFAULT 0 NOT NULL,
    sequence_type integer DEFAULT 0 NOT NULL,
    code15_max integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.banksoals OWNER TO postgres;

--
-- Name: check_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.check_answers (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jawab_id uuid NOT NULL,
    corrected_by uuid NOT NULL,
    point numeric(19,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    jadwal_id uuid NOT NULL,
    ai_opinion text
);


ALTER TABLE public.check_answers OWNER TO postgres;

--
-- Name: competence_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competence_items (
    id uuid NOT NULL,
    competence_id uuid NOT NULL,
    tipe_soal integer NOT NULL,
    total_soal integer NOT NULL,
    code character varying(255) NOT NULL,
    point integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    wrong_point integer DEFAULT 0 NOT NULL,
    part integer DEFAULT 1 NOT NULL,
    index integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.competence_items OWNER TO postgres;

--
-- Name: competences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competences (
    id uuid NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    total_part integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.competences OWNER TO postgres;

--
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id uuid NOT NULL,
    device_id character varying(255) NOT NULL,
    device_os character varying(255) NOT NULL,
    device_name character varying(255) NOT NULL,
    ip_address character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    peserta_id uuid,
    out_count integer NOT NULL,
    last_verified_at timestamp(6) without time zone
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- Name: ecosystem_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecosystem_keys (
    id character varying(100) NOT NULL,
    payload text NOT NULL,
    public_key text NOT NULL,
    signature text NOT NULL
);


ALTER TABLE public.ecosystem_keys OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: exo_backups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.exo_backups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.exo_backups_id_seq OWNER TO postgres;

--
-- Name: exo_backups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.exo_backups_id_seq OWNED BY public.backups.id;


--
-- Name: feature_infos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feature_infos (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.feature_infos OWNER TO postgres;

--
-- Name: feature_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feature_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feature_infos_id_seq OWNER TO postgres;

--
-- Name: feature_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feature_infos_id_seq OWNED BY public.feature_infos.id;


--
-- Name: group_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_members (
    id uuid NOT NULL,
    group_id uuid NOT NULL,
    student_id uuid NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.group_members OWNER TO postgres;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    parent_id uuid,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: hasil_ujians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hasil_ujians (
    id uuid NOT NULL,
    ujian_id uuid,
    banksoal_id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    check_point numeric(19,2) DEFAULT 0 NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    check_point_auto numeric(19,2) DEFAULT 0,
    check_point_manual numeric(19,2) DEFAULT 0 NOT NULL,
    code01_correct integer DEFAULT 0 NOT NULL,
    code01_wrong integer DEFAULT 0 NOT NULL,
    code01_point numeric(19,2) DEFAULT 0 NOT NULL,
    code01_void integer DEFAULT 0 NOT NULL,
    code02_correct integer DEFAULT 0 NOT NULL,
    code02_wrong integer DEFAULT 0 NOT NULL,
    code02_point numeric(19,2) DEFAULT 0 NOT NULL,
    code02_void integer DEFAULT 0 NOT NULL,
    code03_correct integer DEFAULT 0 NOT NULL,
    code03_wrong integer DEFAULT 0 NOT NULL,
    code03_point numeric(19,2) DEFAULT 0 NOT NULL,
    code03_void integer DEFAULT 0 NOT NULL,
    code04_correct integer DEFAULT 0 NOT NULL,
    code04_wrong integer DEFAULT 0 NOT NULL,
    code04_point numeric(19,2) DEFAULT 0 NOT NULL,
    code04_void integer DEFAULT 0 NOT NULL,
    code05_correct integer DEFAULT 0 NOT NULL,
    code05_wrong integer DEFAULT 0 NOT NULL,
    code05_point numeric(19,2) DEFAULT 0 NOT NULL,
    code05_void integer DEFAULT 0 NOT NULL,
    code06_correct integer DEFAULT 0 NOT NULL,
    code06_wrong integer DEFAULT 0 NOT NULL,
    code06_point numeric(19,2) DEFAULT 0 NOT NULL,
    code06_void integer DEFAULT 0 NOT NULL,
    code07_correct integer DEFAULT 0 NOT NULL,
    code07_wrong integer DEFAULT 0 NOT NULL,
    code07_point numeric(19,2) DEFAULT 0 NOT NULL,
    code07_void integer DEFAULT 0 NOT NULL,
    code08_correct integer DEFAULT 0 NOT NULL,
    code08_wrong integer DEFAULT 0 NOT NULL,
    code08_point numeric(19,2) DEFAULT 0 NOT NULL,
    code08_void integer DEFAULT 0 NOT NULL,
    code09_correct integer DEFAULT 0 NOT NULL,
    code09_wrong integer DEFAULT 0,
    code09_point numeric(19,2) DEFAULT 0 NOT NULL,
    code09_void integer DEFAULT 0 NOT NULL,
    code10_correct integer DEFAULT 0 NOT NULL,
    code10_wrong integer DEFAULT 0 NOT NULL,
    code10_point numeric(19,2) DEFAULT 0 NOT NULL,
    code10_void integer DEFAULT 0 NOT NULL,
    code11_correct integer DEFAULT 0 NOT NULL,
    code11_wrong integer DEFAULT 0 NOT NULL,
    code11_point numeric(19,2) DEFAULT 0 NOT NULL,
    code11_void integer DEFAULT 0 NOT NULL,
    code12_correct integer DEFAULT 0 NOT NULL,
    code12_wrong integer DEFAULT 0 NOT NULL,
    code12_point numeric(19,2) DEFAULT 0 NOT NULL,
    code12_void integer DEFAULT 0 NOT NULL,
    code13_correct integer DEFAULT 0 NOT NULL,
    code13_wrong integer DEFAULT 0 NOT NULL,
    code13_point numeric(19,2) DEFAULT 0 NOT NULL,
    code13_void integer DEFAULT 0 NOT NULL,
    code14_correct integer DEFAULT 0 NOT NULL,
    code14_wrong integer DEFAULT 0 NOT NULL,
    code14_point numeric(19,2) DEFAULT 0 NOT NULL,
    code14_void integer DEFAULT 0 NOT NULL,
    check_point_max numeric(19,2) DEFAULT 0 NOT NULL,
    duration character varying(50) DEFAULT '-'::character varying NOT NULL,
    code15_correct integer DEFAULT 0 NOT NULL,
    code15_wrong integer DEFAULT 0 NOT NULL,
    code15_point numeric(19,2) DEFAULT 0 NOT NULL,
    code15_void integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.hasil_ujians OWNER TO postgres;

--
-- Name: jadwals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jadwals (
    id uuid NOT NULL,
    banksoal_id text NOT NULL,
    group_ids text,
    alias character varying(50) NOT NULL,
    tanggal character varying(50) NOT NULL,
    mulai character varying(50) NOT NULL,
    lama integer NOT NULL,
    min_test integer DEFAULT 0 NOT NULL,
    status_ujian integer NOT NULL,
    event_id uuid,
    sesi integer DEFAULT 1 NOT NULL,
    setting text NOT NULL,
    mulai_sesi text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    view_result boolean DEFAULT false NOT NULL,
    created_by uuid DEFAULT '00000000-0000-0000-0000-000000000000'::uuid NOT NULL,
    participant character varying(5) DEFAULT 'CP'::character varying NOT NULL,
    paused_at timestamp(6) without time zone,
    transition_time integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.jadwals OWNER TO postgres;

--
-- Name: jadwals_peserta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jadwals_peserta (
    id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    peserta_id uuid NOT NULL
);


ALTER TABLE public.jadwals_peserta OWNER TO postgres;

--
-- Name: jawaban_pesertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jawaban_pesertas (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    soal_id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    jawab text,
    answered boolean DEFAULT false NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    checked boolean DEFAULT false NOT NULL,
    point numeric(19,2) DEFAULT 0 NOT NULL,
    ragu_ragu boolean DEFAULT false NOT NULL,
    iscorrect boolean DEFAULT false NOT NULL,
    part integer DEFAULT 1 NOT NULL,
    ai_opinion text
);


ALTER TABLE public.jawaban_pesertas OWNER TO postgres;

--
-- Name: jawaban_soals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jawaban_soals (
    id uuid NOT NULL,
    soal_id uuid NOT NULL,
    text_jawaban text NOT NULL,
    correct boolean NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    label_mark character varying(255)
);


ALTER TABLE public.jawaban_soals OWNER TO postgres;

--
-- Name: jurusans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jurusans (
    id uuid NOT NULL,
    kode character varying(255) NOT NULL,
    nama character varying(255) NOT NULL
);


ALTER TABLE public.jurusans OWNER TO postgres;

--
-- Name: matpels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matpels (
    id uuid NOT NULL,
    kode_mapel character varying(100) NOT NULL,
    jurusan_id text,
    agama_id uuid,
    correctors text,
    nama character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.matpels OWNER TO postgres;

--
-- Name: medias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medias (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_directory boolean DEFAULT false,
    parent_id uuid
);


ALTER TABLE public.medias OWNER TO postgres;

--
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    code character varying(255) NOT NULL,
    title text NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: pesertas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pesertas (
    id uuid NOT NULL,
    sesi integer NOT NULL,
    no_ujian character varying(50) NOT NULL,
    agama_id uuid NOT NULL,
    jurusan_id uuid NOT NULL,
    nama character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    api_token character varying(255),
    status integer DEFAULT 1 NOT NULL,
    block_reason character varying(255),
    antiblock boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    ava text,
    blocked_at timestamp(0) without time zone
);


ALTER TABLE public.pesertas OWNER TO postgres;

--
-- Name: role_menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_menus (
    role_code character varying(255) NOT NULL,
    menu_code character varying(255) NOT NULL
);


ALTER TABLE public.role_menus OWNER TO postgres;

--
-- Name: room_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room_members (
    id uuid NOT NULL,
    room_id uuid NOT NULL,
    event_id uuid NOT NULL,
    student_id uuid NOT NULL,
    created_at timestamp(6) without time zone
);


ALTER TABLE public.room_members OWNER TO postgres;

--
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id uuid NOT NULL,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- Name: sesi_schedules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sesi_schedules (
    id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    sesi integer DEFAULT 1 NOT NULL,
    student_id uuid NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.sesi_schedules OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    code character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: siswa_ujians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siswa_ujians (
    id uuid NOT NULL,
    peserta_id uuid NOT NULL,
    jadwal_id uuid NOT NULL,
    mulai_ujian character varying(255) NOT NULL,
    mulai_ujian_shadow character varying(255) NOT NULL,
    selesai_ujian character varying(255),
    sisa_waktu integer NOT NULL,
    status_ujian integer NOT NULL,
    out_ujian_counter integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    banksoal_id uuid NOT NULL,
    token character varying(100),
    last_part integer DEFAULT 1 NOT NULL,
    transition_state boolean DEFAULT false NOT NULL,
    transition_start bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.siswa_ujians OWNER TO postgres;

--
-- Name: soal_summaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soal_summaries (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    soal_id uuid NOT NULL,
    total_void integer NOT NULL,
    total_correct integer NOT NULL,
    total_wrong integer NOT NULL,
    highest_point numeric(19,2) NOT NULL,
    lowest_point numeric(19,2) NOT NULL,
    avg_point numeric(19,4) NOT NULL,
    ds_point numeric(19,6) NOT NULL,
    addons text,
    created_at timestamp(0) without time zone,
    total_done integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.soal_summaries OWNER TO postgres;

--
-- Name: soals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soals (
    id uuid NOT NULL,
    banksoal_id uuid NOT NULL,
    tipe_soal integer NOT NULL,
    pertanyaan text NOT NULL,
    layout integer DEFAULT 1 NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    competence_item_id uuid,
    absolute_eval boolean DEFAULT true NOT NULL,
    case_sensitive boolean DEFAULT true NOT NULL,
    supports text,
    sequence bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.soals OWNER TO postgres;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id uuid NOT NULL,
    token character varying(255) NOT NULL,
    status integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expired_at timestamp(0) without time zone,
    CONSTRAINT tokens_status_check CHECK (((status)::text = ANY (ARRAY[('0'::character varying)::text, ('1'::character varying)::text])))
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'EVAL'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: backups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backups ALTER COLUMN id SET DEFAULT nextval('public.exo_backups_id_seq'::regclass);


--
-- Name: feature_infos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_infos ALTER COLUMN id SET DEFAULT nextval('public.feature_infos_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Data for Name: agamas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agamas (id, kode, nama, created_at, updated_at) FROM stdin;
3aed771a-9458-4cce-9811-8b0b50bfe462	ISLAM	Islam	2023-08-13 20:49:43	2023-08-13 20:49:43
6e4c117b-b057-44a3-98ab-d54d197030de	PROTESTAN	Protestan	2023-08-13 20:49:43	2023-08-13 20:49:43
dae66fe2-5785-4b44-892b-6a40c1c2e1f1	KATOLIK	Katolik	2023-08-13 20:49:43	2023-08-13 20:49:43
8194f3f2-501b-420f-a496-85fded97beb0	HINDU	Hindu	2023-08-13 20:49:43	2023-08-13 20:49:43
b835ff17-369c-4250-a565-000a06953adf	BUDHA	Budha	2023-08-13 20:49:43	2023-08-13 20:49:43
\.


--
-- Data for Name: backups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.backups (id, filename, version, detail, generated_date, bak_type, status, created_at, updated_at) FROM stdin;
1729416661337931240	exo-backup/42a71850-bf01-4c21-90f7-76090f3867e0.exo.zip	4.4.0-ROSETTA-RELEASE	{"jurusan_rows":1,"matpel_rows":1,"baksoal_rows":1,"soals_rows":10,"jawaban_soals_rows":30,"pesertas_rows":14,"medias_rows":6}	2024-10-20 16:31:01	BAK	00	2024-10-20 09:31:01	2024-10-20 09:31:01
1729425276132160271	exo-backup/4b8ecfb5-900f-4eee-acc9-06e2f146163b.exo.zip	4.4.0-ROSETTA-RELEASE	{"jurusan_rows":1,"matpel_rows":1,"baksoal_rows":1,"soals_rows":10,"jawaban_soals_rows":30,"pesertas_rows":14,"medias_rows":6}	2024-10-20 18:54:36	BAK	00	2024-10-20 11:54:36	2024-10-20 11:54:36
\.


--
-- Data for Name: banksoal_chains; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banksoal_chains (id, banksoal_id, chain) FROM stdin;
01JCM0N4JG6X3KYW2MA65AHTRY	480f995f-3488-49e2-8a0c-87fd4bdd4367	b132b631-3b5e-4087-b457-1dd4664daed4
\.


--
-- Data for Name: banksoal_summaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banksoal_summaries (id, banksoal_id, total_done, avg_duration, total_schedule, lowest_duration, highest_duration, ds_duration, avg_result, ds_result, created_at, avg_point, ds_point, lowest_result, highest_result, max_point, lowest_point, highest_point) FROM stdin;
299f4bf7-11d7-4f44-9224-ffef99da6e8f	b132b631-3b5e-4087-b457-1dd4664daed4	3	130.6667	1	1	340	183.003643	41.20	0.000000	2024-11-12 02:40:59	41.20	0.000000	41.20	41.20	100.00	41.20	41.20
e605f88e-e3e7-4d85-86c6-6b5766323315	31d085d2-069f-41a2-b802-71ba97846911	1	274.0000	1	274	274	0.000000	0.00	0.000000	2024-11-12 06:46:38	0.00	0.000000	0.00	0.00	100.00	0.00	0.00
4a3af47b-e5b7-4500-b7b6-793420e990f2	480f995f-3488-49e2-8a0c-87fd4bdd4367	0	0.0000	0	0	0	0.000000	0.00	0.000000	2024-11-14 00:50:58	0.00	0.000000	0.00	0.00	0.00	0.00	0.00
b4b688b7-75fd-4854-9ca6-4ad1b49c6c5c	f75d819f-4338-4444-b604-15b87d5eacee	0	0.0000	0	0	0	0.000000	0.00	0.000000	2024-11-14 00:51:19	0.00	0.000000	0.00	0.00	0.00	0.00	0.00
\.


--
-- Data for Name: banksoals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banksoals (id, kode_banksoal, key_lock, lock_by, persen, matpel_id, author, created_at, updated_at, competence_id, code01_max, code02_max, code03_max, code04_max, code05_max, code06_max, code07_max, code08_max, code09_max, code10_max, code11_max, code12_max, code13_max, code14_max, is_locked, supports, last_sequence, sequence_type, code15_max) FROM stdin;
b132b631-3b5e-4087-b457-1dd4664daed4	inf-7	\N	\N	{"pilihan_ganda":50,"pilihan_ganda_komplek":0,"pilihan_ganda_citra":0,"menjodohkan":0,"isian_singkat":0,"listening":0,"esay":50,"mengurutkan":0,"benar_salah":0,"setuju_tidak":0,"menjodohkan_many":0,"matrix_text":0,"matrix_checkbox":0,"groupping":0,"blank_space":0}	2bc0355e-3b18-472a-80b3-8d0133f8b904	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	2024-11-11 14:57:04	2024-11-11 16:14:25	\N	20	5	0	0	0	0	0	0	0	0	0	0	0	0	f	\N	0	0	0
480f995f-3488-49e2-8a0c-87fd4bdd4367	inf-9	\N	\N	{"pilihan_ganda":50,"pilihan_ganda_komplek":0,"pilihan_ganda_citra":0,"menjodohkan":0,"isian_singkat":0,"listening":0,"esay":50,"mengurutkan":0,"benar_salah":0,"setuju_tidak":0,"menjodohkan_many":0,"matrix_text":0,"matrix_checkbox":0,"groupping":0,"blank_space":0}	2bc0355e-3b18-472a-80b3-8d0133f8b904	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	2024-11-14 00:20:02	2024-11-14 00:20:32	\N	20	5	0	0	10	0	0	0	0	0	0	0	0	0	f	\N	0	0	0
\.


--
-- Data for Name: check_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.check_answers (id, banksoal_id, peserta_id, jawab_id, corrected_by, point, created_at, updated_at, jadwal_id, ai_opinion) FROM stdin;
a211602a-781f-4206-a429-b82d6c09dd53	b132b631-3b5e-4087-b457-1dd4664daed4	40b50e63-df73-4c34-b495-cc60242b4565	15997898-d4ea-4a14-bbeb-349e0f7e2bca	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	5.60	2024-11-11 16:32:07	2024-11-11 16:32:07	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	\N
e78cf02b-9118-4d6f-a549-cb1522e87d6f	b132b631-3b5e-4087-b457-1dd4664daed4	40b50e63-df73-4c34-b495-cc60242b4565	d4ba84d4-3dba-429a-b1b6-c125c538f9bf	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	5.60	2024-11-11 16:32:08	2024-11-11 16:32:08	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	\N
8a9b1971-61dd-411e-bb66-0738bdade627	b132b631-3b5e-4087-b457-1dd4664daed4	40b50e63-df73-4c34-b495-cc60242b4565	c0cc4762-f183-4af1-b0f6-24ccdde99d0b	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	10.00	2024-11-11 16:32:09	2024-11-11 16:32:09	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	\N
b1e8ba34-17bd-4326-b307-a3ef31442bc6	b132b631-3b5e-4087-b457-1dd4664daed4	40b50e63-df73-4c34-b495-cc60242b4565	c78ae7f0-3dde-41d5-a100-4595a1d7cca0	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	0.00	2024-11-11 16:32:10	2024-11-11 16:32:10	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	\N
b159d5fe-5119-4e01-9194-5a3646830e39	b132b631-3b5e-4087-b457-1dd4664daed4	40b50e63-df73-4c34-b495-cc60242b4565	5dc5399d-9664-46a0-9847-1aced17e1d42	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	10.00	2024-11-11 16:32:12	2024-11-11 16:32:12	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	\N
\.


--
-- Data for Name: competence_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competence_items (id, competence_id, tipe_soal, total_soal, code, point, name, description, created_at, updated_at, wrong_point, part, index) FROM stdin;
\.


--
-- Data for Name: competences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.competences (id, code, name, created_at, updated_at, created_by, total_part) FROM stdin;
\.


--
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, device_id, device_os, device_name, ip_address, created_at, peserta_id, out_count, last_verified_at) FROM stdin;
74cc8798-76b7-4b00-9deb-30493353afdc	rlsjJITBSUdWlnzJfJ6qR9kD	Linux	Chrome		2024-10-20 08:57:43	\N	0	\N
d7915395-dcde-48ed-85d1-31f3086f10bd	Ad159zcoVbllwmkBKgAFxnUY	Linux	Chrome	140.213.44.84	2024-10-20 09:05:23	\N	0	\N
4581a587-0d74-4f49-b390-481f81fbef11	GEqlfHkz6nrH7Xui1tJlXPlO	Android	Chrome	103.175.82.69	2024-11-12 03:13:25	\N	0	\N
3216a1e2-cc7f-4663-8322-162eb375a0e5	sWa9Z8mFq6mOuAwjdsRJv8sA	Android	Chrome	182.1.118.176	2024-11-12 04:18:24	\N	0	\N
3c6ad001-e7a2-4cec-bd89-656988eedf3e	wQCOTsim2Tow6MKmzJ3k1kIZ	Windows	Chrome	36.81.174.45	2024-11-12 06:26:55	\N	0	\N
8dd91d96-6518-4ae1-888d-c56b9b905b65	CUEec3kZQF8Dg04vhJSJAy9u	Android	Chrome	202.43.172.5	2024-11-12 04:20:26	\N	0	\N
94e2f4f8-6e69-4291-822b-37dbcbf91ea1	vFC4fjXmCyoZ90JRWVQhKDFu	Android	Chrome	36.81.174.45	2024-11-12 05:47:03	c3bb53e1-cf20-4805-8955-192936c9288a	0	\N
632b3071-95a9-4778-b344-f7c2cf3181a2	nbDwzUI4NGJ9e5onkYSxp6Gd	Android	Chrome	36.81.174.45	2024-11-12 03:15:07	\N	0	\N
cedd2b68-c7fa-441d-960b-1ed023ebc28a	H6fX5i9Sdmo9Gsgi9m2lbYJQ	Android	Chrome	182.1.118.176	2024-11-12 03:29:13	\N	0	\N
02eac083-a04d-45dc-881b-b2470110e6cf	Vw7Gv7qfLUjsPW7McZokMMtJ	Linux	Chrome	36.81.174.45	2024-11-12 05:51:00	\N	0	\N
d03e0fdb-27b1-48a8-aca8-15bfc3a8c0b8	inxZiu1ztpsZeqFBp7jaKsO8	Android	Chrome	180.247.113.10	2024-11-12 13:20:39	\N	0	\N
d5e7c19e-5728-409a-9e36-2506dc1e859e	nbEFjic7vcSuX0z817RXWE2T	Android	Chrome	101.128.120.24	2024-11-12 08:38:23	\N	0	\N
94d13274-a14a-4daa-ad2c-544e21713ef1	xWTMxjLlcE4Oz6CW1F2xRCf5	Android	Chrome	114.125.119.44	2024-11-12 04:20:10	\N	0	\N
ef71a861-51cf-4527-be75-9e400d617c0c	seK67RFSYa7mjS2HTkJbHBpI	Android	Chrome	36.81.174.45	2024-11-12 03:43:12	\N	0	\N
7d07d740-afb4-4ab2-a4b5-0018687cd4c8	7vw2Ye5IlnD40f2sf8yFi5nM	Windows	Chrome	36.76.125.152	2024-11-14 00:41:08	\N	0	\N
ac796bdb-3761-45f3-a48b-0fda9f2125f5	GlTddCygtzq7QHjBqDWQlA17	Windows	Chrome	36.76.125.152	2024-11-14 07:45:44	5ba024ed-363a-44cf-97f2-251aed7cf4e4	0	\N
65becf58-efec-4ac6-8733-395a40a22e4a	r5N6pPfQ3l2MWKVMAwMvoVdc	Android	Chrome	114.79.18.177	2024-11-12 03:31:08	\N	0	\N
e096cddb-9f45-4542-867f-c82d5706abc2	G5L2IiOBpysmnsxXXOVUm8Iq	Android	Chrome	120.188.84.58	2024-11-12 04:11:48	\N	0	\N
36a39859-8551-4fc9-aa01-f21d3b2bb89f	YIvxnL7IYcCTYleuldah6uAR	Android	Chrome	120.188.75.197	2024-11-12 03:14:42	\N	0	\N
d7094da1-3590-4e67-b43d-6aa6d7efba83	0iHZqfahCZrFoaJ5hN7Xe67T	Android	Chrome	114.5.246.111	2024-11-12 03:30:11	\N	0	\N
d88cc4d7-e7df-43ad-8bb1-fcb1bb15578b	qgbjgAgJuqpWbl8QCP09BKPk	Android	Chrome	114.125.118.22	2024-11-12 04:08:16	\N	0	\N
0af2079a-b7d5-41f4-b100-eb8b592ec8e1	0Z84xFdKHM8FWmTMxBhLaXlG	Linux	Chrome	205.169.39.21	2024-10-17 18:31:01	\N	0	\N
5d5d93b1-98d7-440b-aefc-754cb8f9c7fa	BlBN34XExuV8OUjhoRjj6yJC	Linux	Chrome	52.16.245.145	2024-10-17 18:46:35	\N	0	\N
20f85b06-1771-406e-ac24-dd2467933924	uhZGACMrxihwut8WkiU8IkNO	Linux	Chrome	110.137.101.108	2024-10-20 12:30:23	\N	0	\N
0bf7510e-3c49-4344-aca9-d44742a10816	XenidBjGBNBKsSvEOUG2kPBq	Linux	Chrome	34.72.176.129	2024-10-17 20:24:06	\N	0	\N
3a526e46-d40e-40e1-b97a-7f7780a1c252	40cxVqhdFLlTgg5dCfR1iTiJ	Linux	Chrome	205.169.39.204	2024-10-17 20:24:17	\N	0	\N
759a6a3e-2b38-4561-9264-4ed0d098c6e1	RiF5Y0NtB9ZkFIXDP5nnCvkC	Linux	Chrome	34.122.147.229	2024-10-17 20:26:41	\N	0	\N
0f9ad33c-31d8-469a-b66a-e3da02af0550	IVh3j1j5K01YrmcDfMyCpiZH	Linux	Chrome	205.169.39.7	2024-10-17 21:31:04	\N	0	\N
bcd778f7-d23e-4564-a30d-957fe165d5c0	qTI9Yjn2Q0Uvu2D2Ws9bHexb	Linux	Chrome	110.137.101.145	2024-10-30 14:08:38	785c3b02-82a9-44a3-8e9b-fd95a49db0d7	0	\N
e64a8c36-65a1-4683-ad9d-8c847454a490	qSq5kyQgWzAVSViDZ6Kq1cPI	Android	Chrome	103.26.211.4	2024-11-12 03:13:47	\N	0	\N
c308ff02-8e63-44c7-93cb-e4184c4c4f16	78jLVyzsRu471PwYAliz9jjN	iOS	Safari	107.173.151.14	2024-10-18 05:25:20	\N	0	\N
d6e2ae07-fb83-4a26-a735-6da2bb0572a3	GBFsEapUNkuAvfVAygu8UJUW	iOS	Safari	107.172.179.139	2024-10-18 05:25:20	\N	0	\N
d9a8e3a1-e3a3-4014-9c5a-f7c36e278bfc	fdSonDFnvFqwvYbKCWaJjWL5	Windows	Chrome	103.165.213.194	2024-10-18 08:34:50	\N	0	\N
252b5322-6673-4594-b0b1-1141965ae269	54w1gv7Mo8GQgLCLj8GPSIOn	Android	Chrome	66.249.82.67	2024-10-19 10:28:36	\N	0	\N
635dd62e-3eca-49f2-b003-51bf9d1bc235	6VwYzBuR5gXxtfqU9DDv8IpJ	Linux	Chrome	66.249.82.66	2024-10-19 10:28:37	\N	0	\N
59710890-9c5b-460d-9ed9-5ad8dc68b122	W7D8yMaDw9ywQii6XjVyx4YT	Windows	Chrome	172.255.48.137	2024-10-19 10:29:20	\N	0	\N
6b3f4aef-99fb-46a7-ab69-bf1ebb045690	BQXKHADeRpuYoMALB5QsE9Yb	Linux	Chrome	66.249.82.67	2024-10-19 10:31:06	\N	0	\N
d0f5624b-1847-4191-bf5f-6584d4693ecb	AKuj6wGNNel3zk1UhxIYlI1s	Android	Chrome	66.249.82.68	2024-10-19 10:31:06	\N	0	\N
5eb3fe80-99c3-458a-803b-092179f98df9	1OW5aGcjtmyznBSd7CnXYv3H	Android	Chrome	110.137.101.108	2024-10-19 11:44:44	\N	0	\N
7a8f4ab4-558c-4040-be4c-a7f95db0c1c9	s9yK7MaR4e6mX3CoLJKfgbcd	Android	Chrome	36.81.174.45	2024-11-12 03:15:00	\N	0	\N
b7f244e1-dd29-41d5-ad42-1b8222c5ef61	BXTi17OfaCDysrrYh3vIwaJm	Android	Chrome	36.81.174.45	2024-11-12 03:15:40	\N	0	\N
1ceda06f-a3a0-4447-a4b6-3d7f8c2e78b5	NzegujuY59BVmIMy0I95OCDO	Linux	Chrome	111.7.96.174	2024-10-23 03:39:48	\N	0	\N
bfddf972-5097-407e-ba40-60101f5aae1c	PZwezl2oybXuBPR30rMRVkhR	iOS	Safari	36.81.155.119	2024-11-05 07:16:04	\N	0	\N
c39b2271-dc2a-4e03-a2dd-9095db737cff	2xYfYjbRVnrHolsm4GpjZoBp	Android	Chrome	112.215.173.22	2024-11-06 12:11:03	\N	0	\N
f66b5d15-b668-4dd6-8c86-ba81ed068ddf	aHJseBOCE3XtcBFUwaiDnVnq	Android	Chrome	110.137.103.223	2024-11-11 16:29:46	40b50e63-df73-4c34-b495-cc60242b4565	0	\N
17acad04-8600-4a5a-9468-ba094c9d4e3b	Gt5BzJzAifswqYkA8WLDMvFZ	Android	Chrome	120.188.75.197	2024-11-12 04:16:38	\N	0	\N
5529990e-f87d-4038-b9ea-82ec5921716e	Wg5bTyNN7WZtppIv4HQMpm5g	Android	Chrome	114.79.19.186	2024-11-12 03:46:22	\N	0	\N
bdd7503a-c079-4a33-bf27-268aa25a5bd1	PXgWsdyM1xB1wSd28vy3FDlb	Linux	Chrome	205.169.39.48	2024-11-08 05:50:00	\N	0	\N
4d6018f3-e12c-44ba-a3f0-61d7f4382dd7	gAkxbX0qNxqWqxDtAOyCVEVB	iOS	Safari	36.76.125.152	2024-11-14 06:32:16	\N	0	\N
4d2bed15-e1bb-416c-bd16-919529fbfbb1	LxtH4WPDudo6P5sG7ZkFijQL	Android	Chrome	182.1.118.131	2024-11-12 03:27:34	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	0	\N
600c8404-9afd-4064-9ae6-0c3e578a30fc	HStSxzbVZdSt9KidFCFYZAgV	Android	Chrome	120.188.75.197	2024-11-12 03:14:29	\N	0	\N
605df403-7a95-45a8-b71c-c4609742ed96	ZY3U43GP8dyjjiJ006QnCxQX	Android	Chrome	103.175.82.68	2024-11-12 03:14:25	\N	0	\N
645a8d9f-3951-441b-bc82-d42340125dba	yGvFW1WcwGPHW9P5p8BpvRag	Android	Chrome	120.188.84.58	2024-11-12 03:14:40	\N	0	\N
5bb1b648-c5bc-497f-8850-defa58334d3d	uuuiWhtJTkvhMmLVGConZMHp	Android	Chrome	120.188.75.197	2024-11-12 03:13:22	47d001cf-6178-46d4-b7a6-b5e436f9365b	0	\N
c9637c5d-f38d-4b24-8d42-0e4834fc1d2c	jIPqgiaDoQ8imxL8TOTyJbom	Android	Chrome	66.249.82.66	2024-11-12 03:17:44	\N	0	\N
36b9f761-6e31-4c75-8a2a-b11db564d5b7	At40phHHRhcMP5qWdZ1RjkdZ	Android	Chrome	36.81.174.45	2024-11-12 03:15:11	aedc47b0-eb65-4174-9835-e3d770738c80	0	\N
8b82b16a-fa90-4155-ae2a-b8213d619cf8	JB7MM3WbJ5YGTShzX7GhKSBg	Android	Chrome	114.5.110.231	2024-11-12 03:54:36	e82e107a-8882-4074-8841-c557daf4126f	0	\N
4a6a1343-c69b-448a-96fe-344d780dfd88	bNozyS0PxIEcYX1c6iXJXQfc	Android	Chrome	36.81.174.45	2024-11-12 03:16:02	035280f9-e68c-4199-99f7-c192f34fa0b7	0	\N
18411661-a526-4b7b-afd4-e14451a4eb99	uHrC6upRDRl843CCCbmmZe42	Android	Chrome	182.1.115.105	2024-11-12 03:17:03	ebe47e76-37d7-43f1-9baf-da841d058eb9	0	\N
0658b163-35e2-49fd-8d89-e981dd4f8fdb	JqwvNovfeKyTsPy1mr2cD8yj	Android	Chrome	114.5.109.118	2024-11-12 12:20:11	\N	0	\N
9042966c-c374-48a4-82ba-e0500b1e6c9b	JCZkmcFu3yJuH1jeex9KrOe6	Android	Chrome	101.128.121.227	2024-11-14 08:54:44	\N	0	\N
5a1767ec-65b6-4e5b-8d2f-b2a121a7049d	6lnBSKTCi2EK0WROY37ZftRv	Linux	Chrome	8.219.91.146	2024-11-12 17:11:58	\N	0	\N
a3041c48-bf2e-4d44-b93b-b7aaa6e36d16	3n1QsL1GoAlWsuOV4ya69vHj	iOS	Safari	182.1.123.113	2024-11-14 09:22:49	\N	0	\N
c33a8243-90e3-41e3-9209-f9bcbe411561	6BSajQgM5GJFuDl0nlFHvywD	Android	Chrome	103.26.211.5	2024-11-12 03:21:11	\N	0	\N
268e27c3-6bd5-402d-8adb-caaebc742f3a	JFhIwUPtHgj7eyuCSxNgiE35	Android	Chrome	120.188.74.231	2024-11-13 02:41:17	\N	0	\N
1f423e6d-cdc0-4459-a2c9-c43d28741525	8n3aQjdAOJLLwpQMQQIAfo30	Android	Chrome	114.5.242.3	2024-11-13 03:53:47	\N	0	\N
659b0281-5c4e-4166-9557-186ccd4b7855	mOEOB3si3U54fu6OBo2taIKr	iOS	Safari	180.254.47.37	2024-11-13 12:29:12	\N	0	\N
1c6e174f-4c79-443f-b520-38337bfeb01f	mpkFvBPUbj0DZvWYOyrCV1wK	Android	Chrome	149.108.141.57	2024-11-13 13:28:37	\N	0	\N
99dce7fd-cd50-4053-a86b-42b3bc234f06	ndsrbZDan1LvBt3XJ8yzqGsg	Android	Chrome	36.76.125.152	2024-11-14 01:50:02	866347c4-acb1-4edc-8222-7ab2c3b343c7	0	\N
191053a1-0562-45f8-9619-106697a28bd0	H5IVzn8kyacI6YRCgbUcRuul	Android	Chrome	36.76.125.152	2024-11-14 01:32:44	fc3c9dfd-8827-41df-8366-ed852f8a23ec	0	\N
c727a38d-ae9c-4da7-a314-d5c1f4cda8fb	Ri8U1pbAAwH04XZFUlzKTn2v	Android	Chrome	114.5.110.212	2024-11-14 02:03:07	\N	0	\N
af79a5e9-88a0-469d-a065-ffdac4142d34	B8j8FcxdspMH9VBQrdJXiS5i	Android	Chrome	36.81.174.45	2024-11-12 04:22:57	\N	0	\N
c06c03d5-51f4-4f41-b660-272fec6de1c9	84Y6FbeMFwEWm4sK3fnOuldu	Android	Chrome	114.5.102.106	2024-11-14 02:04:29	\N	0	\N
4a1568d1-6c1f-469b-851d-319fe28859c9	99rJfQwQSSmXIdIjF8hYtTyk	Android	Chrome	114.5.108.24	2024-11-12 04:14:50	\N	0	\N
96b56f95-367e-47d8-ac8e-0be69dd34df9	4YvdqwchDS3onfdR2QH0mutc	Android	Chrome	114.5.111.96	2024-11-12 05:51:37	\N	0	\N
c416c500-457f-43ad-8a34-48e543ac666d	LFbjrxOrxPnxuHJ1ZWIsiMPM	Android	Chrome	114.125.109.154	2024-11-12 06:29:21	\N	0	\N
53f78b2c-c7ec-4be6-a46d-821132a10f1e	2orPU1Ij79qeTy509Kj5MPFG	Android	Chrome	114.79.20.22	2024-11-12 06:34:45	\N	0	\N
29fe20a2-b7cf-4ae7-890e-e2a3f680744a	16oXfg6P8bjSz0yoOmfdWiHT	Android	Chrome	36.76.125.152	2024-11-14 01:46:33	\N	0	\N
f0bc6372-c8e2-4fa8-9efb-b2c4145f9943	Qskpy1RB1OEQLqeJWnPv9USr	Android	Chrome	114.5.110.212	2024-11-14 01:23:31	31252c94-4f88-41f2-98fd-4a2eb68b6b72	0	\N
a8167aaa-a4c9-4eb8-9989-7f13fd141731	JnYjuDKqYBtY559XOG2PLxFW	Android	Chrome	114.5.110.212	2024-11-14 01:09:16	aedc47b0-eb65-4174-9835-e3d770738c80	0	\N
bc929e69-83de-4807-af3b-ffa370498a48	6zr9bLfmmF3fweSFVupDL9oZ	Linux	Chrome	120.188.79.201	2024-11-12 06:54:57	\N	0	\N
9e78b090-2507-4495-a09e-02d2347aa059	3Ku2TdseABwilLuIdqQswvvU	Android	Chrome	36.76.125.152	2024-11-14 01:28:52	3fc864d9-36af-4c93-ba8c-d5d5e73df285	0	\N
b3203554-7d52-46cb-a8da-e3b181a5122c	cV3drPZqDivORaHwYdYKfkGr	Android	Chrome	120.188.79.201	2024-11-12 06:57:47	\N	0	\N
79bec051-b8d8-4850-a14a-7269bb534dd0	EJQztwwzf2x8DxKuNi9XQyaX	Android	Chrome	120.188.79.192	2024-11-12 07:06:11	\N	0	\N
1dc8f4d6-e902-43ac-86d3-f6ccc6862b18	VoF3nYcsc4han6J5L7Xx3IpU	Android	Chrome	150.129.59.5	2024-11-12 09:47:29	\N	0	\N
ebf2d926-10c2-4735-8aaf-7fc3099bc80d	OAO3z9auJfAoZXlr5QliVs6i	Android	Chrome	182.1.65.8	2024-11-12 11:21:11	\N	0	\N
4ae97387-de96-4c44-bacc-675c7f832d44	lPbwCezkalfX6fMXHoPuKXGP	Android	Chrome	36.76.125.152	2024-11-14 01:24:17	d477ae54-7cef-4b92-b470-9023940721a1	0	\N
4f731024-6748-4589-8466-da08248d449f	sOLYi0Hk0gXbU7kvbdDSOLvM	Linux	Chrome	36.76.125.152	2024-11-14 01:34:03	cf9a399b-4b3f-46dd-81b0-75d7542232a4	0	\N
736cd027-ac8b-49ed-b82a-767a36095e95	NVenMeS0yNYwhW601w9kQOFy	Android	Chrome	36.76.125.152	2024-11-14 01:14:47	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	0	\N
fb5d8496-24a4-40ee-b6b0-19bb92c8427b	DvKOR5GHlL1xkau9zJZ7q4FE	Android	Chrome	114.5.242.247	2024-11-14 09:08:52	\N	0	\N
45199d67-ce18-40d8-ae83-c059fe7f88b3	PWFmaQIAlSvmP5kCKxNFSj2s	Android	Chrome	36.76.125.152	2024-11-14 06:33:47	2177d90f-b339-434f-9c0e-137be0bb8234	0	\N
bb2b1d9a-3f77-49d1-b0bf-c0ab18afe6db	ierATwThBpDdpzwcqMhdIBUK	Android	Chrome	36.76.125.152	2024-11-14 02:00:16	53df9679-d8eb-41da-9874-c33fbc158c77	0	\N
aab7073d-f71c-46b9-ae40-99208ae86cb2	LbG5sXdxlBL9AmzBRvGpQAMk	Android	Chrome	36.76.125.152	2024-11-14 01:47:47	5c552624-423b-4197-8fc8-1bacb9aaf07b	0	\N
01eb458a-9e40-4c26-899e-a5339a24cb2b	QXEeVXRrSyFb7p53j3jjGtp8	Android	Chrome	66.102.6.226	2024-11-14 01:38:30	\N	0	\N
5275ddf1-7bd8-4081-ba40-deea6ff99cbe	OiQQqE3jjcWmiugmpYU60Xcn	Android	Chrome	114.79.22.130	2024-11-14 01:09:59	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	0	\N
fa227cfe-8c73-4fe1-a904-6c2054e8293a	GJlZ8TXkAwzJAtUIobkc1Rva	Android	Chrome	182.1.113.62	2024-11-14 01:11:01	5ba024ed-363a-44cf-97f2-251aed7cf4e4	0	\N
7dab40e1-60d3-46e5-9dc5-8ea04a348ff9	FrNfgjSCAL7fC95momN0HThy	Android	Chrome	36.76.125.152	2024-11-14 01:13:28	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	0	\N
c4c34d84-795c-428b-8e1b-bfd70442858c	ACuCmDzXPM5sqHs6ZxOcsLXL	Android	Chrome	114.5.111.131	2024-11-14 01:12:45	e82e107a-8882-4074-8841-c557daf4126f	0	\N
cad6e8e2-71d2-4915-9ec6-896401faeb9f	cax4t7CrTnXULXp368YXxpGY	Android	Chrome	36.76.125.152	2024-11-14 01:24:03	0ddde262-6708-469c-b288-84f5d8bb37e9	0	\N
37467db2-3ba6-4cc3-81d3-8edf896b4f1e	xELu31s5gZJxdbxU0Au0ggKS	Android	Chrome	114.5.222.235	2024-11-12 04:45:52	\N	0	\N
64815589-3c07-4631-af83-64ff48e278f9	k7WgnzdjHwXE71swg9kV9WBF	Linux	Chrome	120.188.74.122	2024-11-14 01:31:43	bea68c4e-349b-4222-9f66-e47b5eac2280	0	\N
fe920439-388f-4714-b987-a49de3832171	5nJOgwCEjIfiJikwrMF7SGDk	Android	Chrome	36.76.125.152	2024-11-14 01:47:07	a8640110-77e5-42f9-9635-756d060428ff	0	\N
2a488d2a-97e1-41c0-ae2f-9fc4213ce032	3vHA9ZlGUdO9sIuZTdxINlGz	Linux	Chrome	36.76.125.152	2024-11-14 01:13:20	47d001cf-6178-46d4-b7a6-b5e436f9365b	0	\N
919fd8e6-e916-49c8-a454-0bc79555b660	0VmBDcMwanAwQxpE8I2p7mUM	Android	Chrome	36.76.125.152	2024-11-14 01:59:09	\N	0	\N
d0ba321e-4a8f-445a-84fa-b947de913a76	Tsjz0PIKe7A4E5FGlUnYrG5B	Android	Chrome	114.79.22.95	2024-11-14 06:31:59	da0698b5-abc3-4c23-acb2-c80beea05535	0	\N
237708c7-d917-45e1-84cf-a62e490d9f70	MYY0873PH4P0TYKDWRyM8IKo	Android	Chrome	120.188.78.181	2024-11-14 06:33:43	50b66260-ef17-434e-bef9-50cd5919bebc	0	\N
b4d8533a-dc31-4822-85de-8f154dfac3f7	76RHA02XX40qT5i0AU4heU3D	Android	Chrome	114.5.222.100	2024-11-14 01:58:53	\N	0	\N
6ba3c62f-74c4-4695-a719-02f0e37efe0b	DlPdR6waeDnI0T05uSl9q9Ex	Android	Chrome	114.5.105.138	2024-11-12 03:32:17	\N	0	\N
cada177e-44df-4320-a0e1-651fb5ba392f	wO1wztOlPmiU6ZZn0VNuYOEX	Android	Chrome	36.76.125.152	2024-11-14 01:17:54	ebe47e76-37d7-43f1-9baf-da841d058eb9	0	\N
625115b3-f431-4f1e-9f1e-e18dd1b6740d	zQcVrhkGOJWdwmDHRkiBalVM	Android	Chrome	114.79.23.96	2024-11-14 10:13:38	7873e474-1a77-49c3-9fbb-bf6207e94acf	0	\N
8fce2fef-f477-46e0-8dc3-aa18692bfcc2	wBukzQhWSPGqkXpv0STb95XY	Android	Chrome	114.125.125.128	2024-11-14 06:31:34	fc3c9dfd-8827-41df-8366-ed852f8a23ec	0	\N
f7c1821e-d169-41ce-bd53-da1492ca29de	1LqK5btypEeYwYNMDhFmPJEC	Android	Chrome	182.1.116.90	2024-11-14 01:12:28	\N	0	\N
bb895182-93a8-4982-a388-89cdcce768cc	GfsNJNCwVCFpNETPCLfjuq8l	Android	Chrome	36.76.125.152	2024-11-14 01:10:03	\N	0	\N
15e8af3e-f1d6-4ff1-a28b-88a3991a64cf	rsIuA1D6Pe583TZsjYisU8S8	Android	Chrome	182.1.80.241	2024-11-14 01:25:20	\N	0	\N
6da5db0c-ce80-445f-839b-9de89c0cd33e	exzv7N0jxLWeWJ1WUF4B9NTc	Linux	Chrome	110.137.103.136	2024-11-14 09:53:30	5ba024ed-363a-44cf-97f2-251aed7cf4e4	0	\N
aa971bca-b329-44af-bdae-4529451b2862	egJKmEF85BiglSGm9OZXcMXz	Android	Chrome	36.76.125.152	2024-11-14 06:31:32	866347c4-acb1-4edc-8222-7ab2c3b343c7	0	\N
9501fc5d-af59-4471-8fca-b78fd2fee55c	mQDdiMG3659NyX7B4nzvSuq4	Android	Chrome	36.76.125.152	2024-11-14 06:32:40	\N	0	\N
3068440b-bb44-4ce1-8ce2-d015a5770419	r07fVWwpgmj3fh1ECyNPsezN	Android	Chrome	36.76.125.152	2024-11-14 06:34:07	\N	0	\N
8906b77a-a2ce-4f8b-b6fa-80d6f9373e27	yJ3kUXpBUmnHasGLRJcPFDP7	Windows	Chrome	103.126.226.94	2024-11-14 07:59:54	\N	0	\N
4bbc5047-8975-4aec-bfbd-0ba6f81d29b4	hLatCILB4u8knJPTBKW5eXQO	Android	Chrome	114.10.47.184	2024-11-14 08:52:34	3226b4e1-581d-49b9-90b9-83882d82f515	0	\N
b51c1eba-5d21-4d0a-bc32-4beac5b1a20b	w8nqIfIxGYGO3lxtvUHV6r47	Android	Chrome	182.1.119.115	2024-11-14 06:24:10	5c552624-423b-4197-8fc8-1bacb9aaf07b	0	\N
4c7faa5c-c9dc-4ed0-b1bb-b331875f136f	mtyIKev9fxijzgaJpLZUxFqR	Android	Chrome	182.1.87.124	2024-11-14 06:28:58	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	0	\N
ab92917a-1f10-47ee-88c3-35ea09d8c4a1	oNHOioc017o6V4nHRSTL3wkK	Windows	Chrome	36.76.125.152	2024-11-14 06:31:57	5ba024ed-363a-44cf-97f2-251aed7cf4e4	0	\N
3c3ab578-4fb2-4947-b6ce-8af407054402	YagUOJ5oJoyrYE9d4Nr2mO4D	Android	Chrome	36.76.125.152	2024-11-14 06:32:19	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	0	\N
2b64566a-2845-4e47-8235-5c834c0a8d72	P74dGPjw1mdMKnNDJwBJcfay	Android	Chrome	36.76.125.152	2024-11-14 06:32:50	50b66260-ef17-434e-bef9-50cd5919bebc	0	\N
9e1c2518-3353-46ca-874a-be837ffc0ac2	Isy2CGzEPztG5qO6qyrx8fQv	Android	Chrome	36.76.125.152	2024-11-14 06:33:07	2c2f921f-e0f2-4215-b03d-901d25004a2e	0	\N
dbc5555d-f3f6-413a-90d1-f2294e3536c9	OY2lKa4i4cGkUMVLRVWMeBfs	iOS	Safari	114.5.222.97	2024-11-14 06:25:42	e82e107a-8882-4074-8841-c557daf4126f	0	\N
6726c832-55db-4911-b650-a5cfd53db4d0	1WWvM0GE64EwVptuaxp3fRNC	Android	Chrome	114.5.222.97	2024-11-14 06:32:53	cf9a399b-4b3f-46dd-81b0-75d7542232a4	0	\N
ff1c9325-ae67-4ffb-9ac6-369b555920c5	glKa7CV6C5ucyHjS05jt2TOn	Android	Chrome	114.5.111.213	2024-11-14 06:24:46	bea68c4e-349b-4222-9f66-e47b5eac2280	0	\N
a56022dc-59c0-43f7-9b1e-0ae1cba846c4	oTonRv3fUPxd2JScP1jH5LQH	Android	Chrome	36.76.125.152	2024-11-14 06:33:25	5ba024ed-363a-44cf-97f2-251aed7cf4e4	0	\N
6ffa1ee3-884e-4046-afad-b176c29d6cbf	g6xxThW6Ft7KhBDmR3or0OYi	Android	Chrome	182.1.114.52	2024-11-14 06:33:30	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	0	\N
5cf75107-6e7c-47dc-a667-c4ad0efd83a9	bhhmDj0AEIHBKTVTBNUsHL3f	Android	Chrome	114.5.102.178	2024-11-14 06:32:13	fc3c9dfd-8827-41df-8366-ed852f8a23ec	0	\N
b9ca0953-6b46-4c36-a041-ea3f05c86bb2	bGaIkQ6GnVa8g7GVL7RA3QGC	Android	Chrome	114.5.222.97	2024-11-14 06:30:50	e82e107a-8882-4074-8841-c557daf4126f	0	\N
\.


--
-- Data for Name: ecosystem_keys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecosystem_keys (id, payload, public_key, signature) FROM stdin;
01JADQNT3MRXWRR6YPHZG7QDK4	{"name":"SMP HANGTUAH 5 CANDI","address":"Perum Jalagriya B16 / 18","city":"KAB. SIDOARJO","expired_at":1731863547}	Z9gyNFFopajE5DxH+2F555PpIWQprSkQgnbzVy2KNIA=	nRjNWEcxoK9xDNE/W7KE1JJpLjUPbbqsHZUkD8qL35Y1QWm9XV8xHx11NlDgqQ0v5ZmRMFVq0NIE45vT/HAjAA==
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, created_at, updated_at) FROM stdin;
e8d5d119-754a-4a7e-8a3c-17042556dbf4	UTS	2024-11-14 09:41:55	2024-11-14 09:49:03
\.


--
-- Data for Name: feature_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feature_infos (id, name, code, content, created_at, updated_at) FROM stdin;
13	Testing klik	AA001	tutorial-in-app/AA001.mp3	2024-02-29 17:10:02	\N
14	Info halaman peserta	AB001	tutorial-in-app/AB001.mp3	2024-02-29 21:06:35	\N
15	Sesi default peserta	AB002	tutorial-in-app/AB002.mp3	2024-02-29 21:13:21	\N
16	Info halaman group	AC001	tutorial-in-app/AC001.mp3	2024-02-29 21:37:07	\N
17	Info halaman matpel	AD001	tutorial-in-app/AD001.mp3	2024-02-29 22:04:18	\N
18	Target agama di matpel	AD002	tutorial-in-app/AD002.mp3	2024-02-29 22:17:36	\N
19	Target jurusan di matpel	AD003	tutorial-in-app/AD003.mp3	2024-02-29 22:22:21	\N
20	Tim pengoreksi di matpel	AD004	tutorial-in-app/AD004.mp3	2024-02-29 22:26:19	\N
21	Info halaman jurusan	AE001	tutorial-in-app/AE001.mp3	2024-03-01 21:03:00	\N
22	Info halaman pengguna	AF001	tutorial-in-app/AF001.mp3	2024-03-01 21:11:25	\N
23	Info halaman kompetensi	AG001	tutorial-in-app/AG001.mp3	2024-03-01 21:15:43	\N
24	Tambah kompetensi tipe soal	AG002	tutorial-in-app/AG002.mp3	2024-03-01 21:20:58	\N
25	Tambah kompetensi total soal	AG003	tutorial-in-app/AG003.mp3	2024-03-01 21:32:36	\N
26	Tambah kompetensi point	AG004	tutorial-in-app/AG004.mp3	2024-03-01 21:36:32	\N
27	Tambah kompetensi jawab tapi salah	AG005	tutorial-in-app/AG005.mp3	2024-03-01 21:43:43	\N
28	Info halaman banksoal	AH001	tutorial-in-app/AH001.mp3	2024-03-02 11:10:02	\N
29	Tambah banksoal kompetensi	AH002	tutorial-in-app/AH002.mp3	2024-03-02 12:49:11	\N
30	Tambah banksoal setting max persen	AH003	tutorial-in-app/AH003.mp3	2024-03-02 12:49:12	\N
31	Info halaman referensi banksoal	AH004	tutorial-in-app/AH004.mp3	2024-03-02 20:29:29	\N
32	Info waktu ujian di jadwal ujian event	AI001	tutorial-in-app/AI001.mp3	2024-03-10 20:49:58	\N
\.


--
-- Data for Name: group_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_members (id, group_id, student_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, parent_id, name, created_at, updated_at) FROM stdin;
8a07a2eb-b62c-45e8-affc-747ece939eba	\N	7	2024-11-14 00:54:07	\N
ede856ab-edd2-41b0-a0fe-34676c0f57b4	8a07a2eb-b62c-45e8-affc-747ece939eba	7A	2024-11-14 00:54:07	\N
5b232fa7-ae3a-4b39-bf89-56bd4e27c15b	8a07a2eb-b62c-45e8-affc-747ece939eba	7B	2024-11-14 00:54:07	\N
\.


--
-- Data for Name: hasil_ujians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hasil_ujians (id, ujian_id, banksoal_id, peserta_id, jadwal_id, check_point, created_at, updated_at, check_point_auto, check_point_manual, code01_correct, code01_wrong, code01_point, code01_void, code02_correct, code02_wrong, code02_point, code02_void, code03_correct, code03_wrong, code03_point, code03_void, code04_correct, code04_wrong, code04_point, code04_void, code05_correct, code05_wrong, code05_point, code05_void, code06_correct, code06_wrong, code06_point, code06_void, code07_correct, code07_wrong, code07_point, code07_void, code08_correct, code08_wrong, code08_point, code08_void, code09_correct, code09_wrong, code09_point, code09_void, code10_correct, code10_wrong, code10_point, code10_void, code11_correct, code11_wrong, code11_point, code11_void, code12_correct, code12_wrong, code12_point, code12_void, code13_correct, code13_wrong, code13_point, code13_void, code14_correct, code14_wrong, code14_point, code14_void, check_point_max, duration, code15_correct, code15_wrong, code15_point, code15_void) FROM stdin;
754b5c65-fbda-42d4-a2d4-4da3fb848e4f	efc7de8c-2df7-46d5-bffd-b7f11a66f964	e251b1ee-f97b-44bd-899e-083c864f144c	c3bb53e1-cf20-4805-8955-192936c9288a	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	10.00	2024-11-05 06:14:21.705847	2024-11-05 06:14:21.705847	10.00	0.00	1	1	10.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	36s	0	0	0.00	0
e0a979f1-1e1b-44bc-937e-5fe4a146dbac	341eb08b-eaf8-4fd9-90d0-f41d64f790ba	b132b631-3b5e-4087-b457-1dd4664daed4	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	15.00	2024-11-12 04:19:32.249135	2024-11-12 04:19:32.249135	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
3b0e3d3e-5788-423c-83d2-00a47ba6222c	e4ca0855-ec02-48dd-9b5f-b37a7b7f8976	b132b631-3b5e-4087-b457-1dd4664daed4	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:19:32.502006	2024-11-12 04:19:32.502006	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
97a73865-8012-45b9-aad9-fdc2faa90a5b	f96df8b3-a7b9-45b2-a9b4-b735269fb958	b132b631-3b5e-4087-b457-1dd4664daed4	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:19:32.59874	2024-11-12 04:19:32.59874	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
ec91c6ac-bdcb-4b8a-b36c-68f6bdbf03e1	64425604-1383-478a-af2b-792b37e7673c	b132b631-3b5e-4087-b457-1dd4664daed4	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	27.50	2024-11-12 04:19:41.098167	2024-11-12 04:19:41.098167	27.50	0.00	11	4	27.50	1	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
6ec0e021-f002-48dc-a696-640d39e2e2cb	9b96fb0f-8297-4790-b3c4-01749efcc719	b132b631-3b5e-4087-b457-1dd4664daed4	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	41.20	2024-11-11 16:30:52.090796	2024-11-11 16:30:52.090796	10.00	31.20	4	11	10.00	0	2	0	31.20	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	51s	0	0	0.00	0
4a05fcf4-5db0-46df-a673-1fc1311211af	f30265a1-1d61-4ffe-8d83-e2d8d195d147	b132b631-3b5e-4087-b457-1dd4664daed4	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	22.50	2024-11-12 04:18:30.355346	2024-11-12 04:18:30.355346	22.50	0.00	9	6	22.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
03719ca5-ae99-48f6-94cb-06f04fb25888	7947636c-d5f3-40a9-92ad-0a839713a792	b132b631-3b5e-4087-b457-1dd4664daed4	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	27.50	2024-11-12 04:18:44.936868	2024-11-12 04:18:44.936868	27.50	0.00	11	4	27.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
2af13927-9828-4143-8885-604bf9718948	d72e874e-55c7-4a85-86c9-72b2844b70c9	b132b631-3b5e-4087-b457-1dd4664daed4	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	17.50	2024-11-12 04:18:45.344907	2024-11-12 04:18:45.344907	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
1fc7c185-8a9a-4524-95c3-d74c8ab9eb4a	f4dac701-1345-44ba-b749-a232722e5445	b132b631-3b5e-4087-b457-1dd4664daed4	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	17.50	2024-11-12 04:18:45.799575	2024-11-12 04:18:45.799575	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
0bce598a-6b0a-48e8-80c6-e14990b500e5	42d3b77d-cd0c-463c-b446-28ebe2a7e003	b132b631-3b5e-4087-b457-1dd4664daed4	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	32.50	2024-11-12 04:18:50.816609	2024-11-12 04:18:50.816609	32.50	0.00	13	2	32.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
9906c6aa-619e-445d-87f6-e32825c80644	1c3284e9-611e-40da-853f-a00b8573d998	b132b631-3b5e-4087-b457-1dd4664daed4	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	20.00	2024-11-12 04:18:51.45315	2024-11-12 04:18:51.453151	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
6e7ec916-081f-42b7-b677-111aaaae75ac	bac5f0d1-c83e-424e-a907-749885a57ca3	b132b631-3b5e-4087-b457-1dd4664daed4	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	22.50	2024-11-12 04:18:51.725894	2024-11-12 04:18:51.725895	22.50	0.00	9	6	22.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
9e199dd6-2a0d-4d60-9572-da01256286ad	6f73821e-6d8b-4a0d-a8ce-55f6dc9432c6	b132b631-3b5e-4087-b457-1dd4664daed4	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:19:15.39936	2024-11-12 04:19:15.39936	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
dbadddd9-9e1a-43b3-843b-edc1f717de02	fa5ceec1-05ec-46b0-b315-7910726aab60	b132b631-3b5e-4087-b457-1dd4664daed4	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:19:21.113321	2024-11-12 04:19:21.113321	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
53100ea3-d15a-446b-b89a-2f2867bfc1c8	32269784-67c2-427c-9047-550d99fa0b7e	b132b631-3b5e-4087-b457-1dd4664daed4	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	15.00	2024-11-12 04:19:23.384749	2024-11-12 04:19:23.384749	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
769c1ce6-9c36-46fb-866b-b9e7d37ef2d5	cf2816f4-4d30-4d70-91ec-84fef03e17ea	b132b631-3b5e-4087-b457-1dd4664daed4	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	22.50	2024-11-12 04:19:23.627678	2024-11-12 04:19:23.627678	22.50	0.00	9	6	22.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
44f0c507-5f2a-4fcf-8b34-50f991914063	5740ec96-26f2-4711-896c-ca0061c03136	b132b631-3b5e-4087-b457-1dd4664daed4	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:19:26.364236	2024-11-12 04:19:26.364236	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
79dd8a14-4e9f-478a-8130-8df71a89fd22	0f3dde17-dcb7-44aa-850f-c8e6c1242fa9	b132b631-3b5e-4087-b457-1dd4664daed4	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	20.00	2024-11-12 04:19:41.998009	2024-11-12 04:19:41.998009	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
e07dbfcd-8a19-4b33-a853-c86e35b4025b	5910f238-5e2d-43ea-94cd-765efd2a29c2	b132b631-3b5e-4087-b457-1dd4664daed4	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	17.50	2024-11-12 04:19:53.19468	2024-11-12 04:19:53.19468	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
c2e7c207-bfb8-4ef2-8232-8c45040283d7	42a9c948-b3a3-4dda-a942-b6e181556fcf	b132b631-3b5e-4087-b457-1dd4664daed4	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:19:53.706901	2024-11-12 04:19:53.706901	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
d0ea65ff-a0fc-4e8d-a4a3-6ab8d82ec9fb	ff20660b-6ee2-4ce4-97b8-91f20666dffb	b132b631-3b5e-4087-b457-1dd4664daed4	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	32.50	2024-11-12 04:19:59.502827	2024-11-12 04:19:59.502827	32.50	0.00	13	2	32.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
a926d79a-1efd-47dd-8d8d-6a904ad0611a	99b5b5fb-6083-44bf-995f-9176677f7ad1	b132b631-3b5e-4087-b457-1dd4664daed4	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:20:30.882916	2024-11-12 04:20:30.882916	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m2s	0	0	0.00	0
db891c32-d97a-4679-9767-52258e797390	959638fb-aaf8-493d-826e-3268b9f35686	b132b631-3b5e-4087-b457-1dd4664daed4	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	20.00	2024-11-12 04:20:41.686247	2024-11-12 04:20:41.686247	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m3s	0	0	0.00	0
d2baf428-51dc-421d-9b61-faccd317ba2b	6e970d93-835a-47a2-82a6-e41b23897521	b132b631-3b5e-4087-b457-1dd4664daed4	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	15.00	2024-11-12 04:20:46.409802	2024-11-12 04:20:46.409802	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
bae4e033-7eb0-47d1-ab65-d4d262e81ff3	8f1ebcfb-efd4-4df2-8644-bf5a1764b517	b132b631-3b5e-4087-b457-1dd4664daed4	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	25.00	2024-11-12 04:22:37.263706	2024-11-12 04:22:37.263706	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	1h0m1s	0	0	0.00	0
a3f4da63-6fe1-4aca-bca5-6c3113cf0204	3e7553fe-2417-4995-b300-f5c77e98221b	31d085d2-069f-41a2-b802-71ba97846911	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	0.00	2024-11-12 06:45:14.279322	2024-11-12 06:45:14.279322	0.00	0.00	0	2	0.00	0	0	0	0.00	0	0	0	0.00	0	0	1	0.00	0	0	1	0.00	0	0	0	0.00	0	0	0	0.00	0	0	1	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	4m34s	0	0	0.00	0
a4eeeaad-8e15-4565-ae40-bbead4ccb963	38eee0a7-1e75-4821-bb86-923632f7d3b4	480f995f-3488-49e2-8a0c-87fd4bdd4367	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27.50	2024-11-14 06:29:10.046454	2024-11-14 06:29:10.046454	27.50	0.00	11	4	27.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h8m39s	0	0	0.00	0
f75a7472-c684-4cb5-82a4-87f74465460c	462f242a-8070-4c52-9aee-3498b1babaab	480f995f-3488-49e2-8a0c-87fd4bdd4367	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	17.50	2024-11-14 06:29:10.078739	2024-11-14 06:29:10.07874	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m30s	0	0	0.00	0
58300ab7-c0ec-4061-9a87-ac4ff4c7d707	2239783a-709d-4c68-aefc-c535fd064c28	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	25.00	2024-11-14 06:29:10.11014	2024-11-14 06:29:10.11014	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m31s	0	0	0.00	0
3654cd66-9bc7-4749-ad99-d000044f68ab	f59213f7-a9c4-4318-b91a-94a1542eccaf	480f995f-3488-49e2-8a0c-87fd4bdd4367	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	20.00	2024-11-14 06:29:10.13817	2024-11-14 06:29:10.13817	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m31s	0	0	0.00	0
bab76004-7b7b-4735-90dd-6099407aaf21	d0f69b56-3f2a-4bd9-b08f-aba3c9e244e6	480f995f-3488-49e2-8a0c-87fd4bdd4367	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	17.50	2024-11-14 06:29:10.16323	2024-11-14 06:29:10.16323	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m36s	0	0	0.00	0
1d64d387-7b73-47bb-aa69-6a25d2241992	128bfb21-de75-4ca2-83e1-c309dc0e3c48	480f995f-3488-49e2-8a0c-87fd4bdd4367	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	20.00	2024-11-14 06:29:10.189118	2024-11-14 06:29:10.189118	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m23s	0	0	0.00	0
a9304929-6e9f-4b62-8cf3-d45fe120a944	9fb923ff-f75b-42ea-ada8-06ad4d924238	480f995f-3488-49e2-8a0c-87fd4bdd4367	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	17.50	2024-11-14 06:29:10.214506	2024-11-14 06:29:10.214506	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m35s	0	0	0.00	0
8dfa3c68-0a25-49cf-8a48-9170315a872c	4b891891-329b-419e-8bbc-a5d6be8daaa9	480f995f-3488-49e2-8a0c-87fd4bdd4367	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	25.00	2024-11-14 06:29:10.243185	2024-11-14 06:29:10.243185	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m20s	0	0	0.00	0
e8dcab9b-9e21-40ab-97c1-2118eaa7b1aa	244d48ad-9aea-4ccc-902c-c53284151703	480f995f-3488-49e2-8a0c-87fd4bdd4367	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	20.00	2024-11-14 06:29:10.276963	2024-11-14 06:29:10.276963	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m18s	0	0	0.00	0
e1be4bee-b834-4e5f-a91f-5423db0349de	ad01a78a-733b-4225-a437-1882dae96493	480f995f-3488-49e2-8a0c-87fd4bdd4367	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	30.00	2024-11-14 06:29:10.305915	2024-11-14 06:29:10.305915	30.00	0.00	12	3	30.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m32s	0	0	0.00	0
bdbc0941-9b60-4939-b69c-3d8bb4284590	3e4d1bf5-6d84-493c-89e5-907bcd25d2eb	480f995f-3488-49e2-8a0c-87fd4bdd4367	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	17.50	2024-11-14 06:29:10.33275	2024-11-14 06:29:10.332751	17.50	0.00	7	8	17.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h5m57s	0	0	0.00	0
14dbbe6a-3a72-43bf-864a-d95ae45d1286	84e5432c-f73a-4ede-9f66-4e3154ba5d25	480f995f-3488-49e2-8a0c-87fd4bdd4367	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	25.00	2024-11-14 06:29:10.359852	2024-11-14 06:29:10.359852	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m35s	0	0	0.00	0
e8e7a0d0-6448-4002-85c7-81b3e3976f5c	6dddd8b6-c2e1-4767-9573-9006dc3a46bb	480f995f-3488-49e2-8a0c-87fd4bdd4367	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	15.00	2024-11-14 06:29:10.397624	2024-11-14 06:29:10.397624	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m48s	0	0	0.00	0
1da4c22d-392f-4c5e-96d0-f2b144d54ab5	2bea2498-2198-435a-9fec-80821b48be68	480f995f-3488-49e2-8a0c-87fd4bdd4367	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27.50	2024-11-14 06:29:10.427526	2024-11-14 06:29:10.427526	27.50	0.00	11	4	27.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h10m48s	0	0	0.00	0
b3401637-32fc-4c91-9d76-df4e0d97141c	49fee6b6-4c55-41a7-8d04-acd900f007f3	480f995f-3488-49e2-8a0c-87fd4bdd4367	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	25.00	2024-11-14 06:29:10.471253	2024-11-14 06:29:10.471253	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h5m55s	0	0	0.00	0
2fa45a3b-1f69-40ea-82a6-964cc9a3e60a	0e42bd29-cef2-4702-b854-18141ac0fd7f	480f995f-3488-49e2-8a0c-87fd4bdd4367	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	22.50	2024-11-14 06:29:10.510456	2024-11-14 06:29:10.510456	22.50	0.00	9	6	22.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m36s	0	0	0.00	0
c41fa368-0045-450c-bbd5-a70d838bf4b6	3a772e00-be55-4fd4-bf03-e4e307a53542	480f995f-3488-49e2-8a0c-87fd4bdd4367	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	30.00	2024-11-14 06:29:10.541232	2024-11-14 06:29:10.541232	30.00	0.00	12	3	30.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h9m41s	0	0	0.00	0
6c76ba30-ac22-40b1-9298-9cea2c5056db	c2a21811-7c42-48ff-bb87-c8686df194fe	480f995f-3488-49e2-8a0c-87fd4bdd4367	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	32.50	2024-11-14 06:29:10.57195	2024-11-14 06:29:10.57195	32.50	0.00	13	2	32.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h10m53s	0	0	0.00	0
0556b590-079d-47ac-9ef9-265a6592fe5b	a17cfd9e-b618-431a-b290-8ad22e62b9f8	480f995f-3488-49e2-8a0c-87fd4bdd4367	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	15.00	2024-11-14 06:29:10.603233	2024-11-14 06:29:10.603234	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m24s	0	0	0.00	0
caf1392b-c596-42f9-a665-4bb299241b43	0a43b12e-6cd1-4425-982a-2ec64cf3b8c5	480f995f-3488-49e2-8a0c-87fd4bdd4367	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	25.00	2024-11-14 06:29:10.632874	2024-11-14 06:29:10.632874	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m27s	0	0	0.00	0
ecc55cf0-06a7-48fd-aea4-11ed16ac5423	6afdc649-9ae3-4fb2-a3ea-83c9ebff6451	480f995f-3488-49e2-8a0c-87fd4bdd4367	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	15.00	2024-11-14 06:29:10.664396	2024-11-14 06:29:10.664396	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m34s	0	0	0.00	0
692c782d-1877-426b-976f-017dbb5a5a16	b30ccda6-841f-412e-9643-26605e571e8f	480f995f-3488-49e2-8a0c-87fd4bdd4367	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	12.50	2024-11-14 06:29:10.694178	2024-11-14 06:29:10.694178	12.50	0.00	5	10	12.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h10m3s	0	0	0.00	0
1ef9da23-75ae-402d-81c2-e6ec1137523a	f21c34bf-00c6-4551-880a-5c4a2da38316	480f995f-3488-49e2-8a0c-87fd4bdd4367	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	25.00	2024-11-14 06:29:10.725498	2024-11-14 06:29:10.725499	25.00	0.00	10	5	25.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m20s	0	0	0.00	0
13a48690-d296-4d42-a80f-63deeff2abd9	a1cb2bdc-c293-4a05-926c-c0bd3039b534	480f995f-3488-49e2-8a0c-87fd4bdd4367	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27.50	2024-11-14 06:29:10.759216	2024-11-14 06:29:10.759217	27.50	0.00	11	4	27.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m52s	0	0	0.00	0
1d948d7d-509d-4d4b-9cc1-d836cdcec483	9c498924-0dc2-4946-9148-2b7ff01ecb55	480f995f-3488-49e2-8a0c-87fd4bdd4367	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27.50	2024-11-14 06:29:10.79206	2024-11-14 06:29:10.79206	27.50	0.00	11	4	27.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m28s	0	0	0.00	0
c30a9770-e108-4da4-953e-ddeb3d113421	d4ed46e1-8029-4886-b3d2-7c9ad41fb763	480f995f-3488-49e2-8a0c-87fd4bdd4367	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27.50	2024-11-14 06:29:10.819664	2024-11-14 06:29:10.819664	27.50	0.00	11	4	27.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h10m13s	0	0	0.00	0
9de79fac-752c-4539-bb17-4454fcb48de9	6b7d22e4-13dd-4ae9-a962-2b4a5402c1ff	480f995f-3488-49e2-8a0c-87fd4bdd4367	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	15.00	2024-11-14 06:29:10.863578	2024-11-14 06:29:10.863579	15.00	0.00	6	9	15.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m17s	0	0	0.00	0
349b9caa-f815-4d21-9b8b-95d8b2d394c0	bf9d8120-9d0e-4914-b78b-bbe3bd5fba6a	480f995f-3488-49e2-8a0c-87fd4bdd4367	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	20.00	2024-11-14 06:29:10.896523	2024-11-14 06:29:10.896523	20.00	0.00	8	7	20.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m36s	0	0	0.00	0
2126f8ff-bd52-42ab-bf81-7afbad474fdc	78abbd23-c2b6-4a51-ad1d-8d584ea43a16	480f995f-3488-49e2-8a0c-87fd4bdd4367	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	32.50	2024-11-14 06:29:10.928853	2024-11-14 06:29:10.928853	32.50	0.00	13	2	32.50	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m36s	0	0	0.00	0
a44cf599-ddc5-4bc3-8586-1f8a9d678f2c	2b51dbad-57b4-413d-878d-9e874b197867	480f995f-3488-49e2-8a0c-87fd4bdd4367	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	35.00	2024-11-14 06:29:10.961573	2024-11-14 06:29:10.961573	35.00	0.00	14	1	35.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	0	0	0.00	0	100.00	5h11m35s	0	0	0.00	0
\.


--
-- Data for Name: jadwals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jadwals (id, banksoal_id, group_ids, alias, tanggal, mulai, lama, min_test, status_ujian, event_id, sesi, setting, mulai_sesi, created_at, updated_at, view_result, created_by, participant, paused_at, transition_time) FROM stdin;
0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	["e251b1ee-f97b-44bd-899e-083c864f144c"]	\N	uji-coba	2024-10-18	00:39	3600	60	1	\N	1	{"acak_opsi":true,"acak_soal":true,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-10-17 17:40:22	2024-10-17 17:40:22	t	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
f6a9f4ae-374e-46fd-8d05-162cbec0d346	["e251b1ee-f97b-44bd-899e-083c864f144c"]	\N	senin	2024-11-04	08:47	3600	0	1	\N	1	{"acak_opsi":false,"acak_soal":true,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-11-04 01:47:45	2024-11-04 01:48:15	t	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	["e251b1ee-f97b-44bd-899e-083c864f144c"]	\N	Coba	2024-11-05	13:13	3600	0	0	\N	1	{"acak_opsi":false,"acak_soal":false,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-11-05 06:13:28	2024-11-05 06:13:28	f	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
a4a252e4-a129-46d9-b4c9-3c03a184463d	["117800b5-7caa-45b7-987f-d2a50c994c62"]	\N	ipa	2024-11-05	14:00	3600	0	1	\N	1	{"acak_opsi":false,"acak_soal":false,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-11-05 07:00:13	2024-11-05 07:00:13	f	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
677caec4-2985-4ae8-8cef-20a725be62d5	["b132b631-3b5e-4087-b457-1dd4664daed4"]	\N	inf-7	2024-11-12	12:57	3600	60	1	\N	1	{"acak_opsi":true,"acak_soal":true,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-11-12 05:58:17	2024-11-12 05:58:17	t	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
d33080b0-c84f-4e74-b458-74bcc4fa14da	["31d085d2-069f-41a2-b802-71ba97846911"]	\N	COBA	2024-11-12	13:40	3600	0	1	\N	1	{"acak_opsi":false,"acak_soal":false,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-11-12 06:40:22	2024-11-12 06:40:22	f	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
75391138-9d1d-4cec-be41-46a4f33d08b7	["480f995f-3488-49e2-8a0c-87fd4bdd4367"]	\N	inf-9A	2024-11-15	08:25	3600	0	0	\N	1	{"acak_opsi":false,"acak_soal":false,"token":false,"allow_void":false}	["08:00","10:00","12:00","14:00"]	2024-11-14 07:47:32	2024-11-14 07:47:32	f	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
256d33f7-2293-41b1-aa82-c301a75af8d1	["480f995f-3488-49e2-8a0c-87fd4bdd4367"]	["8a07a2eb-b62c-45e8-affc-747ece939eba"]	INF	2024-11-14	16:50	3600	0	1	e8d5d119-754a-4a7e-8a3c-17042556dbf4	1	{"acak_opsi":false,"acak_soal":true,"token":false,"allow_void":false}	["16:50","10:00","12:00","14:00"]	2024-11-14 09:50:47	2024-11-14 09:50:47	f	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	CP	\N	0
\.


--
-- Data for Name: jadwals_peserta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jadwals_peserta (id, jadwal_id, peserta_id) FROM stdin;
\.


--
-- Data for Name: jawaban_pesertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jawaban_pesertas (id, banksoal_id, soal_id, peserta_id, jadwal_id, jawab, answered, created_at, updated_at, checked, point, ragu_ragu, iscorrect, part, ai_opinion) FROM stdin;
ea93b596-20ae-4cfc-8c00-c9e02f7dd064	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	2c723a82-3328-474b-879f-43ee4e148203	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	0	f	2024-10-17 17:44:56.556246	2024-10-17 17:44:56.556247	f	0.00	f	f	1	\N
6c45cab5-6607-4516-a54c-5cd2d1245dc5	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	2c723a82-3328-474b-879f-43ee4e148203	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	0	f	2024-10-17 17:44:56.556264	2024-10-17 17:44:56.556264	f	0.00	f	f	1	\N
f1c6c5cb-eba7-4a82-86b2-3aace02f9924	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	f2141663-5f93-4d1d-9c81-9d7c08472306	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	09c7594f-3eea-4ec1-89c6-ea21a60191ac	t	2024-10-17 18:02:26.215918	2024-10-17 18:02:27.998999	f	0.00	f	f	1	\N
4e067367-ac69-477c-bb51-b27b7088800f	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	f2141663-5f93-4d1d-9c81-9d7c08472306	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	17e35262-6d46-4fa5-af2f-eed21fdc1c73	t	2024-10-17 18:02:26.215951	2024-10-17 18:02:31.717654	f	0.00	f	f	1	\N
1cbe3284-6d57-4d8c-b6d3-a4b36c91f578	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	92ba9bea-0ae2-4d95-9a4f-10e1838ab57f	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	09c7594f-3eea-4ec1-89c6-ea21a60191ac	t	2024-10-17 18:03:08.604897	2024-10-17 18:03:10.396578	f	0.00	f	f	1	\N
b72a8465-f293-45d0-b8c6-fb455abebc47	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	92ba9bea-0ae2-4d95-9a4f-10e1838ab57f	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	9aaf1f36-9351-47c8-a7fe-8eca97a00614	t	2024-10-17 18:03:08.604904	2024-10-17 18:03:13.236338	f	0.00	f	f	1	\N
3ed8fc3b-c2bf-4b1c-ba74-043311cc9256	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	0b4a1483-fddb-4c37-ad3d-b71989047f96	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	e058c3fd-c9f0-4802-a392-2c9f9d401383	t	2024-10-17 18:06:40.678604	2024-10-17 18:06:41.979823	f	0.00	f	f	1	\N
d51b95aa-c089-40f8-8469-a57bdf47734c	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	0b4a1483-fddb-4c37-ad3d-b71989047f96	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	0f0c7639-1831-4df4-82f4-31018975d100	t	2024-10-17 18:06:40.678608	2024-10-17 18:06:43.182452	f	0.00	f	f	1	\N
6ae3b7b2-bd86-42be-af31-cb261d2de883	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	e68ece78-155b-4afe-8570-88363d8fc7a8	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	efaa51b1-460a-4258-a7f1-9b44588eaaae	t	2024-10-17 18:16:49.873546	2024-10-17 18:16:51.23329	f	0.00	f	f	1	\N
e9391968-bf66-4295-b5ee-74728a3dc6e2	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	e68ece78-155b-4afe-8570-88363d8fc7a8	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	8c2973de-98cf-40b9-97ed-1e647c5115b4	t	2024-10-17 18:16:49.873551	2024-10-17 18:16:52.173895	f	0.00	f	f	1	\N
870dccea-9dc7-4a8f-94ee-3b858645b8a3	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	18235ecf-b076-493b-8124-7d631f6fd469	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	17e35262-6d46-4fa5-af2f-eed21fdc1c73	t	2024-10-17 18:17:54.420588	2024-10-17 18:17:55.652393	f	0.00	f	f	1	\N
03210c87-70bf-4869-a835-2c3340572e67	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	18235ecf-b076-493b-8124-7d631f6fd469	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	9aae0674-0731-44ed-872a-89e58b4cb5be	t	2024-10-17 18:17:54.420592	2024-10-17 18:17:57.105417	f	0.00	f	f	1	\N
6a623f9a-c04d-4e65-9bba-fc68909f7fa8	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	a1c41b10-1427-4ec6-ace9-d65eb1b4a6a2	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	efaa51b1-460a-4258-a7f1-9b44588eaaae	t	2024-10-18 00:22:03.498703	2024-10-18 00:22:11.08676	f	0.00	f	f	1	\N
63924fae-be5b-48b1-bb6e-6d8bd8073657	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	a1c41b10-1427-4ec6-ace9-d65eb1b4a6a2	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	9aae0674-0731-44ed-872a-89e58b4cb5be	t	2024-10-18 00:22:03.498708	2024-10-18 00:22:12.384503	f	0.00	f	f	1	\N
d7e42b9f-3641-41cd-8f8a-ea85b1bfd150	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:18:44.919264	2024-11-12 04:18:45.799553	t	2.50	f	t	1	\N
8639ebe3-0b61-48be-8a69-4a5944115c5f	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:20:29.41746	2024-11-12 04:20:30.882794	t	0.00	f	f	1	\N
71a2f1be-85d6-46d5-bb07-c82872382fe6	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:48.392006	2024-11-14 06:29:10.603202	t	2.50	f	t	1	\N
8f1b129e-f20e-4a3b-a96c-766c67b45ad6	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	40b50e63-df73-4c34-b495-cc60242b4565	f6a9f4ae-374e-46fd-8d05-162cbec0d346	0	f	2024-11-04 01:48:21.216194	2024-11-04 01:48:21.216194	f	0.00	f	f	1	\N
00dee479-7855-4400-aea4-94137f5a656e	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	40b50e63-df73-4c34-b495-cc60242b4565	f6a9f4ae-374e-46fd-8d05-162cbec0d346	0	f	2024-11-04 01:48:21.216444	2024-11-04 01:48:21.216444	f	0.00	f	f	1	\N
23684e43-80f6-479b-9fd5-7b9373fe0961	b132b631-3b5e-4087-b457-1dd4664daed4	42fe4a5f-a7a6-45d8-8b11-9b24f882154a	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	e131761c-6b3c-4e1b-9e81-98e5426a60f6	t	2024-11-11 16:23:44.632804	2024-11-11 16:23:55.691909	f	0.00	f	f	1	\N
72c9167c-9b02-4ec5-b909-1093d3543554	b132b631-3b5e-4087-b457-1dd4664daed4	040ddd51-813d-42bf-965f-0bc5303a46ce	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	447d525a-90d4-4d53-ade1-7011c1167bbf	t	2024-11-11 16:23:44.633233	2024-11-11 16:25:06.285872	f	0.00	f	f	1	\N
5bf4d9be-f13c-4a6a-a573-af32e5a0bd55	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	c3bb53e1-cf20-4805-8955-192936c9288a	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	09c7594f-3eea-4ec1-89c6-ea21a60191ac	t	2024-11-05 06:13:47.882584	2024-11-05 06:14:21.705774	t	0.00	f	f	1	\N
b0b0a0b8-9845-4f5d-ac90-c857a6cf415b	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	c3bb53e1-cf20-4805-8955-192936c9288a	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	17e35262-6d46-4fa5-af2f-eed21fdc1c73	t	2024-11-05 06:13:47.882589	2024-11-05 06:14:21.705782	t	10.00	f	t	1	\N
82b53308-227c-42fb-b509-53a6e6e551e5	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	0214d244-6acb-4538-b89b-d0a5f57b7e50	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	0	f	2024-11-05 06:31:26.696731	2024-11-05 06:31:26.696731	f	0.00	f	f	1	\N
9ff4baf5-e061-4bde-aa64-dd114d83965f	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	0214d244-6acb-4538-b89b-d0a5f57b7e50	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	0	f	2024-11-05 06:31:26.696736	2024-11-05 06:31:26.696736	f	0.00	f	f	1	\N
f4d35c13-61ab-479a-8e67-89585fedbd96	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	e20667ad-862e-462c-9b95-08dd63d674cd	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	0	f	2024-11-05 06:32:15.001212	2024-11-05 06:32:15.001212	f	0.00	f	f	1	\N
4fe9e450-8115-4880-8ce8-8b8b0b94e311	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	e20667ad-862e-462c-9b95-08dd63d674cd	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	0	f	2024-11-05 06:32:15.001218	2024-11-05 06:32:15.001218	f	0.00	f	f	1	\N
fed906ad-ed6f-42f1-a79e-33e6559a513e	e251b1ee-f97b-44bd-899e-083c864f144c	b0df1d97-08a8-4e63-9aa5-913755b222c1	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	0	f	2024-11-05 06:58:18.228701	2024-11-05 06:58:18.228701	f	0.00	f	f	1	\N
c75513f3-f378-4682-a228-95d959ee1e6f	e251b1ee-f97b-44bd-899e-083c864f144c	373eca6d-6d6a-4bf2-9455-99cc0f848e61	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	0	f	2024-11-05 06:58:18.228706	2024-11-05 06:58:18.228706	f	0.00	f	f	1	\N
dfe1ef2c-b879-4599-9985-e85ad3fb42dd	117800b5-7caa-45b7-987f-d2a50c994c62	84a7582e-b820-4cc3-9ef6-92970befd3ac	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	a4a252e4-a129-46d9-b4c9-3c03a184463d	0	f	2024-11-05 07:01:45.839045	2024-11-05 07:01:45.839045	f	0.00	f	f	1	\N
8d023b78-7931-4b42-88e7-293c16ca8a9b	117800b5-7caa-45b7-987f-d2a50c994c62	2841b35e-e4a9-4461-abcd-3df914bc4c10	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	a4a252e4-a129-46d9-b4c9-3c03a184463d	0	f	2024-11-05 07:01:45.839049	2024-11-05 07:01:45.839049	f	0.00	f	f	1	\N
34ac9aae-cfae-4d61-9af0-5d0c03cc76f9	b132b631-3b5e-4087-b457-1dd4664daed4	4eb29b99-bd0d-482c-baf5-e927577f2cd0	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632811	2024-11-11 16:23:44.632811	f	0.00	f	f	1	\N
59cfdc94-fea8-41d0-9b1b-c605f0231f55	b132b631-3b5e-4087-b457-1dd4664daed4	de4ec175-01ed-45b4-8899-566784bd8708	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632815	2024-11-11 16:23:44.632816	f	0.00	f	f	1	\N
a99c2be6-1b88-47e4-9dbf-c0a8e4729d5e	b132b631-3b5e-4087-b457-1dd4664daed4	4d48a3ed-d425-44d6-a59c-01b5821b8155	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632852	2024-11-11 16:23:44.632852	f	0.00	f	f	1	\N
30ce4138-3e88-46bd-b6a6-4c06b0e1f4c6	b132b631-3b5e-4087-b457-1dd4664daed4	b820472d-5898-4d8b-962f-a1c54b804102	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632854	2024-11-11 16:23:44.632854	f	0.00	f	f	1	\N
c6467523-40a2-4be7-a017-cdb2ef863f4a	b132b631-3b5e-4087-b457-1dd4664daed4	93b301be-33fb-4c4f-b0a3-b6c1a3098c70	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632857	2024-11-11 16:23:44.632858	f	0.00	f	f	1	\N
faf403eb-519d-4806-8e6f-f8e4247f82d5	b132b631-3b5e-4087-b457-1dd4664daed4	45477509-3a99-4622-8059-e3d692945356	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.63286	2024-11-11 16:23:44.63286	f	0.00	f	f	1	\N
1bdef519-0962-41ff-84af-ec479d212144	b132b631-3b5e-4087-b457-1dd4664daed4	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632863	2024-11-11 16:23:44.632863	f	0.00	f	f	1	\N
fa11cb87-fdd0-4034-aa5f-b6e7b4121717	b132b631-3b5e-4087-b457-1dd4664daed4	d0339fe7-39be-4322-a71e-5c46ce48b757	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.632865	2024-11-11 16:23:44.632865	f	0.00	f	f	1	\N
cdd6eea0-aab0-493b-ae46-df1d9be90740	b132b631-3b5e-4087-b457-1dd4664daed4	f550bb4c-9b59-4b0e-8472-50b1f45d9d55	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.633235	2024-11-11 16:23:44.633235	f	0.00	f	f	1	\N
da1000f9-32cb-4883-9634-38f4bf17145a	b132b631-3b5e-4087-b457-1dd4664daed4	6b055d46-a532-4bde-99e1-0efeaa204d9b	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.633238	2024-11-11 16:23:44.633238	f	0.00	f	f	1	\N
e79750ef-d9b2-4bbc-bcc2-628ee6dd8755	b132b631-3b5e-4087-b457-1dd4664daed4	d8e6721f-f1e3-4fdf-8c74-78e3c1c8594e	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.63324	2024-11-11 16:23:44.63324	f	0.00	f	f	1	\N
32181dfc-785b-4281-a913-b6efed5b8717	b132b631-3b5e-4087-b457-1dd4664daed4	cff854b6-3804-4c5e-8029-de025ab01f4b	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.633243	2024-11-11 16:23:44.633243	f	0.00	f	f	1	\N
d6b5d771-23da-42ad-89ba-862a021b21f3	b132b631-3b5e-4087-b457-1dd4664daed4	153cc2c8-fe40-459c-94b4-d8dd4ee1155f	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-11 16:23:44.633245	2024-11-11 16:23:44.633245	f	0.00	f	f	1	\N
1465e95f-a068-40ae-a052-ec9be35e4c78	b132b631-3b5e-4087-b457-1dd4664daed4	61f9674d-12c1-44bf-85c1-41db5a866866	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	t	2024-11-11 16:23:44.633474	2024-11-11 16:24:27.92357	f	0.00	f	f	1	\N
d4052b4c-208a-46f8-9712-51e2998c84c4	b132b631-3b5e-4087-b457-1dd4664daed4	86f6868b-6c4e-419d-ac7d-6367490c746a	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	t	2024-11-11 16:23:44.633478	2024-11-11 16:24:44.304149	f	0.00	f	f	1	\N
55ab57d8-3f51-40aa-941e-ba61e153d357	b132b631-3b5e-4087-b457-1dd4664daed4	488a2cbe-84cb-4d07-be70-47235c8d8fa5	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-11 16:23:44.633483	2024-11-11 16:23:44.633483	f	0.00	f	f	1	\N
8fc6f32e-98a3-4ff0-8adb-d6252ddf01dc	b132b631-3b5e-4087-b457-1dd4664daed4	acc1c50f-56d8-49b7-861b-338b2931a35b	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-11 16:23:44.633486	2024-11-11 16:23:44.633486	f	0.00	f	f	1	\N
3d5e633c-a377-4438-ba23-c0dbf5acf553	b132b631-3b5e-4087-b457-1dd4664daed4	9d6151cd-beb3-437a-81a2-dafeb5a2de33	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-11 16:23:44.633489	2024-11-11 16:23:44.633489	f	0.00	f	f	1	\N
d4ba84d4-3dba-429a-b1b6-c125c538f9bf	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Oke","images":[]}	t	2024-11-11 16:30:02.017904	2024-11-11 16:30:43.448927	t	5.60	f	f	1	\N
c0cc4762-f183-4af1-b0f6-24ccdde99d0b	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	t	2024-11-11 16:30:02.017908	2024-11-11 16:30:30.14598	t	10.00	f	t	1	\N
c78ae7f0-3dde-41d5-a100-4595a1d7cca0	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	t	2024-11-11 16:30:02.017939	2024-11-11 16:30:32.412505	t	0.00	f	f	1	\N
5dc5399d-9664-46a0-9847-1aced17e1d42	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Oke","images":[]}	t	2024-11-11 16:30:02.017943	2024-11-11 16:30:36.644641	t	10.00	f	t	1	\N
5cab28ec-0666-4996-9339-8aa93e6a8afe	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036484	2024-11-12 02:35:28.036485	f	0.00	f	f	1	\N
26fae0d2-fb37-4ff7-8f67-7d5c55dc0e5c	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036488	2024-11-12 02:35:28.036488	f	0.00	f	f	1	\N
ce686db1-c9d4-45c8-87b9-400e1bd338b0	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036491	2024-11-12 02:35:28.036491	f	0.00	f	f	1	\N
ff1e6ee3-64ca-45fd-bf37-d9375f28b95c	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036495	2024-11-12 02:35:28.036496	f	0.00	f	f	1	\N
ffdd5002-26e2-40e6-b9c7-18dc8711a654	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036498	2024-11-12 02:35:28.036499	f	0.00	f	f	1	\N
751c2979-459f-4f76-9e35-226fbb152b42	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036536	2024-11-12 02:35:28.036536	f	0.00	f	f	1	\N
b6f2ad53-a454-4094-ad44-8b05612b67d4	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.03654	2024-11-12 02:35:28.036541	f	0.00	f	f	1	\N
f1db7791-93e4-4035-b70d-7e44434a6d2a	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036563	2024-11-12 02:35:28.036563	f	0.00	f	f	1	\N
8af5b52d-2e2c-461b-b363-8941e14baf80	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036566	2024-11-12 02:35:28.036566	f	0.00	f	f	1	\N
746bb630-fcca-41dc-854c-e43b8e44b20b	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036569	2024-11-12 02:35:28.036569	f	0.00	f	f	1	\N
51407cab-6a3e-4416-afc3-26e3b245bfd1	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	214c0bf4-d8fe-492c-9229-e1068eea1eee	t	2024-11-12 02:35:28.036467	2024-11-12 02:35:30.374134	f	0.00	f	f	1	\N
5adae9d7-1c2d-4512-8ea0-7a318a3a0ee1	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 02:35:28.03648	2024-11-12 02:35:33.1006	f	0.00	f	f	1	\N
b0d480f8-7d42-4a87-8228-db03eba80585	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203818	2024-11-14 06:33:07.203819	f	0.00	f	f	1	\N
2da33677-8677-4d3b-9288-1731fb6f2424	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:20:29.417462	2024-11-12 04:20:30.882799	t	2.50	f	t	1	\N
d08eceda-1f66-4fa5-a3b1-15f534214d3f	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-11 16:30:02.017795	2024-11-11 16:30:52.090579	t	2.50	f	t	1	\N
d4f9b991-c80e-4288-a0ff-9fed78f12df5	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-11 16:30:02.017802	2024-11-11 16:30:52.090586	t	0.00	f	f	1	\N
38b7726d-7295-4b89-9335-6bdebe9c7ed6	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-11 16:30:02.017807	2024-11-11 16:30:52.090591	t	2.50	f	t	1	\N
b973261e-517b-492b-89de-42d0656e5c82	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	63fc3c99-f201-45d0-8d16-b8be3d564a26	t	2024-11-11 16:30:02.017812	2024-11-11 16:30:52.090641	t	0.00	f	f	1	\N
dfdfd688-a771-4610-bc81-a7fbfd246d54	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	236e5e18-b4eb-421b-9018-8bda3e53ea16	t	2024-11-11 16:30:02.017815	2024-11-11 16:30:52.090646	t	0.00	f	f	1	\N
2e73ebad-4cf7-4dde-81a1-bc410a77bc31	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	t	2024-11-11 16:30:02.017839	2024-11-11 16:30:52.090659	t	0.00	f	f	1	\N
7b683f8e-2c91-4480-b0fa-da63d617f681	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-11 16:30:02.017842	2024-11-11 16:30:52.090664	t	2.50	f	t	1	\N
0f1ab358-5f3f-4b01-a764-4b777a9ab329	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f982b9e4-2f48-45ca-8aca-6f9ffdfab9c5	t	2024-11-11 16:30:02.017845	2024-11-11 16:30:52.090669	t	0.00	f	f	1	\N
f36a168b-c365-407e-aa3d-bc9324522731	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	20c1f1eb-8408-4deb-9053-b42d126fb445	t	2024-11-11 16:30:02.017848	2024-11-11 16:30:52.090673	t	0.00	f	f	1	\N
6528141e-0853-4828-859d-c4d6336cc3f9	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-11 16:30:02.017854	2024-11-11 16:30:52.090687	t	0.00	f	f	1	\N
98895fa1-7db8-4f6d-bf62-0dbc70a937c2	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	83270c98-fe83-4511-b9f7-b66172a9008f	t	2024-11-11 16:30:02.017857	2024-11-11 16:30:52.090711	t	0.00	f	f	1	\N
b22198a1-0736-4a35-ae33-a68b59f69b73	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	39ef06d0-26dc-4ceb-99c2-42e53df046c3	t	2024-11-11 16:30:02.01786	2024-11-11 16:30:52.090733	t	0.00	f	f	1	\N
e3af508b-8743-4605-a469-da2e009ae1cb	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b6cb44d6-3f75-4a0a-b57c-3c50f1e52661	t	2024-11-11 16:30:02.017863	2024-11-11 16:30:52.090746	t	0.00	f	f	1	\N
65f1c4cf-bd25-49b4-a71f-609d04e7e84c	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-11 16:30:02.017867	2024-11-11 16:30:52.090751	t	2.50	f	t	1	\N
b8623fe7-2fad-4e2f-ad86-c6b259788c3c	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9b851902-24b4-4081-8f6e-04143fc855eb	t	2024-11-11 16:30:02.01787	2024-11-11 16:30:52.090756	t	0.00	f	f	1	\N
15997898-d4ea-4a14-bbeb-349e0f7e2bca	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Oke","images":[]}	t	2024-11-11 16:30:02.0179	2024-11-11 16:30:27.757247	t	5.60	f	f	1	\N
fb1d564a-04a1-4072-b52a-2efae548396c	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036572	2024-11-12 02:35:28.036572	f	0.00	f	f	1	\N
dc567eb5-31a1-4da9-8a46-d7574018c686	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036575	2024-11-12 02:35:28.036575	f	0.00	f	f	1	\N
9a1f6d8d-e0d4-4c4a-b84a-5ccf44209e96	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 02:35:28.036578	2024-11-12 02:35:28.036578	f	0.00	f	f	1	\N
81109009-ec0b-4e02-83be-7e88ace7bd76	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 02:35:28.036642	2024-11-12 02:35:28.036642	f	0.00	f	f	1	\N
60e69db5-1280-4100-8073-c345edaa07ec	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 02:35:28.036646	2024-11-12 02:35:28.036646	f	0.00	f	f	1	\N
ce64b132-bebc-47fb-8ff6-d6b61663ef2a	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 02:35:28.03665	2024-11-12 02:35:28.03665	f	0.00	f	f	1	\N
602302e1-72d7-4f38-9cd9-f99b51ef8740	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 02:35:28.036665	2024-11-12 02:35:28.036665	f	0.00	f	f	1	\N
37291e6b-9306-412c-bbd9-fc17257242ba	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:20:29.41747	2024-11-12 04:20:30.882828	t	2.50	f	t	1	\N
c70d74d4-a2df-46cf-b2fe-4b0da3d3ab8a	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203823	2024-11-14 06:33:07.203823	f	0.00	f	f	1	\N
c7ccb0e4-f827-41c0-9ca0-e9495c4824fe	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 02:35:28.036668	2024-11-12 02:35:28.036668	f	0.00	f	f	1	\N
a4d8cf5b-4fa7-432c-b3bd-9533a9c205c3	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:20:29.417472	2024-11-12 04:20:30.882845	t	2.50	f	t	1	\N
0733a31b-b075-4dee-80b0-1f00f586fed3	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:20:29.417475	2024-11-12 04:20:30.882871	t	2.50	f	t	1	\N
ff25134e-e424-44f7-a077-e0e6ee00c652	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Membuka laman website, mendukung permintaan data, mengumpulkan data dan memaksimalkan tampilan, memastikan keamanan situs web, mendukung penggunaan search engine\\nContoh:Email dan Chrome","images":[]}	t	2024-11-12 03:18:43.409653	2024-11-12 03:53:39.009334	f	0.00	f	f	1	\N
362b0cc9-1b21-486c-abc5-cf44f4ee3079	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9b851902-24b4-4081-8f6e-04143fc855eb	t	2024-11-12 03:20:29.417478	2024-11-12 04:20:30.882877	t	0.00	f	f	1	\N
e0718c91-7ac2-4167-a7b9-2f08251f7152	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:20:29.417484	2024-11-12 04:20:30.882887	t	0.00	f	f	1	\N
614f22d3-7ab4-47bb-9b7f-498da000e284	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata adalah perangkat lunak yang memiliki fitur yang kompleks dan dapat dikembangkan dengan harga murah.\\nContoh: Microsoft Word,Notepad,","images":[]}	t	2024-11-12 03:18:28.985523	2024-11-12 03:57:28.196808	f	0.00	f	f	1	\N
18b631c0-193b-4327-b6c1-75895797bbf6	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:20:46.225275	2024-11-12 04:20:46.409744	t	0.00	f	f	1	\N
093ac016-b014-4cee-8649-be05386b08d5	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:18:44.919226	2024-11-12 04:18:45.799495	t	0.00	f	f	1	\N
91fda2bd-cedd-40b5-b334-276c27023821	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:20:46.225278	2024-11-12 04:20:46.409765	t	2.50	f	t	1	\N
37340048-c7bc-49e5-a722-28fb52c58917	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada akhir 1960 an,ibm mengembangkan mesin ketik elektronik/elektrik","images":[]}	t	2024-11-12 03:20:39.710387	2024-11-12 04:20:34.583129	f	0.00	f	f	1	\N
fe1440da-6bd8-4bd5-bf75-c23897ce6998	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:20:39.710234	2024-11-12 04:20:41.686163	t	2.50	f	t	1	\N
e41ac17f-c98e-46e8-9b9e-d939cf6d4e8b	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9d45689b-245d-4632-9f40-e3282070942f	t	2024-11-12 03:18:44.919232	2024-11-12 04:18:45.799502	t	0.00	f	f	1	\N
21d60530-a94d-4b1e-a449-73b4c69c858b	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:18:44.919234	2024-11-12 04:18:45.799517	t	0.00	f	f	1	\N
7d6ed8ef-ae5d-4a58-b4e4-3551d2e8869b	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:43.409494	2024-11-12 04:18:44.936707	t	2.50	f	t	1	\N
c51a624b-2452-4165-ba07-02d356ac1c18	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:18:28.985369	2024-11-12 04:18:30.355178	t	2.50	f	t	1	\N
1f658d7c-0eda-429b-aee8-a15462319f62	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:28.985373	2024-11-12 04:18:30.355183	t	2.50	f	t	1	\N
1ef90b2b-2929-4289-b153-fb19fd226985	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:20:39.710268	2024-11-12 04:20:41.686209	t	2.50	f	t	1	\N
43d04d5f-672c-4362-a4e6-075a50eb9bf3	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:20:39.710271	2024-11-12 04:20:41.686212	t	0.00	f	f	1	\N
363f2907-6cd4-4743-b361-5ac26cdf36da	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:18:28.985376	2024-11-12 04:18:30.355189	t	0.00	f	f	1	\N
4960b7eb-bd5b-4bcb-add5-38e9c3259e6e	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:28.985379	2024-11-12 04:18:30.355213	t	2.50	f	t	1	\N
cf1e15ad-90a3-4986-bc09-3c259f23af6f	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:20:39.710274	2024-11-12 04:20:41.686216	t	2.50	f	t	1	\N
5fc35f88-ba03-4e87-aaad-99d91f42937e	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:43.409499	2024-11-12 04:18:44.936715	t	2.50	f	t	1	\N
6f291b79-3ef0-492d-bdd2-c6f54ac35973	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:43.409503	2024-11-12 04:18:44.936721	t	2.50	f	t	1	\N
b9c66882-391a-4227-9eaa-80f456022ac7	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:43.409507	2024-11-12 04:18:44.936726	t	2.50	f	t	1	\N
f46731a0-3380-466c-a596-307cf98abfb5	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:44.919237	2024-11-12 04:18:45.799522	t	2.50	f	t	1	\N
68e46ba5-7c28-4c14-bc0f-9c3adf0a9304	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	5bb77356-c83f-40a4-bc67-f6c8cfbd9df4	t	2024-11-12 03:18:43.40951	2024-11-12 04:18:44.936731	t	0.00	f	f	1	\N
c57aea61-306f-4b55-a321-c7a6c1bca907	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:18:43.409514	2024-11-12 04:18:44.936738	t	2.50	f	t	1	\N
997a94ff-348b-40e5-9633-20ab77be74c4	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:44.91924	2024-11-12 04:18:45.799533	t	2.50	f	t	1	\N
49719bfa-570b-4943-92d8-2b0c05b110a6	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:18:43.40952	2024-11-12 04:18:44.936748	t	2.50	f	t	1	\N
aa63251a-af8c-44ed-bfd1-e87c2884ae61	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:18:44.919243	2024-11-12 04:18:45.799543	t	0.00	f	f	1	\N
60f11a7c-f005-47dd-9fb3-853e2f517224	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:18:43.409523	2024-11-12 04:18:44.936752	t	0.00	f	f	1	\N
818091f0-55e5-4726-b876-1c6286673408	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	214c0bf4-d8fe-492c-9229-e1068eea1eee	t	2024-11-12 03:18:44.919245	2024-11-12 04:18:45.799546	t	0.00	f	f	1	\N
545f80bd-3b42-49a1-b6c2-c5d263b124d4	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:18:43.409553	2024-11-12 04:18:44.936784	t	0.00	f	f	1	\N
16a28764-3582-4c10-b6d7-b9a22f3087e3	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:20:46.225281	2024-11-12 04:20:46.40977	t	0.00	f	f	1	\N
4fa77bcd-2d28-49cc-9190-0f6bda72215f	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:22:36.817292	2024-11-12 04:22:37.263562	t	0.00	f	f	1	\N
ceb9057d-04aa-4319-a0ad-d9a0e000f1fa	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:18:43.409556	2024-11-12 04:18:44.936788	t	0.00	f	f	1	\N
94619159-a0fa-4b72-8e09-968cf3d06146	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:43.409558	2024-11-12 04:18:44.936793	t	2.50	f	t	1	\N
b700cc83-b10e-4ccf-9c79-d9e72069f1c6	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Mesin ketik di temukan oleh salah satu ilmuwan terkenal ia menciptakan mesin ketik jadul yang tidak secanggih sekarang dan mesin ketik pun berubah pada setiap masanya hingga sekarang mesin ketik pun populer dan masih berkembang.","images":[]}	t	2024-11-12 03:18:43.409648	2024-11-12 03:46:32.642202	f	0.00	f	f	1	\N
4604de8d-8ae9-495d-b43a-83c596599933	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:22:36.817295	2024-11-12 04:22:37.263571	t	2.50	f	t	1	\N
1d74694a-c25f-4ab6-84eb-d1d2aaf219bd	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:22:36.817298	2024-11-12 04:22:37.263589	t	2.50	f	t	1	\N
b69a8be9-e1b9-46ef-baef-9cbca33b4b3c	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:22:36.8173	2024-11-12 04:22:37.263594	t	2.50	f	t	1	\N
1fe7beb7-8e83-4b61-9f0c-c48a28bbc9c5	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:22:36.817313	2024-11-12 04:22:37.263631	t	2.50	f	t	1	\N
f63e7b1a-bfb6-418b-9dec-b057b5f27f9e	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose. Maka akan new massage .\\nPada new massage, terdapat beberapa bagian seperti berikut.\\n- To\\n-Cc\\n-Bcc\\n-subject\\n-Compose email","images":[]}	t	2024-11-12 03:18:44.919362	2024-11-12 03:57:15.249209	f	0.00	f	f	1	\N
2022eaaf-f6a6-44b2-b1a8-726931df683d	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:22:36.817316	2024-11-12 04:22:37.263635	t	2.50	f	t	1	\N
3f341ec4-d57d-4f94-886d-5d124fd14d0d	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:22:36.817318	2024-11-12 04:22:37.263639	t	2.50	f	t	1	\N
378e2b61-bc61-48af-bf46-b55f4d9fb736	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:22:36.817321	2024-11-12 04:22:37.263649	t	2.50	f	t	1	\N
e4698b7b-76c7-485d-abc5-1fedf2707a29	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:18:44.919271	2024-11-12 04:18:45.79956	t	2.50	f	t	1	\N
9bfbc301-1b66-4e9c-834c-0edbaf3523b4	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	a045847b-f0c1-4b42-a081-2c5d6bbe8135	t	2024-11-12 03:22:36.817323	2024-11-12 04:22:37.263653	t	0.00	f	f	1	\N
c10064ee-e752-4503-9b0b-3d98eb6a946d	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:22:36.817325	2024-11-12 04:22:37.263658	t	0.00	f	f	1	\N
4bf607de-cf0c-4bf3-937f-7ac95ea67c8e	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203828	2024-11-14 06:33:07.203828	f	0.00	f	f	1	\N
cd852373-0e2c-4cf2-946b-3cc14b5f06dd	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.079949	2024-11-12 04:29:30.079949	f	0.00	f	f	1	\N
49f68c11-7d6b-4f11-99b5-5bf666f6e47c	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:18:49.610279	2024-11-12 04:18:50.816531	t	2.50	f	t	1	\N
2ba25156-d092-4f7b-a8ae-8f30a4798c44	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"aplikasi yang memiliki fitur yang kompleks dan dapat dikembangkan.\\ncontohnya\\n•Microsoft word\\n•Notepad\\n•wordpad","images":[]}	t	2024-11-12 03:18:49.610372	2024-11-12 04:01:34.021943	f	0.00	f	f	1	\N
83f9e11f-6a43-4c75-85a9-a0abff927c14	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Microsoft word,wordpad,wordstar","images":[]}	t	2024-11-12 03:18:45.020594	2024-11-12 04:00:52.71157	f	0.00	f	f	1	\N
9165dc2c-0713-4f4d-80c4-032adf594d00	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:18:49.610283	2024-11-12 04:18:50.816538	t	2.50	f	t	1	\N
dbb6dfb6-936a-4b6b-9a88-e4bf7eb1ca70	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Google \\nBrainly ","images":[]}	t	2024-11-12 03:18:44.919354	2024-11-12 04:02:42.359475	f	0.00	f	f	1	\N
e91cbee1-a742-4067-b72c-21d900dfb30e	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:50.58229	2024-11-12 04:18:51.453012	t	2.50	f	t	1	\N
ef690467-d0f3-4161-bab3-6f8387557645	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:44.919273	2024-11-12 04:18:45.799563	t	2.50	f	t	1	\N
5d428217-01f6-42c0-9810-8c5f5c9b6438	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:50.582305	2024-11-12 04:18:51.453039	t	2.50	f	t	1	\N
4718aca7-4023-400d-b5ab-3ab4f6b8e71b	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:18:50.582309	2024-11-12 04:18:51.453045	t	0.00	f	f	1	\N
d2e49fb1-4696-4da8-b1cf-64fa7ed4aa12	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search angine merupakan mesin pencarian yang berbentuk aplikasi dan didesain","images":[]}	t	2024-11-12 03:18:44.919369	2024-11-12 04:06:14.65651	f	0.00	f	f	1	\N
56d4423e-8607-4f7b-bb5f-06212c59c7f8	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:18:49.61026	2024-11-12 04:18:50.816488	t	2.50	f	t	1	\N
c89f58d4-2d30-450b-bf2b-1cc710e66c82	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:49.610266	2024-11-12 04:18:50.816501	t	2.50	f	t	1	\N
7a8f9ef4-b87d-4c03-b45b-5226bb5bdbbb	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:49.610268	2024-11-12 04:18:50.816506	t	2.50	f	t	1	\N
af712f50-6de9-4a0e-9cd7-2be9d756da06	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:49.610274	2024-11-12 04:18:50.816521	t	2.50	f	t	1	\N
0c454f83-0ef7-460a-821b-3823c5bba5ee	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	t	2024-11-12 03:18:44.919366	2024-11-12 04:17:51.552538	f	0.00	f	f	1	\N
85c30204-c141-4e95-9444-babe44822ae9	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:18:49.610276	2024-11-12 04:18:50.816526	t	2.50	f	t	1	\N
d46b729a-2c9c-4f55-94cd-28790b8e7c45	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	70ad9ce5-aae3-4659-b4ff-45518f0abcea	t	2024-11-12 03:18:49.610286	2024-11-12 04:18:50.816543	t	2.50	f	t	1	\N
b8e67822-6b8f-4dcc-b560-9db5cbafcd5d	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:18:49.610288	2024-11-12 04:18:50.816548	t	0.00	f	f	1	\N
47e40327-75d7-4a47-a438-6ba82ab886ad	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:49.610291	2024-11-12 04:18:50.816573	t	2.50	f	t	1	\N
27fbfc5a-ae44-4749-8434-69b9f3a46805	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:18:49.610296	2024-11-12 04:18:50.816584	t	0.00	f	f	1	\N
0702ea5f-16d0-4ac6-80c2-744348d545c5	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine adalah web ketika kita ingin mencari informasi contohnya goggle dan penggunaan nya sangat gampang tinggal buka lalu pencet pencarian ","images":[]}	t	2024-11-12 03:18:45.020588	2024-11-12 03:45:33.847273	f	0.00	f	f	1	\N
1d39ed0b-e1d7-46f3-bc01-a3e4c17baad1	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada akhir 1960-an , ibm mengembangkan mesin ketik elektromekanis/elektrik yang disebut IBM MT/ST(magnetic TapelSelectric Typewriter).","images":[]}	t	2024-11-12 03:18:44.919358	2024-11-12 04:15:02.104793	f	0.00	f	f	1	\N
76dff2bf-740c-4e81-b08a-4e150fd59ade	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada akhir 1960an ibm mengembangkan mesin ketik elektromekanis yang di sebut ibm mt/st","images":[]}	t	2024-11-12 03:18:45.0206	2024-11-12 04:14:39.819515	f	0.00	f	f	1	\N
006ae6ba-b6ec-4a25-bc82-8a5c69c0639d	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:18:28.985413	2024-11-12 04:18:30.355293	t	0.00	f	f	1	\N
75df6020-8950-4354-95b0-9e47e85b964d	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:28.985428	2024-11-12 04:18:30.355297	t	2.50	f	t	1	\N
79cee5f3-997c-471f-b1e6-12610b950ff2	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:18:28.985431	2024-11-12 04:18:30.355302	t	0.00	f	f	1	\N
928cd64c-bfb8-4d1b-a3b5-2af272fac517	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.079953	2024-11-12 04:29:30.079954	f	0.00	f	f	1	\N
627d64a6-ceec-47ca-9578-6df92e7089c1	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.079957	2024-11-12 04:29:30.079957	f	0.00	f	f	1	\N
d8929b5b-9c81-4b9c-a2ee-9b85fa6afca0	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.07996	2024-11-12 04:29:30.07996	f	0.00	f	f	1	\N
5b8d5693-9625-49f8-b0ba-64598f9ab7c3	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.079996	2024-11-12 04:29:30.079997	f	0.00	f	f	1	\N
d211dc68-1f96-41f4-bcdd-5f85cd444da7	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.079999	2024-11-12 04:29:30.08	f	0.00	f	f	1	\N
aea88d97-c74f-4de4-8e84-97a8bf8c77dc	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080022	2024-11-12 04:29:30.080023	f	0.00	f	f	1	\N
41cba4cc-52b4-4799-aa37-e1a55dda6e41	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080026	2024-11-12 04:29:30.080026	f	0.00	f	f	1	\N
ebd9af47-e186-4032-9489-86fd04e01b4b	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	edf0eeba-1fb0-43fe-83bb-4740f82cf097	t	2024-11-12 03:19:15.174163	2024-11-12 04:19:15.399264	t	0.00	f	f	1	\N
304f20ac-63c1-4346-8c8b-d216e94d8dc1	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.08004	2024-11-12 04:29:30.080041	f	0.00	f	f	1	\N
5ebff5bf-429b-4546-bd19-47bfd629f21a	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080043	2024-11-12 04:29:30.080044	f	0.00	f	f	1	\N
47c6d792-eaca-4409-b329-d55505dc7331	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:19:15.174166	2024-11-12 04:19:15.399267	t	0.00	f	f	1	\N
a8dec295-4ddf-4093-a1b9-79b9f46304cf	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"ada tiga jenis pengolahan kata, yaitu menkanik, elektronik, dan perangkat lunak.","images":[]}	t	2024-11-12 03:18:50.770288	2024-11-12 04:17:04.630964	f	0.00	f	f	1	\N
ea2470ba-994e-48b4-9986-bdc0cec43a13	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari yang berbentuk aplikadi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi. \\n\\nContoh:\\nMenggunakan simbol + (tambah)\\nRumah+makan","images":[]}	t	2024-11-12 03:18:50.770299	2024-11-12 04:12:17.019554	f	0.00	f	f	1	\N
f0cb6751-d231-4c93-8adf-e40ed0f5d179	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perangkat pengolahan kata pertama yang merupakan dengan mesin tik\\n\\n-software\\n-microsoft\\n","images":[]}	t	2024-11-12 03:18:50.770302	2024-11-12 04:18:48.461693	f	0.00	f	f	1	\N
2633eee7-2cba-4a8b-b823-bb491b299ea4	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:18:45.020467	2024-11-12 04:18:45.344774	t	2.50	f	t	1	\N
1665031a-836c-4c11-98df-cdd5a129639d	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080046	2024-11-12 04:29:30.080046	f	0.00	f	f	1	\N
a65cc98b-2c0a-4aa3-8664-a58e471bcfed	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080049	2024-11-12 04:29:30.080049	f	0.00	f	f	1	\N
78d31d9d-1992-4cc9-b407-6a8cdee726a2	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080052	2024-11-12 04:29:30.080053	f	0.00	f	f	1	\N
970a833e-5f2f-4af8-80fd-56280117a120	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 04:29:30.080056	2024-11-12 04:29:30.080056	f	0.00	f	f	1	\N
c2bffe2b-8fca-4c18-8d16-e3369867cb28	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 04:29:30.080167	2024-11-12 04:29:30.080167	f	0.00	f	f	1	\N
f3c3fe3d-dc46-4313-a051-04056923f455	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 04:29:30.080171	2024-11-12 04:29:30.080171	f	0.00	f	f	1	\N
00e3ee9a-109c-4570-9bc6-2f01b2fef36e	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:18:49.610256	2024-11-12 04:18:50.816445	t	2.50	f	t	1	\N
b2e40c51-2b3b-4ce3-8fbf-0778e4b3073d	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:18:50.582313	2024-11-12 04:18:51.45305	t	0.00	f	f	1	\N
a29aa14f-e8ef-4c33-93be-5f6fd0727062	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	a045847b-f0c1-4b42-a081-2c5d6bbe8135	t	2024-11-12 03:18:50.582316	2024-11-12 04:18:51.453055	t	0.00	f	f	1	\N
9fa2566b-307d-4291-86e5-57ba73dbe9d8	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:15.174168	2024-11-12 04:19:15.399271	t	0.00	f	f	1	\N
5d15a666-965c-4efe-a827-e6e073e08ca3	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:15.174174	2024-11-12 04:19:15.399283	t	2.50	f	t	1	\N
db59b2fc-6424-4d21-914e-74df2cf6dff9	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 04:29:30.080175	2024-11-12 04:29:30.080175	f	0.00	f	f	1	\N
d32a9a0f-9702-4686-b326-97de10900c97	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9d45689b-245d-4632-9f40-e3282070942f	t	2024-11-12 03:18:50.770139	2024-11-12 04:18:51.725766	t	0.00	f	f	1	\N
69fd30af-6c22-4179-a04a-0f2ddf4b6866	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	5bb77356-c83f-40a4-bc67-f6c8cfbd9df4	t	2024-11-12 03:19:15.174177	2024-11-12 04:19:15.399286	t	0.00	f	f	1	\N
97c40467-7bb9-466b-afeb-2bcebb8a700f	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:18:50.770144	2024-11-12 04:18:51.725791	t	2.50	f	t	1	\N
b49e05c2-2e59-4085-93af-6eb7eee08a46	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:18:50.770152	2024-11-12 04:18:51.725803	t	0.00	f	f	1	\N
7a9cdf98-b8cf-4d7e-b6f6-9f01e4251081	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:18:50.770155	2024-11-12 04:18:51.725808	t	2.50	f	t	1	\N
1d10e9cc-9c38-43a0-8ac5-b9027e19ff64	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:15.17418	2024-11-12 04:19:15.399288	t	2.50	f	t	1	\N
a493d022-e81c-47ba-a563-b04aec141c83	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:18:50.770159	2024-11-12 04:18:51.725814	t	2.50	f	t	1	\N
97ec1361-22f0-4e74-a376-922628febfba	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:50.770162	2024-11-12 04:18:51.725831	t	2.50	f	t	1	\N
77397899-89d4-4489-8bd8-018064269fea	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:15.174202	2024-11-12 04:19:15.399316	t	2.50	f	t	1	\N
092f04e4-e37d-4c86-984b-994684886344	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:18:50.770165	2024-11-12 04:18:51.725836	t	2.50	t	t	1	\N
10e15115-1333-4ed1-a8b4-bfbbcd5b3765	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:15.174205	2024-11-12 04:19:15.399319	t	2.50	f	t	1	\N
c52f2ddc-1c07-4d5b-868f-a599e12010b8	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata = fitur yang kompleks dan dapat dikembangkan dengan harga murah \\n3 contoh = microsoft word,notepad,wordpad","images":[]}	t	2024-11-12 03:18:50.582501	2024-11-12 03:38:24.755252	f	0.00	f	f	1	\N
57afebdb-009f-4267-9018-b18f312b806b	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:50.770168	2024-11-12 04:18:51.725841	t	2.50	t	t	1	\N
4f8b9efb-07c8-4848-b67f-61cba9ea511c	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:50.770173	2024-11-12 04:18:51.725848	t	2.50	f	t	1	\N
df5a6754-ef5e-458b-894c-0551a7b1c7bd	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:50.770176	2024-11-12 04:18:51.72587	t	2.50	f	t	1	\N
3297839a-0f8d-4ae5-bf4e-7df8959d759f	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 04:29:30.080203	2024-11-12 04:29:30.080203	f	0.00	f	f	1	\N
1fb5bb7e-a1dd-4778-8b42-715fb05bd44d	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Mesin pencari yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi\\ncontoh : Google\\npenggunaan nya : menggunakan sintaksis OR, menggunakan simbol + (tambah), menggunakan simbol * (bintang) \\n","images":[]}	t	2024-11-12 03:19:15.174362	2024-11-12 04:06:03.575774	f	0.00	f	f	1	\N
e718123c-c733-4d47-a03b-1f5e5dbf3c42	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 04:29:30.080206	2024-11-12 04:29:30.080206	f	0.00	f	f	1	\N
91ee42be-be1e-4a7c-8dc7-6df24666c05f	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu Compose .maka akan tampil new massage\\nPada new massage terdapat beberapa bagian seperti berikut \\n\\nTo : digunakan untuk alamat Email yang sama\\nCC : untuk mengirim email lain atau tebusan\\nBCC : Tidak mengetahui kepada siapa bcc dikirimkan","images":[]}	t	2024-11-12 03:19:19.716374	2024-11-12 03:51:15.689659	f	0.00	f	f	1	\N
dbc08310-5ce6-4eca-a5fa-44b1d17fd895	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b0a79a05-a3de-4ccb-b214-84002a408d6e	t	2024-11-12 04:29:30.079933	2024-11-12 04:29:34.76004	f	0.00	f	f	1	\N
b54b6fef-aa09-4f6c-949c-7b1625a289ee	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203831	2024-11-14 06:33:07.203831	f	0.00	f	f	1	\N
137ec449-ccd1-478f-85ca-d1e5d895bdd6	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203835	2024-11-14 06:33:07.203835	f	0.00	f	f	1	\N
48028819-027b-438d-85c0-28b9f4fb68c7	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203838	2024-11-14 06:33:07.203838	f	0.00	f	f	1	\N
281e7569-f8e0-4300-8b49-87970f9f78e3	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203841	2024-11-14 06:33:07.203841	f	0.00	f	f	1	\N
76caba2c-cbfd-41e8-900b-7f059d792f4d	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203844	2024-11-14 06:33:07.203844	f	0.00	f	f	1	\N
99f56d48-8daa-4559-9ea3-793f27ff6996	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:22.435908	2024-11-12 04:19:23.627571	t	2.50	f	t	1	\N
43273e37-0dfd-45c1-a57e-585e1d4d4b7a	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"memory yang dapat di pindahkan antar perangkat","images":[]}	t	2024-11-14 01:17:35.753774	2024-11-14 01:49:24.801473	f	0.00	f	f	1	\N
c917212d-b876-4614-8c82-ec85fc9c69ed	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.20389	2024-11-14 06:33:07.20389	f	0.00	f	f	1	\N
80df46da-3ed4-43c1-a912-4e5e91193375	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:19:22.435913	2024-11-12 04:19:23.627578	t	0.00	f	f	1	\N
8f20d90c-fddf-4d48-9efd-cd26a4b3e1c5	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bed52831-eecd-4b7b-8cad-ea22b59fccd6	t	2024-11-12 03:19:22.435952	2024-11-12 04:19:23.627583	t	0.00	f	f	1	\N
256c7994-d0dc-4d49-b71c-cfd5e430d2a1	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:19:22.435955	2024-11-12 04:19:23.627587	t	2.50	f	t	1	\N
0d17015f-90d8-4932-abc1-a7d53300f0d0	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:22.435959	2024-11-12 04:19:23.627592	t	2.50	f	t	1	\N
2ff6b94a-6cbd-4c0d-8d59-c2aa22d660b1	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"fungsi :\\n- membuka laman web\\n- mendukung permintaan data\\n- mendukung penggunaan search engine\\ncontoh web\\n-  Windows 10\\n- Microsoft ","images":[]}	t	2024-11-12 03:19:15.174354	2024-11-12 03:55:40.241245	f	0.00	f	f	1	\N
4cfca57c-28af-4b67-ad95-d1120e5c7c38	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"pada awal 1970-an , pengolah kata berkembang menjadi berbasis komputer dengan beberapa inovasi (meski hanya dengan perangkat keras khusus).","images":[]}	t	2024-11-12 03:19:15.174366	2024-11-12 04:12:02.12184	f	0.00	f	f	1	\N
fc0ca041-d436-4b76-a3d7-4fd32a3cbf70	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:15.174208	2024-11-12 04:19:15.399325	t	2.50	f	t	1	\N
6be0481d-f412-470e-a334-020d2d78611d	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:15.17423	2024-11-12 04:19:15.399327	t	2.50	f	t	1	\N
7259e6ae-a79e-4f09-b992-a8a5bbd169b1	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:15.174234	2024-11-12 04:19:15.39933	t	2.50	f	t	1	\N
ad4fd373-0884-460b-9983-a799c4411154	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:19.716184	2024-11-12 04:19:21.113181	t	2.50	f	t	1	\N
f242687c-d4a8-42d8-9fbf-5832ae7e5898	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203893	2024-11-14 06:33:07.203893	f	0.00	f	f	1	\N
f0e609b3-807b-41af-816c-279c412fd35c	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:48.392013	2024-11-14 06:29:10.603216	t	2.50	f	t	1	\N
f1462626-b7f0-4812-9b00-00b0d21303e9	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:35.753675	2024-11-14 06:29:10.928756	t	0.00	f	f	1	\N
d83496b8-9649-4497-b1ca-9e1d37645edc	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203896	2024-11-14 06:33:07.203897	f	0.00	f	f	1	\N
eaadaca5-7987-4ff4-a061-8a188b0bd8c1	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:19.716188	2024-11-12 04:19:21.113186	t	2.50	f	t	1	\N
4e18fc35-b763-4c88-9b71-7555283f7836	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:22.435962	2024-11-12 04:19:23.627596	t	2.50	f	t	1	\N
a07aeb82-3808-4755-b615-a8f74b63851d	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:19.716191	2024-11-12 04:19:21.113227	t	2.50	f	t	1	\N
b0b40666-22b2-4691-a9a1-1a2309dba49e	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:19:19.716194	2024-11-12 04:19:21.113231	t	2.50	f	t	1	\N
979336da-cf50-49af-838a-75cf9865ee67	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:22.435966	2024-11-12 04:19:23.627614	t	2.50	f	t	1	\N
e344906e-d9b1-4ec8-ad1a-c72264304cfe	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:22.435969	2024-11-12 04:19:23.627635	t	2.50	f	t	1	\N
51fb1061-2871-4c67-b922-d1bf48cc9a20	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:22.435977	2024-11-12 04:19:23.627646	t	2.50	f	t	1	\N
b7dae51b-d14b-4ba9-9620-8a74dd917c63	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:19:22.435981	2024-11-12 04:19:23.627651	t	0.00	f	f	1	\N
fbe91c57-3b0f-4097-afbb-89b853f0adc6	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:22.435987	2024-11-12 04:19:23.627659	t	2.50	f	t	1	\N
3db6dd79-4d3b-4158-b024-4904dba0baac	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata merupakan perangkat pengolah kata yang serupa dengan mesin tik\\nAplikasi pengolah kata diantaranya \\n1.microsoft word\\n2.notepad\\n3.worldpad","images":[]}	t	2024-11-12 03:19:19.716351	2024-11-12 03:41:35.579766	f	0.00	f	f	1	\N
0bd609c4-d282-409f-9018-d4a1eb5476e8	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi Web browser adalah tempat untuk mencari informasi di internet, 2 contoh Web browser yang sering digunakan adalah Google Chrome, dan Microsoft ","images":[]}	t	2024-11-12 03:19:22.436126	2024-11-12 03:46:22.600344	f	0.00	f	f	1	\N
6a220109-9ef2-4e1c-8b90-b04f71563399	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata adalah pengolah yang mengelola kata secara modern dan lebih mudah, contoh aplikasi pengolah kata: Microsoft Word, Wordpad, Notepad","images":[]}	t	2024-11-12 03:19:26.188713	2024-11-12 03:53:11.977506	f	0.00	f	f	1	\N
dbac204a-bd9c-400d-bd56-4a07df962444	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:18:43.409563	2024-11-12 04:18:44.936802	t	2.50	f	t	1	\N
b49657d5-0899-4db3-be8d-e3ca05bf72ec	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapat informasi. Contoh search engine adalah Google dan cara penggunaannya adalah buka Google dan klik pencarian. ","images":[]}	t	2024-11-12 03:19:26.18872	2024-11-12 04:13:59.325241	f	0.00	f	f	1	\N
c329bd21-5602-4426-a4d6-11c92a607be5	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.2039	2024-11-14 06:33:07.2039	f	0.00	f	f	1	\N
f72dc113-b69e-4ccb-98e0-6eff4a3500a5	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081021	2024-11-12 05:58:39.081021	f	0.00	f	f	1	\N
d28cffbd-097e-41b6-b2f4-b00edb48331a	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081026	2024-11-12 05:58:39.081026	f	0.00	f	f	1	\N
c03bee6a-1b21-4f8d-86a6-ff1692a3595e	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081047	2024-11-12 05:58:39.081047	f	0.00	f	f	1	\N
b946e0b6-9073-4d9c-a885-0a8a2ebb91ba	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"perangkat pengolah kata pertama yang serupa dengan mesin tik dipantenkan oleh hery mill untuk mesin yang mampu \\"menulis dengan sangat jelas dan akurat sehingga pengguna tidak dapat membedakan dari mesin cetak\\"","images":[]}	t	2024-11-12 03:19:22.579237	2024-11-12 04:06:39.323477	f	0.00	f	f	1	\N
16d7bd10-3596-4f01-b2be-53f800704250	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.08105	2024-11-12 05:58:39.08105	f	0.00	f	f	1	\N
5a63a917-d280-490f-b50e-7b9c6c33c80a	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081054	2024-11-12 05:58:39.081054	f	0.00	f	f	1	\N
ada273aa-1926-45fb-8552-1c48021b6535	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081057	2024-11-12 05:58:39.081057	f	0.00	f	f	1	\N
90be4923-8ecf-462a-9699-c11b7a78ed7a	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.08106	2024-11-12 05:58:39.08106	f	0.00	f	f	1	\N
244e8f3a-647e-4e8f-9d23-ebfc4a0d1b51	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081063	2024-11-12 05:58:39.081064	f	0.00	f	f	1	\N
c7f9fe95-e24a-48ec-83f2-22dd0aac5ac0	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:18:43.409566	2024-11-12 04:18:44.936819	t	2.50	f	t	1	\N
d49127a7-c86c-447e-8fd4-28379bdafdaa	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:18:45.020471	2024-11-12 04:18:45.34478	t	0.00	f	f	1	\N
3a0f3fe0-3f0b-4d71-b6f6-cd7c5fb4a49c	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081077	2024-11-12 05:58:39.081078	f	0.00	f	f	1	\N
2d13c7f9-b31b-4d40-8e7d-b42b4c8d5672	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.08108	2024-11-12 05:58:39.081081	f	0.00	f	f	1	\N
147451fe-6fab-466f-9c80-d0fe206487da	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:19:22.579087	2024-11-12 04:19:23.38459	t	0.00	f	f	1	\N
5ad0eb81-2bdf-4dcd-af43-bd78f3edfa61	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:22.435902	2024-11-12 04:19:23.627563	t	2.50	f	t	1	\N
a4ac25d6-eda4-4203-9382-87a32a5be6bf	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081083	2024-11-12 05:58:39.081084	f	0.00	f	f	1	\N
ac3d584d-4792-4002-9c53-2789a7681514	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081087	2024-11-12 05:58:39.081087	f	0.00	f	f	1	\N
cd483924-c87c-49e1-8904-23c68b785504	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	39ef06d0-26dc-4ceb-99c2-42e53df046c3	t	2024-11-12 03:19:26.188582	2024-11-12 04:19:26.364113	t	0.00	f	f	1	\N
1509f74c-afd7-493e-8fd1-d8ccb94b8b99	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	1f9a7e41-66e6-4659-80c4-b82fa18249bd	t	2024-11-12 03:19:26.188588	2024-11-12 04:19:26.364119	t	0.00	f	f	1	\N
b2b597bb-3a44-4208-8775-9c69a7caef4c	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.08109	2024-11-12 05:58:39.08109	f	0.00	f	f	1	\N
e01ecffa-be35-4f0a-a9ee-d38d482dfbb6	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:26.188596	2024-11-12 04:19:26.364129	t	2.50	f	t	1	\N
47c267d1-ee3e-4df9-9106-78e711f9c5a1	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:26.188606	2024-11-12 04:19:26.36414	t	2.50	f	t	1	\N
10e2e321-2a4d-448a-903d-a697da590112	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:19:31.411146	2024-11-12 04:19:32.598562	t	0.00	t	f	1	\N
929f2bf5-ad54-4660-9d10-ef111a276009	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:31.411152	2024-11-12 04:19:32.598568	t	2.50	t	t	1	\N
23c4db6a-2a65-4fd6-9292-a1ba0e32bb60	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:26.188613	2024-11-12 04:19:26.36415	t	2.50	f	t	1	\N
ddd96277-58cf-4883-9132-71ae2974e13d	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:26.188616	2024-11-12 04:19:26.364154	t	2.50	f	t	1	\N
ed53282b-44d8-46b7-91a7-a30a8795faff	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:31.411171	2024-11-12 04:19:32.598575	t	2.50	f	t	1	\N
56a17356-fdb5-4088-9efa-8783d8259a6b	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	e3b04444-2514-41f4-86db-cbc832945c00	t	2024-11-12 03:19:26.188619	2024-11-12 04:19:26.364158	t	0.00	f	f	1	\N
670ac46f-4c39-44ab-99cc-527210d1438c	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	5bb77356-c83f-40a4-bc67-f6c8cfbd9df4	t	2024-11-12 03:19:31.411181	2024-11-12 04:19:32.598603	t	0.00	t	f	1	\N
d7fbe3d9-7158-4d2d-99e5-7ec92902a70b	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:26.188625	2024-11-12 04:19:26.364188	t	2.50	f	t	1	\N
a075cb2d-13f9-46fe-ab4e-d14a126ea7e1	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:31.411184	2024-11-12 04:19:32.598609	t	2.50	f	t	1	\N
57c7b202-0947-42ac-bd65-947bda9ef306	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:26.188628	2024-11-12 04:19:26.364194	t	0.00	f	f	1	\N
2b3c5318-e143-4048-9329-1c4e4fbb57d1	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	edf0eeba-1fb0-43fe-83bb-4740f82cf097	t	2024-11-12 03:19:31.411216	2024-11-12 04:19:32.598629	t	0.00	t	f	1	\N
08dc0a81-a4c6-4bdc-a7eb-0d97ac7fc99c	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:31.41122	2024-11-12 04:19:32.598635	t	2.50	f	t	1	\N
2ac39a60-12fa-469b-a465-67f3f2d7b653	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:31.411226	2024-11-12 04:19:32.598656	t	0.00	t	f	1	\N
2eb736f7-d7c4-4b0c-8b92-86213a3b8bf2	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:26.188631	2024-11-12 04:19:26.364209	t	2.50	f	t	1	\N
8443dee1-65ae-4378-9bb6-b1beaaeec5d6	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"MS Word,MS Excel dan MS PoweraPoint","images":[]}	t	2024-11-12 03:19:22.579221	2024-11-12 03:41:14.235069	f	0.00	f	f	1	\N
c0fb8fc0-80dc-4d94-9556-8d520cc44e4a	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose isi email klik to pilih subject pilih orang yang akan di pilih orang/ subject yang akan di kirim. pesan akan di terima sesuai subject","images":[]}	t	2024-11-12 03:19:31.411443	2024-11-12 03:51:36.421796	f	0.00	t	f	1	\N
07820c11-0d71-4a38-8ecb-2831fd3b7edd	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	e3b04444-2514-41f4-86db-cbc832945c00	t	2024-11-12 03:19:32.39256	2024-11-12 04:19:32.249034	t	0.00	f	f	1	\N
e4ee63bf-ce4c-42dd-b810-450210f0bf25	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Web browser adalah suatu alat yang di gunakan untuk menjelajahi website\\nGoogle\\nChrome","images":[]}	t	2024-11-12 03:19:31.411449	2024-11-12 04:09:38.55694	f	0.00	t	f	1	\N
f013a715-1b5c-4550-8c88-505e159571be	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata elektromekanis dan elektronik pada akhir 1960 an IBM mengembangkan mesin ketik elektromekanis/ elektrik yang i sebut IBM MT/ST","images":[]}	t	2024-11-12 03:19:31.411446	2024-11-12 04:09:37.314834	f	0.00	t	f	1	\N
7236a63e-ab2c-4794-8973-5821f6620081	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 05:58:39.081112	2024-11-12 05:58:39.081112	f	0.00	f	f	1	\N
223d77cb-7d5f-48fd-b22f-778e627179c7	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Aplikasi perkantoran untuk mengolah kata \\nMicrosoft word\\nWordPad\\nWordStar","images":[]}	t	2024-11-12 03:19:31.411453	2024-11-12 04:12:28.107187	f	0.00	t	f	1	\N
35d5e8d8-e12e-4f01-aec6-3a0b6d9c3cc1	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:32.392565	2024-11-12 04:19:32.249038	t	0.00	f	f	1	\N
755e8a3e-fac3-46c5-8fe8-8691a5b6c8f3	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:32.233765	2024-11-12 04:19:32.501887	t	2.50	f	t	1	\N
09ef190a-d4b7-48bc-871d-91aa4b084566	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 05:58:39.081234	2024-11-12 05:58:39.081235	f	0.00	f	f	1	\N
b71b71ee-20b6-4cb6-98a2-4708325945b7	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 05:58:39.081239	2024-11-12 05:58:39.081239	f	0.00	f	f	1	\N
6bca2fc1-2fec-40eb-8539-63e82ff95640	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 05:58:39.081242	2024-11-12 05:58:39.081242	f	0.00	f	f	1	\N
86d5f474-6b28-4830-9b1b-5cc81ac34d6d	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:32.233772	2024-11-12 04:19:32.501892	t	2.50	f	t	1	\N
e72513fc-350b-4081-8f51-5a9fb3fc404e	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 05:58:39.081255	2024-11-12 05:58:39.081255	f	0.00	f	f	1	\N
8ef5ba6d-c43a-4b0b-a12e-60385e67d6b8	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:32.233786	2024-11-12 04:19:32.501903	t	2.50	f	t	1	\N
a204f621-7851-46a7-903c-57dd6f6fa668	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 05:58:39.081258	2024-11-12 05:58:39.081258	f	0.00	f	f	1	\N
88404169-470c-4c56-9a83-19d6af86bce9	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203903	2024-11-14 06:33:07.203903	f	0.00	f	f	1	\N
056ad7a5-7471-4a76-b844-8491dc897973	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:07.203906	2024-11-14 06:33:07.203906	f	0.00	f	f	1	\N
d168d7eb-9c52-498a-ad35-c1be886233fa	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:32.233789	2024-11-12 04:19:32.50191	t	2.50	f	t	1	\N
5e4f3c26-7991-471a-98c2-b001dfb54c28	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:07.204072	2024-11-14 06:33:07.204073	f	0.00	f	f	1	\N
e5c286f9-8035-4c98-82b1-245e8c95768b	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:32.233792	2024-11-12 04:19:32.501915	t	2.50	f	t	1	\N
f9557be4-5750-4994-8fd9-ad9d0f93a9e1	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	1f9a7e41-66e6-4659-80c4-b82fa18249bd	t	2024-11-12 03:19:32.233807	2024-11-12 04:19:32.501921	t	0.00	f	f	1	\N
758d19bb-b155-4f84-84f4-7165d8ecf30a	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:31.411307	2024-11-12 04:19:32.598693	t	2.50	f	t	1	\N
3244816d-c126-470b-999f-8243c96b11e0	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:32.23381	2024-11-12 04:19:32.501926	t	2.50	f	t	1	\N
0bc8be65-552b-4efd-97d1-ad2d98c3b8ac	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:31.41131	2024-11-12 04:19:32.598699	t	0.00	f	f	1	\N
78d2c3ad-f5e7-421c-8aca-4dcd98ecbebd	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	39ef06d0-26dc-4ceb-99c2-42e53df046c3	t	2024-11-12 03:19:32.233816	2024-11-12 04:19:32.501943	t	0.00	f	f	1	\N
a1baebac-d44a-497b-ae35-01feb70f6ef3	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:19:32.233819	2024-11-12 04:19:32.501971	t	2.50	f	t	1	\N
6d302f65-b98b-40f4-b612-ba1dfc8ba9d0	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:19:31.411313	2024-11-12 04:19:32.598704	t	2.50	f	t	1	\N
8c1756f5-de4f-41eb-9987-5f733d2f0e06	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:32.233821	2024-11-12 04:19:32.501976	t	2.50	f	t	1	\N
e021fd4d-b5bd-45b5-9531-8713bfbad162	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:31.411316	2024-11-12 04:19:32.598708	t	2.50	f	t	1	\N
54990112-132d-4918-a6e4-b7679d1f83c4	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:31.411319	2024-11-12 04:19:32.598713	t	2.50	t	t	1	\N
18b8446e-33c3-4d05-b849-a0bea98c17e4	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:31.411322	2024-11-12 04:19:32.598725	t	2.50	t	t	1	\N
05bfab05-be14-4a37-a3ac-9a2a31b744ae	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	72e2bb70-10bc-4e2f-a909-df97927a5f56	t	2024-11-14 01:17:35.814372	2024-11-14 06:29:10.214367	t	0.00	f	f	1	\N
b8abc7a2-57fc-4c36-b612-8226f40c0a35	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:32.233826	2024-11-12 04:19:32.501985	t	2.50	f	t	1	\N
faba1a0e-c3e0-4da4-8665-3e71c19398b0	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat lunak yang mengelola sumber daya komputer","images":[]}	t	2024-11-14 01:17:35.753787	2024-11-14 02:09:19.532598	f	0.00	f	f	1	\N
07c3a1e8-2a52-4e8a-8bbc-e0693588a9b2	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9544c203-7379-4307-9bd2-2bfbfe96d0d3	t	2024-11-14 01:17:51.277635	2024-11-14 06:29:10.725447	t	0.00	f	f	1	\N
3350cb4b-3574-4712-a968-c81001308543	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:51.277638	2024-11-14 06:29:10.725452	t	2.50	f	t	1	\N
0e4f8894-a81f-406a-ac78-f3fa9bbdf50a	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":" Web browser di gunakan untuk mengakses internet\\nAddress bar\\nStop\\nRefresh\\nBack\\nForward\\nBookmark","images":[]}	t	2024-11-12 03:19:32.392776	2024-11-12 03:39:20.22725	f	0.00	f	f	1	\N
958f189c-1fd1-43e5-8826-84fe0a283b56	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perangkat pengolah kata pertama yang serupa dengan mesin tik di patenkan oleh henry mill untuk mesin yang mampu menulis dengan sangat jelas","images":[]}	t	2024-11-12 03:19:32.39278	2024-11-12 03:41:52.15268	f	0.00	f	f	1	\N
dc3057e1-32b3-4e95-97cb-7e3a03f07c0d	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari yang berbentuk aplikasi","images":[]}	t	2024-11-12 03:19:31.411438	2024-11-12 03:43:06.747265	f	0.00	f	f	1	\N
bc77d681-8191-4181-ac84-806db53c3901	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:07.204077	2024-11-14 06:33:07.204077	f	0.00	f	f	1	\N
f276a46a-2b07-4ea1-9ccd-38862e0a59af	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata adalah aplikasi perkantoran yang di gunakan untuk mengolah kata\\nContoh nya:\\nMS Word\\nNotepad\\nDan Wordpad","images":[]}	t	2024-11-12 03:19:40.968149	2024-11-12 04:10:28.052834	f	0.00	f	f	1	\N
685ddbee-1085-49b9-9439-e5079bf6d61d	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614769	2024-11-12 06:25:24.61477	f	0.00	f	f	1	\N
ca29db12-7378-4b6d-af55-459ca4e77399	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi. \\n\\nContoh : Yahoo \\n\\ndan cara penggunaannya adalah : \\n1.menggunakan kata kata yang sederhana \\n2.search by image\\n3Menyimpan gambar \\n4.menyimpan halaman \\n","images":[]}	t	2024-11-12 03:19:41.225815	2024-11-12 04:01:04.14163	f	0.00	f	f	1	\N
a0afcd69-d740-4d51-935b-0be50b326451	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614774	2024-11-12 06:25:24.614774	f	0.00	f	f	1	\N
0a8103b2-7fa7-44b3-9c8c-93dd1f3f3d32	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614803	2024-11-12 06:25:24.614803	f	0.00	f	f	1	\N
bc0b40cb-cab4-43a8-9797-8d47fc030c40	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614806	2024-11-12 06:25:24.614806	f	0.00	f	f	1	\N
71317445-f49a-4210-be32-ec914b0b7052	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.61481	2024-11-12 06:25:24.61481	f	0.00	f	f	1	\N
5de1271a-1dbd-412f-813d-dca4e65ae792	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614813	2024-11-12 06:25:24.614813	f	0.00	f	f	1	\N
0b608910-3b87-4b73-9465-aa71bccc7ce2	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614816	2024-11-12 06:25:24.614816	f	0.00	f	f	1	\N
61a58e22-f8a0-4a75-a78b-430dc1ef5d5b	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614819	2024-11-12 06:25:24.614819	f	0.00	f	f	1	\N
1507381c-5cae-4980-9c48-ebc27361d965	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614835	2024-11-12 06:25:24.614835	f	0.00	f	f	1	\N
cb1f5b89-ce36-4563-883a-444100a2cdf9	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614838	2024-11-12 06:25:24.614838	f	0.00	f	f	1	\N
78855497-09ae-4b73-aaa4-41df95608cbb	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614841	2024-11-12 06:25:24.614841	f	0.00	f	f	1	\N
46c8763a-7f62-475c-83b7-c43aeb5fa06f	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614844	2024-11-12 06:25:24.614844	f	0.00	f	f	1	\N
5fdbc4ca-260b-4e2c-ba46-7841cbd7b63c	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Aplikasi perkantoran yang digunakan untuk mengolah kata\\nContohnya : Microsoft word,Notepad,Wordpad","images":[]}	t	2024-11-12 03:19:41.225812	2024-11-12 04:12:28.036202	f	0.00	f	f	1	\N
13b54205-a037-47f8-b2c3-8c962b8ebf32	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:19.71618	2024-11-12 04:19:21.113175	t	2.50	f	t	1	\N
1dd168f5-557e-4047-88ff-66aeedd11047	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614847	2024-11-12 06:25:24.614847	f	0.00	f	f	1	\N
a2b600c6-7c91-43e7-9846-b2ffa1beb98b	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	0	f	2024-11-12 06:25:24.614849	2024-11-12 06:25:24.61485	f	0.00	f	f	1	\N
3794db96-49db-4dfb-9c19-06c965004052	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:40.968024	2024-11-12 04:19:41.098046	t	0.00	f	f	1	\N
3bfa0078-28a6-4f7a-b05f-dce10969f6cc	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0	f	2024-11-12 03:19:40.968029	2024-11-12 04:19:41.098052	t	0.00	f	f	1	\N
416d1976-c457-4486-89da-e50664d43fca	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:19:41.225636	2024-11-12 04:19:41.997857	t	0.00	f	f	1	\N
5f0cc025-8683-44d0-81b9-52dc6d5c4586	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:41.225663	2024-11-12 04:19:41.997864	t	0.00	f	f	1	\N
afab6ddc-2a89-4fd6-b378-e2acb9384315	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:19:47.883881	2024-11-12 03:30:30.765772	f	0.00	f	f	1	\N
179fefa3-e18d-416f-b124-2b6ea9406062	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9b851902-24b4-4081-8f6e-04143fc855eb	t	2024-11-12 03:19:41.225668	2024-11-12 04:19:41.997875	t	0.00	f	f	1	\N
b60c4837-f38e-465f-8152-e5e6b5305753	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:41.225671	2024-11-12 04:19:41.997881	t	2.50	f	t	1	\N
1ce259ab-9043-40e6-900f-11a088eff8d7	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:47.883878	2024-11-12 03:29:59.632954	f	0.00	f	f	1	\N
0fb9fe3e-d7b7-43ff-abd7-51c0cc1eae09	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:47.883914	2024-11-12 03:31:00.182914	f	0.00	f	f	1	\N
922f2c22-d397-4f12-adc0-f86940c2ca74	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:19:41.225674	2024-11-12 04:19:41.997906	t	0.00	f	f	1	\N
bedf9319-3536-4f62-a926-6d8b7e76e317	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	39ef06d0-26dc-4ceb-99c2-42e53df046c3	t	2024-11-12 03:19:41.225681	2024-11-12 04:19:41.997918	t	0.00	f	f	1	\N
f99f0d9e-2c25-4111-b776-82e02bd29883	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	20c1f1eb-8408-4deb-9053-b42d126fb445	t	2024-11-12 03:19:41.225684	2024-11-12 04:19:41.997924	t	0.00	f	f	1	\N
3e1302dc-ab86-4b97-aa76-723bafa4f0ed	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:41.225687	2024-11-12 04:19:41.997929	t	2.50	f	t	1	\N
a55a3bca-98f5-41e5-8b74-a5b29c0ab36c	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:41.2257	2024-11-12 04:19:41.99795	t	2.50	f	t	1	\N
cc54c19e-de89-47f7-8aac-7b783fd7f9f5	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:41.225706	2024-11-12 04:19:41.997955	t	2.50	f	t	1	\N
d883c89f-7cd4-448b-a7b9-0c2d3ccd418c	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:41.225709	2024-11-12 04:19:41.99796	t	2.50	f	t	1	\N
ff59318c-da4c-49a5-b2f6-bc48e7d5b52d	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:47.883908	2024-11-12 03:44:05.043509	f	0.00	f	f	1	\N
708e0c58-0a35-49fc-96ae-ec117a8f5f6c	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:41.225712	2024-11-12 04:19:41.997965	t	2.50	f	t	1	\N
c52236c7-c352-4a77-9507-725195b39a02	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:47.883911	2024-11-12 03:46:06.817426	f	0.00	f	f	1	\N
f91c3205-2cde-4b3e-bb32-2c341c02cf53	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:40.968034	2024-11-12 04:19:41.098058	t	2.50	f	t	1	\N
1fa4a0a5-1ccf-4474-b0a7-7c1f5c7012c6	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:19:40.968037	2024-11-12 04:19:41.098065	t	2.50	f	t	1	\N
a8626a70-1566-4622-9117-526120a8ba56	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:40.968044	2024-11-12 04:19:41.098076	t	2.50	f	t	1	\N
f64a3243-9877-4a55-8355-ccc0d8fb8058	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:41.225715	2024-11-12 04:19:41.997989	t	2.50	f	t	1	\N
08750098-33bb-4af0-b8a0-5ebdd1f37ac9	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:45.020474	2024-11-12 04:18:45.344786	t	2.50	f	t	1	\N
dd53949c-cfe0-4c11-a512-ea8e3ded59a9	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"pada akhir abad ke-19, Christopher Latham Sholes menciptakan mesin tik pertama dengan ukuran besr, yang digambarkan sebagai \\"piano sastra\\"","images":[]}	t	2024-11-12 03:19:47.884065	2024-11-12 04:03:00.723755	f	0.00	f	f	1	\N
fbc21514-23c0-4c08-84b6-357d0aa4be10	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 06:25:24.61497	2024-11-12 06:25:24.61497	f	0.00	f	f	1	\N
ef17d863-9cc5-490c-bded-500673ea13cd	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 06:25:24.614974	2024-11-12 06:25:24.614974	f	0.00	f	f	1	\N
f3c0d1ae-ea3d-4258-a913-a1f96fbd8777	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"web browser merupakan aplikasi yang digunakan untuk mengakses internet. web browser dapat menghubungkan user ke dunia maya untuk mengakses informasi","images":[]}	t	2024-11-12 03:19:51.979932	2024-11-12 03:57:20.555421	f	0.00	t	f	1	\N
1e809e9a-0cb0-4b9a-805d-e079e148075b	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"web browser digunakan untuk mengakses internet \\naddress bar\\nstop\\nrefresh\\nback\\nforward\\n","images":[]}	t	2024-11-12 03:19:47.884062	2024-11-12 03:59:17.178346	f	0.00	f	f	1	\N
f2f74aa7-e8f3-4785-ac9a-f208ea010fb2	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:45.020477	2024-11-12 04:18:45.344791	t	2.50	f	t	1	\N
91d07595-ce3f-4738-827e-15578d1f5551	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 06:25:24.614977	2024-11-12 06:25:24.614977	f	0.00	f	f	1	\N
24a327f6-6ccb-40ae-ab9d-6147e6f5f8df	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 06:25:24.614979	2024-11-12 06:25:24.614979	f	0.00	f	f	1	\N
7061580a-212f-44e5-8c6e-f71a946fefcf	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 03:19:51.609669	2024-11-12 03:19:51.60967	f	0.00	f	f	1	\N
90bfc750-8706-44f8-87f8-3626646710fb	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	{"text":"","images":[]}	f	2024-11-12 06:25:24.614982	2024-11-12 06:25:24.614982	f	0.00	f	f	1	\N
34da6620-4cbe-40bd-a9c1-92da014ba47c	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	5bb77356-c83f-40a4-bc67-f6c8cfbd9df4	t	2024-11-12 06:25:24.614754	2024-11-12 06:25:41.821265	f	0.00	f	f	1	\N
3d211ee0-a22c-4a6a-acb4-e13c0fdde274	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:07.204081	2024-11-14 06:33:07.204081	f	0.00	f	f	1	\N
77fd9d36-7b26-410e-800f-4d1ceb841f1e	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU: Perangkat yang menjadi bagian utama dalam komputer untuk menjalankan program\\nRAM: Memori sementara untuk menjalankan suatu progam\\nMotherboard: Perangkat untuk menyambungkan/memasang berbagai perangkat keras di komputer\\nHard disk: Tempat menyimpan data/file di dalam komputer\\nKartu grafis: Komponen untuk memproses gambar dan meneruskannya ke monitor untuk di tampilkan ","images":[]}	t	2024-11-14 01:17:38.627529	2024-11-14 01:48:46.067793	f	0.00	f	f	1	\N
31bcd35d-1414-4ba0-b591-9fa1b2a87e49	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:07.204087	2024-11-14 06:33:07.204087	f	0.00	f	f	1	\N
a39dc37e-0974-463e-8e71-93134c00f247	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:07.20409	2024-11-14 06:33:07.20409	f	0.00	f	f	1	\N
968222ba-b927-4ed9-ac68-a45ab6236f6e	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:45.178282	2024-11-14 06:29:10.632826	t	2.50	f	t	1	\N
52e6165b-07dc-4d3a-9953-08c8bbc19437	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:51.609426	2024-11-12 03:21:47.898334	f	0.00	f	f	1	\N
89d6c7c1-70fe-4263-946a-5bd8bff30b54	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9d45689b-245d-4632-9f40-e3282070942f	t	2024-11-12 03:19:51.609437	2024-11-12 03:23:58.94288	f	0.00	f	f	1	\N
fa0a1d10-ff75-446f-8df1-5060db7aa313	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0c255dee-e9b3-42d4-b218-ae95d9f7824e	t	2024-11-12 03:19:51.609431	2024-11-12 03:22:10.040358	f	0.00	f	f	1	\N
bdb6bfbf-29db-4431-852c-6ed62f9cf494	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	fe27c7d7-6f4f-436c-bdef-3695572c7b8d	t	2024-11-12 03:19:51.609434	2024-11-12 03:22:49.825948	f	0.00	f	f	1	\N
09e5101a-f62f-43d7-953b-acd9810837f0	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:19:51.609452	2024-11-12 03:25:57.980369	f	0.00	f	f	1	\N
077bedf6-e8e1-4947-aae5-aa744f050fa1	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:19:51.609448	2024-11-12 03:24:49.465731	f	0.00	f	f	1	\N
c55983a9-ddf0-49ec-83d3-8d026e1883af	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b438680b-0944-497c-b580-5a6deaa147fc	t	2024-11-12 03:19:47.883938	2024-11-12 03:30:10.45949	f	0.00	f	f	1	\N
8307afcd-35f8-43ec-b081-e1a58dae6343	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:51.609493	2024-11-12 03:28:12.890376	f	0.00	f	f	1	\N
78d8d137-dfbc-435d-95f4-66ca0ed62ff0	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6576ed44-d12c-450d-83a5-838562bba375	t	2024-11-12 03:19:51.609496	2024-11-12 03:30:26.232115	f	0.00	f	f	1	\N
928f376c-266a-4f31-9bb9-35c2f1204064	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:19:47.883926	2024-11-12 03:30:39.967687	f	0.00	f	f	1	\N
4d8d9793-1f8e-4bf5-9e9c-2a8993f87698	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:51.609499	2024-11-12 03:30:43.071781	f	0.00	f	f	1	\N
a2023201-7d81-41f4-99e9-21757765e996	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Menggunakan simbol+(tambah)\\nContoh:rumah+makan","images":[]}	t	2024-11-12 03:19:51.609643	2024-11-12 03:41:45.873725	f	0.00	f	f	1	\N
dc1ebc0f-deb8-4e46-a0ea-ef13d8e50014	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	83270c98-fe83-4511-b9f7-b66172a9008f	t	2024-11-12 03:19:51.609502	2024-11-12 03:31:51.87732	f	0.00	f	f	1	\N
3cd60ec1-ec43-477b-a688-e20e91c6b63d	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:47.883929	2024-11-12 03:31:53.096103	f	0.00	f	f	1	\N
3181eb85-6e7f-4e57-bb2c-9d57e6a595cd	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:47.883932	2024-11-12 03:32:23.964914	f	0.00	f	f	1	\N
6600d39c-cdc2-404c-a156-45a53753868f	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	afc61a16-cac5-4d2b-aa6b-d8537995f7d9	t	2024-11-12 03:19:47.883917	2024-11-12 03:33:36.563632	f	0.00	f	f	1	\N
dd8204dd-eb9f-421a-869e-31cfc22c3a5c	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Mekanik, elektronik dan perangkat lunak ","images":[]}	t	2024-11-12 03:19:51.609634	2024-11-12 03:34:22.87608	f	0.00	f	f	1	\N
3b58f1a7-39fa-4983-9acd-fb1b031a935c	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"-membuka laman website \\n-memdukung permintaan data","images":[]}	t	2024-11-12 03:19:51.609647	2024-11-12 03:43:13.470669	f	0.00	f	f	1	\N
b51595d5-9a25-4da1-8011-fe18ed62ab09	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:47.883923	2024-11-12 03:46:40.176413	f	0.00	f	f	1	\N
67c662b0-1302-4f1d-9199-c0b9dc041716	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"search engine merupakan mesin pencarian yang berbentuk aplikasi dan didesain \\ncontoh: hewan OR hewan ","images":[]}	t	2024-11-12 03:19:47.884055	2024-11-12 03:51:14.545095	f	0.00	f	f	1	\N
ca425fee-c361-4c31-9295-b10a11336631	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	214c0bf4-d8fe-492c-9229-e1068eea1eee	t	2024-11-12 03:18:45.020483	2024-11-12 04:18:45.344818	t	0.00	f	f	1	\N
199b68d7-c962-4e8d-877e-5d537c5cab26	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6576ed44-d12c-450d-83a5-838562bba375	t	2024-11-12 03:20:29.417427	2024-11-12 04:20:30.882739	t	0.00	f	f	1	\N
da5d1d76-560d-4a22-b2cd-abe89bb43311	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:20:29.417431	2024-11-12 04:20:30.882746	t	2.50	f	t	1	\N
09f18e10-8cc5-4bc4-b01b-c6adc2ba063b	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:20:29.417451	2024-11-12 04:20:30.882758	t	2.50	f	t	1	\N
fa8aaf6f-e2d3-4663-a09c-82c2ebe4d969	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:20:29.417454	2024-11-12 04:20:30.882764	t	2.50	f	t	1	\N
4f6dc9ab-f978-4d54-a3e7-78d263785f7d	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	70ad9ce5-aae3-4659-b4ff-45518f0abcea	t	2024-11-12 05:58:39.080991	2024-11-12 06:30:12.871118	f	0.00	f	f	1	\N
548b3b82-2dca-4bf2-a475-86d496f9af1c	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:45.178293	2024-11-14 06:29:10.63284	t	0.00	f	f	1	\N
703aafb0-8d44-4127-b0c4-f17625b66a98	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963584	2024-11-14 06:33:10.963584	f	0.00	f	f	1	\N
3286293d-aae8-4a2c-9bbe-0253fd802734	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Email\\nGoogle Drive\\nChrome","images":[]}	t	2024-11-12 03:19:52.437519	2024-11-12 03:52:25.191172	f	0.00	f	f	1	\N
3b2bc366-bd1c-4a0f-b839-e45cd56a9503	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose maka akan tampil new message\\nPada new massage terdapat beberapa bagian seperti berikut \\n1 to      :digunakan untuk alamat emain tujuan yang utama","images":[]}	t	2024-11-12 03:19:58.610661	2024-11-12 04:16:29.944168	f	0.00	f	f	1	\N
08f0bd1f-c6bd-4e8e-b139-d70f2054520f	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"google /Bing / yahool","images":[]}	t	2024-11-12 03:19:51.979939	2024-11-12 04:03:50.536291	f	0.00	t	f	1	\N
05497fff-84ae-410a-bbdb-2d39a841c859	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	1df0ce76-48c6-4563-a499-19fdaea0d284	t	2024-11-12 03:19:51.979759	2024-11-12 04:19:53.190311	t	0.00	f	f	1	\N
9786b5a2-1afe-44a2-ba67-521ef9f071ba	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"perangkat pengolahan kata pertama yang serupa dengan mesin tik dipatenkan oleh Henry Mill untuk mesin yang mampu “menulis dengan sangat jelas dan akurat sehingga pengguna tidak dapat membedakannya dari mesin cetak","images":[]}	t	2024-11-12 03:19:51.979942	2024-11-12 04:06:58.885966	f	0.00	t	f	1	\N
f147e6ff-6228-41fa-be4b-bde53b6472e6	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:18:45.020485	2024-11-12 04:18:45.344823	t	2.50	f	t	1	\N
516e749a-5e82-483f-a6fc-ef5750aad1bf	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:18:45.020487	2024-11-12 04:18:45.344827	t	0.00	f	f	1	\N
2e1a2a79-6825-4269-8474-f54ead6ba497	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963598	2024-11-14 06:33:10.963598	f	0.00	f	f	1	\N
443c5705-2d17-4500-8a76-c3d58a0841d6	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.9636	2024-11-14 06:33:10.9636	f	0.00	f	f	1	\N
ddb7690b-bd71-4692-9e04-e25eaf9a8b2c	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:35.957153	2024-11-14 06:29:10.896395	t	2.50	f	t	1	\N
c89acac8-fccf-41f5-882b-96c317be8ae3	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963603	2024-11-14 06:33:10.963603	f	0.00	f	f	1	\N
fb588830-4414-4be4-82c5-e774007ae5b7	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:47.883868	2024-11-12 03:20:20.283819	f	0.00	f	f	1	\N
26145b36-cfa5-4627-9a35-4108119f2032	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6576ed44-d12c-450d-83a5-838562bba375	t	2024-11-12 03:19:52.437315	2024-11-12 04:19:53.70681	t	0.00	f	f	1	\N
a87082a6-7c59-4f4c-a6ac-61cf11b9956a	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963605	2024-11-14 06:33:10.963605	f	0.00	f	f	1	\N
cd8042c7-2d3c-4cf6-84d4-07a3b31b3386	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:19:58.610421	2024-11-12 04:19:59.502647	t	2.50	f	t	1	\N
f33ae75b-c5cb-42e4-846a-a69a1fdd5f09	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:58.610478	2024-11-12 04:19:59.502663	t	2.50	f	t	1	\N
caffa8e4-bf03-4e23-9cf0-96322a0589fe	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 06:33:10.963581	2024-11-14 06:33:55.715304	f	0.00	f	f	1	\N
768dd374-b4b1-4477-8d0a-2977ab271553	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 06:33:10.963591	2024-11-14 06:34:16.948243	f	0.00	f	f	1	\N
a3afa7d2-97fa-4162-bbb3-be3020fcbde3	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:19:58.610482	2024-11-12 04:19:59.502668	t	2.50	f	t	1	\N
7c462062-11f4-4174-a562-5e421ddb935d	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:58.610489	2024-11-12 04:19:59.502712	t	2.50	f	t	1	\N
58a50062-e63c-4409-b592-fbe4e027f7c4	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c6e57907-d308-4ea4-90b5-f69b1194924c	t	2024-11-12 03:19:58.610495	2024-11-12 04:19:59.502722	t	0.00	f	f	1	\N
2676ce74-328e-462f-926f-22e0c7357039	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:58.610517	2024-11-12 04:19:59.502746	t	2.50	f	t	1	\N
46df7a89-9a5c-4b20-894c-8f41965d19b8	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:19:58.61052	2024-11-12 04:19:59.502751	t	0.00	f	f	1	\N
4ed6c86e-e053-48c0-b4f1-988ae4fb965e	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:58.610523	2024-11-12 04:19:59.502756	t	2.50	f	t	1	\N
ce71a3c5-d173-429d-9b27-d91b57531e71	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:58.610526	2024-11-12 04:19:59.502761	t	2.50	f	t	1	\N
2c45ac0d-a9f0-497f-8bea-4bc9e41f1185	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:58.610531	2024-11-12 04:19:59.502784	t	2.50	f	t	1	\N
2bd43400-be28-4b89-8939-5153b4110165	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:58.610534	2024-11-12 04:19:59.50279	t	2.50	f	t	1	\N
623926b8-74ef-4eb3-9821-1e6bb68dfbde	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"memori yang digunakan hanya untuk aplikasi tertentu, dan permanen","images":[]}	t	2024-11-14 01:17:35.814562	2024-11-14 01:40:20.046418	f	0.00	f	f	1	\N
f40c53ea-4c66-4217-8d6a-f2e20db68173	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"kumpulan perangkat keras dan lunak yang bekerja sama untuk memproses data daj menghasilkan informasi","images":[]}	t	2024-11-14 01:17:35.81457	2024-11-14 01:41:25.645252	f	0.00	f	f	1	\N
9ef36694-ed55-4282-a4cf-a5cf2be0db87	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"gabungan perangkat keras, perangkat lunak, yang bekerja sama untuk memproses data dan informasi","images":[]}	t	2024-11-14 01:17:35.814576	2024-11-14 01:44:25.016569	f	0.00	f	f	1	\N
6e37069c-d885-4224-ba46-d00fab552ce2	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Web browser adalah perangkat lunak yang berguna untuk mengakses informasi","images":[]}	t	2024-11-12 03:19:52.437513	2024-11-12 03:49:13.234199	f	0.00	f	f	1	\N
f46032ae-9aaa-40cb-a02a-9e0848a29f69	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963615	2024-11-14 06:33:10.963615	f	0.00	f	f	1	\N
4c5bcb42-cf47-4578-8e1d-f8a317efe919	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963617	2024-11-14 06:33:10.963618	f	0.00	f	f	1	\N
e358f54c-0e1b-47d3-8fe7-ae3a98e6d20e	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:45.178297	2024-11-14 06:29:10.632843	t	0.00	f	f	1	\N
93fed936-f558-4c66-80c2-b15fcfc77f2d	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem komputer merupakan perangkat lunak yang digunakan untuk berbagai data yang penting maupun tidak","images":[]}	t	2024-11-14 01:17:35.957311	2024-11-14 01:51:13.719359	f	0.00	f	f	1	\N
3357b8f4-b928-4681-aa73-c922f09599e7	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:45.1783	2024-11-14 06:29:10.632845	t	2.50	f	t	1	\N
c122fd87-0734-4ba8-b38f-68b37c22c8ac	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:18:45.020501	2024-11-12 04:18:45.344846	t	0.00	f	f	1	\N
8ca007e6-9f64-47b7-bce4-f42560fb1655	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:18:45.020503	2024-11-12 04:18:45.34486	t	0.00	f	f	1	\N
bb1bb153-762d-468c-a2b3-907b3605a322	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:18:45.020506	2024-11-12 04:18:45.344865	t	0.00	f	f	1	\N
8cc0d661-505c-4134-9d0e-9cf4b1a58392	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:20:29.417458	2024-11-12 04:20:30.882789	t	0.00	f	f	1	\N
fccd048b-3ce9-4b12-a61c-8c24a925355d	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:20:39.710225	2024-11-12 04:20:41.686155	t	2.50	f	t	1	\N
65c71943-3b0d-4dc2-a96e-402e4ceeaba5	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:20:39.71023	2024-11-12 04:20:41.68616	t	2.50	f	t	1	\N
b217fdc0-e16d-44d9-bd7a-bd66f2d4138c	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:17:35.957202	2024-11-14 06:29:10.896469	t	0.00	f	f	1	\N
39a613b7-5288-48f5-8615-a01ca4c50c32	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7f0667ff-adaf-4c3c-816b-50430cd9a7cc	t	2024-11-14 01:17:35.957209	2024-11-14 06:29:10.896486	t	0.00	f	f	1	\N
cc736a27-a182-4be5-9b1a-c3272061ce6a	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.96362	2024-11-14 06:33:10.96362	f	0.00	f	f	1	\N
313f83d1-3014-45d4-afc8-de3f23e2845f	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 03:20:39.710348	2024-11-12 03:20:39.710348	f	0.00	f	f	1	\N
462b55df-865e-4cca-9f3c-352d2723a765	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:20:39.710237	2024-11-12 04:20:41.686166	t	2.50	f	t	1	\N
41008f23-c471-407b-9ef8-b811ede322a7	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:20:39.710241	2024-11-12 04:20:41.68617	t	0.00	f	f	1	\N
5646e0e9-5e23-4103-844b-06939828c482	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3ce28a7e-fe0d-4889-8287-408934624d0c	t	2024-11-12 03:20:39.710248	2024-11-12 04:20:41.686175	t	0.00	f	f	1	\N
c99fc8d9-f419-46fc-a3f9-97e675f15a63	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"","images":[]}	f	2024-11-12 03:20:39.71039	2024-11-12 03:20:39.710391	f	0.00	f	f	1	\N
8f393c8b-a094-4995-8c63-b1e275356eb4	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:20:39.710252	2024-11-12 04:20:41.686179	t	2.50	f	t	1	\N
b61f6b57-d7ac-4cf4-b95a-a4d2d54e4d2d	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963622	2024-11-14 06:33:10.963622	f	0.00	f	f	1	\N
ee2d2af4-3ee9-4004-8fa6-2328db6d137f	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:20:39.710261	2024-11-12 04:20:41.686204	t	0.00	f	f	1	\N
b92f5e1d-ab2d-4a92-8676-8629b91e19e2	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:20:39.710264	2024-11-12 04:20:41.686206	t	0.00	f	f	1	\N
4bf95099-6948-4a0b-a6b2-4842f7128197	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:20:46.225209	2024-11-12 04:20:46.409657	t	2.50	f	t	1	\N
958e7d5d-1890-4028-9cde-b1aeee3d4c12	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:20:46.225214	2024-11-12 04:20:46.409663	t	0.00	f	f	1	\N
be8fa62a-d2bc-432f-b094-f034988cb80a	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:20:46.225217	2024-11-12 04:20:46.409685	t	0.00	f	f	1	\N
09341958-e486-4512-9c91-259ebf9752f4	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:20:46.225235	2024-11-12 04:20:46.40969	t	0.00	f	f	1	\N
ef064772-2a72-48f1-a743-eb5e50e1315c	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	t	2024-11-12 03:20:46.225239	2024-11-12 04:20:46.409697	t	0.00	f	f	1	\N
800f02e1-03ec-447e-a043-439dd5d2bda1	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:20:46.225246	2024-11-12 04:20:46.409703	t	2.50	f	t	1	\N
e5aca73c-0865-4e60-9b03-77ba80d50185	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perbedaan zaman ","images":[]}	t	2024-11-12 03:20:29.4176	2024-11-12 03:26:56.946606	f	0.00	f	f	1	\N
605c959f-9f98-471d-be50-a72b83f3db1c	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Chrome dan gogle","images":[]}	t	2024-11-12 03:20:29.417604	2024-11-12 03:27:22.174623	f	0.00	f	f	1	\N
e7e5ba5d-bd93-44b1-b20c-6ef1c16d715f	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Untu mencari jawaban","images":[]}	t	2024-11-12 03:20:29.417608	2024-11-12 03:27:37.013725	f	0.00	f	f	1	\N
618095c2-c29d-477f-9377-774e1c8e3d49	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:20:46.225249	2024-11-12 04:20:46.409707	t	0.00	f	f	1	\N
c31fc50d-a088-4841-b69b-8a5e88042cca	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6576ed44-d12c-450d-83a5-838562bba375	t	2024-11-12 03:20:46.225252	2024-11-12 04:20:46.409712	t	0.00	f	f	1	\N
0714e367-e743-4622-ba36-3973f186edbd	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:20:46.225266	2024-11-12 04:20:46.409727	t	2.50	f	t	1	\N
64fc6c08-6fb0-441f-9fe6-cce23708f2af	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:20:46.225269	2024-11-12 04:20:46.409731	t	2.50	f	t	1	\N
e21ab39a-8154-4b85-9522-b23f89191c23	31d085d2-069f-41a2-b802-71ba97846911	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	946f049c-1a14-4b42-89c5-e68b56c64e3e	t	2024-11-12 06:40:40.97554	2024-11-12 06:45:14.279063	t	0.00	f	f	1	\N
5d0ae2c8-5cbe-413a-93eb-62e12dbe4ba4	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2f143c12-59bb-4587-8861-54449d6d791c	t	2024-11-12 03:20:46.225272	2024-11-12 04:20:46.409736	t	0.00	f	f	1	\N
ede0174e-a7aa-42f3-a6d5-8931d8dc45f3	31d085d2-069f-41a2-b802-71ba97846911	1f0fdd75-233a-4f66-8776-2fc5f14436f8	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	["7d7c5628-0523-423d-93c6-132aeb96a22a","944220c8-f402-426c-88e3-1c983befaef2"]	t	2024-11-12 06:40:40.975599	2024-11-12 06:45:14.279085	t	0.00	f	f	1	\N
a0bf3a09-61d9-41a5-a3f7-c2d99e694b2e	31d085d2-069f-41a2-b802-71ba97846911	7215700b-1081-406c-88aa-0599781dbd82	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	ff294b62-2d82-4027-b013-44f0f2e4caf7	t	2024-11-12 06:40:40.975534	2024-11-12 06:45:14.279058	t	0.00	f	f	1	\N
39b32f6a-aafe-499b-826e-edcd05a3704d	31d085d2-069f-41a2-b802-71ba97846911	993f10a3-d06a-44ee-95c4-537387bf9a7b	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	[["a6a09b0a-db20-43c4-a2af-a461c04fb3cd","7b8abfff-312f-4300-9d34-3696dfa8e48d"],["cbb38a51-bbe4-441e-8594-0110a9ce0c36","19a27937-47d2-457c-a8f1-8913ade7586d"],["4b51b327-dcbc-4051-a7c2-442bb444c9a1","2a913011-52e7-4fa3-a8a5-b0739cb00f67"]]	t	2024-11-12 06:40:40.976257	2024-11-12 06:45:14.279161	t	0.00	f	f	1	\N
d3800bea-01e8-4955-a18a-5475704a8872	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose.maka akan tampil New massage","images":[]}	t	2024-11-12 03:22:36.817413	2024-11-12 04:20:29.65037	f	0.00	f	f	1	\N
35442369-976a-4a67-95f5-8386d85d59f8	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengelolah kata pertama yang ","images":[]}	t	2024-11-12 03:22:36.817409	2024-11-12 04:20:28.300961	f	0.00	f	f	1	\N
f401b34a-0806-4d37-847c-f812a815f33c	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada akhir 1960 an.IBM mengembankan mesin ketik elektromekanis yang disebut IBM","images":[]}	t	2024-11-12 03:20:46.225378	2024-11-12 04:20:21.423097	f	0.00	f	f	1	\N
0f708eac-86c9-4a23-9db2-f56c57973715	31d085d2-069f-41a2-b802-71ba97846911	7ec8cf21-50eb-4e4f-8168-ee8e3e5f6053	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	{"20393fdf-e2fa-4085-936d-a83f64cda33d":"Y","766b10eb-238e-4c7d-99f0-374c1a4f4af9":"Y","774752ad-251f-4955-b463-43e4d2bbd3b7":"N","86d5ee8c-2e06-4fd4-b088-a38e32e70801":"Y","b550f73f-8c94-4ac2-acfe-af6b5e2fb8bf":"N"}	t	2024-11-12 06:40:40.976809	2024-11-12 06:45:14.279254	t	0.00	f	f	1	\N
a5acaac4-083c-4b7a-a578-54e11fad0efc	31d085d2-069f-41a2-b802-71ba97846911	7215700b-1081-406c-88aa-0599781dbd82	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	d33080b0-c84f-4e74-b458-74bcc4fa14da	0	f	2024-11-12 06:54:50.868782	2024-11-12 06:54:50.868782	f	0.00	f	f	1	\N
074f0ff0-07ed-4dd8-8c3c-c2c48837b199	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:20:29.417434	2024-11-12 04:20:30.882752	t	2.50	f	t	1	\N
3549e965-29fd-41a4-83df-0066b2b087e7	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ef4a52ab-f606-457c-83ec-fff013b154e1	t	2024-11-12 03:18:50.770148	2024-11-12 04:18:51.725798	t	0.00	t	f	1	\N
607e61b4-847e-4de7-ba91-7031bfbb0a4f	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	t	2024-11-12 03:19:51.60942	2024-11-12 03:21:05.641914	f	0.00	f	f	1	\N
cc008c62-e996-4025-a06e-599189a4f07a	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:20:29.417465	2024-11-12 04:20:30.882815	t	2.50	f	t	1	\N
9f93c7bd-a5b8-401f-ac93-9661b3f64b58	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	t	2024-11-12 03:22:36.817257	2024-11-12 04:22:37.263548	t	2.50	f	t	1	\N
7191a3fe-8391-4303-b7dc-f8eb15148ba8	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:20:46.225204	2024-11-12 04:20:46.40965	t	2.50	f	t	1	\N
f8671fb1-08fe-442b-98fb-6b7580d26cc0	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963625	2024-11-14 06:33:10.963636	f	0.00	f	f	1	\N
35205c40-e12c-4d3a-8756-bba7df6da32e	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:10.963638	2024-11-14 06:33:10.963638	f	0.00	f	f	1	\N
81202446-590e-412c-aa09-2f22dc2598f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:36.024975	2024-11-14 06:29:10.359746	t	0.00	f	f	1	\N
4259847a-8153-4a39-bcee-1e48db9384d1	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:10.963703	2024-11-14 06:33:10.963703	f	0.00	f	f	1	\N
e60c7995-3244-4c1e-8ae1-084b573f290b	31d085d2-069f-41a2-b802-71ba97846911	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	d33080b0-c84f-4e74-b458-74bcc4fa14da	0	f	2024-11-12 06:54:50.868795	2024-11-12 06:54:50.868795	f	0.00	f	f	1	\N
5fc5ba72-c110-4b2d-bb7a-8bb0f2215da7	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:10.963707	2024-11-14 06:33:10.963707	f	0.00	f	f	1	\N
57b8a8f6-7922-452e-b4e8-f1cf862ee3bf	31d085d2-069f-41a2-b802-71ba97846911	1f0fdd75-233a-4f66-8776-2fc5f14436f8	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	d33080b0-c84f-4e74-b458-74bcc4fa14da	[]	f	2024-11-12 06:54:50.868891	2024-11-12 06:54:50.868891	f	0.00	f	f	1	\N
91fb40ec-f029-4216-bda7-25b1eecd48c7	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:22:36.817262	2024-11-12 04:22:37.263553	t	2.50	f	t	1	\N
e674a0fc-cae4-484f-ac46-e6a29d2f4dc2	31d085d2-069f-41a2-b802-71ba97846911	993f10a3-d06a-44ee-95c4-537387bf9a7b	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	d33080b0-c84f-4e74-b458-74bcc4fa14da	[["a6a09b0a-db20-43c4-a2af-a461c04fb3cd","2a913011-52e7-4fa3-a8a5-b0739cb00f67"],["cbb38a51-bbe4-441e-8594-0110a9ce0c36","7b8abfff-312f-4300-9d34-3696dfa8e48d"],["4b51b327-dcbc-4051-a7c2-442bb444c9a1","19a27937-47d2-457c-a8f1-8913ade7586d"]]	f	2024-11-12 06:54:50.869181	2024-11-12 06:54:50.869181	f	0.00	f	f	1	\N
7f844611-44ff-4434-ac4c-37e7a758753c	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:22:36.817271	2024-11-12 04:22:37.263559	t	0.00	f	f	1	\N
573ae90d-8fcf-42f2-a3e7-901f7768ee31	31d085d2-069f-41a2-b802-71ba97846911	7ec8cf21-50eb-4e4f-8168-ee8e3e5f6053	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	d33080b0-c84f-4e74-b458-74bcc4fa14da	{"20393fdf-e2fa-4085-936d-a83f64cda33d":"","766b10eb-238e-4c7d-99f0-374c1a4f4af9":"","774752ad-251f-4955-b463-43e4d2bbd3b7":"","86d5ee8c-2e06-4fd4-b088-a38e32e70801":"","b550f73f-8c94-4ac2-acfe-af6b5e2fb8bf":""}	f	2024-11-12 06:54:50.869402	2024-11-12 06:54:50.869402	f	0.00	f	f	1	\N
8227f755-4dff-416b-ba9b-3e8a1bba077d	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9e469b99-4ccd-4e44-a138-d1ac632f0eb8	t	2024-11-12 03:19:51.609445	2024-11-12 03:24:08.133655	f	0.00	f	f	1	\N
f9cdb430-d34a-42b4-9fed-9f784f3a8335	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:58.610473	2024-11-12 04:19:59.502654	t	2.50	f	t	1	\N
d891e5cf-7ec4-48f5-98c7-c2fd3eb128c3	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:18:49.610263	2024-11-12 04:18:50.816495	t	2.50	f	t	1	\N
bc4208a4-2d07-4524-9125-41bab543e806	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:52.43731	2024-11-12 04:19:53.706805	t	2.50	f	t	1	\N
2a6d73eb-0527-4b87-ac82-7f7a8da8cf6b	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Sepanjang sejarah,ada tiga jenis pengelolaan kata,yaitu mekanik,elektronik,,danperangkat ","images":[]}	t	2024-11-12 03:22:36.817415	2024-11-12 04:13:52.818622	f	0.00	f	f	1	\N
9c3c4795-8af4-449e-a444-8dcb14e1856d	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari yang berbentuk aplikasi dan desain dengan tujuan untuk memudahkan pengguna internet mendapat kan informasi\\nContoh=menggunakan sintaksis OR\\nCONTOH=hewan OR hewan singa","images":[]}	t	2024-11-12 03:20:46.225371	2024-11-12 04:13:12.098692	f	0.00	f	f	1	\N
1ff8abc0-a745-4203-8148-877f18ac8a4e	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:45.020508	2024-11-12 04:18:45.34487	t	2.50	f	t	1	\N
c9f8b964-9c83-40f2-bb0a-12ace56d6850	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:45.020513	2024-11-12 04:18:45.344895	t	2.50	f	t	1	\N
6792760e-7f1e-4460-9f50-96c21abe48b4	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:44.919222	2024-11-12 04:18:45.79949	t	2.50	f	t	1	\N
1feacabc-63ce-427e-9abf-a67c5e530282	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	45f2dc7f-a6cf-44b4-b5a2-2b8c8f8346ab	t	2024-11-12 03:19:15.17416	2024-11-12 04:19:15.399255	t	0.00	f	f	1	\N
c46897aa-8b00-4979-8198-0d26ccaf1079	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	1f9a7e41-66e6-4659-80c4-b82fa18249bd	t	2024-11-12 03:19:22.579077	2024-11-12 04:19:23.384558	t	0.00	f	f	1	\N
7e1a414d-d254-4d7d-aa52-9ca79a2fb36d	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:19:32.392595	2024-11-12 04:19:32.249047	t	0.00	f	f	1	\N
f9cc9a89-969a-4719-8725-6ed58e646e97	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:22.579083	2024-11-12 04:19:23.384584	t	2.50	f	t	1	\N
1d499b75-f6b8-4b57-9c5c-f61ab895d3e1	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82d88430-a7fb-4f63-b045-22e825ff3ce8	t	2024-11-12 03:19:22.435974	2024-11-12 04:19:23.627643	t	0.00	f	f	1	\N
6742dfe6-305e-4869-b74e-bf4cbbbae5d6	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:32.233761	2024-11-12 04:19:32.501859	t	2.50	f	t	1	\N
943e8cd1-3ba0-494f-b3a7-105f35c6c332	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:19:32.233784	2024-11-12 04:19:32.501897	t	0.00	f	f	1	\N
3c039b35-c16d-4040-b858-9e5adcf2ffc1	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ef4a52ab-f606-457c-83ec-fff013b154e1	t	2024-11-12 03:19:51.60945	2024-11-12 03:25:30.605809	f	0.00	f	f	1	\N
7d4d0ac9-1558-4708-ae4d-96411d0882db	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:15.174172	2024-11-12 04:19:15.39928	t	2.50	f	t	1	\N
1ea560d8-b632-4294-9683-6be39baad34e	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:20:29.417481	2024-11-12 04:20:30.882882	t	2.50	f	t	1	\N
89b658db-10ac-470f-b754-23cd42e21304	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:18:50.582347	2024-11-12 04:18:51.453081	t	0.00	f	f	1	\N
e59a473b-89e6-464e-b18e-4021c363ef0a	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine = mesin pencari yang berbentuk aplikasi dan di desain dengan tujuan untuk memudahkan pengguna internet mendapat informasi.\\nContoh = menggunakan simbol + (tambah)\\nContohnnya = rumah + makan","images":[]}	t	2024-11-12 03:18:50.582497	2024-11-12 03:30:28.251285	f	0.00	f	f	1	\N
87a83a9b-65de-477a-a96b-864bc094ec5d	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:51.609489	2024-11-12 03:27:37.289203	f	0.00	f	f	1	\N
845c1868-a3f4-40d1-a9b0-df717f858730	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	63fc3c99-f201-45d0-8d16-b8be3d564a26	t	2024-11-12 03:18:44.919229	2024-11-12 04:18:45.799499	t	0.00	f	f	1	\N
6e87dc70-32f3-46fc-8ac5-1076ad29b382	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata adalah tempat dimana tempat kita mencatat dan mengedit kata. Contoh aplikasi pengolah kata antara lain Microsoft Word, Notepad, Wordpad, dan lain","images":[]}	t	2024-11-12 03:19:22.4361	2024-11-12 03:36:15.71503	f	0.00	f	f	1	\N
a7d8ea99-0557-4996-92b7-35933ff89314	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:19:47.883935	2024-11-12 03:31:15.77239	f	0.00	f	f	1	\N
37e1dc24-08db-4da4-bc4b-1a724ad83ac1	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:20:39.710219	2024-11-12 04:20:41.686136	t	2.50	f	t	1	\N
22f6910e-d9d1-4077-b374-bd655d04f29a	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:47.883874	2024-11-12 03:31:36.97581	f	0.00	f	f	1	\N
247778ba-c075-47c6-bad6-2f0c7b405620	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:51.609505	2024-11-12 03:33:08.090776	f	0.00	f	f	1	\N
e3961def-d915-46aa-ba27-281018de937d	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:32.392602	2024-11-12 04:19:32.249054	t	2.50	f	t	1	\N
ddb60f89-7b54-414c-b027-9a21ed06f6cc	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Menggunakan simbol+(tambah)\\nContoh: rumah+makan","images":[]}	t	2024-11-12 03:45:02.259663	2024-11-12 03:51:18.794372	f	0.00	f	f	1	\N
2cf80ca0-809e-4aea-833f-8c9c0acf6043	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Microsoft word,Notepad,Wordpad","images":[]}	t	2024-11-12 03:20:29.417612	2024-11-12 03:31:40.839476	f	0.00	f	f	1	\N
ab939e0c-cc07-419b-a83d-94802be19669	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b41d60e7-4204-48fb-8746-fb8b4e880151	t	2024-11-12 03:22:36.817267	2024-11-12 04:22:37.263556	t	0.00	f	f	1	\N
301193b3-8d62-482d-91d0-3ba4b22fb087	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:18:43.409561	2024-11-12 04:18:44.936797	t	2.50	f	t	1	\N
561608ea-98b9-41d5-873d-5dd8348e4a09	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:28.985384	2024-11-12 04:18:30.355222	t	2.50	f	t	1	\N
de7ed21e-48ad-417b-bf45-92c7a0602e9f	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	1f9a7e41-66e6-4659-80c4-b82fa18249bd	t	2024-11-12 03:18:45.02048	2024-11-12 04:18:45.344795	t	0.00	f	f	1	\N
4ad2a05f-6ff4-464b-a483-e6d84be3a7de	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6576ed44-d12c-450d-83a5-838562bba375	t	2024-11-12 03:18:45.02049	2024-11-12 04:18:45.344832	t	0.00	f	f	1	\N
cc8179b3-1249-4eca-a920-e657135cbd36	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Mekanik, elektronik, dan perangkat lunak ","images":[]}	t	2024-11-12 03:45:02.259648	2024-11-12 03:49:46.07024	f	0.00	f	f	1	\N
0da479e4-6b51-4c2e-9eaa-a83199f830d6	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:50.582355	2024-11-12 04:18:51.453128	t	2.50	f	t	1	\N
cbb0082d-1e4b-4512-bacd-cc558618e330	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:22.579095	2024-11-12 04:19:23.384601	t	2.50	f	t	1	\N
06990ed6-a2f6-435c-95cc-3b30ae5ecc5d	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:22.579118	2024-11-12 04:19:23.38464	t	2.50	f	t	1	\N
8f23c6ef-7857-4c58-a0cb-a1dfd5f9ef21	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c6e57907-d308-4ea4-90b5-f69b1194924c	t	2024-11-12 03:19:22.435984	2024-11-12 04:19:23.627655	t	0.00	f	f	1	\N
305ce377-90a2-4631-96b2-3d45f3165165	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:22.43599	2024-11-12 04:19:23.627663	t	0.00	f	f	1	\N
ba65df1a-7328-4564-b172-59a78f02fc61	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:26.188593	2024-11-12 04:19:26.364124	t	2.50	f	t	1	\N
de8dafcc-0f9e-4b98-af6c-d0c87266477d	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:26.18861	2024-11-12 04:19:26.364146	t	2.50	f	t	1	\N
aff6f6aa-1418-4778-b28e-fc3571213b83	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:19:32.392639	2024-11-12 04:19:32.249092	t	0.00	f	f	1	\N
582e5187-4921-45be-8efe-d80b16932d94	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	e3b04444-2514-41f4-86db-cbc832945c00	t	2024-11-12 03:19:32.233823	2024-11-12 04:19:32.50198	t	0.00	f	f	1	\N
ca1f56a0-71bd-4257-8f35-b819c02d8026	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:31.411223	2024-11-12 04:19:32.59865	t	2.50	t	t	1	\N
0c4143c8-feda-49ae-b768-b676b67d4d8a	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:40.96804	2024-11-12 04:19:41.09807	t	2.50	f	t	1	\N
0425eb2f-4a37-4a34-ae72-c8c7cccbc197	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:41.225678	2024-11-12 04:19:41.997913	t	0.00	f	f	1	\N
ae60cc63-5096-4904-8e3a-29117ce3efd6	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:51.97982	2024-11-12 04:19:53.194556	t	2.50	f	t	1	\N
2219a23d-11bf-4035-809c-7a603985a14d	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:58.610485	2024-11-12 04:19:59.502705	t	2.50	f	t	1	\N
5f879f7d-1fd8-42c9-8e86-d8556bd33905	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:58.610492	2024-11-12 04:19:59.502717	t	2.50	f	t	1	\N
a4246cd1-a18a-4d96-8751-3157e5928376	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:22:36.817303	2024-11-12 04:22:37.263598	t	2.50	f	t	1	\N
19fdafda-4e42-4842-962e-1b7247a2cc50	31d085d2-069f-41a2-b802-71ba97846911	7215700b-1081-406c-88aa-0599781dbd82	fc3c9dfd-8827-41df-8366-ed852f8a23ec	d33080b0-c84f-4e74-b458-74bcc4fa14da	0	f	2024-11-12 06:57:00.212252	2024-11-12 06:57:00.212252	f	0.00	f	f	1	\N
d4bb97d0-aaaa-403d-876b-d3b02613fc0d	31d085d2-069f-41a2-b802-71ba97846911	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	fc3c9dfd-8827-41df-8366-ed852f8a23ec	d33080b0-c84f-4e74-b458-74bcc4fa14da	0	f	2024-11-12 06:57:00.212261	2024-11-12 06:57:00.212261	f	0.00	f	f	1	\N
bcf05a80-f821-45b1-83cf-4de65cbf8186	31d085d2-069f-41a2-b802-71ba97846911	1f0fdd75-233a-4f66-8776-2fc5f14436f8	fc3c9dfd-8827-41df-8366-ed852f8a23ec	d33080b0-c84f-4e74-b458-74bcc4fa14da	[]	f	2024-11-12 06:57:00.212308	2024-11-12 06:57:00.212308	f	0.00	f	f	1	\N
a7d3456c-6663-420d-accc-72074dea9cfd	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perkembangan terakhir pengolah kata lahir dengan munculnya komputer pribadi pada akhir 1970-an Dan dengan penciptaan perangkat lunak pengolah kata pada tahun 1980-an.","images":[]}	t	2024-11-12 03:19:32.233939	2024-11-12 03:37:06.934023	f	0.00	f	f	1	\N
f2391efc-9f4f-469e-997a-6a2b3a0360de	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:26.18864	2024-11-12 04:19:26.364223	t	2.50	f	t	1	\N
4cef2779-9659-4440-9113-ab6f9df368e2	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata pertama yang serupa dengan mesin ketik elektronik/elektrik yang di sebut magninetictapel selectroc typewriter Microsoft word, Notepad, wordpad word start open office ","images":[]}	t	2024-11-12 03:19:51.609639	2024-11-12 03:38:55.439009	f	0.00	f	f	1	\N
cc8198f9-1e3d-4e68-a751-772e154e6cd9	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:47.883903	2024-11-12 03:39:00.264854	f	0.00	f	f	1	\N
4f63d56f-a702-433e-8d01-c49fcd163088	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6576ed44-d12c-450d-83a5-838562bba375	t	2024-11-12 03:20:39.710258	2024-11-12 04:20:41.686201	t	0.00	f	f	1	\N
e62fed77-2b08-453e-ab7a-c577564d212d	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"1.klik menu compose.maka akan tampil new message\\n2. Pada new message,terdapat beberapa bagian seperti \\n• To\\n• Cc\\n• Bcc\\n• Subject\\n• Compose email\\n3.isikan semua bagian pada new message sesuai dengan kebutuhan \\n4. Setelah semua data telah di isi,pastikan kembali ke isi pesan yang ditulis dan file yang dilampirkan telah sesuai.lalu klik send,maka email akan berhasil terkirim dan masuk ke menu sent","images":[]}	t	2024-11-12 03:18:50.582505	2024-11-12 03:35:01.199744	f	0.00	f	f	1	\N
e0be04cb-6e86-43af-ba31-795ae3f734d7	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine adalah mesin pencari yang berbentuk aplikasi,dan informasi yang ditampilkan berasal dari web,blog atau forum ","images":[]}	t	2024-11-12 03:19:19.716346	2024-11-12 03:37:31.373605	f	0.00	f	f	1	\N
eeef69d7-547f-4e3a-96f6-88e5e83e85bc	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"A. Klik menu compose\\nB. Pada New message\\nC. Klik attach files\\nD. Lalu click ","images":[]}	t	2024-11-12 03:19:52.437505	2024-11-12 03:36:51.584621	f	0.00	f	f	1	\N
e532b738-0754-4fa6-8d4d-ac8abec5ba85	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata adalah pengolah yang mengelola kata secara modern dan lebih mudah, contoh aplikasi pengolah kata: Microsoft word, notepad, wordpad","images":[]}	t	2024-11-12 03:19:32.233942	2024-11-12 03:39:36.342066	f	0.00	f	f	1	\N
ac1a01c3-32ec-48e4-ab11-df05430dce50	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose maka akan tampil new Mesagge isi kan semua bagia pada new mesage sesuai dengan kebutuhan apa bila bagaian pada mew Mesagge klil attach files  setelah semua data ke isi pastikan kembali isi pesan yang di tulis dan file telah sesuai ","images":[]}	t	2024-11-12 03:19:32.392771	2024-11-12 03:37:49.633715	f	0.00	f	f	1	\N
b80e385f-59f7-4707-8d11-723ce86b24d2	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"email sudah digunakan pada tahun 1960 dengan pengguna terbatas menggunakan satu komputer","images":[]}	t	2024-11-12 03:19:51.979928	2024-11-12 03:55:08.256113	f	0.00	t	f	1	\N
c5b2fd8b-aab9-468b-93d5-7a36b4d0d3c7	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:10.963728	2024-11-14 06:33:10.963728	f	0.00	f	f	1	\N
6f4b199a-6a73-4e52-967f-199ebe33881c	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Merupakan mesin pencari yang berbentuk aplikasi dan desain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi\\nContoh:Mencari resep makanan ke salah satu aplikasi contohnya google, google akan memberi jawaban yang kita inginkan","images":[]}	t	2024-11-12 03:18:43.409644	2024-11-12 03:43:06.070327	f	0.00	f	f	1	\N
30d60799-4d98-43b2-9673-076395b3ea83	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Membuka laman website, mendukung permintaan data, mengumpulkan data dan memaksimalkan tampilan, memastikan keamanan situs Web, mendukung pengguna search egine.\\nContoh:  Email dan Chrome.","images":[]}	t	2024-11-12 03:18:28.985531	2024-11-12 03:53:42.449448	f	0.00	f	f	1	\N
c12658af-1a8e-4d73-939d-7445a099da6d	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	5bb77356-c83f-40a4-bc67-f6c8cfbd9df4	t	2024-11-12 03:18:28.985387	2024-11-12 04:18:30.355245	t	0.00	f	f	1	\N
c3fe6a9c-57b9-4af2-b868-7139bbe10129	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Salah satu jenis aplikasi adalah aplikasi perkantoran. Aplikasi perkantoran paling awal di kembangkan oleh Micropro International di awal  1980 an yang terdiri atas pengolah kata WordStar, CalcStar, dan DataStar. Beberapa aplikasi lain muncul pada tahun 1980 an seperti Word Perfect, ChiWriter, dan lain","images":[]}	t	2024-11-12 03:19:22.436123	2024-11-12 03:42:57.485978	f	0.00	f	f	1	\N
9dbe7433-9ed3-4181-b784-a81d4085a181	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi web browser = membuka laman website,mendukung permintaan data,mengumpulkan  data dan memaksimalkan tampilan,mendukung penggunaan search engine\\n\\n2 contoh = address bar & bookmark","images":[]}	t	2024-11-12 03:18:50.582509	2024-11-12 04:08:15.063055	f	0.00	f	f	1	\N
2b4f8a78-abfe-4dea-8201-e3ec3a5f7a09	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Ke gogleDrive ketik email yang akan dikirim surat lalu klik kirim","images":[]}	t	2024-11-12 03:20:29.417615	2024-11-12 04:07:57.067907	f	0.00	f	f	1	\N
31b595d1-3262-41cc-b130-6abaa9998760	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:18:28.985406	2024-11-12 04:18:30.355278	t	0.00	f	f	1	\N
412dfffc-8292-4207-b052-bd54c1276c79	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:45:02.259452	2024-11-12 03:46:16.235282	f	0.00	f	f	1	\N
c6c6c242-ee41-401b-a0b2-efc2c51b9a1e	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:45:02.259455	2024-11-12 03:46:19.606475	f	0.00	f	f	1	\N
eb979da2-617b-4a25-a72d-485020b2621c	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b6cb44d6-3f75-4a0a-b57c-3c50f1e52661	t	2024-11-12 03:45:02.259459	2024-11-12 03:46:22.850716	f	0.00	f	f	1	\N
0f0e81f0-2f07-4ee7-bd7b-b4b639ed44d7	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:45:02.259462	2024-11-12 03:46:24.665805	f	0.00	f	f	1	\N
642280c9-7802-45bd-b96d-2bce27f3211a	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:18:43.409517	2024-11-12 04:18:44.936742	t	2.50	f	t	1	\N
00872fb0-201a-4235-b169-3d6e7524f60f	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:18:45.020511	2024-11-12 04:18:45.344874	t	2.50	f	t	1	\N
fd502cc8-e398-4a34-a5a4-9e82227be441	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	ef4a52ab-f606-457c-83ec-fff013b154e1	t	2024-11-12 03:18:44.919266	2024-11-12 04:18:45.799555	t	0.00	f	f	1	\N
edbb1e26-4b16-45b6-9299-fb166db78cd1	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:44.919268	2024-11-12 04:18:45.799558	t	2.50	f	t	1	\N
08f3e02c-286a-4fc0-aa5a-a6f204aab05f	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:18:49.610293	2024-11-12 04:18:50.816578	t	2.50	f	t	1	\N
978c33ea-a5b3-4ab9-aba8-06f776990417	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:19:19.716223	2024-11-12 04:19:21.113277	t	2.50	f	t	1	\N
d6c2aee9-23fe-43ab-ae02-0c0cda36e2b4	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:40.96805	2024-11-12 04:19:41.098095	t	2.50	f	t	1	\N
a43ff0d0-1985-4195-bbc6-f3e6829d50a1	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencarian yang berbentuk aplikasi dan didesain\\n Contohnya :Hewan OR hewan singa\\nCara penggunaan nya mengunakan kata ore","images":[]}	t	2024-11-12 03:19:32.392795	2024-11-12 03:51:36.644433	f	0.00	f	f	1	\N
71379a43-df5d-4108-93f8-ce8a7ee1b481	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0c255dee-e9b3-42d4-b218-ae95d9f7824e	t	2024-11-12 03:45:02.259393	2024-11-12 03:45:24.650583	f	0.00	f	f	1	\N
ff4d1ace-c79d-4727-b23e-2a837bbda372	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"-klik menu compose.maka akan tampil new massage.\\n-pada new massage,terdapat beberapa bagian seperti berikut.\\n1.To\\n2.Bcc\\n3.subject\\n4.compose email\\nIsikan semua bagian pada new massage sesuai dengan kebutuhan\\n","images":[]}	t	2024-11-12 03:20:46.225363	2024-11-12 03:58:04.713421	f	0.00	f	f	1	\N
aca0ee8d-1783-4cb8-9857-b734c5ad7444	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	63fc3c99-f201-45d0-8d16-b8be3d564a26	t	2024-11-12 03:45:02.259415	2024-11-12 03:45:56.987729	f	0.00	f	f	1	\N
28bcfd6f-87ce-45dc-8d94-dee5f93902a4	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	82f8ba76-6d24-470f-9c30-9816892198d5	t	2024-11-12 03:45:02.259402	2024-11-12 03:45:31.160974	f	0.00	f	f	1	\N
17128290-3fad-48ca-8080-db4e46506ea4	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi web browser adalah mencari informasi melalui website atau forum yang disediakan \\nAplikasi website atau forum diantaranya \\n1.Google\\n2.Yahoo","images":[]}	t	2024-11-12 03:19:19.716355	2024-11-12 03:43:19.540731	f	0.00	f	f	1	\N
37a57320-a604-4d54-91bb-38de76c3bc99	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"fungsi dari web browser:\\n1. membuka laman website \\n2. Mendukung permintaan data \\n3. mengumpulkan data dan memaksimalkan tampilan\\n4. memastikan keamanan situs web\\n5. Mendukung penggunaan search engine\\n\\ncontoh dari web browser :\\n• Google chrome\\n• Mozilla Firefox\\n• Microsoft edge.","images":[]}	t	2024-11-12 03:19:40.968152	2024-11-12 03:54:33.378959	f	0.00	f	f	1	\N
84c68afa-ce0d-4be0-b725-562e593aec73	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Merupakan mesin pencari yang terbentuk aplikasi dan desain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi.\\ncontoh: 1. mencari resep minuman sehat ke suatu aplikasi, contohnya youtube. caranya tinggal memperhatikan tutorial nya.","images":[]}	t	2024-11-12 03:18:28.985534	2024-11-12 03:44:05.887292	f	0.00	f	f	1	\N
ca1a3b0b-9942-4998-8b85-e5cabc87b7bd	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:45:02.259382	2024-11-12 03:45:21.66458	f	0.00	f	f	1	\N
c48414a6-ddf1-4ec5-9dd0-05f70c58eb0e	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	t	2024-11-12 03:45:02.259397	2024-11-12 03:45:26.535352	f	0.00	f	f	1	\N
0c850ee8-c1f1-4824-acfe-14be076e48eb	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9d45689b-245d-4632-9f40-e3282070942f	t	2024-11-12 03:45:02.259372	2024-11-12 03:45:12.415009	f	0.00	f	f	1	\N
b0c1564c-e6e9-4fd0-a007-ad993428fd8f	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"web browser merupakan aplikasi yang digunakan untuk mengakses internet \\nRefresh,forward","images":[]}	t	2024-11-12 03:19:22.579225	2024-11-12 03:44:27.798395	f	0.00	f	f	1	\N
bfe90076-2526-475d-aa13-a1d37e468f6b	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine adalah aplikasi pencari yang diperuntukan untuk pengguna yang ingin mencari informasi.\\n\\nsalah satu Contoh dari search engine adalah \\"GOOGLE\\" dan cara penggunaanya adalah \\n- Menggunakan kata kata sederhana\\n- Search by image\\n- Menyimpan gambar\\n- Dan menyimpan halaman","images":[]}	t	2024-11-12 03:19:40.968155	2024-11-12 03:59:59.482216	f	0.00	f	f	1	\N
5afdc472-294b-4d05-9edd-452016a9c983	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose. Maka akan tampil new message. Isikan semua bagian pada new massage sesuai \\n dengankebutuhan. Pastikan alamat email tujuan adalah benar dan jangan lupa gunakan salam pembuka dab salam penutupan pada bagian isi untuk tetap menunjukan etika dalam berkomunikasi. ","images":[]}	t	2024-11-12 03:18:50.770292	2024-11-12 04:17:12.780513	f	0.00	f	f	1	\N
b6250158-5e95-4f43-a6fc-cb3005cfdf93	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"1. Klik menu Compose. Maka akan tampil new message\\n2. Pada new message, terdapat beberapa bagian seperti berikut, To, Cc, Bcc, Subject, Compose email\\n3. Apabila ingin memberikan lampiran, dapat dilakukan dengan klik attach files👉🏻pilih file yang ingin dikirimkan. Ukuran maksimal yang dapat dilampirkan setiap file pa Gmail adalah 25 MB\\n4.setelah semua data selesai diisi, pastikan kembali isi pesan yang ditulis dan file yang dilampirkan telah sesuai. Lalu klik Send, Mak email akan berhasil terkirim dan masuk ke menu Sent.","images":[]}	t	2024-11-12 03:19:32.233946	2024-11-12 03:50:35.369272	f	0.00	f	f	1	\N
b040887f-355f-4855-bec0-8b5ff7d6072b	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"1. Klik compose, maka akan tampil menu New Message\\n2. pada New Message terdapat fitur To, Cc, Bcc, Subject, Dan Compose email \\n3. ingin memberi lampiran klik Attach files lalu pilih file yang ingin dipilih (Maksimal 25 MB)\\n4. Berikut adalah menu menu dari New Message\\n•Formatting Options\\n•Attach Files\\n•Insert link\\n•Insert file\\n•Insert Photo\\n•Insert Emoji\\n•Turn Confindential\\n\\n4. Jika sudah selesai semua klik send","images":[]}	t	2024-11-12 03:19:40.968146	2024-11-12 04:08:41.274366	f	0.00	f	f	1	\N
7e90daaa-3e60-4966-ad32-ac20d52c8a80	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perangkat yang mengoperasikan hardware ","images":[]}	t	2024-11-12 03:19:52.437509	2024-11-12 03:45:09.021332	f	0.00	f	f	1	\N
9cf9108d-8aa5-4fd7-8675-14ee5cfd357a	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:45:02.25941	2024-11-12 03:45:40.456131	f	0.00	f	f	1	\N
eeaef069-8451-430f-a8be-08f2b68119e0	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pertama tama kita harus mengeklik aplikasi email di hp kita lalu kita tekan tombol berbentuk pensil lalu kita tulis kepada siapa kita mengirim pesan dan kirim pesan yang ingin kita sampaikan jika selesai tekan tombol \\" kirim \\" selesai dan tunggu pesan kita terkirim","images":[]}	t	2024-11-12 03:18:28.985526	2024-11-12 03:57:35.038932	f	0.00	f	f	1	\N
b1cd298e-dcbd-4f5d-a7ba-d35f3a114cd8	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:41.225718	2024-11-12 04:19:41.997995	t	2.50	f	t	1	\N
c7ec6d0c-e6f6-4798-91a2-29742e75979c	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2f143c12-59bb-4587-8861-54449d6d791c	t	2024-11-12 03:20:39.710245	2024-11-12 04:20:41.686172	t	0.00	f	f	1	\N
0947797e-94ce-4dab-8cad-b8e54c6a01a3	31d085d2-069f-41a2-b802-71ba97846911	993f10a3-d06a-44ee-95c4-537387bf9a7b	fc3c9dfd-8827-41df-8366-ed852f8a23ec	d33080b0-c84f-4e74-b458-74bcc4fa14da	[["a6a09b0a-db20-43c4-a2af-a461c04fb3cd","2a913011-52e7-4fa3-a8a5-b0739cb00f67"],["cbb38a51-bbe4-441e-8594-0110a9ce0c36","7b8abfff-312f-4300-9d34-3696dfa8e48d"],["4b51b327-dcbc-4051-a7c2-442bb444c9a1","19a27937-47d2-457c-a8f1-8913ade7586d"]]	f	2024-11-12 06:57:00.212484	2024-11-12 06:57:00.212484	f	0.00	f	f	1	\N
3288186c-1ac2-4149-9455-3aabbf3a2af2	31d085d2-069f-41a2-b802-71ba97846911	7ec8cf21-50eb-4e4f-8168-ee8e3e5f6053	fc3c9dfd-8827-41df-8366-ed852f8a23ec	d33080b0-c84f-4e74-b458-74bcc4fa14da	{"20393fdf-e2fa-4085-936d-a83f64cda33d":"","766b10eb-238e-4c7d-99f0-374c1a4f4af9":"","774752ad-251f-4955-b463-43e4d2bbd3b7":"","86d5ee8c-2e06-4fd4-b088-a38e32e70801":"","b550f73f-8c94-4ac2-acfe-af6b5e2fb8bf":""}	f	2024-11-12 06:57:00.212702	2024-11-12 06:57:00.212703	f	0.00	f	f	1	\N
897be3b6-620e-497b-b039-fd42e6fb2cf2	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:10.963731	2024-11-14 06:33:10.963731	f	0.00	f	f	1	\N
07a9e0e8-b723-49ed-8d48-10b8bc6541ee	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:36.025036	2024-11-14 06:29:10.359797	t	2.50	f	t	1	\N
e9b80608-b462-47af-88ef-24729151257a	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"pada awal 1970-an , pengolah kata berkembang menjadi berbasis komputer dengan beberapa inovasi (meski hanya dengan perangkat keras khusus). \\ncontohnya :\\n-Microsoft Word\\n-WordStar \\n-","images":[]}	t	2024-11-12 03:19:15.17435	2024-11-12 03:51:36.613705	f	0.00	f	f	1	\N
2496f8a4-56f0-48df-85d5-0f211d1dc7db	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi web browser:\\nMembuka laman website \\nMendukung permintaan data\\nMengumpulkan data dan memaksimalkan tampilan\\nMemastikan keamanan situs website\\nMendukung penggunaan search engine\\n\\nContoh:\\n1. google\\n2. Yahoo","images":[]}	t	2024-11-12 03:19:58.610673	2024-11-12 03:54:44.777327	f	0.00	f	f	1	\N
88d47b16-3cf7-41b2-8e39-973000fb9979	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Microsoft word Notepad wordpad word start open office ","images":[]}	t	2024-11-12 03:45:02.259666	2024-11-12 03:53:13.299026	f	0.00	f	f	1	\N
db0906cd-ae80-472c-9d10-b8fe03141cca	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi Web browser:\\na. Membuka laman website. \\nb. Mendukung permintaan data. \\nc. Mengumpulkan data dan memaksimalkan tampilan. \\nd. Memastikan keamanan situs web. \\ne. Mendukung penggunaan search engine. \\nContoh Web browser:\\n1.Google\\n2.Google chrome","images":[]}	t	2024-11-12 03:19:26.188723	2024-11-12 04:05:40.207453	f	0.00	f	f	1	\N
15c5c545-e52b-4de0-a0f2-b37b4934a753	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search angine merupakan mesin pencarian yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi\\n\\nContoh:\\nMenggunakan sintaksis OR\\nContoh: hewan OR hewan singa","images":[]}	t	2024-11-12 03:19:58.610665	2024-11-12 04:05:24.130803	f	0.00	f	f	1	\N
99b3b230-fd7c-4af9-9939-99a7abed849c	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	83270c98-fe83-4511-b9f7-b66172a9008f	t	2024-11-12 03:45:02.259422	2024-11-12 03:46:07.08408	f	0.00	f	f	1	\N
8e5a41e9-ca1c-4373-8d25-881e44c3b0d4	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	5a4c987d-6644-42be-9197-295c9d16d1a7	t	2024-11-12 03:45:02.259425	2024-11-12 03:46:12.214098	f	0.00	f	f	1	\N
8d08cd4f-d96d-484e-b182-67afb1dfeb3b	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	fe27c7d7-6f4f-436c-bdef-3695572c7b8d	t	2024-11-12 03:45:02.259465	2024-11-12 03:46:26.928825	f	0.00	f	f	1	\N
d3d2989e-5126-4594-b90e-bdbba88f8eaf	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"klik menu compose. Maka akan tampil New Message, Isikan semua bagian pada New Message sesuai dengan kebutuhan. Pastikan alamat email tujuan adalah benar dan jangan lupa gunakan salam pembuka dan salam penutup, Apabila ingin membuat lampiran , dapat dilakukan dengan klik attach files - pilih file yang dikirimkan. Ukuran maksimal yang dapat dilampirkan setiap file pada Gmail adalah 25mb, setelah semua data telah diisi pastikan kembali isi pesan yang ditulis dan file yang dilampirkan telah selesai. Lalu kilk ","images":[]}	t	2024-11-12 03:19:15.174358	2024-11-12 04:02:12.861286	f	0.00	f	f	1	\N
1bb7033e-ecae-4323-8f34-246ded994783	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Mesin ketik ditemukan oleh salah satu ilmuwan terkenal ia menciptakan mesin ketik jadul yang tidak secanggih sekarang dan mesin ketik pun berubah pada setiap masanya hingga sekarang mesin ketik pun populer dan masih berkembang.","images":[]}	t	2024-11-12 03:18:28.985528	2024-11-12 03:46:30.418214	f	0.00	f	f	1	\N
ab7f113e-8223-4d4d-b29b-98bda9b865bc	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:45:02.259468	2024-11-12 03:46:38.455303	f	0.00	f	f	1	\N
a5655b0b-beee-4e92-97b3-da42b30449c9	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada akhir 1960-an , IBM mengembangkan mesin ketik elektromekanis/elektrik yang disebut IBM MT/ST, pada tahun 1969,kaset tersebut diganti dengan kartu magnetik, pada awal 1970-an, pengolah kata kemudian berkembang menjadi berbasis kompoter dan pada tahun 1980-an diciptakan perangkat lunak pengolah kata","images":[]}	t	2024-11-12 03:19:26.188709	2024-11-12 03:47:36.190304	f	0.00	f	f	1	\N
585a371b-f7e9-41cf-9bd9-add8aa193849	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose.\\nPada New message\\nMengirim ke email lain atau tembusan.","images":[]}	t	2024-11-12 03:45:02.259643	2024-11-12 03:49:08.202525	f	0.00	f	f	1	\N
a2ec422c-6903-4e69-974b-a6cb60cfcd7e	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Web browser terdiri dari dua kata yaitu \\"web\\" Dan \\"browser\\". Web merupakan singkatan dari website yang didefinisikan sebagai halaman situs yang ada di internet. Sedangkan browser memiliki arti alat penjelajah. Sehingga dapat ditarik kesimpulan, qeb browser adalah suatu alat yang di gunakan untuk menjelajahi website\\n\\nContoh:\\n-membuka lama website\\n-mengumpulkan data dan memaksimalkan tampilan\\n ","images":[]}	t	2024-11-12 03:18:50.770296	2024-11-12 04:09:03.823774	f	0.00	f	f	1	\N
54c95888-2935-4b99-b45b-1a1180c2a79d	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Mesin ketik pertama ditemukan oleh Latham Stoles\\nMenciptakan mesin ketik pertama dengan ukuran besar yang digambarkan sebagai Piano sastra,kemudian lahir banyak mesin ketik di seluruh dunia, keberadaannya sangat penting hingga sekarang ","images":[]}	t	2024-11-12 03:19:19.716359	2024-11-12 03:47:25.93547	f	0.00	f	f	1	\N
bd8f9a2c-6d1d-4260-89d6-67d8f245d388	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Seperti microsoft word,notepad,wordpad","images":[]}	t	2024-11-12 03:20:46.225367	2024-11-12 04:04:34.027739	f	0.00	f	f	1	\N
86f4d6d5-8dd8-43ff-a198-b2a339727177	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"•klik menu compose,maka akan tampil new message\\n•pada new message terdapat beberapa bagian.to,cc,bcc,subject,compose email,isikan semua bagian pada new message\\n•apabila ingin memberikan lampiran,dapat dilakukan dengan klik attach files-pilih file yang akan dikirimkan,ukuran maksimal yang dikirimkan 25 mb\\n•klik file yang ingin dilampirkan pada desktop atau folder lalu drag and drop ke isi pesan \\n•lalu klik send,maka email akan berhasil terkirim dan masuk ke menu sent\\n•","images":[]}	t	2024-11-12 03:18:49.610375	2024-11-12 04:07:50.707919	f	0.00	f	f	1	\N
dcf93f46-d465-40b5-b785-7eb183c345a3	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:10.963734	2024-11-14 06:33:10.963734	f	0.00	f	f	1	\N
bbe1cbb2-693f-465a-b977-3a9ba16bb434	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"-membuka laman website \\n-mendukung permintaan data\\n-mengumpulkan data dan memaksimalkan tampilan\\n-memastikan keamanan situs web\\n-mendukung penggunaan search engine, contoh web browser: google, google chrome ","images":[]}	t	2024-11-12 03:19:32.233934	2024-11-12 04:07:38.248362	f	0.00	f	f	1	\N
1ad2eda3-b0c8-4699-865c-1b1e236b6810	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"a.membuka lamanya website\\nb.mendukung permintaan data \\nc.mengumpulkan data dan memaksimalkan tampilan\\nd.memastikan keamanan situs web\\ne.mendukung kegunaan serah ","images":[]}	t	2024-11-12 03:22:36.817418	2024-11-12 04:10:48.267475	f	0.00	f	f	1	\N
e5baac89-b5fd-4c83-ae83-7c9b8fcb820e	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi web browser membuka laman website, mendukung permintaan data, memastikan keamanan situs web, mendukung penggunaan search engine contoh Microsoft edge,dan brainly ","images":[]}	t	2024-11-12 03:18:45.020597	2024-11-12 04:11:35.875515	f	0.00	f	f	1	\N
5942854c-8389-4e08-a8e7-a584362c09cd	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9e469b99-4ccd-4e44-a138-d1ac632f0eb8	t	2024-11-12 03:18:44.919261	2024-11-12 04:18:45.79955	t	0.00	f	f	1	\N
42e3151b-c4a9-49f2-b8e3-dca4965b3128	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.66983	2024-11-14 06:33:17.66983	f	0.00	f	f	1	\N
2075f16e-aa83-407b-89a7-a55f83bf3cf3	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pertama tama kita harus mengklik aplikasi email di hp kita lalu kita tekan tombol berbentuk pensil lalu kita tulis kepada siapa kita mengirim pesan dan kirim pesan yang ingin kita sampaikan jika selesai tekan tombol \\"kirim\\" selesai dan tunggu pesan kita terkirim.","images":[]}	t	2024-11-12 03:18:43.40965	2024-11-12 03:50:07.133499	f	0.00	f	f	1	\N
90ce1607-6976-4208-a019-d54afae34910	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Cara mengirim email sebagai berikut : \\n1.klik menu compose.maka akan tampil new message\\n2.Pada new message terdapat bagian seperti berikut To,CC,Bcc,subject,compose email\\n3.apabila ingin memberikan lampiran, dapat dilakukan dengan klik Attach files pilih file yang ingin dikirimkan \\n4.setelah semua data selesai diisi,pastikan kembali isi pesan yang ditulis dan file yang dilampirkan telah sesuai ","images":[]}	t	2024-11-12 03:19:41.225819	2024-11-12 04:06:20.607906	f	0.00	f	f	1	\N
ef7c39e9-7f1f-41e1-98eb-fd9d41213c80	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu compose maka akan tampil new message pada new message terdapat beberapa bagian seperti berikut To,CC,Bcc,Subject, compose email isikan semua bagian pada new message sesuai dengan kebutuhan ","images":[]}	t	2024-11-12 03:18:45.020592	2024-11-12 03:49:10.863168	f	0.00	f	f	1	\N
44b3ab4c-ec4b-4d6c-bc9d-091e17855e73	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:15.174156	2024-11-12 04:19:15.399251	t	2.50	f	t	1	\N
948fdc63-9ee9-4527-a8fe-154bfb8e8bda	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Serah engine merupakan mesin pencarian yang berbentuk aplikasi dan desain dengan tujuan untuk pengguna internet mendapatkan informasi ","images":[]}	t	2024-11-12 03:22:36.817421	2024-11-12 04:06:45.141757	f	0.00	f	f	1	\N
c2d26b14-3ee6-4db2-87ec-fc39231fbba1	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Sepanjang sejarah . Ada tiga jenis pengolahan kata yaitu mekanik, elektronik, dan perangkat lunak perangkat pengolahan kata pertama yang serupa dengan mesin ketik tik dipatenkan oleh Henry mill untuk mesin yang mampu \\"menulis dengan sangat jelas dan akurat sehingga pengguna tidak dapat membedakan dari mesin cetak \\" pada akhir abad ke-19 Chistopher Latham Sholes menciptakan mesin tik pertama dengan ukuran besar yang digambarkan sebagai \\"piano sastra\\"","images":[]}	t	2024-11-12 03:19:58.610669	2024-11-12 04:14:39.132204	f	0.00	f	f	1	\N
1ca2eac3-9e7d-43cb-881b-096fe9739477	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Klik menu pada compose. Maka akan tampil New Message. Pada New Message akan terdapat bagian seperti berikut\\nTo: untuk mencari alamat email tujuan utama\\nCc: digunakan untuk mengirim email lain atau tembusan\\nBcc: mirip dengan cc, bedanya adalah email tujuan utama tidak mengetahui kepada siap bcc dikirimkan \\nSubject: merupakan identitas dari isi email\\nCompose email: merupakan isi dari email\\nApabila ingin memberikan lampiran dapat dilakukan dengan klik Attach File.\\nSetelah semua data di isi klik Send untuk mengirim","images":[]}	t	2024-11-12 03:19:22.436134	2024-11-12 03:57:32.870135	f	0.00	f	f	1	\N
9d86cb3a-0475-447c-a2c5-6a3777b1276e	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:18:28.985381	2024-11-12 04:18:30.355217	t	2.50	f	t	1	\N
be9eb63c-24b2-4a9b-9890-3f7acd0c97f5	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"membuka laman website,mendukung permintaan data,mengumpulkan data dan memaksimalkan tampilan,mendukung penggunaan search engine\\n\\ncontoh\\nadddres bar dan bookmark\\n","images":[]}	t	2024-11-12 03:18:49.610378	2024-11-12 04:13:26.736165	f	0.00	f	f	1	\N
a25c7e08-3b56-49dc-999a-81a81378246d	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Dapat menghubungkan user kedunia maya untuk mengakses informasi\\nWeb browser memiliki beberapa fungsi .antara lain\\na.membuka laman website \\nb.mendukung pemintaan data","images":[]}	t	2024-11-12 03:20:46.225375	2024-11-12 04:18:11.819679	f	0.00	f	f	1	\N
c684dce3-8de7-43fd-92b2-ec70c9477123	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"  merupakan mesin pencari yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi contoh menyimpan gambar penggunaan menyimpan gambar cara klik gambar yang ingin disimpan, setelah muncul, klik kanan gambar lalu pilih open image in new tab.setelah  itu, gambar akan ditampilkan pada tab baru.tunggu hingga proses loading selesai, lalu klik kanan pada gambar save image as, tentukan letak folder untuk menyimpan gambar","images":[]}	t	2024-11-12 03:20:39.710352	2024-11-12 04:17:08.339789	f	0.00	f	f	1	\N
7b41713f-3800-4a94-9fdc-2f1092f98630	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Fungsi : \\n1.membuka laman website \\n2.mendukung permintaan data \\n3.memastikan keamanan situs web \\n4.mengumpulkam data dan memaksimalkan tampilan \\nContoh web browser : \\ngoogle crome,\\nmozilla,\\nFirefox","images":[]}	t	2024-11-12 03:19:41.225808	2024-11-12 03:57:48.386564	f	0.00	f	f	1	\N
c7856ef6-40a1-450c-9ac8-e440ea20624e	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perkembangan terakir pengolah kata lahir dengan munculnya komputer pribadi\\n Contohnya\\nKomputer\\nHp\\nMesin ketik","images":[]}	t	2024-11-12 03:19:32.392792	2024-11-12 03:49:08.910601	f	0.00	f	f	1	\N
fe9bd626-4106-4cbc-b8b1-cc6792189dd8	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada awalnya Pengolah kata dipaten kan oleh Henry mill Sebagai mesin yang mampu menulis dengan sangat jelas dan akurat.\\nLalu pada Akhir abad 19 Christoper latham sholes menciptakan mesin tik dengan ukuran besar dan digambarkan dengan piano sastra.\\n\\nPada akhir 1960 an IBM Mengembangkan Mesin ketik Elektrik yang disebut IBM MT/ST.\\n\\n\\n\\n","images":[]}	t	2024-11-12 03:19:40.968158	2024-11-12 04:19:10.506406	f	0.00	f	f	1	\N
fee8a6b1-64fc-42c4-b7ee-47e33a09b7bf	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:19:15.174237	2024-11-12 04:19:15.399332	t	2.50	f	t	1	\N
d16c485f-872a-432b-8e97-e4140d81b1d2	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:18:28.985389	2024-11-12 04:18:30.355249	t	0.00	f	f	1	\N
8a056dca-5dbf-4f63-9ce0-8e5f6b1c23c4	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:18:28.985392	2024-11-12 04:18:30.355254	t	2.50	f	t	1	\N
bb8d629c-a08f-439c-b086-3449772e4aab	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:18:28.985409	2024-11-12 04:18:30.355282	t	2.50	f	t	1	\N
a4968957-408d-48dd-99d0-893ac199bc9b	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:18:28.985411	2024-11-12 04:18:30.355289	t	2.50	f	t	1	\N
d6a1850d-9f85-4672-bb9b-73b4191682a2	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pada awalnya mesin pengolah kata dipateni oleh Henry mill untuk mesin yang mampu menulis dengan sangat jelas dan akurat \\nLalu pada kahir abad 19 cristopher latham sholes menciptakan mesin tik pertama dengan ukuran besar,yang digambarkan sebagai ''piano sastra''\\n\\nPada akhir 1960 an IBM mengembangkan mesin ketik elektrik yang disebut IBM MT/ST.","images":[]}	t	2024-11-12 03:19:41.225821	2024-11-12 04:19:19.90184	f	0.00	f	f	1	\N
53297405-6ae4-44e9-80c3-6abade043fb5	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669861	2024-11-14 06:33:17.669861	f	0.00	f	f	1	\N
bec1602b-1ec4-4761-a26e-efff61f1afad	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669864	2024-11-14 06:33:17.669864	f	0.00	f	f	1	\N
12acb2f6-f9a3-4604-a4a8-ce31d14ac667	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:20.001682	2024-11-14 06:29:10.759131	t	2.50	f	t	1	\N
0486ac29-5309-4c00-bd21-9bc29b174921	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669877	2024-11-14 06:33:17.669877	f	0.00	f	f	1	\N
b0dc8c64-b58d-429a-b21a-437b8e3311aa	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"perkembangan terakir pengolah kata lahir dengan munculnya komputer pribadi \\ncontoh nya : komputer   \\n                       HP\\n                       televisi\\n","images":[]}	t	2024-11-12 03:19:47.88405	2024-11-12 03:49:39.636003	f	0.00	f	f	1	\N
dc21c033-ff33-4149-9a80-fa3111a9cdc4	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari informasi  yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan penggunanya dalam mencari informasi. Salah satu contoh Search engine adalah Google. Cara menggunakan Google adalah buka Google dan cari informasi yang di perlukan ","images":[]}	t	2024-11-12 03:19:22.43613	2024-11-12 03:50:05.797238	f	0.00	f	f	1	\N
4bed2972-2c5f-4d02-847f-835a1f4bc3c8	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Perangkat mengolah kata pertama yang serupa dengan mesin ketik dipatenkan oleh henry mill untuk mesin yang mampu \\"menulis dengan sangat jelas dan akurat sehingga pengguna tidak dapat membedakannya dari mesin cetak\\".pada akhir abad ke - 19,christopher latham sholes menciptakan mesin ketik pertama dengan ukuran besar (piano sastra).\\nPada akhir 1960 an,IBM mengembangkan mesin ketik elektromekanis /elektrik yang disebut IBM MT/ST,mesin ini memiliki pembungkus kata otomatis walaupun tidak memiliki layar.pada tahun 1969,kaset tersebut diganti dengan kartu magnetik,kartu magnetik ini mampu merekam pekerjaan penyuntingan yang selanjutnnya dapat dibaca dan disunting.\\nPada awal 1970,pengolah kata kemudian berkembang menjadi berbasis komputer dengan beberapa inovasi.\\nPada tahun 1978,lexiton corporation menjadi perusahaan pertama yang menciptakan komputer dengan pengolah kata dengan layar tampilan video berukuran penuh (CRT)","images":[]}	t	2024-11-12 03:18:50.582492	2024-11-12 03:51:08.103381	f	0.00	f	f	1	\N
5f60ca6b-0248-43a8-98a9-bcb9f718778d	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Pengolah kata adalah perangkat lunak yang memiliki fitur yang kompleks dan dapat dikembangkan dengan harga murah.\\nContoh:Microsoft Word,Notepad,WordStar.","images":[]}	t	2024-11-12 03:18:43.409656	2024-11-12 03:57:05.914166	f	0.00	f	f	1	\N
26ab5cc3-30f7-4af2-9247-0bcff5625356	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Search engine merupakan mesin pencari yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi. Contoh search engine adalah google.","images":[]}	t	2024-11-12 03:19:32.233949	2024-11-12 03:55:17.697122	f	0.00	f	f	1	\N
568bb12f-d008-46c3-a74a-2285a308b73b	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"perangkat mengolah kata pertama yang serupa dengan mesin tik dipatenkan oleh henry mill untuk mesin yang mampu\\"menulis dengan sangat jelas dan akurat sehingga pengguna tidak dapat membedakan nya dari mesin cetak\\"\\npada akhir 1960 an,IBM mengembangkan mesin ketik elektromekanis/elektrik yang disebut fasilitas perekaman dan pemutaran pita kaset magnetik,pengendalian, dan kumpulan relay listrik.Mesin ini memiliki pembungkus kata otomatis walaupun tidak memiliki layar.pada tahun 1969,kaset tersebut diganti dengan kartu magnetik.\\nperkembangan terakhir pengolah kata lahir dengan munculnya komputer pribadi (pc) pada akhir 1970 an dan dengan penciptaan perangkat lunak pengolah kata pada tahun 1980 an.perangkat lunak pengolah kata tersebut memiliki fitur yang kompleks dan dapat di kembangkan dengan harga yang murah.sekarang ini,terdapat beberapa perangkat lunak pengolah kata yang dikenal,seperti Microsoft word,notepad,wordPad,open office dan sebaginya.","images":[]}	t	2024-11-12 03:18:49.610366	2024-11-12 03:49:37.461629	f	0.00	f	f	1	\N
126193f8-5343-49cb-abe2-313bac238b2e	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"search engine merupakan mesin pencari yang berbentuk aplikasi dan di desain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi.\\nmelakukan penelusuran search engine harus menggunakan pilihan kata sederhana untuk kata kunci (keyword).\\n\\n","images":[]}	t	2024-11-12 03:18:49.610369	2024-11-12 03:54:17.825587	f	0.00	f	f	1	\N
73ccca94-5158-46f0-b0db-a1c834d6b37f	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"A.Klik menu Compose. \\nB.Pada New Message, terdapat beberapa bagian seperti berikut. \\n1) To\\n2) Cc\\n3) Bcc\\n4) Subject\\n5) Compose email\\nC. Apabila ingin memberikan lampiran, dapat dilakukan dengan klik Attach files - pilih file yang ingin dikirimkan. Ukuran maksimal yang dapat dilampirkan setiap file pada Gmail adalah 25 Mb. \\nD. Setelah semua data selesai diisi, pastikan kembali isi pesan yang ditulis dan file yang dilampirkan telah sesuai. Lalu klik Send, maka email akan berhasil terkirim dan masuk ke menu Sent. ","images":[]}	t	2024-11-12 03:19:26.188716	2024-11-12 03:57:57.894129	f	0.00	f	f	1	\N
880402ae-04f9-4705-b5d2-44a9d03f2966	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Membuka laman wibsite, mendukung permintaan data, mengumpulkan data dan memaksimalkan tampilan, memastikan keamanan situs web ,contoh:email dan crhome","images":[]}	t	2024-11-12 03:20:39.710383	2024-11-12 04:08:12.238627	f	0.00	f	f	1	\N
daeb68d4-7a63-486e-bff2-e63a596b69fb	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Yaitu seperti teman yang tau segalanya\\nContoh :\\nGoogle\\nYahoo\\n","images":[]}	t	2024-11-12 03:19:52.437516	2024-11-12 03:50:17.997811	f	0.00	f	f	1	\N
ddedba5a-93c4-401e-b5e0-7de2e03d9196	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"1.klik menu compose maka akan tampil New Message\\n2.pada New Message terdapat beberapa bagian seperti berikut\\n1)TO : digunakan untuk alamat email tujuan utama\\n2)CC :merupakan kepanjangan dari carbon copy yang dapat digunakan untuk mengirim ke email lain atau tembusan\\n3)Bcc : Bcc kepanjangan dari Blind Carbon copy yang mirip dengan Cc.\\n4)Subject : merupakan identitas dari isi email contoh adalah apabila anda mengirim tugas maka dapat di beri subject \\"Project 1 kelompok 5\\"\\n5)Compose email : merupakan isi dari email biasanya pada bagian ini berisikan salam pembuka isi dan salam penutupan ","images":[]}	t	2024-11-12 03:19:22.579229	2024-11-12 03:57:54.234178	f	0.00	f	f	1	\N
ce08bd21-2697-4bbf-95ee-fe192a0dd819	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"a.klik menu compose. maka akan tampil new message. \\nb. pada new message, terdapat beberapa bagian seperti berikut\\nc. apabila ingin memberikan lampiran, dapat dilakukan dengan pilih file yang ingin dikirimkan\\nd. setelah semua data selesai diisi, pastikan kembali isi pesan yang di tulis dan file yang dilampirkan teladan ","images":[]}	t	2024-11-12 03:19:47.884058	2024-11-12 03:57:19.83386	f	0.00	f	f	1	\N
18eb1529-110b-4ea9-a7e0-9e925a4e9332	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"-membuka laman website \\n-memdukung permintaan data ","images":[]}	t	2024-11-12 03:45:02.259652	2024-11-12 03:50:26.545398	f	0.00	f	f	1	\N
974a42ff-261c-447d-80e7-a6f4e6b10b60	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"search engine merupakan mesin pencarian yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi","images":[]}	t	2024-11-12 03:19:22.579233	2024-11-12 04:00:24.273647	f	0.00	f	f	1	\N
5ccd0ba5-0a3a-407d-ac46-e821bff6ab7b	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"search engine merupakan mesin pencari yang berbentuk aplikasi dan didesain dengan tujuan untuk memudahkan pengguna internet mendapatkan informasi","images":[]}	t	2024-11-12 03:19:51.979935	2024-11-12 04:00:13.670902	f	0.00	f	f	1	\N
ac5632e6-af02-4ded-8da5-c08411a9b67d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	6b750f52-b5e9-4e1c-a131-b4969b8cb3a1	t	2024-11-14 01:17:20.001711	2024-11-14 06:29:10.759181	t	0.00	f	f	1	\N
48fd3a49-f161-4f2d-98f8-732aefbca2c3	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:18:49.610271	2024-11-12 04:18:50.816515	t	2.50	f	t	1	\N
41944561-62f9-492f-a745-c24319666aa1	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:50.582321	2024-11-12 04:18:51.453061	t	2.50	f	t	1	\N
87f4b1b1-4d2e-4ec6-ae39-b522327bf547	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:18:50.582323	2024-11-12 04:18:51.453065	t	2.50	f	t	1	\N
3c924e9c-a252-4172-820d-0a8873f28971	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:18:50.582326	2024-11-12 04:18:51.45307	t	2.50	f	t	1	\N
3efd1f4f-019e-40f5-8d9e-556471a20178	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:18:50.582329	2024-11-12 04:18:51.453074	t	0.00	f	f	1	\N
41d955af-7369-4843-a11f-ac15a6c711b5	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:18:50.58235	2024-11-12 04:18:51.453118	t	0.00	f	f	1	\N
2776a830-6a5c-4eed-a50d-83e873ee7ebc	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:18:50.582352	2024-11-12 04:18:51.453124	t	2.50	f	t	1	\N
93656857-df67-4c3f-98f5-9e7f88a9be3e	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:18:50.582358	2024-11-12 04:18:51.453133	t	2.50	f	t	1	\N
665f7ea1-bed1-404e-8a1f-4b98cd0f7752	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	35dbf16e-a6a0-49fa-8144-78aa9b7ca560	t	2024-11-12 03:18:50.582361	2024-11-12 04:18:51.453138	t	0.00	f	f	1	\N
3d7a6f66-82fe-44a6-b676-9cc690126dfb	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669881	2024-11-14 06:33:17.669881	f	0.00	f	f	1	\N
b6dfd8db-d591-4b5a-bdbc-182421430b60	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:18:50.770179	2024-11-12 04:18:51.725874	t	0.00	f	f	1	\N
728ac5bc-81c3-448e-a6c8-2ef70e8a04f8	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:18:50.770182	2024-11-12 04:18:51.725877	t	0.00	f	f	1	\N
a9ac14c9-2ef3-46a8-ba86-f91b7d89beb8	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	d64588f4-1bab-47ee-97b6-1cf3a0919c0c	t	2024-11-12 03:18:50.770185	2024-11-12 04:18:51.725881	t	0.00	f	f	1	\N
0d128399-3320-43c6-85c9-b5a050784798	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:18:50.770189	2024-11-12 04:18:51.725883	t	2.50	f	t	1	\N
d800a624-1132-4d65-9ae0-f99fe2f3b33d	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669884	2024-11-14 06:33:17.669884	f	0.00	f	f	1	\N
78a602e6-8905-4413-90ee-dda01e258c31	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669887	2024-11-14 06:33:17.669887	f	0.00	f	f	1	\N
8cb33dc5-bfc8-4d12-9104-f8e228d626dd	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669892	2024-11-14 06:33:17.669892	f	0.00	f	f	1	\N
ba553537-9605-43a4-b30c-c3a80546641b	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:22.500353	2024-11-14 06:29:10.397545	t	0.00	f	f	1	\N
402615c0-c7a4-437e-9e8d-2545e7f1d682	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:22.500358	2024-11-14 06:29:10.397548	t	0.00	f	f	1	\N
d2b43e2f-e789-4852-9f5a-2d7aa6a89d41	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669895	2024-11-14 06:33:17.669895	f	0.00	f	f	1	\N
8d794c76-0f8c-4bf8-a8a0-dbe52443accd	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669898	2024-11-14 06:33:17.669898	f	0.00	f	f	1	\N
dc7e4fd4-5f49-484a-b56f-4378cb2a5912	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	{"text":"Contoh:\\n1. Whatsap\\n2. Google\\n3. Instagram","images":[]}	t	2024-11-12 03:19:58.610676	2024-11-12 04:19:16.553881	f	0.00	f	f	1	\N
a1777028-a1ba-4e11-a65c-e8d172412bf8	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:19.716204	2024-11-12 04:19:21.113236	t	2.50	f	t	1	\N
2a09ad88-be67-4176-a1af-9ded318728a9	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9e469b99-4ccd-4e44-a138-d1ac632f0eb8	t	2024-11-12 03:19:19.716207	2024-11-12 04:19:21.11324	t	0.00	f	f	1	\N
80396bf0-0322-4729-984a-f11594749a41	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:19.716209	2024-11-12 04:19:21.113244	t	2.50	f	t	1	\N
db662ae6-365e-4a0e-99ef-4e83400084e8	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:19.716212	2024-11-12 04:19:21.113248	t	2.50	f	t	1	\N
ad56f286-2483-4c0c-b48a-b18624228e92	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:19.716216	2024-11-12 04:19:21.113265	t	0.00	f	f	1	\N
740053df-a2b5-42ac-9e3d-d45ff09f7275	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:22.500361	2024-11-14 06:29:10.397551	t	2.50	f	t	1	\N
bf5908fa-0528-4c16-a648-6e848e564699	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Menjalankan aplikasi yang lebih besar","images":[]}	t	2024-11-14 01:17:20.001854	2024-11-14 02:04:54.560591	f	0.00	f	f	1	\N
f424abdf-80d8-45e2-b46d-f22bbc7bccf2	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:45.178306	2024-11-14 06:29:10.63285	t	2.50	f	t	1	\N
73b842d9-f1dd-4885-8aa5-16695dacb08d	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU: memproses sinyal, RAM: sebagai tempat penyimpanan data, Motherboard: sebagai distributor daya dan penghubung segala jenis komponen, Hard disk: sebagai tempat penyimpanan data, Kartu grafis: menghasilkan umpan gambar","images":[]}	t	2024-11-14 01:17:20.001841	2024-11-14 02:03:52.519521	f	0.00	f	f	1	\N
d776f6e3-6732-498e-b442-fb1819c3c9c3	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Kumpulan perangkat lunak dan keras yang saling berinteraksi ","images":[]}	t	2024-11-14 01:17:20.001844	2024-11-14 02:06:44.900349	f	0.00	f	f	1	\N
10e86d44-44bd-4d4f-8f94-bab96b054bcb	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras ialah peralatan komputer (monitor, keyboard, dll) dan perangkat lunak adalah program yang berisi perintah","images":[]}	t	2024-11-14 01:17:20.001846	2024-11-14 02:06:24.420661	f	0.00	f	f	1	\N
c81e69e5-3923-4160-8510-22af53f09f7b	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sebagai kordinator yang memberikan fasilitas ","images":[]}	t	2024-11-14 01:17:20.001857	2024-11-14 02:07:30.786639	f	0.00	f	f	1	\N
eb5bcf7d-4a54-418f-8b68-a6010aaa832a	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:37.561931	2024-11-14 06:29:10.664349	t	0.00	f	f	1	\N
9348ed39-59e6-4f7c-9b52-e423362dff52	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:37.561933	2024-11-14 06:29:10.664353	t	2.50	f	t	1	\N
7a00d499-a612-4134-a21f-022d5f362b99	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	1ac8c25b-0faa-4535-bc05-83adea481c2f	t	2024-11-14 01:17:37.561936	2024-11-14 06:29:10.664357	t	0.00	f	f	1	\N
8a1c3f32-8929-42cb-96e8-f4479f3f45ce	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:37.561938	2024-11-14 06:29:10.664362	t	2.50	f	t	1	\N
978164c0-255b-4638-b035-a3455a523131	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:37.561941	2024-11-14 06:29:10.664378	t	0.00	f	f	1	\N
1fbcbcd7-a05f-4a6c-9741-e784cbcfe315	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:20.001714	2024-11-14 06:29:10.759185	t	2.50	f	t	1	\N
6f3b1917-76fe-4723-a835-2a43acdda012	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:20.001716	2024-11-14 06:29:10.759191	t	2.50	f	t	1	\N
be429bd4-afd4-4a2c-a13a-527ac7188b57	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	a045847b-f0c1-4b42-a081-2c5d6bbe8135	t	2024-11-12 03:19:19.716219	2024-11-12 04:19:21.113269	t	0.00	f	f	1	\N
5e9f8b0a-bf83-4fab-affe-242cdf0d2789	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:19.716221	2024-11-12 04:19:21.113274	t	2.50	f	t	1	\N
39eaf453-959c-473e-a7d4-bc1e4ba6d674	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b0a79a05-a3de-4ccb-b214-84002a408d6e	t	2024-11-12 03:19:19.716226	2024-11-12 04:19:21.113307	t	0.00	f	f	1	\N
6f672276-968c-4331-8f8f-d83c9d549a1f	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	edf0eeba-1fb0-43fe-83bb-4740f82cf097	t	2024-11-12 03:19:19.716228	2024-11-12 04:19:21.113311	t	0.00	f	f	1	\N
4e2ed877-f839-43ca-b86f-80581649783d	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:22.579091	2024-11-12 04:19:23.384597	t	0.00	f	f	1	\N
b9f613e9-963a-4b83-aef2-cf9d890e9c24	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	35dbf16e-a6a0-49fa-8144-78aa9b7ca560	t	2024-11-12 03:19:22.579102	2024-11-12 04:19:23.384608	t	0.00	f	f	1	\N
3bef7b71-3f31-4bc5-a931-8e788f256e02	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9b851902-24b4-4081-8f6e-04143fc855eb	t	2024-11-12 03:19:22.579106	2024-11-12 04:19:23.384613	t	0.00	f	f	1	\N
2ebd0807-ebc7-4cc0-b82b-d4e7df2561f4	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:19:22.579109	2024-11-12 04:19:23.384617	t	2.50	f	t	1	\N
e373efda-b621-46ba-afa5-23c22fbf0dfc	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:22.579112	2024-11-12 04:19:23.384622	t	0.00	f	f	1	\N
ae927166-abde-4393-b416-7bc065c36f97	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:22.579121	2024-11-12 04:19:23.38468	t	2.50	f	t	1	\N
944e3056-8eb4-4333-8c91-595631a7c10b	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:19:22.579125	2024-11-12 04:19:23.384686	t	0.00	f	f	1	\N
6d2e024c-56d1-47cb-86db-99f9f1d67557	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0c255dee-e9b3-42d4-b218-ae95d9f7824e	t	2024-11-12 03:19:22.579128	2024-11-12 04:19:23.384691	t	0.00	f	f	1	\N
62b575d3-5dbb-4033-b416-c022659c7f36	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	t	2024-11-12 03:19:22.579132	2024-11-12 04:19:23.384695	t	0.00	f	f	1	\N
c6612d3c-1162-47bf-bcfe-f181d0bd6cd6	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:22.579135	2024-11-12 04:19:23.3847	t	2.50	f	t	1	\N
1c63afa5-dd38-48bb-bf60-d5433b6b97f3	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:19:26.188634	2024-11-12 04:19:26.364214	t	2.50	f	t	1	\N
98cca5bd-0220-4128-baa4-ba1559495f14	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:26.188637	2024-11-12 04:19:26.364219	t	0.00	f	f	1	\N
081b4ca2-4f5d-4951-ab3c-a7594cff612c	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:32.39257	2024-11-12 04:19:32.249041	t	0.00	f	f	1	\N
fd3150d4-9998-471c-bf86-8bc564adb759	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	b438680b-0944-497c-b580-5a6deaa147fc	t	2024-11-12 03:19:32.392592	2024-11-12 04:19:32.249045	t	0.00	f	f	1	\N
2f403e41-1318-4162-bc56-1c3d304215c1	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:19:32.392599	2024-11-12 04:19:32.249051	t	0.00	f	f	1	\N
24644658-259a-4c4c-93fa-dda81e780968	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	t	2024-11-12 03:19:32.392605	2024-11-12 04:19:32.249061	t	0.00	f	f	1	\N
9f1a654a-1052-4657-8aa9-1b8080362391	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e8558c-f76c-44dd-8377-9a4a968edf1f	t	2024-11-12 03:19:32.392622	2024-11-12 04:19:32.249076	t	2.50	f	t	1	\N
619c4a79-ac65-4496-a592-972d35692047	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:32.392627	2024-11-12 04:19:32.249081	t	2.50	f	t	1	\N
3180cfce-3d94-46c6-89b3-c33bcdec1d46	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	t	2024-11-12 03:19:32.39263	2024-11-12 04:19:32.249084	t	0.00	f	f	1	\N
143af3a5-c7e3-4a84-8814-6a4a0cc4b8b3	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:32.392632	2024-11-12 04:19:32.249089	t	2.50	f	t	1	\N
6a408e45-ef3c-4b0c-901f-f60431af5f65	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:32.392642	2024-11-12 04:19:32.249094	t	2.50	f	t	1	\N
1018191c-b98c-490c-8516-98fa71c70a75	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:32.392645	2024-11-12 04:19:32.249104	t	2.50	f	t	1	\N
f97afa59-4232-4930-8b8d-64b72951384a	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:32.233828	2024-11-12 04:19:32.50199	t	0.00	f	f	1	\N
913a4fe6-731e-4917-b4f8-a7f7cca80bbe	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f9f11673-4d5e-4af5-857d-5a6ea9259b04	t	2024-11-12 03:19:40.968047	2024-11-12 04:19:41.09809	t	2.50	f	t	1	\N
c5ec8e93-f365-4674-9c55-5b1284d76086	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	83270c98-fe83-4511-b9f7-b66172a9008f	t	2024-11-12 03:19:40.968053	2024-11-12 04:19:41.0981	t	0.00	f	f	1	\N
7dc52a6d-dbbb-4284-967a-c46628b2b4b4	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:40.96806	2024-11-12 04:19:41.098126	t	2.50	f	t	1	\N
4d85cbdc-66a1-4649-8824-eeefd8cd2f2f	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	45f2dc7f-a6cf-44b4-b5a2-2b8c8f8346ab	t	2024-11-12 03:19:40.968063	2024-11-12 04:19:41.098131	t	0.00	f	f	1	\N
c6178798-56d9-4fb3-b0c5-96569fb67ed8	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:40.968066	2024-11-12 04:19:41.098139	t	2.50	f	t	1	\N
6cf49d90-e846-4d63-8882-5fb830c601f5	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	670f08b7-5452-47de-a3e6-4e34877966de	t	2024-11-12 03:19:40.968069	2024-11-12 04:19:41.098144	t	2.50	f	t	1	\N
51833074-f326-4184-b9a9-8b45669dfa9e	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:40.968072	2024-11-12 04:19:41.098149	t	2.50	f	t	1	\N
c6432785-755a-42e9-80e8-450f04a44d1f	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:40.968076	2024-11-12 04:19:41.098153	t	2.50	f	t	1	\N
005d4854-c3dd-4071-8aeb-7c0e5274bc27	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669901	2024-11-14 06:33:17.669901	f	0.00	f	f	1	\N
05ccca2d-1969-4fde-97b5-f6f530706667	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669904	2024-11-14 06:33:17.669904	f	0.00	f	f	1	\N
24fe825c-b1e2-425d-81ca-52c47c8366e3	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2f143c12-59bb-4587-8861-54449d6d791c	t	2024-11-12 03:19:51.97978	2024-11-12 04:19:53.190317	t	0.00	t	f	1	\N
f13b4186-58de-4988-8ec1-75f0eb3ccd56	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:51.979785	2024-11-12 04:19:53.190341	t	0.00	f	f	1	\N
7c69fe74-6461-4e78-b15c-ecb4a31016a5	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	f4ea4f74-2261-4844-9a9e-58e5d2a873b0	t	2024-11-12 03:19:51.979788	2024-11-12 04:19:53.190347	t	2.50	t	t	1	\N
aeb50072-f9b1-4441-9eb5-69795501c9b2	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:51.979791	2024-11-12 04:19:53.190371	t	2.50	f	t	1	\N
bba24cb1-fc13-4419-bd8a-a300a98eac9a	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:19:51.979795	2024-11-12 04:19:53.190378	t	2.50	t	t	1	\N
9ccae445-afaf-4839-8701-b207100f8b02	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	3e627461-7f7c-49bd-acdf-0e6c68d46d93	t	2024-11-12 03:19:51.979798	2024-11-12 04:19:53.19039	t	0.00	f	f	1	\N
75140452-f605-46fb-80f8-72432c0f6a78	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:51.979801	2024-11-12 04:19:53.190395	t	2.50	f	t	1	\N
d1c1dfb2-d6e5-457d-8f85-a100ca7836b3	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	42ecfb6a-2712-4401-aa51-cd7f3c489c9e	t	2024-11-12 03:19:51.979804	2024-11-12 04:19:53.190418	t	0.00	f	f	1	\N
19493450-4e39-49a0-a28e-42caf5a63ce9	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:51.979817	2024-11-12 04:19:53.194549	t	2.50	f	t	1	\N
860620df-99ec-41f4-bdaa-811f2e927fe9	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	9d45689b-245d-4632-9f40-e3282070942f	t	2024-11-12 03:19:51.979823	2024-11-12 04:19:53.194561	t	0.00	f	f	1	\N
7f78dd97-7be3-4e1b-9204-b4f2150319c0	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	t	2024-11-12 03:19:51.979826	2024-11-12 04:19:53.194566	t	0.00	f	f	1	\N
a31b27ff-d232-491f-9fd8-4e60b1546942	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:51.979829	2024-11-12 04:19:53.194617	t	2.50	t	t	1	\N
02ea8f3d-ddc5-49c5-8736-7b7a5c8d00d6	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	39ef06d0-26dc-4ceb-99c2-42e53df046c3	t	2024-11-12 03:19:51.979832	2024-11-12 04:19:53.194623	t	0.00	t	f	1	\N
e6e842f3-9e6f-43d4-915b-dc6d29bcf817	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	0f7ee069-aa5a-43bf-8b77-f704815af81f	t	2024-11-12 03:19:52.437319	2024-11-12 04:19:53.706821	t	2.50	f	t	1	\N
5b0a8bba-d1a5-4691-9c58-584377677e54	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6603bfb3-e5b0-4282-8f93-5c977ad22dae	t	2024-11-12 03:19:52.437323	2024-11-12 04:19:53.706853	t	0.00	f	f	1	\N
2b6229d4-a5e5-486d-9545-8c8caf39ce93	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	97e72bf1-135c-4d75-82dd-f6b1ac7ea598	t	2024-11-12 03:19:52.437327	2024-11-12 04:19:53.706856	t	0.00	f	f	1	\N
32783d67-f4f6-4cde-8881-7f7cc7e4b87d	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	bf741452-9a2c-429a-b618-5790218c4771	t	2024-11-12 03:19:52.437342	2024-11-12 04:19:53.706861	t	2.50	f	t	1	\N
af0a8a83-920d-4e87-bdf6-cac28402161d	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2d7e5f31-3baa-4d55-91ae-6e64eb989041	t	2024-11-12 03:19:52.437345	2024-11-12 04:19:53.706865	t	2.50	f	t	1	\N
33d2ef07-2f41-4f6b-ae06-ef6ab6afdd48	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	64739596-1fff-4017-af30-940ce0154a2a	t	2024-11-12 03:19:52.437348	2024-11-12 04:19:53.706868	t	2.50	f	t	1	\N
1f09b0b3-ea4a-4824-8d6f-5b4617387b1d	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2906dd74-eeb5-4e27-8363-38d26ad3db7f	t	2024-11-12 03:19:52.437351	2024-11-12 04:19:53.70687	t	2.50	f	t	1	\N
1a1649da-f998-4567-a320-5e0b4c36a3e5	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:52.437402	2024-11-12 04:19:53.706878	t	2.50	f	t	1	\N
92f99491-d476-4088-bd91-cf9e8defa0c7	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6257d55e-fa36-43d9-86d0-8247708c6f99	t	2024-11-12 03:19:52.437405	2024-11-12 04:19:53.706882	t	0.00	f	f	1	\N
a9b9f2cf-afb4-4675-a1e3-d4eb957810dd	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	t	2024-11-12 03:19:52.437408	2024-11-12 04:19:53.706884	t	0.00	f	f	1	\N
2d8aaff6-2705-49f9-855b-61aeddef2226	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	29d1a10b-3024-41d7-80a8-c6ce33522f00	t	2024-11-12 03:19:52.437411	2024-11-12 04:19:53.706887	t	2.50	f	t	1	\N
9b309ad0-3d67-4f8f-b66b-4ec77aaa1856	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	c0bb4619-6194-484c-83d3-6c23d000c2cf	t	2024-11-12 03:19:52.437414	2024-11-12 04:19:53.706889	t	2.50	f	t	1	\N
2958423b-b17d-4f52-90af-121e9b4dc8ba	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	6c00ac09-beaf-4f38-b704-3e796f0339d9	t	2024-11-12 03:19:52.437417	2024-11-12 04:19:53.706892	t	2.50	f	t	1	\N
e03af4b8-cf3e-4ea2-9580-f0a30581f660	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	79af07fa-680f-4b9d-93f0-f2709d4b49dd	t	2024-11-12 03:19:58.610498	2024-11-12 04:19:59.502727	t	2.50	f	t	1	\N
b667fa68-445b-4dae-9ca4-d25d71ed596a	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:17.669906	2024-11-14 06:33:17.669906	f	0.00	f	f	1	\N
9438bfe4-dcd5-48cf-b756-83a67ee49c16	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem operasi dalam komputer untuk menjalankan sebuah program dan fungsi dalam komputer menjalankan program yang berasal di dalam komputer ","images":[]}	t	2024-11-14 01:17:22.500482	2024-11-14 01:50:52.225703	f	0.00	f	f	1	\N
03b42a5a-b5a3-4cfa-8246-741e20d8e1a8	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:35.753651	2024-11-14 06:29:10.928672	t	2.50	f	t	1	\N
bcb29c5c-bdd1-422c-bbab-e47c82ba0b22	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:35.063108	2024-11-14 06:29:10.163162	t	2.50	f	t	1	\N
d2be3e6f-a7be-4f74-8997-bd84a61ebacf	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Untuk melindungi berbagai sistem dari virus","images":[]}	t	2024-11-14 01:17:35.957307	2024-11-14 01:49:53.096174	f	0.00	f	f	1	\N
2fb08500-8767-4b28-8f3c-8f03c77760c4	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:17.669971	2024-11-14 06:33:17.669971	f	0.00	f	f	1	\N
efdc7eaf-b38c-4fb1-b5cc-f0e3bab3bd64	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:17.669977	2024-11-14 06:33:17.669978	f	0.00	f	f	1	\N
5cf25728-17ec-4b83-abf8-e43c542fc26f	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:35.063111	2024-11-14 06:29:10.163165	t	2.50	f	t	1	\N
3fb10cc2-23b1-413a-b833-1f8518900dd4	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:17.66998	2024-11-14 06:33:17.669981	f	0.00	f	f	1	\N
e536a89b-d8a4-4750-b4b6-f93db2743294	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:17.669983	2024-11-14 06:33:17.669984	f	0.00	f	f	1	\N
bc253899-3404-41af-a117-1373cf66fa97	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:50.375212	2024-11-14 06:29:10.243121	t	0.00	f	f	1	\N
b093cd1c-b589-4368-93ba-99bd2cd2554b	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:50.375215	2024-11-14 06:29:10.243125	t	2.50	f	t	1	\N
f6aeeccb-1524-4e35-80c9-71f36aae2f0f	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:50.375218	2024-11-14 06:29:10.24313	t	2.50	f	t	1	\N
b6737b1a-a5cf-4649-95a7-74302046b811	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:50.37522	2024-11-14 06:29:10.243163	t	2.50	f	t	1	\N
54a2b680-d4b9-46bd-8161-95ef50f4e142	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	t	2024-11-14 01:17:50.375223	2024-11-14 06:29:10.243168	t	0.00	f	f	1	\N
e5111144-fce0-4001-a8a0-1e63b2709b1d	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:20.001646	2024-11-14 06:29:10.759105	t	2.50	f	t	1	\N
8c81189d-6bea-40ae-b939-ba7df112448c	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:35.753656	2024-11-14 06:29:10.928677	t	2.50	f	t	1	\N
1bfebfe3-450f-49ea-9301-655c56e4f290	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat lunak dan keras\\n","images":[]}	t	2024-11-14 01:17:35.063241	2024-11-14 01:32:01.816481	f	0.00	f	f	1	\N
de70e5c9-cdc2-4a88-a853-37e49a92102f	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"cpu untuk menjalankan sistem komputer\\nram menyimpan data secara permanen\\n","images":[]}	t	2024-11-14 01:17:35.06325	2024-11-14 01:41:15.543025	f	0.00	f	f	1	\N
1f5b4a3f-c911-465f-96e8-2d4422e815a4	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hardware bisa di pegang mouse keyboard dan monitor\\nsoft ware tidak bisa di pegang Windows ios ","images":[]}	t	2024-11-14 01:17:35.063244	2024-11-14 01:33:15.089012	f	0.00	f	f	1	\N
be6420e9-9df2-422b-a596-7e219f881299	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"virtual memory bekerja sebagai memory fisik tambahan, fungsi ini juga meningkatkan kan kinerja sistem komputer dikarenakan adanya penyimpanan tambahan ketika RAM ","images":[]}	t	2024-11-14 01:17:37.009559	2024-11-14 01:48:58.135938	f	0.00	f	f	1	\N
a80159ba-8400-4ea6-81d4-334928b99421	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:17.669986	2024-11-14 06:33:17.669986	f	0.00	f	f	1	\N
9815e587-5e40-4dda-bc77-f8ba91b0f500	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421007	2024-11-14 06:33:22.421007	f	0.00	f	f	1	\N
6323afe5-4b28-4e49-ace2-b18e76933969	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421012	2024-11-14 06:33:22.421012	f	0.00	f	f	1	\N
0923df2f-a064-409f-84d2-aef624bfc85e	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421017	2024-11-14 06:33:22.421017	f	0.00	f	f	1	\N
30244d83-99d9-4a20-b8e0-d7b7e3bcee1e	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware=komponen pada komputer yang Dapat dipegang\\nContohnya= VGA mouse keyboard monitor\\nSoftware= Sistem operasi yang mengontrol komputer\\nContohnya= Linux MacOS Windows DOS\\n\\n","images":[]}	t	2024-11-14 01:17:36.254976	2024-11-14 01:58:46.348008	f	0.00	f	f	1	\N
00370b00-3a4a-49ea-9421-c36cf0f0a306	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:37.009421	2024-11-14 06:29:10.961434	t	2.50	f	t	1	\N
1ff9e431-46b2-42f3-ab23-345da62324f7	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421021	2024-11-14 06:33:22.421021	f	0.00	f	f	1	\N
6df1f461-3adc-4cca-a198-3cd51dab2094	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421024	2024-11-14 06:33:22.421024	f	0.00	f	f	1	\N
ad845df1-7052-4309-be18-3b2865d07ff9	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421028	2024-11-14 06:33:22.421028	f	0.00	f	f	1	\N
62d48125-093e-478b-929a-f333335e8e29	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421032	2024-11-14 06:33:22.421032	f	0.00	f	f	1	\N
8e00ad86-b4a1-423c-9649-0b2562011c31	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421035	2024-11-14 06:33:22.421035	f	0.00	f	f	1	\N
6053b8bd-f074-48d1-a376-1bd7aed3f0ca	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421038	2024-11-14 06:33:22.421038	f	0.00	f	f	1	\N
a5e0397a-c7f9-4aa3-9a05-b4258b79b6b7	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421067	2024-11-14 06:33:22.421067	f	0.00	f	f	1	\N
7b4ac629-5241-443e-bcac-5b17ceaea8f2	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.42107	2024-11-14 06:33:22.42107	f	0.00	f	f	1	\N
c60b07d2-a377-4682-9aaa-5d1eebe054e5	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421072	2024-11-14 06:33:22.421073	f	0.00	f	f	1	\N
6a2838f5-efb2-4a4e-ab0d-61b2374b6d59	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421075	2024-11-14 06:33:22.421075	f	0.00	f	f	1	\N
4fc111a4-4d22-4a14-a3af-d81cc0cb7c28	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:37.009427	2024-11-14 06:29:10.961466	t	2.50	f	t	1	\N
da7781c9-80f5-4e53-aa1f-1f1f8c8e85e7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:37.009429	2024-11-14 06:29:10.961471	t	2.50	f	t	1	\N
61e23c27-70c4-42a7-8d56-8bcd496388cd	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:37.009432	2024-11-14 06:29:10.961475	t	2.50	f	t	1	\N
302462f8-a7dd-40bb-afed-e99ac9a7c89c	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras lunak yang bekerja sama untuk memproses data","images":[]}	t	2024-11-14 01:17:36.254973	2024-11-14 01:59:33.275779	f	0.00	f	f	1	\N
76d21122-f700-42f6-be49-90f61b80bdda	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.421078	2024-11-14 06:33:22.421078	f	0.00	f	f	1	\N
918cfd5b-d185-4b2d-a854-5f59294277aa	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:37.009434	2024-11-14 06:29:10.961489	t	2.50	f	t	1	\N
c05dd0b5-fc02-4cc4-8906-ecbe1304cf90	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:50.375225	2024-11-14 06:29:10.243173	t	2.50	f	t	1	\N
60b3b566-489d-4f5d-918a-86f12396f5ab	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:36.02504	2024-11-14 06:29:10.35982	t	0.00	f	f	1	\N
c83378b2-fa88-4d43-ba87-e1de1042e636	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:36.025042	2024-11-14 06:29:10.359825	t	0.00	f	f	1	\N
0f192faa-4c52-4c95-b581-4d0c201d00e3	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:36.025048	2024-11-14 06:29:10.359833	t	2.50	f	t	1	\N
afe4f48a-ede8-40eb-b14b-e0ce72a49f5d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:36.254763	2024-11-14 06:29:10.510286	t	2.50	f	t	1	\N
1a511dc1-abe6-4b1a-8847-8aab261a51aa	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:37.009439	2024-11-14 06:29:10.961507	t	2.50	f	t	1	\N
9450a16a-88ff-47b7-91c7-b4e57da2f2eb	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:36.254767	2024-11-14 06:29:10.510323	t	2.50	f	t	1	\N
dd5fd397-cc5b-4908-84de-768d5587785b	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat lunak yang mengelola sumber daya komputer ","images":[]}	t	2024-11-14 01:17:37.009556	2024-11-14 02:09:18.866219	f	0.00	f	f	1	\N
174cfa58-e6f4-4e4d-a852-d338f3abf6d1	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras dan perangkat lunak yang bekerja bersama untuk memproses data ","images":[]}	t	2024-11-14 01:17:37.009553	2024-11-14 02:04:30.341865	f	0.00	f	f	1	\N
4703c569-8b2e-4c73-aefe-da2cd1a72462	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d984d461-df4b-4e77-8d22-bd76fd7cf27e	t	2024-11-14 01:17:36.254771	2024-11-14 06:29:10.510331	t	0.00	f	f	1	\N
0f6b0f59-500d-4763-81b2-d757db0ed4b3	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:37.009414	2024-11-14 06:29:10.961424	t	2.50	f	t	1	\N
f86b9ebb-98d2-48b5-836c-903865ae0743	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:37.009418	2024-11-14 06:29:10.96143	t	2.50	f	t	1	\N
e5e5c874-c248-4a1c-b220-e99886a608d3	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:37.009441	2024-11-14 06:29:10.961511	t	2.50	f	t	1	\N
0647023f-7c35-49a3-be97-9fcc2d058ef3	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:37.009444	2024-11-14 06:29:10.961516	t	2.50	f	t	1	\N
e1e5f106-7cec-4305-bc0c-a7b7f6d52b2c	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:37.009446	2024-11-14 06:29:10.961539	t	2.50	f	t	1	\N
a6f922fd-94f2-4b90-90d2-8edc4dfebc7c	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:37.009449	2024-11-14 06:29:10.961555	t	2.50	f	t	1	\N
6ce83d09-b498-48b4-b936-889472d6aa90	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Memori fisik tambahan yang digunakan saat RAM penuh","images":[]}	t	2024-11-14 01:17:36.025143	2024-11-14 01:41:41.030048	f	0.00	f	f	1	\N
f63c7db9-bb7d-4f56-81a5-f9c84610ff9f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Memori yang dapat di pindahkan antar perangkat\\nKarena virtual memory untuk memori fisik tambahan yang digunakan saat RAM penuh","images":[]}	t	2024-11-14 01:17:36.25495	2024-11-14 01:42:35.349855	f	0.00	f	f	1	\N
8be21ac4-3a1b-45b4-a37d-e6b29dbd883f	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.42108	2024-11-14 06:33:22.42108	f	0.00	f	f	1	\N
e1f0f64c-68ec-4ff8-8979-f46a246bf6c6	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras adalah komponen fisik yang dapat di lihat dan di sentuh, sedangkan perangkat lunak kumpulan perintah yang di simpan secara digital\\nContoh: prengkat keras (keyboard, webcam)\\n               Perangkat lunak (Linux, Microsoft)","images":[]}	t	2024-11-14 01:17:37.562015	2024-11-14 01:54:31.19522	f	0.00	f	f	1	\N
cab3c106-3dd6-434f-a71c-a479a5f4a614	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.421131	2024-11-14 06:33:22.421132	f	0.00	f	f	1	\N
ca92d948-257a-47cc-aa19-c1f2dcfe7c42	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.421134	2024-11-14 06:33:22.421135	f	0.00	f	f	1	\N
a6cacf99-b72d-4876-ac8f-01139951762e	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.421137	2024-11-14 06:33:22.421137	f	0.00	f	f	1	\N
3e029b2c-20eb-4b79-a438-af07244b4378	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.42114	2024-11-14 06:33:22.42114	f	0.00	f	f	1	\N
58ef2cc3-60be-41f1-980d-b3b52e0cb0f7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.421143	2024-11-14 06:33:22.421143	f	0.00	f	f	1	\N
44dbe251-01f8-4072-93c6-23f3cbb1428b	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:37.561921	2024-11-14 06:29:10.664305	t	2.50	f	t	1	\N
ddf00c4f-9f72-48a2-a71a-d4c3935be5c8	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CCPU adalah perangkat keras yang berfungsi untuk memproses data \\nRAM adalah memory jangka pendek yang berfungsi untuk menyimpan data program aplikasi yang sedang di gunakan\\nMotherboard adalah papan sirkuit utama yang berfungsi sebagai pusat pengaturan ","images":[]}	t	2024-11-14 01:17:37.56202	2024-11-14 01:59:16.76536	f	0.00	f	f	1	\N
36a70c1f-c0f7-4214-9549-83c6aae962f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974564	2024-11-14 06:33:22.974565	f	0.00	f	f	1	\N
2142f865-8556-4e1b-abd6-f97399e3929d	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974567	2024-11-14 06:33:22.974567	f	0.00	f	f	1	\N
8f00f06c-83c9-4946-9a4a-97ceb481eb59	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974572	2024-11-14 06:33:22.974572	f	0.00	f	f	1	\N
506cceb7-2844-4728-8c0d-481591254e8b	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974575	2024-11-14 06:33:22.974576	f	0.00	f	f	1	\N
9c9e3fa3-181b-4d6f-b2fc-d5c74c707f6c	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974578	2024-11-14 06:33:22.974578	f	0.00	f	f	1	\N
63b7a004-4a6e-4a22-b4e1-93f1e02180c9	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974581	2024-11-14 06:33:22.974581	f	0.00	f	f	1	\N
28deba10-bf3a-490c-a13e-70bc2d62ca05	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	3d379d9b-ef44-4468-b621-b7754d2879df	t	2024-11-14 06:33:22.974538	2024-11-14 06:34:08.552965	f	0.00	f	f	1	\N
15a0adf2-b4b2-4605-a7d8-e55a1a37353b	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 06:33:22.97456	2024-11-14 06:34:20.993205	f	0.00	f	f	1	\N
eb499627-4b46-436b-92bd-e7cfe08f2875	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem operasi adalah perangkat lunak yang mengelola sumber daya komputer, termasuk perangkat keras dan perangkat lunak ","images":[]}	t	2024-11-14 01:17:37.562018	2024-11-14 01:56:31.773328	f	0.00	f	f	1	\N
5aa03bd6-7400-472a-abb4-9495adbd1260	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Yaitu himpunan perangakat keras dan perangkat lunak yang berkerja sama untuk memproses data dan menjalankan aplikasi di komputer","images":[]}	t	2024-11-14 01:17:38.627551	2024-11-14 01:51:41.387694	f	0.00	f	f	1	\N
8df4af23-46df-49de-8f65-b82b3b5953bb	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:17:37.561923	2024-11-14 06:29:10.664309	t	0.00	f	f	1	\N
f08ccb82-08ed-4bc6-a0f5-a4678425c4cb	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Memory virtual adalah teknik yang memungkinkan komputer untuk mengakses memori yang lebih besar dari memori utama","images":[]}	t	2024-11-14 01:17:37.562009	2024-11-14 02:01:54.706627	f	0.00	f	f	1	\N
287cf286-3826-48c4-a49a-39acd64dba92	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem komputer adalah kumpulan perangkat keras, perangkat lunak dan elemen lain yang bekerja sama untuk memproses data dan menghasilkan informasi ","images":[]}	t	2024-11-14 01:17:37.562012	2024-11-14 02:00:27.340055	f	0.00	f	f	1	\N
b808da5a-5a60-462d-b1bc-952f57cd7fc8	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:40.134715	2024-11-14 06:29:10.110056	t	2.50	f	t	1	\N
5960de89-28bb-45ea-ba91-f90edad3ee6d	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:53.46263	2024-11-14 06:29:10.276906	t	2.50	f	t	1	\N
963d6d28-9a40-486a-86a7-8a37503eede7	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:53.462634	2024-11-14 06:29:10.276911	t	0.00	f	f	1	\N
06887fe8-d40d-422e-ad2c-17a0c2d775ea	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:53.462636	2024-11-14 06:29:10.276914	t	2.50	f	t	1	\N
198fef9b-0599-415d-919d-eabba5512735	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:38.627382	2024-11-14 06:29:10.305843	t	2.50	f	t	1	\N
662e08a2-0a2b-4e43-8eda-e7d240fde53d	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware: Adalah perangkat yg bisa dilihat oleh mata dan bisa di sentuh. Perangkat keras contohnya seperti Prosesor,VGA,Monitor\\n\\nSoftware: Perangkat Lunak di dalam komputer yang tidak bisa disentuh tetapi masih bisa dilihat oleh mata menggunakan monitor dari perangkat keras. Contohnya seperti Windows, Linux, Vscode, Adobe premier","images":[]}	t	2024-11-14 01:17:38.627521	2024-11-14 01:40:48.001605	f	0.00	f	f	1	\N
c3164277-7db0-4b37-983f-a965ee1c8c88	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:38.627387	2024-11-14 06:29:10.305848	t	2.50	f	t	1	\N
518b00ee-184d-4ffc-ad29-27b5f84cef33	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4d697cd1-5953-4a37-9e4c-d2487f4cc287	t	2024-11-14 01:17:37.561884	2024-11-14 06:29:10.664266	t	0.00	f	f	1	\N
6c4aa4ff-2884-430d-8a8c-de517d881b6d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:37.561901	2024-11-14 06:29:10.66427	t	2.50	f	t	1	\N
55cfd9ba-afdf-425e-8098-79b55d66cf87	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	t	2024-11-14 01:17:37.561904	2024-11-14 06:29:10.664289	t	0.00	f	f	1	\N
9542f648-df9c-4b18-b41f-70e7ec620f60	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:37.561907	2024-11-14 06:29:10.664293	t	2.50	f	t	1	\N
ecd012c2-95ea-4bae-8bc0-f41a694c2d54	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:37.561926	2024-11-14 06:29:10.664314	t	0.00	f	f	1	\N
4bbb4d7e-493f-47a9-8a97-2da9fea204aa	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem operasi adalah sistem yang membantu perangakat keras untuk menjalankan sistem/data didalam komputer. Fungsinya seperti menyediakan software di dalam komputer untuk menjalankan data","images":[]}	t	2024-11-14 01:17:38.627525	2024-11-14 01:44:11.188372	f	0.00	f	f	1	\N
05bd71a6-f78b-4b6b-8a14-3dfb5643eaff	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974587	2024-11-14 06:33:22.974587	f	0.00	f	f	1	\N
79d848b9-0ed3-40a3-8ac6-f58b571ea850	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.97459	2024-11-14 06:33:22.974591	f	0.00	f	f	1	\N
24a72601-82b5-4e3c-a4b5-65387acb56a1	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974593	2024-11-14 06:33:22.974593	f	0.00	f	f	1	\N
2b51819f-92d6-4cae-9cdd-efb107b6c2da	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974596	2024-11-14 06:33:22.974596	f	0.00	f	f	1	\N
f2685727-dc86-4f74-8204-c574b149d020	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974598	2024-11-14 06:33:22.974599	f	0.00	f	f	1	\N
b7d14203-ef69-4756-98ef-af6166d71098	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:22.974601	2024-11-14 06:33:22.974602	f	0.00	f	f	1	\N
830f303d-c3ca-4ffc-a438-6436447f23be	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.974678	2024-11-14 06:33:22.974678	f	0.00	f	f	1	\N
d6b4fd37-0c6b-41b2-89f8-47aca0bff5e8	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.974683	2024-11-14 06:33:22.974683	f	0.00	f	f	1	\N
19639d1e-83db-417e-9056-a67025d334d9	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.974687	2024-11-14 06:33:22.974687	f	0.00	f	f	1	\N
78deb4d6-08b6-4585-a7a3-c51fa72bb5d8	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.97469	2024-11-14 06:33:22.97469	f	0.00	f	f	1	\N
31a41e67-df73-4118-87b3-199f19be52f3	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:22.974693	2024-11-14 06:33:22.974693	f	0.00	f	f	1	\N
e4a6690a-b0c4-4f90-8941-c43c8cf0eee6	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675477	2024-11-14 06:33:23.675477	f	0.00	f	f	1	\N
d2be13ca-a3fc-4f57-b387-4bf4a99438f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675482	2024-11-14 06:33:23.675482	f	0.00	f	f	1	\N
17a13d96-2fb6-4093-a2dc-08dfdf1f4de3	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:37.561943	2024-11-14 06:29:10.664383	t	2.50	f	t	1	\N
bc1f90e5-1316-47b0-8504-cf0251713f44	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Software:program dan data yang untuk mengoperasikan perangkat keras contoh \\nHardware:perangkat keras yang digunakan untuk mengoperasikan data di komputer contoh kybord cpu, mouse","images":[]}	t	2024-11-14 01:17:35.957318	2024-11-14 02:05:53.643174	f	0.00	f	f	1	\N
cfc83739-31b5-4931-a74d-fc60157d470c	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:40.134777	2024-11-14 06:29:10.110108	t	2.50	f	t	1	\N
0441a299-ef3a-4b94-81af-a356ff67b54f	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:40.13478	2024-11-14 06:29:10.110111	t	2.50	f	t	1	\N
8093bfff-c8f2-4bea-85d7-46716fac35f4	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:40.56321	2024-11-14 06:29:10.138094	t	2.50	f	t	1	\N
bd4d5a90-ddac-420d-9fdc-9e10471b4623	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:40.563232	2024-11-14 06:29:10.138097	t	2.50	f	t	1	\N
8f14341d-e3b8-4b1d-ae09-4a86b5777ca4	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	3d379d9b-ef44-4468-b621-b7754d2879df	t	2024-11-14 01:17:40.563235	2024-11-14 06:29:10.1381	t	0.00	f	f	1	\N
d70f382b-ba17-424e-acf0-92d31577c056	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	23ded2d9-eb73-45c4-931a-60bb9f18f722	t	2024-11-14 01:17:53.462639	2024-11-14 06:29:10.276916	t	0.00	f	f	1	\N
61f977fc-c57e-4f39-a126-a596dbbb0d3c	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ebe831d-037b-45f1-8436-e7773874ca04	t	2024-11-14 01:17:53.462645	2024-11-14 06:29:10.276924	t	0.00	f	f	1	\N
4d47d3be-76b7-409b-a1cf-33e6ec9e298f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	bc5f8e93-5070-4087-a3dc-4419fd10b988	t	2024-11-14 01:17:53.462647	2024-11-14 06:29:10.276927	t	0.00	f	f	1	\N
21384683-066e-44b3-9589-41944eae172f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:53.462671	2024-11-14 06:29:10.276938	t	2.50	f	t	1	\N
fd40ad39-c2cb-40b0-9057-fb023215c21e	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:53.462674	2024-11-14 06:29:10.276941	t	0.00	f	f	1	\N
4b3a7c6b-750e-4006-b805-f1add4e8643b	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"RAM","images":[]}	t	2024-11-14 01:17:40.563383	2024-11-14 01:39:45.573745	f	0.00	f	f	1	\N
bf71e0c0-87a0-43d5-8c63-d75ee265a5de	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:53.462677	2024-11-14 06:29:10.276946	t	0.00	f	f	1	\N
0091c075-1a6f-4f2d-b37c-c41aeef0c0e8	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:53.462682	2024-11-14 06:29:10.276951	t	2.50	f	t	1	\N
e108419d-5cb6-4555-8ce4-64db10bad18a	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:53.462684	2024-11-14 06:29:10.276953	t	2.50	f	t	1	\N
d79dc10f-3b97-4593-a110-b36f51bb7f7e	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:38.627407	2024-11-14 06:29:10.305877	t	2.50	f	t	1	\N
11cad905-2d7b-4d04-953f-7e982222ce35	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem oprasi untuk mengintruksi Dan memproses\\nData pada komputer ","images":[]}	t	2024-11-14 01:17:40.134949	2024-11-14 01:26:13.548722	f	0.00	f	f	1	\N
56c45091-6099-493b-b4fd-9c8c2a578976	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:51.277644	2024-11-14 06:29:10.72548	t	2.50	f	t	1	\N
80196d6e-b73b-44f2-addd-e6509f8206e2	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:51.277647	2024-11-14 06:29:10.725486	t	2.50	f	t	1	\N
b1194f79-81d3-471c-a152-c2da9fceb3b2	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675486	2024-11-14 06:33:23.675487	f	0.00	f	f	1	\N
12c0f0d3-f161-40c9-bdd0-403a8318381c	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675509	2024-11-14 06:33:23.675509	f	0.00	f	f	1	\N
84161402-9da5-486f-9d88-0880697ef6a2	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"memindahkan data ","images":[]}	t	2024-11-14 01:17:40.563388	2024-11-14 01:41:02.603613	f	0.00	f	f	1	\N
0bb768c6-a790-4beb-9979-01b3bb385dc4	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hardware : nyata. Mouse\\nsoftware : data / yg berada di komputer. Linux","images":[]}	t	2024-11-14 01:17:40.56338	2024-11-14 01:38:35.621696	f	0.00	f	f	1	\N
e6292965-04e6-4bb7-9437-c958561c6dd6	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"menyimpan data sementara ","images":[]}	t	2024-11-14 01:17:40.563386	2024-11-14 01:40:21.745902	f	0.00	f	f	1	\N
39e51c56-2a83-4b69-b2fe-de44c7b26e88	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"ram: penyimpanan\\ncpu:","images":[]}	t	2024-11-14 01:17:41.44617	2024-11-14 01:37:00.679991	f	0.00	f	f	1	\N
d167e18c-ab2e-4e03-b9cc-2a67bf46bf90	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"memori yang dapat dipindahkan di perangkat ","images":[]}	t	2024-11-14 01:17:41.446167	2024-11-14 01:36:40.865037	f	0.00	f	f	1	\N
49c814d8-7e55-4a88-913f-ab96acb400c6	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat keras: monitor, keyboard, mouse\\nperangkat lunak: scanner, ","images":[]}	t	2024-11-14 01:17:41.446164	2024-11-14 01:35:47.470645	f	0.00	f	f	1	\N
e82d58b0-28ec-4498-8347-5f608c232e2a	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"sistem yang menjalankan sebuah komputer","images":[]}	t	2024-11-14 01:17:41.446172	2024-11-14 01:37:26.650349	f	0.00	f	f	1	\N
8234f3fb-b167-497d-a199-3b5386435df0	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675512	2024-11-14 06:33:23.675513	f	0.00	f	f	1	\N
50304e3d-fe8b-48fd-bd12-99ce108f034f	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675528	2024-11-14 06:33:23.675528	f	0.00	f	f	1	\N
8184a5f5-deee-474a-a93a-48db92e81c1a	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675531	2024-11-14 06:33:23.675531	f	0.00	f	f	1	\N
78aa97ba-eff6-46da-96e1-43981bbeb648	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675534	2024-11-14 06:33:23.675534	f	0.00	f	f	1	\N
682d3a4a-b16e-4b41-a826-81797741f7a3	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675537	2024-11-14 06:33:23.675537	f	0.00	f	f	1	\N
2a853e87-8ab7-4f6f-8845-0d354ff88726	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:45.178272	2024-11-14 06:29:10.63281	t	2.50	f	t	1	\N
e41133b8-493e-4011-809f-c2462b596c48	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat atau sistem yang menyimpan data dan program untuk digunakan dalam komputer ","images":[]}	t	2024-11-14 01:17:45.178427	2024-11-14 01:49:29.631053	f	0.00	f	f	1	\N
7571edf0-7582-4197-82d4-371d971529c9	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem operasi adalah himpunan perangkat keras dan lunak bekerja sama untuk memproses data, fungsinya menjalankan sistem sistem yang ada di dalam komputer. ","images":[]}	t	2024-11-14 01:18:18.607402	2024-11-14 01:51:38.666166	f	0.00	f	f	1	\N
489fbfed-becc-435b-adb4-9a71f634e90b	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675545	2024-11-14 06:33:23.675545	f	0.00	f	f	1	\N
825056ee-0e74-4a58-8cb6-50781c8a90a2	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675548	2024-11-14 06:33:23.675548	f	0.00	f	f	1	\N
cc47f1ba-df34-4a8d-86b0-6fdba76cc32a	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675551	2024-11-14 06:33:23.675551	f	0.00	f	f	1	\N
6fc72c97-b6f9-43fa-9b2e-11d9d9031d88	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675554	2024-11-14 06:33:23.675554	f	0.00	f	f	1	\N
ddb3e318-7a61-4439-8dbf-541c611bd982	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.675557	2024-11-14 06:33:23.675557	f	0.00	f	f	1	\N
19255ec1-a8a9-4007-bf29-63c6ee37a10d	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.67556	2024-11-14 06:33:23.67556	f	0.00	f	f	1	\N
a83d116a-8c59-4564-b0ae-620b3719aa9d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.675634	2024-11-14 06:33:23.675635	f	0.00	f	f	1	\N
5545df7b-acfe-43ff-a69c-d3dc4ace13d8	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:44.90112	2024-11-14 06:29:10.792012	t	2.50	f	t	1	\N
ebe4cf01-811c-4f58-9334-3d6f4266926d	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.675639	2024-11-14 06:33:23.675639	f	0.00	f	f	1	\N
75cd86db-4d2f-4d81-9d8b-26a41cc8c716	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:47.931045	2024-11-14 06:29:10.189047	t	2.50	f	t	1	\N
1226f0ab-98b4-4dcf-8927-5979ba0203cc	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.675643	2024-11-14 06:33:23.675643	f	0.00	f	f	1	\N
87caaf15-51bc-4972-b7f1-4b3ba8015f6a	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.675646	2024-11-14 06:33:23.675646	f	0.00	f	f	1	\N
f73aa967-4deb-4e05-9c93-77f3eb4f86a6	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:38.627376	2024-11-14 06:29:10.305838	t	2.50	f	t	1	\N
c0b5e9ac-4e83-4bc8-9c01-cef7768386b4	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"kumpulan perangkat keras dan lunak yang saling berinteraksi untuk melakukan pemrosesan data","images":[]}	t	2024-11-14 01:17:44.901245	2024-11-14 01:55:43.474189	f	0.00	f	f	1	\N
a31cda89-d985-4c35-9874-9c4bd6ff7a86	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:35.957139	2024-11-14 06:29:10.896378	t	2.50	f	t	1	\N
f61ba029-8fcd-4b2f-95b8-0a3d0c05921d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:44.901139	2024-11-14 06:29:10.792036	t	2.50	f	t	1	\N
770f367b-1f42-48eb-9d3c-8a9408866532	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:38.627394	2024-11-14 06:29:10.305873	t	0.00	f	f	1	\N
e3ccd2cb-35c1-48d4-8a1a-067138593783	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"cpu:memproses sinyal \\nram:sebagai tempat penyimpanan data sementara yang dibutuhkan oleh perangkat\\nmotherboard:sebagai distributor daya dan penghubung segala jenis komponen komputer\\nhard disk:sebagai tempat penyimpanan data\\nkartu grafis:menghasilkan umpan gambar\\nmother","images":[]}	t	2024-11-14 01:17:44.901256	2024-11-14 02:03:52.730527	f	0.00	f	f	1	\N
e2a3a761-0dfb-4eb3-a036-b01c7da4927d	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:38.62741	2024-11-14 06:29:10.305883	t	2.50	f	t	1	\N
4bca2faa-c18e-490b-942c-e37e1972b3cd	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat keras:peralatan komputer itu sendiri \\nperangkat lunak:program yang berisi perintah","images":[]}	t	2024-11-14 01:17:44.901241	2024-11-14 02:06:07.571619	f	0.00	f	f	1	\N
dcc8d7a1-3777-4972-9d5b-d8618a24bb6a	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	72e2bb70-10bc-4e2f-a909-df97927a5f56	t	2024-11-14 01:17:38.627413	2024-11-14 06:29:10.305886	t	0.00	f	f	1	\N
86549aad-0ef4-407a-8772-f9eade910670	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"menjalankan aplikasi yang lebih besar ","images":[]}	t	2024-11-14 01:17:44.901252	2024-11-14 02:04:48.541578	f	0.00	f	f	1	\N
b8f6b962-06e0-401e-ae05-1168f5e64a39	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:38.627415	2024-11-14 06:29:10.305888	t	2.50	f	t	1	\N
5b13bf28-2fdb-4f4f-bf88-8c8d0bb5341c	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:44.901142	2024-11-14 06:29:10.792039	t	2.50	f	t	1	\N
c656d118-bddf-4d23-9f74-ddf6392cee7f	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:45.178265	2024-11-14 06:29:10.632766	t	0.00	f	f	1	\N
7abc228d-6cb1-437d-b666-cda3c4222541	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:45.178269	2024-11-14 06:29:10.632773	t	2.50	f	t	1	\N
5d70285b-c982-40d8-a2d7-2d6ceb0b2f43	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ea29634f-0a27-49ae-bb17-dd3fc46a46d5	t	2024-11-14 01:17:44.901096	2024-11-14 06:29:10.791957	t	0.00	f	f	1	\N
69152483-1ce0-4a11-af13-5247089d029a	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:44.9011	2024-11-14 06:29:10.79197	t	0.00	f	f	1	\N
17c625b7-65a3-49d7-b5ae-6f08b065d0da	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0dc24724-0b23-4746-a205-11bcb152979a	t	2024-11-14 01:17:44.901109	2024-11-14 06:29:10.791993	t	0.00	f	f	1	\N
d9b82109-692e-4255-98bc-a2efe919e9ff	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:44.901113	2024-11-14 06:29:10.791998	t	2.50	f	t	1	\N
adf551dd-fd3e-4a0e-a245-27a51cc5b579	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:44.901115	2024-11-14 06:29:10.792002	t	2.50	f	t	1	\N
798c77a2-73a9-4ef1-adbf-7e81802afb33	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:44.901118	2024-11-14 06:29:10.792007	t	2.50	f	t	1	\N
e677e22b-8a52-4810-ba22-8c8dbafd4fc7	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:44.901144	2024-11-14 06:29:10.792042	t	2.50	f	t	1	\N
b42b0d1d-feef-4f1d-9519-53ec31360e20	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras hardware merupakan fisik perangkat yang bisa di sentuh\\nPerangkat lunak software merupakan fisik perangkat program yang tidak bisa di sentuh ","images":[]}	t	2024-11-14 01:17:48.392093	2024-11-14 02:00:36.622204	f	0.00	f	f	1	\N
4fb22bc0-1782-4e54-9ed7-cb0c9eee5fe5	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:38.627424	2024-11-14 06:29:10.305895	t	2.50	f	t	1	\N
74daf70d-27cf-4ab3-a2b8-80001bc0c7f7	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"fajhrul","images":[]}	t	2024-11-14 01:17:50.375299	2024-11-14 01:50:03.35346	f	0.00	f	f	1	\N
c19e48fd-d36e-4d30-b86e-2f759c052878	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:38.627427	2024-11-14 06:29:10.305897	t	2.50	f	t	1	\N
09bc7324-5987-451c-a247-56b9e56bf1c8	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:38.62743	2024-11-14 06:29:10.3059	t	2.50	f	t	1	\N
87f27d37-ce55-4a1e-8430-bfa95ad018d3	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:38.627433	2024-11-14 06:29:10.305903	t	0.00	f	f	1	\N
10a6499d-ee63-4920-8b6a-530bde0a33b8	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:38.627436	2024-11-14 06:29:10.305905	t	2.50	f	t	1	\N
e45b3338-4de2-4f4c-9ac2-af2c5373b68a	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:23:14.132304	2024-11-14 06:29:10.332673	t	0.00	f	f	1	\N
83168d98-b6d5-4317-98b4-2745495950e7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	t	2024-11-14 01:23:14.132307	2024-11-14 06:29:10.332677	t	0.00	f	f	1	\N
d120dd12-83eb-4d52-93dc-070d51a3420c	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.675649	2024-11-14 06:33:23.675649	f	0.00	f	f	1	\N
3a98d362-5593-463e-8d2a-5b0ed5b95e6b	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745859	2024-11-14 06:33:23.74586	f	0.00	f	f	1	\N
3f36ebd8-4a02-498f-8a05-96273f44fbe8	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745864	2024-11-14 06:33:23.745864	f	0.00	f	f	1	\N
958c0bff-eb6f-4283-8148-2275550a013b	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745868	2024-11-14 06:33:23.745868	f	0.00	f	f	1	\N
b51236dd-052d-4d3b-af16-f4305d2e9684	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745875	2024-11-14 06:33:23.745876	f	0.00	f	f	1	\N
cf86c224-5dd1-424d-a8a0-3990e00bc252	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat lunak yang mengelola sistem komputer ","images":[]}	t	2024-11-14 01:17:48.392087	2024-11-14 01:53:22.779872	f	0.00	f	f	1	\N
222dd5a2-9999-4b6d-92ec-f79104cd4794	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745878	2024-11-14 06:33:23.745879	f	0.00	f	f	1	\N
1db8a2da-a736-4f21-b74c-b79f06d69d46	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745883	2024-11-14 06:33:23.745883	f	0.00	f	f	1	\N
e583b5fa-7fe4-408d-a2e7-dd76580faf32	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745886	2024-11-14 06:33:23.745886	f	0.00	f	f	1	\N
df3ee529-dd5a-4c0e-bac8-2b13feeca0ef	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745889	2024-11-14 06:33:23.745907	f	0.00	f	f	1	\N
d17bdc28-7fde-4f0a-a3b4-872f768007f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745911	2024-11-14 06:33:23.745911	f	0.00	f	f	1	\N
e41b2259-c80a-4a9a-9a4f-d93e0c1824d9	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745929	2024-11-14 06:33:23.74593	f	0.00	f	f	1	\N
b537fd92-b462-44b9-8ecb-11c7f05a6989	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras untuk bekerja sama pada komputer","images":[]}	t	2024-11-14 01:17:48.392096	2024-11-14 02:01:16.748702	f	0.00	f	f	1	\N
74111fac-fe58-4b7f-a30c-ba1b1dae002d	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:35.0631	2024-11-14 06:29:10.163147	t	2.50	f	t	1	\N
bf0134e6-4c8b-40c8-8b10-115f02c0c8be	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	t	2024-11-14 01:17:47.931072	2024-11-14 06:29:10.189087	t	0.00	f	f	1	\N
be9c1a40-281a-47c2-a083-b14165af0c61	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:47.931076	2024-11-14 06:29:10.189091	t	2.50	f	t	1	\N
73381c14-97e6-4b89-bb54-242a09b01e75	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:50.375187	2024-11-14 06:29:10.243082	t	2.50	f	t	1	\N
92d6d5b4-3687-4f03-8a42-21055397ee21	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	e93f6692-7188-4f8b-b406-2af7512be6f4	t	2024-11-14 01:17:50.37519	2024-11-14 06:29:10.243088	t	0.00	f	f	1	\N
e90f8fff-6736-4576-a892-8b1b8b582876	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:50.375193	2024-11-14 06:29:10.243093	t	2.50	f	t	1	\N
8eabebfa-72ab-469d-83c3-bbc0aa077444	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:50.375195	2024-11-14 06:29:10.2431	t	0.00	f	f	1	\N
95615e5a-f245-4ced-a76f-01608168a52c	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:50.375198	2024-11-14 06:29:10.243105	t	2.50	f	t	1	\N
fc2087bd-d3b0-431b-b477-1cf5ffeae25c	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:50.3752	2024-11-14 06:29:10.243109	t	2.50	f	t	1	\N
cf0cecc7-6b14-45a3-b387-15cab682e38c	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:50.375203	2024-11-14 06:29:10.243114	t	2.50	f	t	1	\N
2357c3a0-060f-4cb9-93f3-714b8cb3039f	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:23:14.13231	2024-11-14 06:29:10.332682	t	0.00	f	f	1	\N
6515bb1f-8f6e-4666-824e-e1751b50c3d4	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ea29634f-0a27-49ae-bb17-dd3fc46a46d5	t	2024-11-14 01:23:14.132313	2024-11-14 06:29:10.332687	t	0.00	f	f	1	\N
2edaed2b-c4db-4c7a-a514-fa1e39ff88e8	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:23:14.132327	2024-11-14 06:29:10.332694	t	2.50	f	t	1	\N
f37a0ccf-b176-457c-bbb9-ad975e881749	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:23:14.132333	2024-11-14 06:29:10.332723	t	2.50	f	t	1	\N
55273570-9702-4abe-9728-c0897ce38b9a	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:23:14.132336	2024-11-14 06:29:10.332728	t	2.50	f	t	1	\N
c0343b0a-4a9b-4dc9-a528-6ddbc0a022c4	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:48.39197	2024-11-14 06:29:10.603135	t	0.00	f	f	1	\N
b9b25f4b-965d-4c32-925e-9f1360a2a5f7	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:48.391973	2024-11-14 06:29:10.603141	t	2.50	f	t	1	\N
4ea4bf65-b5ec-4338-a9b7-6707655e842f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"teknik yang digunakan sistem operasi untuk memberikan kapasitas memori yang lebih besar daripada yang tersedia secara fisik di komputer. Memori virtual bekerja dengan mentransfer data sementara dari RAM ke penyimpanan dis","images":[]}	t	2024-11-14 01:17:47.931159	2024-11-14 01:42:11.69059	f	0.00	f	f	1	\N
db2a4808-e45c-420f-9dc9-63806a1761e9	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"kumpulan perangkat keras dan lunak yang saling berinteraksi untuk melakukan pemrosesan data, menyimpan informasi, dan menghasilkan output. ","images":[]}	t	2024-11-14 01:17:47.931167	2024-11-14 01:44:40.856778	f	0.00	f	f	1	\N
2e98f41d-1df2-4aeb-a70f-0057fbdfda20	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745933	2024-11-14 06:33:23.745933	f	0.00	f	f	1	\N
2ceae7a9-9bc0-4786-93dc-7b5cb074385a	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745936	2024-11-14 06:33:23.745936	f	0.00	f	f	1	\N
3f2b0ccb-fdbf-42cf-bc14-70acc8b985d9	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745939	2024-11-14 06:33:23.745939	f	0.00	f	f	1	\N
e1708876-01a1-47d7-8d01-d24d12e52a0e	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745942	2024-11-14 06:33:23.745942	f	0.00	f	f	1	\N
b6a7990f-07d2-4079-a0d3-b2a24d6cc42f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:23.745945	2024-11-14 06:33:23.745945	f	0.00	f	f	1	\N
5afd5e20-d792-46e3-9f20-5732396cfe35	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.746024	2024-11-14 06:33:23.746024	f	0.00	f	f	1	\N
7ee14faa-7a4f-4d3b-8c2f-bbb7e578c9ce	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.746041	2024-11-14 06:33:23.746041	f	0.00	f	f	1	\N
c7f9a435-2d87-494a-b8b4-7349c2836393	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.746061	2024-11-14 06:33:23.746061	f	0.00	f	f	1	\N
ea648ffa-e2e4-4550-b733-9b8ecedf1ff1	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.746065	2024-11-14 06:33:23.746065	f	0.00	f	f	1	\N
17595c84-83b2-4639-9128-f8b07c47379f	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:23.746087	2024-11-14 06:33:23.746087	f	0.00	f	f	1	\N
56c2eac0-f952-49d4-a9ff-2fc4ab4cdf44	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 06:33:10.963574	2024-11-14 06:33:24.891622	f	0.00	f	f	1	\N
591a6092-757b-49c2-8325-6aa8c5332277	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982657	2024-11-14 06:33:34.982657	f	0.00	f	f	1	\N
8b50cf66-cef3-4fbf-835e-041bf78c2cd1	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982662	2024-11-14 06:33:34.982662	f	0.00	f	f	1	\N
30d13a4f-a8f3-4d88-b148-6955590fbe2d	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982676	2024-11-14 06:33:34.982676	f	0.00	f	f	1	\N
8b59e428-58d7-4b3c-a7ac-fcead060baf7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982679	2024-11-14 06:33:34.982679	f	0.00	f	f	1	\N
6919c0ca-b369-4173-9ba8-600392b6f871	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Teknik yang memungkinkan komputer untuk mengompersa","images":[]}	t	2024-11-14 01:17:51.2778	2024-11-14 01:52:53.095929	f	0.00	f	f	1	\N
8fb3632e-6abd-4bf3-9be4-cd86634f3eac	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 06:33:34.982644	2024-11-14 06:33:54.81035	f	0.00	f	f	1	\N
6c938004-ae27-4cd9-92b5-fde7b07f0222	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:19:09.147332	2024-11-14 06:29:10.694131	t	2.50	f	t	1	\N
3ee21183-30f0-4134-87f3-db9470d2b2bb	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"riki","images":[]}	t	2024-11-14 01:17:50.375308	2024-11-14 01:50:34.864285	f	0.00	f	f	1	\N
e88721c0-9593-4f44-80b3-18384dfdc4e2	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"ram untuk","images":[]}	t	2024-11-14 01:17:50.375305	2024-11-14 01:50:24.408598	f	0.00	f	f	1	\N
1554fff6-6b47-4ee0-80b1-cd1290c17669	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"muttaqin","images":[]}	t	2024-11-14 01:17:50.375302	2024-11-14 01:50:07.436114	f	0.00	f	f	1	\N
4c2b71d5-438c-4867-bf3c-a1b9382d9582	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:51.277568	2024-11-14 06:29:10.725324	t	2.50	f	t	1	\N
ea3a8cb3-4326-4c75-a21d-996636715d3a	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:51.277573	2024-11-14 06:29:10.725332	t	0.00	f	f	1	\N
a89f7d54-9ea7-4fa1-90ff-c2a2735568f4	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:54.911857	2024-11-14 06:29:10.863423	t	0.00	f	f	1	\N
8c9ebb88-dabe-43e6-8495-c58cd71c3782	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c0e01265-da6f-4724-abf6-73d0a0a4d7fc	t	2024-11-14 01:17:54.911863	2024-11-14 06:29:10.86343	t	0.00	f	f	1	\N
3797d900-004e-43d3-a136-baef91e66f8a	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Kumpulan perangkat lunak yang saling berinteraksi untuk melakukan meperosesan data menyimpan informasi menghasilkan output ","images":[]}	t	2024-11-14 01:17:51.277808	2024-11-14 02:04:19.79574	f	0.00	f	f	1	\N
635babb1-ae71-45cb-8814-4f58753a6d99	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Teknik yang untuk mengompensasi kekurangan memori fisik dengan menggunakan sebagian hard disk untuk meniru ram","images":[]}	t	2024-11-14 01:17:48.392098	2024-11-14 01:51:59.244476	f	0.00	f	f	1	\N
da2aa875-b942-4f62-97b1-0c2a0998826e	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Cpu RAM motherboard hard disk kartu grafis","images":[]}	t	2024-11-14 01:17:51.277812	2024-11-14 02:06:28.224147	f	0.00	f	f	1	\N
23633349-42c1-4101-be8d-d7e650e8292c	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Seitem komputer adala perang kat laulak yang menolah sumberayah komputer","images":[]}	t	2024-11-14 01:17:51.277805	2024-11-14 02:02:07.900835	f	0.00	f	f	1	\N
768ac90c-e6ca-478b-a042-185ef8df7196	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras perangkat lunak ","images":[]}	t	2024-11-14 01:17:51.277815	2024-11-14 02:07:24.18975	f	0.00	f	f	1	\N
af1a4499-39c0-4618-841c-23084ad6d47a	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:53.462626	2024-11-14 06:29:10.276902	t	2.50	f	t	1	\N
ce5ba442-59f6-4e0e-8db1-a9d8cac3b105	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	23ded2d9-eb73-45c4-931a-60bb9f18f722	t	2024-11-14 01:23:14.132339	2024-11-14 06:29:10.332733	t	0.00	f	f	1	\N
283a007a-c4e4-404c-a30c-6d590f2a4819	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	bc5f8e93-5070-4087-a3dc-4419fd10b988	t	2024-11-14 01:23:14.132342	2024-11-14 06:29:10.332737	t	0.00	f	f	1	\N
b9c9d503-8674-463c-9d9a-056bad7dc02c	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:36.02497	2024-11-14 06:29:10.359738	t	2.50	f	t	1	\N
6a104e25-9b29-4fac-9660-32be38e78883	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:19:09.147318	2024-11-14 06:29:10.694083	t	2.50	f	t	1	\N
17eab7d9-f3b6-4c0c-b04b-f663be53cbc7	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:19:09.147321	2024-11-14 06:29:10.694087	t	0.00	f	f	1	\N
2baed041-5274-4ae5-94f6-469fd363c91f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"memori tambahan saat RAM penuh","images":[]}	t	2024-11-14 01:17:53.462783	2024-11-14 01:36:56.757326	f	0.00	f	f	1	\N
6c85e4e3-280e-4e56-8f4b-92d6d6e6dc3f	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	72e2bb70-10bc-4e2f-a909-df97927a5f56	t	2024-11-14 01:19:09.147326	2024-11-14 06:29:10.694122	t	0.00	f	f	1	\N
84e68693-f964-433f-beb1-7d9f2b03541b	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6a7e78e-78eb-4d78-9b4e-35e2a901f765	t	2024-11-14 01:19:09.147329	2024-11-14 06:29:10.694127	t	0.00	f	f	1	\N
f2c8d099-3f37-4b25-9a09-15904f249b05	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0a6f9db7-5170-4ddd-b5a5-db88851e6fbc	t	2024-11-14 01:17:54.911868	2024-11-14 06:29:10.863435	t	0.00	f	f	1	\N
3cc1b41e-3290-4c35-99ea-9a716fbef28e	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem yang digunakan untuk mengontrol dan mengoperasikan komputer","images":[]}	t	2024-11-14 01:17:53.462791	2024-11-14 01:44:29.369593	f	0.00	f	f	1	\N
01cb38d4-2b59-41c9-87d3-54555bccf72e	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982686	2024-11-14 06:33:34.982687	f	0.00	f	f	1	\N
094a94b8-4ff5-4096-8e56-0ef4b1cd4200	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.98269	2024-11-14 06:33:34.98269	f	0.00	f	f	1	\N
9e06755e-e686-4edf-9f90-123d34e8bfda	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982693	2024-11-14 06:33:34.982693	f	0.00	f	f	1	\N
2c7d9cd2-5169-4d67-b397-f639728b4b2a	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982696	2024-11-14 06:33:34.982696	f	0.00	f	f	1	\N
0b747e68-c1b2-4723-b0ff-d8995deb5377	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982743	2024-11-14 06:33:34.982743	f	0.00	f	f	1	\N
5701c63d-2e8b-4b0b-95f7-f2c64964b5d9	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982746	2024-11-14 06:33:34.982746	f	0.00	f	f	1	\N
43a67497-f15e-4d63-b2b3-e5c3a365c93c	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982749	2024-11-14 06:33:34.982749	f	0.00	f	f	1	\N
1e631f61-5ff4-4d9d-8915-0df71e5c4350	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982752	2024-11-14 06:33:34.982752	f	0.00	f	f	1	\N
55dd6719-c75f-4dc5-8e98-a05af74fc9d4	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:22.50035	2024-11-14 06:29:10.397541	t	2.50	f	t	1	\N
44696344-f9da-4bb7-b602-22c5f2bb0254	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:54.911875	2024-11-14 06:29:10.863446	t	2.50	f	t	1	\N
17ab98c0-31d9-43d8-9038-bb3520b35bb4	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:54.911879	2024-11-14 06:29:10.863455	t	2.50	f	t	1	\N
f225c93e-f079-4414-8c5e-a182322c4b70	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:54.911882	2024-11-14 06:29:10.863459	t	2.50	f	t	1	\N
08c3dce1-6be0-43ec-b772-7fe9a0032bb4	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982755	2024-11-14 06:33:34.982755	f	0.00	f	f	1	\N
9a5b648c-90de-4097-a61a-b2eac99914eb	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Ram untuk menyimpan data secara permanen\\nCPU untuk sebagai otak komputer\\nMotherboard untuk sebagai distributor saya \\nHard disk untuk sebagai penyimpanan segala data file\\nKartu grafis mengubah data numerik menjadi gambar","images":[]}	t	2024-11-14 01:17:48.39209	2024-11-14 01:58:31.134372	f	0.00	f	f	1	\N
05c3a12a-9b26-4a08-9fe4-bab3814a7c8d	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware dan software","images":[]}	t	2024-11-14 01:17:54.912019	2024-11-14 01:54:24.923945	f	0.00	f	f	1	\N
d46829ec-fe69-4ee4-83fe-0c24be41e7cd	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Software dan hardware dan ","images":[]}	t	2024-11-14 01:17:54.912022	2024-11-14 02:05:48.277428	f	0.00	f	f	1	\N
49adda63-14ef-4e9b-b422-46f35ed94d22	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:35.957145	2024-11-14 06:29:10.896384	t	2.50	f	t	1	\N
b113100b-22d9-498d-85c3-7a183f64edc9	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Virtual memory menyimpan sebuah memori yang berada di komputer bekerja nya virtual memory adalah menyimpan data \\nDan penting nya dalam kinerja adalah menyimpan sebuah data","images":[]}	t	2024-11-14 01:17:22.500471	2024-11-14 01:55:42.502838	f	0.00	f	f	1	\N
d6782736-c1c6-44ba-a858-7fee732b9b92	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Cpu:untuk menyediakan daya untuk perangkat keras\\nRam:untuk menyimpan data\\nMotherboard:komponen untuk menjalankan aplikasi\\nHard disk:menghubungkan komputer ke perangkat lain\\nKartu grafis:membuat sebuah ","images":[]}	t	2024-11-14 01:17:35.957314	2024-11-14 01:58:19.570148	f	0.00	f	f	1	\N
3e9e4c15-b267-46ef-8fea-77149f4e65af	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Software perangkat keras yang digunakan dalam sistem komputer","images":[]}	t	2024-11-14 01:17:54.912025	2024-11-14 02:06:38.07619	f	0.00	f	f	1	\N
75671ea2-c57d-43c8-8d41-ffb3066a3f1c	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Motherboard: perangkat keras yang menghubungkan semua komputer \\nCpu:untuk mengolah dan mengintruksi komputer \\nRam: untuk menyimpan data \\nHardisk: menyimpan data secara permanen ","images":[]}	t	2024-11-14 01:17:45.178432	2024-11-14 01:56:57.658967	f	0.00	f	f	1	\N
210f5108-9f41-45fb-a8fe-ae370f1f4f0a	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:37.00941	2024-11-14 06:29:10.961418	t	2.50	f	t	1	\N
4227309c-a4b3-4235-a4d7-3d9e4eae9cff	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat lunak sistem yang mengatur sumber daya dari perangkat keras dan perangkat lunak.\\nfungsi:sebagai kordinator yang memberikan fasilitas ","images":[]}	t	2024-11-14 01:17:44.901236	2024-11-14 02:00:16.303038	f	0.00	f	f	1	\N
ab8df9c7-784e-4383-915f-2c2a85ff88e4	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:34.982758	2024-11-14 06:33:34.982758	f	0.00	f	f	1	\N
e723acd7-3742-4625-a874-4030d0c84db0	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:34.982861	2024-11-14 06:33:34.982861	f	0.00	f	f	1	\N
9a718e6a-9814-4d26-ab56-15484ecd4c52	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:40.134725	2024-11-14 06:29:10.110064	t	0.00	f	f	1	\N
68f0c021-da69-4754-b20d-2c00b366b642	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4d697cd1-5953-4a37-9e4c-d2487f4cc287	t	2024-11-14 01:17:35.063104	2024-11-14 06:29:10.163159	t	0.00	f	f	1	\N
a9021034-50ad-45a5-bbae-5684e9f82928	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7f0667ff-adaf-4c3c-816b-50430cd9a7cc	t	2024-11-14 01:17:35.814367	2024-11-14 06:29:10.214357	t	0.00	f	f	1	\N
bc990fc1-034a-471f-801a-d5354d2f9871	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:50.375167	2024-11-14 06:29:10.243069	t	2.50	f	t	1	\N
e0b2b388-4928-4a50-b912-a7ccf9841391	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5eaf2a68-d1ff-4d8d-8d7f-a2c25d47109c	t	2024-11-14 01:17:22.500346	2024-11-14 06:29:10.397537	t	0.00	f	f	1	\N
60c887b2-5eb8-44c3-bb1b-29ef44a88042	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:36.254758	2024-11-14 06:29:10.510265	t	2.50	f	t	1	\N
a2a2f909-c5d6-4aaa-a229-599c330383aa	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:19:30.347379	2024-11-14 06:29:10.541154	t	2.50	f	t	1	\N
7fbe8a25-d695-4a25-99cd-54969fe5645a	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:18:18.607161	2024-11-14 06:29:10.571807	t	2.50	f	t	1	\N
03b650ab-917b-4a80-8943-01782a8df6a3	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:34.982865	2024-11-14 06:33:34.982865	f	0.00	f	f	1	\N
7c40ada9-771f-4ec4-b65b-6450a11b89ca	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:45.178256	2024-11-14 06:29:10.632755	t	2.50	f	t	1	\N
2e5bc968-a13f-4bd5-9b48-690c2e6db528	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Virtual memory yang digunakan untuk menyimpan data permanen","images":[]}	t	2024-11-14 01:17:54.912028	2024-11-14 02:08:20.902865	f	0.00	f	f	1	\N
1c9faf64-58e1-4c5a-8898-d1479979c9d9	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:45.178261	2024-11-14 06:29:10.63276	t	2.50	f	t	1	\N
6189dce4-d3aa-4b8a-a9b5-c2bc2c8dfba2	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hipunan perangkat keras dan perangkat lunak yang bekerja bersama untuk memproses ","images":[]}	t	2024-11-14 01:17:54.912016	2024-11-14 01:42:36.220086	f	0.00	f	f	1	\N
846ed59f-4e27-4a79-8bd7-dcf74f22421c	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:34.982869	2024-11-14 06:33:34.982869	f	0.00	f	f	1	\N
016964f5-4486-461c-9217-e8c652652eb3	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:34.982872	2024-11-14 06:33:34.982872	f	0.00	f	f	1	\N
e741c9b1-044d-4039-bb8d-143a7a82a0ab	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:34.982875	2024-11-14 06:33:34.982876	f	0.00	f	f	1	\N
786b1e23-6292-4e5e-a94e-c0c9c00d1860	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 06:33:17.669853	2024-11-14 06:33:45.249308	f	0.00	f	f	1	\N
5b2f9976-aa15-45df-89b2-6d52a9f59339	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336085	2024-11-14 06:33:45.336086	f	0.00	f	f	1	\N
57b36e1e-1a81-4594-a750-c94a3421dc07	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 06:33:10.963578	2024-11-14 06:33:38.596361	f	0.00	f	f	1	\N
95b81c44-b6be-4969-b4fe-e6a2c6eb5d0c	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336109	2024-11-14 06:33:45.336109	f	0.00	f	f	1	\N
927cf39d-93c9-431a-bdc3-e728bb3f1965	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336114	2024-11-14 06:33:45.336114	f	0.00	f	f	1	\N
e851f66b-ebb5-48fe-a201-9f57b848fa60	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336117	2024-11-14 06:33:45.336117	f	0.00	f	f	1	\N
39968895-b99b-4de7-8036-7139a7771e76	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.33612	2024-11-14 06:33:45.336121	f	0.00	f	f	1	\N
5ffb3abf-1e7e-4845-9c37-adf43b709115	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336125	2024-11-14 06:33:45.336125	f	0.00	f	f	1	\N
b3f83a83-9505-4ac1-9e03-25a5a2e4d5f3	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336128	2024-11-14 06:33:45.336128	f	0.00	f	f	1	\N
5ea591d6-a274-4ae6-bf18-474bdc7f6d0a	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"memori yang dapat dipindah antar perangkat  penting karna dapat membuat pekerjaan lebih efisien ","images":[]}	t	2024-11-14 01:18:22.514908	2024-11-14 01:53:26.531406	f	0.00	f	f	1	\N
785f10e0-910f-43f1-8008-b3edd99566ef	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:18:22.51479	2024-11-14 06:29:10.427401	t	0.00	f	f	1	\N
7d99caa8-88aa-4c53-9925-ea183c83f5ae	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:18:18.607178	2024-11-14 06:29:10.571833	t	2.50	f	t	1	\N
b69ea6a6-671f-4fad-9d04-f6341a4d7d01	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:18:18.607214	2024-11-14 06:29:10.571837	t	2.50	f	t	1	\N
d53acb72-499b-48b0-a1c7-7831ac20a613	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:18:18.607218	2024-11-14 06:29:10.571841	t	2.50	f	t	1	\N
36755079-73a8-4140-a97c-0805aa7169f6	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware adalah perangkat keras yang dapat kita lihat, contoh: keyboard dan monitor. \\nSoftware adalah perangkat lunak yang tidak dapat dilihat dengan mata telanjang, contohnya scanner dan webcam","images":[]}	t	2024-11-14 01:18:18.607413	2024-11-14 01:59:55.521697	f	0.00	f	f	1	\N
c7dc337e-7b4b-40c1-ba58-ed9c97b4eed9	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c8d3bf7f-3f6d-496d-b3a3-33f10628a48f	t	2024-11-14 01:19:09.147336	2024-11-14 06:29:10.694135	t	0.00	f	f	1	\N
5cb79237-9804-4493-b62f-6c2cf8f95f68	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	3d379d9b-ef44-4468-b621-b7754d2879df	t	2024-11-14 01:19:09.147358	2024-11-14 06:29:10.694142	t	0.00	f	f	1	\N
3a092aba-1ff6-43c3-a744-f8245ef79159	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Virtual memori adalah berfungsi untuk memindahkan penyimpanan antar perangkat","images":[]}	t	2024-11-14 01:18:18.607408	2024-11-14 01:57:39.621087	f	0.00	f	f	1	\N
b98c1bb3-aefe-4e5a-839a-d42f4e0da68c	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:18:22.514794	2024-11-14 06:29:10.427428	t	2.50	f	t	1	\N
43ef7ab7-0975-48d3-a36e-f1cca8a52711	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	t	2024-11-14 01:19:09.147376	2024-11-14 06:29:10.69415	t	0.00	f	f	1	\N
0952f5c1-99aa-4e07-bf57-f9c2d777fbfe	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:18:22.514797	2024-11-14 06:29:10.427434	t	2.50	f	t	1	\N
72a010d8-9324-41c2-bef2-e83cd4251718	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem yang mengatur komponen komponen komputer seperti hardware, software, dan brain ","images":[]}	t	2024-11-14 01:18:18.607411	2024-11-14 01:58:35.984669	f	0.00	f	f	1	\N
410f49dd-a986-405a-b27a-5b3230cd8031	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:18:18.607173	2024-11-14 06:29:10.571813	t	2.50	f	t	1	\N
bf172535-aaaf-42de-b9e1-a235aae294bc	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:19:09.147379	2024-11-14 06:29:10.694154	t	2.50	f	t	1	\N
cc601d1b-4342-474d-b2ad-24ce721b97ea	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:19:09.147382	2024-11-14 06:29:10.694158	t	0.00	f	f	1	\N
d89f2bbf-f315-4175-aacb-568fb6a039af	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:19:09.147385	2024-11-14 06:29:10.694162	t	0.00	f	f	1	\N
2dc1cbf3-74d5-4ecb-820d-5e2682c7e574	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:19:09.147388	2024-11-14 06:29:10.694165	t	2.50	f	t	1	\N
25b3edea-83fa-4523-af36-393117ecfd5f	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:18:18.607222	2024-11-14 06:29:10.571865	t	0.00	f	f	1	\N
6fb46034-b8b4-4d04-9f1c-3c8949d63109	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:20.001656	2024-11-14 06:29:10.759112	t	0.00	f	f	1	\N
528d367b-23e1-4afe-81ad-82d7576101bd	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:18:18.607225	2024-11-14 06:29:10.571868	t	2.50	f	t	1	\N
deef3804-4162-478b-9a05-778aa261bd32	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:20.001672	2024-11-14 06:29:10.759118	t	2.50	f	t	1	\N
97f42754-5242-4d28-9895-31bcd0ca562b	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:20.00168	2024-11-14 06:29:10.759123	t	2.50	f	t	1	\N
61c411bf-2a4e-45dc-97de-d54b2ae365dc	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:18:58.782507	2024-11-14 06:29:10.819507	t	2.50	f	t	1	\N
056383bb-0f14-476c-a51b-87bcfa86858c	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"cpu = memproses sinyal \\nram = sebagai tempat penyimpanan data yang di butuhkan oleh perngkat\\nmotherboard = sebagai distributor daya dan penghubung segala jenis komponen komputer\\nhardisk = sebagai tempat penyimpanan data \\nkartu grafis = menghasilkan umpan gambar ","images":[]}	t	2024-11-14 01:18:58.78274	2024-11-14 02:04:04.287358	f	0.00	f	f	1	\N
b5e53416-2297-4510-a719-e095a8992669	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:18:18.607228	2024-11-14 06:29:10.571871	t	2.50	f	t	1	\N
93eae15d-04a6-4f93-932b-829b35ff3b34	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:18:18.607231	2024-11-14 06:29:10.571874	t	2.50	f	t	1	\N
6b77dd02-17d1-4e3c-8ed8-5175f305d411	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:35.95715	2024-11-14 06:29:10.89639	t	2.50	f	t	1	\N
1d65ad18-7c2a-49d5-89e2-05179acfaac4	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336131	2024-11-14 06:33:45.336131	f	0.00	f	f	1	\N
3c4d84b1-d168-4b7a-8063-dfe2ae355522	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"kumpulan perangkat keras dan lunak yang saling berinteraksi untuk melakukan pemrosesan data","images":[]}	t	2024-11-14 01:18:58.782715	2024-11-14 01:54:46.637363	f	0.00	f	f	1	\N
b89e7849-9b6a-4ef3-9266-a673ea801bb6	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:36.025051	2024-11-14 06:29:10.35984	t	2.50	f	t	1	\N
f5962eb2-9533-45fa-909b-9f368c103fbf	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"sistem operasi digunakan untuk memberikan tugas bagi berbagai command ataupun aplikasi yang ada di dalam komputer ","images":[]}	t	2024-11-14 01:19:09.147514	2024-11-14 01:52:09.689738	f	0.00	f	f	1	\N
114a7ee8-d213-42f7-b842-d8a3320bb0f4	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU: mengolah dan menjalankan instruksi program\\nRam: bersifat sementara dan menjalankan program\\nMotherboard:  mengatur semua komponen dalam komputer. \\nHard disk: menyimpan data sementara\\nKartu grafis: menampilkan visual pada monitor\\nHarddisk:","images":[]}	t	2024-11-14 01:18:18.607405	2024-11-14 01:56:55.527725	f	0.00	f	f	1	\N
6c3f7433-b806-4d3a-b34b-4867a2c6098c	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:22.500367	2024-11-14 06:29:10.397557	t	2.50	f	t	1	\N
a53c6483-df5b-4d16-ac9a-0268ed9acd08	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"virtual memory berfungsi untuk memyimpan memory yang hanya digunakan untuk aplikasi tertentu","images":[]}	t	2024-11-14 01:19:09.147524	2024-11-14 02:03:10.73819	f	0.00	f	f	1	\N
973c181f-098f-4f78-bbdc-033001611a50	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat lunak dan perangkat keras yang bekerja sama menjalankan suatu data / komputer\\nfungsi : membuat data, flow chart, tabel dll","images":[]}	t	2024-11-14 01:17:36.025157	2024-11-14 01:56:18.482821	f	0.00	f	f	1	\N
f8c96b06-2db4-435d-9f08-e933164d698b	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat lunak sistem yang mengatur sumber daya dari perangkat keras dan perangkat lunak\\nfungsi = sebagai kordinator yang memberikan fasilitas ","images":[]}	t	2024-11-14 01:18:58.782719	2024-11-14 02:00:16.979596	f	0.00	f	f	1	\N
76349f03-a10a-4a91-99a2-d7c01cfad030	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"command untuk menjalankan perintah dari berbagai system system dalam komputer","images":[]}	t	2024-11-14 01:19:09.147521	2024-11-14 02:01:02.487957	f	0.00	f	f	1	\N
c779e4ac-368d-476f-a777-e6904ac78740	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:18:58.78258	2024-11-14 06:29:10.819604	t	2.50	f	t	1	\N
49e2dcf1-264c-4e15-a665-8a9ff1d30d0d	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	23ded2d9-eb73-45c4-931a-60bb9f18f722	t	2024-11-14 01:17:22.50037	2024-11-14 06:29:10.39756	t	0.00	f	f	1	\N
c2bb7b0b-2d62-46fd-a02e-d730a744d45a	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:18:58.782583	2024-11-14 06:29:10.819622	t	2.50	f	t	1	\N
b479fba0-9351-44a7-ae24-6f4872568840	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat keras = peralatan komputer itu sendiri\\nperangkat lunak = program yang berisi perintah","images":[]}	t	2024-11-14 01:18:58.782748	2024-11-14 02:06:10.350178	f	0.00	f	f	1	\N
fdfdb079-ecbf-4eda-92e9-bb9288cab8f2	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336134	2024-11-14 06:33:45.336134	f	0.00	f	f	1	\N
3aece25a-74ad-4c14-ad3d-9a0f8d4c8922	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336141	2024-11-14 06:33:45.336141	f	0.00	f	f	1	\N
631d2836-edfb-4cef-afc3-21c65c278b7c	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336144	2024-11-14 06:33:45.336144	f	0.00	f	f	1	\N
6e5c2964-a4cb-4274-9bc4-c6f04a542d74	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336148	2024-11-14 06:33:45.336148	f	0.00	f	f	1	\N
10d82d89-1084-4e0c-b0e8-ca042fe6dea0	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336151	2024-11-14 06:33:45.336151	f	0.00	f	f	1	\N
497b7710-91ca-4ee7-b1e2-3dd7d6e5d0f2	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336154	2024-11-14 06:33:45.336154	f	0.00	f	f	1	\N
e56b2168-f761-482e-b7e5-82f6b678c14d	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.336157	2024-11-14 06:33:45.336157	f	0.00	f	f	1	\N
17150cb0-3875-4bae-9b87-523718f40c15	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.336256	2024-11-14 06:33:45.336256	f	0.00	f	f	1	\N
7a24bd00-8561-467f-b83e-f484c9b0ebeb	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.33626	2024-11-14 06:33:45.33626	f	0.00	f	f	1	\N
751c5909-63a5-42c0-9a9f-e7142b1f303b	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.336264	2024-11-14 06:33:45.336264	f	0.00	f	f	1	\N
87ced0f9-cf91-498e-aedb-a7855ac1c76f	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.336272	2024-11-14 06:33:45.336272	f	0.00	f	f	1	\N
4905c658-642f-4480-91c5-82e188f6285c	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.336294	2024-11-14 06:33:45.336294	f	0.00	f	f	1	\N
2fb47650-90c9-4bd9-9c4b-51fe249c0639	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838025	2024-11-14 06:33:45.838025	f	0.00	f	f	1	\N
2158b534-97e1-4fe3-ad29-a7fee6923e1c	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838048	2024-11-14 06:33:45.838049	f	0.00	f	f	1	\N
e27e6770-d63d-43af-8086-f1b7f4702fd9	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"menjalankan aplikasi yang lebih besar ","images":[]}	t	2024-11-14 01:18:58.782744	2024-11-14 02:04:50.613743	f	0.00	f	f	1	\N
6462b22c-6306-4965-87f2-488cee0cde84	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:22.500372	2024-11-14 06:29:10.397562	t	2.50	f	t	1	\N
4667c64a-3e6e-4eb3-9847-ec1da387be3c	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:36.024979	2024-11-14 06:29:10.359752	t	2.50	f	t	1	\N
804435ba-1dc9-4254-983b-f7ff416f1bf1	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:36.024983	2024-11-14 06:29:10.359757	t	0.00	f	f	1	\N
f08df9f6-e4b8-42fc-9109-8b8cd5cefbde	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:19:09.147311	2024-11-14 06:29:10.694064	t	0.00	f	f	1	\N
0fe08bb6-5c32-40d6-ab4b-a4540d28afeb	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:19:09.147315	2024-11-14 06:29:10.694069	t	2.50	f	t	1	\N
2c59404e-4c42-4ca6-a261-b77a4db0a29e	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:18:58.782577	2024-11-14 06:29:10.8196	t	2.50	f	t	1	\N
7d549975-2547-40ed-8947-7cfa8a6c852f	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:18:58.782586	2024-11-14 06:29:10.819627	t	2.50	f	t	1	\N
b1376c29-443b-42a4-839b-f49ca0c6fdf2	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:18:58.782589	2024-11-14 06:29:10.819631	t	2.50	f	t	1	\N
28255844-5b16-4a45-b57c-3266c2151f04	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat keras = perangkat yang digunakan dan dibutuhkan computer agar berjalan dengan optimal, contoh : keyboard,pc,monitor\\n\\nperangkat lunak : aplikasi yang digunakan secara umum di komputer dan sangat berfungsi untuk sehari hari, contoh : Microsoft word ","images":[]}	t	2024-11-14 01:19:09.14751	2024-11-14 01:46:54.654114	f	0.00	f	f	1	\N
1ac5a5cd-3c5f-4e69-aaa0-c8bc33b6836e	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838054	2024-11-14 06:33:45.838055	f	0.00	f	f	1	\N
1c75c5e7-1292-4ea2-800e-5eaa79f1481c	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838058	2024-11-14 06:33:45.838058	f	0.00	f	f	1	\N
56f53ba6-b198-44d6-be37-1adb5fdc8511	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.83806	2024-11-14 06:33:45.838061	f	0.00	f	f	1	\N
374dd90b-f935-46df-be13-d53d6d73c0b8	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838067	2024-11-14 06:33:45.838067	f	0.00	f	f	1	\N
ebc9d590-cb5c-40dc-a1b6-b8367742bc46	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.83807	2024-11-14 06:33:45.83807	f	0.00	f	f	1	\N
e25805b1-1666-438c-afc4-a52cff8697a9	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838073	2024-11-14 06:33:45.838073	f	0.00	f	f	1	\N
1b4ded13-e054-4ecb-b2da-c54c4cd90176	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838076	2024-11-14 06:33:45.838076	f	0.00	f	f	1	\N
632c4346-0ae6-41e0-b4b4-9e5f9a40c25a	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838081	2024-11-14 06:33:45.838081	f	0.00	f	f	1	\N
71306e87-0859-43ff-b122-dec1c338f6c1	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838084	2024-11-14 06:33:45.838084	f	0.00	f	f	1	\N
4c1b4806-78fd-447c-8950-c3b44f5d1cfd	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838087	2024-11-14 06:33:45.838087	f	0.00	f	f	1	\N
9ae1c6c2-a4ef-475e-9b0f-010807bd10c1	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.83809	2024-11-14 06:33:45.83809	f	0.00	f	f	1	\N
220ca38c-e195-49b7-8fcc-c9cdbd99d5b1	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838093	2024-11-14 06:33:45.838093	f	0.00	f	f	1	\N
f1dbd543-e6e1-4a76-adde-a07f8af4e2cf	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:45.838096	2024-11-14 06:33:45.838096	f	0.00	f	f	1	\N
8f7cf8dc-d1ef-45d4-a4b4-49a9fc7288ad	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.838199	2024-11-14 06:33:45.838199	f	0.00	f	f	1	\N
8d9bdac7-4e7e-4888-8395-439e3e5d2f12	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:20:32.002961	2024-11-14 06:29:10.046317	t	2.50	f	t	1	\N
0d30e7d5-9e59-4f4a-9685-bffe37c9fd5c	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	860aecdf-b63e-48de-8984-a4629e1348a6	t	2024-11-14 01:17:22.500385	2024-11-14 06:29:10.397568	t	0.00	f	f	1	\N
996c0d9b-3148-4c01-ab0c-2c74b113c100	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	72e2bb70-10bc-4e2f-a909-df97927a5f56	t	2024-11-14 01:17:37.56188	2024-11-14 06:29:10.664262	t	0.00	f	f	1	\N
73dea98f-157c-4208-872d-b670fb64d73b	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"virtual memori adalah memori yang dapat dipindahkan antar komputer","images":[]}	t	2024-11-14 01:19:30.347594	2024-11-14 01:54:03.828901	f	0.00	f	f	1	\N
1b28a6b8-9cd9-46fd-b95c-a4cd0ab115d7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:22.50039	2024-11-14 06:29:10.397594	t	2.50	f	t	1	\N
0806e3b4-f5fd-4053-886c-8e7be21a62d0	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:20:32.002968	2024-11-14 06:29:10.046322	t	2.50	f	t	1	\N
157d70f4-67d0-44eb-8037-c3e7adea97ca	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hardware merupakan perangkat keras yang dapat di pegang atau nyata. contoh nya monitor, keyboard, dan mouse. software adalah sistem yang terdapat di dalam komputer untuk menjalankan berbagai intruksi. contoh nya aplikasi ","images":[]}	t	2024-11-14 01:19:30.347586	2024-11-14 01:56:26.807114	f	0.00	f	f	1	\N
635c16a2-b498-4540-a270-8cc43a15dcad	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	cf0819aa-e127-4df6-a6a6-a045a262dcd7	t	2024-11-14 01:19:09.147305	2024-11-14 06:29:10.694056	t	0.00	f	f	1	\N
1b97205e-23ab-429f-845a-177d00e78abf	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.838203	2024-11-14 06:33:45.838203	f	0.00	f	f	1	\N
b42bfcd8-dad9-4977-a8e6-99ca12d59ed2	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.838207	2024-11-14 06:33:45.838207	f	0.00	f	f	1	\N
db3bd3ec-a1c8-4240-9f56-aa8657834e01	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	t	2024-11-14 01:17:22.500392	2024-11-14 06:29:10.397597	t	0.00	f	f	1	\N
b87a421d-1656-4865-b82d-a9837271cb32	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:23:15.641505	2024-11-14 06:29:10.471236	t	2.50	f	t	1	\N
855d47bb-f350-48be-8323-4b3988c0211c	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:23:15.641526	2024-11-14 06:29:10.471239	t	2.50	f	t	1	\N
793c0ea8-cf44-432e-8df1-e580c32ddb67	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:40.13476	2024-11-14 06:29:10.110084	t	2.50	f	t	1	\N
12329a59-2708-485b-86d6-1de6111e6e42	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	3d379d9b-ef44-4468-b621-b7754d2879df	t	2024-11-14 01:17:40.134774	2024-11-14 06:29:10.110106	t	0.00	f	f	1	\N
269c9fe8-d224-452b-ab43-05ab7712417a	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"sistem oprasi adalah sistem yang menjalankan sebuah komputer, masing masing sistem oprasi memiliki keunggulan dan kekurangan tersendiri. contoh dari sistem oprasi adalah: windows, linux, mac os","images":[]}	t	2024-11-14 01:19:30.347578	2024-11-14 01:39:15.811837	f	0.00	f	f	1	\N
ad0f2259-82cb-45e8-9e5a-fb8e5f0ed006	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	bc5f8e93-5070-4087-a3dc-4419fd10b988	t	2024-11-14 01:17:40.563205	2024-11-14 06:29:10.13809	t	0.00	f	f	1	\N
08e94bb0-0720-42b1-b5a2-39373b51e223	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:50.375183	2024-11-14 06:29:10.243076	t	0.00	f	f	1	\N
ef7035ab-192f-4f3b-8eec-91302822cb21	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"sistem komputer adalah himpunan perangkat keras dan perangkat lunak yang saling bekerja sama untuk memproses atau menjalankan sebuah data","images":[]}	t	2024-11-14 01:19:30.347583	2024-11-14 01:40:24.159458	f	0.00	f	f	1	\N
34665ad5-c4e4-4fd8-83e1-242e1696eee8	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:17:36.024987	2024-11-14 06:29:10.359761	t	0.00	f	f	1	\N
b37d6445-2077-4e08-a38d-0fbc02de6ae3	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:22.500383	2024-11-14 06:29:10.397566	t	0.00	f	f	1	\N
6d7f7eea-616b-4962-8919-1e6e25a63803	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:19:30.347349	2024-11-14 06:29:10.541107	t	2.50	f	t	1	\N
9a912136-cad8-4c85-b702-15b51749deb2	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:19:30.347363	2024-11-14 06:29:10.541133	t	0.00	f	f	1	\N
7852c13d-a30a-41d7-b8eb-be6f52850af6	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:19:30.347368	2024-11-14 06:29:10.541138	t	2.50	f	t	1	\N
5c6e931a-40b8-4361-a071-19cfb6237b4a	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:19:30.347375	2024-11-14 06:29:10.541148	t	2.50	f	t	1	\N
a373b238-dd7a-4c09-b5ee-9b217d576dea	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem yang menunjang nyalanya komputer ","images":[]}	t	2024-11-14 01:20:32.003146	2024-11-14 01:30:26.097427	f	0.00	f	f	1	\N
30a3773e-7149-4c07-af21-517f5113f75a	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Virtual memory adalah alat penyimpan data sementara ","images":[]}	t	2024-11-14 01:20:32.003152	2024-11-14 01:36:22.64099	f	0.00	f	f	1	\N
e3a05ecb-770b-4b9f-ad73-40455d2d5e8d	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.838235	2024-11-14 06:33:45.838235	f	0.00	f	f	1	\N
0a36c48c-4d6e-4725-82d6-d65fa422f011	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:18:22.514786	2024-11-14 06:29:10.427383	t	2.50	f	t	1	\N
fddf872a-2aa5-4621-a68b-3458c4b32295	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:45.838239	2024-11-14 06:33:45.838239	f	0.00	f	f	1	\N
44a69f76-0091-46f7-9574-83241d812530	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728617	2024-11-14 06:33:46.728618	f	0.00	f	f	1	\N
bf26ca2d-3983-4400-891a-7a3f1415f3ef	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728623	2024-11-14 06:33:46.728623	f	0.00	f	f	1	\N
e17c981a-32ec-48d2-be15-ffc3c300663e	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Memori tambahan saat RAM penuh","images":[]}	t	2024-11-14 01:23:14.132485	2024-11-14 01:37:08.262794	f	0.00	f	f	1	\N
d0dbb457-2bcb-4468-b611-31d3b4393697	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728627	2024-11-14 06:33:46.728627	f	0.00	f	f	1	\N
643a6cef-a5c7-4d78-84b9-11419534df3f	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem yang digunakan untuk mengontrol dan mengoperasikan komputer ","images":[]}	t	2024-11-14 01:23:14.132501	2024-11-14 01:38:18.122877	f	0.00	f	f	1	\N
7ba99462-4bf4-4456-a018-a08a4b54acd4	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728634	2024-11-14 06:33:46.728634	f	0.00	f	f	1	\N
b32a73b7-5639-49c4-a984-cbe532fc135f	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728637	2024-11-14 06:33:46.728637	f	0.00	f	f	1	\N
e2edb0c2-3f2d-4521-b297-088bdea95f64	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728641	2024-11-14 06:33:46.728642	f	0.00	f	f	1	\N
2cb33bd5-d896-4e80-b539-94b090a0d1ab	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728644	2024-11-14 06:33:46.728645	f	0.00	f	f	1	\N
7fce4565-2748-4d64-8643-34b440cb022a	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:23:14.132284	2024-11-14 06:29:10.332654	t	2.50	f	t	1	\N
63b3a4e3-14a7-4c49-9938-1f56d34cb851	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:36.025002	2024-11-14 06:29:10.359791	t	2.50	f	t	1	\N
8ed5cfdd-6c3d-44b5-a457-62808b64447e	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:22.500364	2024-11-14 06:29:10.397555	t	0.00	f	f	1	\N
ebd74b43-055d-4fd6-bbc9-e2e27c260dfb	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:17:22.500395	2024-11-14 06:29:10.397615	t	0.00	f	f	1	\N
be1dccda-c44d-441a-9d63-aed088a7ba65	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728648	2024-11-14 06:33:46.728648	f	0.00	f	f	1	\N
14a8425b-3e60-473a-97b8-4e9750dd6145	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728651	2024-11-14 06:33:46.728651	f	0.00	f	f	1	\N
9ca230a6-3dfd-49e9-be05-d9470c0e10b4	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:18:22.514799	2024-11-14 06:29:10.427439	t	2.50	f	t	1	\N
a278e208-b64b-411f-883b-92316bba4c2d	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:18:22.514804	2024-11-14 06:29:10.427445	t	0.00	f	f	1	\N
289ccc95-4614-46c2-acc6-a88f22adba34	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:18:22.514807	2024-11-14 06:29:10.42745	t	2.50	f	t	1	\N
03826370-d544-4e86-ba90-d71911600b5b	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:18:22.514809	2024-11-14 06:29:10.427454	t	2.50	f	t	1	\N
868e53f8-2eb7-46ab-8373-e1cbc7c04f74	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	bc5f8e93-5070-4087-a3dc-4419fd10b988	t	2024-11-14 01:20:32.00294	2024-11-14 06:29:10.046298	t	0.00	f	f	1	\N
62278733-388f-48ef-b826-07036151ebb1	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	abf6a09c-b7c1-45ad-a55a-87bc5ad2798c	t	2024-11-14 01:17:40.134786	2024-11-14 06:29:10.110118	t	0.00	f	f	1	\N
32e75db1-0925-4d66-9b50-e299bb022af4	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6a7e78e-78eb-4d78-9b4e-35e2a901f765	t	2024-11-14 01:17:35.063116	2024-11-14 06:29:10.163172	t	0.00	f	f	1	\N
78d0f4fb-dba1-4112-8845-317ed3ed8217	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	1ac8c25b-0faa-4535-bc05-83adea481c2f	t	2024-11-14 01:17:35.063144	2024-11-14 06:29:10.163196	t	0.00	f	f	1	\N
97b1b6d2-c0ad-492c-83fc-53613ff527e4	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:38.627421	2024-11-14 06:29:10.305893	t	2.50	f	t	1	\N
0f40c346-bb65-4911-81ed-b4dcf87effe6	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:23:14.13229	2024-11-14 06:29:10.332667	t	2.50	f	t	1	\N
9283f8b3-6d75-4e58-90c7-6d6414a59a83	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:23:14.132278	2024-11-14 06:29:10.332648	t	2.50	f	t	1	\N
13b1e8fe-ef96-45e4-90e4-7839f9cda962	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:36.024991	2024-11-14 06:29:10.359768	t	2.50	f	t	1	\N
d08db74f-b4ce-46b8-ae32-d5bb41217d56	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:36.024994	2024-11-14 06:29:10.359772	t	2.50	f	t	1	\N
0c01d036-2568-48f5-b0d5-62f4ac54ffe9	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:36.024997	2024-11-14 06:29:10.359787	t	2.50	f	t	1	\N
31440479-bc4a-4351-ae82-318a5fa207f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:18:22.514812	2024-11-14 06:29:10.427463	t	0.00	f	f	1	\N
ea719575-fd83-498e-937e-2585a539ff5e	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:18:22.514816	2024-11-14 06:29:10.42747	t	2.50	f	t	1	\N
e8664474-c76f-44de-badd-62b7a112e541	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:18:22.514819	2024-11-14 06:29:10.427475	t	0.00	f	f	1	\N
b59d5950-95bb-4593-b74c-26179b5b8969	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:18:22.514821	2024-11-14 06:29:10.42748	t	2.50	f	t	1	\N
ddcb910e-4796-49b8-85e1-9214d4429614	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:18:22.514824	2024-11-14 06:29:10.427484	t	2.50	f	t	1	\N
fecaa1df-d027-49bf-91c1-25332e31cb07	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:36.254797	2024-11-14 06:29:10.510336	t	2.50	f	t	1	\N
079a8c24-b503-4d39-ad5a-1cf856495c68	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:45.178275	2024-11-14 06:29:10.632817	t	2.50	f	t	1	\N
b7174ab0-55bd-4c66-aed0-81f2968d875a	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:18:58.782496	2024-11-14 06:29:10.8195	t	2.50	f	t	1	\N
b366c332-6565-4723-b1f5-3f51a44f4548	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	t	2024-11-14 01:17:54.911872	2024-11-14 06:29:10.863441	t	0.00	f	f	1	\N
cc7f1c60-7a49-4d77-8365-3a159e9ae929	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:35.75367	2024-11-14 06:29:10.928747	t	2.50	f	t	1	\N
3ae464bf-28c9-4ac4-8ef0-bcd3a193e19b	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:37.009423	2024-11-14 06:29:10.961459	t	2.50	f	t	1	\N
cf943a76-f0ab-41c6-bc23-2d1810da086f	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 06:33:22.974532	2024-11-14 06:33:45.861156	f	0.00	f	f	1	\N
858d187c-756e-4457-b209-f322225145df	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU = digunakan untuk mengontrol unit proses\\nRAM = digunakan untuk menyimpan data sementara\\nhard disk = digunakan untuk menyimpan data permanen pada komputer\\nKartu Grafis = komponen yang menampilkan visual pada monitor\\nMother Board = Komponen terpenting dalam komputer yang digunakan untuk menjalankan software","images":[]}	t	2024-11-14 01:19:30.347591	2024-11-14 01:57:17.903985	f	0.00	f	f	1	\N
1c01c680-62fc-4e96-986c-cf0e21bdfe9f	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:20:32.002953	2024-11-14 06:29:10.046306	t	2.50	f	t	1	\N
43c9d5a7-dbfb-4655-84fb-eeeef7c735be	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:18:22.514828	2024-11-14 06:29:10.427513	t	2.50	f	t	1	\N
f1291366-0265-4fc4-aa28-e1f21da623d7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Memori yang dapat pindahkan antar perangkat","images":[]}	t	2024-11-14 01:23:15.641801	2024-11-14 01:37:35.088239	f	0.00	f	f	1	\N
8d381d11-57e1-45ec-9198-c1d6ae517734	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	36cfbefb-3388-42ba-92ab-edc24b4cfe4b	t	2024-11-14 01:23:15.641446	2024-11-14 06:29:10.47117	t	0.00	f	f	1	\N
469d8b04-8575-48d8-ad44-5f67bfa2ac86	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:23:15.641451	2024-11-14 06:29:10.471174	t	0.00	f	f	1	\N
ca4a7a09-48c7-4d30-96b2-1001da072967	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras dan perangkat lunak yang bekerja sama untuk memproses data","images":[]}	t	2024-11-14 01:23:15.641847	2024-11-14 01:56:53.39436	f	0.00	f	f	1	\N
05839471-da07-4b89-993e-cb334e0c37f3	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware=komponen pada komputer yang dapat di pegang\\nContoh=VGA,Mouse, Keyboard, Monitor \\nSoftware=Sistem operasi yang mengontrol komputer\\nContoh=Linux,MacOS, Windows,DOS","images":[]}	t	2024-11-14 01:23:15.641844	2024-11-14 01:55:17.004393	f	0.00	f	f	1	\N
798bdd3d-4488-4b48-a612-f2b771f7efbb	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:23:15.641455	2024-11-14 06:29:10.471177	t	2.50	f	t	1	\N
df932cc8-55fb-4f34-91d9-638a8b463d03	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU: untuk menjalankan aplikasi dan perangkat dalam komputer secara optimal\\nRAM: untuk menyimpan file,foto,video, dll.\\nmotherboard: perangkat yang menghubungkan semua komponen dalam komputer\\nhard disk: menyimpan data secara permanent\\nkartu grafis: menerjemahkan tampilan ke layar monitor ","images":[]}	t	2024-11-14 01:19:09.147518	2024-11-14 01:59:38.750922	f	0.00	f	f	1	\N
99fe2c84-cac3-4e25-b692-7bd13ad3778f	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU=Menyediakan daya ke komputer \\nRAM=Menyimpan data sementara saat komputer sedang memproses data\\nHardisk=Untuk menyimpan data pada komputer \\nMotherboard=perangkat keras yang menghubungkan seluruh komponen pada komputer \\nKartu grafis=kartu yang bertujuan untuk membuat animasi\\n","images":[]}	t	2024-11-14 01:23:15.64182	2024-11-14 01:48:39.99122	f	0.00	f	f	1	\N
3f04dc71-4393-4876-a3fe-2892a47b8f33	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:23:15.641458	2024-11-14 06:29:10.471179	t	2.50	f	t	1	\N
7f8fc21a-bda0-4c1f-9982-31e292246d49	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras dan perangkat lunak yang bekerja bersama untuk memproses data","images":[]}	t	2024-11-14 01:23:15.641797	2024-11-14 01:35:57.808276	f	0.00	f	f	1	\N
4aca0e4e-3cef-4061-a06f-9426b0ab5ce8	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras adalah menjalankan intruksi seperti keyboard Dan mouse\\nPerangkat lunak adalah memproses komputer \\nRAM Dan ROM","images":[]}	t	2024-11-14 01:17:40.134945	2024-11-14 01:24:18.227556	f	0.00	f	f	1	\N
d0db1afa-84be-4b75-a5b1-136885e41235	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:23:15.641461	2024-11-14 06:29:10.4712	t	2.50	f	t	1	\N
8b3d0668-da3c-4169-b227-c5033fb31bc0	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:23:15.641467	2024-11-14 06:29:10.471206	t	2.50	f	t	1	\N
76112128-8ac2-46e5-8ad7-6b9e3c27adc3	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	6b750f52-b5e9-4e1c-a131-b4969b8cb3a1	t	2024-11-14 01:23:15.64147	2024-11-14 06:29:10.47121	t	0.00	f	f	1	\N
4df87b78-6254-49d5-98a1-3bb722880875	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:23:15.641496	2024-11-14 06:29:10.471216	t	0.00	f	f	1	\N
37aad9a1-9925-4a36-99c0-e6e43c05723d	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:23:15.64153	2024-11-14 06:29:10.471242	t	2.50	f	t	1	\N
b51bec80-e3f7-481d-adcc-4074ad0be7eb	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:22.500387	2024-11-14 06:29:10.397591	t	2.50	f	t	1	\N
5a80c17e-7acb-493c-9a48-3f418fe61b5f	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU adalah central proses unit untuk memproses komponen komputer \\nRAM adalah menjalankan data untuk memproses \\nMotherboard adalah tempat utama sebuah komponen komputer\\nHard disk adalah tempat penyimpanan \\nKartu gratis atau VGA menampilkan layar ke monitor ","images":[]}	t	2024-11-14 01:17:40.134953	2024-11-14 01:29:48.18755	f	0.00	f	f	1	\N
0c82438c-5085-462d-a50f-cb02aa033990	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:35.753673	2024-11-14 06:29:10.928752	t	2.50	f	t	1	\N
11bf42e4-d3e2-430a-ba24-97ae1d1ef7e7	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:20.00169	2024-11-14 06:29:10.759137	t	2.50	f	t	1	\N
bc1ddf1a-c067-4f5d-a8d9-a44f2019a7fe	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:18:22.514826	2024-11-14 06:29:10.427508	t	2.50	f	t	1	\N
261a6e86-d31b-42e1-a5cb-812a8c384236	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:35.063157	2024-11-14 06:29:10.163219	t	2.50	f	t	1	\N
dd7528a2-40e2-48a7-9b79-9cc72639abf8	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"karena dapat menyimpan data secara ","images":[]}	t	2024-11-14 01:17:35.063238	2024-11-14 01:26:38.658253	f	0.00	f	f	1	\N
bd5ae99d-0de8-41df-b6fb-a4bb692c9aa6	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728656	2024-11-14 06:33:46.728656	f	0.00	f	f	1	\N
a2ee9232-26a7-41ac-9c47-d54723bf4bce	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:36.025045	2024-11-14 06:29:10.359829	t	2.50	f	t	1	\N
c15b6527-6d69-4d32-a18d-b473eba429d7	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras adalah perangkat yang dapat dilihat oleh mata contohnya keyboard, monitor, mouse. Perangkat lunak merupakan perangkat penunjang yang bekerja sama dengan perangkat keras untuk memasukan data","images":[]}	t	2024-11-14 01:20:32.003143	2024-11-14 01:30:15.625541	f	0.00	f	f	1	\N
578fb70a-8a2a-44c4-b1b6-66e90917f3e6	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7f0667ff-adaf-4c3c-816b-50430cd9a7cc	t	2024-11-14 01:17:41.446045	2024-11-14 06:29:10.07864	t	0.00	f	f	1	\N
62cd5c70-ba5e-498c-9261-398b01e02c8e	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:23:15.641441	2024-11-14 06:29:10.471166	t	0.00	f	f	1	\N
32eef0ea-6c6a-4206-ace9-6e408bf10554	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:19:30.347372	2024-11-14 06:29:10.541144	t	2.50	f	t	1	\N
5cfc3dc0-40b3-4183-91bc-1a657263b948	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:38.62739	2024-11-14 06:29:10.30587	t	2.50	f	t	1	\N
1955cf11-cc05-4d6d-9e3a-5802f33b17f8	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras dan perangkat lunak yang bekerja bersama untuk memproses data","images":[]}	t	2024-11-14 01:17:36.025137	2024-11-14 01:27:55.187034	f	0.00	f	f	1	\N
629a7621-c047-4557-9cbc-3cd937228410	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:23:14.132248	2024-11-14 06:29:10.332641	t	0.00	f	f	1	\N
2d502985-38d0-4d91-b01a-0b9a812a35ec	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:35.814379	2024-11-14 06:29:10.214391	t	2.50	f	t	1	\N
45404f28-a08d-4aa0-bbc8-f3e36bf8dd78	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.72866	2024-11-14 06:33:46.72866	f	0.00	f	f	1	\N
398c9654-730f-4ddc-ad1d-2a7b982f1799	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Menyimpan data ke dalam sistem memory card","images":[]}	t	2024-11-14 01:17:40.134957	2024-11-14 01:31:09.546327	f	0.00	f	f	1	\N
8d823f36-bbdb-45de-a7fb-fad056e367e7	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:44.901104	2024-11-14 06:29:10.791974	t	2.50	f	t	1	\N
8f6d2065-6433-4ea8-923b-683f1950676c	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:35.814389	2024-11-14 06:29:10.214405	t	0.00	f	f	1	\N
47fef88d-78e9-4aa3-bcfd-3a07a7008555	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ea29634f-0a27-49ae-bb17-dd3fc46a46d5	t	2024-11-14 01:17:53.462642	2024-11-14 06:29:10.276922	t	0.00	f	f	1	\N
18a90202-01fe-4919-b1e8-3a91eb94a628	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:53.46265	2024-11-14 06:29:10.27693	t	2.50	f	t	1	\N
cdb53ffe-b64d-4eec-9b52-376accb463a5	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:23:14.132287	2024-11-14 06:29:10.332662	t	0.00	f	f	1	\N
8db0114e-4091-46e7-b72e-65a02f67d540	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:23:15.641464	2024-11-14 06:29:10.471203	t	2.50	f	t	1	\N
13b2ebb9-bbd6-46d0-af39-c425784f2305	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:23:15.641499	2024-11-14 06:29:10.471219	t	2.50	f	t	1	\N
0984805a-762b-46fc-9dc2-d3de2d27b87b	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:17:36.254832	2024-11-14 06:29:10.510391	t	0.00	f	f	1	\N
1390c823-5738-4a8f-8f7f-13ffbab21831	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	6b750f52-b5e9-4e1c-a131-b4969b8cb3a1	t	2024-11-14 01:17:48.391966	2024-11-14 06:29:10.603128	t	0.00	f	f	1	\N
dd8a11b9-d156-4b94-a080-301f48c98bc8	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6a7e78e-78eb-4d78-9b4e-35e2a901f765	t	2024-11-14 01:17:48.391976	2024-11-14 06:29:10.603147	t	0.00	f	f	1	\N
cf69f414-d20a-40e5-be3e-8db2a4e166a0	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:45.178303	2024-11-14 06:29:10.632848	t	2.50	f	t	1	\N
10f21f23-eb81-4134-8d67-e8c84912cd26	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:20.001695	2024-11-14 06:29:10.759148	t	2.50	f	t	1	\N
5ba770a2-fbdf-4fed-b3b1-a2edb1f0ce91	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728662	2024-11-14 06:33:46.728663	f	0.00	f	f	1	\N
a88ee2f3-0a30-40b0-9e0d-61b47915b3a5	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:44.901107	2024-11-14 06:29:10.791988	t	2.50	f	t	1	\N
b1c61e33-b892-411b-9b25-2ee1d608cfe1	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:18:58.782511	2024-11-14 06:29:10.819512	t	0.00	f	f	1	\N
abd39c70-f522-4430-9d3a-b36cb3d97a1f	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:35.957186	2024-11-14 06:29:10.896448	t	0.00	f	f	1	\N
5305eec4-2d0f-44cc-8327-5a2067f930ae	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:35.753689	2024-11-14 06:29:10.928818	t	2.50	f	t	1	\N
48fdaf8d-de19-4e47-a039-e3f2d2f37218	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728666	2024-11-14 06:33:46.728666	f	0.00	f	f	1	\N
ab7ecd78-657c-41cc-bbab-01773858b8ba	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:20:32.002958	2024-11-14 06:29:10.046312	t	2.50	f	t	1	\N
bab1c125-190d-4ea3-93e9-86ab53885671	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:20:32.002976	2024-11-14 06:29:10.046344	t	0.00	f	f	1	\N
24342503-0275-4291-b3bd-0a67f0ac7ba5	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:20:32.003023	2024-11-14 06:29:10.04639	t	2.50	f	t	1	\N
e9fb917e-a45e-42fc-9f93-052848b68341	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728669	2024-11-14 06:33:46.728669	f	0.00	f	f	1	\N
69115571-b16b-4c5c-8dbe-ecd9e310d114	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:40.563288	2024-11-14 06:29:10.138157	t	2.50	f	t	1	\N
e4ce74a8-aa61-4faf-98ad-81c322f79f8b	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:35.814409	2024-11-14 06:29:10.214458	t	0.00	f	f	1	\N
f28c519d-7cb0-4dd7-9823-a339fc0c0622	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:23:15.641502	2024-11-14 06:29:10.471223	t	2.50	f	t	1	\N
883c0307-54bc-4795-8dca-6d3bec3e4e6d	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	6c0541e4-36b8-4a59-96a1-1204a9ff1b9d	t	2024-11-14 01:17:36.254803	2024-11-14 06:29:10.510343	t	0.00	f	f	1	\N
41edd7f8-9822-4db8-852e-d48191fbbc2d	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	23ded2d9-eb73-45c4-931a-60bb9f18f722	t	2024-11-14 01:17:36.254806	2024-11-14 06:29:10.510347	t	0.00	f	f	1	\N
d0e78eb2-7045-4ce0-88a5-f6f461fcfff7	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:36.254809	2024-11-14 06:29:10.510352	t	2.50	f	t	1	\N
72226f90-57c7-4ff7-bec9-d16bf3c1ec56	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:36.254812	2024-11-14 06:29:10.510356	t	2.50	f	t	1	\N
93be0265-befc-4d4b-ae6a-b0b4f1a36ff8	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:36.254835	2024-11-14 06:29:10.510396	t	0.00	f	f	1	\N
44a3a883-dda8-4ee7-8082-7eb434b82779	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:46.728672	2024-11-14 06:33:46.728672	f	0.00	f	f	1	\N
bb883d7d-607a-4373-b23c-1049569ef317	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:36.254838	2024-11-14 06:29:10.510401	t	0.00	f	f	1	\N
85af82f0-10c8-421d-ac60-ccfcffa996df	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	3d379d9b-ef44-4468-b621-b7754d2879df	t	2024-11-14 01:17:48.391991	2024-11-14 06:29:10.603158	t	0.00	f	f	1	\N
5d3f8848-db39-47e6-b0bf-db39c747a30a	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU : Menyediakan daya untuk perangkat keras\\nRAM : Memori sementara yang digunakan untuk menjalankan program\\nHardisk : Menyimpan data secara permanen\\nMotherboard : Perangkat keras yang menghubungkan semua komponen dalam komputer\\nKartu Grafis : perangkat yang bisa membuat animasi","images":[]}	t	2024-11-14 01:17:36.02514	2024-11-14 01:48:12.49479	f	0.00	f	f	1	\N
db314a16-395d-4026-8f42-b169862773da	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:46.72877	2024-11-14 06:33:46.72877	f	0.00	f	f	1	\N
f59333b6-4510-40f2-bda3-888e52f1680b	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"(perangkat keras) menggunakankan hardware untuk menjalankan operasi di dalam komputer \\nContoh:mouse, keyboard \\n(Perangkat lunak) Mengunakan perangkat didalam komputer untuk menjalankan komputer\\nContoh:cpu,lcd,rom\\n\\n","images":[]}	t	2024-11-14 01:17:22.500474	2024-11-14 01:37:47.321039	f	0.00	f	f	1	\N
05a20ded-a301-42e1-a79e-3a8f7692524c	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:46.728795	2024-11-14 06:33:46.728795	f	0.00	f	f	1	\N
06b8f097-b5df-49de-bada-7767960c8159	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:46.7288	2024-11-14 06:33:46.7288	f	0.00	f	f	1	\N
1f187da6-0c7d-4e64-9b15-de292cbb1bba	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:46.728804	2024-11-14 06:33:46.728804	f	0.00	f	f	1	\N
1782b8ce-11f8-49d6-b572-42f1d1281eac	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:46.728807	2024-11-14 06:33:46.728807	f	0.00	f	f	1	\N
929f9a7d-3bbd-453b-bf54-c55d6d0c0ac2	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491381	2024-11-14 06:33:48.491381	f	0.00	f	f	1	\N
34b3c6ea-bc9e-4a78-b697-997efb7a8a31	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491386	2024-11-14 06:33:48.491386	f	0.00	f	f	1	\N
62a04ca0-3541-45c1-8f6e-8ef2d9e588b4	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.49139	2024-11-14 06:33:48.49139	f	0.00	f	f	1	\N
cafb2586-0ee9-490a-87f0-d753d4e5172f	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491393	2024-11-14 06:33:48.491393	f	0.00	f	f	1	\N
f2f8ff30-3954-4d5c-8df0-a6de0c403aa0	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491397	2024-11-14 06:33:48.491397	f	0.00	f	f	1	\N
0b25fd25-efb3-47c8-91b1-f173dadafa91	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491399	2024-11-14 06:33:48.4914	f	0.00	f	f	1	\N
2832e996-63c3-42e3-a334-775c16d1c473	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491402	2024-11-14 06:33:48.491402	f	0.00	f	f	1	\N
c95d1999-b8ce-4165-b7ee-20ba33bfe646	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491406	2024-11-14 06:33:48.491406	f	0.00	f	f	1	\N
110b546f-1e43-4107-9c7c-88ebd996ae7f	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.49144	2024-11-14 06:33:48.49144	f	0.00	f	f	1	\N
9b12487b-4a28-4f52-8788-fe990c706762	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491443	2024-11-14 06:33:48.491444	f	0.00	f	f	1	\N
03a91297-4047-41c5-841f-f8a6131713d8	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491447	2024-11-14 06:33:48.491447	f	0.00	f	f	1	\N
86c98daf-0138-4eb3-accc-1a55a7cfebae	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.49145	2024-11-14 06:33:48.49145	f	0.00	f	f	1	\N
ff50f2ac-e0d0-46f2-b76e-29acc4f68a4e	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491453	2024-11-14 06:33:48.491453	f	0.00	f	f	1	\N
257769a0-6282-48c4-9033-93e818b9c5ed	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:48.491456	2024-11-14 06:33:48.491456	f	0.00	f	f	1	\N
877b0b57-6d4f-4fde-9598-595ef02590f3	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:48.491547	2024-11-14 06:33:48.491548	f	0.00	f	f	1	\N
59fb4306-29a0-4060-a57d-2c6e51e6c312	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:48.491551	2024-11-14 06:33:48.491551	f	0.00	f	f	1	\N
9cc6d62e-d1b8-4e68-9db3-fdf70c442867	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:48.491555	2024-11-14 06:33:48.491555	f	0.00	f	f	1	\N
1224be2d-158e-4ad2-851a-bd3ee11990d7	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:48.491558	2024-11-14 06:33:48.491559	f	0.00	f	f	1	\N
5fcd9d62-c40e-46f6-8021-96eb198d2a91	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:48.491562	2024-11-14 06:33:48.491562	f	0.00	f	f	1	\N
546baf48-c0ec-4da2-9f1e-d7957728d0d3	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282119	2024-11-14 06:33:49.282119	f	0.00	f	f	1	\N
d6ec8352-1e5a-426a-a7b0-8ce3be049b64	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282124	2024-11-14 06:33:49.282124	f	0.00	f	f	1	\N
c2bd8cfe-d6ee-4c3d-a243-ad6c4a8b10c4	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282126	2024-11-14 06:33:49.282126	f	0.00	f	f	1	\N
c062dc99-656b-4fcd-b42b-a3745da45032	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 06:33:48.491375	2024-11-14 06:34:21.02637	f	0.00	f	f	1	\N
78fdf91b-ae96-4fe4-a845-8463b171c47c	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 06:33:49.282113	2024-11-14 06:34:22.00346	f	0.00	f	f	1	\N
91bc9238-e807-4f02-aae6-436e08df99cb	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Motherboard merupakan tempat semua kabel kabel yang menunjang nyalanya komputer, komputer merupakan alat penampil data, CPU adalah daya komputer yang berisi kabel', hard disk merupakan alat penyimpan data permanen ","images":[]}	t	2024-11-14 01:20:32.003149	2024-11-14 01:35:04.922288	f	0.00	f	f	1	\N
73a08ca8-2802-45d9-b4ee-b92ff1730e11	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat keras:adalah perangkat yang bisa dilihat dan dipegang oleh manusia contoh:keyboard,mouse,monitor\\nperangkat lunak:adalah sistem operasi yang mengontrol komputer contoh:linux,windows","images":[]}	t	2024-11-14 01:18:22.514905	2024-11-14 01:34:39.459343	f	0.00	f	f	1	\N
33a2c2f9-77a2-4593-961e-6dd0757b3bbe	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"sistem yang mengendalikan atau menjalankan komputer dan menampilkan ","images":[]}	t	2024-11-14 01:17:35.063247	2024-11-14 01:33:48.468225	f	0.00	f	f	1	\N
b1c2198f-916f-48e4-82ec-6d1ab8908a7d	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem komputer adalah memproses data pada komputer ","images":[]}	t	2024-11-14 01:17:40.13496	2024-11-14 01:32:13.955411	f	0.00	f	f	1	\N
19a000fc-d8f9-4b63-a027-662d9f865389	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282129	2024-11-14 06:33:49.282129	f	0.00	f	f	1	\N
50b83e30-f8a0-4482-b68d-c87d7fd1287d	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Kumpulan perangkat keras dan perangkat lunak yang bekerja sama untuk memproses data","images":[]}	t	2024-11-14 01:17:45.178419	2024-11-14 01:34:32.931018	f	0.00	f	f	1	\N
db26320c-239b-4e83-bc8e-b61a41f675af	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hardware: perangkat keras yang digunakan untuk mengoperasikan data di komputer \\ncontoh: motherboard\\nsoftware: program dan data yang digunakan untuk mengoperasikan perangkat \\ncontoh:linux","images":[]}	t	2024-11-14 01:17:37.009547	2024-11-14 02:01:14.648903	f	0.00	f	f	1	\N
f78a454a-b6f5-42d7-9e8e-4fc7975f5c1b	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras dan perangkat lunak yang bekerja bersama untuk memproses data","images":[]}	t	2024-11-14 01:17:53.46278	2024-11-14 01:36:14.054029	f	0.00	f	f	1	\N
58e6f754-d0c5-4125-8b53-13a05875abe0	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"adalah sistem yang mengoperasikan/menjalankan sebuah komputer","images":[]}	t	2024-11-14 01:18:22.514911	2024-11-14 01:36:20.717402	f	0.00	f	f	1	\N
f1f69237-ce03-4820-96b5-f368a0c457e8	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"RAM : menyimpan data \\nmouse : untuk mengarahkan komputer \\nmonitor : layar, untuk melihat\\nCPU : untuk menyalakan komputer \\nkeyboard : mengetik dikomputer","images":[]}	t	2024-11-14 01:17:40.563376	2024-11-14 01:36:40.438526	f	0.00	f	f	1	\N
1cbd4599-c47e-4757-9997-0e4d8e088bd4	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras dan perangkat lunak yang bekerja sama dalam menjalankan komputer ","images":[]}	t	2024-11-14 01:23:14.132481	2024-11-14 01:34:31.419054	f	0.00	f	f	1	\N
598f67c6-cc7c-4526-b46b-ea9862ae2f80	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"untuk menjalankan sebuah komputer harus ada sistem operasi yang terdiri perangkat keras dan lunak","images":[]}	t	2024-11-14 01:17:41.446161	2024-11-14 01:33:38.806065	f	0.00	f	f	1	\N
f4d6eb85-7df5-40f3-a483-c610eea054da	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Himpunan perangkat keras dan perangkat lunak yang bekerja sama untuk memproses data","images":[]}	t	2024-11-14 01:17:36.254946	2024-11-14 01:35:12.65801	f	0.00	f	f	1	\N
5b79a4f6-0b60-473a-a988-8f60c56690ec	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:36.254842	2024-11-14 06:29:10.510405	t	2.50	f	t	1	\N
eb933744-1988-427b-9059-84f7dd2abbc6	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Agar membantu perangkat keras menjalankan Aplikasi yang membutuhkan Virtual memory. dan meningkatkan kecepatan perangkat","images":[]}	t	2024-11-14 01:17:38.627517	2024-11-14 01:35:21.478811	f	0.00	f	f	1	\N
5a095b00-4ad0-4f82-9c8d-7b5d7f51e1d0	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:36.254845	2024-11-14 06:29:10.51041	t	2.50	f	t	1	\N
70d5ac65-9315-4db0-90a8-42b5b974a385	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282132	2024-11-14 06:33:49.282132	f	0.00	f	f	1	\N
fd008fe3-bf26-432c-abcc-70ab2f914249	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem operasi adalah sistem komputer yang berfungsi menyalakan komputer dari perangkat' lainya","images":[]}	t	2024-11-14 01:20:32.003155	2024-11-14 01:36:49.621641	f	0.00	f	f	1	\N
1a1e6685-d03b-4098-b8e9-008abd312bdd	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282134	2024-11-14 06:33:49.282134	f	0.00	f	f	1	\N
91d8ba31-d91f-4c73-b9d1-d552f44f7b43	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282136	2024-11-14 06:33:49.282137	f	0.00	f	f	1	\N
ab111b7a-7fc8-43d5-9596-ad6919fc3874	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282146	2024-11-14 06:33:49.282146	f	0.00	f	f	1	\N
2255955f-531f-47fd-a43c-050d2817017d	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282149	2024-11-14 06:33:49.282149	f	0.00	f	f	1	\N
cbbce82b-90b9-42d3-80e9-e6bc5c745aad	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:17:37.561919	2024-11-14 06:29:10.6643	t	0.00	f	f	1	\N
9bb63978-b19b-46eb-ac7c-9af6b276bb3e	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:17:35.957205	2024-11-14 06:29:10.896474	t	0.00	f	f	1	\N
c9fad26f-6e0a-40d0-aae2-c388d7c0f8bd	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282151	2024-11-14 06:33:49.282151	f	0.00	f	f	1	\N
d0978b98-3224-4392-a4ae-6c9410acb7fb	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:20:32.002973	2024-11-14 06:29:10.046328	t	2.50	f	t	1	\N
edf20440-8c7b-4531-9ea9-fa4bb01177d2	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:20:32.002979	2024-11-14 06:29:10.046351	t	2.50	f	t	1	\N
19950fe8-dcfc-491a-9f46-a86195d5cd59	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:53.462679	2024-11-14 06:29:10.276948	t	2.50	f	t	1	\N
583d78c7-3987-4af4-a408-4a54819dffab	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:23:14.13233	2024-11-14 06:29:10.332718	t	2.50	f	t	1	\N
7aaf4a50-b53a-48a4-b376-e268c2241be5	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:17:36.254848	2024-11-14 06:29:10.510415	t	2.50	f	t	1	\N
4e4c2c47-830c-4ab6-9b5b-7c1d64d4e076	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:48.391979	2024-11-14 06:29:10.603152	t	0.00	f	f	1	\N
9d866b83-3663-4fdd-a578-ae49d29ec895	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:48.391994	2024-11-14 06:29:10.603166	t	0.00	f	f	1	\N
435b03f1-bbb5-4bd8-b4e6-4a5cb050ef5f	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:48.391996	2024-11-14 06:29:10.603171	t	2.50	f	t	1	\N
a75e08fe-0403-49a0-b3fe-136509b9683d	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ee16455a-ef12-4287-8a07-7c565e198cd2	t	2024-11-14 01:17:48.391999	2024-11-14 06:29:10.603176	t	0.00	f	f	1	\N
6fa594ce-38c5-4007-9e36-7f35f8a2c9f8	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	t	2024-11-14 01:17:48.392003	2024-11-14 06:29:10.603198	t	0.00	f	f	1	\N
46bfe56b-9166-48e8-9533-b52a7d87830f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:35.957198	2024-11-14 06:29:10.896464	t	2.50	f	t	1	\N
bbd559ac-d6f4-4913-b4c8-3c2c87292ffd	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282154	2024-11-14 06:33:49.282154	f	0.00	f	f	1	\N
20b08e80-ac76-45e7-9b3d-f1c5f6ba1852	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Sistem yang menjalankan sebuah layar yang digerakkan oleh perangkat yang ada di dalam maupun di luar Komputer ","images":[]}	t	2024-11-14 01:17:22.500476	2024-11-14 01:39:38.671506	f	0.00	f	f	1	\N
caf541fe-e384-4caf-b215-8e397f0f4f0d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282156	2024-11-14 06:33:49.282156	f	0.00	f	f	1	\N
95cd6c95-798a-4927-a9e7-0c87e98b2f63	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.282159	2024-11-14 06:33:49.282159	f	0.00	f	f	1	\N
70054c03-42c3-4a54-bd0d-05a67384edfc	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.28222	2024-11-14 06:33:49.28222	f	0.00	f	f	1	\N
b469f893-1774-4b90-8804-f6d901d64a69	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.282223	2024-11-14 06:33:49.282223	f	0.00	f	f	1	\N
b887efc2-865d-41fe-8438-1175c40a71be	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.282226	2024-11-14 06:33:49.282226	f	0.00	f	f	1	\N
f7386c29-3d6b-4321-bd9f-ce7a34a5f017	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.282229	2024-11-14 06:33:49.282229	f	0.00	f	f	1	\N
aba1d131-4b36-4d18-aed0-33dc08fa7452	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.282231	2024-11-14 06:33:49.282231	f	0.00	f	f	1	\N
8628e525-2368-40ce-9849-6f4c1c89a812	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929504	2024-11-14 06:33:49.929504	f	0.00	f	f	1	\N
5c6ec831-7389-4124-beaa-ebe42e9b9aa6	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929535	2024-11-14 06:33:49.929535	f	0.00	f	f	1	\N
4c964164-6a61-41d6-853f-045a2bbda8f5	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929539	2024-11-14 06:33:49.929539	f	0.00	f	f	1	\N
53f71ea9-5f4f-4089-b989-d72e0532c3fa	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"riki","images":[]}	t	2024-11-14 01:17:50.375296	2024-11-14 01:49:59.694925	f	0.00	f	f	1	\N
940e9db5-d91b-4898-8aa5-f381023dc554	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hardware= perangkat keras (komponen penting untuk memoprasikan komputer)\\nsoftware=perangkat lunak (pemrogaman yang membantu dalam sistem komputer)\\nContoh hardware: Printer,Monitor, cpu\\nSoftware: microsoft office, aplikasi","images":[]}	t	2024-11-14 01:17:35.814566	2024-11-14 01:38:19.318312	f	0.00	f	f	1	\N
387f2ede-b524-4b49-84da-a945feb30cca	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras\\nMerupakan komponen fisik yang dapat dilihat dan disentuh, seperti keyboard, mouse, monitor, CPU, dan hard drive. Perangkat keras bersifat permanen dan tidak berubah kecuali dilakukan penggantian atau perbaikan fisik. \\nPerangkat lunak\\nMerupakan program yang berjalan di komputer agar dapat digunakan, seperti MS Word Photoshop Microsoft Windows, Microsoft Office, dan sebagainya. Perangkat lunak bersifat virtual dan terdiri dari serangkaian instruksi yang tidak dapat dilihat secara langsung. Perangkat lunak dapat diperbarui atau dimodifikasi tanpa mengganti perangkat keras itu sendiri","images":[]}	t	2024-11-14 01:17:47.931156	2024-11-14 01:39:26.188657	f	0.00	f	f	1	\N
f6265c72-0460-423e-8e16-8aacd7767533	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Perangkat keras: perangkat yang bisa dipegang contoh: keyboard, mouse, monitor\\nPerangkat lunak: perangkat yang tidak dapat dipegang contoh: software, Microsoft ","images":[]}	t	2024-11-14 01:17:53.462786	2024-11-14 01:50:27.189694	f	0.00	f	f	1	\N
ca0a4ec4-9b91-4c9b-a69c-f56dc61fe514	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"cpu: mengolah dan menjalankan instruksi\\nram: penyimpanan untuk sistem operasi\\nmotherboard: perangkat keras yang menghubungkan semua komponen dlm komputer \\nhard disk: menyimpan data secara permanen\\nkartu grafis: untuk membuat animasi \\n\\n","images":[]}	t	2024-11-14 01:17:37.009544	2024-11-14 01:47:59.5587	f	0.00	f	f	1	\N
0f6b7088-dbd3-463e-b92a-470845fc0fd0	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929548	2024-11-14 06:33:49.929548	f	0.00	f	f	1	\N
aec68e1d-1eb9-4af6-a1c0-e066d0dff933	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:20:32.00303	2024-11-14 06:29:10.046403	t	0.00	f	f	1	\N
634bf839-cb3d-458a-9264-ecc92537b51d	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware= perangkat keras, contoh:CPU, keyboard\\nSoftware= perangkat lunak, contoh: RAM, Rom","images":[]}	t	2024-11-14 01:23:14.132507	2024-11-14 01:50:01.194643	f	0.00	f	f	1	\N
c5dedcab-aefc-49a7-8874-a666dd974e80	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"himpunan perangkat keras dan perangkat lunak yang berkerja bersama untuk memproses data","images":[]}	t	2024-11-14 01:17:35.753771	2024-11-14 01:40:19.17965	f	0.00	f	f	1	\N
008fdc41-1c56-4136-89a8-c68ecef632bb	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Cpu: yang menjalankan sebuah sistem\\nRam: memory sementara untuk menjalankan program \\nMotherboard: mengontrol keyboard \\nHard disk: tempat penyimpanan/pemindahan data\\nKartu grafis: membuat sebuah gambar ","images":[]}	t	2024-11-14 01:17:22.500479	2024-11-14 01:47:49.599902	f	0.00	f	f	1	\N
b34fe578-2074-446d-b6a3-4245b2e91448	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:41.446034	2024-11-14 06:29:10.078621	t	2.50	f	t	1	\N
bce56618-0867-4be6-9cf1-9ccd5977d815	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ea29634f-0a27-49ae-bb17-dd3fc46a46d5	t	2024-11-14 01:17:41.446038	2024-11-14 06:29:10.07863	t	0.00	f	f	1	\N
6c778165-efd5-44ac-aceb-790370279a4e	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:40.134721	2024-11-14 06:29:10.110061	t	2.50	f	t	1	\N
990b0dda-0e33-4823-bbfb-d2aa4312e2b5	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:40.134729	2024-11-14 06:29:10.110069	t	2.50	f	t	1	\N
aa98d01c-818d-49b3-9bd7-c52a0b0f6a04	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	bc5f8e93-5070-4087-a3dc-4419fd10b988	t	2024-11-14 01:17:40.134752	2024-11-14 06:29:10.110073	t	0.00	f	f	1	\N
7a341aec-1fba-4a44-a743-00e04684cea9	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:40.134757	2024-11-14 06:29:10.11008	t	2.50	f	t	1	\N
28c66c96-2a81-4a75-aa58-d826303ea798	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	72e2bb70-10bc-4e2f-a909-df97927a5f56	t	2024-11-14 01:17:40.134763	2024-11-14 06:29:10.110089	t	0.00	f	f	1	\N
7e5d9add-abd9-4614-9efb-109027481d19	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:40.134766	2024-11-14 06:29:10.110098	t	2.50	f	t	1	\N
adc3b9c0-0055-4997-9e39-e44b6c26d01c	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:40.134771	2024-11-14 06:29:10.110103	t	2.50	f	t	1	\N
21948968-d549-4030-8fd0-59527747e56c	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	a55cecbc-f818-4181-92f3-fa43b906a15a	t	2024-11-14 01:17:35.063113	2024-11-14 06:29:10.163168	t	0.00	f	f	1	\N
95d774d6-78dd-4cb5-b01b-4a5010a1db4e	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:19:30.347383	2024-11-14 06:29:10.541159	t	2.50	f	t	1	\N
ab59b7db-3f59-44b5-bfd4-909091b4c39f	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:19:30.347386	2024-11-14 06:29:10.541163	t	0.00	f	f	1	\N
a74f0a3f-9e8e-44b7-b45a-1134f9e9226d	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.92955	2024-11-14 06:33:49.929551	f	0.00	f	f	1	\N
62b2b005-749d-4266-808c-1f9db14ca966	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929553	2024-11-14 06:33:49.929554	f	0.00	f	f	1	\N
763efde3-3c1c-410f-bd64-597dd1f64927	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929556	2024-11-14 06:33:49.929556	f	0.00	f	f	1	\N
80379a29-0f70-4cdb-916a-5936e0661e95	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929558	2024-11-14 06:33:49.929558	f	0.00	f	f	1	\N
ffcfc6e2-da21-4310-882e-97e18cf5ab34	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929561	2024-11-14 06:33:49.929561	f	0.00	f	f	1	\N
5d84e33e-b4e8-4d30-876b-4a7ec84a4830	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929572	2024-11-14 06:33:49.929573	f	0.00	f	f	1	\N
a1be06bd-1161-4f47-89cf-a3d2fa2e938d	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929575	2024-11-14 06:33:49.929575	f	0.00	f	f	1	\N
82d0ed8c-81e0-4798-964f-a79d02ac2276	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU= menyediakan daya untuk komputer \\nRam= sebagai tempat penyimpanan data dalam komputer \\nMotherboard= menjalankan tugas dari komputer\\nHard disk= menyimpan data secara permanen \\nKartu grafis= papan yang ada di motherboard.\\nKartu grafis=","images":[]}	t	2024-11-14 01:23:14.132504	2024-11-14 01:49:26.317462	f	0.00	f	f	1	\N
ed86af7c-29a4-4fe0-b1f1-50ba99fac1ff	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Keyboard: untuk menginput data dan mengetik angka dan huruf ","images":[]}	t	2024-11-14 01:17:45.178424	2024-11-14 01:45:56.210756	f	0.00	f	f	1	\N
19f89dcc-2611-4e53-99b2-6b6cf2da8bd4	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU: menyediakan daya untuk komputer \\nRAM: menyimpan data\\nMotherboard:pusat pengaturan \\nHard disk: menyimpan data secara permanen \\nKartu grafis:papan yang ada di moderboard","images":[]}	t	2024-11-14 01:17:53.462789	2024-11-14 01:48:59.814859	f	0.00	f	f	1	\N
da37df4b-e572-4c82-85bc-5fba935d0e3a	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"cpu: menyediakan daya untuk perangkat keras\\nram:memori sementara yang digunakan untuk menjalankan program\\nmotherboard:menjalankan aplikasi\\nhardisk: menyimpan data secara permanen \\nkartu grafis:memunculkan animasi pada monitor","images":[]}	t	2024-11-14 01:18:22.514914	2024-11-14 01:52:22.82977	f	0.00	f	f	1	\N
1373dc41-7a1d-4b60-9946-3e7ce4b306f4	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Motherboard: Tempat memasang komponen internal komputer, seperti prosesor, RAM, kartu grafis, dan perangkat penyimpanan. Motherboard juga mengatur komunikasi dan transfer data, menyediakan daya, dan menyediakan port eksternal. \\nProsesor: Juga dikenal sebagai Central Processing Unit (CPU), prosesor mengatur seluruh proses yang berjalan di dalam komputer. \\nRAM: Random Access Memory (RAM) adalah perangkat memori penyimpanan sementara untuk data yang dibutuhkan CPU. \\nHard disk: Perangkat penyimpanan data dalam jangka panjang. ","images":[]}	t	2024-11-14 01:17:47.931164	2024-11-14 01:44:13.475894	f	0.00	f	f	1	\N
37e3ea86-0d03-4897-b06f-9ba849bf6059	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929578	2024-11-14 06:33:49.929578	f	0.00	f	f	1	\N
e74ef44b-731a-43b3-9920-64481029341a	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"perangkat lunak yang berfungsi sebagai perantara antara pengguna dan perangkat keras komputer. Sistem operasi memiliki beberapa fungsi penting, di antaranya: \\nMengelola sumber daya komputer, seperti memori dan proses yang berjalan \\nMengatur akses pengguna \\nMenjalankan program \\nMenyediakan antarmuka pengguna yang intuitif \\nMengelola perangkat keras dan perangkat lunak \\nMenyediakan layanan jaringan, seperti sharing file, sharing printer, atau akses internet \\nMengalokasikan sumber daya ke proses ","images":[]}	t	2024-11-14 01:17:47.931162	2024-11-14 01:43:24.623349	f	0.00	f	f	1	\N
5e8358ac-781b-4dd8-aeab-92c38a0aaac6	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hard ware yang bisa di pegang\\nsoft ware yang ada di dalam komputer\\ncontoh : keyboard, mouse\\ncontoh : Linux, Windows, MacOs","images":[]}	t	2024-11-14 01:17:36.025154	2024-11-14 01:43:09.056799	f	0.00	f	f	1	\N
4100ff15-8c9f-4610-bcec-462622ea2725	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Cpu= menyediakan daya komputer\\nRam= menyimpan dara secara permanen\\nMotherboard=pusat pengaturan\\nhard disk=perangkat keras menyimpan data elektronik\\nkartu grafis= pepan tambahan yang dimasukkan ke dalam alot pada motherboard komputer","images":[]}	t	2024-11-14 01:17:35.814573	2024-11-14 01:43:34.81781	f	0.00	f	f	1	\N
03872fee-1f56-4e65-8ef0-5d7b1c4b226c	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.92958	2024-11-14 06:33:49.92958	f	0.00	f	f	1	\N
017ed4bf-4ecd-4887-ab3a-acfbf0254399	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929583	2024-11-14 06:33:49.929583	f	0.00	f	f	1	\N
40cc5e15-b1a9-4d93-9126-428bf9f52896	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:33:49.929585	2024-11-14 06:33:49.929585	f	0.00	f	f	1	\N
80d3d42e-586e-4d8d-9031-86573f23876a	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.929666	2024-11-14 06:33:49.929667	f	0.00	f	f	1	\N
48a1e669-b005-42cc-ae7d-d60787d9dbc2	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.929676	2024-11-14 06:33:49.929677	f	0.00	f	f	1	\N
de79f76c-f432-4bb3-808c-0569ffa20fe7	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:35.063119	2024-11-14 06:29:10.163175	t	0.00	f	f	1	\N
e6d1aaba-8c95-47eb-b17b-c08d9d159e6e	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:47.931053	2024-11-14 06:29:10.189051	t	2.50	f	t	1	\N
598a9a9a-5298-45dd-9b13-cdcf7e215b87	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:47.931056	2024-11-14 06:29:10.189054	t	2.50	f	t	1	\N
4a684def-6d62-4560-b34a-b20eb30dd86b	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:47.931059	2024-11-14 06:29:10.189058	t	0.00	f	f	1	\N
b234cac1-2bdd-40c0-9d02-d60f0e70a456	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:47.931061	2024-11-14 06:29:10.189073	t	2.50	f	t	1	\N
90f888ba-afea-4352-b59d-e0d7e103eeb6	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:47.931064	2024-11-14 06:29:10.189079	t	2.50	f	t	1	\N
dda7976e-aaec-4440-85d7-19169fdf60e5	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:47.931067	2024-11-14 06:29:10.189082	t	0.00	f	f	1	\N
83d35c90-4ff9-487f-9d34-0631637ee704	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:47.931069	2024-11-14 06:29:10.189085	t	0.00	f	f	1	\N
a0fddd77-a607-41a5-99c7-ccd913de14f3	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:19:30.347389	2024-11-14 06:29:10.541168	t	0.00	f	f	1	\N
a1165aa4-9969-455a-bd92-2fd4ce45dac9	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	27f6271a-611b-49f0-9aaa-1bf5849d1072	t	2024-11-14 01:19:30.347444	2024-11-14 06:29:10.541175	t	2.50	f	t	1	\N
dadd020c-8b26-490d-9c4c-7cb704b7a755	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:19:30.347447	2024-11-14 06:29:10.541179	t	2.50	f	t	1	\N
c664aeaa-1ca2-4e3a-9ed9-1fe0bd56df95	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:19:30.347451	2024-11-14 06:29:10.541183	t	2.50	f	t	1	\N
8efb2985-90bd-4f8d-be09-21cc847a507c	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:48.392015	2024-11-14 06:29:10.603221	t	2.50	f	t	1	\N
122cbb1c-da15-4c88-a0bd-179f2f7681b2	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.929679	2024-11-14 06:33:49.929679	f	0.00	f	f	1	\N
9ec0b9e7-8e9f-4118-bfce-97a37e4a70d3	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:19:30.347454	2024-11-14 06:29:10.541188	t	2.50	f	t	1	\N
902e59bf-b57e-482c-958c-47194b5b7089	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"adalah sistem yang digunakan untuk menjalankan suatu komputer","images":[]}	t	2024-11-14 01:18:22.514902	2024-11-14 01:44:35.561491	f	0.00	f	f	1	\N
f0d68c0e-5c40-486c-bc98-3c04a2dea62e	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	36cfbefb-3388-42ba-92ab-edc24b4cfe4b	t	2024-11-14 01:17:47.931089	2024-11-14 06:29:10.189109	t	0.00	f	f	1	\N
1d374f9d-8344-451e-ba6b-67bc87ef0082	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Hardware: keyboard,mouse,cpu, monitor \\nSoftware: Linux,\\nSoftware: progam dan data yang digunakan untuk mengoperasikan perangkat keras \\nHardware: perangkat keras yang digunakan untuk mengoperasikan data di komputer ","images":[]}	t	2024-11-14 01:17:45.178436	2024-11-14 02:02:07.245215	f	0.00	f	f	1	\N
485c029a-625d-4367-8d06-f37cdb3cb1f8	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5eaf2a68-d1ff-4d8d-8d7f-a2c25d47109c	t	2024-11-14 01:17:35.814376	2024-11-14 06:29:10.214372	t	0.00	f	f	1	\N
ef6dd3f8-5cf7-4949-ba43-e421337d67be	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"CPU=menyediakan  daya komputer\\nRAM=memori sementara yang di gunakan untuk menjalankan progam\\nMotherboard=perangkat keras yang menghubungkan semua komponen dalam komputer\\nHard disk=menyimpan data secara permanen\\nKartu grafis=kartu yang bertujuan untuk membuat animasi","images":[]}	t	2024-11-14 01:17:36.25497	2024-11-14 01:48:59.356881	f	0.00	f	f	1	\N
a30de85a-6626-4fdf-8073-a6b12347bc0a	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:35.814382	2024-11-14 06:29:10.214395	t	2.50	f	t	1	\N
3484eebe-8006-4ee5-82cb-0f7f9fcfe8d6	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	t	2024-11-14 01:17:35.814386	2024-11-14 06:29:10.2144	t	0.00	f	f	1	\N
b17b9710-c66b-4c05-bf71-9565d446dd83	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:35.814392	2024-11-14 06:29:10.214409	t	2.50	f	t	1	\N
4890a548-1f50-41dd-b56f-aa27f84dca8a	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"hard ware=perangkat keras yang di gunakan untuk mengoprasikan data di komputer,contoh motherbord\\nsoftware=progam dan data yang di gunakan untuk mengoprasikan perangkat,contoh linux","images":[]}	t	2024-11-14 01:17:35.753777	2024-11-14 02:03:14.796478	f	0.00	f	f	1	\N
01ab4c14-87a2-4fb8-a00f-9e006b07ecca	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:17:35.814412	2024-11-14 06:29:10.214462	t	0.00	f	f	1	\N
740dc34b-f113-4107-99d2-f04a69ea1fee	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:35.814415	2024-11-14 06:29:10.214466	t	2.50	f	t	1	\N
37937407-c98e-4fc0-91a7-c20ec2e096fb	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:35.814432	2024-11-14 06:29:10.214469	t	0.00	f	f	1	\N
079d799d-aa3e-4486-959e-9ba26e8a01ac	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:35.814435	2024-11-14 06:29:10.214473	t	2.50	f	t	1	\N
f686ec61-caee-4cd7-b671-b83c403994e3	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:35.81447	2024-11-14 06:29:10.214476	t	2.50	f	t	1	\N
e4b3284a-7779-4184-9342-272280ae899a	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:19:30.347456	2024-11-14 06:29:10.541215	t	2.50	f	t	1	\N
5d291f72-3a04-4095-a0a7-5d11889230dc	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:19:30.347459	2024-11-14 06:29:10.541219	t	2.50	f	t	1	\N
edc5febb-894f-4c51-84fa-424dd2fcbd22	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:18:18.607252	2024-11-14 06:29:10.571908	t	2.50	f	t	1	\N
381a42c8-2abb-4957-b23a-c4221e13433b	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:18:18.607258	2024-11-14 06:29:10.571916	t	2.50	f	t	1	\N
42b6d091-05b9-4a2a-8164-fe38ea1ef990	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:18:18.607262	2024-11-14 06:29:10.57192	t	2.50	f	t	1	\N
2cabd26e-134d-48e7-8bd9-cbb694901185	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:51.277577	2024-11-14 06:29:10.725338	t	2.50	f	t	1	\N
fac7b255-e6c7-43db-8e84-f20a01a06adb	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:51.277581	2024-11-14 06:29:10.725403	t	2.50	f	t	1	\N
47b1fb9d-2eed-4b2b-bea7-7e8a44a835ea	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:51.277584	2024-11-14 06:29:10.725408	t	2.50	f	t	1	\N
b04529b8-60ac-4be1-ba73-9f19319ceec8	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	770c80d5-871e-48d0-9975-1703f320a722	t	2024-11-14 01:17:51.277589	2024-11-14 06:29:10.725414	t	0.00	f	f	1	\N
e5085950-9b84-4edf-836a-a2c45e87317e	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:51.277592	2024-11-14 06:29:10.725419	t	2.50	f	t	1	\N
362c302a-2109-4532-b04d-5833870740f4	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	t	2024-11-14 01:17:51.277595	2024-11-14 06:29:10.725428	t	0.00	f	f	1	\N
0cfad000-2d1b-4fab-a0c9-18ae5aa7f2a5	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	cd7b7b32-656f-4c27-9865-cf00064a6039	t	2024-11-14 01:17:51.277599	2024-11-14 06:29:10.725433	t	0.00	f	f	1	\N
1424ded4-aab3-4051-98b1-fa55dea35af9	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:51.277632	2024-11-14 06:29:10.725442	t	2.50	f	t	1	\N
3cab685a-b1b0-487b-9b5e-38cfef2f8d0b	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.929682	2024-11-14 06:33:49.929682	f	0.00	f	f	1	\N
8545d318-a385-4818-84c6-9c4dd640f3af	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:33:49.929685	2024-11-14 06:33:49.929685	f	0.00	f	f	1	\N
ca9c9462-ffab-4ec7-85af-25d99d18df3b	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 06:33:17.669857	2024-11-14 06:34:01.577607	f	0.00	f	f	1	\N
7e735ff8-f502-43e3-8744-66bf04ac7534	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.239986	2024-11-14 06:34:03.239987	f	0.00	f	f	1	\N
afe7fda3-d785-4d4c-994c-d71f56d5eb86	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.239997	2024-11-14 06:34:03.239997	f	0.00	f	f	1	\N
162c2c37-288b-4516-bb1d-e99d1005453c	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240001	2024-11-14 06:34:03.240002	f	0.00	f	f	1	\N
55062e69-1bd5-4d3e-9892-375b23f92b94	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240032	2024-11-14 06:34:03.240033	f	0.00	f	f	1	\N
b123be62-56ff-48f5-b53f-59b4fc7745a8	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240036	2024-11-14 06:34:03.240036	f	0.00	f	f	1	\N
041f6474-6a8b-4bb2-8e35-f2e7e9837a6e	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240041	2024-11-14 06:34:03.240041	f	0.00	f	f	1	\N
ba375b27-b497-49ff-9108-4b7216915f1f	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240044	2024-11-14 06:34:03.240044	f	0.00	f	f	1	\N
79ce5efd-5ea7-44e8-ab17-17f3fb42777e	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240046	2024-11-14 06:34:03.240047	f	0.00	f	f	1	\N
1fd152c1-cc5a-4884-9760-762e5d4ef186	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240049	2024-11-14 06:34:03.24005	f	0.00	f	f	1	\N
17cff909-a697-434b-86e0-e9e2e3b91e63	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Cpu=menyediakan daya intuk perangkat keras\\nRam=memory sementara untuk progarm\\nMotherbord=perangkat keras yang menghubungkan semua komponen dalam komputer\\nHard disk=menyimpan data secara permanen\\nKartu grafis=untuk membuat animasi","images":[]}	t	2024-11-14 01:17:35.753785	2024-11-14 02:07:37.25042	f	0.00	f	f	1	\N
19125a8e-5a32-474d-b3d8-4d1a89c1cc8d	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:17:20.001693	2024-11-14 06:29:10.759141	t	0.00	f	f	1	\N
e4726f9d-b834-45f0-a4d0-5aa1b4fb456e	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:20.001698	2024-11-14 06:29:10.759174	t	2.50	f	t	1	\N
fcf86f77-1fb7-4b25-86a7-3993e1fac2cc	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:20.001719	2024-11-14 06:29:10.759196	t	2.50	f	t	1	\N
0d9ca0ea-ae22-456b-a217-a2b078a1bc71	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	860aecdf-b63e-48de-8984-a4629e1348a6	t	2024-11-14 01:17:20.001721	2024-11-14 06:29:10.7592	t	0.00	f	f	1	\N
60dd2a51-f14e-4d97-ba60-525ae706467f	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:20.001724	2024-11-14 06:29:10.759204	t	2.50	f	t	1	\N
ab742fdc-436b-4639-a882-fe217a8a15db	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:44.901146	2024-11-14 06:29:10.792045	t	0.00	f	f	1	\N
24ff7270-b5ff-4145-afd5-ed5675745209	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:44.901149	2024-11-14 06:29:10.792047	t	2.50	f	t	1	\N
7e7e3c87-9a3c-4765-a01e-b06c683f7200	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:44.901151	2024-11-14 06:29:10.79205	t	2.50	f	t	1	\N
5c705736-2a1c-42e8-9ece-41b15b397263	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	{"text":"Virtual memory fisik digunakan untuk tambahan memory saat penuh. Cara kerjanya akan menambah tambahan memory","images":[]}	t	2024-11-14 01:17:35.957321	2024-11-14 02:08:40.567929	f	0.00	f	f	1	\N
fc7c9520-f490-488d-8547-51420f89863b	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:18:58.782515	2024-11-14 06:29:10.819518	t	2.50	f	t	1	\N
c2770dcf-8405-4f15-9a0a-a8c68dde16e6	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0dc24724-0b23-4746-a205-11bcb152979a	t	2024-11-14 01:18:58.782517	2024-11-14 06:29:10.819523	t	0.00	f	f	1	\N
06d9be32-fe43-489f-a960-2088a625a17a	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:18:58.782528	2024-11-14 06:29:10.819548	t	2.50	f	t	1	\N
7839d38a-30ad-43ab-907d-0921934bc5c7	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:18:58.782531	2024-11-14 06:29:10.819579	t	2.50	f	t	1	\N
52dc5e55-0fdc-4525-bbf0-79ea63b39beb	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:18:58.782534	2024-11-14 06:29:10.819583	t	2.50	f	t	1	\N
9a265aac-36a6-427e-b3d9-2344c9988862	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d984d461-df4b-4e77-8d22-bd76fd7cf27e	t	2024-11-14 01:18:58.782537	2024-11-14 06:29:10.819588	t	0.00	f	f	1	\N
e6f122aa-f2cb-463e-92d0-77af1eafa0d9	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:18:58.782574	2024-11-14 06:29:10.819596	t	0.00	f	f	1	\N
4eb21348-b3bf-4a5c-bc06-59ed1bb8e4d6	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:54.911885	2024-11-14 06:29:10.863464	t	0.00	f	f	1	\N
7c532d05-e685-490b-a91e-7a1d0d6f58a6	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:54.911888	2024-11-14 06:29:10.863468	t	2.50	f	t	1	\N
45ac7aab-8104-4e97-8495-e08569d58bee	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:54.911922	2024-11-14 06:29:10.863507	t	2.50	f	t	1	\N
df0290fa-0867-4220-9330-95de3f603c7e	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:54.911925	2024-11-14 06:29:10.863511	t	0.00	f	f	1	\N
f05896df-d529-4224-81d7-63784da99232	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	23ded2d9-eb73-45c4-931a-60bb9f18f722	t	2024-11-14 01:17:54.911927	2024-11-14 06:29:10.863516	t	0.00	f	f	1	\N
661acfc8-9004-4335-ba45-92d299cac6d5	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:54.91193	2024-11-14 06:29:10.863521	t	2.50	f	t	1	\N
b3a2ab35-0598-412a-aae5-6be4c3bee5a0	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d984d461-df4b-4e77-8d22-bd76fd7cf27e	t	2024-11-14 01:17:54.911932	2024-11-14 06:29:10.863526	t	0.00	f	f	1	\N
07625d5f-2a13-467d-b3cf-40c85231a1e8	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	deecc61c-9230-4223-9ec6-34fdb4e91a45	t	2024-11-14 01:17:54.911935	2024-11-14 06:29:10.86353	t	0.00	f	f	1	\N
400da8f4-a534-4262-8b93-a4957297e1cd	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:35.957156	2024-11-14 06:29:10.896399	t	2.50	f	t	1	\N
65c44065-e17f-4d97-b967-4d8ac7a7891e	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:35.95718	2024-11-14 06:29:10.896405	t	2.50	f	t	1	\N
acef1364-5044-4dd7-9204-3b70591100f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:35.957183	2024-11-14 06:29:10.896442	t	0.00	f	f	1	\N
14b1cb15-dfd7-48ef-8983-dda38807daab	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:35.957189	2024-11-14 06:29:10.896453	t	0.00	f	f	1	\N
4f8606f2-fe1f-4f30-b354-6e6bfeb4599c	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:35.957195	2024-11-14 06:29:10.89646	t	2.50	f	t	1	\N
867f19f7-d1d0-412f-ad74-6983008a36a8	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240063	2024-11-14 06:34:03.240063	f	0.00	f	f	1	\N
530b63b4-56bd-4d60-82d3-0e7a8581df3d	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240065	2024-11-14 06:34:03.240066	f	0.00	f	f	1	\N
d68908a4-7996-406d-bfc8-2b38f0427cdc	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240068	2024-11-14 06:34:03.240068	f	0.00	f	f	1	\N
46b37f9a-e310-4825-83ca-b91b659be618	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.24007	2024-11-14 06:34:03.24007	f	0.00	f	f	1	\N
ea116b22-d47c-4f49-9dcf-3c8a25a24d82	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240073	2024-11-14 06:34:03.240073	f	0.00	f	f	1	\N
2946c828-1e7f-4c60-a30a-f8d7f42d6b56	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:03.240075	2024-11-14 06:34:03.240075	f	0.00	f	f	1	\N
682fe54f-622b-444f-8942-723b5d0a1da2	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:03.240175	2024-11-14 06:34:03.240175	f	0.00	f	f	1	\N
e6261809-cea0-469b-a28c-e72fe4540e17	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:03.240179	2024-11-14 06:34:03.240179	f	0.00	f	f	1	\N
1e8950ac-46ea-41bc-8e8c-84ff4eeabc5a	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:03.240182	2024-11-14 06:34:03.240182	f	0.00	f	f	1	\N
51c26cfe-0eb5-448f-a191-9655c9b98844	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:03.240185	2024-11-14 06:34:03.240185	f	0.00	f	f	1	\N
b4da7a97-524d-4f19-b51e-210f54ef7aa5	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:03.240187	2024-11-14 06:34:03.240188	f	0.00	f	f	1	\N
18480636-5037-4efe-a72b-68db4ab39e74	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 06:33:49.282109	2024-11-14 06:34:03.539402	f	0.00	f	f	1	\N
e0a3af5b-650d-4952-b88a-c222003b5ab8	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849496	2024-11-14 06:34:10.849496	f	0.00	f	f	1	\N
1032b9d7-f551-4bf7-aab6-aa7285fbd4bc	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849508	2024-11-14 06:34:10.849508	f	0.00	f	f	1	\N
fccc3051-9547-4583-9c8b-86e8f9a86216	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849511	2024-11-14 06:34:10.849512	f	0.00	f	f	1	\N
94c47ce7-7454-4e14-8f90-e7a0cb79e744	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849852	2024-11-14 06:34:10.849852	f	0.00	f	f	1	\N
fcbc1880-0123-47d7-9484-f8c892aef68b	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849858	2024-11-14 06:34:10.849858	f	0.00	f	f	1	\N
7934d6fd-aa88-4ca6-b59f-007ef96a737a	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.84986	2024-11-14 06:34:10.84986	f	0.00	f	f	1	\N
0994fae5-2a98-43c7-b855-9c070e11eced	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849863	2024-11-14 06:34:10.849863	f	0.00	f	f	1	\N
7ef17aec-6dbc-4cac-ab1e-2081314c79e7	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849865	2024-11-14 06:34:10.849866	f	0.00	f	f	1	\N
ea7bd3b3-6e59-4b4f-a44e-61fe337af055	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:20:32.002982	2024-11-14 06:29:10.046356	t	2.50	f	t	1	\N
f82c14b2-6403-4327-838f-6ee5566a0034	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7eca95c2-154f-4f02-8a8c-d10673f3a30c	t	2024-11-14 01:20:32.00302	2024-11-14 06:29:10.046384	t	0.00	f	f	1	\N
f9961bf4-e340-45cc-a8a7-fb77cba15777	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:20:32.003025	2024-11-14 06:29:10.046394	t	2.50	f	t	1	\N
f0da4f7b-96de-458e-b00a-31cb23f39af2	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:20:32.003028	2024-11-14 06:29:10.046398	t	2.50	f	t	1	\N
800677e8-42ea-405c-8a57-77df4d8ad8ac	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:20:32.003033	2024-11-14 06:29:10.046408	t	2.50	f	t	1	\N
bef9566f-50e9-4124-aa5a-c1bdc8e4feec	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0dc24724-0b23-4746-a205-11bcb152979a	t	2024-11-14 01:17:41.446026	2024-11-14 06:29:10.07859	t	0.00	f	f	1	\N
e6fb30ab-fb23-4993-8647-949f58817c75	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:17:41.44603	2024-11-14 06:29:10.078595	t	0.00	f	f	1	\N
91bd0f2c-5bf4-4da8-853f-1be0750d8301	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:41.446041	2024-11-14 06:29:10.078635	t	2.50	f	t	1	\N
f9757acb-2b74-43c8-833f-af4b977125d2	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6ebd546-d184-4dd0-a121-cffea6ad541d	t	2024-11-14 01:17:41.446066	2024-11-14 06:29:10.078644	t	0.00	f	f	1	\N
b0cd7d9c-a5ff-4162-9b54-f84b9d4eb3f4	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	t	2024-11-14 01:17:41.44607	2024-11-14 06:29:10.078649	t	0.00	f	f	1	\N
351380a5-f307-487b-9579-9f017863a2fe	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:41.446073	2024-11-14 06:29:10.078653	t	2.50	f	t	1	\N
19dd538d-163b-478c-a77e-700108fdb553	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:41.446079	2024-11-14 06:29:10.078674	t	2.50	f	t	1	\N
85a589e9-17eb-49fa-9d5d-10bb4e42b8f7	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:41.446082	2024-11-14 06:29:10.078708	t	2.50	f	t	1	\N
133bf4f1-98cf-4134-984b-b532fc5f0d7d	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:41.446085	2024-11-14 06:29:10.078713	t	0.00	f	f	1	\N
53cc6a12-ce11-427a-8ef6-57a47ef2c5bd	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:17:41.446088	2024-11-14 06:29:10.078717	t	2.50	f	t	1	\N
e1ddb6be-a7ac-4aaf-89df-6fa4e1832653	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:41.446091	2024-11-14 06:29:10.078721	t	2.50	f	t	1	\N
197b3678-9842-4589-a5ad-3a865369d43d	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:17:41.446094	2024-11-14 06:29:10.078725	t	0.00	f	f	1	\N
a833c686-aca3-4dff-9d17-009fd32f2896	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:40.134783	2024-11-14 06:29:10.110113	t	2.50	f	t	1	\N
6ed7cda2-3102-4444-93b9-5441a2e50e4e	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:17:40.563239	2024-11-14 06:29:10.13812	t	0.00	f	f	1	\N
abfeb4f5-ba49-487e-83f0-6908e8b363cf	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:40.563243	2024-11-14 06:29:10.138125	t	2.50	f	t	1	\N
1b4a773b-21cc-43c1-a30c-27e75f8a328e	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	09e061aa-eb75-4126-971f-77842119423f	t	2024-11-14 01:17:40.563246	2024-11-14 06:29:10.138128	t	0.00	f	f	1	\N
507487e6-5b3f-4bee-86f5-a879aa75b3b1	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:40.563249	2024-11-14 06:29:10.138131	t	2.50	f	t	1	\N
17e21cc8-1625-440b-a58c-e6cb82069091	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	7f0667ff-adaf-4c3c-816b-50430cd9a7cc	t	2024-11-14 01:17:40.563252	2024-11-14 06:29:10.138133	t	0.00	f	f	1	\N
7e27893a-7f00-472f-bc79-e96919f445ca	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 01:17:40.563275	2024-11-14 06:29:10.138143	t	2.50	f	t	1	\N
1e3eaf43-5770-4376-81e4-cc1c0a233ffd	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:17:40.563278	2024-11-14 06:29:10.138146	t	0.00	f	f	1	\N
8d24a99c-ca72-4c5a-b851-b96867d4f7cb	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	t	2024-11-14 01:17:40.563281	2024-11-14 06:29:10.138152	t	0.00	f	f	1	\N
e3ad1327-fd2d-40c4-bb32-92cab5faabb3	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	94eddd28-7711-4277-949d-76fce1a44f7e	t	2024-11-14 01:17:40.563285	2024-11-14 06:29:10.138155	t	2.50	f	t	1	\N
a54329a5-c36b-4de9-a1e9-08d73f10b557	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:40.563291	2024-11-14 06:29:10.13816	t	2.50	f	t	1	\N
af20ba8c-3ad5-4bcd-b08b-1f663dcd4f36	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	03876743-4711-4a9d-ba1b-2d9c356c69bb	t	2024-11-14 01:17:35.063121	2024-11-14 06:29:10.163178	t	0.00	f	f	1	\N
e671af2a-728c-429f-87dc-1fabe15b85e2	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	t	2024-11-14 01:17:35.063124	2024-11-14 06:29:10.163189	t	0.00	f	f	1	\N
18fc2dac-229e-4d82-a147-7b39b8e8c9de	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:35.063147	2024-11-14 06:29:10.163198	t	2.50	f	t	1	\N
0236647d-e0e7-4102-85b7-5a549ad7338f	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	0b86137e-8c30-45d4-870b-0b32aee116db	t	2024-11-14 01:17:35.06315	2024-11-14 06:29:10.163201	t	0.00	f	f	1	\N
3ae774c8-d88f-404f-9db8-ddbee43a29d6	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:35.753659	2024-11-14 06:29:10.928684	t	2.50	f	t	1	\N
706ab91e-6d7b-43b4-8dca-dc946b66212f	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ea29634f-0a27-49ae-bb17-dd3fc46a46d5	t	2024-11-14 01:17:37.009451	2024-11-14 06:29:10.961559	t	0.00	f	f	1	\N
38d94520-e447-436d-85da-40cd3d35f149	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.84987	2024-11-14 06:34:10.84987	f	0.00	f	f	1	\N
21402043-e36f-4df6-8f01-b9d3987e7298	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849872	2024-11-14 06:34:10.849872	f	0.00	f	f	1	\N
4297d493-f112-4340-8a8d-17d3fd61e686	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:35.063154	2024-11-14 06:29:10.163216	t	2.50	f	t	1	\N
15a66263-4af4-4797-a54b-cb15e7fcd3ef	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:35.06316	2024-11-14 06:29:10.163221	t	2.50	f	t	1	\N
ed8c9ceb-3d9e-4193-8943-8b62e282985a	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:47.931079	2024-11-14 06:29:10.189094	t	2.50	f	t	1	\N
88b8ca6a-2eb7-4c20-aa1e-6ffe352ed050	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	c6a7e78e-78eb-4d78-9b4e-35e2a901f765	t	2024-11-14 01:17:47.931081	2024-11-14 06:29:10.189096	t	0.00	f	f	1	\N
fecc7bd6-ec4c-4864-9e71-a167b9a605c7	480f995f-3488-49e2-8a0c-87fd4bdd4367	114cf9df-5438-4ff7-a619-ae362ebb26a9	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	t	2024-11-14 01:17:47.931084	2024-11-14 06:29:10.189104	t	2.50	f	t	1	\N
caf7254e-13dc-4ca0-859f-2f3acc5de104	480f995f-3488-49e2-8a0c-87fd4bdd4367	83b9e160-f0b6-4ae4-96ee-52d046ed25de	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	930b3dc9-1255-4a6a-9ab6-d6d537480ca4	t	2024-11-14 01:17:47.931086	2024-11-14 06:29:10.189107	t	0.00	f	f	1	\N
3b15b4c7-4839-44f2-a167-0873dd350544	480f995f-3488-49e2-8a0c-87fd4bdd4367	c4369bac-489a-4511-a6f2-48896716ec08	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	5c9bb423-73f8-4b12-8702-104e42eef93b	t	2024-11-14 01:17:35.814394	2024-11-14 06:29:10.214414	t	2.50	f	t	1	\N
3ef16bb7-5e66-4a10-9960-ba770c9ec171	480f995f-3488-49e2-8a0c-87fd4bdd4367	176a1349-82df-456c-8c0e-b263c2289604	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	f00a1817-81f1-45ff-b4eb-60614567ffbf	t	2024-11-14 01:18:18.607246	2024-11-14 06:29:10.571899	t	2.50	f	t	1	\N
16ce2da5-8b3b-4353-b6e1-9adfb9c0b7d2	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:18:18.607249	2024-11-14 06:29:10.571904	t	2.50	f	t	1	\N
c558e077-2e08-4edb-a43b-bea492528e81	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:18:18.607255	2024-11-14 06:29:10.571912	t	0.00	f	f	1	\N
c1270427-976a-4bb9-9a6e-36fb26478f69	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	770c80d5-871e-48d0-9975-1703f320a722	t	2024-11-14 01:17:48.392008	2024-11-14 06:29:10.603207	t	0.00	f	f	1	\N
77b31e0f-6c70-43f7-892d-0bd31fdc3b6d	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	t	2024-11-14 01:17:48.39201	2024-11-14 06:29:10.603212	t	2.50	f	t	1	\N
6e4f5e07-a250-4c95-b3b2-cbd1363a03a5	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	36cfbefb-3388-42ba-92ab-edc24b4cfe4b	t	2024-11-14 01:17:45.178279	2024-11-14 06:29:10.632822	t	0.00	f	f	1	\N
816dd419-8c3e-40ed-bd93-5981ee24eb47	480f995f-3488-49e2-8a0c-87fd4bdd4367	6856002a-2b9a-446d-91c0-f9f0a190ff88	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	19f5b143-23af-4eb9-b51d-d122fa36db64	t	2024-11-14 01:17:45.178285	2024-11-14 06:29:10.632831	t	2.50	f	t	1	\N
97387e87-794d-4d33-989f-f28c21160bb9	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:17:45.17829	2024-11-14 06:29:10.632836	t	0.00	f	f	1	\N
d55b1a2b-1c4b-46a9-8a5e-756d0ed89e91	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:51.277641	2024-11-14 06:29:10.725457	t	2.50	f	t	1	\N
05d58e7d-2a7f-471d-8951-03a43641f4c1	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 01:17:35.957212	2024-11-14 06:29:10.896492	t	0.00	f	f	1	\N
bd8952b5-00d1-432e-889b-2cf4fc9236d8	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	70563108-854d-4f77-92ac-7245a1c1b20c	t	2024-11-14 01:17:35.753662	2024-11-14 06:29:10.928731	t	2.50	f	t	1	\N
55a77593-4f26-4a75-bf29-2c82cd5ee34b	480f995f-3488-49e2-8a0c-87fd4bdd4367	7f04a4d2-cd49-4f43-8441-6544319744b6	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	d544e56a-cd8f-47af-ab1c-50ddc92550f3	t	2024-11-14 01:17:35.753665	2024-11-14 06:29:10.928736	t	2.50	f	t	1	\N
d2e3b790-05a7-48ac-8cdb-ef090cdb5089	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	769d8325-87a4-4e14-b495-98bfa3ae7d47	t	2024-11-14 01:17:35.753668	2024-11-14 06:29:10.928742	t	2.50	f	t	1	\N
acd317c0-14c8-4e6e-ab1c-ecd251f9ef7a	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	9473d124-2bfb-412e-8278-228760d676c7	t	2024-11-14 01:17:35.75368	2024-11-14 06:29:10.928772	t	2.50	f	t	1	\N
debd1df0-f513-4d02-bd7d-032757d16e30	480f995f-3488-49e2-8a0c-87fd4bdd4367	5ccc86c5-5eff-4c87-9324-de42a36e316f	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	ec4bce2a-f521-42e6-88a5-6e06cf77669c	t	2024-11-14 01:17:35.753682	2024-11-14 06:29:10.928803	t	2.50	f	t	1	\N
0a29db12-4d90-4f96-8f08-36ccd01b55ea	480f995f-3488-49e2-8a0c-87fd4bdd4367	2fd1a198-78be-4681-955f-588a4bbf9cd8	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	423171d0-0749-40a3-a727-9c40a6d4c55a	t	2024-11-14 01:17:35.753684	2024-11-14 06:29:10.928808	t	2.50	f	t	1	\N
7f2ce693-fd3d-4fed-8bdd-b7cd3ec64888	480f995f-3488-49e2-8a0c-87fd4bdd4367	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	b00a3253-bb4b-4fd7-b64e-97939b042dfc	t	2024-11-14 01:17:35.753687	2024-11-14 06:29:10.928813	t	0.00	f	f	1	\N
87c6adbc-6936-4644-a94c-cab549439ca0	480f995f-3488-49e2-8a0c-87fd4bdd4367	0e271d3a-d212-4c72-8626-6571dbc7cb49	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	91a0b9f6-7e97-4919-a5d4-5a558e16893f	t	2024-11-14 01:17:35.753692	2024-11-14 06:29:10.928822	t	2.50	f	t	1	\N
5cf97181-71b8-40f9-b9a5-f067dc93ee3d	480f995f-3488-49e2-8a0c-87fd4bdd4367	8771a517-0c13-4281-9cc7-875cf7aa117c	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849875	2024-11-14 06:34:10.849875	f	0.00	f	f	1	\N
4c492db9-de5c-4e80-8b94-0778416d76f1	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849877	2024-11-14 06:34:10.849877	f	0.00	f	f	1	\N
79dbd8b1-9847-4d6d-88d5-19fa594a2b2e	480f995f-3488-49e2-8a0c-87fd4bdd4367	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.84988	2024-11-14 06:34:10.84988	f	0.00	f	f	1	\N
23e4e4d8-884a-4975-ba9c-34433ef9dcaa	480f995f-3488-49e2-8a0c-87fd4bdd4367	9561dba1-c8d1-4a11-b572-7efc3f174ac9	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	0	f	2024-11-14 06:34:10.849882	2024-11-14 06:34:10.849882	f	0.00	f	f	1	\N
07914abf-1532-4bce-afad-7fac652986cb	480f995f-3488-49e2-8a0c-87fd4bdd4367	cc324097-bf2a-4b66-92e7-398c86d88b8c	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:10.849959	2024-11-14 06:34:10.849959	f	0.00	f	f	1	\N
eb98a508-da13-4e15-94cd-08d65a4fc34f	480f995f-3488-49e2-8a0c-87fd4bdd4367	5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:10.849963	2024-11-14 06:34:10.849963	f	0.00	f	f	1	\N
3f3fc3a1-781d-453b-a2f7-c5688408f2af	480f995f-3488-49e2-8a0c-87fd4bdd4367	62544478-6ebf-4663-ae8b-f8df950120c2	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:10.849966	2024-11-14 06:34:10.849966	f	0.00	f	f	1	\N
3afbb8ac-b231-48d4-8978-16cd7ade8456	480f995f-3488-49e2-8a0c-87fd4bdd4367	a2ae71f4-c782-4797-a58e-9702cabbfc48	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:10.849969	2024-11-14 06:34:10.849969	f	0.00	f	f	1	\N
e6811095-f29c-4d1a-bb92-0c87bd8c6eb6	480f995f-3488-49e2-8a0c-87fd4bdd4367	6d32f96c-cdc1-416d-8988-b7067c716ddc	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	{"text":"","images":[]}	f	2024-11-14 06:34:10.849971	2024-11-14 06:34:10.849971	f	0.00	f	f	1	\N
ed32d6d0-8627-4a09-98f6-987e30e3ff16	480f995f-3488-49e2-8a0c-87fd4bdd4367	0138f971-3471-474d-9d4b-587abbe6862b	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	8ced11cc-cc84-4153-8e50-ded68989477a	t	2024-11-14 06:34:10.849491	2024-11-14 06:34:16.333473	f	0.00	f	f	1	\N
721386ee-bb87-47ad-9575-0b3790ffd4b8	480f995f-3488-49e2-8a0c-87fd4bdd4367	63b05352-932f-4d54-953b-d7f4b9b43aa6	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	806204ec-b49e-47fa-a948-0c58bc4a6725	t	2024-11-14 06:33:07.203807	2024-11-14 06:34:21.145477	f	0.00	f	f	1	\N
\.


--
-- Data for Name: jawaban_soals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jawaban_soals (id, soal_id, text_jawaban, correct, created_at, updated_at, label_mark) FROM stdin;
0a7f1b8b-fa73-46c9-a70b-f78f814cd8e5	dacb4cd8-5c07-4a17-98e7-81b6f55a6ce3	<p>Saya tidak sependapat dengan Anda yang tidak masuk akal.&nbsp;</p>	f	2024-10-17 17:37:09.992443	2024-10-17 17:37:09.992443	A
29b1ed74-1ba5-4e5c-a573-e64a92ec837b	dacb4cd8-5c07-4a17-98e7-81b6f55a6ce3	<p>Maaf, hal itu tidak dapat diterima.&nbsp;</p>	f	2024-10-17 17:37:09.993657	2024-10-17 17:37:09.993657	B
f5e49dd9-015f-4d83-bad8-2ce78fc1b121	dacb4cd8-5c07-4a17-98e7-81b6f55a6ce3	<p>Saya tidak setuju sebab hal itu tidak benar.&nbsp;</p>	f	2024-10-17 17:37:09.994775	2024-10-17 17:37:09.994776	C
de22fb60-3a06-4f55-a4a7-b676653213e6	dacb4cd8-5c07-4a17-98e7-81b6f55a6ce3	<p>Wah, pendapat itu harus ditolak!&nbsp;</p>	f	2024-10-17 17:37:09.995918	2024-10-17 17:37:09.995918	D
094ba980-1ae5-4b52-bf43-f042e4f126d2	dacb4cd8-5c07-4a17-98e7-81b6f55a6ce3	<p>Saya kurang sependapat dengan Bapak karena saya belum yakin tentang hal itu.&nbsp;</p>	t	2024-10-17 17:37:09.997067	2024-10-17 17:37:09.997068	E
8817f31f-1b7c-47db-82fa-f6c7c6a53b19	60982991-0c5c-4761-94cb-1db515dc998f	<p>Bintang laut&nbsp;</p>	t	2024-10-17 17:37:09.999482	2024-10-17 17:37:09.999482	A
0f990741-34cd-4d62-9e2c-87f4d53555d4	60982991-0c5c-4761-94cb-1db515dc998f	<p>Kepiting&nbsp;</p>	f	2024-10-17 17:37:10.0006	2024-10-17 17:37:10.0006	B
0d355583-36d5-4d4a-a7d8-066d366fa99e	60982991-0c5c-4761-94cb-1db515dc998f	<p>Gurita&nbsp;</p>	f	2024-10-17 17:37:10.001714	2024-10-17 17:37:10.001714	C
3d36ac58-a8b4-4852-8a58-2519ce6dcbd8	60982991-0c5c-4761-94cb-1db515dc998f	<p>Sponge&nbsp;</p>	f	2024-10-17 17:37:10.001775	2024-10-17 17:37:10.001775	D
20fd3bbf-7f25-498c-9a94-42d51d6f7afd	60982991-0c5c-4761-94cb-1db515dc998f	<p>Jamur&nbsp;</p>	f	2024-10-17 17:37:10.002888	2024-10-17 17:37:10.002888	E
2b7ac2fc-38b5-4b5b-a792-1595ffcb6f56	ee10746d-0aef-4e59-bb38-b17bf0c98526	<p>Asia&nbsp;</p>	t	2024-10-17 17:37:10.005154	2024-10-17 17:37:10.005154	A
73d778ae-6520-458d-857c-4397af7b821b	ee10746d-0aef-4e59-bb38-b17bf0c98526	<p>Afrika&nbsp;</p>	t	2024-10-17 17:37:10.006272	2024-10-17 17:37:10.006272	B
a1060d39-8017-4072-8a2d-fd7f5f21b60c	ee10746d-0aef-4e59-bb38-b17bf0c98526	<p>Eropa&nbsp;</p>	t	2024-10-17 17:37:10.007388	2024-10-17 17:37:10.007388	C
d63d3b77-1348-496b-a173-719ffd60886b	ee10746d-0aef-4e59-bb38-b17bf0c98526	<p>Australia&nbsp;</p>	t	2024-10-17 17:37:10.008527	2024-10-17 17:37:10.008527	D
5eef68cf-1a76-4340-8ec3-e68496e7dc79	ee10746d-0aef-4e59-bb38-b17bf0c98526	<p>Arab&nbsp;</p>	f	2024-10-17 17:37:10.00964	2024-10-17 17:37:10.00964	E
07574b2b-f7bc-4027-9a6e-8d80ec69aec5	ee10746d-0aef-4e59-bb38-b17bf0c98526	<p>Amerika Timur&nbsp;</p>	f	2024-10-17 17:37:10.010758	2024-10-17 17:37:10.010758	F
f698bba4-86e7-4a89-b713-725b88c8a555	96bbfa00-c9b3-43a8-b261-026011f5d897	["1944"]	t	2024-10-17 17:37:10.014417	2024-10-17 17:37:10.014417	\N
ee6a62d9-4980-4170-82b8-a313930dc729	37044915-ca38-4562-88b4-470189bd3a19	[["7404f4af-6663-4019-8888-113d56ef1299","\\u003cp\\u003eEksekutif\\u0026nbsp;\\u003c/p\\u003e"],["84cc23e0-6c0f-428a-b093-85b840c50408","\\u003cp\\u003eBertanggung jawab atas pelaksanaan kebijakan dan pemerintahan sehari-hari. Kepala eksekutif bisa berupa presiden, perdana menteri, atau kepala pemerintahan setingkat nasional.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.015731	2024-10-17 17:37:10.015731	
8d422fc8-66cb-4fc3-844b-ab281b556b79	37044915-ca38-4562-88b4-470189bd3a19	[["5065d269-d71b-46a7-9379-f50364fcd3e7","\\u003cp\\u003eLegislatif\\u0026nbsp;\\u003c/p\\u003e"],["41d1b396-2eb5-4451-823c-0bdad3d61b46","\\u003cp\\u003eMembuat undang-undang, mengesahkan anggaran, dan memberikan pengawasan terhadap eksekutif. Di beberapa negara, ini dapat terdiri dari parlemen satu kamar atau dua kamar, seperti dewan perwakilan rakyat dan dewan perwakilan daerah.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.016926	2024-10-17 17:37:10.016926	
a15e6a5a-e760-4a49-b3cc-d02d5bb6a767	37044915-ca38-4562-88b4-470189bd3a19	[["111e3fbc-4229-4337-8e08-8d4fc0640e80","\\u003cp\\u003eYudikatif\\u0026nbsp;\\u003c/p\\u003e"],["48eab846-78b1-445a-aec7-536f7d8e22da","\\u003cp\\u003eBertugas menafsirkan undang-undang, menyelesaikan sengketa hukum, dan menjalankan keadilan. Puncak sistem yudikatif biasanya diwakili oleh mahkamah agung atau lembaga setingkat yang menangani konstitusionalitas undang-undang.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.018121	2024-10-17 17:37:10.018121	
0df6a038-a343-4c33-9314-78b552e12841	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["8214a523-6eea-48b9-b838-118463d342de","\\u003cp\\u003eCPU (Central Processing Unit)\\u0026nbsp;\\u003c/p\\u003e"],["57ce1217-ee80-4903-8f48-e31088d51d16","\\u003cp\\u003eOtak komputer yang melakukan pemrosesan instruksi.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.020426	2024-10-17 17:37:10.020426	
d0b484d0-b1a4-4fe1-a349-632c159ac9e8	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["a5a94b18-0d68-4441-80f6-632673daaa95","\\u003cp\\u003eRAM (Random Access Memory)\\u0026nbsp;\\u003c/p\\u003e"],["e1bdb1ad-2eee-47e5-9a0c-c83083cb8cf1","\\u003cp\\u003eTempat penyimpanan sementara untuk data yang sedang diakses oleh CPU.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.021599	2024-10-17 17:37:10.0216	
b8b5e280-924e-4d70-8590-ba45a1f1eac1	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["d64fb5b4-ff20-4d2a-b4a9-754eb79daf72","\\u003cp\\u003eHard Drive (Hard Disk)\\u0026nbsp;\\u003c/p\\u003e"],["8af6ca96-ba38-4cef-9946-c01a3f8018e6","\\u003cp\\u003eMenyimpan data jangka panjang dan program di komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.022753	2024-10-17 17:37:10.022754	
cdcc2c0a-22ee-4773-859b-3400a273e227	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["84a43208-cfd1-4448-896b-4c2f07d09560","\\u003cp\\u003eBertanggung jawab untuk pemrosesan grafis.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.023859	2024-10-17 17:37:10.02386	
b3309ffa-9e5b-4003-b3fe-dc1d5a669c54	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["43a4a7b2-caf6-4c32-b853-57c784cee9aa","\\u003cp\\u003ePapan sirkuit utama yang menghubungkan komponen utama.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.02499	2024-10-17 17:37:10.02499	
a093feb0-3382-46a8-b794-312c908150a6	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["41a0e32f-9fdd-4213-a9cd-9cbdcd71cf3d","\\u003cp\\u003eMenyediakan daya listrik untuk komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.026108	2024-10-17 17:37:10.026108	
b9f81fd0-36d2-400d-ad7d-8bfb7c687ed1	6110e05c-0c47-4bd8-99f4-3adfb16629ff	[["b5856607-f625-491d-ba1d-a41f7921cd84","\\u003cp\\u003eMenampilkan informasi grafis dan teks.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:37:10.027216	2024-10-17 17:37:10.027217	
577955e7-0ee4-4b52-ba12-b95291aeb94f	898c4395-e203-40bb-b285-f616cb1d8072	{"0":{"id":"8c8aad4e-4ec2-4e5a-bbd7-05759731eaf8","text":"\\u003cp\\u003eProklamasi Kemerdekaan Indonesia oleh Soekarno dan Mohammad Hatta.\\u0026nbsp;\\u003c/p\\u003e"},"1":{"id":"af0df5b9-cf3c-46b6-b27a-d9f121a8fa33","text":"\\u003cp\\u003eKonferensi Meja Bundar (KMB) dimulai untuk membahas masa depan Indonesia pasca-kemerdekaan.\\u0026nbsp;\\u003c/p\\u003e"},"2":{"id":"7be0a845-967b-4514-accd-cffa9a945af2","text":"\\u003cp\\u003ePenyerahan kedaulatan Indonesia dari Belanda kepada Republik Indonesia Serikat (RIS) sesuai hasil Konferensi RTC (Roem-van Roijen).\\u0026nbsp;\\u003c/p\\u003e"},"3":{"id":"ddda519d-896f-4fe9-83bb-6df561808b20","text":"\\u003cp\\u003ePembubaran RIS dan kembalinya Republik Indonesia sebagai negara kesatuan.\\u0026nbsp;\\u003c/p\\u003e"},"4":{"id":"12492b3a-6043-4bf5-b954-bffe5750a4fe","text":"\\u003cp\\u003eKonferensi Asia-Afrika di Bandung, Indonesia, yang menjadi awal gerakan Non-Blok.\\u0026nbsp;\\u003c/p\\u003e"}}	t	2024-10-17 17:37:10.030025	2024-10-17 17:37:10.030025	
34ae8a7f-c22d-42ee-b5a1-960b4a0a0f0a	3a75269f-c1bf-441c-bf37-ea802fa64351	[{"id":"c58a55ac-e458-4d60-8732-403aa6e518b1","text":"\\u003cp\\u003eSetujukah kamu jika dunia hanya memiliki satu negara?\\u0026nbsp;\\u003c/p\\u003e"},{"id":"d4119bd0-ef49-4137-a9b6-86d12a73889f","text":"\\u003cp\\u003eSetujukah kamu dengan adanya globalisasi?\\u0026nbsp;\\u003c/p\\u003e"}]	t	2024-10-17 17:37:10.031227	2024-10-17 17:37:10.031227	
0e452509-d118-4e07-bd36-1e83248568a3	c829abf4-fae5-49d7-85f4-afd1c2c83f84	[{"id":"930b9254-ffa0-44e9-aaee-d92089fcd057","text":"\\u003cp\\u003e\\u003cb\\u003eErythema Nodosum\\u003c/b\\u003e adalah suatu jenis radang pada lapisan lemak kulit yang biasanya disertai dengan rasa sakit dan benjolan.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"9ecfacd8-fb85-466f-a14e-b01e00228bb7","text":"\\u003cp\\u003e\\u003cb\\u003eCachexia\\u003c/b\\u003e adalah keadaan kekurangan gizi yang parah dan menyeluruh, sering kali terkait dengan penyakit kronis seperti kanker.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"4ead2b60-f2a8-4454-b755-8237c60c18fe","text":"\\u003cp\\u003e\\u003cb\\u003eAscites\\u003c/b\\u003e\\u003cb\\u003e \\u003c/b\\u003eadalah ansambel cairan yang terakumulasi di rongga perut, sering kali sebagai akibat dari penyakit hati atau gagal jantung.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"bd7e9e6d-4d84-4f98-8fa7-1e2e86b08c34","text":"\\u003cp\\u003e\\u003cb\\u003eXerostomia \\u003c/b\\u003eadalah Sensasi yang tidak lazim atau tidak nyaman di kulit, seperti kesemutan atau mati rasa.\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"57c6435a-8519-4019-b2cd-865e61f725fb","text":"\\u003cp\\u003e\\u003cb\\u003eMyoclonus\\u003c/b\\u003e adalah kesulitan menelan makanan atau cairan, serring disebabkan oleh masalah dalam kerongkongan\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-10-17 17:37:10.032598	2024-10-17 17:37:10.032598	
17e35262-6d46-4fa5-af2f-eed21fdc1c73	373eca6d-6d6a-4bf2-9455-99cc0f848e61	<p>Bintang laut&nbsp;</p>	t	2024-10-17 17:39:12.417469	2024-10-17 17:39:12.417469	A
efaa51b1-460a-4258-a7f1-9b44588eaaae	373eca6d-6d6a-4bf2-9455-99cc0f848e61	<p>Kepiting&nbsp;</p>	f	2024-10-17 17:39:12.418566	2024-10-17 17:39:12.418566	B
0f0c7639-1831-4df4-82f4-31018975d100	373eca6d-6d6a-4bf2-9455-99cc0f848e61	<p>Gurita&nbsp;</p>	f	2024-10-17 17:39:12.419688	2024-10-17 17:39:12.419689	C
07547d54-d164-426b-89c0-7a127777b36f	373eca6d-6d6a-4bf2-9455-99cc0f848e61	<p>Sponge&nbsp;</p>	f	2024-10-17 17:39:12.420782	2024-10-17 17:39:12.420782	D
9aaf1f36-9351-47c8-a7fe-8eca97a00614	373eca6d-6d6a-4bf2-9455-99cc0f848e61	<p>Jamur&nbsp;</p>	f	2024-10-17 17:39:12.421864	2024-10-17 17:39:12.421864	E
611ae6a9-0f15-4d35-aced-08f62a368965	680699f4-67ac-43ff-8757-f0c8fc66839f	<p>Asia&nbsp;</p>	t	2024-10-17 17:39:12.424158	2024-10-17 17:39:12.424158	A
a13b555f-2f17-4e4a-b3e9-cb98080f612c	680699f4-67ac-43ff-8757-f0c8fc66839f	<p>Afrika&nbsp;</p>	t	2024-10-17 17:39:12.425267	2024-10-17 17:39:12.425268	B
6cfef717-7af1-42bd-8acc-205c65afa7d4	680699f4-67ac-43ff-8757-f0c8fc66839f	<p>Eropa&nbsp;</p>	t	2024-10-17 17:39:12.426361	2024-10-17 17:39:12.426362	C
6a7c2dec-29df-413c-ad72-7d31a0f8aa81	680699f4-67ac-43ff-8757-f0c8fc66839f	<p>Australia&nbsp;</p>	t	2024-10-17 17:39:12.42746	2024-10-17 17:39:12.42746	D
71e64ed7-1544-4721-8199-97a647e0d1f6	680699f4-67ac-43ff-8757-f0c8fc66839f	<p>Arab&nbsp;</p>	f	2024-10-17 17:39:12.428572	2024-10-17 17:39:12.428572	E
b106c8df-97cb-476b-aac2-6ab46eb4d7b1	680699f4-67ac-43ff-8757-f0c8fc66839f	<p>Amerika Timur&nbsp;</p>	f	2024-10-17 17:39:12.429663	2024-10-17 17:39:12.429664	F
91b9cfba-8fed-49a1-b9c7-f4050524fc7f	093f4497-ef23-409c-a38c-b90783e16181	["1944"]	t	2024-10-17 17:39:12.433273	2024-10-17 17:39:12.433273	\N
18378a5d-dc8c-4b0d-a0e4-0a3682d63a48	af30e163-136a-47ea-9930-a94ebe25d1b7	[["7e488779-8717-4e31-b2cf-6c6f83c0b20f","\\u003cp\\u003eEksekutif\\u0026nbsp;\\u003c/p\\u003e"],["6c152f60-a4af-4e44-ae04-9f53150fa3d8","\\u003cp\\u003eBertanggung jawab atas pelaksanaan kebijakan dan pemerintahan sehari-hari. Kepala eksekutif bisa berupa presiden, perdana menteri, atau kepala pemerintahan setingkat nasional.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.434486	2024-10-17 17:39:12.434487	
82ec2771-3333-4eb4-95cf-318b9d5c2b6f	af30e163-136a-47ea-9930-a94ebe25d1b7	[["fda706a7-76fd-496c-9dd9-a2426d2584d8","\\u003cp\\u003eLegislatif\\u0026nbsp;\\u003c/p\\u003e"],["ea402022-93ce-40ac-84fb-64ac9cdec778","\\u003cp\\u003eMembuat undang-undang, mengesahkan anggaran, dan memberikan pengawasan terhadap eksekutif. Di beberapa negara, ini dapat terdiri dari parlemen satu kamar atau dua kamar, seperti dewan perwakilan rakyat dan dewan perwakilan daerah.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.435614	2024-10-17 17:39:12.435614	
33ef59df-7916-4a76-8bef-bacaebb13996	af30e163-136a-47ea-9930-a94ebe25d1b7	[["af5978dc-5306-4bf3-a538-450099f1f6ed","\\u003cp\\u003eYudikatif\\u0026nbsp;\\u003c/p\\u003e"],["05c0338f-e0fc-4c96-aeea-4d3c0d1d8343","\\u003cp\\u003eBertugas menafsirkan undang-undang, menyelesaikan sengketa hukum, dan menjalankan keadilan. Puncak sistem yudikatif biasanya diwakili oleh mahkamah agung atau lembaga setingkat yang menangani konstitusionalitas undang-undang.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.436729	2024-10-17 17:39:12.436729	
6fa646a9-18cb-4c40-b347-34dd0942e352	e8e52b2c-7141-448e-b722-b16738415848	[["dad27899-b7c4-4b01-8406-e857c659a97a","\\u003cp\\u003eCPU (Central Processing Unit)\\u0026nbsp;\\u003c/p\\u003e"],["92a2dcbf-ba1d-46c2-ab26-08a3f468bc62","\\u003cp\\u003eOtak komputer yang melakukan pemrosesan instruksi.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.439039	2024-10-17 17:39:12.439039	
8447b407-f759-4462-85d0-e03b5dd52a95	e8e52b2c-7141-448e-b722-b16738415848	[["a502f341-6880-41fb-a78b-70d7d9fc87b6","\\u003cp\\u003eRAM (Random Access Memory)\\u0026nbsp;\\u003c/p\\u003e"],["725a71ec-26d5-457d-bebe-77542395eaf3","\\u003cp\\u003eTempat penyimpanan sementara untuk data yang sedang diakses oleh CPU.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.440145	2024-10-17 17:39:12.440145	
b5587439-6fce-4dc9-aaa7-8073389c80e9	e8e52b2c-7141-448e-b722-b16738415848	[["69d544e0-bd97-4f5e-a714-d9ddaf06b8dd","\\u003cp\\u003eHard Drive (Hard Disk)\\u0026nbsp;\\u003c/p\\u003e"],["5d0da222-12e3-4f45-8b2d-840d927bec87","\\u003cp\\u003eMenyimpan data jangka panjang dan program di komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.441245	2024-10-17 17:39:12.441245	
d4ccde47-bfbc-46c7-bc1f-f1704725e1b2	e8e52b2c-7141-448e-b722-b16738415848	[["ce64879f-2487-4007-898e-bc45a058d499","\\u003cp\\u003eBertanggung jawab untuk pemrosesan grafis.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.442368	2024-10-17 17:39:12.442368	
8867a318-63b7-4e5d-ae80-12e9e9d2f16d	e8e52b2c-7141-448e-b722-b16738415848	[["f034a553-4b4c-4c0d-957b-3ac2a1712af6","\\u003cp\\u003ePapan sirkuit utama yang menghubungkan komponen utama.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.443492	2024-10-17 17:39:12.443492	
214941f3-7439-4c64-8e62-c575608f273b	e8e52b2c-7141-448e-b722-b16738415848	[["2e4743d8-8a29-4bc3-84c4-22148a6bc7cd","\\u003cp\\u003eMenyediakan daya listrik untuk komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.444593	2024-10-17 17:39:12.444593	
971b1140-de37-48ff-97c6-6520d6a1b695	e8e52b2c-7141-448e-b722-b16738415848	[["305ae26d-049e-4ab6-98e3-350d8a22a216","\\u003cp\\u003eMenampilkan informasi grafis dan teks.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-10-17 17:39:12.445692	2024-10-17 17:39:12.445692	
63512449-50b2-43a7-a3b8-ffa18fb5e578	c229f2c4-f873-4e7c-940a-2674f50bcc73	{"0":{"id":"6a7b47bc-e558-4277-ba22-85f0c59b4052","text":"\\u003cp\\u003eProklamasi Kemerdekaan Indonesia oleh Soekarno dan Mohammad Hatta.\\u0026nbsp;\\u003c/p\\u003e"},"1":{"id":"736f08de-858a-43c3-bcf0-1eb53b72d291","text":"\\u003cp\\u003eKonferensi Meja Bundar (KMB) dimulai untuk membahas masa depan Indonesia pasca-kemerdekaan.\\u0026nbsp;\\u003c/p\\u003e"},"2":{"id":"b90fc855-3e99-412f-b76f-b0006325e510","text":"\\u003cp\\u003ePenyerahan kedaulatan Indonesia dari Belanda kepada Republik Indonesia Serikat (RIS) sesuai hasil Konferensi RTC (Roem-van Roijen).\\u0026nbsp;\\u003c/p\\u003e"},"3":{"id":"e75eea5b-57b4-4a5b-9d56-1632965b036d","text":"\\u003cp\\u003ePembubaran RIS dan kembalinya Republik Indonesia sebagai negara kesatuan.\\u0026nbsp;\\u003c/p\\u003e"},"4":{"id":"cd844e32-10c1-4d2d-aca5-b4746f700448","text":"\\u003cp\\u003eKonferensi Asia-Afrika di Bandung, Indonesia, yang menjadi awal gerakan Non-Blok.\\u0026nbsp;\\u003c/p\\u003e"}}	t	2024-10-17 17:39:12.448252	2024-10-17 17:39:12.448252	
582fa989-bc96-45ab-bcf9-c60b6d6ca4e9	e21e7938-b854-403c-83b5-1c432af18167	[{"id":"c29cb508-6e03-481f-8f2d-c5dfbfc75770","text":"\\u003cp\\u003eSetujukah kamu jika dunia hanya memiliki satu negara?\\u0026nbsp;\\u003c/p\\u003e"},{"id":"b253fb8f-73e4-4472-a249-2b68ba14cf2f","text":"\\u003cp\\u003eSetujukah kamu dengan adanya globalisasi?\\u0026nbsp;\\u003c/p\\u003e"}]	t	2024-10-17 17:39:12.449436	2024-10-17 17:39:12.449436	
a0bbbb05-48ea-415b-ade4-8a8db5c75b39	f97b4245-5df7-4030-a95b-6cec0c48ebd1	[{"id":"e4b36f20-3064-435d-8e6d-119498b3e4f1","text":"\\u003cp\\u003e\\u003cb\\u003eErythema Nodosum\\u003c/b\\u003e adalah suatu jenis radang pada lapisan lemak kulit yang biasanya disertai dengan rasa sakit dan benjolan.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"11f087a9-9ff7-4c4a-8f68-960e7bb94d0e","text":"\\u003cp\\u003e\\u003cb\\u003eCachexia\\u003c/b\\u003e adalah keadaan kekurangan gizi yang parah dan menyeluruh, sering kali terkait dengan penyakit kronis seperti kanker.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"5939951f-1e11-4163-90e7-8eb0b642ed7c","text":"\\u003cp\\u003e\\u003cb\\u003eAscites\\u003c/b\\u003e\\u003cb\\u003e \\u003c/b\\u003eadalah ansambel cairan yang terakumulasi di rongga perut, sering kali sebagai akibat dari penyakit hati atau gagal jantung.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"ef33458e-02fc-4141-bd28-26384d585643","text":"\\u003cp\\u003e\\u003cb\\u003eXerostomia \\u003c/b\\u003eadalah Sensasi yang tidak lazim atau tidak nyaman di kulit, seperti kesemutan atau mati rasa.\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"9a7618e9-c187-4090-97a5-9db388de3453","text":"\\u003cp\\u003e\\u003cb\\u003eMyoclonus\\u003c/b\\u003e adalah kesulitan menelan makanan atau cairan, serring disebabkan oleh masalah dalam kerongkongan\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-10-17 17:39:12.450647	2024-10-17 17:39:12.450647	
8c2973de-98cf-40b9-97ed-1e647c5115b4	b0df1d97-08a8-4e63-9aa5-913755b222c1	<p>Saya tidak sependapat dengan Anda yang tidak masuk akal. </p>	f	2024-10-17 17:39:12.411925	2024-11-04 01:49:21.371876	A
09c7594f-3eea-4ec1-89c6-ea21a60191ac	b0df1d97-08a8-4e63-9aa5-913755b222c1	<p>Maaf, hal itu tidak dapat diterima. </p>	f	2024-10-17 17:39:12.411947	2024-11-04 01:49:21.37192	B
6488b42c-a131-41f8-a597-78ca2e2a85a3	b0df1d97-08a8-4e63-9aa5-913755b222c1	<p>Saya tidak setuju sebab hal itu tidak benar. </p>	f	2024-10-17 17:39:12.413079	2024-11-04 01:49:21.373065	C
9aae0674-0731-44ed-872a-89e58b4cb5be	b0df1d97-08a8-4e63-9aa5-913755b222c1	<p>Wah, pendapat itu harus ditolak! </p>	f	2024-10-17 17:39:12.414163	2024-11-04 01:49:21.374157	D
e058c3fd-c9f0-4802-a392-2c9f9d401383	b0df1d97-08a8-4e63-9aa5-913755b222c1	<p>Saya kurang sependapat dengan Bapak karena saya belum yakin tentang hal itu. </p>	t	2024-10-17 17:39:12.415246	2024-11-04 01:49:21.375301	E
c9f1840e-7c41-417a-b64d-145ef63479c2	84a7582e-b820-4cc3-9ef6-92970befd3ac	<p>Saya tidak sependapat dengan Anda yang tidak masuk akal.&nbsp;</p>	f	2024-11-05 06:54:11.004854	2024-11-05 06:54:11.004854	A
f1d497c2-8e1c-4f68-8214-b6e36e695ded	84a7582e-b820-4cc3-9ef6-92970befd3ac	<p>Maaf, hal itu tidak dapat diterima.&nbsp;</p>	f	2024-11-05 06:54:11.006149	2024-11-05 06:54:11.006149	B
15a83152-abb5-4452-a4d3-1420e130df6f	84a7582e-b820-4cc3-9ef6-92970befd3ac	<p>Saya tidak setuju sebab hal itu tidak benar.&nbsp;</p>	f	2024-11-05 06:54:11.007268	2024-11-05 06:54:11.007268	C
1148d627-94e4-41fa-803b-47d80f7a6a51	84a7582e-b820-4cc3-9ef6-92970befd3ac	<p>Wah, pendapat itu harus ditolak!&nbsp;</p>	f	2024-11-05 06:54:11.00835	2024-11-05 06:54:11.00835	D
74a1ad98-baa4-471c-99b2-15e63424612e	84a7582e-b820-4cc3-9ef6-92970befd3ac	<p>Saya kurang sependapat dengan Bapak karena saya belum yakin tentang hal itu.&nbsp;</p>	t	2024-11-05 06:54:11.009441	2024-11-05 06:54:11.009441	E
7a0bb3f3-bade-4cd3-9f2a-58f01570a8a6	2841b35e-e4a9-4461-abcd-3df914bc4c10	<p>Bintang laut&nbsp;</p>	t	2024-11-05 06:54:11.01171	2024-11-05 06:54:11.01171	A
ce7fa0e8-2331-436b-872b-0581f3fd6e94	2841b35e-e4a9-4461-abcd-3df914bc4c10	<p>Kepiting&nbsp;</p>	f	2024-11-05 06:54:11.012952	2024-11-05 06:54:11.012952	B
51a5c88d-3b73-4201-94a4-e88f86214b09	2841b35e-e4a9-4461-abcd-3df914bc4c10	<p>Gurita&nbsp;</p>	f	2024-11-05 06:54:11.014086	2024-11-05 06:54:11.014091	C
a7ded543-38a2-4c8d-b6b1-a0f708a09114	2841b35e-e4a9-4461-abcd-3df914bc4c10	<p>Sponge&nbsp;</p>	f	2024-11-05 06:54:11.015208	2024-11-05 06:54:11.015208	D
71d39e0d-6c1b-4b4f-8b33-5637d03d71c0	2841b35e-e4a9-4461-abcd-3df914bc4c10	<p>Jamur&nbsp;</p>	f	2024-11-05 06:54:11.016374	2024-11-05 06:54:11.016374	E
3e1cb895-201e-473c-b7ba-4b544a3c2439	64edf9fa-2575-449e-8dd7-fb20da6597ca	<p>Asia&nbsp;</p>	t	2024-11-05 06:54:11.018735	2024-11-05 06:54:11.018735	A
c1b85ad4-740b-4093-ace8-d4671715f987	64edf9fa-2575-449e-8dd7-fb20da6597ca	<p>Afrika&nbsp;</p>	t	2024-11-05 06:54:11.020069	2024-11-05 06:54:11.02007	B
a712c849-b83c-447a-98d1-ba847eb99e11	64edf9fa-2575-449e-8dd7-fb20da6597ca	<p>Eropa&nbsp;</p>	t	2024-11-05 06:54:11.021207	2024-11-05 06:54:11.021207	C
0a0fa35c-a097-4d64-b141-1aaebdf892ea	64edf9fa-2575-449e-8dd7-fb20da6597ca	<p>Australia&nbsp;</p>	t	2024-11-05 06:54:11.022316	2024-11-05 06:54:11.022316	D
77c320b4-e6a8-4dbf-8f80-b4c550208d58	64edf9fa-2575-449e-8dd7-fb20da6597ca	<p>Arab&nbsp;</p>	f	2024-11-05 06:54:11.023417	2024-11-05 06:54:11.023417	E
e47bc37f-9ad6-403d-b879-6f36f4fe54f7	64edf9fa-2575-449e-8dd7-fb20da6597ca	<p>Amerika Timur&nbsp;</p>	f	2024-11-05 06:54:11.024528	2024-11-05 06:54:11.024528	F
613b91a7-c156-4b9b-9224-b5272301acea	b6bc086d-12f1-49fe-b777-efb0a93bbfff	["1944"]	t	2024-11-05 06:54:11.028312	2024-11-05 06:54:11.028312	\N
d4ad5bc4-eb6f-446f-aee2-28352a57d550	a18891ca-7eea-49d9-b820-8e5655d4bf1a	[["70976fff-2417-413e-ad45-32c7867dd82f","\\u003cp\\u003eEksekutif\\u0026nbsp;\\u003c/p\\u003e"],["1c6b2c8b-9a22-4f73-ab1d-4be0b5d5053d","\\u003cp\\u003eBertanggung jawab atas pelaksanaan kebijakan dan pemerintahan sehari-hari. Kepala eksekutif bisa berupa presiden, perdana menteri, atau kepala pemerintahan setingkat nasional.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.038311	2024-11-05 06:54:11.038311	
bc263498-e3f3-44b6-9080-823f90cd6878	a18891ca-7eea-49d9-b820-8e5655d4bf1a	[["fdeece34-86c5-4be3-a2de-39fa29dd73bf","\\u003cp\\u003eLegislatif\\u0026nbsp;\\u003c/p\\u003e"],["d9810b45-4001-4a4a-89da-c57bae8719e9","\\u003cp\\u003eMembuat undang-undang, mengesahkan anggaran, dan memberikan pengawasan terhadap eksekutif. Di beberapa negara, ini dapat terdiri dari parlemen satu kamar atau dua kamar, seperti dewan perwakilan rakyat dan dewan perwakilan daerah.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.039534	2024-11-05 06:54:11.039534	
59c23dfe-83ed-4529-9f62-1832dae2c3a5	a18891ca-7eea-49d9-b820-8e5655d4bf1a	[["b4a2b657-5966-4d4f-a64a-9f01938310d8","\\u003cp\\u003eYudikatif\\u0026nbsp;\\u003c/p\\u003e"],["eb08bb16-93a0-4cb6-a773-4d79e217ae65","\\u003cp\\u003eBertugas menafsirkan undang-undang, menyelesaikan sengketa hukum, dan menjalankan keadilan. Puncak sistem yudikatif biasanya diwakili oleh mahkamah agung atau lembaga setingkat yang menangani konstitusionalitas undang-undang.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.040645	2024-11-05 06:54:11.040645	
b0985618-b492-4916-a728-3eea2ffcba44	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["933c3db8-bf8a-4114-b70b-46114ed3d732","\\u003cp\\u003eCPU (Central Processing Unit)\\u0026nbsp;\\u003c/p\\u003e"],["3409a51e-a475-4046-a2c0-1eefe2ed384a","\\u003cp\\u003eOtak komputer yang melakukan pemrosesan instruksi.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.043493	2024-11-05 06:54:11.043493	
3bb17ff9-84be-4c0b-8f3d-3d46203a0eb7	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["c4c82de9-0686-43ab-be27-47f48f8a8cba","\\u003cp\\u003eRAM (Random Access Memory)\\u0026nbsp;\\u003c/p\\u003e"],["dd6ab84d-a743-484a-b500-eb48eed773bf","\\u003cp\\u003eTempat penyimpanan sementara untuk data yang sedang diakses oleh CPU.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.044612	2024-11-05 06:54:11.044612	
64c4a50f-6e08-4ffc-8f31-3c6e7182bd8c	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["96f6b918-fc04-4e63-879b-f22e474ed785","\\u003cp\\u003eHard Drive (Hard Disk)\\u0026nbsp;\\u003c/p\\u003e"],["afa61bd7-c82f-4962-b8f1-ab6e0b5fd1e0","\\u003cp\\u003eMenyimpan data jangka panjang dan program di komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.045769	2024-11-05 06:54:11.045769	
64198fc2-67bf-4c91-857e-1f005954a1b6	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["74dcb347-988a-4999-966b-5746e5e44456","\\u003cp\\u003eBertanggung jawab untuk pemrosesan grafis.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.047158	2024-11-05 06:54:11.047159	
9feebbd8-461f-4fc6-b9e6-001b32d953bd	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["32dff7c0-010f-4a7b-9fac-9ee49af2b771","\\u003cp\\u003ePapan sirkuit utama yang menghubungkan komponen utama.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.048282	2024-11-05 06:54:11.048283	
3bc8d0c0-df3a-46d7-8f0c-9e49df55a9d9	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["91c74192-48e1-4eb2-915a-d66f413c25aa","\\u003cp\\u003eMenyediakan daya listrik untuk komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.04941	2024-11-05 06:54:11.04941	
8c453f2f-7589-46b8-80c4-ef57ac772df4	8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	[["42f86297-369f-46b0-8e31-72576d80e919","\\u003cp\\u003eMenampilkan informasi grafis dan teks.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-05 06:54:11.050549	2024-11-05 06:54:11.050549	
766df6f3-e7f7-4a39-a464-80d78abd87a9	5ce437cb-d2e1-41bd-9268-d73fe0d0a6b7	{"0":{"id":"3eb4253d-7e4a-42ab-a2ef-1e653c1cb973","text":"\\u003cp\\u003eProklamasi Kemerdekaan Indonesia oleh Soekarno dan Mohammad Hatta.\\u0026nbsp;\\u003c/p\\u003e"},"1":{"id":"02aa6ea8-b0de-443a-b6d5-aefbdfc69e79","text":"\\u003cp\\u003eKonferensi Meja Bundar (KMB) dimulai untuk membahas masa depan Indonesia pasca-kemerdekaan.\\u0026nbsp;\\u003c/p\\u003e"},"2":{"id":"9336ba04-e9fa-40fd-9dea-96955ce57486","text":"\\u003cp\\u003ePenyerahan kedaulatan Indonesia dari Belanda kepada Republik Indonesia Serikat (RIS) sesuai hasil Konferensi RTC (Roem-van Roijen).\\u0026nbsp;\\u003c/p\\u003e"},"3":{"id":"8b49afbf-b4ff-4033-9dad-b72a99cdfab9","text":"\\u003cp\\u003ePembubaran RIS dan kembalinya Republik Indonesia sebagai negara kesatuan.\\u0026nbsp;\\u003c/p\\u003e"},"4":{"id":"28d884cf-6ee9-4aab-a808-4466db398b52","text":"\\u003cp\\u003eKonferensi Asia-Afrika di Bandung, Indonesia, yang menjadi awal gerakan Non-Blok.\\u0026nbsp;\\u003c/p\\u003e"}}	t	2024-11-05 06:54:11.053194	2024-11-05 06:54:11.053194	
1795d7d5-1c17-4adc-a3ef-285b9206c801	4eb29b99-bd0d-482c-baf5-e927577f2cd0	<p>WordStar&nbsp;</p>	f	2024-11-11 16:21:17.092445	2024-11-11 16:21:17.092445	C
3b39cce6-0239-4b41-a664-88f4d94136c6	4eb29b99-bd0d-482c-baf5-e927577f2cd0	<p>Microsoft Word&nbsp;</p>	f	2024-11-11 16:21:17.093599	2024-11-11 16:21:17.093599	D
675cc711-fc37-4c74-8c3d-34fd913f43f1	4eb29b99-bd0d-482c-baf5-e927577f2cd0	<p>&nbsp;</p>	f	2024-11-11 16:21:17.094719	2024-11-11 16:21:17.094719	E
4afa7d89-6650-465f-a733-67c5009eefc7	de4ec175-01ed-45b4-8899-566784bd8708	<p> Mesin ketik mekanik&nbsp;</p>	f	2024-11-11 16:21:17.096996	2024-11-11 16:21:17.096996	A
312122f2-144d-4b92-a10a-3aa92a98d3d5	de4ec175-01ed-45b4-8899-566784bd8708	<p>Pengolah kata elektronik&nbsp;</p>	t	2024-11-11 16:21:17.097016	2024-11-11 16:21:17.097016	B
372304ab-1cfd-4c81-a281-c378890b26b5	de4ec175-01ed-45b4-8899-566784bd8708	<p>Pengolah kata perangkat lunak&nbsp;</p>	f	2024-11-11 16:21:17.098149	2024-11-11 16:21:17.098149	C
e8477b68-2221-4548-844e-aa15ad00fc75	de4ec175-01ed-45b4-8899-566784bd8708	<p>Komputer pribadi&nbsp;</p>	f	2024-11-11 16:21:17.099266	2024-11-11 16:21:17.099266	D
8b32a3df-b870-4f53-a348-cbfff0c910ce	de4ec175-01ed-45b4-8899-566784bd8708	<p>&nbsp;</p>	f	2024-11-11 16:21:17.100391	2024-11-11 16:21:17.100391	E
72d7c42d-20dd-4b52-b39c-bd9bc7e8c229	16b40fe9-22c4-4e0c-815c-7a5a3d8a63d9	[{"id":"32dca6d8-a07a-4d00-9a87-8e24a3621421","text":"\\u003cp\\u003eSetujukah kamu jika dunia hanya memiliki satu negara?\\u0026nbsp;\\u003c/p\\u003e"},{"id":"5edfccf4-befc-49d9-aba1-313b7b4674fa","text":"\\u003cp\\u003eSetujukah kamu dengan adanya globalisasi?\\u0026nbsp;\\u003c/p\\u003e"}]	t	2024-11-05 06:54:11.054514	2024-11-05 06:54:11.054515	
34b57011-1694-41e3-a89b-da3d8a11bf98	b3f12d84-f0e0-40fc-939f-7d88b6959f75	[{"id":"e7146eb7-5e1e-435d-92ce-4510789ebcc0","text":"\\u003cp\\u003e\\u003cb\\u003eErythema Nodosum\\u003c/b\\u003e adalah suatu jenis radang pada lapisan lemak kulit yang biasanya disertai dengan rasa sakit dan benjolan.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"89b3f1aa-cf9a-46f3-943e-6929abd47a22","text":"\\u003cp\\u003e\\u003cb\\u003eCachexia\\u003c/b\\u003e adalah keadaan kekurangan gizi yang parah dan menyeluruh, sering kali terkait dengan penyakit kronis seperti kanker.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"1d9c2a6b-00b3-48e6-b87b-78230ec3a49a","text":"\\u003cp\\u003e\\u003cb\\u003eAscites\\u003c/b\\u003e\\u003cb\\u003e \\u003c/b\\u003eadalah ansambel cairan yang terakumulasi di rongga perut, sering kali sebagai akibat dari penyakit hati atau gagal jantung.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"04f88e6f-8a03-4b6f-9a9b-cd0db6ccf507","text":"\\u003cp\\u003e\\u003cb\\u003eXerostomia \\u003c/b\\u003eadalah Sensasi yang tidak lazim atau tidak nyaman di kulit, seperti kesemutan atau mati rasa.\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"4a5df112-da4b-4ed7-9bc5-b5726151071d","text":"\\u003cp\\u003e\\u003cb\\u003eMyoclonus\\u003c/b\\u003e adalah kesulitan menelan makanan atau cairan, serring disebabkan oleh masalah dalam kerongkongan\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-05 06:54:11.055822	2024-11-05 06:54:11.055822	
62b4d4dc-1952-42e0-a311-5084859d1519	3a7d616b-fed5-4b67-8084-17adb7e471a4	<p>Christopher Latham Sholes&nbsp;</p>	t	2024-11-11 16:11:45.681526	2024-11-11 16:11:45.681526	A
5c443085-4a6f-4459-8925-a7f87cdf340f	3a7d616b-fed5-4b67-8084-17adb7e471a4	<p>Henry Mill&nbsp;</p>	f	2024-11-11 16:11:45.68265	2024-11-11 16:11:45.68265	B
2d30cfd9-adea-4424-8247-91bd27438abb	3a7d616b-fed5-4b67-8084-17adb7e471a4	<p>IBM&nbsp;</p>	f	2024-11-11 16:11:45.68378	2024-11-11 16:11:45.68378	C
92e203ed-b51a-4e47-926b-10ab848f95d4	3a7d616b-fed5-4b67-8084-17adb7e471a4	<p>Microsoft&nbsp;</p><p>&nbsp;</p>	f	2024-11-11 16:11:45.684892	2024-11-11 16:11:45.684892	D
0d062c2b-7bcf-4352-b510-f68a7f25bd06	3a7d616b-fed5-4b67-8084-17adb7e471a4	<p>&nbsp;</p>	f	2024-11-11 16:11:45.686411	2024-11-11 16:11:45.686412	E
e75f43a0-cd26-40cd-8fb2-2bc08df3e393	44a18e47-9e8b-4d1a-8287-daa675b4f16f	<p>IBM Selection&nbsp;</p>	f	2024-11-11 16:11:45.688722	2024-11-11 16:11:45.688722	A
085ff4ec-e26a-4671-8308-dc14c7af7aa9	44a18e47-9e8b-4d1a-8287-daa675b4f16f	<p>IBM MT/ST&nbsp;</p>	t	2024-11-11 16:11:45.689817	2024-11-11 16:11:45.689818	B
91bb14db-ffd1-4bae-aae1-9c8a8acc1b60	44a18e47-9e8b-4d1a-8287-daa675b4f16f	<p>WordStar&nbsp;</p>	f	2024-11-11 16:11:45.69092	2024-11-11 16:11:45.690921	C
84f79e20-6992-4c0a-ae27-06b8b1cb799c	44a18e47-9e8b-4d1a-8287-daa675b4f16f	<p>Microsoft Word&nbsp;</p>	f	2024-11-11 16:11:45.692018	2024-11-11 16:11:45.692018	D
e7664187-cc47-4c49-810c-93ef5a89966c	44a18e47-9e8b-4d1a-8287-daa675b4f16f	<p>&nbsp;</p>	f	2024-11-11 16:11:45.693109	2024-11-11 16:11:45.693109	E
252c5c03-51a9-4217-b781-5eb8b4fd7e88	59c8b459-637b-4213-9533-0cfc42714129	<p> Mesin ketik mekanik&nbsp;</p>	f	2024-11-11 16:11:45.695386	2024-11-11 16:11:45.695387	A
fa311ade-8f94-47a1-9b7d-4a482504eb6b	59c8b459-637b-4213-9533-0cfc42714129	<p>Pengolah kata elektronik&nbsp;</p>	t	2024-11-11 16:11:45.696504	2024-11-11 16:11:45.696505	B
33bf0182-62a5-4549-a716-7b6b7f916e64	59c8b459-637b-4213-9533-0cfc42714129	<p>Pengolah kata perangkat lunak&nbsp;</p>	f	2024-11-11 16:11:45.697605	2024-11-11 16:11:45.697605	C
9424c443-b921-4141-9ecb-74fec46b826e	59c8b459-637b-4213-9533-0cfc42714129	<p>Komputer pribadi&nbsp;</p>	f	2024-11-11 16:11:45.698729	2024-11-11 16:11:45.69873	D
493c730f-9616-423a-b8e5-aca79e8dd438	59c8b459-637b-4213-9533-0cfc42714129	<p>&nbsp;</p>	f	2024-11-11 16:11:45.699843	2024-11-11 16:11:45.699843	E
defaf53b-fa48-4c82-a0a8-2a277479fcf2	5fe6e756-687d-4e4e-9316-391d68baee47	<p>WordStar&nbsp;</p>	f	2024-11-11 16:11:45.702111	2024-11-11 16:11:45.702112	A
b703c462-de30-40ce-9a05-297c4006f82d	5fe6e756-687d-4e4e-9316-391d68baee47	<p>WordPerfect&nbsp;</p>	f	2024-11-11 16:11:45.703441	2024-11-11 16:11:45.703441	B
287a1680-1890-4225-870e-ae94ebae60a7	5fe6e756-687d-4e4e-9316-391d68baee47	<p>Microsoft Word&nbsp;</p>	t	2024-11-11 16:11:45.704567	2024-11-11 16:11:45.704567	C
d332e5ed-4bb8-4375-a163-10149e32a29b	5fe6e756-687d-4e4e-9316-391d68baee47	<p>Lotus 1-2-3&nbsp;</p>	f	2024-11-11 16:11:45.705689	2024-11-11 16:11:45.705689	D
d0fe890a-ac88-49e9-bb54-17e1af44e944	5fe6e756-687d-4e4e-9316-391d68baee47	<p>&nbsp;</p>	f	2024-11-11 16:11:45.7068	2024-11-11 16:11:45.7068	E
5a4c031e-189b-4c80-a895-f2c9b76b561c	052f8177-7f77-4632-8a38-fcb17635c9fc	<p>Subject&nbsp;</p>	f	2024-11-11 16:11:45.70907	2024-11-11 16:11:45.70907	A
00448d1f-3ea1-4074-a384-57064944d06f	052f8177-7f77-4632-8a38-fcb17635c9fc	<p> Body&nbsp;</p>	f	2024-11-11 16:11:45.710198	2024-11-11 16:11:45.710198	B
51ac8917-1233-4d98-882f-470c85366b7f	052f8177-7f77-4632-8a38-fcb17635c9fc	<p>To&nbsp;</p>	t	2024-11-11 16:11:45.711328	2024-11-11 16:11:45.711328	C
99d6d114-daf4-42e9-8821-ef4dc8a5c043	052f8177-7f77-4632-8a38-fcb17635c9fc	<p>Cc&nbsp;</p>	f	2024-11-11 16:11:45.712489	2024-11-11 16:11:45.712489	D
5af949c6-c81b-48af-94e7-fb4f92a3bbcf	052f8177-7f77-4632-8a38-fcb17635c9fc	<p>&nbsp;</p>	f	2024-11-11 16:11:45.713595	2024-11-11 16:11:45.713595	E
847cf596-1686-46d2-978b-1862e1ff4080	b6be59ff-78bb-4561-913c-1334c4021e6c	<p>Menghapus Email&nbsp;</p>	f	2024-11-11 16:11:45.715924	2024-11-11 16:11:45.715924	A
22b919fa-6061-481d-b0a4-39139f1b43fc	b6be59ff-78bb-4561-913c-1334c4021e6c	<p>Melampirkan file&nbsp;</p>	t	2024-11-11 16:11:45.717068	2024-11-11 16:11:45.717068	B
e178244c-2870-4e2f-8a54-1b416dec08ba	b6be59ff-78bb-4561-913c-1334c4021e6c	<p>Mengirim email&nbsp;</p>	f	2024-11-11 16:11:45.718208	2024-11-11 16:11:45.718208	C
cc69b116-1019-4fe8-bed0-b84893b707e7	b6be59ff-78bb-4561-913c-1334c4021e6c	<p>Membuat folder baru&nbsp;</p>	f	2024-11-11 16:11:45.719349	2024-11-11 16:11:45.719349	D
d6a87f72-4d2d-4131-b8a5-444a26b5e1e6	3d1e4d8e-19b6-4ad4-ab8b-9d2c4540cd7a	<p>Gambar akan diunduh&nbsp;</p>	f	2024-11-11 16:11:45.722093	2024-11-11 16:11:45.722094	A
2fe07145-2730-41a5-9114-108c34010892	3d1e4d8e-19b6-4ad4-ab8b-9d2c4540cd7a	<p> Gambar akan ditampilkan di tab baru&nbsp;</p>	t	2024-11-11 16:11:45.723219	2024-11-11 16:11:45.723219	B
1743514e-e3c7-4911-a330-87e6a01452dc	3d1e4d8e-19b6-4ad4-ab8b-9d2c4540cd7a	<p>Gambar akan dicetak&nbsp;</p>	f	2024-11-11 16:11:45.726073	2024-11-11 16:11:45.726074	C
5feb00e7-24a5-4c86-bdf8-72b38b1ce81c	3d1e4d8e-19b6-4ad4-ab8b-9d2c4540cd7a	<p>Gambar akan dihapus&nbsp;</p>	f	2024-11-11 16:11:45.727199	2024-11-11 16:11:45.727199	D
2586c3b6-28fd-4af4-8fb9-2625431ea687	3d1e4d8e-19b6-4ad4-ab8b-9d2c4540cd7a	<p>&nbsp;</p>	f	2024-11-11 16:11:45.728432	2024-11-11 16:11:45.728432	E
0a7bae39-c9c7-4aab-ac55-f1679dbeb24b	60946b22-a55a-4619-8637-6305b0ca1cca	<p>Dokumen berbentuk fisik&nbsp;</p>	f	2024-11-11 16:11:45.730657	2024-11-11 16:11:45.730657	A
33087030-4ec3-4ae0-b1dd-6995b4b05d32	60946b22-a55a-4619-8637-6305b0ca1cca	<p>Sistem komunikasi untuk mengirim pesan melalui internet&nbsp;</p>	t	2024-11-11 16:11:45.731748	2024-11-11 16:11:45.731748	B
a851c3aa-302f-4f35-85b3-54e742024e16	60946b22-a55a-4619-8637-6305b0ca1cca	<p>Alat untuk mengetik dokumen&nbsp;</p>	f	2024-11-11 16:11:45.732873	2024-11-11 16:11:45.732873	C
0aa87acd-478c-490f-aa0b-76cbd7fb4f96	60946b22-a55a-4619-8637-6305b0ca1cca	<p>Software untuk menggambar&nbsp;</p>	f	2024-11-11 16:11:45.734008	2024-11-11 16:11:45.734008	D
992556b7-7c95-4283-a73d-e8988076c7b8	60946b22-a55a-4619-8637-6305b0ca1cca	<p>&nbsp;</p>	f	2024-11-11 16:11:45.736081	2024-11-11 16:11:45.736081	E
7c9c821e-8428-4ed8-b752-8b50156118e5	5da8e6e0-2089-4292-8f12-dae4e52fb7af	<p>Excel dan Word&nbsp;</p>	f	2024-11-11 16:11:45.738335	2024-11-11 16:11:45.738335	A
2af5b199-0bf7-4a71-a779-75318484b3ec	5da8e6e0-2089-4292-8f12-dae4e52fb7af	<p>Address bar dan tombol navigasi&nbsp;</p>	t	2024-11-11 16:11:45.739577	2024-11-11 16:11:45.739577	B
47aa528f-0cf3-4a94-b024-9903c9748c91	5da8e6e0-2089-4292-8f12-dae4e52fb7af	<p>Media player&nbsp;</p>	f	2024-11-11 16:11:45.740719	2024-11-11 16:11:45.740719	C
d59ddbda-2caa-4531-8dbf-91dfac3db2be	5da8e6e0-2089-4292-8f12-dae4e52fb7af	<p>Spreadsheet&nbsp;</p>	f	2024-11-11 16:11:45.741848	2024-11-11 16:11:45.741848	D
73c376ae-702a-482d-be8c-99edc9a3559e	5da8e6e0-2089-4292-8f12-dae4e52fb7af	<p>&nbsp;</p>	f	2024-11-11 16:11:45.742962	2024-11-11 16:11:45.742962	E
b39d3d1d-7604-4475-a736-89f2179a5755	acd14619-42a5-4ed4-a966-bedfb1a96e64	<p>-&nbsp;</p>	f	2024-11-11 16:11:45.74565	2024-11-11 16:11:45.74565	A
fff753c1-30d2-4114-a97b-2c188332dfbd	acd14619-42a5-4ed4-a966-bedfb1a96e64	<p>+&nbsp;</p>	t	2024-11-11 16:11:45.74678	2024-11-11 16:11:45.74678	B
768dd026-8f21-47b8-973e-b12faa84bd9e	acd14619-42a5-4ed4-a966-bedfb1a96e64	<p>“ ”&nbsp;</p>	f	2024-11-11 16:11:45.748487	2024-11-11 16:11:45.748488	C
d3bbc778-5a5a-421e-afce-b0ead5f056f3	acd14619-42a5-4ed4-a966-bedfb1a96e64	<p>/&nbsp;</p>	f	2024-11-11 16:11:45.749636	2024-11-11 16:11:45.749636	D
abe3d9e2-f47c-4c0a-9210-67228a1e9794	acd14619-42a5-4ed4-a966-bedfb1a96e64	<p>&nbsp;</p>	f	2024-11-11 16:11:45.75076	2024-11-11 16:11:45.75076	E
5a8369d8-24db-42a3-955f-7e1c8913d457	4eb29b99-bd0d-482c-baf5-e927577f2cd0	<p>IBM Selection&nbsp;</p>	f	2024-11-11 16:21:17.089244	2024-11-11 16:21:17.089245	A
32cc6a48-f318-4dd2-8658-aecbec2234a1	4eb29b99-bd0d-482c-baf5-e927577f2cd0	<p>IBM MT/ST&nbsp;</p>	t	2024-11-11 16:21:17.090371	2024-11-11 16:21:17.090371	B
c94a659d-6a9b-43e6-a1e1-14b3a32329bd	4d48a3ed-d425-44d6-a59c-01b5821b8155	<p>WordStar&nbsp;</p>	f	2024-11-11 16:21:17.102701	2024-11-11 16:21:17.102701	A
537b9503-5b75-45a6-ad80-5479330764cf	4d48a3ed-d425-44d6-a59c-01b5821b8155	<p>WordPerfect&nbsp;</p>	f	2024-11-11 16:21:17.103886	2024-11-11 16:21:17.103886	B
c220d00f-4424-4ad0-94cf-3050949739db	4d48a3ed-d425-44d6-a59c-01b5821b8155	<p>Microsoft Word&nbsp;</p>	t	2024-11-11 16:21:17.105247	2024-11-11 16:21:17.105247	C
b52a3546-7efa-40a6-ad3f-09ed3ff65d19	4d48a3ed-d425-44d6-a59c-01b5821b8155	<p>Lotus 1-2-3&nbsp;</p>	f	2024-11-11 16:21:17.106676	2024-11-11 16:21:17.106676	D
7db3b873-43c7-4d49-ab3a-783604490617	4d48a3ed-d425-44d6-a59c-01b5821b8155	<p>&nbsp;</p>	f	2024-11-11 16:21:17.107795	2024-11-11 16:21:17.107795	E
e5e4bba6-2883-4544-8f3b-d8c5df240f40	b820472d-5898-4d8b-962f-a1c54b804102	<p>Subject&nbsp;</p>	f	2024-11-11 16:21:17.110267	2024-11-11 16:21:17.110268	A
a61bb237-1eee-4712-b0a9-6a088310482f	b820472d-5898-4d8b-962f-a1c54b804102	<p> Body&nbsp;</p>	f	2024-11-11 16:21:17.111392	2024-11-11 16:21:17.111392	B
bcb0ee8d-d457-4bbe-91b9-9e99c371145a	b820472d-5898-4d8b-962f-a1c54b804102	<p>To&nbsp;</p>	t	2024-11-11 16:21:17.112701	2024-11-11 16:21:17.112702	C
46fa95b0-881b-4de0-b619-386522dc308a	b820472d-5898-4d8b-962f-a1c54b804102	<p>Cc&nbsp;</p>	f	2024-11-11 16:21:17.114018	2024-11-11 16:21:17.114019	D
d5a98bcb-137b-43f3-9c06-3f1dd8654aa6	b820472d-5898-4d8b-962f-a1c54b804102	<p>&nbsp;</p>	f	2024-11-11 16:21:17.115531	2024-11-11 16:21:17.115531	E
bb7f3b1b-eddb-4bcc-ba47-fe20c6427ae7	93b301be-33fb-4c4f-b0a3-b6c1a3098c70	<p>Menghapus Email&nbsp;</p>	f	2024-11-11 16:21:17.117914	2024-11-11 16:21:17.117915	A
8c426bac-b897-406b-bd31-0c763e6ec665	93b301be-33fb-4c4f-b0a3-b6c1a3098c70	<p>Melampirkan file&nbsp;</p>	t	2024-11-11 16:21:17.11931	2024-11-11 16:21:17.11931	B
0a4e319e-21ba-4e7c-832a-4e30209268ae	93b301be-33fb-4c4f-b0a3-b6c1a3098c70	<p>Mengirim email&nbsp;</p>	f	2024-11-11 16:21:17.120503	2024-11-11 16:21:17.120503	C
062918f4-7970-41cb-9349-6e50566225d2	93b301be-33fb-4c4f-b0a3-b6c1a3098c70	<p>Membuat folder baru&nbsp;</p>	f	2024-11-11 16:21:17.121622	2024-11-11 16:21:17.121622	D
e219b42e-883b-4208-ade7-a45efdd535f4	45477509-3a99-4622-8059-e3d692945356	<p>Gambar akan diunduh&nbsp;</p>	f	2024-11-11 16:21:17.124728	2024-11-11 16:21:17.124728	A
1ddf31cb-bfe8-4d6e-aefc-e60a1486f086	45477509-3a99-4622-8059-e3d692945356	<p> Gambar akan ditampilkan di tab baru&nbsp;</p>	t	2024-11-11 16:21:17.125828	2024-11-11 16:21:17.125828	B
53d54332-6e85-4eea-bf72-1b87341fd142	45477509-3a99-4622-8059-e3d692945356	<p>Gambar akan dicetak&nbsp;</p>	f	2024-11-11 16:21:17.126916	2024-11-11 16:21:17.126917	C
15db7b85-8868-42e1-b8d1-a31283e315ff	45477509-3a99-4622-8059-e3d692945356	<p>Gambar akan dihapus&nbsp;</p>	f	2024-11-11 16:21:17.12803	2024-11-11 16:21:17.12803	D
3263c736-02d9-46eb-8c70-8a8fdefb13f0	45477509-3a99-4622-8059-e3d692945356	<p>&nbsp;</p>	f	2024-11-11 16:21:17.129334	2024-11-11 16:21:17.129335	E
2cbc01c6-1c9e-4766-a0dd-928dece0f945	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	<p>Dokumen berbentuk fisik&nbsp;</p>	f	2024-11-11 16:21:17.131942	2024-11-11 16:21:17.131942	A
6ee9b5fe-9339-4ea9-a346-838cd5e21cf2	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	<p>Sistem komunikasi untuk mengirim pesan melalui internet&nbsp;</p>	t	2024-11-11 16:21:17.133379	2024-11-11 16:21:17.133379	B
eea6920a-c7ce-4004-a8e6-2cd82b8554bb	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	<p>Alat untuk mengetik dokumen&nbsp;</p>	f	2024-11-11 16:21:17.134691	2024-11-11 16:21:17.134691	C
e4f2c77a-bcb5-470c-a3e1-47cf7b2a4311	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	<p>Software untuk menggambar&nbsp;</p>	f	2024-11-11 16:21:17.135846	2024-11-11 16:21:17.135846	D
485a96f2-d14d-474b-af17-11aad93b20ae	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	<p>&nbsp;</p>	f	2024-11-11 16:21:17.136947	2024-11-11 16:21:17.136947	E
13b60625-5d72-4f74-ba68-27ba3b2e4e35	d0339fe7-39be-4322-a71e-5c46ce48b757	<p>Excel dan Word&nbsp;</p>	f	2024-11-11 16:21:17.139187	2024-11-11 16:21:17.139187	A
dc593022-2f3a-413b-a628-3dcd3337ae15	d0339fe7-39be-4322-a71e-5c46ce48b757	<p>Address bar dan tombol navigasi&nbsp;</p>	t	2024-11-11 16:21:17.140303	2024-11-11 16:21:17.140303	B
667226a4-d761-4d83-990a-601e61d8bc7b	d0339fe7-39be-4322-a71e-5c46ce48b757	<p>Media player&nbsp;</p>	f	2024-11-11 16:21:17.141487	2024-11-11 16:21:17.141487	C
e3d48e01-496f-4d24-9647-05729c9a4d81	d0339fe7-39be-4322-a71e-5c46ce48b757	<p>Spreadsheet&nbsp;</p>	f	2024-11-11 16:21:17.142622	2024-11-11 16:21:17.142622	D
b3123d56-a5a8-49bb-bc69-32b88c7c748b	d0339fe7-39be-4322-a71e-5c46ce48b757	<p>&nbsp;</p>	f	2024-11-11 16:21:17.143738	2024-11-11 16:21:17.143738	E
9d29b576-3291-49c2-a39b-b4c4a3d21c40	040ddd51-813d-42bf-965f-0bc5303a46ce	<p>-&nbsp;</p>	f	2024-11-11 16:21:17.146387	2024-11-11 16:21:17.146387	A
21d43fd8-e8ca-4186-a2d5-0992b701dc10	040ddd51-813d-42bf-965f-0bc5303a46ce	<p>+&nbsp;</p>	t	2024-11-11 16:21:17.147503	2024-11-11 16:21:17.147503	B
dbd06bdd-c316-425c-b30a-bd861da6241c	040ddd51-813d-42bf-965f-0bc5303a46ce	<p>“ ”&nbsp;</p>	f	2024-11-11 16:21:17.148617	2024-11-11 16:21:17.148617	C
9e8f8b0a-2b60-46b2-8d10-64405b53fce6	040ddd51-813d-42bf-965f-0bc5303a46ce	<p>/&nbsp;</p>	f	2024-11-11 16:21:17.150466	2024-11-11 16:21:17.150466	D
447d525a-90d4-4d53-ade1-7011c1167bbf	040ddd51-813d-42bf-965f-0bc5303a46ce	<p>&nbsp;</p>	f	2024-11-11 16:21:17.151597	2024-11-11 16:21:17.151597	E
2a9ffceb-b305-4ab9-b88a-1cb7a14eb7ae	f550bb4c-9b59-4b0e-8472-50b1f45d9d55	<p>Menyimpan file&nbsp;</p>	f	2024-11-11 16:21:17.153888	2024-11-11 16:21:17.153888	A
3fa19562-ced8-4a48-a345-5150125ec3b9	f550bb4c-9b59-4b0e-8472-50b1f45d9d55	<p>Membuat folder baru&nbsp;</p>	t	2024-11-11 16:21:17.155242	2024-11-11 16:21:17.155242	B
9964ae31-e1b5-4fa8-a5c3-2cb1cc4c269a	f550bb4c-9b59-4b0e-8472-50b1f45d9d55	<p>Menghapus file&nbsp;</p>	f	2024-11-11 16:21:17.156381	2024-11-11 16:21:17.156381	C
37fa7343-94ff-412f-a1f3-6793015fe71a	f550bb4c-9b59-4b0e-8472-50b1f45d9d55	<p>Mengubah nama file&nbsp;</p>	f	2024-11-11 16:21:17.157471	2024-11-11 16:21:17.157471	D
ecf99476-c221-4f1f-b0dd-65a9259deb5d	6b055d46-a532-4bde-99e1-0efeaa204d9b	<p>Command Line Interface&nbsp;</p>	f	2024-11-11 16:21:17.159683	2024-11-11 16:21:17.159683	A
9baf63d6-9e84-4f3b-8ad9-295f11643fbf	6b055d46-a532-4bde-99e1-0efeaa204d9b	<p>Graphical User Interface&nbsp;</p>	t	2024-11-11 16:21:17.160809	2024-11-11 16:21:17.16081	B
ce5f3ed0-dd8b-4365-9578-6a89ee042757	6b055d46-a532-4bde-99e1-0efeaa204d9b	<p>User-Friendly Interface&nbsp;</p>	f	2024-11-11 16:21:17.161939	2024-11-11 16:21:17.161939	C
db72bd7d-cd2e-4628-a0d1-9e1f27d2d1c1	6b055d46-a532-4bde-99e1-0efeaa204d9b	<p>Web Interface&nbsp;</p>	f	2024-11-11 16:21:17.163064	2024-11-11 16:21:17.163064	D
2d70fea4-1175-4cdb-b2b3-df8ccf91dbea	d8e6721f-f1e3-4fdf-8c74-78e3c1c8594e	<p>Aplikasi berbasis web untuk mengirim email&nbsp;</p>	f	2024-11-11 16:21:17.165323	2024-11-11 16:21:17.165324	A
0816f55e-148d-4854-b07f-ab1dbd5d484b	d8e6721f-f1e3-4fdf-8c74-78e3c1c8594e	<p>Aplikasi untuk mengelola file&nbsp;</p>	f	2024-11-11 16:21:17.16645	2024-11-11 16:21:17.166451	B
3881156b-4812-431b-b85c-bc979d0da46a	d8e6721f-f1e3-4fdf-8c74-78e3c1c8594e	<p>plikasi yang membantu pengguna menemukan informasi di internet&nbsp;</p>	t	2024-11-11 16:21:17.167594	2024-11-11 16:21:17.167594	C
ddf72fae-1ac1-4da9-8e15-77802b71bf87	d8e6721f-f1e3-4fdf-8c74-78e3c1c8594e	<p>Aplikasi untuk membuat grafik&nbsp;</p>	f	2024-11-11 16:21:17.168702	2024-11-11 16:21:17.168702	D
f90f3344-3cf6-4229-9169-92fc6bd2c488	cff854b6-3804-4c5e-8029-de025ab01f4b	<p>Forward&nbsp;</p>	f	2024-11-11 16:21:17.170964	2024-11-11 16:21:17.170964	A
c2bf4f6f-3d95-4954-a46d-9ba6e4f955d9	cff854b6-3804-4c5e-8029-de025ab01f4b	<p>Send&nbsp;</p>	f	2024-11-11 16:21:17.172076	2024-11-11 16:21:17.172076	B
cdc814e8-0de4-4acc-8b84-e156b625a98c	cff854b6-3804-4c5e-8029-de025ab01f4b	<p>Delete&nbsp;</p>	t	2024-11-11 16:21:17.173373	2024-11-11 16:21:17.173373	C
834be9ef-0602-460e-9a6b-ce8c2dc7b10d	cff854b6-3804-4c5e-8029-de025ab01f4b	<p>Archive&nbsp;</p>	f	2024-11-11 16:21:17.174508	2024-11-11 16:21:17.174508	D
89b5f8ea-57a1-434b-bd29-2f36b6be52da	153cc2c8-fe40-459c-94b4-d8dd4ee1155f	<p>Teks yang tidak bisa diklik&nbsp;</p>	f	2024-11-11 16:21:17.176958	2024-11-11 16:21:17.176958	A
8cc28e62-1ebf-438a-a78c-9459a1ec27a4	153cc2c8-fe40-459c-94b4-d8dd4ee1155f	<p>Teks yang langsung terhubung ke informasi lain melalui tautan&nbsp;</p>	t	2024-11-11 16:21:17.178677	2024-11-11 16:21:17.178677	B
75820938-da1e-407e-bfce-9734c954b369	153cc2c8-fe40-459c-94b4-d8dd4ee1155f	<p>Teks berformat gambar&nbsp;</p>	f	2024-11-11 16:21:17.179784	2024-11-11 16:21:17.179784	C
09619fd9-547d-4250-a6f9-91ed55672a50	153cc2c8-fe40-459c-94b4-d8dd4ee1155f	<p>Teks biasa yang hanya dapat dibaca&nbsp;</p>	f	2024-11-11 16:21:17.180897	2024-11-11 16:21:17.180897	D
00f48c45-e7ae-4b0f-9bc2-2f6ddd33abc6	42fe4a5f-a7a6-45d8-8b11-9b24f882154a	<p>Christopher Latham Sholes </p>	t	2024-11-11 16:21:17.082394	2024-11-11 16:25:32.015393	A
d30fb7c3-1b6e-4593-a377-d1e32a7ae30f	42fe4a5f-a7a6-45d8-8b11-9b24f882154a	<p>Henry Mill </p>	f	2024-11-11 16:21:17.08351	2024-11-11 16:25:32.016474	B
01e095be-2c2d-4b35-ae2e-edcf694d39f0	42fe4a5f-a7a6-45d8-8b11-9b24f882154a	<p>IBM </p>	f	2024-11-11 16:21:17.084606	2024-11-11 16:25:32.017597	C
ecd4c7c4-8b5e-41e5-9530-c54c3b9b06d3	42fe4a5f-a7a6-45d8-8b11-9b24f882154a	<p>Microsoft </p><p> </p>	f	2024-11-11 16:21:17.085753	2024-11-11 16:25:32.018705	D
d64588f4-1bab-47ee-97b6-1cf3a0919c0c	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	<p> Mesin ketik mekanik&nbsp;</p>	f	2024-11-11 16:27:00.644642	2024-11-11 16:27:00.644642	A
64739596-1fff-4017-af30-940ce0154a2a	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	<p>Pengolah kata elektronik&nbsp;</p>	t	2024-11-11 16:27:00.645753	2024-11-11 16:27:00.645753	B
05685820-c39d-45ec-ad9c-8f8644162ac1	868e3100-d263-49d1-b9a8-12040176bec1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.455853	2024-11-12 02:22:28.455853	E
4be518a0-d276-46e4-b7cc-3a9b7fb64ad2	76ed9a9d-7080-473e-8136-5f769a0f87da	<p><strong>Run back to the village to get help.</strong></p>	f	2024-11-11 16:27:00.63867	2024-11-12 04:28:17.703538	A
29d1a10b-3024-41d7-80a8-c6ce33522f00	76ed9a9d-7080-473e-8136-5f769a0f87da	<p><strong>Try to scare the bear away by making loud noises.</strong></p>	t	2024-11-11 16:27:00.639781	2024-11-12 04:28:17.703578	B
edf0eeba-1fb0-43fe-83bb-4740f82cf097	76ed9a9d-7080-473e-8136-5f769a0f87da	<p><strong>Climb up the giant oak tree to stay safe.</strong></p>	f	2024-11-11 16:27:00.640883	2024-11-12 04:28:17.703607	C
82f8ba76-6d24-470f-9c30-9816892198d5	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	<p>Pengolah kata perangkat lunak&nbsp;</p>	f	2024-11-11 16:27:00.64686	2024-11-11 16:27:00.64686	C
b0a79a05-a3de-4ccb-b214-84002a408d6e	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	<p>Komputer pribadi&nbsp;</p>	f	2024-11-11 16:27:00.647959	2024-11-11 16:27:00.64796	D
35dbf16e-a6a0-49fa-8144-78aa9b7ca560	803b9b4f-9ef0-4255-8419-75785d71f0f7	<p>WordStar&nbsp;</p>	f	2024-11-11 16:27:00.650285	2024-11-11 16:27:00.650285	A
63fc3c99-f201-45d0-8d16-b8be3d564a26	803b9b4f-9ef0-4255-8419-75785d71f0f7	<p>WordPerfect&nbsp;</p>	f	2024-11-11 16:27:00.651395	2024-11-11 16:27:00.651395	B
f4ea4f74-2261-4844-9a9e-58e5d2a873b0	803b9b4f-9ef0-4255-8419-75785d71f0f7	<p>Microsoft Word&nbsp;</p>	t	2024-11-11 16:27:00.652533	2024-11-11 16:27:00.652533	C
5bb77356-c83f-40a4-bc67-f6c8cfbd9df4	803b9b4f-9ef0-4255-8419-75785d71f0f7	<p>Lotus 1-2-3&nbsp;</p>	f	2024-11-11 16:27:00.653647	2024-11-11 16:27:00.653647	D
9d45689b-245d-4632-9f40-e3282070942f	ae152984-ec8e-4824-becd-0d4365796866	<p>Subject&nbsp;</p>	f	2024-11-11 16:27:00.65593	2024-11-11 16:27:00.65593	A
236e5e18-b4eb-421b-9018-8bda3e53ea16	ae152984-ec8e-4824-becd-0d4365796866	<p> Body&nbsp;</p>	f	2024-11-11 16:27:00.657023	2024-11-11 16:27:00.657023	B
2906dd74-eeb5-4e27-8363-38d26ad3db7f	ae152984-ec8e-4824-becd-0d4365796866	<p>To&nbsp;</p>	t	2024-11-11 16:27:00.658128	2024-11-11 16:27:00.658128	C
1f9a7e41-66e6-4659-80c4-b82fa18249bd	ae152984-ec8e-4824-becd-0d4365796866	<p>Cc&nbsp;</p>	f	2024-11-11 16:27:00.659238	2024-11-11 16:27:00.659238	D
bed52831-eecd-4b7b-8cad-ea22b59fccd6	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	<p>Menghapus Email&nbsp;</p>	f	2024-11-11 16:27:00.66222	2024-11-11 16:27:00.66222	A
0f7ee069-aa5a-43bf-8b77-f704815af81f	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	<p>Melampirkan file&nbsp;</p>	t	2024-11-11 16:27:00.663311	2024-11-11 16:27:00.663311	B
cfa4bfdb-7c25-4149-9ef5-dd6db234e4c2	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	<p>Mengirim email&nbsp;</p>	f	2024-11-11 16:27:00.664416	2024-11-11 16:27:00.664416	C
3ce28a7e-fe0d-4889-8287-408934624d0c	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	<p>Membuat folder baru&nbsp;</p>	f	2024-11-11 16:27:00.66554	2024-11-11 16:27:00.665541	D
97e72bf1-135c-4d75-82dd-f6b1ac7ea598	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	<p>Gambar akan diunduh&nbsp;</p>	f	2024-11-11 16:27:00.674154	2024-11-11 16:27:00.674154	A
97e8558c-f76c-44dd-8377-9a4a968edf1f	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	<p> Gambar akan ditampilkan di tab baru&nbsp;</p>	t	2024-11-11 16:27:00.675282	2024-11-11 16:27:00.675282	B
2f143c12-59bb-4587-8861-54449d6d791c	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	<p>Gambar akan dicetak&nbsp;</p>	f	2024-11-11 16:27:00.676429	2024-11-11 16:27:00.676429	C
afc61a16-cac5-4d2b-aa6b-d8537995f7d9	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	<p>Gambar akan dihapus&nbsp;</p>	f	2024-11-11 16:27:00.677752	2024-11-11 16:27:00.677752	D
34e69251-798a-454a-9506-a804fc8273a7	c1d89fab-cf54-4996-9b3e-392ac509c409	<p>Dokumen berbentuk fisik&nbsp;</p>	f	2024-11-11 16:27:00.679978	2024-11-11 16:27:00.679978	A
6c00ac09-beaf-4f38-b704-3e796f0339d9	c1d89fab-cf54-4996-9b3e-392ac509c409	<p>Sistem komunikasi untuk mengirim pesan melalui internet&nbsp;</p>	t	2024-11-11 16:27:00.681072	2024-11-11 16:27:00.681072	B
f982b9e4-2f48-45ca-8aca-6f9ffdfab9c5	c1d89fab-cf54-4996-9b3e-392ac509c409	<p>Alat untuk mengetik dokumen&nbsp;</p>	f	2024-11-11 16:27:00.682184	2024-11-11 16:27:00.682184	C
b41d60e7-4204-48fb-8746-fb8b4e880151	c1d89fab-cf54-4996-9b3e-392ac509c409	<p>Software untuk menggambar&nbsp;</p>	f	2024-11-11 16:27:00.68363	2024-11-11 16:27:00.683631	D
3e627461-7f7c-49bd-acdf-0e6c68d46d93	2a5b3bec-510d-4604-866d-26e98c9c4e1b	<p>Excel dan Word&nbsp;</p>	f	2024-11-11 16:27:00.68634	2024-11-11 16:27:00.68634	A
79af07fa-680f-4b9d-93f0-f2709d4b49dd	2a5b3bec-510d-4604-866d-26e98c9c4e1b	<p>Address bar dan tombol navigasi&nbsp;</p>	t	2024-11-11 16:27:00.687455	2024-11-11 16:27:00.687455	B
9e469b99-4ccd-4e44-a138-d1ac632f0eb8	2a5b3bec-510d-4604-866d-26e98c9c4e1b	<p>Media player&nbsp;</p>	f	2024-11-11 16:27:00.688729	2024-11-11 16:27:00.68873	C
20c1f1eb-8408-4deb-9053-b42d126fb445	2a5b3bec-510d-4604-866d-26e98c9c4e1b	<p>Spreadsheet&nbsp;</p>	f	2024-11-11 16:27:00.689885	2024-11-11 16:27:00.689885	D
c6e57907-d308-4ea4-90b5-f69b1194924c	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	<p>-&nbsp;</p>	f	2024-11-11 16:27:00.693257	2024-11-11 16:27:00.693257	A
70ad9ce5-aae3-4659-b4ff-45518f0abcea	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	<p>+&nbsp;</p>	t	2024-11-11 16:27:00.69459	2024-11-11 16:27:00.69459	B
786c80d0-d9cf-4eea-9ba8-dce9021a8f7f	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	<p>“ ”&nbsp;</p>	f	2024-11-11 16:27:00.695731	2024-11-11 16:27:00.695731	C
45f2dc7f-a6cf-44b4-b5a2-2b8c8f8346ab	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	<p>/&nbsp;</p>	f	2024-11-11 16:27:00.696858	2024-11-11 16:27:00.696858	D
fe27c7d7-6f4f-436c-bdef-3695572c7b8d	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	<p>&nbsp;</p>	f	2024-11-11 16:27:00.697958	2024-11-11 16:27:00.697958	E
0bfd11de-4af0-45e1-b5ac-de8b841a3fa8	9f46874a-c3a0-4584-8056-9ca78535ee80	<p>Menyimpan file&nbsp;</p>	f	2024-11-11 16:27:00.700245	2024-11-11 16:27:00.700245	A
2d7e5f31-3baa-4d55-91ae-6e64eb989041	9f46874a-c3a0-4584-8056-9ca78535ee80	<p>Membuat folder baru&nbsp;</p>	t	2024-11-11 16:27:00.70136	2024-11-11 16:27:00.701361	B
83270c98-fe83-4511-b9f7-b66172a9008f	9f46874a-c3a0-4584-8056-9ca78535ee80	<p>Menghapus file&nbsp;</p>	f	2024-11-11 16:27:00.702487	2024-11-11 16:27:00.702487	C
a045847b-f0c1-4b42-a081-2c5d6bbe8135	9f46874a-c3a0-4584-8056-9ca78535ee80	<p>Mengubah nama file&nbsp;</p>	f	2024-11-11 16:27:00.703605	2024-11-11 16:27:00.703605	D
ef4a52ab-f606-457c-83ec-fff013b154e1	cc13e214-7ffb-4265-8427-9abebf7802ea	<p>Command Line Interface&nbsp;</p>	f	2024-11-11 16:27:00.706085	2024-11-11 16:27:00.706085	A
f9f11673-4d5e-4af5-857d-5a6ea9259b04	cc13e214-7ffb-4265-8427-9abebf7802ea	<p>Graphical User Interface&nbsp;</p>	t	2024-11-11 16:27:00.707209	2024-11-11 16:27:00.70721	B
6603bfb3-e5b0-4282-8f93-5c977ad22dae	cc13e214-7ffb-4265-8427-9abebf7802ea	<p>User-Friendly Interface&nbsp;</p>	f	2024-11-11 16:27:00.708335	2024-11-11 16:27:00.708335	C
39ef06d0-26dc-4ceb-99c2-42e53df046c3	cc13e214-7ffb-4265-8427-9abebf7802ea	<p>Web Interface&nbsp;</p>	f	2024-11-11 16:27:00.709576	2024-11-11 16:27:00.709576	D
8439cc50-9dfb-42b2-a2a6-d7307b93dd14	03523d9e-3f48-4f14-8305-c75fc42f4bf8	<p>Aplikasi berbasis web untuk mengirim email&nbsp;</p>	f	2024-11-11 16:27:00.711812	2024-11-11 16:27:00.711812	A
42ecfb6a-2712-4401-aa51-cd7f3c489c9e	03523d9e-3f48-4f14-8305-c75fc42f4bf8	<p>Aplikasi untuk mengelola file&nbsp;</p>	f	2024-11-11 16:27:00.712936	2024-11-11 16:27:00.712936	B
bf741452-9a2c-429a-b618-5790218c4771	03523d9e-3f48-4f14-8305-c75fc42f4bf8	<p>plikasi yang membantu pengguna menemukan informasi di internet&nbsp;</p>	t	2024-11-11 16:27:00.714059	2024-11-11 16:27:00.71406	C
b6cb44d6-3f75-4a0a-b57c-3c50f1e52661	03523d9e-3f48-4f14-8305-c75fc42f4bf8	<p>Aplikasi untuk membuat grafik&nbsp;</p>	f	2024-11-11 16:27:00.715293	2024-11-11 16:27:00.715293	D
5a4c987d-6644-42be-9197-295c9d16d1a7	e1b9401c-33c5-4b7a-876c-a5844de55ab4	<p>Forward&nbsp;</p>	f	2024-11-11 16:27:00.717619	2024-11-11 16:27:00.717619	A
b438680b-0944-497c-b580-5a6deaa147fc	e1b9401c-33c5-4b7a-876c-a5844de55ab4	<p>Send&nbsp;</p>	f	2024-11-11 16:27:00.718725	2024-11-11 16:27:00.718725	B
670f08b7-5452-47de-a3e6-4e34877966de	e1b9401c-33c5-4b7a-876c-a5844de55ab4	<p>Delete&nbsp;</p>	t	2024-11-11 16:27:00.719823	2024-11-11 16:27:00.719823	C
6576ed44-d12c-450d-83a5-838562bba375	e1b9401c-33c5-4b7a-876c-a5844de55ab4	<p>Archive&nbsp;</p>	f	2024-11-11 16:27:00.721169	2024-11-11 16:27:00.72117	D
82d88430-a7fb-4f63-b045-22e825ff3ce8	031db96a-c50a-45a6-b718-f82db2235d6b	<p>Teks yang tidak bisa diklik&nbsp;</p>	f	2024-11-11 16:27:00.723425	2024-11-11 16:27:00.723425	A
c0bb4619-6194-484c-83d3-6c23d000c2cf	031db96a-c50a-45a6-b718-f82db2235d6b	<p>Teks yang langsung terhubung ke informasi lain melalui tautan&nbsp;</p>	t	2024-11-11 16:27:00.724818	2024-11-11 16:27:00.724818	B
e3b04444-2514-41f4-86db-cbc832945c00	031db96a-c50a-45a6-b718-f82db2235d6b	<p>Teks berformat gambar&nbsp;</p>	f	2024-11-11 16:27:00.725929	2024-11-11 16:27:00.725929	C
9b851902-24b4-4081-8f6e-04143fc855eb	031db96a-c50a-45a6-b718-f82db2235d6b	<p>Teks biasa yang hanya dapat dibaca&nbsp;</p>	f	2024-11-11 16:27:00.727042	2024-11-11 16:27:00.727042	D
81c2296d-e08f-4f84-ab3f-b6880e6c11c7	d35bf80f-9ad2-4707-b6f2-68c030a9d8d8	<p>&nbsp;</p>	f	2024-11-12 02:22:28.43091	2024-11-12 02:22:28.430911	A
9933d9ac-27c1-4fd0-b33f-96bb087df0ba	d35bf80f-9ad2-4707-b6f2-68c030a9d8d8	<p>&nbsp;</p>	f	2024-11-12 02:22:28.432231	2024-11-12 02:22:28.432231	B
bf0e7e9f-85b5-44fb-8f56-0e390f15f49d	d35bf80f-9ad2-4707-b6f2-68c030a9d8d8	<p>&nbsp;</p>	f	2024-11-12 02:22:28.433338	2024-11-12 02:22:28.433339	C
58a2cea9-5687-49f0-ab4e-963f7adbf59d	d35bf80f-9ad2-4707-b6f2-68c030a9d8d8	<p>&nbsp;</p>	f	2024-11-12 02:22:28.434454	2024-11-12 02:22:28.434455	D
b76f24c0-3e7b-4a23-ba69-a7088e808363	d35bf80f-9ad2-4707-b6f2-68c030a9d8d8	<p>&nbsp;</p>	f	2024-11-12 02:22:28.435552	2024-11-12 02:22:28.435552	E
47044461-0c6b-40af-8c83-f14c129dc74d	3afa6d2c-a6cf-4be9-b7e8-fb7221ab1dc1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.437751	2024-11-12 02:22:28.437751	A
b8a05345-f66b-49d5-92e2-905f93ff9890	3afa6d2c-a6cf-4be9-b7e8-fb7221ab1dc1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.438854	2024-11-12 02:22:28.438854	B
fc212a8d-e5d4-436a-b88a-023b4e51690d	3afa6d2c-a6cf-4be9-b7e8-fb7221ab1dc1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.440146	2024-11-12 02:22:28.440147	C
4ec7c4f9-efa1-47e0-b09b-ced33fd1e5d7	3afa6d2c-a6cf-4be9-b7e8-fb7221ab1dc1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.441288	2024-11-12 02:22:28.441289	D
a5071009-5c8d-451c-a340-1f90bb9e02c9	3afa6d2c-a6cf-4be9-b7e8-fb7221ab1dc1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.442392	2024-11-12 02:22:28.442392	E
8481302e-a435-4f3c-aec8-a62a122381cb	9bffa16e-ce5f-4cfd-b866-84eaa2bf7687	<p>&nbsp;</p>	f	2024-11-12 02:22:28.444598	2024-11-12 02:22:28.444598	A
278381a7-2de1-4959-b8b0-4a5a5514a275	9bffa16e-ce5f-4cfd-b866-84eaa2bf7687	<p>&nbsp;</p>	f	2024-11-12 02:22:28.445699	2024-11-12 02:22:28.445699	B
767cd205-cb2d-4a84-b7ca-94334e53e1a0	9bffa16e-ce5f-4cfd-b866-84eaa2bf7687	<p>&nbsp;</p>	f	2024-11-12 02:22:28.446808	2024-11-12 02:22:28.446809	C
ccd3f060-90a5-4506-8cc0-ca0f519dbedf	9bffa16e-ce5f-4cfd-b866-84eaa2bf7687	<p>&nbsp;</p>	f	2024-11-12 02:22:28.447903	2024-11-12 02:22:28.447903	D
2e07a208-d2b5-4175-a0e9-e9349973bc50	9bffa16e-ce5f-4cfd-b866-84eaa2bf7687	<p>&nbsp;</p>	f	2024-11-12 02:22:28.449183	2024-11-12 02:22:28.449184	E
3bfc459f-3b8f-47ed-93a6-5d38c96c5d37	868e3100-d263-49d1-b9a8-12040176bec1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.451413	2024-11-12 02:22:28.451414	A
a1af174d-5251-4649-a35e-440eb9a7cea1	868e3100-d263-49d1-b9a8-12040176bec1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.452535	2024-11-12 02:22:28.452535	B
8f0b23e9-a3a9-497a-ab0e-477de6191c60	868e3100-d263-49d1-b9a8-12040176bec1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.453637	2024-11-12 02:22:28.453637	C
073b2c1e-aee0-4f73-b693-338a0d1af351	868e3100-d263-49d1-b9a8-12040176bec1	<p>&nbsp;</p>	f	2024-11-12 02:22:28.454753	2024-11-12 02:22:28.454753	D
ab643eee-847b-4c86-8304-c0b686ad71e3	69f0944e-2218-4f31-ba9e-669ce9044de7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.458095	2024-11-12 02:22:28.458095	A
92bfd4a4-df02-49c4-ba8f-3f4ba6ee8887	69f0944e-2218-4f31-ba9e-669ce9044de7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.459211	2024-11-12 02:22:28.459211	B
6fe1f748-64c4-4ffc-8251-c9f790765736	69f0944e-2218-4f31-ba9e-669ce9044de7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.460331	2024-11-12 02:22:28.460331	C
a521fc10-283d-477e-85de-1c35114d10c0	69f0944e-2218-4f31-ba9e-669ce9044de7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.463321	2024-11-12 02:22:28.463321	D
3267bf8b-604f-4895-ba00-3171d97580fd	69f0944e-2218-4f31-ba9e-669ce9044de7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.464449	2024-11-12 02:22:28.464449	E
95b8767c-8403-422a-8694-a2ea80d32076	678a9d7b-d7c1-4564-bfff-a491f13d114d	<p>&nbsp;</p>	f	2024-11-12 02:22:28.466718	2024-11-12 02:22:28.466718	A
2db8a7ec-44d9-4e89-825b-4e217da9730c	678a9d7b-d7c1-4564-bfff-a491f13d114d	<p>&nbsp;</p>	f	2024-11-12 02:22:28.467839	2024-11-12 02:22:28.467839	B
ef439f45-66ee-4294-9b12-b4e70ad1c6ea	678a9d7b-d7c1-4564-bfff-a491f13d114d	<p>&nbsp;</p>	f	2024-11-12 02:22:28.468984	2024-11-12 02:22:28.468984	C
aebedeed-8d5e-4b45-9d2c-c4d0c358addf	678a9d7b-d7c1-4564-bfff-a491f13d114d	<p>&nbsp;</p>	f	2024-11-12 02:22:28.470121	2024-11-12 02:22:28.470121	D
592ba5a0-5a49-492d-acfa-f6c72a484ba6	678a9d7b-d7c1-4564-bfff-a491f13d114d	<p>&nbsp;</p>	f	2024-11-12 02:22:28.471313	2024-11-12 02:22:28.471313	E
54ec708e-c50b-441c-9545-49de4d1ded7b	43291c12-174a-4645-ad1b-a23df2b34b20	<p>&nbsp;</p>	f	2024-11-12 02:22:28.473542	2024-11-12 02:22:28.473542	A
aca2d629-1162-4a76-bcd5-9d677714aaac	43291c12-174a-4645-ad1b-a23df2b34b20	<p>&nbsp;</p>	f	2024-11-12 02:22:28.474629	2024-11-12 02:22:28.47463	B
ba8db3ff-efae-484b-b86c-415d0d13e89a	43291c12-174a-4645-ad1b-a23df2b34b20	<p>&nbsp;</p>	f	2024-11-12 02:22:28.475732	2024-11-12 02:22:28.475732	C
a8b2ae14-67cd-4b3f-bf1f-a9c4fb328ff3	43291c12-174a-4645-ad1b-a23df2b34b20	<p>&nbsp;</p>	f	2024-11-12 02:22:28.476852	2024-11-12 02:22:28.476852	D
9518d4d6-a8d5-4238-a369-b4806a69dcda	43291c12-174a-4645-ad1b-a23df2b34b20	<p>&nbsp;</p>	f	2024-11-12 02:22:28.47798	2024-11-12 02:22:28.47798	E
a9bf4f34-e77a-4f65-b121-fec97e2aea41	9350dab8-02bf-4b52-943b-43fef7f94d97	<p>&nbsp;</p>	f	2024-11-12 02:22:28.480282	2024-11-12 02:22:28.480282	A
a4a2964c-c5f4-43a3-bae6-4aee9e45c216	9350dab8-02bf-4b52-943b-43fef7f94d97	<p>&nbsp;</p>	f	2024-11-12 02:22:28.481409	2024-11-12 02:22:28.481409	B
0297ae06-255e-438c-9dc1-dd05046aa62a	9350dab8-02bf-4b52-943b-43fef7f94d97	<p>&nbsp;</p>	f	2024-11-12 02:22:28.48254	2024-11-12 02:22:28.482541	C
8496117a-bbdd-4f4a-8b08-03435083136f	9350dab8-02bf-4b52-943b-43fef7f94d97	<p>&nbsp;</p>	f	2024-11-12 02:22:28.483673	2024-11-12 02:22:28.483673	D
36f4ffd5-3efe-4875-8eb8-cab2a3978ddb	9350dab8-02bf-4b52-943b-43fef7f94d97	<p>&nbsp;</p>	f	2024-11-12 02:22:28.484808	2024-11-12 02:22:28.484808	E
40217583-55bd-4c36-9bfb-bf814e1cb20d	d56a591f-73c5-4c57-b890-c5336316a08b	<p>&nbsp;</p>	f	2024-11-12 02:22:28.487063	2024-11-12 02:22:28.487063	A
44dff2c4-1efd-4b4c-9cf6-d532dbb7ff08	d56a591f-73c5-4c57-b890-c5336316a08b	<p>&nbsp;</p>	f	2024-11-12 02:22:28.488159	2024-11-12 02:22:28.488159	B
e741cbb3-6ad8-4970-b9bf-5918b586da79	d56a591f-73c5-4c57-b890-c5336316a08b	<p>&nbsp;</p>	f	2024-11-12 02:22:28.490108	2024-11-12 02:22:28.490108	C
2e87a856-a2c1-4628-bdc2-53e4b39d8265	d56a591f-73c5-4c57-b890-c5336316a08b	<p>&nbsp;</p>	f	2024-11-12 02:22:28.491309	2024-11-12 02:22:28.491309	D
23417a86-b48d-4af5-922b-eb142c04df64	d56a591f-73c5-4c57-b890-c5336316a08b	<p>&nbsp;</p>	f	2024-11-12 02:22:28.49267	2024-11-12 02:22:28.49267	E
7320dbe3-14f2-4104-9bcc-71a63a7bb894	a2acc651-fa46-4da4-9b7f-d758501f0d93	<p>&nbsp;</p>	f	2024-11-12 02:22:28.495225	2024-11-12 02:22:28.495225	A
e1868025-2340-47a5-b0d3-d54dde7fe00b	a2acc651-fa46-4da4-9b7f-d758501f0d93	<p>&nbsp;</p>	f	2024-11-12 02:22:28.496336	2024-11-12 02:22:28.496336	B
31194a8d-44bd-4f08-910f-db6433487171	a2acc651-fa46-4da4-9b7f-d758501f0d93	<p>&nbsp;</p>	f	2024-11-12 02:22:28.497448	2024-11-12 02:22:28.497448	C
453cf72b-31a5-4622-a42f-70ee7bf0e731	a2acc651-fa46-4da4-9b7f-d758501f0d93	<p>&nbsp;</p>	f	2024-11-12 02:22:28.498561	2024-11-12 02:22:28.498561	D
d4f870d7-afaa-48c0-98c7-a243857fffa1	a2acc651-fa46-4da4-9b7f-d758501f0d93	<p>&nbsp;</p>	f	2024-11-12 02:22:28.499679	2024-11-12 02:22:28.49968	E
89351b43-e895-4fb2-a474-443cd073385f	ecaf9c2a-1d77-471a-bc22-22d153f575a0	<p>&nbsp;</p>	f	2024-11-12 02:22:28.500899	2024-11-12 02:22:28.500899	A
56755445-3c19-4997-8aa9-17406975e5f9	ecaf9c2a-1d77-471a-bc22-22d153f575a0	<p>&nbsp;</p>	f	2024-11-12 02:22:28.502114	2024-11-12 02:22:28.502115	B
af4eb66e-9646-44ca-9797-a6d3d844798f	ecaf9c2a-1d77-471a-bc22-22d153f575a0	<p>&nbsp;</p>	f	2024-11-12 02:22:28.503229	2024-11-12 02:22:28.503229	C
f32ef326-78be-4f52-9e2f-5eee06c04ade	ecaf9c2a-1d77-471a-bc22-22d153f575a0	<p>&nbsp;</p>	f	2024-11-12 02:22:28.504343	2024-11-12 02:22:28.504343	D
5c594c16-9dfc-4026-8056-e425a607a816	ecaf9c2a-1d77-471a-bc22-22d153f575a0	<p>&nbsp;</p>	f	2024-11-12 02:22:28.505438	2024-11-12 02:22:28.505438	E
da87524f-4767-4d03-b134-7aef23850296	b6cb8318-b5ff-466c-acc6-8b7f128616a9	<p>&nbsp;</p>	f	2024-11-12 02:22:28.507785	2024-11-12 02:22:28.507785	A
fec3edd9-bc8a-4ef3-be3b-8992a06f99a8	b6cb8318-b5ff-466c-acc6-8b7f128616a9	<p>&nbsp;</p>	f	2024-11-12 02:22:28.508908	2024-11-12 02:22:28.508908	B
af7b3b5d-9a37-4a3d-9246-9d6e595d49f3	b6cb8318-b5ff-466c-acc6-8b7f128616a9	<p>&nbsp;</p>	f	2024-11-12 02:22:28.510223	2024-11-12 02:22:28.510223	C
0d0549fb-2fb5-4a24-a165-1297d731d2a1	b6cb8318-b5ff-466c-acc6-8b7f128616a9	<p>&nbsp;</p>	f	2024-11-12 02:22:28.511347	2024-11-12 02:22:28.511348	D
40f7c158-6951-4a76-a710-3818a0d6eaae	b6cb8318-b5ff-466c-acc6-8b7f128616a9	<p>&nbsp;</p>	f	2024-11-12 02:22:28.512462	2024-11-12 02:22:28.512462	E
83de4608-536a-47c3-8eb1-562797ff272c	6d0b62a0-b95c-4e1e-a703-24bdb0f9710e	<p>&nbsp;</p>	f	2024-11-12 02:22:28.514709	2024-11-12 02:22:28.514709	A
fcb9aa23-478c-454a-baad-f5449160112b	6d0b62a0-b95c-4e1e-a703-24bdb0f9710e	<p>&nbsp;</p>	f	2024-11-12 02:22:28.515817	2024-11-12 02:22:28.515817	B
2581a569-6c9d-4755-b1d3-74fa830c2fe3	6d0b62a0-b95c-4e1e-a703-24bdb0f9710e	<p>&nbsp;</p>	f	2024-11-12 02:22:28.516905	2024-11-12 02:22:28.516905	C
8fade88b-8b8b-456b-a66d-b58818695cc2	6d0b62a0-b95c-4e1e-a703-24bdb0f9710e	<p>&nbsp;</p>	f	2024-11-12 02:22:28.518171	2024-11-12 02:22:28.518171	D
d4deacc9-1e24-436b-a86e-a3157bedae9f	6d0b62a0-b95c-4e1e-a703-24bdb0f9710e	<p>&nbsp;</p>	f	2024-11-12 02:22:28.519267	2024-11-12 02:22:28.519267	E
ece8c79f-63a3-477a-878d-dd471320fe38	6d8ef2b3-bcd5-46b6-8109-77da0ff98464	<p>&nbsp;</p>	f	2024-11-12 02:22:28.521476	2024-11-12 02:22:28.521477	A
1fe99182-e0d5-4fad-83af-3a7859bf56f2	6d8ef2b3-bcd5-46b6-8109-77da0ff98464	<p>&nbsp;</p>	f	2024-11-12 02:22:28.522577	2024-11-12 02:22:28.522578	B
45c8b690-54c7-4bc9-9c09-ab3ebadf20aa	6d8ef2b3-bcd5-46b6-8109-77da0ff98464	<p>&nbsp;</p>	f	2024-11-12 02:22:28.523687	2024-11-12 02:22:28.523687	C
7cd911f2-9766-42da-81ed-f0899f5c8cd1	6d8ef2b3-bcd5-46b6-8109-77da0ff98464	<p>&nbsp;</p>	f	2024-11-12 02:22:28.524801	2024-11-12 02:22:28.524801	D
a889be79-05ec-45d2-8887-3ee1cbe68b42	6d8ef2b3-bcd5-46b6-8109-77da0ff98464	<p>&nbsp;</p>	f	2024-11-12 02:22:28.525896	2024-11-12 02:22:28.525896	E
9b293691-40d3-4a03-ac83-1c81911aa7a1	a41166df-f957-4621-976f-5c53711fb9ec	<p>&nbsp;</p>	f	2024-11-12 02:22:28.528128	2024-11-12 02:22:28.528128	A
38b79e12-35cd-4dcd-8285-fc124b08e0d2	a41166df-f957-4621-976f-5c53711fb9ec	<p>&nbsp;</p>	f	2024-11-12 02:22:28.529262	2024-11-12 02:22:28.529262	B
ca8fd191-98db-45be-a9ef-5602be96fca8	a41166df-f957-4621-976f-5c53711fb9ec	<p>&nbsp;</p>	f	2024-11-12 02:22:28.530376	2024-11-12 02:22:28.530376	C
8ce28b37-47ea-4be5-a990-2fd9c589e57b	a41166df-f957-4621-976f-5c53711fb9ec	<p>&nbsp;</p>	f	2024-11-12 02:22:28.531501	2024-11-12 02:22:28.531501	D
401aee33-62f7-4f9c-9038-4e37d2314292	a41166df-f957-4621-976f-5c53711fb9ec	<p>&nbsp;</p>	f	2024-11-12 02:22:28.5326	2024-11-12 02:22:28.5326	E
f66b9a30-f6c5-42e4-ab3e-d71de4dfad4e	756e2b61-53c8-47ca-b3b5-9f11f4d39011	<p>Asia&nbsp;</p>	t	2024-11-12 02:22:28.534857	2024-11-12 02:22:28.534857	A
2e5dffa0-f88c-441b-804a-8096d80a5dcf	756e2b61-53c8-47ca-b3b5-9f11f4d39011	<p>Afrika&nbsp;</p>	t	2024-11-12 02:22:28.536087	2024-11-12 02:22:28.536087	B
f9e29f42-e132-4c2b-859e-afe68f671bcd	756e2b61-53c8-47ca-b3b5-9f11f4d39011	<p>Eropa&nbsp;</p>	t	2024-11-12 02:22:28.537209	2024-11-12 02:22:28.537209	C
84f5377b-a35b-49c6-b1f0-938ffd655d2d	756e2b61-53c8-47ca-b3b5-9f11f4d39011	<p>Australia&nbsp;</p>	t	2024-11-12 02:22:28.53832	2024-11-12 02:22:28.53832	D
4e0a0e2c-1ffc-4857-84a9-8cc19b5b39fb	756e2b61-53c8-47ca-b3b5-9f11f4d39011	<p>Arab&nbsp;</p>	f	2024-11-12 02:22:28.539439	2024-11-12 02:22:28.539439	E
e6c513b8-14ad-4113-8e1a-84e7a4e438df	756e2b61-53c8-47ca-b3b5-9f11f4d39011	<p>Amerika Timur&nbsp;</p>	f	2024-11-12 02:22:28.54055	2024-11-12 02:22:28.54055	F
394275c2-2a26-459f-b01a-8ff63e21322e	a4b6ec35-28f4-4504-8f8f-7f33585477f7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.542809	2024-11-12 02:22:28.542809	A
19ea6283-005d-416c-8954-896f0ea5e332	a4b6ec35-28f4-4504-8f8f-7f33585477f7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.543925	2024-11-12 02:22:28.543925	B
54740a15-3837-4a15-9c31-03377546be19	a4b6ec35-28f4-4504-8f8f-7f33585477f7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.545046	2024-11-12 02:22:28.545047	C
932f8de0-b6c4-4794-bdd5-f708bb588fda	a4b6ec35-28f4-4504-8f8f-7f33585477f7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.546359	2024-11-12 02:22:28.546359	D
b4d2ad2c-efc5-47cd-a7ea-008ceed348b9	a4b6ec35-28f4-4504-8f8f-7f33585477f7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.547459	2024-11-12 02:22:28.54746	E
1dbf62da-08f1-49ad-af30-d23d33ab321a	a4b6ec35-28f4-4504-8f8f-7f33585477f7	<p>&nbsp;</p>	f	2024-11-12 02:22:28.548566	2024-11-12 02:22:28.548566	F
e3ef7194-3f82-44e6-a87a-525df7658ff9	4ae55e4c-8561-40cf-85d3-e11147da7d0c	<p>&nbsp;</p>	f	2024-11-12 02:22:28.550825	2024-11-12 02:22:28.550825	A
739c311b-2246-47a4-9102-962319c12341	4ae55e4c-8561-40cf-85d3-e11147da7d0c	<p>&nbsp;</p>	f	2024-11-12 02:22:28.551918	2024-11-12 02:22:28.551919	B
f659717c-3d6e-47b2-ba29-ab7a1d429aec	4ae55e4c-8561-40cf-85d3-e11147da7d0c	<p>&nbsp;</p>	f	2024-11-12 02:22:28.553024	2024-11-12 02:22:28.553024	C
47d03dec-9f7e-44ec-b5d0-946c36cecdb2	4ae55e4c-8561-40cf-85d3-e11147da7d0c	<p>&nbsp;</p>	f	2024-11-12 02:22:28.554242	2024-11-12 02:22:28.554242	D
0ed109a5-15f0-4aed-b897-949515bd2d30	4ae55e4c-8561-40cf-85d3-e11147da7d0c	<p>&nbsp;</p>	f	2024-11-12 02:22:28.55536	2024-11-12 02:22:28.55536	E
d1a84765-3124-4032-944b-b0f0301b2d83	4ae55e4c-8561-40cf-85d3-e11147da7d0c	<p>&nbsp;</p>	f	2024-11-12 02:22:28.556461	2024-11-12 02:22:28.556461	F
495f4117-27d5-4221-a152-7e0160ff2a2f	b40678d5-3cb0-4a4b-875d-572ac81b14af	<p>&nbsp;</p>	f	2024-11-12 02:22:28.558658	2024-11-12 02:22:28.558658	A
15e90845-313c-4bfe-aa12-23a87dc129cc	b40678d5-3cb0-4a4b-875d-572ac81b14af	<p>&nbsp;</p>	f	2024-11-12 02:22:28.559794	2024-11-12 02:22:28.559794	B
bd3ec878-10cc-4cc5-9c8d-a8d6956ff52e	b40678d5-3cb0-4a4b-875d-572ac81b14af	<p>&nbsp;</p>	f	2024-11-12 02:22:28.560914	2024-11-12 02:22:28.560914	C
b338b218-019e-4fa0-b345-92409d6121b4	b40678d5-3cb0-4a4b-875d-572ac81b14af	<p>&nbsp;</p>	f	2024-11-12 02:22:28.562123	2024-11-12 02:22:28.562123	D
7585f9c3-8053-45c6-8f1c-f1890e2a8f0b	b40678d5-3cb0-4a4b-875d-572ac81b14af	<p>&nbsp;</p>	f	2024-11-12 02:22:28.56322	2024-11-12 02:22:28.56322	E
84e9dc2a-479b-4e0d-bf0f-e78ec6c426e4	b40678d5-3cb0-4a4b-875d-572ac81b14af	<p>&nbsp;</p>	f	2024-11-12 02:22:28.564311	2024-11-12 02:22:28.564311	F
774301bd-598d-45f9-aad6-44524ede9b0c	836a1e0f-5fa1-47dc-b71e-52c766170477	<p>&nbsp;</p>	f	2024-11-12 02:22:28.566512	2024-11-12 02:22:28.566512	A
9a5e9f16-29f9-4dad-a9e9-781b45b50917	836a1e0f-5fa1-47dc-b71e-52c766170477	<p>&nbsp;</p>	f	2024-11-12 02:22:28.567628	2024-11-12 02:22:28.567628	B
a5719324-414a-4fda-8026-c509b5faa282	836a1e0f-5fa1-47dc-b71e-52c766170477	<p>&nbsp;</p>	f	2024-11-12 02:22:28.568735	2024-11-12 02:22:28.568735	C
28220a2d-8cb3-4d40-9100-666dfdce745f	836a1e0f-5fa1-47dc-b71e-52c766170477	<p>&nbsp;</p>	f	2024-11-12 02:22:28.569846	2024-11-12 02:22:28.569846	D
7e60e419-178f-46f2-958f-a3907d99019b	836a1e0f-5fa1-47dc-b71e-52c766170477	<p>&nbsp;</p>	f	2024-11-12 02:22:28.571193	2024-11-12 02:22:28.571193	E
f40cd18e-b117-4200-8495-a4ad7363bb2b	836a1e0f-5fa1-47dc-b71e-52c766170477	<p>&nbsp;</p>	f	2024-11-12 02:22:28.572325	2024-11-12 02:22:28.572325	F
81098693-9593-4c0e-b903-3d675e55c9d3	685e02ed-dd15-4d8e-b5ce-783d19044802	<p>&nbsp;</p>	f	2024-11-12 02:22:28.574587	2024-11-12 02:22:28.574587	A
01cd2f01-2cae-4fff-b6d5-80a4c5fb7ba2	685e02ed-dd15-4d8e-b5ce-783d19044802	<p>&nbsp;</p>	f	2024-11-12 02:22:28.57569	2024-11-12 02:22:28.575691	B
efef5dbd-bccb-4720-8dc7-e8b8faa32cfa	685e02ed-dd15-4d8e-b5ce-783d19044802	<p>&nbsp;</p>	f	2024-11-12 02:22:28.576799	2024-11-12 02:22:28.5768	C
5d726c7a-1740-4486-9528-362ad56e9032	685e02ed-dd15-4d8e-b5ce-783d19044802	<p>&nbsp;</p>	f	2024-11-12 02:22:28.577906	2024-11-12 02:22:28.577907	D
72a117d6-77b2-4719-b7d1-a9dcbfead0a4	685e02ed-dd15-4d8e-b5ce-783d19044802	<p>&nbsp;</p>	f	2024-11-12 02:22:28.579011	2024-11-12 02:22:28.579011	E
e9feab88-7616-47b5-8132-bf4956add4b3	685e02ed-dd15-4d8e-b5ce-783d19044802	<p>&nbsp;</p>	f	2024-11-12 02:22:28.580233	2024-11-12 02:22:28.580234	F
4c9fbd18-87de-4eac-ac99-f8e12dde92b8	67a0e721-b0b7-4904-a6f2-325d20eb9bc5	<p>&nbsp;</p>	f	2024-11-12 02:22:28.582524	2024-11-12 02:22:28.582524	A
07cb2135-4d72-430b-bbea-a32d42f3704e	67a0e721-b0b7-4904-a6f2-325d20eb9bc5	<p>&nbsp;</p>	f	2024-11-12 02:22:28.583646	2024-11-12 02:22:28.583647	B
4879a7f8-6c34-41a6-aa21-e2eeadce057c	67a0e721-b0b7-4904-a6f2-325d20eb9bc5	<p>&nbsp;</p>	f	2024-11-12 02:22:28.584765	2024-11-12 02:22:28.584765	C
82e9127a-462d-437e-9fc6-355f11a9d9f0	67a0e721-b0b7-4904-a6f2-325d20eb9bc5	<p>&nbsp;</p>	f	2024-11-12 02:22:28.585913	2024-11-12 02:22:28.585913	D
077e8cc5-f04d-4903-b2a6-19887ff62fe1	67a0e721-b0b7-4904-a6f2-325d20eb9bc5	<p>&nbsp;</p>	f	2024-11-12 02:22:28.587028	2024-11-12 02:22:28.587028	E
e3cc8428-50d9-474e-acd4-0c50671d7148	67a0e721-b0b7-4904-a6f2-325d20eb9bc5	<p>&nbsp;</p>	f	2024-11-12 02:22:28.588166	2024-11-12 02:22:28.588166	F
42f4aca2-6f18-40b1-934c-fb5e1ba5bd9b	b8654018-f753-484b-a939-9221dc5b8776	<p>&nbsp;</p>	f	2024-11-12 02:22:28.590671	2024-11-12 02:22:28.590671	A
13fe9b66-93ad-4def-8bb4-15ac423bb44b	b8654018-f753-484b-a939-9221dc5b8776	<p>&nbsp;</p>	f	2024-11-12 02:22:28.591812	2024-11-12 02:22:28.591813	B
bb9250ff-fa51-405d-80ae-c0018e980eda	b8654018-f753-484b-a939-9221dc5b8776	<p>&nbsp;</p>	f	2024-11-12 02:22:28.592923	2024-11-12 02:22:28.592923	C
e6c62ae0-6599-4042-8f3f-59bc7d2c043a	b8654018-f753-484b-a939-9221dc5b8776	<p>&nbsp;</p>	f	2024-11-12 02:22:28.592944	2024-11-12 02:22:28.592944	D
b8eb89d4-2870-464c-89dd-d8362a9ce957	b8654018-f753-484b-a939-9221dc5b8776	<p>&nbsp;</p>	f	2024-11-12 02:22:28.59405	2024-11-12 02:22:28.59405	E
b51ba6b7-4505-46ec-b6c6-0dbbea84df86	b8654018-f753-484b-a939-9221dc5b8776	<p>&nbsp;</p>	f	2024-11-12 02:22:28.595164	2024-11-12 02:22:28.595164	F
b972db56-38d2-4f18-8ee4-a8eab8df0ebd	855ee472-02e8-4456-bb98-d514afae1821	<p>&nbsp;</p>	f	2024-11-12 02:22:28.597389	2024-11-12 02:22:28.597389	A
e877ac89-701d-4b1a-982a-756711e21e6e	855ee472-02e8-4456-bb98-d514afae1821	<p>&nbsp;</p>	f	2024-11-12 02:22:28.598518	2024-11-12 02:22:28.598518	B
3f14b5dc-df05-454c-86a6-111440d24b69	855ee472-02e8-4456-bb98-d514afae1821	<p>&nbsp;</p>	f	2024-11-12 02:22:28.599646	2024-11-12 02:22:28.599647	C
3b92dc3c-56c7-462d-8fec-d234b5dceda1	855ee472-02e8-4456-bb98-d514afae1821	<p>&nbsp;</p>	f	2024-11-12 02:22:28.600812	2024-11-12 02:22:28.600812	D
725bf742-50f7-43aa-8d09-5e1f0289b9ca	855ee472-02e8-4456-bb98-d514afae1821	<p>&nbsp;</p>	f	2024-11-12 02:22:28.601913	2024-11-12 02:22:28.601914	E
554d8817-27df-4d6e-bb40-31748a176aa0	855ee472-02e8-4456-bb98-d514afae1821	<p>&nbsp;</p>	f	2024-11-12 02:22:28.603218	2024-11-12 02:22:28.603218	F
56df41fd-35e0-4746-b377-6359df47b120	f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	<p>&nbsp;</p>	f	2024-11-12 02:22:28.605446	2024-11-12 02:22:28.605447	A
6079e531-5845-485a-a840-4e87d7779b9b	f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	<p>&nbsp;</p>	f	2024-11-12 02:22:28.606637	2024-11-12 02:22:28.606637	B
2bc83a87-b863-47ee-8efa-f27a99a6545b	f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	<p>&nbsp;</p>	f	2024-11-12 02:22:28.607774	2024-11-12 02:22:28.607775	C
64a944e0-304a-4849-b2fe-2349209c3d01	f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	<p>&nbsp;</p>	f	2024-11-12 02:22:28.608884	2024-11-12 02:22:28.608885	D
9d058275-7489-4470-ac46-8f65fdd092a1	f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	<p>&nbsp;</p>	f	2024-11-12 02:22:28.610204	2024-11-12 02:22:28.610204	E
55d3a261-0c02-49a5-abe5-bb0822163426	f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	<p>&nbsp;</p>	f	2024-11-12 02:22:28.611317	2024-11-12 02:22:28.611317	F
a0dd7919-1821-4813-a1d2-d381f62e0930	75be5aea-c086-4d98-84e1-79521f7cb83d	[["b4963a3d-b9e0-4507-9094-43726fd58650","\\u003cp\\u003eEksekutif\\u0026nbsp;\\u003c/p\\u003e"],["60ee4486-a52c-4c76-9a2a-fdd4145166a9","\\u003cp\\u003eBertanggung jawab atas pelaksanaan kebijakan dan pemerintahan sehari-hari. Kepala eksekutif bisa berupa presiden, perdana menteri, atau kepala pemerintahan setingkat nasional.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.613655	2024-11-12 02:22:28.613655	
557a9320-a4c0-4043-a85b-f7d3aeda8cf9	75be5aea-c086-4d98-84e1-79521f7cb83d	[["1f58afaf-161c-44ef-a5c9-33b3fff24f89","\\u003cp\\u003eLegislatif\\u0026nbsp;\\u003c/p\\u003e"],["a478439f-de16-4449-9b84-d4470a5a7c93","\\u003cp\\u003eMembuat undang-undang, mengesahkan anggaran, dan memberikan pengawasan terhadap eksekutif. Di beberapa negara, ini dapat terdiri dari parlemen satu kamar atau dua kamar, seperti dewan perwakilan rakyat dan dewan perwakilan daerah.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.614772	2024-11-12 02:22:28.614773	
ff8cfaae-09a0-4616-a3aa-164d94af0be2	75be5aea-c086-4d98-84e1-79521f7cb83d	[["538168b1-aee1-415f-8d83-58c78e5342e1","\\u003cp\\u003eYudikatif\\u0026nbsp;\\u003c/p\\u003e"],["5b596d52-2948-4e91-9f17-9c0081c17dd2","\\u003cp\\u003eBertugas menafsirkan undang-undang, menyelesaikan sengketa hukum, dan menjalankan keadilan. Puncak sistem yudikatif biasanya diwakili oleh mahkamah agung atau lembaga setingkat yang menangani konstitusionalitas undang-undang.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.622544	2024-11-12 02:22:28.622545	
24815ee9-96f1-47d0-952d-997087a19dea	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["e3b27c60-3fed-4792-9441-405114adcfa3","\\u003cp\\u003eCPU (Central Processing Unit)\\u0026nbsp;\\u003c/p\\u003e"],["69f8a170-9c7c-482a-ad9b-d93696868c03","\\u003cp\\u003eOtak komputer yang melakukan pemrosesan instruksi.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.633404	2024-11-12 02:22:28.633404	
e67a48bd-7082-4076-9167-5cb428f8b80d	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["3ca2efa2-1559-44be-8ede-add585c039ac","\\u003cp\\u003eRAM (Random Access Memory)\\u0026nbsp;\\u003c/p\\u003e"],["9a657753-2201-4ae3-97eb-491c7b9ff8e4","\\u003cp\\u003eTempat penyimpanan sementara untuk data yang sedang diakses oleh CPU.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.63449	2024-11-12 02:22:28.63449	
ff81fb77-31ad-4c9a-92a1-608ba061d55d	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["ca3cc900-ba17-4a23-b404-9c505587ef85","\\u003cp\\u003eHard Drive (Hard Disk)\\u0026nbsp;\\u003c/p\\u003e"],["f932e4fe-6d44-4210-a3b5-698e540b086d","\\u003cp\\u003eMenyimpan data jangka panjang dan program di komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.635679	2024-11-12 02:22:28.635679	
30d2498b-5c98-4676-af1b-a2ff75f18b00	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["cc1398ba-cff4-4757-9e21-446f46778109","\\u003cp\\u003eBertanggung jawab untuk pemrosesan grafis.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.637218	2024-11-12 02:22:28.637218	
3678d705-d6b4-4329-9993-5f3828df697f	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["6a74ee2f-c8c9-4679-a886-50b8c9cd79ac","\\u003cp\\u003ePapan sirkuit utama yang menghubungkan komponen utama.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.638495	2024-11-12 02:22:28.638495	
c8be83f4-a786-4e15-a7be-12bfe9752cd2	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["32929bd1-bc17-4aae-9ab8-4d32a27e4865","\\u003cp\\u003eMenyediakan daya listrik untuk komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.639645	2024-11-12 02:22:28.639645	
21f63119-ab51-436c-ae4a-f1d9a5ab666f	bb5cb72c-104f-4605-b8ba-96dedf60e568	[["7a5c39f8-7641-4346-8e1a-c2f7b5401ff5","\\u003cp\\u003eMenampilkan informasi grafis dan teks.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.640796	2024-11-12 02:22:28.640796	
807a5f5b-8847-4cbe-8a53-3bb6a2026194	79d2fa79-b8c9-44ce-a5b3-ab7d322bd2e4	[["375750f7-3821-4d05-b770-7884ff623272","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.644588	2024-11-12 02:22:28.644588	
c2c262e1-3624-41ec-b6fa-5642a39a1d64	79d2fa79-b8c9-44ce-a5b3-ab7d322bd2e4	[["df733138-8e5e-4094-b941-1f3bde6cd854","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.645752	2024-11-12 02:22:28.645752	
2c86db41-fc10-4a4b-8675-7b7186a357f6	79d2fa79-b8c9-44ce-a5b3-ab7d322bd2e4	[["a9476100-e530-4038-b9bd-be1ade33c8f7","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.6469	2024-11-12 02:22:28.646901	
9eb92fea-834a-4554-adf5-a5f84aad63ba	79d2fa79-b8c9-44ce-a5b3-ab7d322bd2e4	[["61b0e2ab-7584-4219-8a09-3ceb61a20907","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.654004	2024-11-12 02:22:28.654004	
334c8af9-3110-4634-8de5-94a6649661b3	31363bbf-76ec-400d-9c57-92a02aaf563c	[["fdfcefcf-d986-4dff-b0cc-313bf46e54c1","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.657468	2024-11-12 02:22:28.657468	
068557f5-4620-4099-8b54-c74c8b9ec487	31363bbf-76ec-400d-9c57-92a02aaf563c	[["6b4cd476-5af3-49ec-a220-9a30af634e43","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.658598	2024-11-12 02:22:28.658598	
eaeda0e9-1935-4495-8a23-33bf0deafe41	31363bbf-76ec-400d-9c57-92a02aaf563c	[["0a9fc7b2-9f0e-44a1-9a87-1b1a7d76cd10","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.659727	2024-11-12 02:22:28.659727	
2529ca77-ab80-4f73-9213-f663d5077926	31363bbf-76ec-400d-9c57-92a02aaf563c	[["7c8be1a5-dabf-42f8-95bd-0016d32d8b37","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.660855	2024-11-12 02:22:28.660855	
df1bff20-808e-4870-b6cc-c7360822ca34	c9fc00af-63af-4b0a-83d7-92f3bbf324ad	[["b9a7e1be-ba04-4d37-b2d6-5d2d9ee0a106","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.664594	2024-11-12 02:22:28.664594	
64a8d891-f482-4732-bb5e-9169db200c11	c9fc00af-63af-4b0a-83d7-92f3bbf324ad	[["9dd06797-3247-4ff2-9bc9-0f742e367d7c","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.665716	2024-11-12 02:22:28.665716	
df089940-ec26-4668-a452-9a3dfa02b2e3	c9fc00af-63af-4b0a-83d7-92f3bbf324ad	[["337ef6ff-62d9-4717-ba97-06e375599e1c","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.666838	2024-11-12 02:22:28.666839	
ac16a21e-7fb1-40a8-bff9-09e8943b0ad0	c9fc00af-63af-4b0a-83d7-92f3bbf324ad	[["f79eecee-8193-4bbc-9f6b-5d7a61703c7b","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.667953	2024-11-12 02:22:28.667953	
00fd416d-4fa6-4459-82c3-d45a2e81613f	4fa4633e-4a19-4840-b658-293c8fa1103e	[["800870e6-16e0-4c60-b860-f0a55907184a","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.671655	2024-11-12 02:22:28.671656	
6909fc62-2a96-4836-81e8-224887788797	4fa4633e-4a19-4840-b658-293c8fa1103e	[["7f23cdf2-9635-4637-ad12-f8b2dd9bc512","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.672773	2024-11-12 02:22:28.672773	
b6944a4c-95f2-46c0-b7cc-6718e626995a	4fa4633e-4a19-4840-b658-293c8fa1103e	[["aee062a8-c2d4-4fad-9f7c-9ae8b6dee0dd","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.67391	2024-11-12 02:22:28.67391	
94618a5d-63b6-4080-95a7-0dcb2fb0ac10	4fa4633e-4a19-4840-b658-293c8fa1103e	[["597b463f-9a99-43db-bff1-3283096a58a8","\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 02:22:28.675169	2024-11-12 02:22:28.675169	
db020802-b14e-4e51-a466-19a5d6cff836	47cdb9fd-527c-4a8f-ac69-f991eda919ad	[{"id":"1e478f26-ea09-4ca1-a177-b0dc73f4ddae","text":"\\u003cp\\u003e\\u003cb\\u003eErythema Nodosum\\u003c/b\\u003e adalah suatu jenis radang pada lapisan lemak kulit yang biasanya disertai dengan rasa sakit dan benjolan.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"9d65f2f7-af19-4835-ad71-23349129a0de","text":"\\u003cp\\u003e\\u003cb\\u003eCachexia\\u003c/b\\u003e adalah keadaan kekurangan gizi yang parah dan menyeluruh, sering kali terkait dengan penyakit kronis seperti kanker.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"2efb4149-55d5-4fc2-9f94-59a5945a5716","text":"\\u003cp\\u003e\\u003cb\\u003eAscites \\u003c/b\\u003eadalah ansambel cairan yang terakumulasi di rongga perut, sering kali sebagai akibat dari penyakit hati atau gagal jantung.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"ab5cd704-5f4d-4e3e-af3d-c9fe767b631c","text":"\\u003cp\\u003e\\u003cb\\u003eXerostomia \\u003c/b\\u003eadalah Sensasi yang tidak lazim atau tidak nyaman di kulit, seperti kesemutan atau mati rasa.\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"381aeb89-a6c7-4b7c-b22a-6bbd0eeb883b","text":"\\u003cp\\u003e\\u003cb\\u003eMyoclonus\\u003c/b\\u003e adalah kesulitan menelan makanan atau cairan, serring disebabkan oleh masalah dalam kerongkongan\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-12 02:22:28.677584	2024-11-12 02:22:28.677584	
62170322-f73d-4568-8741-976760a44c8c	71755233-fa10-4931-8fc9-6de157c8f59e	[{"id":"f76d8e4b-c77b-40b5-ac45-fd5d1c1c33d6","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"04072462-d513-402d-b253-1c8309261902","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"becfa13c-9396-468a-83d3-3cb0395a2999","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"67353098-d7e1-43fa-9109-ecd398a94791","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"19f0ed86-7ea5-42e6-bc20-80603bd4aa95","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-12 02:22:28.678826	2024-11-12 02:22:28.678826	
cbaae0cc-21d8-4a91-96b7-0b2e544a8526	86811d90-4b46-46e5-8028-608de4af4b48	[{"id":"4d191ae3-2370-4224-8e12-73a26d2b1510","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"bddfbc58-ef1f-48e9-9bb5-1708776be3e3","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"fe1912ee-6b12-40cf-8225-4dd33397968d","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"6458cbb0-b2a1-4f46-858a-300d9b0bd122","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"dc4d69c7-ca11-4b59-91dd-7d91e5a374a3","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-12 02:22:28.680026	2024-11-12 02:22:28.680026	
541bef1a-f134-487f-8a07-ff091a3f0b9f	5b827315-9cd6-4b7b-935a-4ac9d5ef6805	[{"id":"1cd20683-4961-4211-a507-89ce21ade4d9","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"738d4d88-f8a9-4c29-8d85-497d9eba16ae","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"d6388a1b-4325-4573-9787-ec8e9246326d","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"f4494ecf-8a07-41f3-b856-abb0b70bab9e","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"19a37b21-a7d5-484a-8b47-67342e31c058","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-12 02:22:28.681228	2024-11-12 02:22:28.681228	
9c17da30-8e35-4f3f-8cd8-02235da25828	e5a79f6a-f450-4d2d-8daf-a5c58d166b1e	[{"id":"e5558453-0727-4cda-8e33-304f75dca756","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"4a1dc6ed-95a0-4c4b-8c35-1f9537b0ee41","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"ba7a2a88-1c72-4a49-8fd6-d7fbe6315149","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"86350496-da39-4aa0-b61b-eac772303173","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"212e7d7a-907f-4806-bb6b-2449cbdd881b","text":"\\u003cp\\u003e\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-12 02:22:28.682405	2024-11-12 02:22:28.682405	
ba2d197f-fb67-4b3e-b2db-eb9401d4e8be	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	<p>Christopher Latham Sholes </p>	f	2024-11-11 16:27:00.63389	2024-11-12 04:25:26.162154	A
6257d55e-fa36-43d9-86d0-8247708c6f99	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	<p>Henry Mill </p>	t	2024-11-11 16:27:00.633912	2024-11-12 04:25:26.163236	B
214c0bf4-d8fe-492c-9229-e1068eea1eee	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	<p>IBM </p>	f	2024-11-11 16:27:00.63505	2024-11-12 04:25:26.163266	C
1df0ce76-48c6-4563-a499-19fdaea0d284	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	<p>Microsoft </p><p> </p>	f	2024-11-11 16:27:00.636172	2024-11-12 04:25:26.164983	D
0c255dee-e9b3-42d4-b218-ae95d9f7824e	76ed9a9d-7080-473e-8136-5f769a0f87da	<p><strong>ignore the bear and dig for the treasure immediately.</strong></p>	f	2024-11-11 16:27:00.642108	2024-11-12 04:28:17.703636	D
ff294b62-2d82-4027-b013-44f0f2e4caf7	7215700b-1081-406c-88aa-0599781dbd82	<p>Saya tidak sependapat dengan Anda yang tidak masuk akal.&nbsp;</p>	f	2024-11-12 06:39:51.110204	2024-11-12 06:39:51.110205	A
6cf32f12-eabe-4879-808b-c5a12d4d147e	7215700b-1081-406c-88aa-0599781dbd82	<p>Maaf, hal itu tidak dapat diterima.&nbsp;</p>	f	2024-11-12 06:39:51.11133	2024-11-12 06:39:51.111331	B
5d555d07-0145-49a4-82c2-b2b48efb9ef1	7215700b-1081-406c-88aa-0599781dbd82	<p>Saya tidak setuju sebab hal itu tidak benar.&nbsp;</p>	f	2024-11-12 06:39:51.112474	2024-11-12 06:39:51.112474	C
5c448675-dd36-4ed9-b8a7-ad88cebe3964	7215700b-1081-406c-88aa-0599781dbd82	<p>Wah, pendapat itu harus ditolak!&nbsp;</p>	f	2024-11-12 06:39:51.113596	2024-11-12 06:39:51.113596	D
38a425f7-18bc-4bba-b482-f40650194350	7215700b-1081-406c-88aa-0599781dbd82	<p>Saya kurang sependapat dengan Bapak karena saya belum yakin tentang hal itu.&nbsp;</p>	t	2024-11-12 06:39:51.114687	2024-11-12 06:39:51.114687	E
d8fa943f-ecfb-4cfb-95af-734b153f74c1	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	<p>Bintang laut&nbsp;</p>	t	2024-11-12 06:39:51.116925	2024-11-12 06:39:51.116925	A
f703528a-6f49-4ad8-a0b6-a6e46b58816d	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	<p>Kepiting&nbsp;</p>	f	2024-11-12 06:39:51.118032	2024-11-12 06:39:51.118032	B
946f049c-1a14-4b42-89c5-e68b56c64e3e	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	<p>Gurita&nbsp;</p>	f	2024-11-12 06:39:51.119138	2024-11-12 06:39:51.119139	C
48e2cc37-b384-4186-9002-8e036484e4f8	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	<p>Sponge&nbsp;</p>	f	2024-11-12 06:39:51.120359	2024-11-12 06:39:51.120359	D
98bdadb1-5ab8-4172-81fb-8080d8a836de	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	<p>Jamur&nbsp;</p>	f	2024-11-12 06:39:51.121485	2024-11-12 06:39:51.121485	E
7d7c5628-0523-423d-93c6-132aeb96a22a	1f0fdd75-233a-4f66-8776-2fc5f14436f8	<p>Asia&nbsp;</p>	t	2024-11-12 06:39:51.124377	2024-11-12 06:39:51.124377	A
944220c8-f402-426c-88e3-1c983befaef2	1f0fdd75-233a-4f66-8776-2fc5f14436f8	<p>Afrika&nbsp;</p>	t	2024-11-12 06:39:51.12549	2024-11-12 06:39:51.12549	B
1c19db46-c122-4099-999f-5d1806580d49	1f0fdd75-233a-4f66-8776-2fc5f14436f8	<p>Eropa&nbsp;</p>	t	2024-11-12 06:39:51.126601	2024-11-12 06:39:51.126601	C
69c1d19c-2ff0-4b63-985e-36872ae73855	1f0fdd75-233a-4f66-8776-2fc5f14436f8	<p>Australia&nbsp;</p>	t	2024-11-12 06:39:51.127713	2024-11-12 06:39:51.127713	D
34cce01f-76ad-4990-96e8-5fde487011d9	1f0fdd75-233a-4f66-8776-2fc5f14436f8	<p>Arab&nbsp;</p>	f	2024-11-12 06:39:51.128834	2024-11-12 06:39:51.128834	E
49645e85-3694-461f-90b8-75ccbd4a0d92	1f0fdd75-233a-4f66-8776-2fc5f14436f8	<p>Amerika Timur&nbsp;</p>	f	2024-11-12 06:39:51.130136	2024-11-12 06:39:51.130136	F
a11a0774-5eda-4da5-b6f7-af9279c3d410	b9c244f3-cdc0-4040-93ee-0416b2c4c569	["1944"]	t	2024-11-12 06:39:51.133895	2024-11-12 06:39:51.133895	\N
0ec35da2-5448-42ac-9699-475e68b1de1f	993f10a3-d06a-44ee-95c4-537387bf9a7b	[["a6a09b0a-db20-43c4-a2af-a461c04fb3cd","\\u003cp\\u003eEksekutif\\u0026nbsp;\\u003c/p\\u003e"],["19a27937-47d2-457c-a8f1-8913ade7586d","\\u003cp\\u003eBertanggung jawab atas pelaksanaan kebijakan dan pemerintahan sehari-hari. Kepala eksekutif bisa berupa presiden, perdana menteri, atau kepala pemerintahan setingkat nasional.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.135184	2024-11-12 06:39:51.135184	
59617f4f-feee-4862-9a57-db30cad98619	993f10a3-d06a-44ee-95c4-537387bf9a7b	[["cbb38a51-bbe4-441e-8594-0110a9ce0c36","\\u003cp\\u003eLegislatif\\u0026nbsp;\\u003c/p\\u003e"],["2a913011-52e7-4fa3-a8a5-b0739cb00f67","\\u003cp\\u003eMembuat undang-undang, mengesahkan anggaran, dan memberikan pengawasan terhadap eksekutif. Di beberapa negara, ini dapat terdiri dari parlemen satu kamar atau dua kamar, seperti dewan perwakilan rakyat dan dewan perwakilan daerah.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.136308	2024-11-12 06:39:51.136308	
fc20c4a1-b5e2-4687-90f5-831dcc114240	993f10a3-d06a-44ee-95c4-537387bf9a7b	[["4b51b327-dcbc-4051-a7c2-442bb444c9a1","\\u003cp\\u003eYudikatif\\u0026nbsp;\\u003c/p\\u003e"],["7b8abfff-312f-4300-9d34-3696dfa8e48d","\\u003cp\\u003eBertugas menafsirkan undang-undang, menyelesaikan sengketa hukum, dan menjalankan keadilan. Puncak sistem yudikatif biasanya diwakili oleh mahkamah agung atau lembaga setingkat yang menangani konstitusionalitas undang-undang.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.13744	2024-11-12 06:39:51.13744	
50af994e-a6d9-463c-a817-2ff4ea5c91df	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["07e13c3c-375e-4d3c-96c4-96ff5bc1d826","\\u003cp\\u003eCPU (Central Processing Unit)\\u0026nbsp;\\u003c/p\\u003e"],["abe927da-2f7d-4525-9ac4-c7e9db0faa4a","\\u003cp\\u003eOtak komputer yang melakukan pemrosesan instruksi.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.139632	2024-11-12 06:39:51.139632	
006867d2-6d67-4f9e-b52a-c2d7a313c06c	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["eba2c26b-cbe0-46ab-baf8-fe3e5ad093f6","\\u003cp\\u003eRAM (Random Access Memory)\\u0026nbsp;\\u003c/p\\u003e"],["33d11cf1-4bad-4a35-9381-e653949261e2","\\u003cp\\u003eTempat penyimpanan sementara untuk data yang sedang diakses oleh CPU.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.140747	2024-11-12 06:39:51.140747	
978756a8-078a-42d4-af47-1e198cf8442c	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["f408f09c-eb38-447b-b9d2-89b8ad51c1ea","\\u003cp\\u003eHard Drive (Hard Disk)\\u0026nbsp;\\u003c/p\\u003e"],["da48eeb5-a914-40ce-a383-89f90b43eaad","\\u003cp\\u003eMenyimpan data jangka panjang dan program di komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.141871	2024-11-12 06:39:51.141871	
540a97b4-241d-45df-9063-8fa5dde509e7	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["3e0e1aca-e4dd-4655-9ebc-10fef217964c","\\u003cp\\u003eBertanggung jawab untuk pemrosesan grafis.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.143009	2024-11-12 06:39:51.143009	
e0ef5a6b-2d6f-46b6-b52b-90a84cc5e845	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["38f834b5-58dc-4f8c-8c77-e33e03e03915","\\u003cp\\u003ePapan sirkuit utama yang menghubungkan komponen utama.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.144138	2024-11-12 06:39:51.144138	
944cd063-ebf6-43f4-b728-d40871287987	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["4b721724-ccf7-4905-b472-c8ba297979ed","\\u003cp\\u003eMenyediakan daya listrik untuk komputer.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.145469	2024-11-12 06:39:51.14547	
effc0cfb-e1ae-4ad5-9a99-af6362673087	f5d11186-6c18-49c0-b7f7-d602fde843c0	[["fcca58b6-db7b-4ff9-aec1-73b28de5ce16","\\u003cp\\u003eMenampilkan informasi grafis dan teks.\\u0026nbsp;\\u003c/p\\u003e"]]	t	2024-11-12 06:39:51.146619	2024-11-12 06:39:51.146619	
2a957016-5757-4912-af24-d21ca84f4628	09fc2adc-c0c2-435f-a86f-9285ee0eecc5	{"0":{"id":"5510f919-aff6-4b58-bf2d-07d2fc27deb1","text":"\\u003cp\\u003eProklamasi Kemerdekaan Indonesia oleh Soekarno dan Mohammad Hatta.\\u0026nbsp;\\u003c/p\\u003e"},"1":{"id":"674006a1-5aa1-4c4f-8d42-258599c6e5e4","text":"\\u003cp\\u003eKonferensi Meja Bundar (KMB) dimulai untuk membahas masa depan Indonesia pasca-kemerdekaan.\\u0026nbsp;\\u003c/p\\u003e"},"2":{"id":"dc334dd0-f37e-49f3-bce9-d3a9dac2e473","text":"\\u003cp\\u003ePenyerahan kedaulatan Indonesia dari Belanda kepada Republik Indonesia Serikat (RIS) sesuai hasil Konferensi RTC (Roem-van Roijen).\\u0026nbsp;\\u003c/p\\u003e"},"3":{"id":"530349bc-f886-4d7d-ab79-060269f18ec0","text":"\\u003cp\\u003ePembubaran RIS dan kembalinya Republik Indonesia sebagai negara kesatuan.\\u0026nbsp;\\u003c/p\\u003e"},"4":{"id":"d7c39ba1-d1af-4571-943f-f4c39f59f2c7","text":"\\u003cp\\u003eKonferensi Asia-Afrika di Bandung, Indonesia, yang menjadi awal gerakan Non-Blok.\\u0026nbsp;\\u003c/p\\u003e"}}	t	2024-11-12 06:39:51.149287	2024-11-12 06:39:51.149287	
7af802b7-37e8-451f-99c9-15ac1e8fd488	829530e9-0188-4c82-bd62-25901c12c60d	[{"id":"7a8cb594-498c-49ae-9752-1d4cd0aac1f1","text":"\\u003cp\\u003eSetujukah kamu jika dunia hanya memiliki satu negara?\\u0026nbsp;\\u003c/p\\u003e"},{"id":"ce3fdc66-d35c-47be-b282-d8b6dbfbcd72","text":"\\u003cp\\u003eSetujukah kamu dengan adanya globalisasi?\\u0026nbsp;\\u003c/p\\u003e"}]	t	2024-11-12 06:39:51.150613	2024-11-12 06:39:51.150614	
03567c90-98ba-4b42-9512-8b56da2a3fe5	7ec8cf21-50eb-4e4f-8168-ee8e3e5f6053	[{"id":"86d5ee8c-2e06-4fd4-b088-a38e32e70801","text":"\\u003cp\\u003e\\u003cb\\u003eErythema Nodosum\\u003c/b\\u003e adalah suatu jenis radang pada lapisan lemak kulit yang biasanya disertai dengan rasa sakit dan benjolan.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"b550f73f-8c94-4ac2-acfe-af6b5e2fb8bf","text":"\\u003cp\\u003e\\u003cb\\u003eCachexia\\u003c/b\\u003e adalah keadaan kekurangan gizi yang parah dan menyeluruh, sering kali terkait dengan penyakit kronis seperti kanker.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"766b10eb-238e-4c7d-99f0-374c1a4f4af9","text":"\\u003cp\\u003e\\u003cb\\u003eAscites \\u003c/b\\u003eadalah ansambel cairan yang terakumulasi di rongga perut, sering kali sebagai akibat dari penyakit hati atau gagal jantung.\\u0026nbsp;\\u003c/p\\u003e","right":"Y"},{"id":"774752ad-251f-4955-b463-43e4d2bbd3b7","text":"\\u003cp\\u003e\\u003cb\\u003eXerostomia \\u003c/b\\u003eadalah Sensasi yang tidak lazim atau tidak nyaman di kulit, seperti kesemutan atau mati rasa.\\u0026nbsp;\\u003c/p\\u003e","right":"N"},{"id":"20393fdf-e2fa-4085-936d-a83f64cda33d","text":"\\u003cp\\u003e\\u003cb\\u003eMyoclonus\\u003c/b\\u003e adalah kesulitan menelan makanan atau cairan, serring disebabkan oleh masalah dalam kerongkongan\\u0026nbsp;\\u003c/p\\u003e","right":"N"}]	t	2024-11-12 06:39:51.151788	2024-11-12 06:39:51.151788	
91a0b9f6-7e97-4919-a5d4-5a558e16893f	0e271d3a-d212-4c72-8626-6571dbc7cb49	<p>Perangkat lunak, CPU, memori</p>	t	2024-11-11 16:27:00.63867	2024-11-14 00:23:17.369207	A
36cfbefb-3388-42ba-92ab-edc24b4cfe4b	0e271d3a-d212-4c72-8626-6571dbc7cb49	<p>Monitor, printer, keyboard</p>	f	2024-11-11 16:27:00.639781	2024-11-14 00:23:17.369237	B
7eca95c2-154f-4f02-8a8c-d10673f3a30c	0e271d3a-d212-4c72-8626-6571dbc7cb49	<p>CPU, motherboard, modem</p>	f	2024-11-11 16:27:00.640883	2024-11-14 00:23:17.369286	C
6c0541e4-36b8-4a59-96a1-1204a9ff1b9d	0e271d3a-d212-4c72-8626-6571dbc7cb49	<p>Monitor, mouse, dan speaker</p>	f	2024-11-11 16:27:00.642108	2024-11-14 00:23:17.370404	D
770c80d5-871e-48d0-9975-1703f320a722	63b05352-932f-4d54-953b-d7f4b9b43aa6	<p>Menyimpan data secara permanen</p>	f	2024-11-11 16:27:00.644642	2024-11-14 00:24:00.618905	A
94eddd28-7711-4277-949d-76fce1a44f7e	63b05352-932f-4d54-953b-d7f4b9b43aa6	<p>Mengolah dan menjalankan instruksi program</p>	t	2024-11-11 16:27:00.645753	2024-11-14 00:24:00.620034	B
806204ec-b49e-47fa-a948-0c58bc4a6725	63b05352-932f-4d54-953b-d7f4b9b43aa6	<p>Menyediakan daya untuk perangkat keras</p>	f	2024-11-11 16:27:00.64686	2024-11-14 00:24:00.621155	C
8ebe831d-037b-45f1-8436-e7773874ca04	63b05352-932f-4d54-953b-d7f4b9b43aa6	<p>Menyimpan file-file sementara</p>	f	2024-11-11 16:27:00.647959	2024-11-14 00:24:00.622289	D
930b3dc9-1255-4a6a-9ab6-d6d537480ca4	83b9e160-f0b6-4ae4-96ee-52d046ed25de	<p>Penyimpanan permanen untuk data dan program</p>	f	2024-11-11 16:27:00.650285	2024-11-14 00:25:00.996317	A
27f6271a-611b-49f0-9aaa-1bf5849d1072	83b9e160-f0b6-4ae4-96ee-52d046ed25de	<p>Memori sementara yang digunakan untuk menjalankan program</p>	t	2024-11-11 16:27:00.651395	2024-11-14 00:25:00.99637	B
ea29634f-0a27-49ae-bb17-dd3fc46a46d5	83b9e160-f0b6-4ae4-96ee-52d046ed25de	<p>Penyimpanan untuk sistem operasi</p>	f	2024-11-11 16:27:00.652533	2024-11-14 00:25:00.996394	C
0fc6b1a7-3d2c-4acf-bc68-c1e1ae566ff5	83b9e160-f0b6-4ae4-96ee-52d046ed25de	<p>Perangkat keras untuk menghubungkan perangkat lain</p>	f	2024-11-11 16:27:00.653647	2024-11-14 00:25:00.998528	D
ec4bce2a-f521-42e6-88a5-6e06cf77669c	5ccc86c5-5eff-4c87-9324-de42a36e316f	<p>Himpunan perangkat keras dan perangkat lunak yang bekerja bersama untuk memproses data</p>	t	2024-11-11 16:27:00.63389	2024-11-14 00:22:30.618343	A
cf0819aa-e127-4df6-a6a6-a045a262dcd7	5ccc86c5-5eff-4c87-9324-de42a36e316f	<p>Himpunan perangkat keras yang hanya digunakan untuk menjalankan aplikasi</p>	f	2024-11-11 16:27:00.633912	2024-11-14 00:22:30.618899	B
860aecdf-b63e-48de-8984-a4629e1348a6	5ccc86c5-5eff-4c87-9324-de42a36e316f	<p>Perangkat lunak yang digunakan untuk mengolah data</p>	f	2024-11-11 16:27:00.63505	2024-11-14 00:22:30.618986	C
b1300f73-964e-42be-a9fe-eea3848c3bfa	5ccc86c5-5eff-4c87-9324-de42a36e316f	<p>Proses pengolahan data tanpa perangkat keras</p>	f	2024-11-11 16:27:00.636172	2024-11-14 00:22:30.620122	D
d544e56a-cd8f-47af-ab1c-50ddc92550f3	7f04a4d2-cd49-4f43-8441-6544319744b6	<p>Program dan data yang digunakan untuk mengoperasikan perangkat keras</p>	t	2024-11-11 16:27:00.676429	2024-11-14 00:27:21.014553	C
c8d3bf7f-3f6d-496d-b3a3-33f10628a48f	0138f971-3471-474d-9d4b-587abbe6862b	<p>Monitor</p>	f	2024-11-11 16:27:00.65593	2024-11-14 00:26:13.824594	A
8ced11cc-cc84-4153-8e50-ded68989477a	0138f971-3471-474d-9d4b-587abbe6862b	<p>Keyboard</p>	t	2024-11-11 16:27:00.657023	2024-11-14 00:26:13.825656	B
444b5813-c793-490c-b79a-4e2231eb492a	0138f971-3471-474d-9d4b-587abbe6862b	<p>Printer</p>	f	2024-11-11 16:27:00.658128	2024-11-14 00:26:13.826756	C
ca044175-193e-4890-93db-a1436b5d9336	0138f971-3471-474d-9d4b-587abbe6862b	<p>Speaker</p>	f	2024-11-11 16:27:00.659238	2024-11-14 00:26:13.827836	D
23ded2d9-eb73-45c4-931a-60bb9f18f722	2fd1a198-78be-4681-955f-588a4bbf9cd8	<p>Linux</p>	f	2024-11-11 16:27:00.66222	2024-11-14 00:26:41.534219	A
423171d0-0749-40a3-a727-9c40a6d4c55a	2fd1a198-78be-4681-955f-588a4bbf9cd8	<p>Windows</p>	t	2024-11-11 16:27:00.663311	2024-11-14 00:26:41.534311	B
57d4d578-978c-42b8-bc87-463d4abc6b24	2fd1a198-78be-4681-955f-588a4bbf9cd8	<p>iOS</p>	f	2024-11-11 16:27:00.664416	2024-11-14 00:26:41.53433	C
e93f6692-7188-4f8b-b406-2af7512be6f4	2fd1a198-78be-4681-955f-588a4bbf9cd8	<p>Android</p>	f	2024-11-11 16:27:00.66554	2024-11-14 00:26:41.535499	D
d984d461-df4b-4e77-8d22-bd76fd7cf27e	7f04a4d2-cd49-4f43-8441-6544319744b6	<p>Perangkat keras yang digunakan dalam sistem komputer</p>	f	2024-11-11 16:27:00.674154	2024-11-14 00:27:21.013368	A
f3521b85-a8ca-45a2-b0e8-a0ad081c4d26	7f04a4d2-cd49-4f43-8441-6544319744b6	<p>Sistem operasi yang mengontrol komputer</p>	f	2024-11-11 16:27:00.675282	2024-11-14 00:27:21.013411	B
3d379d9b-ef44-4468-b621-b7754d2879df	7f04a4d2-cd49-4f43-8441-6544319744b6	<p>Proses pengolahan data dalam komputer</p>	f	2024-11-11 16:27:00.677752	2024-11-14 00:27:21.015683	D
c0e01265-da6f-4724-abf6-73d0a0a4d7fc	c4369bac-489a-4511-a6f2-48896716ec08	<p>Perangkat yang digunakan untuk mengoutputkan data</p>	f	2024-11-11 16:27:00.679978	2024-11-14 00:27:50.859533	A
abf6a09c-b7c1-45ad-a55a-87bc5ad2798c	c4369bac-489a-4511-a6f2-48896716ec08	<p>Perangkat yang berfungsi untuk memproses data</p>	f	2024-11-11 16:27:00.681072	2024-11-14 00:27:50.859558	B
5c9bb423-73f8-4b12-8702-104e42eef93b	c4369bac-489a-4511-a6f2-48896716ec08	<p>Perangkat yang digunakan untuk memasukkan data ke dalam sistem komputer</p>	t	2024-11-11 16:27:00.682184	2024-11-14 00:27:50.860606	C
a55cecbc-f818-4181-92f3-fa43b906a15a	c4369bac-489a-4511-a6f2-48896716ec08	<p>Perangkat yang menyimpan data secara permanen</p>	f	2024-11-11 16:27:00.68363	2024-11-14 00:27:50.861693	D
9cd1dbe1-ef7a-43a7-99ae-d75e16ffdd13	6856002a-2b9a-446d-91c0-f9f0a190ff88	<p>Mouse</p>	f	2024-11-11 16:27:00.68634	2024-11-14 00:28:34.217278	A
6b750f52-b5e9-4e1c-a131-b4969b8cb3a1	6856002a-2b9a-446d-91c0-f9f0a190ff88	<p>Keyboard</p>	f	2024-11-11 16:27:00.687455	2024-11-14 00:28:34.217323	B
19f5b143-23af-4eb9-b51d-d122fa36db64	6856002a-2b9a-446d-91c0-f9f0a190ff88	<p>Monitor</p>	t	2024-11-11 16:27:00.688729	2024-11-14 00:28:34.218505	C
bc5f8e93-5070-4087-a3dc-4419fd10b988	6856002a-2b9a-446d-91c0-f9f0a190ff88	<p>Scanner</p>	f	2024-11-11 16:27:00.689885	2024-11-14 00:28:34.219656	D
ee16455a-ef12-4287-8a07-7c565e198cd2	114cf9df-5438-4ff7-a619-ae362ebb26a9	<p>Penyimpanan eksternal untuk data komputer</p>	f	2024-11-11 16:27:00.693257	2024-11-14 00:29:04.764047	A
ba5e44fc-c42f-460e-bc33-3bdf4c284c2d	114cf9df-5438-4ff7-a619-ae362ebb26a9	<p>Perangkat keras yang menghubungkan semua komponen dalam komputer</p>	t	2024-11-11 16:27:00.69459	2024-11-14 00:29:04.7641	B
03876743-4711-4a9d-ba1b-2d9c356c69bb	114cf9df-5438-4ff7-a619-ae362ebb26a9	<p>Komponen yang digunakan untuk menjalankan aplikasi</p>	f	2024-11-11 16:27:00.695731	2024-11-14 00:29:04.764134	C
5eaf2a68-d1ff-4d8d-8d7f-a2c25d47109c	114cf9df-5438-4ff7-a619-ae362ebb26a9	<p>Alat untuk memasukkan data ke dalam komputer</p>	f	2024-11-11 16:27:00.696858	2024-11-14 00:29:04.764166	D
9544c203-7379-4307-9bd2-2bfbfe96d0d3	114cf9df-5438-4ff7-a619-ae362ebb26a9	<p> </p>	f	2024-11-11 16:27:00.697958	2024-11-14 00:29:04.765461	E
b48cba89-5f0e-435c-a624-251d21daeaca	9561dba1-c8d1-4a11-b572-7efc3f174ac9	<p>Mengolah data</p>	f	2024-11-11 16:27:00.700245	2024-11-14 00:29:35.353561	A
769d8325-87a4-4e14-b495-98bfa3ae7d47	9561dba1-c8d1-4a11-b572-7efc3f174ac9	<p>Menyimpan data secara permanen</p>	t	2024-11-11 16:27:00.70136	2024-11-14 00:29:35.353588	B
7f0667ff-adaf-4c3c-816b-50430cd9a7cc	9561dba1-c8d1-4a11-b572-7efc3f174ac9	<p>Menghubungkan komputer dengan perangkat lain</p>	f	2024-11-11 16:27:00.702487	2024-11-14 00:29:35.353621	C
c6a7e78e-78eb-4d78-9b4e-35e2a901f765	9561dba1-c8d1-4a11-b572-7efc3f174ac9	<p>Mengontrol proses input dan output</p>	f	2024-11-11 16:27:00.703605	2024-11-14 00:29:35.354687	D
deecc61c-9230-4223-9ec6-34fdb4e91a45	8771a517-0c13-4281-9cc7-875cf7aa117c	<p>Kecepatan rendah dan pemrosesan data terbatas</p>	f	2024-11-11 16:27:00.706085	2024-11-14 00:30:25.46075	A
9473d124-2bfb-412e-8278-228760d676c7	8771a517-0c13-4281-9cc7-875cf7aa117c	<p>Kecepatan tinggi untuk menjalankan instruksi</p>	t	2024-11-11 16:27:00.707209	2024-11-14 00:30:25.46079	B
1ac8c25b-0faa-4535-bc05-83adea481c2f	8771a517-0c13-4281-9cc7-875cf7aa117c	<p>Kecepatan rendah untuk menghemat energi</p>	f	2024-11-11 16:27:00.708335	2024-11-14 00:30:25.461897	C
c6ebd546-d184-4dd0-a121-cffea6ad541d	8771a517-0c13-4281-9cc7-875cf7aa117c	<p>Kecepatan sedang untuk menyeimbangkan performa dan daya</p>	f	2024-11-11 16:27:00.709576	2024-11-14 00:30:25.463012	D
09e061aa-eb75-4126-971f-77842119423f	176a1349-82df-456c-8c0e-b263c2289604	<p>Windows</p>	f	2024-11-11 16:27:00.711812	2024-11-14 00:31:00.976419	A
4d697cd1-5953-4a37-9e4c-d2487f4cc287	176a1349-82df-456c-8c0e-b263c2289604	<p>macOS</p>	f	2024-11-11 16:27:00.712936	2024-11-14 00:31:00.976501	B
f00a1817-81f1-45ff-b4eb-60614567ffbf	176a1349-82df-456c-8c0e-b263c2289604	<p>Linux</p>	t	2024-11-11 16:27:00.714059	2024-11-14 00:31:00.9776	C
cd7b7b32-656f-4c27-9865-cf00064a6039	176a1349-82df-456c-8c0e-b263c2289604	<p>iOS</p>	f	2024-11-11 16:27:00.715293	2024-11-14 00:31:00.978707	D
0dc24724-0b23-4746-a205-11bcb152979a	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	<p>Mengatur sistem operasi</p>	f	2024-11-11 16:27:00.717619	2024-11-14 00:31:31.903064	A
70563108-854d-4f77-92ac-7245a1c1b20c	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	<p>Menghubungkan perangkat keras dengan sistem operasi</p>	t	2024-11-11 16:27:00.718725	2024-11-14 00:31:31.903087	B
0bfb50db-5a43-4bbb-9c0d-865157d4fc5a	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	<p>Mengontrol aliran data dalam jaringan</p>	f	2024-11-11 16:27:00.719823	2024-11-14 00:31:31.904215	C
0b86137e-8c30-45d4-870b-0b32aee116db	6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	<p>Menyimpan data yang tidak aktif</p>	f	2024-11-11 16:27:00.721169	2024-11-14 00:31:31.905298	D
0a6f9db7-5170-4ddd-b5a5-db88851e6fbc	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	<p>Memori yang digunakan untuk menyimpan data secara permanen</p>	f	2024-11-11 16:27:00.723425	2024-11-14 00:32:01.703693	A
4bc96c6f-48ee-4816-a6bd-ea094a5c3dc0	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	<p>Memori fisik tambahan yang digunakan saat RAM penuh</p>	t	2024-11-11 16:27:00.724818	2024-11-14 00:32:01.703733	B
72e2bb70-10bc-4e2f-a909-df97927a5f56	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	<p>Memori yang hanya digunakan untuk aplikasi tertentu</p>	f	2024-11-11 16:27:00.725929	2024-11-14 00:32:01.703762	C
b00a3253-bb4b-4fd7-b64e-97939b042dfc	15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	<p>Memori yang dapat dipindahkan antar perangkat</p>	f	2024-11-11 16:27:00.727042	2024-11-14 00:32:01.704917	D
c82236dc-6636-48e5-939f-1cf39a77ffc0	456ccd3d-de1a-46a7-af7f-cd91aaee59a2	<p>CPU (Central Processing Unit)</p>	f	2024-11-14 04:10:56.005556	2024-11-14 04:10:56.005556	A
0b2f7b18-370a-422c-881d-c6596e4a1e18	456ccd3d-de1a-46a7-af7f-cd91aaee59a2	<p>RAM</p>	t	2024-11-14 04:10:56.006662	2024-11-14 04:10:56.006662	B
565fdec1-7b14-4b53-9e4d-313297a85100	456ccd3d-de1a-46a7-af7f-cd91aaee59a2	<p>Hard disk</p>	t	2024-11-14 04:10:56.007757	2024-11-14 04:10:56.007757	C
571502fa-37ea-4c3e-8ed7-1e3f76e67337	456ccd3d-de1a-46a7-af7f-cd91aaee59a2	<p>GPU (Graphics Processing Unit)</p>	f	2024-11-14 04:10:56.008862	2024-11-14 04:10:56.008862	D
50385ad9-62bb-4b0d-b52c-37ae316e227f	626331d5-d73c-4831-87f4-c133b356fd9b	<p>SSD</p>	t	2024-11-14 04:12:02.095317	2024-11-14 04:12:02.095317	A
b4b6a94c-7cbe-421e-a47b-a1eb1ddcfb94	626331d5-d73c-4831-87f4-c133b356fd9b	<p>RAM</p>	f	2024-11-14 04:12:02.096403	2024-11-14 04:12:02.096403	B
064959fc-2e2f-4142-9a44-af38be369c50	626331d5-d73c-4831-87f4-c133b356fd9b	<p>CPU</p>	f	2024-11-14 04:12:02.097512	2024-11-14 04:12:02.097512	C
ff73a146-f871-4f8b-b8ed-877b72c8ae3b	626331d5-d73c-4831-87f4-c133b356fd9b	<p>Hard disk</p>	t	2024-11-14 04:12:02.098632	2024-11-14 04:12:02.098632	D
09ca98b2-c826-4193-82bf-a0701ed07d67	042023ce-7072-4ba0-bf5e-1a4ac9aac9e0	<p>Menyimpan data sementara untuk aplikasi yang sedang dijalankan</p>	t	2024-11-14 04:12:58.922622	2024-11-14 04:12:58.922623	A
99a37d12-7847-4a85-bcd2-b22961926827	042023ce-7072-4ba0-bf5e-1a4ac9aac9e0	<p>Menyimpan data secara permanen untuk sistem operasi</p>	f	2024-11-14 04:12:58.922659	2024-11-14 04:12:58.922659	B
810d4abc-484d-454d-a2e2-e32ae916c4c2	042023ce-7072-4ba0-bf5e-1a4ac9aac9e0	<p>Mempercepat proses eksekusi aplikasi yang berjalan</p>	t	2024-11-14 04:12:58.92382	2024-11-14 04:12:58.92382	C
9495dc6d-be28-4a3e-badb-13eb09ed0452	042023ce-7072-4ba0-bf5e-1a4ac9aac9e0	<p>Menyimpan instruksi untuk program yang belum dijalankan</p>	f	2024-11-14 04:12:58.924942	2024-11-14 04:12:58.924942	D
c4321e4d-d193-44dd-8da7-2fbe5c667e4c	a1059bdc-6dac-4957-8624-416a10caa316	<p>ALU (Arithmetic Logic Unit)</p>	t	2024-11-14 04:28:24.497875	2024-11-14 04:28:24.497875	A
182300c0-442a-4a42-8b45-beddab58bae2	a1059bdc-6dac-4957-8624-416a10caa316	<p>CU (Control Unit)</p>	t	2024-11-14 04:28:24.497905	2024-11-14 04:28:24.497905	B
745a7ce0-77ac-4558-86e8-f3da5f111ea9	a1059bdc-6dac-4957-8624-416a10caa316	<p>RAM (Random Access Memory)</p>	f	2024-11-14 04:28:24.497934	2024-11-14 04:28:24.497934	C
82dd2a9a-3ba5-4972-9bb2-7101510a99f0	a1059bdc-6dac-4957-8624-416a10caa316	<p>Register</p>	t	2024-11-14 04:28:24.499108	2024-11-14 04:28:24.499108	D
551b38da-f8df-4301-a0d6-4e616b6cc869	a1059bdc-6dac-4957-8624-416a10caa316	<p>Hard Disk Drive (HDD)</p>	f	2024-11-14 04:28:24.500248	2024-11-14 04:28:24.500249	E
556a9941-0af5-4151-9120-b8bbb058cce1	fa13afba-51bb-4203-a2b7-3fafdf4f8ed1	<p>Monitor</p>	f	2024-11-14 04:29:33.778999	2024-11-14 04:29:33.778999	A
b3cd75c9-24b4-4927-acbc-126f5bcdfb8b	fa13afba-51bb-4203-a2b7-3fafdf4f8ed1	<p>Keyboard</p>	t	2024-11-14 04:29:33.779044	2024-11-14 04:29:33.779044	B
a00c4632-cd91-4791-a3d6-52df4556072d	fa13afba-51bb-4203-a2b7-3fafdf4f8ed1	<p>Mouse</p>	t	2024-11-14 04:29:33.779076	2024-11-14 04:29:33.779076	C
4c5358c7-c571-466a-9b60-959a06ec059b	fa13afba-51bb-4203-a2b7-3fafdf4f8ed1	<p>Printer</p>	f	2024-11-14 04:29:33.780246	2024-11-14 04:29:33.780246	D
7a6d6e44-8856-4eed-a1af-0c427221d744	fa13afba-51bb-4203-a2b7-3fafdf4f8ed1	<p>Scanner</p>	t	2024-11-14 04:29:33.781417	2024-11-14 04:29:33.781418	E
\.


--
-- Data for Name: jurusans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jurusans (id, kode, nama) FROM stdin;
3e41ce1d-af1b-4d2c-80e1-46f6dd261403	1945	UMUM
\.


--
-- Data for Name: matpels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matpels (id, kode_mapel, jurusan_id, agama_id, correctors, nama, created_at, updated_at) FROM stdin;
2bc0355e-3b18-472a-80b3-8d0133f8b904	MP-POq43	["3e41ce1d-af1b-4d2c-80e1-46f6dd261403"]	\N	["14a81f7d-1fc5-4cad-9d76-08177911a33e","3bdf7c0e-c22e-4643-869e-10dd8ea25b4d","d1d3d21b-df86-4b47-abfc-e2a9240aaab5"]	inf	2024-10-17 17:36:13	\N
\.


--
-- Data for Name: medias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medias (id, name, created_at, updated_at, is_directory, parent_id) FROM stdin;
00000000-0000-0000-0000-000000000001	directory-generic-gen	2023-11-11 22:29:43	\N	t	00000000-0000-0000-0000-000000000000
8d29ff68-ce9a-45ea-9187-2a745587e90e	directory-media-01JADRV58BNNYTQQKXKPN4CEYT	2024-10-17 17:36:40	\N	t	e251b1ee-f97b-44bd-899e-083c864f144c
e33c468a-edec-4dfc-b173-67113fa5c1ac	directory-media-01JADRV58BNNYTQQKXKPN4CEYT/01JADRW29QCV5500RB16H2CSP2.svg	2024-10-17 17:37:10	\N	f	8d29ff68-ce9a-45ea-9187-2a745587e90e
7884d185-385a-4dd8-9211-fe912aad7e4b	directory-media-01JADRV58BNNYTQQKXKPN4CEYT/01JADRW29RWB0PBEMA4ZN64RWT.png	2024-10-17 17:37:10	\N	f	8d29ff68-ce9a-45ea-9187-2a745587e90e
eac292e1-4433-4839-8f8a-797e028f5186	directory-media-01JADRV58BNNYTQQKXKPN4CEYT/01JADRZSTYG9WX1Q2FWKKWYCJY.svg	2024-10-17 17:39:12	\N	f	8d29ff68-ce9a-45ea-9187-2a745587e90e
864cc553-d0f3-46c7-af5c-30efa432fd7e	directory-media-01JADRV58BNNYTQQKXKPN4CEYT/01JADRZSV5CZ5BJGTYAHNFERDF.png	2024-10-17 17:39:12	\N	f	8d29ff68-ce9a-45ea-9187-2a745587e90e
907be2ec-590f-4ad3-8f48-30e25ff79b1a	directory-media-01JBXGSVB2PJB91E15NKE9369W	2024-11-05 06:39:41	\N	t	117800b5-7caa-45b7-987f-d2a50c994c62
479ebf18-e253-4e5d-91ca-b31d04125917	directory-media-01JBXGSVB2PJB91E15NKE9369W/01JBXHMCFXBPZ48SN8JKV6V65S.svg	2024-11-05 06:54:11	\N	f	907be2ec-590f-4ad3-8f48-30e25ff79b1a
977696ca-e673-40d7-a2d9-cbf190092622	directory-media-01JBXGSVB2PJB91E15NKE9369W/01JBXHMCFXBPZ48SN8JNACDEAG.png	2024-11-05 06:54:11	\N	f	907be2ec-590f-4ad3-8f48-30e25ff79b1a
7fe65197-3bbd-4445-bba6-0b94622d16ea	directory-media-01JCDVMW9M1QGRZ7HHF4HTRX7E	2024-11-11 14:57:04	\N	t	b132b631-3b5e-4087-b457-1dd4664daed4
3e335b55-534f-4617-849a-f5a5502df532	directory-media-01JCF2VE9P474TGT8F85WXQT63	2024-11-12 02:22:13	\N	t	f75d819f-4338-4444-b604-15b87d5eacee
939abdb6-d916-4f9f-9101-9e60c60bc463	directory-media-01JCFHHA09PVXTSK30A11QMD88	2024-11-12 06:38:50	\N	t	31d085d2-069f-41a2-b802-71ba97846911
f546a713-11a2-4035-bbd4-06158ac2e82a	directory-media-01JCFHHA09PVXTSK30A11QMD88/01JCFHK5RWREB03KVD927RXWGW.png	2024-11-12 06:39:51	\N	f	939abdb6-d916-4f9f-9101-9e60c60bc463
01b1f0ae-dc0d-433f-8c1d-6377458dea26	directory-media-01JCM0N4GJVXW2ENC7NBXD4GBH	2024-11-14 00:20:02	\N	t	480f995f-3488-49e2-8a0c-87fd4bdd4367
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (code, title, "order") FROM stdin;
0001A	Daftar master peserta	11000
0001B	Tambah master peserta	11001
0001C	Upload master peserta	11002
0001D	Edit master peserta	11003
0001E	Hapus master peserta	11004
0002A	Daftar master menu	12000
0003A	Daftar master role-menu	13000
0003B	Update master role-menu	13001
0004A	Daftar master group	14001
0005A	Daftar master matpel	15001
0006A	Daftar master jurusan	16001
0007A	Daftar master pengguna	17001
0008A	Daftar master agama	18001
0009A	Daftar kompetensi	19001
0010A	Daftar banksoal	20001
0011A	Daftar jadwal ujian	21001
0012A	Daftar token ujian	22001
0013A	Monitor peserta	23001
0014A	Ujian peserta	24001
0015A	Reset login peserta	25001
0016A	Koreksi jawaban peserta	26001
0017A	Daftar Hasil ujian	27001
0018A	Daftar summary banksoal	28001
0019A	Daftar ledger peserta	29001
0020A	Settings system	30001
0021A	Daftar event ujian	32001
0010B	Tambah banksoal	20002
0010C	Edit banksoal	20003
0010D	Hapus banksoal	20004
0001F	Upload photo peserta	11005
0004B	Tambah master group	14002
0004C	Hapus master group	14003
0004D	Edit master group	14004
0022A	Daftar anggota group	33001
0022B	Tambah anggota group	33002
0022C	Hapus anggota group	33003
0022D	Upload anggota group	33004
0005B	Tambah master matpel	15002
0005C	Update master matpel	15003
0005D	Hapus master matpel	15004
0005E	Upload master matpel	15005
0006B	Tambah master jurusan	16002
0006C	Hapus master jurusan	16003
0006D	Edit master jurusan	16004
0007B	Tambah master pengguna	17002
0007C	Hapus master pengguna	17003
0007D	Edit master pengguna	17004
0009B	Tambah kompetensi	19002
0009C	Hapus kompetensi	19003
0009D	Tambah item kompetensi	19004
0009E	Edit item kompetensi	19005
0009F	Hapus item kompetensi	19006
0010E	Daftar soal	20005
0010F	Duplikat banksoal	20006
0010G	Kunci banksoal	20007
0010H	Tambah soal	20008
0010I	Edit soal	20009
0010J	Hapus soal	20010
0021B	Tambah event ujian	32002
0021C	Edit event ujian	32003
0021D	Hapus event ujian	32004
0021F	Kartu peserta event ujian	32006
0021E	Daftar sesi peserta ujian	32005
0021G	Tambah sesi peserta ujian	32007
0021H	Hapus sesi peserta ujian	32008
0021I	Copy sesi peserta ujian	32009
0021J	Upload sesi peserta ujian	32010
0011B	Tambah jadwal ujian	21002
0011C	Edit jadwal ujian	21003
0011D	Hapus jadwal ujian	21004
0012B	Generate token ujian	22002
0014B	Reset ujian peserta	24002
0014C	Force finish ujian peserta	24003
0016B	Simpan koreksi jawaban peserta	26002
0016C	Daftar jawaban bisa dikoreksi	26003
0017B	Detail hasil ujian	27002
0018B	Detail summary banksoal	28002
0018C	Generate summary banksoal	28003
0010K	Import banksoal	20011
0021L	Upload event ujian ruangan	32012
0021K	Member event ujian ruangan	32011
0021M	Hapus member event ujian ruangan	32013
0001G	Aktifkan master peserta	11006
0001H	Nonaktifkan master peserta	11007
0010L	Tambah banksoal support	20012
0010M	Hapus banksoal support	20013
0023A	Backup master system	34001
0023B	Restore master system	34002
0024A	Verified device client	35001
0010N	Backup banksoal	20014
0010O	Restore banksoal	20015
0001I	Regenerate password master peserta	11008
0021N	Edit data ruangan	32014
0011E	Pause jadwal ujian	21005
0011F	Resume jadwal ujian	21006
0009G	Edit kompetensi	19007
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, created_at, updated_at) FROM stdin;
146	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	f9d7880473ee1bbb0ab68cd557ce8b1954b0db3fc2e0d067e8711b86a8f1e427	\N	\N
147	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	2fd72ce3469cc312fbe8136bce76808a8a62fdeb9a8a4affc1c3c978a624c234	\N	\N
151	User	14a81f7d-1fc5-4cad-9d76-08177911a33e	Personal Access Token	d5b7ca1ee6153c8d6733bbd1d4e677ec178b79461d7f93dbdefa37a5ffe96388	\N	\N
152	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	7a8319d185de76d995d9d5d73888a022951c412c66a9b79ea1d522707821ff5c	\N	\N
153	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	e2eb18baa72a04db687baa9dd60a584fb8bc88439c86d2c390a99b40cf8c786d	\N	\N
154	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	3c27a08783e01e065a7dd4b0235d6e48f7458c5a0eef27a29ece4ea9d4c2587f	\N	\N
157	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	83a1e6f2dda821346f1bf6ab1aa99e3b2121884e8329f474a9c8d356de7e231d	\N	\N
158	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	a86688a1be4532624f67e197076cad5558690f5fe6eb9a665bfb871f9f3d19c6	\N	\N
159	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	758a36986f258fa5be966b4f06591254b9e84536afa13b0b9a62a731904ee7f1	\N	\N
160	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	8a552b5c3644930502b4d48a4628d72ad73067c0823b3439aba117d4aaafa54e	\N	\N
161	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	d62ef266796fe14190245ea0a73d19d1cdebbf374da6c9a95d36108b8c6e863a	\N	\N
162	User	d1d3d21b-df86-4b47-abfc-e2a9240aaab5	Personal Access Token	e597bee0e73cd405fd7efdec6aed310af419fd896f5b109b490f45d1b3b77cee	\N	\N
163	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	08b004f5ee6ac1fc6f724192a414ef8f3ae2931791bb4d3a9cc4221ee17ebe97	\N	\N
164	User	3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Personal Access Token	beccdc18bcc11cda3bb4690afa4baa257459dc25a8a5e934e4efc9f0b3ff7679	\N	\N
\.


--
-- Data for Name: pesertas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pesertas (id, sesi, no_ujian, agama_id, jurusan_id, nama, password, api_token, status, block_reason, antiblock, created_at, updated_at, ava, blocked_at) FROM stdin;
586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1	201080221	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080221	201080221	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
e82e107a-8882-4074-8841-c557daf4126f	1	201080220	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080220	201080220	acc0c10ddab83cb47d2f00e1229a840edf934af3872e80f726aa6b1f4dd750c4	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
7873e474-1a77-49c3-9fbb-bf6207e94acf	1	201080217	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080217	201080217	ba10034b5be1e4a8db5e33bc63c44f3687adbc4f28e186c38eb431e4dc3f09d9	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
2c2f921f-e0f2-4215-b03d-901d25004a2e	1	201080218	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080218	201080218	69dd5a92d1539c653510328f81f7e43dc4488a69eddbf806b0674052790077ba	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
cf9a399b-4b3f-46dd-81b0-75d7542232a4	1	201080211	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080211	201080211	72cf8ed7e9ebd7b0d8b5ac588c46b084e6fbac1d77fe2cd1fc32eb5e5879a663	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:33:55
bea68c4e-349b-4222-9f66-e47b5eac2280	1	201080214	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080214	201080214	0ecfee21e5ba83d6d4ad3cf779e1f2804c2fcc21c3476531e551accc9a35f7e4	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:30:22
e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1	201080219	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080219	201080219	b071a646f72cf3da9f174ed019d9d12ee651b4f18c9e94bcb21bad04f7383adb	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
0ddde262-6708-469c-b288-84f5d8bb37e9	1	201080228	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080228	201080228	28bc0f96991dc35fa22728d250dac13fbc64e190029a0b76d92aaae19e46c1a7	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:23:44
fc3c9dfd-8827-41df-8366-ed852f8a23ec	1	201080205	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080205	201080205	78443a85a39bb7281bc65a72cc87a5b3355aab6a62442729b9c636c3bb4c55ec	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:32:43
f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1	201080201	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080201	201080201	\N	0	Tidak fokus pada ujian	f	2024-11-11 16:43:19	\N	\N	2024-11-14 06:34:06
31252c94-4f88-41f2-98fd-4a2eb68b6b72	1	201080222	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080222	201080222	3e344ded6b72b22508cf0974b1dac1c36bebe5857c4a47a48c0def1b5672179b	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:23:31
50b66260-ef17-434e-bef9-50cd5919bebc	1	201080210	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080210	201080210	c6663d1a64d25b99c969ecc7ba7224a335560b2f0b33453ed2b92bb872ab4706	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
d477ae54-7cef-4b92-b470-9023940721a1	1	201080224	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080224	201080224	09ab6767a6c20e78d7a892d76ce9ceb27fa592220b42de87ffa8ad2bfcef5e01	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:19:18
da0698b5-abc3-4c23-acb2-c80beea05535	1	201080207	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080207	201080207	a10f9d5946ccd777844351e60f67bd2815c8b7fa36f188de267029092919ffaa	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:18:52
2177d90f-b339-434f-9c0e-137be0bb8234	1	201080209	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080209	201080209	cf8be89e9f4dee73fa5bf92f74364f5ae974fda5de238ce564501cfc4698bcc2	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:18:51
5c552624-423b-4197-8fc8-1bacb9aaf07b	1	201080208	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080208	201080208	5956dbefc48192210698ac652ffb5891dd8d4c7d2225a668ddc65b19d272cb25	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:47:47
2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	1	201080204	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080204	201080204	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-12 06:54:57
7afc682c-1791-4a53-8998-51e2e47e301b	1	201080216	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080216	201080216	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
d4ae57d8-473c-4dcb-92c8-62fb561de79d	1	201080202	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080202	201080202	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:24:34
5ba024ed-363a-44cf-97f2-251aed7cf4e4	1	201080200	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080200	201080200	f9414c3f93cb81ee65ad3fff6e61ef5e417b816c6c217594128c23258413e11d	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-12 06:30:20
ebe47e76-37d7-43f1-9baf-da841d058eb9	1	201080226	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080226	201080226	be550266c6fbcf9afb38c0f168f543eb88e4dc99e1c58cbfb2e982ccbd6f48cd	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
3226b4e1-581d-49b9-90b9-83882d82f515	1	201080212	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080212	201080212	bc1a5611ef05064d0b1d313c416374820e3d7c5f95d352bd8ddd86a72e70df8e	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:33:18
a8640110-77e5-42f9-9635-756d060428ff	1	201080203	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080203	201080203	80111dd1233491ed8049395cfceaf5a2386fafd3581d5bec8d3191b19b8f3e3e	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:47:07
47d001cf-6178-46d4-b7a6-b5e436f9365b	1	201080223	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080223	201080223	ba9697b9a4d6c0d60a1fdfcbd33548b070169ab081e51d859f48502ca151991e	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
03458648-9b8a-4083-b4a6-56dd78eb5e80	1	201080206	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080206	201080206	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:40:56
e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1	201080227	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080227	201080227	24d871b3c65b32f1bebadbe1f3b4f808ae1e076408478460d819b12bd30b36a2	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
866347c4-acb1-4edc-8222-7ab2c3b343c7	1	201080215	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080215	201080215	b80bc0e05fd7b36fbda24937080a1fe879b653b176b17fd2b774a67a8fe87e8e	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:50:02
53df9679-d8eb-41da-9874-c33fbc158c77	1	201080225	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080225	201080225	d2dce997409b6d5a6120526764bb4ab1093a237ed4f2ab1b2692a05c6b797611	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:58:09
ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1	201080213	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080213	201080213	c816715433a895155769612777aa4443ec599391a7a30abbf8eb5a9d0b6e0489	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
df82f9f0-dce9-458a-818a-c2c77ae92c5d	1	201080233	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080233	201080233	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
aedc47b0-eb65-4174-9835-e3d770738c80	1	201080230	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080230	201080230	4ca7f11e2c21e8c517770b646d68b7640a2a3a800e2075e48b82591878640b1e	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
035280f9-e68c-4199-99f7-c192f34fa0b7	1	201080231	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080231	201080231	56b9ec45bc0a623db5997ed72325058da3f879990d6885e2655925f95f7fd5d8	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
3fc864d9-36af-4c93-ba8c-d5d5e73df285	1	201080229	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080229	201080229	ea7b79be520dce4fddb83a4e604cff7d2e8ceadc25f6c9f435aa47ed68014ec3	1	\N	f	2024-11-11 16:43:19	\N	\N	2024-11-14 01:28:51
4df4b6ec-4672-46fe-882e-15a55bbcca9f	1	201080232	3aed771a-9458-4cce-9811-8b0b50bfe462	3e41ce1d-af1b-4d2c-80e1-46f6dd261403	201080232	201080232	\N	1	\N	f	2024-11-11 16:43:19	\N	\N	\N
\.


--
-- Data for Name: role_menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_menus (role_code, menu_code) FROM stdin;
EVAL	0001A
EVAL	0005A
EVAL	0008A
EVAL	0006A
EVAL	0009A
EVAL	0009B
EVAL	0009C
EVAL	0009D
EVAL	0009E
EVAL	0009F
EVAL	0010A
EVAL	0010B
EVAL	0010C
EVAL	0010D
EVAL	0010E
EVAL	0010F
EVAL	0010G
EVAL	0010H
EVAL	0010I
EVAL	0010J
EVAL	0010K
EVAL	0010L
EVAL	0010M
EVAL	0016C
EVAL	0017A
EVAL	0017B
EVAL	0018A
EVAL	0019A
EVIL	0003B
EVIL	0001A
EVIL	0001B
EVIL	0001C
EVIL	0001D
EVIL	0001E
EVIL	0004A
EVIL	0005A
EVIL	0006A
EVIL	0007A
EVIL	0008A
EVIL	0009A
EVIL	0010A
EVIL	0011A
EVIL	0012A
EVIL	0013A
EVIL	0014A
EVIL	0016A
EVIL	0015A
EVIL	0017A
EVIL	0018A
EVIL	0019A
EVIL	0020A
EVIL	0021A
EVIL	0004B
EVIL	0004C
EVIL	0004D
EVIL	0022A
EVIL	0022B
EVIL	0022C
EVIL	0022D
EVIL	0005B
EVIL	0005C
EVIL	0005D
EVIL	0005E
EVIL	0006B
EVIL	0006C
EVIL	0006D
EVIL	0007B
EVIL	0007C
EVIL	0007D
EVIL	0009C
EVIL	0009B
EVIL	0009D
EVIL	0009E
EVIL	0009F
EVIL	0010B
EVIL	0010C
EVIL	0010D
EVIL	0001F
EVIL	0010E
EVIL	0010F
EVIL	0010G
EVIL	0010H
EVIL	0010I
EVIL	0010J
EVIL	0021B
EVIL	0021C
EVIL	0021D
EVIL	0021E
EVIL	0021F
EVIL	0021G
EVIL	0021H
EVIL	0021I
EVIL	0021J
EVIL	0011B
EVIL	0011C
EVIL	0011D
EVIL	0012B
EVIL	0014B
EVIL	0014C
EVIL	0017B
EVIL	0016C
EVIL	0016B
EVIL	0018B
EVIL	0018C
EVIL	0010K
EVIL	0021L
EVIL	0021K
EVIL	0021M
EVIL	0001H
EVIL	0001G
EVIL	0002A
EVIL	0010L
EVIL	0010M
EVIL	0003A
EVIL	0023A
EVIL	0023B
OPRA	0001A
OPRA	0001G
OPRA	0001H
OPRA	0004A
OPRA	0005A
OPRA	0006A
OPRA	0007A
OPRA	0011A
OPRA	0011B
OPRA	0011C
OPRA	0011D
OPRA	0012A
OPRA	0012B
OPRA	0013A
OPRA	0014A
OPRA	0014B
OPRA	0014C
OPRA	0015A
OPRA	0017A
OPRA	0017B
OPRA	0018A
OPRA	0018B
OPRA	0021A
OPRA	0021B
OPRA	0021C
OPRA	0021D
OPRA	0021E
OPRA	0021F
OPRA	0021G
OPRA	0021H
OPRA	0021I
OPRA	0021J
OPRA	0021K
OPRA	0021L
OPRA	0021M
OPRA	0022A
OPRA	0022B
OPRA	0022C
OPRA	0022D
EVAL	0011A
EVAL	0011B
EVAL	0011C
EVAL	0011D
EVIL	0024A
EVIL	0010N
EVIL	0010O
EVIL	0001I
EVIL	0021N
EVIL	0011E
EVIL	0011F
EVIL	0009G
EVAL	0001A
EVAL	0005A
EVAL	0008A
EVAL	0006A
EVAL	0009A
EVAL	0009B
EVAL	0009C
EVAL	0009D
EVAL	0009E
EVAL	0009F
EVAL	0010A
EVAL	0010B
EVAL	0010C
EVAL	0010D
EVAL	0010E
EVAL	0010F
EVAL	0010G
EVAL	0010H
EVAL	0010I
EVAL	0010J
EVAL	0010K
EVAL	0010L
EVAL	0010M
EVAL	0016C
EVAL	0017A
EVAL	0017B
EVAL	0018A
EVAL	0019A
EVIL	0003B
EVIL	0001A
EVIL	0001B
EVIL	0001C
EVIL	0001D
EVIL	0001E
EVIL	0004A
EVIL	0005A
EVIL	0006A
EVIL	0007A
EVIL	0008A
EVIL	0009A
EVIL	0010A
EVIL	0011A
EVIL	0012A
EVIL	0013A
EVIL	0014A
EVIL	0016A
EVIL	0015A
EVIL	0017A
EVIL	0018A
EVIL	0019A
EVIL	0020A
EVIL	0021A
EVIL	0004B
EVIL	0004C
EVIL	0004D
EVIL	0022A
EVIL	0022B
EVIL	0022C
EVIL	0022D
EVIL	0005B
EVIL	0005C
EVIL	0005D
EVIL	0005E
EVIL	0006B
EVIL	0006C
EVIL	0006D
EVIL	0007B
EVIL	0007C
EVIL	0007D
EVIL	0009C
EVIL	0009B
EVIL	0009D
EVIL	0009E
EVIL	0009F
EVIL	0010B
EVIL	0010C
EVIL	0010D
EVIL	0001F
EVIL	0010E
EVIL	0010F
EVIL	0010G
EVIL	0010H
EVIL	0010I
EVIL	0010J
EVIL	0021B
EVIL	0021C
EVIL	0021D
EVIL	0021E
EVIL	0021F
EVIL	0021G
EVIL	0021H
EVIL	0021I
EVIL	0021J
EVIL	0011B
EVIL	0011C
EVIL	0011D
EVIL	0012B
EVIL	0014B
EVIL	0014C
EVIL	0017B
EVIL	0016C
EVIL	0016B
EVIL	0018B
EVIL	0018C
EVIL	0010K
EVIL	0021L
EVIL	0021K
EVIL	0021M
EVIL	0001H
EVIL	0001G
EVIL	0002A
EVIL	0010L
EVIL	0010M
EVIL	0003A
EVIL	0023A
EVIL	0023B
OPRA	0001A
OPRA	0001G
OPRA	0001H
OPRA	0004A
OPRA	0005A
OPRA	0006A
OPRA	0007A
OPRA	0011A
OPRA	0011B
OPRA	0011C
OPRA	0011D
OPRA	0012A
OPRA	0012B
OPRA	0013A
OPRA	0014A
OPRA	0014B
OPRA	0014C
OPRA	0015A
OPRA	0017A
OPRA	0017B
OPRA	0018A
OPRA	0018B
OPRA	0021A
OPRA	0021B
OPRA	0021C
OPRA	0021D
OPRA	0021E
OPRA	0021F
OPRA	0021G
OPRA	0021H
OPRA	0021I
OPRA	0021J
OPRA	0021K
OPRA	0021L
OPRA	0021M
OPRA	0022A
OPRA	0022B
OPRA	0022C
OPRA	0022D
EVAL	0011A
EVAL	0011B
EVAL	0011C
EVAL	0011D
EVIL	0024A
EVIL	0010N
EVIL	0010O
EVIL	0001I
EVIL	0021N
EVIL	0011E
EVIL	0011F
EVIL	0009G
\.


--
-- Data for Name: room_members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.room_members (id, room_id, event_id, student_id, created_at) FROM stdin;
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, code, name) FROM stdin;
\.


--
-- Data for Name: sesi_schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sesi_schedules (id, jadwal_id, sesi, student_id, created_at, updated_at) FROM stdin;
1b8c25da-e52f-4f54-a199-fc244c5ac526	af22cc65-1195-4382-9655-9762fef82e6f	1	5ba024ed-363a-44cf-97f2-251aed7cf4e4	2024-11-14 09:45:33	\N
4dea5b9d-c15d-4b50-af36-bd92825948c4	256d33f7-2293-41b1-aa82-c301a75af8d1	1	5ba024ed-363a-44cf-97f2-251aed7cf4e4	2024-11-14 09:51:42	\N
a04ecf92-e805-4b82-b1a9-822e4510b139	256d33f7-2293-41b1-aa82-c301a75af8d1	1	d4ae57d8-473c-4dcb-92c8-62fb561de79d	2024-11-14 09:53:23	\N
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (code, value) FROM stdin;
TRANSITION_TIME	60
INSTANT_KOP_1712LGX	
INSTANT_NAME	SMP HANGTUAH 5 CANDI
INSTANT_CITY	KAB. SIDOARJO
INSTANT_ADDRESS	Perum Jalagriya B16 / 18
INSTANT_LOGO_1712LGX	exo-setting/c68b2593-0378-4dcb-a606-633cb2342e8a.png
TOKEN_EXPIRED	900
SECRET_EXO_BROWSER	74ccf0ac8c409292aed6
BROWSER_ALLOW_TYPE	[{"code":"","value":""}]
BROWSER_AGENT	
LOGIN_ONCE_ATIME	N
SECRET_EXO_LOGOUT	1922
SECRET_EXO_LOGOUT_ACTIVE	00
VERIFIED_DEVICE	N
MAX_COUNTER_OUT	1
EXAM_THEME	2
EXAM_TEXT_WELCOME_PARSEDXX88	
EXAM_TEXT_FINISH_PARSEDXX88	
\.


--
-- Data for Name: siswa_ujians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.siswa_ujians (id, peserta_id, jadwal_id, mulai_ujian, mulai_ujian_shadow, selesai_ujian, sisa_waktu, status_ujian, out_ujian_counter, created_at, updated_at, banksoal_id, token, last_part, transition_state, transition_start) FROM stdin;
42a9c948-b3a3-4dda-a942-b6e181556fcf	2c2f921f-e0f2-4215-b03d-901d25004a2e	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:52	2024-11-12 10:19:52	2024-11-12 11:19:53	0	3	0	2024-11-12 03:17:58	2024-11-12 04:19:54	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
efc7de8c-2df7-46d5-bffd-b7f11a66f964	c3bb53e1-cf20-4805-8955-192936c9288a	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	2024-11-05 13:13:46	2024-11-05 13:13:46	2024-11-05 13:14:21	3565	3	0	2024-11-05 06:13:42	2024-11-05 06:14:22	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
ff20660b-6ee2-4ce4-97b8-91f20666dffb	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:58	2024-11-12 10:19:58	2024-11-12 11:19:59	0	3	0	2024-11-12 03:19:28	2024-11-12 04:19:59	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
dc08e949-1c0a-4e6b-bf40-e24c2f4909d3	2c723a82-3328-474b-879f-43ee4e148203	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 00:44:56	2024-10-18 00:44:56	\N	3580	1	0	2024-10-17 17:44:55	2024-10-17 17:45:17	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
0f3dde17-dcb7-44aa-850f-c8e6c1242fa9	3fc864d9-36af-4c93-ba8c-d5d5e73df285	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:40	2024-11-12 10:19:40	2024-11-12 11:19:41	0	3	0	2024-11-12 03:19:00	2024-11-12 04:19:42	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
3584ff09-6b56-453f-9bb1-7ae107314c93	f2141663-5f93-4d1d-9c81-9d7c08472306	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 01:02:25	2024-10-18 01:02:25	\N	3599	1	0	2024-10-17 18:02:24	2024-10-17 18:02:26	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
959638fb-aaf8-493d-826e-3268b9f35686	7afc682c-1791-4a53-8998-51e2e47e301b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:20:39	2024-11-12 10:20:39	2024-11-12 11:20:41	0	3	0	2024-11-12 03:19:39	2024-11-12 04:20:42	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
e596834c-ea4c-4aea-b4cf-b59ed49d77be	92ba9bea-0ae2-4d95-9a4f-10e1838ab57f	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 01:03:08	2024-10-18 01:03:08	\N	3483	1	0	2024-10-17 18:03:07	2024-10-17 18:05:05	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
6e970d93-835a-47a2-82a6-e41b23897521	d477ae54-7cef-4b92-b470-9023940721a1	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:20:45	2024-11-12 10:20:45	2024-11-12 11:20:46	0	3	0	2024-11-12 03:19:04	2024-11-12 04:20:46	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
f6fff20a-bb56-449e-a7ac-50209629b498	0b4a1483-fddb-4c37-ad3d-b71989047f96	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 01:06:40	2024-10-18 01:06:40	\N	3600	1	0	2024-10-17 18:06:40	2024-10-17 18:06:41	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
cf2816f4-4d30-4d70-91ec-84fef03e17ea	866347c4-acb1-4edc-8222-7ab2c3b343c7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:22	2024-11-12 10:19:22	2024-11-12 11:19:23	0	3	0	2024-11-12 03:18:50	2024-11-12 04:19:24	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
bf277438-7a17-4b32-b9e7-78ca4aa5534e	e68ece78-155b-4afe-8570-88363d8fc7a8	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 01:16:49	2024-10-18 01:16:49	\N	3600	1	0	2024-10-17 18:16:49	2024-10-17 18:16:50	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
e4ca0855-ec02-48dd-9b5f-b37a7b7f8976	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:31	2024-11-12 10:19:31	2024-11-12 11:19:32	0	3	0	2024-11-12 03:18:14	2024-11-12 04:19:32	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
c4b95cbe-c650-479c-b641-2ed97ca845d1	18235ecf-b076-493b-8124-7d631f6fd469	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 01:17:54	2024-10-18 01:17:54	\N	3600	1	0	2024-10-17 18:17:53	2024-10-17 18:17:54	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
b678e60e-c64d-426f-91e3-ce87628bd649	9e2b4b1b-0bb6-40fd-9ffa-fe5a1c988ed3	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 02:59:28	2024-10-18 02:59:28	\N	0	0	0	2024-10-17 19:59:29	2024-10-17 19:59:29	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
60d6cae5-ae68-45d0-bca8-2f779df46cbb	a1c41b10-1427-4ec6-ace9-d65eb1b4a6a2	0e698dbb-00c8-4eb7-ba6c-95e75592e9ac	2024-10-18 07:22:03	2024-10-18 07:22:03	\N	3600	1	0	2024-10-18 00:22:02	2024-10-18 00:22:04	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
fa5ceec1-05ec-46b0-b315-7910726aab60	da0698b5-abc3-4c23-acb2-c80beea05535	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:19	2024-11-12 10:19:19	2024-11-12 11:19:21	0	3	0	2024-11-12 03:19:17	2024-11-12 04:19:21	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
7947636c-d5f3-40a9-92ad-0a839713a792	035280f9-e68c-4199-99f7-c192f34fa0b7	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:43	2024-11-12 10:18:43	2024-11-12 11:18:44	0	3	0	2024-11-12 03:18:42	2024-11-12 04:18:45	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
5740ec96-26f2-4711-896c-ca0061c03136	31252c94-4f88-41f2-98fd-4a2eb68b6b72	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:25	2024-11-12 10:19:25	2024-11-12 11:19:26	0	3	0	2024-11-12 03:19:11	2024-11-12 04:19:26	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
32269784-67c2-427c-9047-550d99fa0b7e	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:22	2024-11-12 10:19:22	2024-11-12 11:19:23	0	3	0	2024-11-12 03:18:34	2024-11-12 04:19:23	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
f4dac701-1345-44ba-b749-a232722e5445	53df9679-d8eb-41da-9874-c33fbc158c77	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:44	2024-11-12 10:18:44	2024-11-12 11:18:45	0	3	0	2024-11-12 03:18:42	2024-11-12 04:18:46	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
99f07ae0-f24c-4d9d-82ab-bdfdfb97fcf5	4df4b6ec-4672-46fe-882e-15a55bbcca9f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:47	2024-11-12 10:19:47	\N	1314	1	0	2024-11-12 03:19:44	2024-11-12 03:57:54	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
42d3b77d-cd0c-463c-b446-28ebe2a7e003	a8640110-77e5-42f9-9635-756d060428ff	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:49	2024-11-12 10:18:49	2024-11-12 11:18:50	0	3	0	2024-11-12 03:18:02	2024-11-12 04:18:51	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
6f73821e-6d8b-4a0d-a8ce-55f6dc9432c6	5c552624-423b-4197-8fc8-1bacb9aaf07b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:14	2024-11-12 10:19:14	2024-11-12 11:19:15	0	3	0	2024-11-12 03:19:12	2024-11-12 04:19:15	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
9f6190ce-ed46-47eb-9c05-2c110bc5d377	0214d244-6acb-4538-b89b-d0a5f57b7e50	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	2024-11-05 13:31:26	2024-11-05 13:31:26	\N	3600	1	0	2024-11-05 06:31:24	2024-11-05 06:31:27	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
2a01b055-62b5-4a45-a107-28f0adda83fd	40b50e63-df73-4c34-b495-cc60242b4565	f6a9f4ae-374e-46fd-8d05-162cbec0d346	2024-11-04 08:48:20	2024-11-04 08:48:20	\N	3517	1	0	2024-11-04 01:48:19	2024-11-04 01:49:43	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
f30265a1-1d61-4ffe-8d83-e2d8d195d147	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:28	2024-11-12 10:18:28	2024-11-12 11:18:30	0	3	0	2024-11-12 03:18:27	2024-11-12 04:18:30	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
bac5f0d1-c83e-424e-a907-749885a57ca3	e82e107a-8882-4074-8841-c557daf4126f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:50	2024-11-12 10:18:50	2024-11-12 11:18:51	0	3	0	2024-11-12 03:18:49	2024-11-12 04:18:52	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
d72e874e-55c7-4a85-86c9-72b2844b70c9	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:44	2024-11-12 10:18:44	2024-11-12 11:18:45	0	3	0	2024-11-12 03:18:43	2024-11-12 04:18:45	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
a3313074-e708-4989-a75f-84389d9449b4	e20667ad-862e-462c-9b95-08dd63d674cd	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	2024-11-05 13:32:14	2024-11-05 13:32:14	\N	3599	1	0	2024-11-05 06:32:14	2024-11-05 06:32:15	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
341eb08b-eaf8-4fd9-90d0-f41d64f790ba	03458648-9b8a-4083-b4a6-56dd78eb5e80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:31	2024-11-12 10:19:31	2024-11-12 11:19:32	0	3	0	2024-11-12 03:18:49	2024-11-12 04:19:32	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
7e56bc48-4be8-4fb0-a992-d1d60e69d240	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	5ab9a117-1bae-4f08-94c7-cbbb0f1914f4	2024-11-05 13:58:18	2024-11-05 13:58:18	\N	3600	1	0	2024-11-05 06:58:16	2024-11-05 06:58:18	e251b1ee-f97b-44bd-899e-083c864f144c	\N	1	f	0
f96df8b3-a7b9-45b2-a9b4-b735269fb958	ebe47e76-37d7-43f1-9baf-da841d058eb9	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:31	2024-11-12 10:19:31	2024-11-12 11:19:32	0	3	0	2024-11-12 03:19:29	2024-11-12 04:19:33	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
80cfa6b2-d497-41d8-9afa-4d11c0dd6e4d	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	a4a252e4-a129-46d9-b4c9-3c03a184463d	2024-11-05 14:01:45	2024-11-05 14:01:45	\N	3600	1	0	2024-11-05 07:01:44	2024-11-05 07:01:46	117800b5-7caa-45b7-987f-d2a50c994c62	\N	1	f	0
64425604-1383-478a-af2b-792b37e7673c	47d001cf-6178-46d4-b7a6-b5e436f9365b	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:40	2024-11-12 10:19:40	2024-11-12 11:19:41	0	3	0	2024-11-12 03:19:32	2024-11-12 04:19:41	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
e586e266-d88c-4c2a-b9e1-685794cde43a	b8b312c5-0ab7-4bc7-bdb5-6b1668f4483d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-11 23:23:44	2024-11-11 23:23:44	\N	3260	1	0	2024-11-11 16:23:42	2024-11-11 16:29:24	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
9b96fb0f-8297-4790-b3c4-01749efcc719	40b50e63-df73-4c34-b495-cc60242b4565	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-11 23:30:01	2024-11-11 23:30:01	2024-11-11 23:30:52	3549	3	0	2024-11-11 16:30:01	2024-11-11 16:30:52	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
5b19d868-9bbe-4565-b739-7451f5c0afb4	5ba024ed-363a-44cf-97f2-251aed7cf4e4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 09:35:27	2024-11-12 09:35:27	\N	3599	1	0	2024-11-12 02:35:25	2024-11-12 02:35:28	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
eae9fe9c-eb3c-4caa-a4a9-39e21cb04c19	50b66260-ef17-434e-bef9-50cd5919bebc	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:51	2024-11-12 10:19:51	\N	3553	1	0	2024-11-12 03:19:49	2024-11-12 03:20:38	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
1c3284e9-611e-40da-853f-a00b8573d998	cf9a399b-4b3f-46dd-81b0-75d7542232a4	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:18:50	2024-11-12 10:18:50	2024-11-12 11:18:51	0	3	0	2024-11-12 03:17:59	2024-11-12 04:18:51	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
5910f238-5e2d-43ea-94cd-765efd2a29c2	bea68c4e-349b-4222-9f66-e47b5eac2280	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:19:51	2024-11-12 10:19:51	2024-11-12 11:19:53	0	3	0	2024-11-12 03:18:47	2024-11-12 04:19:53	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
99b5b5fb-6083-44bf-995f-9176677f7ad1	aedc47b0-eb65-4174-9835-e3d770738c80	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:20:29	2024-11-12 10:20:29	2024-11-12 11:20:30	0	3	0	2024-11-12 03:20:26	2024-11-12 04:20:31	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
8f1ebcfb-efd4-4df2-8644-bf5a1764b517	fc3c9dfd-8827-41df-8366-ed852f8a23ec	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:22:36	2024-11-12 10:22:36	2024-11-12 11:22:37	0	3	0	2024-11-12 03:22:35	2024-11-12 04:22:37	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
feb4cb87-964e-4b21-84fc-73cb1b0c2d05	df82f9f0-dce9-458a-818a-c2c77ae92c5d	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 11:29:29	2024-11-12 11:29:29	\N	3444	1	0	2024-11-12 04:29:28	2024-11-12 04:32:05	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
5e8f8c11-e597-43dd-8938-93c8c05590f3	2177d90f-b339-434f-9c0e-137be0bb8234	31f5b4a8-29af-4a6b-9641-d39437ebd0a4	2024-11-12 10:45:02	2024-11-12 10:45:02	\N	688	1	0	2024-11-12 03:45:00	2024-11-12 04:33:34	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
478609d3-3c7b-4702-ae6e-3f3d9e760218	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	677caec4-2985-4ae8-8cef-20a725be62d5	2024-11-12 13:25:24	2024-11-12 13:25:24	\N	3600	1	0	2024-11-12 06:25:20	2024-11-12 06:25:25	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
267e5194-4a62-4d66-b8d9-ec1756e31e23	5ba024ed-363a-44cf-97f2-251aed7cf4e4	677caec4-2985-4ae8-8cef-20a725be62d5	2024-11-12 12:58:38	2024-11-12 12:58:38	\N	1709	1	0	2024-11-12 05:58:37	2024-11-12 06:30:10	b132b631-3b5e-4087-b457-1dd4664daed4	\N	1	f	0
3e7553fe-2417-4995-b300-f5c77e98221b	a8640110-77e5-42f9-9635-756d060428ff	d33080b0-c84f-4e74-b458-74bcc4fa14da	2024-11-12 13:40:40	2024-11-12 13:40:40	2024-11-12 13:45:14	3326	3	0	2024-11-12 06:40:39	2024-11-12 06:45:14	31d085d2-069f-41a2-b802-71ba97846911	\N	1	f	0
246069e7-f4e9-4899-8ef6-cef2a3e42cbf	2bc735c4-f5e2-44c0-b9f2-a8dde34b4c4b	d33080b0-c84f-4e74-b458-74bcc4fa14da	2024-11-12 13:54:50	2024-11-12 13:54:50	\N	3600	1	0	2024-11-12 06:54:48	2024-11-12 06:54:51	31d085d2-069f-41a2-b802-71ba97846911	\N	1	f	0
80507f7c-b743-401f-834d-38a9a9586d02	fc3c9dfd-8827-41df-8366-ed852f8a23ec	d33080b0-c84f-4e74-b458-74bcc4fa14da	2024-11-12 13:56:59	2024-11-12 13:56:59	\N	3599	1	0	2024-11-12 06:56:58	2024-11-12 06:57:00	31d085d2-069f-41a2-b802-71ba97846911	\N	1	f	0
462f242a-8070-4c52-9aee-3498b1babaab	d477ae54-7cef-4b92-b470-9023940721a1	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:40	2024-11-14 08:17:40	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:38	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
2239783a-709d-4c68-aefc-c535fd064c28	5ba024ed-363a-44cf-97f2-251aed7cf4e4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:39	2024-11-14 08:17:39	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:07	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
f59213f7-a9c4-4318-b91a-94a1542eccaf	47d001cf-6178-46d4-b7a6-b5e436f9365b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:39	2024-11-14 08:17:39	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:29	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
d0f69b56-3f2a-4bd9-b08f-aba3c9e244e6	50b66260-ef17-434e-bef9-50cd5919bebc	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:34	2024-11-14 08:17:34	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:12	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
128bfb21-de75-4ca2-83e1-c309dc0e3c48	da0698b5-abc3-4c23-acb2-c80beea05535	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:47	2024-11-14 08:17:47	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:08	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
9fb923ff-f75b-42ea-ada8-06ad4d924238	3226b4e1-581d-49b9-90b9-83882d82f515	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:35	2024-11-14 08:17:35	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:17	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
4b891891-329b-419e-8bbc-a5d6be8daaa9	e82e107a-8882-4074-8841-c557daf4126f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:50	2024-11-14 08:17:50	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:14	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
244d48ad-9aea-4ccc-902c-c53284151703	bea68c4e-349b-4222-9f66-e47b5eac2280	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:52	2024-11-14 08:17:52	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:04	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
3e4d1bf5-6d84-493c-89e5-907bcd25d2eb	866347c4-acb1-4edc-8222-7ab2c3b343c7	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:23:13	2024-11-14 08:23:13	2024-11-14 13:29:10	0	3	0	2024-11-14 01:23:12	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
84e5432c-f73a-4ede-9f66-4e3154ba5d25	2c2f921f-e0f2-4215-b03d-901d25004a2e	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:35	2024-11-14 08:17:35	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:20	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
6dddd8b6-c2e1-4767-9573-9006dc3a46bb	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:22	2024-11-14 08:17:22	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:15	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
2bea2498-2198-435a-9fec-80821b48be68	aedc47b0-eb65-4174-9835-e3d770738c80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:18:22	2024-11-14 08:18:22	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:16	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
0e42bd29-cef2-4702-b854-18141ac0fd7f	586cd3ac-21b2-45bf-9ac5-2f15f4c795b8	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:35	2024-11-14 08:17:35	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:05	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
3a772e00-be55-4fd4-bf03-e4e307a53542	0ddde262-6708-469c-b288-84f5d8bb37e9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:19:30	2024-11-14 08:19:30	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:14	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
c2a21811-7c42-48ff-bb87-c8686df194fe	3fc864d9-36af-4c93-ba8c-d5d5e73df285	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:18:18	2024-11-14 08:18:18	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:14	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
a17cfd9e-b618-431a-b290-8ad22e62b9f8	2177d90f-b339-434f-9c0e-137be0bb8234	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:47	2024-11-14 08:17:47	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:38	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
0a43b12e-6cd1-4425-982a-2ec64cf3b8c5	03458648-9b8a-4083-b4a6-56dd78eb5e80	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:44	2024-11-14 08:17:44	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:08	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
6afdc649-9ae3-4fb2-a3ea-83c9ebff6451	cf9a399b-4b3f-46dd-81b0-75d7542232a4	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:37	2024-11-14 08:17:37	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:13	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
b30ccda6-841f-412e-9643-26605e571e8f	d4ae57d8-473c-4dcb-92c8-62fb561de79d	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:19:08	2024-11-14 08:19:08	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:07	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
f21c34bf-00c6-4551-880a-5c4a2da38316	5c552624-423b-4197-8fc8-1bacb9aaf07b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:51	2024-11-14 08:17:51	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:44	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
a1cb2bdc-c293-4a05-926c-c0bd3039b534	53df9679-d8eb-41da-9874-c33fbc158c77	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:19	2024-11-14 08:17:19	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:04	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
9c498924-0dc2-4946-9148-2b7ff01ecb55	e46a34c8-ce4d-4a23-a4a2-63565eba6bd9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:43	2024-11-14 08:17:43	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:14	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
6b7d22e4-13dd-4ae9-a962-2b4a5402c1ff	7afc682c-1791-4a53-8998-51e2e47e301b	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:54	2024-11-14 08:17:54	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:49	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
78abbd23-c2b6-4a51-ad1d-8d584ea43a16	7873e474-1a77-49c3-9fbb-bf6207e94acf	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:35	2024-11-14 08:17:35	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:20	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
2b51dbad-57b4-413d-878d-9e874b197867	fc3c9dfd-8827-41df-8366-ed852f8a23ec	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:36	2024-11-14 08:17:36	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:09	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
3918be05-ab89-48b8-b8f9-5ab7f7adc406	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:06	2024-11-14 13:33:06	\N	3599	1	0	2024-11-14 06:33:04	2024-11-14 06:33:07	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
e1254a26-fc2c-447b-aa14-c666d92a5863	d4ae57d8-473c-4dcb-92c8-62fb561de79d	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:10	2024-11-14 13:33:10	\N	3600	1	0	2024-11-14 06:33:07	2024-11-14 06:33:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
38eee0a7-1e75-4821-bb86-923632f7d3b4	ed2b861b-e2d5-432f-b480-0fd8c6d31f96	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:20:31	2024-11-14 08:20:31	2024-11-14 13:29:10	0	3	0	2024-11-14 01:20:12	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
ad01a78a-733b-4225-a437-1882dae96493	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:38	2024-11-14 08:17:38	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:01	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
2258fb99-76d0-4169-92ea-2a6ef17361e7	da0698b5-abc3-4c23-acb2-c80beea05535	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:17	2024-11-14 13:33:17	\N	3600	1	0	2024-11-14 06:33:10	2024-11-14 06:33:18	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
49fee6b6-4c55-41a7-8d04-acd900f007f3	31252c94-4f88-41f2-98fd-4a2eb68b6b72	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:23:15	2024-11-14 08:23:15	2024-11-14 13:29:10	0	3	0	2024-11-14 01:23:03	2024-11-14 06:29:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
d4ed46e1-8029-4886-b3d2-7c9ad41fb763	ebe47e76-37d7-43f1-9baf-da841d058eb9	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:18:58	2024-11-14 08:18:58	2024-11-14 13:29:10	0	3	0	2024-11-14 01:18:43	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
bf9d8120-9d0e-4914-b78b-bbe3bd5fba6a	a8640110-77e5-42f9-9635-756d060428ff	1cee5d52-54b1-46ae-8f63-642ef0c8c3ca	2024-11-14 08:17:35	2024-11-14 08:17:35	2024-11-14 13:29:10	0	3	0	2024-11-14 01:17:13	2024-11-14 06:29:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	4XIG	1	f	0
5ae6b542-d93a-4970-bf7a-ec18e697b6e5	2c2f921f-e0f2-4215-b03d-901d25004a2e	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:22	2024-11-14 13:33:22	\N	3600	1	0	2024-11-14 06:33:20	2024-11-14 06:33:23	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
48026880-163c-48b0-aaaf-66ba21cc4e82	7873e474-1a77-49c3-9fbb-bf6207e94acf	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:45	2024-11-14 13:33:45	\N	3600	1	0	2024-11-14 06:33:40	2024-11-14 06:33:46	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
b3ac40de-83b5-4ab5-a54c-5aa22d7058b3	3226b4e1-581d-49b9-90b9-83882d82f515	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:23	2024-11-14 13:33:23	\N	3600	1	0	2024-11-14 06:33:13	2024-11-14 06:33:24	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
2c748121-7aa0-4908-9e3c-987b9bb74f3c	866347c4-acb1-4edc-8222-7ab2c3b343c7	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:34	2024-11-14 13:33:34	\N	3600	1	0	2024-11-14 06:33:28	2024-11-14 06:33:35	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
5ec1687c-a481-4388-8936-e5b7709407f5	e8b39954-cff4-4a0e-a35c-5dae9483fa0d	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:22	2024-11-14 13:33:22	\N	3580	1	0	2024-11-14 06:33:16	2024-11-14 06:33:42	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
cd2fae1d-5146-4b0e-8388-34e5005a6e33	fc3c9dfd-8827-41df-8366-ed852f8a23ec	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:23	2024-11-14 13:33:23	\N	3581	1	0	2024-11-14 06:33:12	2024-11-14 06:33:43	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
967dd009-f957-4780-8a7b-6c04d551f3e5	bea68c4e-349b-4222-9f66-e47b5eac2280	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:45	2024-11-14 13:33:45	\N	3600	1	0	2024-11-14 06:33:43	2024-11-14 06:33:45	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
fc6c85b3-11da-4045-9df4-fec9cde0bfef	5c552624-423b-4197-8fc8-1bacb9aaf07b	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:45	2024-11-14 13:33:45	\N	3599	1	0	2024-11-14 06:33:15	2024-11-14 06:33:47	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
f6a467ed-d18e-4dad-9499-1187deea0fdf	cf9a399b-4b3f-46dd-81b0-75d7542232a4	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:46	2024-11-14 13:33:46	\N	3598	1	0	2024-11-14 06:33:41	2024-11-14 06:33:49	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
2e8b20e4-1042-4dfb-999f-f7b62792b448	7afc682c-1791-4a53-8998-51e2e47e301b	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:48	2024-11-14 13:33:48	\N	3599	1	0	2024-11-14 06:33:47	2024-11-14 06:33:49	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
b4f242bf-26c6-4528-b1c9-a7cd57a84da1	5ba024ed-363a-44cf-97f2-251aed7cf4e4	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:50	2024-11-14 13:33:50	\N	0	0	0	2024-11-14 06:33:51	2024-11-14 06:33:51	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
0428fc26-a0ff-4ef7-bd42-05c92d73183d	f43d869b-0a0f-4f15-8ad3-edcf8c44fb1f	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:34:02	2024-11-14 13:34:02	\N	3599	1	0	2024-11-14 06:33:13	2024-11-14 06:34:03	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
28296a35-54e3-42d8-86fc-7bbb51438c26	50b66260-ef17-434e-bef9-50cd5919bebc	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:33:49	2024-11-14 13:33:49	\N	3580	1	0	2024-11-14 06:33:38	2024-11-14 06:34:10	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
ec162bf4-807d-4874-b343-043c685f5df4	e82e107a-8882-4074-8841-c557daf4126f	85898c75-a23b-41d7-b04e-a131f81209f6	2024-11-14 13:34:10	2024-11-14 13:34:10	\N	3600	1	0	2024-11-14 06:33:25	2024-11-14 06:34:11	480f995f-3488-49e2-8a0c-87fd4bdd4367	PPIP	1	f	0
\.


--
-- Data for Name: soal_summaries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soal_summaries (id, banksoal_id, soal_id, total_void, total_correct, total_wrong, highest_point, lowest_point, avg_point, ds_point, addons, created_at, total_done) FROM stdin;
76e80c98-8330-410b-aaf1-ca691473c04a	b132b631-3b5e-4087-b457-1dd4664daed4	de4ec175-01ed-45b4-8899-566784bd8708	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
c680c4e1-a318-4390-ab4e-816bcdad6bfc	b132b631-3b5e-4087-b457-1dd4664daed4	c1d89fab-cf54-4996-9b3e-392ac509c409	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
30c57ed6-e910-4959-bc32-8ca4a23420fa	b132b631-3b5e-4087-b457-1dd4664daed4	cff854b6-3804-4c5e-8029-de025ab01f4b	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
c3fc5789-0e41-4c0d-a928-f4cc1673d6e3	b132b631-3b5e-4087-b457-1dd4664daed4	cc13e214-7ffb-4265-8427-9abebf7802ea	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
33337783-842a-4291-95b8-8700b716d6e6	b132b631-3b5e-4087-b457-1dd4664daed4	4eb29b99-bd0d-482c-baf5-e927577f2cd0	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
d2d9b100-8491-4b85-ad89-ef58d23b53f0	b132b631-3b5e-4087-b457-1dd4664daed4	61f9674d-12c1-44bf-85c1-41db5a866866	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
d14dcf45-59e8-4e45-b9f1-1529b304dc27	b132b631-3b5e-4087-b457-1dd4664daed4	76ed9a9d-7080-473e-8136-5f769a0f87da	0	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
03d8cbd6-fadc-4392-acf6-2de9a36a750e	b132b631-3b5e-4087-b457-1dd4664daed4	07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	1	1	1	2.50	0.00	1.2500	1.767767	\N	2024-11-12 02:40:59	2
8b615ebb-5843-4540-84d8-062d7ec82bfe	b132b631-3b5e-4087-b457-1dd4664daed4	b820472d-5898-4d8b-962f-a1c54b804102	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
288d17bb-dc77-4589-8d16-def881df4d85	b132b631-3b5e-4087-b457-1dd4664daed4	153cc2c8-fe40-459c-94b4-d8dd4ee1155f	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
93b32481-5f6a-4920-a23c-9dce52178fa4	b132b631-3b5e-4087-b457-1dd4664daed4	d8e6721f-f1e3-4fdf-8c74-78e3c1c8594e	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
e26280fb-af8b-4770-8a72-250358b918af	b132b631-3b5e-4087-b457-1dd4664daed4	6b055d46-a532-4bde-99e1-0efeaa204d9b	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
e1d14d1b-1a9c-4d81-b01c-fcd9f3630f43	b132b631-3b5e-4087-b457-1dd4664daed4	ef531185-1ed3-45ca-92e5-cb9833e6ffc0	1	0	2	5.60	0.00	2.8000	3.959798	\N	2024-11-12 02:40:59	2
e7368bcc-ef43-4cfc-9b41-e2fd8f66457c	b132b631-3b5e-4087-b457-1dd4664daed4	4d48a3ed-d425-44d6-a59c-01b5821b8155	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
a780bb1e-52d2-4ea9-9525-33ab42fcd01c	b132b631-3b5e-4087-b457-1dd4664daed4	42fe4a5f-a7a6-45d8-8b11-9b24f882154a	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
614159db-a1ec-47f1-8435-b574244839b6	b132b631-3b5e-4087-b457-1dd4664daed4	e1b9401c-33c5-4b7a-876c-a5844de55ab4	1	1	1	2.50	0.00	1.2500	1.767767	\N	2024-11-12 02:40:59	2
552b1b32-bda2-458c-aa65-776392c8faca	b132b631-3b5e-4087-b457-1dd4664daed4	2a5b3bec-510d-4604-866d-26e98c9c4e1b	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
7275e58d-469e-44b0-b254-67fc05582dac	b132b631-3b5e-4087-b457-1dd4664daed4	9d6151cd-beb3-437a-81a2-dafeb5a2de33	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
e1f95204-7916-4e32-8666-0df8363fe5e2	b132b631-3b5e-4087-b457-1dd4664daed4	d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
4050f523-054f-469b-8df7-db137da7f584	b132b631-3b5e-4087-b457-1dd4664daed4	488a2cbe-84cb-4d07-be70-47235c8d8fa5	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
98682a7a-685b-4dad-a6ac-17421c4f1170	b132b631-3b5e-4087-b457-1dd4664daed4	86f6868b-6c4e-419d-ac7d-6367490c746a	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
45e3cbd2-4830-433d-98c0-a0ca0bcdbb53	b132b631-3b5e-4087-b457-1dd4664daed4	93b301be-33fb-4c4f-b0a3-b6c1a3098c70	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
c97b30c2-eaca-4442-a0e2-35a4379bc58c	b132b631-3b5e-4087-b457-1dd4664daed4	423defca-b16e-4405-8ddb-65e615b7d298	1	0	2	5.60	0.00	2.8000	3.959798	\N	2024-11-12 02:40:59	2
f8256927-5776-4b5a-abf9-2d145e48ca78	b132b631-3b5e-4087-b457-1dd4664daed4	803b9b4f-9ef0-4255-8419-75785d71f0f7	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
f2d43d75-81d1-4e89-b2ed-5a1030ea76a9	b132b631-3b5e-4087-b457-1dd4664daed4	03523d9e-3f48-4f14-8305-c75fc42f4bf8	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
addd5b68-b829-4ade-b27d-2a20f893e6ca	b132b631-3b5e-4087-b457-1dd4664daed4	031db96a-c50a-45a6-b718-f82db2235d6b	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
7ce5e1c4-ecb0-48d4-bbd8-9bec1d2f4d21	b132b631-3b5e-4087-b457-1dd4664daed4	45477509-3a99-4622-8059-e3d692945356	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
0eb483c0-66da-46d5-aa39-4a0140492a0b	b132b631-3b5e-4087-b457-1dd4664daed4	abec2630-e07e-433f-a6a1-7802929ad67a	1	1	1	10.00	0.00	5.0000	7.071068	\N	2024-11-12 02:40:59	2
7c505066-8dcf-487b-936b-af0395f17bed	b132b631-3b5e-4087-b457-1dd4664daed4	7ff912cd-4ffe-4c49-b96c-eb37eea9d942	0	1	1	2.50	0.00	1.2500	1.767767	\N	2024-11-12 02:40:59	2
a58f0fbe-78c0-455f-8d0e-9e1920320cf3	b132b631-3b5e-4087-b457-1dd4664daed4	871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	1	1	1	2.50	0.00	1.2500	1.767767	\N	2024-11-12 02:40:59	2
c0ee2bf4-08ee-45ce-b9f6-bf21b960c052	b132b631-3b5e-4087-b457-1dd4664daed4	ec8f4324-e007-407d-9f29-a70a1ad4fa2b	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
d55e64d2-351d-4684-b64d-ba98b14fe8b6	b132b631-3b5e-4087-b457-1dd4664daed4	040ddd51-813d-42bf-965f-0bc5303a46ce	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
441d1702-6793-4feb-97bb-b1eccccb985e	b132b631-3b5e-4087-b457-1dd4664daed4	69a9327e-2b7a-4ebb-9d98-3e7fcd69661d	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
cff8c9fb-30fd-46ba-9976-a5e10ec0fb24	b132b631-3b5e-4087-b457-1dd4664daed4	ae152984-ec8e-4824-becd-0d4365796866	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
e52f783f-4378-436a-a023-7a06648bd2df	b132b631-3b5e-4087-b457-1dd4664daed4	d0339fe7-39be-4322-a71e-5c46ce48b757	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
b18bd337-1c05-4cb9-8d2a-5eea7d8d41e8	b132b631-3b5e-4087-b457-1dd4664daed4	d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	1	1	1	10.00	0.00	5.0000	7.071068	\N	2024-11-12 02:40:59	2
c659f8b2-c4a5-4cc2-85ac-c5abebc68d39	b132b631-3b5e-4087-b457-1dd4664daed4	f550bb4c-9b59-4b0e-8472-50b1f45d9d55	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
31bd1478-ed16-4db6-bbb8-51261e81cb92	b132b631-3b5e-4087-b457-1dd4664daed4	9f46874a-c3a0-4584-8056-9ca78535ee80	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
284087d6-f40a-4d74-a871-e8137a91ae82	b132b631-3b5e-4087-b457-1dd4664daed4	acc1c50f-56d8-49b7-861b-338b2931a35b	1	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	1
0e7c3c3b-49d6-4d87-ab44-430acd4c7f03	b132b631-3b5e-4087-b457-1dd4664daed4	a11fc1a7-2530-4db3-82ba-27f4d686e4c0	1	0	2	0.00	0.00	0.0000	0.000000	\N	2024-11-12 02:40:59	2
2fe02770-f272-4368-9c69-0216272fd9b5	31d085d2-069f-41a2-b802-71ba97846911	1cd2cda1-76b0-413e-9495-4a5a9a898ea7	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 06:46:38	1
070904f0-da19-4e45-b999-2b583a335ba3	31d085d2-069f-41a2-b802-71ba97846911	1f0fdd75-233a-4f66-8776-2fc5f14436f8	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 06:46:38	1
42ce48cd-5a07-4aea-8145-ee9e6e1fe835	31d085d2-069f-41a2-b802-71ba97846911	7215700b-1081-406c-88aa-0599781dbd82	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 06:46:38	1
4ef297ad-8c56-4b3e-8294-91113c97963d	31d085d2-069f-41a2-b802-71ba97846911	7ec8cf21-50eb-4e4f-8168-ee8e3e5f6053	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 06:46:38	1
ba70bf16-fbf4-4a65-b47d-4a8c82106491	31d085d2-069f-41a2-b802-71ba97846911	993f10a3-d06a-44ee-95c4-537387bf9a7b	0	0	1	0.00	0.00	0.0000	0.000000	\N	2024-11-12 06:46:38	1
\.


--
-- Data for Name: soals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soals (id, banksoal_id, tipe_soal, pertanyaan, layout, created_at, updated_at, competence_item_id, absolute_eval, case_sensitive, supports, sequence) FROM stdin;
373eca6d-6d6a-4bf2-9455-99cc0f848e61	e251b1ee-f97b-44bd-899e-083c864f144c	1	<p>Hewan laut apakah dibawah ini?&nbsp;</p><ul class='space-y-1'><li class='flex items-center'><div class='w-4'>&#x2022;</div><div><p>Hidup di habitat pesisir pantai&nbsp;</p></li><li class='flex items-center'><div class='w-4'>&#x2022;</div><div><p>Termasuk hewan intertebrata&nbsp;</p></li></ul><p>Tahu ngga kamu?&nbsp;</p></ul><p><img src='{{.BaseURL}}/wormhole/directory-media-01JADRV58BNNYTQQKXKPN4CEYT/01JADRZSTYG9WX1Q2FWKKWYCJY.svg' alt='gambar' width='69' height='69'/>&nbsp;</p>	1	2024-10-17 17:39:12.417466	2024-10-17 17:39:12.417466	\N	t	t	\N	0
680699f4-67ac-43ff-8757-f0c8fc66839f	e251b1ee-f97b-44bd-899e-083c864f144c	4	<p>Benua adalah bagian besar daratan yang dikelilingi oleh air di seluruh sisi. Mereka adalah struktur geografis terbesar di Bumi. &nbsp;</p><p>&nbsp;</p><p>Dibawah ini manakah yang termasuk kedalam benua?&nbsp;</p>	1	2024-10-17 17:39:12.424152	2024-10-17 17:39:12.424152	\N	t	t	\N	0
5e8f5209-241b-486f-90ff-2ba96560d254	e251b1ee-f97b-44bd-899e-083c864f144c	2	<p>Jelaskan secara singkat apa fungsi pantograf pada KRL&nbsp;</p>	1	2024-10-17 17:39:12.431997	2024-10-17 17:39:12.431997	\N	f	t	{"REF_ESAY":"Pantograf pada Kereta Rel Listrik (KRL) berfungsi sebagai alat penghubung antara kereta dengan saluran listrik udara (catenary) di atas rel. Fungsi utama pantograf adalah mengumpulkan energi listrik dari saluran udara dan mentransfernya ke sistem listrik dalam kereta. Dengan cara ini, kereta dapat menggunakan tenaga listrik untuk bergerak, mendukung operasi KRL sebagai sarana transportasi listrik yang efisien. Pantograf biasanya terdiri dari struktur yang dapat mengangkat atau menurunkan dirinya untuk terhubung atau terputus dari saluran listrik udara selama perjalanan."}	0
093f4497-ef23-409c-a38c-b90783e16181	e251b1ee-f97b-44bd-899e-083c864f144c	6	<p>Pada tahun berapa bank dunia didirikan?&nbsp;</p>	1	2024-10-17 17:39:12.433176	2024-10-17 17:39:12.433176	\N	t	t	\N	0
af30e163-136a-47ea-9930-a94ebe25d1b7	e251b1ee-f97b-44bd-899e-083c864f144c	5	<p>Cocokkanlah antara cabang-cabang pemerintahan utama dengan fungsinya&nbsp;</p>	1	2024-10-17 17:39:12.43441	2024-10-17 17:39:12.43441	\N	t	t	\N	0
e8e52b2c-7141-448e-b722-b16738415848	e251b1ee-f97b-44bd-899e-083c864f144c	10	<p>Cocokkan jenis perrangkat keras dibawah ini beserta penjelasan singkatnya&nbsp;</p>	1	2024-10-17 17:39:12.439009	2024-10-17 17:39:12.439009	\N	t	t	\N	0
c229f2c4-f873-4e7c-940a-2674f50bcc73	e251b1ee-f97b-44bd-899e-083c864f144c	7	<p>Urutkan peristiwa penting dalam sejarah kemerdekaan Indonesia&nbsp;</p>	1	2024-10-17 17:39:12.448064	2024-10-17 17:39:12.448064	\N	t	t	\N	0
e21e7938-b854-403c-83b5-1c432af18167	e251b1ee-f97b-44bd-899e-083c864f144c	9	<p>Jawablah argument dibawah ini, sertakan juga alasannya!&nbsp;</p>	1	2024-10-17 17:39:12.44936	2024-10-17 17:39:12.44936	\N	f	t	\N	0
f97b4245-5df7-4030-a95b-6cec0c48ebd1	e251b1ee-f97b-44bd-899e-083c864f144c	8	<p>Dibawah ini ditampilkan pernyataan tentang istilah dalam kedokteran. Centang pada pernyataan benar.&nbsp;</p>	1	2024-10-17 17:39:12.450545	2024-10-17 17:39:12.450545	\N	t	t	\N	0
b0df1d97-08a8-4e63-9aa5-913755b222c1	e251b1ee-f97b-44bd-899e-083c864f144c	1	<p>What color is a lemon?</p>	1	2024-10-17 17:39:12.411904	2024-11-04 01:49:21.371855	\N	t	t	\N	0
84a7582e-b820-4cc3-9ef6-92970befd3ac	117800b5-7caa-45b7-987f-d2a50c994c62	1	<p>Tanggapan <b><u>penolakan</u></b> di <u>bawah</u> ini yang <i>tepat</i> adalah ….&nbsp;</p>	1	2024-11-05 06:54:11.00485	2024-11-05 06:54:11.00485	\N	t	t	\N	0
2841b35e-e4a9-4461-abcd-3df914bc4c10	117800b5-7caa-45b7-987f-d2a50c994c62	1	<p>Hewan laut apakah dibawah ini?&nbsp;</p><ul class='space-y-1'><li class='flex items-center'><div class='w-4'>&#x2022;</div><div><p>Hidup di habitat pesisir pantai&nbsp;</p></li><li class='flex items-center'><div class='w-4'>&#x2022;</div><div><p>Termasuk hewan intertebrata&nbsp;</p></li></ul><p>Tahu ngga kamu?&nbsp;</p></ul><p><img src='{{.BaseURL}}/wormhole/directory-media-01JBXGSVB2PJB91E15NKE9369W/01JBXHMCFXBPZ48SN8JKV6V65S.svg' alt='gambar' width='69' height='69'/>&nbsp;</p>	1	2024-11-05 06:54:11.011705	2024-11-05 06:54:11.011705	\N	t	t	\N	0
64edf9fa-2575-449e-8dd7-fb20da6597ca	117800b5-7caa-45b7-987f-d2a50c994c62	4	<p>Benua adalah bagian besar daratan yang dikelilingi oleh air di seluruh sisi. Mereka adalah struktur geografis terbesar di Bumi. &nbsp;</p><p>&nbsp;</p><p>Dibawah ini manakah yang termasuk kedalam benua?&nbsp;</p>	1	2024-11-05 06:54:11.018728	2024-11-05 06:54:11.018728	\N	t	t	\N	0
56ee22cd-5842-45e7-9630-c69afb1a8f7a	117800b5-7caa-45b7-987f-d2a50c994c62	2	<p>Jelaskan secara singkat apa fungsi pantograf pada KRL&nbsp;</p>	1	2024-11-05 06:54:11.027054	2024-11-05 06:54:11.027054	\N	f	t	{"REF_ESAY":"Pantograf pada Kereta Rel Listrik (KRL) berfungsi sebagai alat penghubung antara kereta dengan saluran listrik udara (catenary) di atas rel. Fungsi utama pantograf adalah mengumpulkan energi listrik dari saluran udara dan mentransfernya ke sistem listrik dalam kereta. Dengan cara ini, kereta dapat menggunakan tenaga listrik untuk bergerak, mendukung operasi KRL sebagai sarana transportasi listrik yang efisien. Pantograf biasanya terdiri dari struktur yang dapat mengangkat atau menurunkan dirinya untuk terhubung atau terputus dari saluran listrik udara selama perjalanan."}	0
b6bc086d-12f1-49fe-b777-efb0a93bbfff	117800b5-7caa-45b7-987f-d2a50c994c62	6	<p>Pada tahun berapa bank dunia didirikan?&nbsp;</p>	1	2024-11-05 06:54:11.02829	2024-11-05 06:54:11.028291	\N	t	t	\N	0
a18891ca-7eea-49d9-b820-8e5655d4bf1a	117800b5-7caa-45b7-987f-d2a50c994c62	5	<p>Cocokkanlah antara cabang-cabang pemerintahan utama dengan fungsinya&nbsp;</p>	1	2024-11-05 06:54:11.038155	2024-11-05 06:54:11.038155	\N	t	t	\N	0
8acd8fe9-9ee9-4eb8-a925-f7e5d8ed1afd	117800b5-7caa-45b7-987f-d2a50c994c62	10	<p>Cocokkan jenis perrangkat keras dibawah ini beserta penjelasan singkatnya&nbsp;</p>	1	2024-11-05 06:54:11.043473	2024-11-05 06:54:11.043473	\N	t	t	\N	0
5ce437cb-d2e1-41bd-9268-d73fe0d0a6b7	117800b5-7caa-45b7-987f-d2a50c994c62	7	<p>Urutkan peristiwa penting dalam sejarah kemerdekaan Indonesia&nbsp;</p>	1	2024-11-05 06:54:11.052893	2024-11-05 06:54:11.052894	\N	t	t	\N	0
16b40fe9-22c4-4e0c-815c-7a5a3d8a63d9	117800b5-7caa-45b7-987f-d2a50c994c62	9	<p>Jawablah argument dibawah ini, sertakan juga alasannya!&nbsp;</p>	1	2024-11-05 06:54:11.05441	2024-11-05 06:54:11.05441	\N	f	t	\N	0
b3f12d84-f0e0-40fc-939f-7d88b6959f75	117800b5-7caa-45b7-987f-d2a50c994c62	8	<p>Dibawah ini ditampilkan pernyataan tentang istilah dalam kedokteran. Centang pada pernyataan benar.&nbsp;</p>	1	2024-11-05 06:54:11.055663	2024-11-05 06:54:11.055663	\N	t	t	\N	0
871f243e-1fd3-4eb6-91ad-1aa0fbf5eb01	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Ketika Anda mengklik kanan pada gambar di browser dan memilih "Open image in new tab," apa yang terjadi?&nbsp;</p>	1	2024-11-11 16:27:00.674134	2024-11-11 16:27:00.674134	\N	t	t	\N	0
c1d89fab-cf54-4996-9b3e-392ac509c409	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Apa pengertian dasar dari surat elektronik (email)?&nbsp;</p>	1	2024-11-11 16:27:00.679975	2024-11-11 16:27:00.679975	\N	t	t	\N	0
2a5b3bec-510d-4604-866d-26e98c9c4e1b	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Komponen utama dari web browser termasuk?&nbsp;</p>	1	2024-11-11 16:27:00.686321	2024-11-11 16:27:00.686321	\N	t	t	\N	0
ec8f4324-e007-407d-9f29-a70a1ad4fa2b	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Simbol apa yang digunakan untuk menunjukkan bahwa kata tertentu harus ada dalam hasil pencarian di Google?&nbsp;</p>	1	2024-11-11 16:27:00.693237	2024-11-11 16:27:00.693238	\N	t	t	\N	0
9f46874a-c3a0-4584-8056-9ca78535ee80	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Untuk apa fungsi dari menu Home dalam File Explorer?&nbsp;</p>	1	2024-11-11 16:27:00.700241	2024-11-11 16:27:00.700241	\N	t	t	\N	0
cc13e214-7ffb-4265-8427-9abebf7802ea	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Antarmuka pengguna yang berbasis grafis dikenal dengan istilah?&nbsp;</p>	1	2024-11-11 16:27:00.70608	2024-11-11 16:27:00.706081	\N	t	t	\N	0
03523d9e-3f48-4f14-8305-c75fc42f4bf8	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Pengertian dari search engine adalah?&nbsp;</p>	1	2024-11-11 16:27:00.711808	2024-11-11 16:27:00.711808	\N	t	t	\N	0
e1b9401c-33c5-4b7a-876c-a5844de55ab4	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Apa nama aplikasi yang digunakan untuk menghapus email dalam kotak masuk?&nbsp;</p>	1	2024-11-11 16:27:00.717616	2024-11-11 16:27:00.717616	\N	t	t	\N	0
031db96a-c50a-45a6-b718-f82db2235d6b	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Apa yang dimaksud dengan hiperteks di dalam konteks web?&nbsp;</p>	1	2024-11-11 16:27:00.72342	2024-11-11 16:27:00.72342	\N	t	t	\N	0
423defca-b16e-4405-8ddb-65e615b7d298	b132b631-3b5e-4087-b457-1dd4664daed4	2	<p>Jelaskan apa yang dimaksud dengan pengolah kata dan sebutkan tiga contoh aplikasi pengolah kata yang populer saat ini.&nbsp;</p>	1	2024-11-11 16:27:00.729476	2024-11-11 16:27:00.729476	\N	f	t	{"REF_ESAY":"Pengolah kata adalah software yang digunakan untuk membuat, mengedit, dan memformat dokumen teks. Contoh aplikasi pengolah kata meliputi Microsoft Word, Google Docs, dan LibreOffice Writer."}	0
ef531185-1ed3-45ca-92e5-cb9833e6ffc0	b132b631-3b5e-4087-b457-1dd4664daed4	2	<p>Apa saja fungsi dari web browser dan sebutkan dua contoh web browser yang sering digunakan.&nbsp;</p>	1	2024-11-11 16:27:00.730627	2024-11-11 16:27:00.730627	\N	f	t	{"REF_ESAY":"Web browser berfungsi untuk mengakses dan menjelajahi informasi di internet, menampilkan halaman web, dan mempermudah navigasi pengguna. Contoh web browser yang sering digunakan adalah Google Chrome dan Mozilla Firefox."}	0
abec2630-e07e-433f-a6a1-7802929ad67a	b132b631-3b5e-4087-b457-1dd4664daed4	2	<p>jelaskan proses pengiriman email dari awal hingga email diterima oleh penerima&nbsp;</p>	1	2024-11-11 16:27:00.731872	2024-11-11 16:27:00.731872	\N	f	t	{"REF_ESAY":" Proses pengiriman email dimulai dengan membuat pesan di aplikasi email, mengisi kolom penerima (To), menulis subjek, dan isi pesan. Setelah itu, klik tombol \\"Send\\". Server email akan mengirim pesan melalui jaringan ke server penerima, dan kemudian email akan muncul di kotak masuk penerima."}	0
d729a2fc-8c1a-4625-b4d2-e4f133fbdf83	b132b631-3b5e-4087-b457-1dd4664daed4	2	<p>Deskripsikan sejarah singkat pengolah kata dari awal munculnya mesin ketik hingga perangkat lunak modern.&nbsp;</p>	1	2024-11-11 16:27:00.733005	2024-11-11 16:27:00.733005	\N	f	t	{"REF_ESAY":"Pengolah kata dimulai dengan mesin ketik mekanik yang dipatenkan oleh Henry Mill pada tahun 1714. Kemudian, pada akhir 1960-an, mesin ketik elektronik seperti IBM MT/ST diperkenalkan. Dengan perkembangan komputer pribadi pada 1970-an, perangkat lunak pengolah kata seperti Microsoft Word muncul, yang memungkinkan pengguna untuk mengedit, memformat, dan menyimpan dokumen dengan cara yang lebih interaktif."}	0
d8dedae1-c9a8-4b0d-82b5-7e4a58a4f7da	b132b631-3b5e-4087-b457-1dd4664daed4	2	<p>Apa itu search engine? Sebutkan satu contoh dan jelaskan bagaimana penggunaannya&nbsp;</p>	1	2024-11-11 16:27:00.734146	2024-11-11 16:27:00.734146	\N	f	t	{"REF_ESAY":"Search engine adalah alat berbasis web yang digunakan untuk mencari informasi di internet dengan memasukkan kata kunci. Contoh search engine yang terkenal adalah Google. Pengguna dapat memasukkan kata kunci di kolom pencarian, dan Google akan memberikan hasil yang relevan based on kata kunci tersebut."}	0
1cd2cda1-76b0-413e-9495-4a5a9a898ea7	31d085d2-069f-41a2-b802-71ba97846911	1	<p>Hewan laut apakah dibawah ini?&nbsp;</p><p><b><u><i>Hidup di habitat pesisir pantai</i></u></b>&nbsp;</p><p><b><u><i>Termasuk hewan intertebrata</i></u></b>&nbsp;</p><p>Tahu ngga kamu?&nbsp;</p><p><img src='{{.BaseURL}}/wormhole/directory-media-01JCFHHA09PVXTSK30A11QMD88/01JCFHK5RWREB03KVD927RXWGW.png' alt='gambar'/>&nbsp;</p>	1	2024-11-12 06:39:51.116922	2024-11-12 06:39:51.116922	\N	t	t	\N	0
d35bf80f-9ad2-4707-b6f2-68c030a9d8d8	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.430906	2024-11-12 02:22:28.430907	\N	t	t	\N	0
07dae3fe-87a1-47f1-ac4f-d5d634eaaa6c	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Pengolah kata yang menggunakan pita kaset magnetik untuk menyimpan data disebut sebagai?&nbsp;</p>	1	2024-11-11 16:27:00.644638	2024-11-11 16:27:00.644638	\N	t	t	\N	0
803b9b4f-9ef0-4255-8419-75785d71f0f7	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Apa nama aplikasi pengolah kata yang pertama kali diperkenalkan oleh Microsoft?&nbsp;</p>	1	2024-11-11 16:27:00.65028	2024-11-11 16:27:00.650281	\N	t	t	\N	0
ae152984-ec8e-4824-becd-0d4365796866	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Di mana pengguna dapat menuliskan alamat email tujuan saat mengirim email?&nbsp;</p>	1	2024-11-11 16:27:00.655927	2024-11-11 16:27:00.655927	\N	t	t	\N	0
a11fc1a7-2530-4db3-82ba-27f4d686e4c0	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Fungsi dari tombol Attach Files dalam email adalah?&nbsp;</p>	1	2024-11-11 16:27:00.662216	2024-11-11 16:27:00.662216	\N	t	t	\N	0
3afa6d2c-a6cf-4be9-b7e8-fb7221ab1dc1	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.437747	2024-11-12 02:22:28.437747	\N	t	t	\N	0
9bffa16e-ce5f-4cfd-b866-84eaa2bf7687	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.444594	2024-11-12 02:22:28.444595	\N	t	t	\N	0
868e3100-d263-49d1-b9a8-12040176bec1	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.451411	2024-11-12 02:22:28.451411	\N	t	t	\N	0
69f0944e-2218-4f31-ba9e-669ce9044de7	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.458091	2024-11-12 02:22:28.458091	\N	t	t	\N	0
678a9d7b-d7c1-4564-bfff-a491f13d114d	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.466715	2024-11-12 02:22:28.466715	\N	t	t	\N	0
43291c12-174a-4645-ad1b-a23df2b34b20	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.473538	2024-11-12 02:22:28.473538	\N	t	t	\N	0
9350dab8-02bf-4b52-943b-43fef7f94d97	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.480277	2024-11-12 02:22:28.480277	\N	t	t	\N	0
d56a591f-73c5-4c57-b890-c5336316a08b	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.487059	2024-11-12 02:22:28.487059	\N	t	t	\N	0
a2acc651-fa46-4da4-9b7f-d758501f0d93	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.495221	2024-11-12 02:22:28.495221	\N	t	t	\N	0
ecaf9c2a-1d77-471a-bc22-22d153f575a0	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.500894	2024-11-12 02:22:28.500894	\N	t	t	\N	0
b6cb8318-b5ff-466c-acc6-8b7f128616a9	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.507782	2024-11-12 02:22:28.507782	\N	t	t	\N	0
6d0b62a0-b95c-4e1e-a703-24bdb0f9710e	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.514705	2024-11-12 02:22:28.514705	\N	t	t	\N	0
6d8ef2b3-bcd5-46b6-8109-77da0ff98464	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.521473	2024-11-12 02:22:28.521473	\N	t	t	\N	0
a41166df-f957-4621-976f-5c53711fb9ec	f75d819f-4338-4444-b604-15b87d5eacee	1	<p>&nbsp;</p>	1	2024-11-12 02:22:28.528124	2024-11-12 02:22:28.528124	\N	t	t	\N	0
756e2b61-53c8-47ca-b3b5-9f11f4d39011	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>Benua adalah bagian besar daratan yang dikelilingi oleh air di seluruh sisi. Mereka adalah struktur geografis terbesar di Bumi. &nbsp;</p><p>&nbsp;</p><p>Dibawah ini manakah yang termasuk kedalam benua?&nbsp;</p>	1	2024-11-12 02:22:28.534849	2024-11-12 02:22:28.534849	\N	t	t	\N	0
a4b6ec35-28f4-4504-8f8f-7f33585477f7	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.542803	2024-11-12 02:22:28.542803	\N	t	t	\N	0
4ae55e4c-8561-40cf-85d3-e11147da7d0c	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.550818	2024-11-12 02:22:28.550818	\N	t	t	\N	0
b40678d5-3cb0-4a4b-875d-572ac81b14af	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.558651	2024-11-12 02:22:28.558651	\N	t	t	\N	0
836a1e0f-5fa1-47dc-b71e-52c766170477	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.566506	2024-11-12 02:22:28.566507	\N	t	t	\N	0
685e02ed-dd15-4d8e-b5ce-783d19044802	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.574561	2024-11-12 02:22:28.574561	\N	t	t	\N	0
67a0e721-b0b7-4904-a6f2-325d20eb9bc5	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.582518	2024-11-12 02:22:28.582518	\N	t	t	\N	0
b8654018-f753-484b-a939-9221dc5b8776	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.590664	2024-11-12 02:22:28.590664	\N	t	t	\N	0
855ee472-02e8-4456-bb98-d514afae1821	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.597383	2024-11-12 02:22:28.597383	\N	t	t	\N	0
f4bfd94e-b06a-4af3-b4c5-91daae6c8aac	f75d819f-4338-4444-b604-15b87d5eacee	4	<p>&nbsp;</p>	1	2024-11-12 02:22:28.605439	2024-11-12 02:22:28.605439	\N	t	t	\N	0
75be5aea-c086-4d98-84e1-79521f7cb83d	f75d819f-4338-4444-b604-15b87d5eacee	5	<p>Cocokkanlah antara cabang-cabang pemerintahan utama dengan fungsinya&nbsp;</p>	1	2024-11-12 02:22:28.613515	2024-11-12 02:22:28.613515	\N	t	t	\N	0
f97e9861-3139-4abc-b942-43aed3f0a5d2	f75d819f-4338-4444-b604-15b87d5eacee	5	<p>&nbsp;</p>	1	2024-11-12 02:22:28.624727	2024-11-12 02:22:28.624727	\N	t	t	\N	0
2b6ac970-e172-4169-8bf7-457bf1fa2807	f75d819f-4338-4444-b604-15b87d5eacee	5	<p>&nbsp;</p>	1	2024-11-12 02:22:28.626866	2024-11-12 02:22:28.626866	\N	t	t	\N	0
10625f52-84b4-4f30-9ad5-82b83f4dc077	f75d819f-4338-4444-b604-15b87d5eacee	5	<p>&nbsp;</p>	1	2024-11-12 02:22:28.628996	2024-11-12 02:22:28.628997	\N	t	t	\N	0
4c14c88e-6f71-4400-9968-56cfea29006e	f75d819f-4338-4444-b604-15b87d5eacee	5	<p>&nbsp;</p>	1	2024-11-12 02:22:28.631198	2024-11-12 02:22:28.631198	\N	t	t	\N	0
bb5cb72c-104f-4605-b8ba-96dedf60e568	f75d819f-4338-4444-b604-15b87d5eacee	10	<p>Cocokkan jenis perrangkat keras dibawah ini beserta penjelasan singkatnya&nbsp;</p>	1	2024-11-12 02:22:28.633374	2024-11-12 02:22:28.633375	\N	t	t	\N	0
79d2fa79-b8c9-44ce-a5b3-ab7d322bd2e4	f75d819f-4338-4444-b604-15b87d5eacee	10	<p>&nbsp;</p>	1	2024-11-12 02:22:28.643446	2024-11-12 02:22:28.643446	\N	t	t	\N	0
31363bbf-76ec-400d-9c57-92a02aaf563c	f75d819f-4338-4444-b604-15b87d5eacee	10	<p>&nbsp;</p>	1	2024-11-12 02:22:28.656322	2024-11-12 02:22:28.656322	\N	t	t	\N	0
c9fc00af-63af-4b0a-83d7-92f3bbf324ad	f75d819f-4338-4444-b604-15b87d5eacee	10	<p>&nbsp;</p>	1	2024-11-12 02:22:28.663452	2024-11-12 02:22:28.663452	\N	t	t	\N	0
4fa4633e-4a19-4840-b658-293c8fa1103e	f75d819f-4338-4444-b604-15b87d5eacee	10	<p>&nbsp;</p>	1	2024-11-12 02:22:28.670521	2024-11-12 02:22:28.670521	\N	t	t	\N	0
47cdb9fd-527c-4a8f-ac69-f991eda919ad	f75d819f-4338-4444-b604-15b87d5eacee	8	<p>Dibawah ini ditampilkan pernyataan tentang istilah dalam kedokteran. Centang pada pernyataan benar.&nbsp;</p>	1	2024-11-12 02:22:28.677379	2024-11-12 02:22:28.677379	\N	t	t	\N	0
71755233-fa10-4931-8fc9-6de157c8f59e	f75d819f-4338-4444-b604-15b87d5eacee	8	<p>&nbsp;</p>	1	2024-11-12 02:22:28.678778	2024-11-12 02:22:28.678778	\N	t	t	\N	0
86811d90-4b46-46e5-8028-608de4af4b48	f75d819f-4338-4444-b604-15b87d5eacee	8	<p>&nbsp;</p>	1	2024-11-12 02:22:28.679974	2024-11-12 02:22:28.679974	\N	t	t	\N	0
5b827315-9cd6-4b7b-935a-4ac9d5ef6805	f75d819f-4338-4444-b604-15b87d5eacee	8	<p>&nbsp;</p>	1	2024-11-12 02:22:28.681172	2024-11-12 02:22:28.681172	\N	t	t	\N	0
e5a79f6a-f450-4d2d-8daf-a5c58d166b1e	f75d819f-4338-4444-b604-15b87d5eacee	8	<p>&nbsp;</p>	1	2024-11-12 02:22:28.682357	2024-11-12 02:22:28.682357	\N	t	t	\N	0
7ff912cd-4ffe-4c49-b96c-eb37eea9d942	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p>Siapa yang mendapatkan paten untuk mesin ketik pertama kali? </p>	1	2024-11-11 16:27:00.633886	2024-11-12 04:25:26.162142	\N	t	t	\N	0
76ed9a9d-7080-473e-8136-5f769a0f87da	b132b631-3b5e-4087-b457-1dd4664daed4	1	<p><strong>Story Problem</strong></p><p><strong>Title: The Lost Treasure</strong></p><p>Once upon a time in a small village, three friends named Alex, Mia, and Ben discovered an old map that led to a hidden treasure. The map indicated that the treasure was buried near a giant oak tree in the forest. Excited about their adventure, they decided to go on a treasure hunt the next day.</p><p>Before they set off, they gathered supplies: a flashlight, a compass, some snacks, and a shovel. As they entered the forest, they noticed that the sun was starting to set, and they had to be careful not to get lost. After walking for an hour, they finally found the giant oak tree.</p><p>Suddenly, they heard a rustling sound nearby. Out of the bushes came a huge bear! The friends had to make a quick decision: should they run back to the village or try to scare the bear away?</p><p><strong>What should the friends do next?</strong></p>	1	2024-11-11 16:27:00.638665	2024-11-12 04:28:17.703523	\N	t	t	\N	0
7215700b-1081-406c-88aa-0599781dbd82	31d085d2-069f-41a2-b802-71ba97846911	1	<p>Tanggapan <b><u>penolakan</u></b> di <u>bawah</u> ini yang <i>tepat</i> adalah ….&nbsp;</p>	1	2024-11-12 06:39:51.110201	2024-11-12 06:39:51.110201	\N	t	t	\N	0
1f0fdd75-233a-4f66-8776-2fc5f14436f8	31d085d2-069f-41a2-b802-71ba97846911	4	<p>Benua adalah bagian besar daratan yang dikelilingi oleh air di seluruh sisi. Mereka adalah struktur geografis terbesar di Bumi. &nbsp;</p><p>&nbsp;</p><p>Dibawah ini manakah yang termasuk kedalam benua?&nbsp;</p>	1	2024-11-12 06:39:51.12437	2024-11-12 06:39:51.12437	\N	t	t	\N	0
a25bd701-3ce7-4663-92bd-a0e006298e5f	31d085d2-069f-41a2-b802-71ba97846911	2	<p>Jelaskan secara singkat apa fungsi pantograf pada KRL&nbsp;</p>	1	2024-11-12 06:39:51.132751	2024-11-12 06:39:51.132751	\N	f	t	{"REF_ESAY":"Pantograf pada Kereta Rel Listrik (KRL) berfungsi sebagai alat penghubung antara kereta dengan saluran listrik udara (catenary) di atas rel. Fungsi utama pantograf adalah mengumpulkan energi listrik dari saluran udara dan mentransfernya ke sistem listrik dalam kereta. Dengan cara ini, kereta dapat menggunakan tenaga listrik untuk bergerak, mendukung operasi KRL sebagai sarana transportasi listrik yang efisien. Pantograf biasanya terdiri dari struktur yang dapat mengangkat atau menurunkan dirinya untuk terhubung atau terputus dari saluran listrik udara selama perjalanan."}	0
b9c244f3-cdc0-4040-93ee-0416b2c4c569	31d085d2-069f-41a2-b802-71ba97846911	6	<p>Pada tahun berapa bank dunia didirikan?&nbsp;</p>	1	2024-11-12 06:39:51.133871	2024-11-12 06:39:51.133871	\N	t	t	\N	0
993f10a3-d06a-44ee-95c4-537387bf9a7b	31d085d2-069f-41a2-b802-71ba97846911	5	<p>Cocokkanlah antara cabang-cabang pemerintahan utama dengan fungsinya&nbsp;</p>	1	2024-11-12 06:39:51.135105	2024-11-12 06:39:51.135105	\N	t	t	\N	0
f5d11186-6c18-49c0-b7f7-d602fde843c0	31d085d2-069f-41a2-b802-71ba97846911	10	<p>Cocokkan jenis perrangkat keras dibawah ini beserta penjelasan singkatnya&nbsp;</p>	1	2024-11-12 06:39:51.139612	2024-11-12 06:39:51.139612	\N	t	t	\N	0
09fc2adc-c0c2-435f-a86f-9285ee0eecc5	31d085d2-069f-41a2-b802-71ba97846911	7	<p>Urutkan peristiwa penting dalam sejarah kemerdekaan Indonesia&nbsp;</p>	1	2024-11-12 06:39:51.148897	2024-11-12 06:39:51.148897	\N	t	t	\N	0
829530e9-0188-4c82-bd62-25901c12c60d	31d085d2-069f-41a2-b802-71ba97846911	9	<p>Jawablah argument dibawah ini, sertakan juga alasannya!&nbsp;</p>	1	2024-11-12 06:39:51.1505	2024-11-12 06:39:51.1505	\N	f	t	\N	0
7ec8cf21-50eb-4e4f-8168-ee8e3e5f6053	31d085d2-069f-41a2-b802-71ba97846911	8	<p>Dibawah ini ditampilkan pernyataan tentang istilah dalam kedokteran. Centang pada pernyataan benar.&nbsp;</p>	1	2024-11-12 06:39:51.151748	2024-11-12 06:39:51.151748	\N	t	t	\N	0
5ccc86c5-5eff-4c87-9324-de42a36e316f	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa yang dimaksud dengan sistem komputer?</p>	1	2024-11-11 16:27:00.633886	2024-11-14 00:22:30.618323	\N	t	t	\N	0
0e271d3a-d212-4c72-8626-6571dbc7cb49	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa komponen utama dalam sistem komputer?</p>	1	2024-11-11 16:27:00.638665	2024-11-14 00:23:17.369189	\N	t	t	\N	0
63b05352-932f-4d54-953b-d7f4b9b43aa6	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa fungsi CPU dalam sistem komputer?</p>	1	2024-11-11 16:27:00.644638	2024-11-14 00:24:00.618885	\N	t	t	\N	0
83b9e160-f0b6-4ae4-96ee-52d046ed25de	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa yang dimaksud dengan RAM (Random Access Memory)?</p>	1	2024-11-11 16:27:00.65028	2024-11-14 00:25:00.996294	\N	t	t	\N	0
6856002a-2b9a-446d-91c0-f9f0a190ff88	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Dalam sistem komputer, mana yang merupakan perangkat keras output?</p>	1	2024-11-11 16:27:00.686321	2024-11-14 00:28:34.217267	\N	t	t	\N	0
0138f971-3471-474d-9d4b-587abbe6862b	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Perangkat keras mana yang digunakan untuk memasukkan data/mengetik data ke dalam komputer?</p>	1	2024-11-11 16:27:00.655927	2024-11-14 00:26:13.824557	\N	t	t	\N	0
2fd1a198-78be-4681-955f-588a4bbf9cd8	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Sistem operasi yang paling banyak digunakan pada komputer pribadi adalah…</p>	1	2024-11-11 16:27:00.662216	2024-11-14 00:26:41.534206	\N	t	t	\N	0
7f04a4d2-cd49-4f43-8441-6544319744b6	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa yang dimaksud dengan software?</p>	1	2024-11-11 16:27:00.674134	2024-11-14 00:27:21.013351	\N	t	t	\N	0
c4369bac-489a-4511-a6f2-48896716ec08	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa yang dimaksud dengan perangkat keras input?</p>	1	2024-11-11 16:27:00.679975	2024-11-14 00:27:50.859506	\N	t	t	\N	0
114cf9df-5438-4ff7-a619-ae362ebb26a9	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa yang dimaksud dengan motherboard?</p>	1	2024-11-11 16:27:00.693237	2024-11-14 00:29:04.76402	\N	t	t	\N	0
9561dba1-c8d1-4a11-b572-7efc3f174ac9	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Hard disk berfungsi untuk…</p>	1	2024-11-11 16:27:00.700241	2024-11-14 00:29:35.35355	\N	t	t	\N	0
8771a517-0c13-4281-9cc7-875cf7aa117c	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Prosesor komputer bekerja pada…</p>	1	2024-11-11 16:27:00.70608	2024-11-14 00:30:25.460734	\N	t	t	\N	0
176a1349-82df-456c-8c0e-b263c2289604	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Sistem operasi yang bersifat open-source adalah…</p>	1	2024-11-11 16:27:00.711808	2024-11-14 00:31:00.976413	\N	t	t	\N	0
6dbcba1b-3c74-4ed8-9f87-b71b9fde692f	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa fungsi BIOS pada komputer?</p>	1	2024-11-11 16:27:00.717616	2024-11-14 00:31:31.903055	\N	t	t	\N	0
15f0ada5-02f6-47d4-9e1c-dad4438a6fa8	480f995f-3488-49e2-8a0c-87fd4bdd4367	1	<p>Apa yang dimaksud dengan virtual memory dalam sistem komputer?</p>	1	2024-11-11 16:27:00.72342	2024-11-14 00:32:01.703656	\N	t	t	\N	0
62544478-6ebf-4663-ae8b-f8df950120c2	480f995f-3488-49e2-8a0c-87fd4bdd4367	2	<p>Apa yang dimaksud dengan sistem operasi dalam konteks sistem komputer? Jelaskan berbagai fungsi penting yang dilakukan oleh sistem operasi pada sebuah komputer.</p>	1	2024-11-11 16:27:00.730627	2024-11-14 00:33:52.092408	\N	f	t	{"REF_ESAY":"\\u003cp\\u003eSistem operasi (OS) adalah perangkat lunak yang mengelola perangkat keras dan perangkat lunak lainnya dalam komputer. Fungsi utama sistem operasi adalah untuk memfasilitasi interaksi antara pengguna dan perangkat keras, serta mengatur alur eksekusi program. Berikut adalah beberapa fungsi penting dari sistem operasi:\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eManajemen Proses:\\u003c/strong\\u003e\\u003cbr\\u003eSistem operasi mengelola proses yang berjalan di dalam komputer, termasuk mengalokasikan waktu CPU untuk setiap proses yang aktif dan mengelola komunikasi antar proses.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eManajemen Memori:\\u003c/strong\\u003e\\u003cbr\\u003eOS mengelola memori utama (RAM), mengalokasikan ruang memori untuk proses yang berjalan, dan memastikan bahwa data dan program tidak bertabrakan di dalam memori.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eManajemen Perangkat Keras (Hardware):\\u003c/strong\\u003e\\u003cbr\\u003eSistem operasi bertugas untuk mengelola perangkat keras komputer (seperti hard disk, printer, keyboard, dll.) dan memberikan antarmuka antara perangkat keras dan perangkat lunak. Hal ini dilakukan melalui \\u003cstrong\\u003edriver\\u003c/strong\\u003e perangkat keras.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eManajemen File:\\u003c/strong\\u003e\\u003cbr\\u003eOS mengelola penyimpanan data dalam bentuk file, termasuk menyediakan cara untuk menyimpan, mengakses, memodifikasi, dan menghapus file. OS juga mengatur sistem direktori.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eKeamanan dan Akses Kontrol:\\u003c/strong\\u003e\\u003cbr\\u003eSistem operasi menjaga keamanan data dan sumber daya komputer dengan cara mengatur hak akses pengguna, mengenkripsi data, serta mencegah akses yang tidak sah.\\u003c/p\\u003e"}	0
cc324097-bf2a-4b66-92e7-398c86d88b8c	480f995f-3488-49e2-8a0c-87fd4bdd4367	2	<p>apa yang dimaksud dengan sistem komputer</p>	1	2024-11-11 16:27:00.733005	2024-11-14 00:35:28.766642	\N	f	t	{"REF_ESAY":"\\u003cp\\u003e\\u003cstrong\\u003eSistem komputer\\u003c/strong\\u003e adalah suatu kesatuan yang terdiri dari berbagai komponen perangkat keras (hardware) dan perangkat lunak (software) yang bekerja bersama untuk memproses, menyimpan, dan mengelola data. Sistem komputer memiliki tujuan utama untuk membantu pengguna dalam melakukan berbagai tugas seperti menghitung, memanipulasi data, serta menjalankan aplikasi untuk memecahkan masalah atau menghasilkan informasi.\\u003c/p\\u003e"}	0
5e4f48b5-6d88-49d2-bbfa-f1c2f0e03e2d	480f995f-3488-49e2-8a0c-87fd4bdd4367	2	<p>Jelaskan perbedaan antara perangkat keras (hardware) dan perangkat lunak (software) dalam sistem komputer, serta berikan contoh masing-masing!</p>	1	2024-11-11 16:27:00.729476	2024-11-14 00:32:56.955291	\N	f	t	{"REF_ESAY":"\\u003cp\\u003e\\u003cstrong\\u003ePerangkat Keras (Hardware):\\u003c/strong\\u003e\\u003cbr\\u003ePerangkat keras adalah komponen fisik yang ada dalam sistem komputer yang berfungsi untuk menjalankan dan mendukung sistem komputer. Perangkat keras ini meliputi CPU (Central Processing Unit), RAM (Random Access Memory), hard disk, motherboard, keyboard, monitor, dan perangkat lainnya yang dapat dilihat dan disentuh.\\u003cbr\\u003e\\u003cstrong\\u003eContoh perangkat keras:\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003eCPU (Central Processing Unit)\\u003c/p\\u003e\\u003cp\\u003eRAM (Random Access Memory)\\u003c/p\\u003e\\u003cp\\u003eHard disk\\u003c/p\\u003e\\u003cp\\u003eMonitor\\u003c/p\\u003e\\u003cp\\u003eKeyboard\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003ePerangkat Lunak (Software):\\u003c/strong\\u003e\\u003cbr\\u003ePerangkat lunak adalah program atau aplikasi yang berjalan di atas perangkat keras untuk mengatur dan memproses data. Software tidak memiliki bentuk fisik dan berfungsi untuk memberi instruksi pada perangkat keras agar dapat bekerja sesuai dengan kebutuhan pengguna.\\u003cbr\\u003e\\u003cstrong\\u003eContoh perangkat lunak:\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003eSistem Operasi (misalnya Windows, Linux, macOS)\\u003c/p\\u003e\\u003cp\\u003eAplikasi perkantoran (misalnya Microsoft Word, Excel)\\u003c/p\\u003e\\u003cp\\u003ePerangkat lunak pengolah grafis (misalnya Adobe Photoshop)\\u003c/p\\u003e\\u003cp\\u003ePerangkat lunak pengelola basis data (misalnya MySQL)\\u003c/p\\u003e"}	0
a2ae71f4-c782-4797-a58e-9702cabbfc48	480f995f-3488-49e2-8a0c-87fd4bdd4367	2	<p><strong>Perangkat keras komputer terdiri dari berbagai komponen. Sebutkan dan jelaskan fungsi dari lima komponen perangkat keras utama dalam komputer, seperti CPU, RAM, motherboard, hard disk, dan kartu grafis.</strong></p>	1	2024-11-11 16:27:00.731872	2024-11-14 00:34:18.769605	\N	f	t	{"REF_ESAY":"\\u003cp\\u003e\\u003cstrong\\u003eCPU (Central Processing Unit):\\u003c/strong\\u003e\\u003cbr\\u003eCPU adalah komponen utama yang bertanggung jawab untuk menjalankan instruksi-instruksi dari program komputer. CPU terdiri dari dua bagian utama: \\u003cstrong\\u003eControl Unit (CU)\\u003c/strong\\u003e dan \\u003cstrong\\u003eArithmetic Logic Unit (ALU)\\u003c/strong\\u003e. CU mengontrol alur data dan instruksi, sementara ALU melakukan operasi aritmatika dan logika.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eRAM (Random Access Memory):\\u003c/strong\\u003e\\u003cbr\\u003eRAM adalah memori sementara yang digunakan untuk menyimpan data dan program yang sedang dijalankan. Semakin besar kapasitas RAM, semakin banyak aplikasi atau data yang dapat dijalankan secara bersamaan tanpa memperlambat kinerja komputer.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eMotherboard:\\u003c/strong\\u003e\\u003cbr\\u003eMotherboard adalah papan sirkuit utama dalam komputer yang menghubungkan semua komponen perangkat keras seperti CPU, RAM, hard disk, kartu grafis, dan perangkat lainnya. Motherboard juga menyediakan jalur komunikasi antara komponen-komponen tersebut.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eHard Disk (HDD atau SSD):\\u003c/strong\\u003e\\u003cbr\\u003eHard disk adalah perangkat penyimpanan permanen yang digunakan untuk menyimpan data, program, dan sistem operasi. Hard disk terdiri dari dua jenis: \\u003cstrong\\u003eHDD (Hard Disk Drive)\\u003c/strong\\u003e yang menggunakan piringan magnetik, dan \\u003cstrong\\u003eSSD (Solid State Drive)\\u003c/strong\\u003e yang lebih cepat karena tidak memiliki bagian bergerak.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eKartu Grafis (GPU):\\u003c/strong\\u003e\\u003cbr\\u003eKartu grafis bertanggung jawab untuk memproses dan menghasilkan tampilan visual pada monitor. GPU mengolah data grafis dan memungkinkan pemrosesan gambar yang lebih cepat, terutama untuk aplikasi berat seperti game atau software desain grafis.\\u003c/p\\u003e"}	0
6d32f96c-cdc1-416d-8988-b7067c716ddc	480f995f-3488-49e2-8a0c-87fd4bdd4367	2	<p>Apa yang dimaksud dengan virtual memory dalam sistem komputer? Jelaskan bagaimana virtual memory bekerja dan mengapa hal ini penting dalam meningkatkan kinerja sistem komputer.</p>	1	2024-11-11 16:27:00.734146	2024-11-14 00:34:44.908282	\N	f	t	{"REF_ESAY":"\\u003cp\\u003eVirtual memory adalah teknik yang digunakan oleh sistem operasi untuk memperluas kapasitas memori komputer dengan menggunakan ruang pada hard disk sebagai pengganti sementara untuk RAM. Ini memungkinkan komputer untuk menjalankan lebih banyak aplikasi sekaligus meskipun kapasitas RAM fisik terbatas.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eCara kerja virtual memory:\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003eSwap File/Page File:\\u003c/strong\\u003e\\u003cbr\\u003eKetika RAM penuh, sistem operasi akan memindahkan data atau program yang tidak aktif ke ruang penyimpanan sementara di hard disk yang disebut dengan swap file atau page file. Ini memberi ruang untuk data atau aplikasi yang sedang aktif di RAM.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003ePaging:\\u003c/strong\\u003e\\u003cbr\\u003eData dalam memori dibagi menjadi blok-blok kecil yang disebut halaman (pages). Ketika RAM tidak cukup, bagian-bagian dari halaman ini akan dipindahkan ke disk, dan saat dibutuhkan kembali, halaman tersebut akan dimuat ulang ke RAM.\\u003c/p\\u003e\\u003cp\\u003e\\u003cstrong\\u003ePentingnya virtual memory:\\u003c/strong\\u003e\\u003c/p\\u003e\\u003cp\\u003eMemungkinkan komputer untuk menjalankan lebih banyak program sekaligus, meskipun kapasitas RAM terbatas.\\u003c/p\\u003e\\u003cp\\u003eMeningkatkan efisiensi penggunaan sumber daya sistem.\\u003c/p\\u003e\\u003cp\\u003eMencegah program dari mengalami crash karena kekurangan memori.\\u003c/p\\u003e"}	0
456ccd3d-de1a-46a7-af7f-cd91aaee59a2	480f995f-3488-49e2-8a0c-87fd4bdd4367	4	<p>Komponen perangkat keras berikut ini berfungsi untuk memproses data dan menjalankan instruksi program, kecuali:</p>	0	2024-11-14 04:08:38.109663	2024-11-14 04:10:56.005524	\N	t	t	\N	0
626331d5-d73c-4831-87f4-c133b356fd9b	480f995f-3488-49e2-8a0c-87fd4bdd4367	4	<p>Pilih dua komponen berikut yang termasuk dalam perangkat keras penyimpanan data:</p>	0	2024-11-14 04:12:02.09529	2024-11-14 04:12:02.09529	\N	t	t	\N	0
042023ce-7072-4ba0-bf5e-1a4ac9aac9e0	480f995f-3488-49e2-8a0c-87fd4bdd4367	4	<p>Manakah dari berikut ini yang termasuk dalam fungsi dari memori RAM dalam sistem komputer?</p>	0	2024-11-14 04:12:58.922587	2024-11-14 04:12:58.922587	\N	t	t	\N	0
a1059bdc-6dac-4957-8624-416a10caa316	480f995f-3488-49e2-8a0c-87fd4bdd4367	4	<p>Manakah dari komponen berikut yang termasuk dalam unit pemrosesan pusat (CPU)? Pilihlah semua yang benar.</p>	0	2024-11-14 04:28:24.49786	2024-11-14 04:28:24.49786	\N	t	t	\N	0
fa13afba-51bb-4203-a2b7-3fafdf4f8ed1	480f995f-3488-49e2-8a0c-87fd4bdd4367	4	<p>Apa saja yang termasuk dalam kategori perangkat keras input? Pilihlah semua yang benar.</p>	0	2024-11-14 04:29:33.778963	2024-11-14 04:29:33.778963	\N	t	t	\N	0
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, token, status, created_at, updated_at, expired_at) FROM stdin;
fdc6e128-0a3f-487c-9ca7-432712850b72	PPIP	1	2024-11-14 06:32:48	2024-11-14 06:32:48	2024-11-14 06:47:48
9976db4a-4ab3-4ac1-ae27-0bc7b671ae45	4XIG	0	2024-11-14 01:16:45	2024-11-14 06:33:59	2024-11-14 01:31:45
df30bea7-5002-4dad-920b-6d82133dbe26	XGIF	0	2024-04-27 03:03:15	2024-11-14 06:33:59	2024-04-27 03:11:35
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role, created_at, updated_at) FROM stdin;
3bdf7c0e-c22e-4643-869e-10dd8ea25b4d	Senandika Selesa	admin@shellrean.id	$2y$10$ZBv9j2Pm6eqBDGFrEXr3V.a.TE5AnPEOH30qcJdIg00jQnkX0U75K	EVIL	2023-08-13 20:49:43	2023-11-13 09:32:23
14a81f7d-1fc5-4cad-9d76-08177911a33e	Guru IPA 	Ipa@email.com	$2a$12$6/hEbD3MSBfhuPujicpIlObT61aQw19rlfJKR3wIG.zHcpacPUy4u	EVAL	2024-10-19 11:37:14	\N
d1d3d21b-df86-4b47-abfc-e2a9240aaab5	admin 	admin@gmail.com	$2a$12$f1Rh7qj3XYRIQ3l6riqrIeNoyoqTZUGfRi3IzEW3GSDF6Xs1vuPKu	EVIL	2024-10-19 11:35:33	2024-11-12 02:32:36
\.


--
-- Name: exo_backups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exo_backups_id_seq', 1, true);


--
-- Name: feature_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feature_infos_id_seq', 32, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 164, true);


--
-- Name: agamas agamas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agamas
    ADD CONSTRAINT agamas_pkey PRIMARY KEY (id);


--
-- Name: banksoal_chains banksoal_chains_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banksoal_chains
    ADD CONSTRAINT banksoal_chains_pk PRIMARY KEY (id);


--
-- Name: banksoal_summaries banksoal_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banksoal_summaries
    ADD CONSTRAINT banksoal_summaries_pkey PRIMARY KEY (id);


--
-- Name: banksoals banksoals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banksoals
    ADD CONSTRAINT banksoals_pkey PRIMARY KEY (id);


--
-- Name: competence_items competence_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competence_items
    ADD CONSTRAINT competence_items_pkey PRIMARY KEY (id);


--
-- Name: competences competences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competences
    ADD CONSTRAINT competences_pkey PRIMARY KEY (id);


--
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: medias directories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT directories_pkey PRIMARY KEY (id);


--
-- Name: ecosystem_keys ecosystem_keys_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecosystem_keys
    ADD CONSTRAINT ecosystem_keys_pk PRIMARY KEY (id);


--
-- Name: events event_ujians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT event_ujians_pkey PRIMARY KEY (id);


--
-- Name: backups exo_backups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.backups
    ADD CONSTRAINT exo_backups_pkey PRIMARY KEY (id);


--
-- Name: feature_infos feature_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feature_infos
    ADD CONSTRAINT feature_infos_pkey PRIMARY KEY (id);


--
-- Name: group_members group_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_pkey PRIMARY KEY (id);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: hasil_ujians hasil_ujians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hasil_ujians
    ADD CONSTRAINT hasil_ujians_pkey PRIMARY KEY (id);


--
-- Name: jadwals_peserta jadwals_peserta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jadwals_peserta
    ADD CONSTRAINT jadwals_peserta_pkey PRIMARY KEY (id);


--
-- Name: jadwals jadwals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jadwals
    ADD CONSTRAINT jadwals_pkey PRIMARY KEY (id);


--
-- Name: jawaban_pesertas jawaban_pesertas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jawaban_pesertas
    ADD CONSTRAINT jawaban_pesertas_pkey PRIMARY KEY (id);


--
-- Name: jawaban_soals jawaban_soals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jawaban_soals
    ADD CONSTRAINT jawaban_soals_pkey PRIMARY KEY (id);


--
-- Name: jurusans jurusans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jurusans
    ADD CONSTRAINT jurusans_pkey PRIMARY KEY (id);


--
-- Name: jurusans kode; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jurusans
    ADD CONSTRAINT kode UNIQUE (kode);


--
-- Name: matpels matpels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matpels
    ADD CONSTRAINT matpels_pkey PRIMARY KEY (id);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (code);


--
-- Name: check_answers penilaian_argument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.check_answers
    ADD CONSTRAINT penilaian_argument_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: pesertas pesertas_no_ujian_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesertas
    ADD CONSTRAINT pesertas_no_ujian_unique UNIQUE (no_ujian);


--
-- Name: pesertas pesertas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesertas
    ADD CONSTRAINT pesertas_pkey PRIMARY KEY (id);


--
-- Name: room_members room_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room_members
    ADD CONSTRAINT room_members_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: sesi_schedules sesi_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sesi_schedules
    ADD CONSTRAINT sesi_schedules_pkey PRIMARY KEY (id);


--
-- Name: settings settings_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_code_key UNIQUE (code);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (code);


--
-- Name: siswa_ujians siswa_ujians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siswa_ujians
    ADD CONSTRAINT siswa_ujians_pkey PRIMARY KEY (id);


--
-- Name: soal_summaries soal_summaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soal_summaries
    ADD CONSTRAINT soal_summaries_pkey PRIMARY KEY (id);


--
-- Name: soals soals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soals
    ADD CONSTRAINT soals_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: agamas_kode_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agamas_kode_index ON public.agamas USING btree (kode);


--
-- Name: feature_infos_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX feature_infos_name_index ON public.feature_infos USING btree (name);


--
-- Name: group_members_group_id_student_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX group_members_group_id_student_id_index ON public.group_members USING btree (group_id, student_id);


--
-- Name: groups_parent_id_name_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX groups_parent_id_name_index ON public.groups USING btree (parent_id, name);


--
-- Name: hasil_ujians_banksoal_id_peserta_id_jadwal_id_ujian_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX hasil_ujians_banksoal_id_peserta_id_jadwal_id_ujian_id_index ON public.hasil_ujians USING btree (banksoal_id, peserta_id, jadwal_id, ujian_id);


--
-- Name: jadwals_tanggal_status_ujian_event_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jadwals_tanggal_status_ujian_event_id_index ON public.jadwals USING btree (tanggal, status_ujian, event_id);


--
-- Name: jawaban_pesertas_banksoal_id_soal_id_peserta_id_jadwal_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jawaban_pesertas_banksoal_id_soal_id_peserta_id_jadwal_id_index ON public.jawaban_pesertas USING btree (banksoal_id, soal_id, peserta_id, jadwal_id);


--
-- Name: jawaban_soals_soal_id_correct_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jawaban_soals_soal_id_correct_index ON public.jawaban_soals USING btree (soal_id, correct);


--
-- Name: jurusans_kode_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jurusans_kode_index ON public.jurusans USING btree (kode);


--
-- Name: matpels_kode_mapel_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX matpels_kode_mapel_index ON public.matpels USING btree (kode_mapel);


--
-- Name: penilaian_argument_banksoal_id_peserta_id_jawab_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX penilaian_argument_banksoal_id_peserta_id_jawab_id_index ON public.check_answers USING btree (banksoal_id, peserta_id, jawab_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: pesertas_no_ujian_api_token_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pesertas_no_ujian_api_token_index ON public.pesertas USING btree (no_ujian, api_token);


--
-- Name: sesi_schedules_jadwal_id_sesi_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sesi_schedules_jadwal_id_sesi_index ON public.sesi_schedules USING btree (jadwal_id, sesi);


--
-- Name: siswa_ujians_peserta_id_jadwal_id_status_ujian_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX siswa_ujians_peserta_id_jadwal_id_status_ujian_index ON public.siswa_ujians USING btree (peserta_id, jadwal_id, status_ujian);


--
-- Name: soals_banksoal_id_tipe_soal_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX soals_banksoal_id_tipe_soal_index ON public.soals USING btree (banksoal_id, tipe_soal);


--
-- Name: users_email_role_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX users_email_role_index ON public.users USING btree (email, role);


--
-- PostgreSQL database dump complete
--

