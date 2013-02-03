--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authens; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authens (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255),
    uid character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authens_id_seq OWNED BY authens.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    post_id integer,
    body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    latitude double precision,
    longitude double precision,
    gmaps boolean,
    post_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    address text
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying(255),
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    news_photo_file_name character varying(255),
    news_photo_content_type character varying(255),
    news_photo_file_size integer,
    news_photo_updated_at timestamp without time zone,
    user_id integer
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    password_digest character varying(255),
    display_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    comments_count integer DEFAULT 0
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authens ALTER COLUMN id SET DEFAULT nextval('authens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: authens_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authens
    ADD CONSTRAINT authens_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_post_id ON comments USING btree (post_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: comments_post_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_post_id_fk FOREIGN KEY (post_id) REFERENCES posts(id);


--
-- Name: comments_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: locations_post_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_post_id_fk FOREIGN KEY (post_id) REFERENCES posts(id);


--
-- Name: posts_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_user_id_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20120317182110');

INSERT INTO schema_migrations (version) VALUES ('20120317183107');

INSERT INTO schema_migrations (version) VALUES ('20120323042626');

INSERT INTO schema_migrations (version) VALUES ('20120407050241');

INSERT INTO schema_migrations (version) VALUES ('20120407145015');

INSERT INTO schema_migrations (version) VALUES ('20120505071410');

INSERT INTO schema_migrations (version) VALUES ('20120513143012');

INSERT INTO schema_migrations (version) VALUES ('20120609034518');

INSERT INTO schema_migrations (version) VALUES ('20120908074158');