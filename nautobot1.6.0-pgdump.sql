--
-- PostgreSQL database dump
--

-- Dumped from database version 13.20
-- Dumped by pg_dump version 13.20

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO nautobot;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO nautobot;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO nautobot;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO nautobot;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO nautobot;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO nautobot;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    config_data jsonb NOT NULL
);


ALTER TABLE public.auth_user OWNER TO nautobot;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO nautobot;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO nautobot;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO nautobot;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO nautobot;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_circuit (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    cid character varying(100) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id uuid NOT NULL,
    status_id uuid,
    tenant_id uuid,
    type_id uuid NOT NULL,
    termination_a_id uuid,
    termination_z_id uuid,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO nautobot;

--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_circuittermination (
    id uuid NOT NULL,
    _cable_peer_id uuid,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    circuit_id uuid NOT NULL,
    site_id uuid,
    provider_network_id uuid,
    _custom_field_data jsonb NOT NULL,
    created date,
    last_updated timestamp with time zone,
    location_id uuid,
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO nautobot;

--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_circuittype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO nautobot;

--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_provider (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(100) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO nautobot;

--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_providernetwork (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id uuid NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO nautobot;

--
-- Name: constance_config; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.constance_config (
    id integer NOT NULL,
    key character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.constance_config OWNER TO nautobot;

--
-- Name: constance_config_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.constance_config_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constance_config_id_seq OWNER TO nautobot;

--
-- Name: constance_config_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.constance_config_id_seq OWNED BY public.constance_config.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_cable (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    termination_a_id uuid NOT NULL,
    termination_b_id uuid NOT NULL,
    type character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length smallint,
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id uuid,
    _termination_b_device_id uuid,
    status_id uuid,
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    CONSTRAINT dcim_cable_length_check CHECK ((length >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO nautobot;

--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_cablepath (
    id uuid NOT NULL,
    origin_id uuid NOT NULL,
    destination_id uuid,
    path jsonb NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL
);


ALTER TABLE public.dcim_cablepath OWNER TO nautobot;

--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleport OWNER TO nautobot;

--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO nautobot;

--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleserverport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleserverport OWNER TO nautobot;

--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO nautobot;

--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_device (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    local_context_data jsonb,
    local_context_data_owner_object_id uuid,
    name character varying(64),
    _name character varying(100),
    serial character varying(255) NOT NULL,
    asset_tag character varying(100),
    "position" smallint,
    face character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id uuid,
    device_role_id uuid NOT NULL,
    device_type_id uuid NOT NULL,
    local_context_data_owner_content_type_id integer,
    platform_id uuid,
    primary_ip4_id uuid,
    primary_ip6_id uuid,
    rack_id uuid,
    site_id uuid NOT NULL,
    status_id uuid,
    tenant_id uuid,
    virtual_chassis_id uuid,
    local_context_schema_id uuid,
    secrets_group_id uuid,
    location_id uuid,
    device_redundancy_group_priority smallint,
    device_redundancy_group_id uuid,
    CONSTRAINT dcim_device_device_redundancy_group_priority_check CHECK ((device_redundancy_group_priority >= 0)),
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO nautobot;

--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicebay (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id uuid NOT NULL,
    installed_device_id uuid,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_devicebay OWNER TO nautobot;

--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicebaytemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO nautobot;

--
-- Name: dcim_deviceredundancygroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_deviceredundancygroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    failover_strategy character varying(50) NOT NULL,
    comments text NOT NULL,
    secrets_group_id uuid,
    status_id uuid
);


ALTER TABLE public.dcim_deviceredundancygroup OWNER TO nautobot;

--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicerole (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO nautobot;

--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicetype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id uuid NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO nautobot;

--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_frontport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id uuid,
    device_id uuid NOT NULL,
    rear_port_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO nautobot;

--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_frontporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id uuid NOT NULL,
    rear_port_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO nautobot;

--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interface (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    enabled boolean NOT NULL,
    mac_address character varying(18),
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    lag_id uuid,
    untagged_vlan_id uuid,
    status_id uuid,
    parent_interface_id uuid,
    bridge_id uuid,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO nautobot;

--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id bigint NOT NULL,
    interface_id uuid NOT NULL,
    vlan_id uuid NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO nautobot;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO nautobot;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfaceredundancygroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interfaceredundancygroup (
    id uuid NOT NULL,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    created timestamp with time zone NOT NULL,
    description character varying(200) NOT NULL,
    protocol character varying(50) NOT NULL,
    protocol_group_id character varying(50) NOT NULL,
    secrets_group_id uuid,
    status_id uuid,
    virtual_ip_id uuid
);


ALTER TABLE public.dcim_interfaceredundancygroup OWNER TO nautobot;

--
-- Name: dcim_interfaceredundancygroupassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interfaceredundancygroupassociation (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    priority smallint NOT NULL,
    interface_id uuid NOT NULL,
    interface_redundancy_group_id uuid NOT NULL,
    CONSTRAINT dcim_interfaceredundancygroupassociation_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.dcim_interfaceredundancygroupassociation OWNER TO nautobot;

--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interfacetemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO nautobot;

--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_inventoryitem (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(255) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id uuid NOT NULL,
    manufacturer_id uuid,
    parent_id uuid,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO nautobot;

--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_location (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    location_type_id uuid NOT NULL,
    parent_id uuid,
    site_id uuid,
    status_id uuid,
    tenant_id uuid
);


ALTER TABLE public.dcim_location OWNER TO nautobot;

--
-- Name: dcim_locationtype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_locationtype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    parent_id uuid,
    nestable boolean NOT NULL
);


ALTER TABLE public.dcim_locationtype OWNER TO nautobot;

--
-- Name: dcim_locationtype_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_locationtype_content_types (
    id bigint NOT NULL,
    locationtype_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.dcim_locationtype_content_types OWNER TO nautobot;

--
-- Name: dcim_locationtype_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.dcim_locationtype_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_locationtype_content_types_id_seq OWNER TO nautobot;

--
-- Name: dcim_locationtype_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.dcim_locationtype_content_types_id_seq OWNED BY public.dcim_locationtype_content_types.id;


--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_manufacturer (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO nautobot;

--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_platform (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id uuid,
    network_driver character varying(100) NOT NULL
);


ALTER TABLE public.dcim_platform OWNER TO nautobot;

--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerfeed (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    _cable_peer_id uuid,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    power_panel_id uuid NOT NULL,
    rack_id uuid,
    status_id uuid,
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO nautobot;

--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_poweroutlet (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    power_port_id uuid,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_poweroutlet OWNER TO nautobot;

--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_poweroutlettemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    power_port_id uuid,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO nautobot;

--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerpanel (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    rack_group_id uuid,
    site_id uuid NOT NULL,
    location_id uuid
);


ALTER TABLE public.dcim_powerpanel OWNER TO nautobot;

--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO nautobot;

--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO nautobot;

--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rack (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    serial character varying(255) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    group_id uuid,
    role_id uuid,
    site_id uuid NOT NULL,
    status_id uuid,
    tenant_id uuid,
    location_id uuid,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO nautobot;

--
-- Name: dcim_rackgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackgroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    site_id uuid NOT NULL,
    location_id uuid,
    CONSTRAINT dcim_rackgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_rackgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_rackgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_rackgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_rackgroup OWNER TO nautobot;

--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackreservation (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    units jsonb NOT NULL,
    description character varying(200) NOT NULL,
    rack_id uuid NOT NULL,
    tenant_id uuid,
    user_id uuid NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO nautobot;

--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackrole (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO nautobot;

--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rearport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id uuid,
    device_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO nautobot;

--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rearporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO nautobot;

--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_region (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO nautobot;

--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_site (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    contact_email character varying(254) NOT NULL,
    comments text NOT NULL,
    region_id uuid,
    status_id uuid,
    tenant_id uuid
);


ALTER TABLE public.dcim_site OWNER TO nautobot;

--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_virtualchassis (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id uuid
);


ALTER TABLE public.dcim_virtualchassis OWNER TO nautobot;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO nautobot;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO nautobot;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_clockedschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_crontabschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_intervalschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO nautobot;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_periodictask_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO nautobot;

--
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO nautobot;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_beat_solarschedule_id_seq OWNER TO nautobot;

--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO nautobot;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO nautobot;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO nautobot;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO nautobot;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO nautobot;

--
-- Name: extras_computedfield; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_computedfield (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    slug character varying(100) NOT NULL,
    label character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template text NOT NULL,
    fallback_value character varying(500) NOT NULL,
    weight smallint NOT NULL,
    content_type_id integer NOT NULL,
    advanced_ui boolean NOT NULL,
    CONSTRAINT extras_computedfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_computedfield OWNER TO nautobot;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    owner_object_id uuid,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    owner_content_type_id integer,
    schema_id uuid,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO nautobot;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    clustergroup_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO nautobot;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_clusters (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    cluster_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO nautobot;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_redundancy_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_device_redundancy_groups (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    deviceredundancygroup_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_device_redundancy_groups OWNER TO nautobot;

--
-- Name: extras_configcontext_device_redundancy_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_device_redundancy_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_redundancy_groups_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_device_redundancy_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_device_redundancy_groups_id_seq OWNED BY public.extras_configcontext_device_redundancy_groups.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_device_types (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    devicetype_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO nautobot;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_dynamic_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_dynamic_groups (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    dynamicgroup_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_dynamic_groups OWNER TO nautobot;

--
-- Name: extras_configcontext_dynamic_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_dynamic_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_dynamic_groups_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_dynamic_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_dynamic_groups_id_seq OWNED BY public.extras_configcontext_dynamic_groups.id;


--
-- Name: extras_configcontext_locations; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_locations (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    location_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_locations OWNER TO nautobot;

--
-- Name: extras_configcontext_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_locations_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_locations_id_seq OWNED BY public.extras_configcontext_locations.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_platforms (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    platform_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO nautobot;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_regions (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    region_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO nautobot;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_roles (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    devicerole_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO nautobot;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_sites (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    site_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO nautobot;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_tags (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO nautobot;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    tenantgroup_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO nautobot;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_tenants (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    tenant_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO nautobot;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_configcontextschema; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontextschema (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(200) NOT NULL,
    description character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    data_schema jsonb NOT NULL,
    owner_object_id uuid,
    owner_content_type_id integer
);


ALTER TABLE public.extras_configcontextschema OWNER TO nautobot;

--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfield (
    id uuid NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum bigint,
    validation_maximum bigint,
    validation_regex character varying(500) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    advanced_ui boolean NOT NULL,
    slug character varying(100) NOT NULL,
    "grouping" character varying(255) NOT NULL,
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO nautobot;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfield_content_types (
    id bigint NOT NULL,
    customfield_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO nautobot;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfieldchoice; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfieldchoice (
    id uuid NOT NULL,
    value character varying(100) NOT NULL,
    weight smallint NOT NULL,
    field_id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customfieldchoice_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfieldchoice OWNER TO nautobot;

--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customlink (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    text character varying(500) NOT NULL,
    target_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO nautobot;

--
-- Name: extras_dynamicgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_dynamicgroup (
    _custom_field_data jsonb NOT NULL,
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    filter jsonb NOT NULL,
    content_type_id integer NOT NULL
);


ALTER TABLE public.extras_dynamicgroup OWNER TO nautobot;

--
-- Name: extras_dynamicgroupmembership; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_dynamicgroupmembership (
    id uuid NOT NULL,
    operator character varying(12) NOT NULL,
    weight smallint NOT NULL,
    group_id uuid NOT NULL,
    parent_group_id uuid NOT NULL,
    CONSTRAINT extras_dynamicgroupmembership_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_dynamicgroupmembership OWNER TO nautobot;

--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_exporttemplate (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    owner_object_id uuid,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    content_type_id integer NOT NULL,
    owner_content_type_id integer
);


ALTER TABLE public.extras_exporttemplate OWNER TO nautobot;

--
-- Name: extras_fileattachment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_fileattachment (
    id uuid NOT NULL,
    bytes bytea NOT NULL,
    filename character varying(255) NOT NULL,
    mimetype character varying(255) NOT NULL
);


ALTER TABLE public.extras_fileattachment OWNER TO nautobot;

--
-- Name: extras_fileproxy; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_fileproxy (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    uploaded_at timestamp with time zone NOT NULL
);


ALTER TABLE public.extras_fileproxy OWNER TO nautobot;

--
-- Name: extras_gitrepository; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_gitrepository (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    remote_url character varying(255) NOT NULL,
    branch character varying(64) NOT NULL,
    current_head character varying(48) NOT NULL,
    _token bytea NOT NULL,
    username character varying(64) NOT NULL,
    provided_contents jsonb NOT NULL,
    secrets_group_id uuid
);


ALTER TABLE public.extras_gitrepository OWNER TO nautobot;

--
-- Name: extras_graphqlquery; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_graphqlquery (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    query text NOT NULL,
    variables jsonb NOT NULL
);


ALTER TABLE public.extras_graphqlquery OWNER TO nautobot;

--
-- Name: extras_healthchecktestmodel; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_healthchecktestmodel (
    id uuid NOT NULL,
    title character varying(128) NOT NULL
);


ALTER TABLE public.extras_healthchecktestmodel OWNER TO nautobot;

--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_imageattachment (
    id uuid NOT NULL,
    object_id uuid NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO nautobot;

--
-- Name: extras_job; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_job (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    source character varying(16) NOT NULL,
    module_name character varying(100) NOT NULL,
    job_class_name character varying(100) NOT NULL,
    slug character varying(320) NOT NULL,
    "grouping" character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    installed boolean NOT NULL,
    enabled boolean NOT NULL,
    commit_default boolean NOT NULL,
    hidden boolean NOT NULL,
    read_only boolean NOT NULL,
    approval_required boolean NOT NULL,
    soft_time_limit double precision NOT NULL,
    time_limit double precision NOT NULL,
    grouping_override boolean NOT NULL,
    name_override boolean NOT NULL,
    description_override boolean NOT NULL,
    commit_default_override boolean NOT NULL,
    hidden_override boolean NOT NULL,
    read_only_override boolean NOT NULL,
    approval_required_override boolean NOT NULL,
    soft_time_limit_override boolean NOT NULL,
    time_limit_override boolean NOT NULL,
    git_repository_id uuid,
    has_sensitive_variables boolean NOT NULL,
    has_sensitive_variables_override boolean NOT NULL,
    is_job_hook_receiver boolean NOT NULL,
    task_queues jsonb NOT NULL,
    task_queues_override boolean NOT NULL,
    is_job_button_receiver boolean NOT NULL
);


ALTER TABLE public.extras_job OWNER TO nautobot;

--
-- Name: extras_jobbutton; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobbutton (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    text character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    confirmation boolean NOT NULL,
    job_id uuid NOT NULL,
    CONSTRAINT extras_jobbutton_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_jobbutton OWNER TO nautobot;

--
-- Name: extras_jobbutton_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobbutton_content_types (
    id bigint NOT NULL,
    jobbutton_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_jobbutton_content_types OWNER TO nautobot;

--
-- Name: extras_jobbutton_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_jobbutton_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobbutton_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_jobbutton_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_jobbutton_content_types_id_seq OWNED BY public.extras_jobbutton_content_types.id;


--
-- Name: extras_jobhook; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobhook (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    enabled boolean NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    type_create boolean NOT NULL,
    type_delete boolean NOT NULL,
    type_update boolean NOT NULL,
    job_id uuid NOT NULL
);


ALTER TABLE public.extras_jobhook OWNER TO nautobot;

--
-- Name: extras_jobhook_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobhook_content_types (
    id bigint NOT NULL,
    jobhook_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_jobhook_content_types OWNER TO nautobot;

--
-- Name: extras_jobhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_jobhook_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobhook_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_jobhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_jobhook_content_types_id_seq OWNED BY public.extras_jobhook_content_types.id;


--
-- Name: extras_joblogentry; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_joblogentry (
    id uuid NOT NULL,
    log_level character varying(32) NOT NULL,
    "grouping" character varying(100) NOT NULL,
    message text NOT NULL,
    created timestamp with time zone NOT NULL,
    log_object character varying(200),
    absolute_url character varying(255),
    job_result_id uuid NOT NULL
);


ALTER TABLE public.extras_joblogentry OWNER TO nautobot;

--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobresult (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id uuid,
    _custom_field_data jsonb NOT NULL,
    schedule_id uuid,
    job_model_id uuid,
    job_kwargs jsonb
);


ALTER TABLE public.extras_jobresult OWNER TO nautobot;

--
-- Name: extras_note; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_note (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    assigned_object_id uuid NOT NULL,
    user_name character varying(150) NOT NULL,
    slug character varying(100) NOT NULL,
    note text NOT NULL,
    assigned_object_type_id integer NOT NULL,
    user_id uuid
);


ALTER TABLE public.extras_note OWNER TO nautobot;

--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_objectchange (
    id uuid NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id uuid NOT NULL,
    related_object_id uuid,
    object_repr character varying(200) NOT NULL,
    object_data jsonb NOT NULL,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id uuid,
    object_data_v2 jsonb,
    change_context character varying(50) NOT NULL,
    change_context_detail character varying(400) NOT NULL
);


ALTER TABLE public.extras_objectchange OWNER TO nautobot;

--
-- Name: extras_relationship; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_relationship (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    source_label character varying(50) NOT NULL,
    source_hidden boolean NOT NULL,
    source_filter jsonb,
    destination_label character varying(50) NOT NULL,
    destination_hidden boolean NOT NULL,
    destination_filter jsonb,
    destination_type_id integer NOT NULL,
    source_type_id integer NOT NULL,
    advanced_ui boolean NOT NULL,
    required_on character varying(12) NOT NULL
);


ALTER TABLE public.extras_relationship OWNER TO nautobot;

--
-- Name: extras_relationshipassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_relationshipassociation (
    id uuid NOT NULL,
    source_id uuid NOT NULL,
    destination_id uuid NOT NULL,
    destination_type_id integer NOT NULL,
    relationship_id uuid NOT NULL,
    source_type_id integer NOT NULL
);


ALTER TABLE public.extras_relationshipassociation OWNER TO nautobot;

--
-- Name: extras_scheduledjob; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_scheduledjob (
    id uuid NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    job_class character varying(255) NOT NULL,
    "interval" character varying(255) NOT NULL,
    args jsonb NOT NULL,
    kwargs jsonb NOT NULL,
    queue character varying(200),
    one_off boolean NOT NULL,
    start_time timestamp with time zone NOT NULL,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    approval_required boolean NOT NULL,
    approved_at timestamp with time zone,
    approved_by_user_id uuid,
    user_id uuid,
    job_model_id uuid,
    crontab character varying(255) NOT NULL,
    CONSTRAINT extras_scheduledjob_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.extras_scheduledjob OWNER TO nautobot;

--
-- Name: extras_scheduledjobs; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_scheduledjobs (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.extras_scheduledjobs OWNER TO nautobot;

--
-- Name: extras_secret; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secret (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    provider character varying(100) NOT NULL,
    parameters jsonb NOT NULL
);


ALTER TABLE public.extras_secret OWNER TO nautobot;

--
-- Name: extras_secretsgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secretsgroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_secretsgroup OWNER TO nautobot;

--
-- Name: extras_secretsgroupassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secretsgroupassociation (
    id uuid NOT NULL,
    access_type character varying(32) NOT NULL,
    secret_type character varying(32) NOT NULL,
    group_id uuid NOT NULL,
    secret_id uuid NOT NULL
);


ALTER TABLE public.extras_secretsgroupassociation OWNER TO nautobot;

--
-- Name: extras_status; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_status (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(50) NOT NULL,
    color character varying(6) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_status OWNER TO nautobot;

--
-- Name: extras_status_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_status_content_types (
    id bigint NOT NULL,
    status_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_status_content_types OWNER TO nautobot;

--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_status_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_status_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_status_content_types_id_seq OWNED BY public.extras_status_content_types.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO nautobot;

--
-- Name: extras_tag_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_tag_content_types (
    id bigint NOT NULL,
    tag_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_tag_content_types OWNER TO nautobot;

--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_tag_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_tag_content_types_id_seq OWNED BY public.extras_tag_content_types.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_taggeditem (
    id uuid NOT NULL,
    object_id uuid NOT NULL,
    content_type_id integer NOT NULL,
    tag_id uuid NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO nautobot;

--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_webhook (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096)
);


ALTER TABLE public.extras_webhook OWNER TO nautobot;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_webhook_content_types (
    id bigint NOT NULL,
    webhook_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO nautobot;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_aggregate (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    network bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id uuid NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_aggregate OWNER TO nautobot;

--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_ipaddress (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    host bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id uuid,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id uuid,
    status_id uuid,
    tenant_id uuid,
    vrf_id uuid
);


ALTER TABLE public.ipam_ipaddress OWNER TO nautobot;

--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_prefix (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    network bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id uuid,
    site_id uuid,
    status_id uuid,
    tenant_id uuid,
    vlan_id uuid,
    vrf_id uuid,
    location_id uuid
);


ALTER TABLE public.ipam_prefix OWNER TO nautobot;

--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_rir (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO nautobot;

--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_role (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO nautobot;

--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_routetarget (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_routetarget OWNER TO nautobot;

--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_service (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports jsonb NOT NULL,
    description character varying(200) NOT NULL,
    device_id uuid,
    virtual_machine_id uuid
);


ALTER TABLE public.ipam_service OWNER TO nautobot;

--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_service_ipaddresses (
    id bigint NOT NULL,
    service_id uuid NOT NULL,
    ipaddress_id uuid NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO nautobot;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO nautobot;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlan (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    vid smallint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    group_id uuid,
    role_id uuid,
    site_id uuid,
    status_id uuid,
    tenant_id uuid,
    location_id uuid,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO nautobot;

--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlangroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    site_id uuid,
    location_id uuid
);


ALTER TABLE public.ipam_vlangroup OWNER TO nautobot;

--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_vrf OWNER TO nautobot;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf_export_targets (
    id bigint NOT NULL,
    vrf_id uuid NOT NULL,
    routetarget_id uuid NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO nautobot;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO nautobot;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf_import_targets (
    id bigint NOT NULL,
    vrf_id uuid NOT NULL,
    routetarget_id uuid NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO nautobot;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO nautobot;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_association (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO nautobot;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO nautobot;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_code (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO nautobot;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO nautobot;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_nonce (
    id bigint NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO nautobot;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO nautobot;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_partial (
    id bigint NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO nautobot;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO nautobot;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.social_auth_usersocialauth (
    id bigint NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO nautobot;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO nautobot;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO nautobot;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO nautobot;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO nautobot;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO nautobot;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.tenancy_tenant (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id uuid
);


ALTER TABLE public.tenancy_tenant OWNER TO nautobot;

--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.tenancy_tenantgroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id uuid,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO nautobot;

--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions jsonb NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO nautobot;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission_groups (
    id bigint NOT NULL,
    objectpermission_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO nautobot;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO nautobot;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission_object_types (
    id bigint NOT NULL,
    objectpermission_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO nautobot;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO nautobot;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission_users (
    id bigint NOT NULL,
    objectpermission_id uuid NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO nautobot;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO nautobot;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_token (
    id uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.users_token OWNER TO nautobot;

--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_cluster (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id uuid,
    site_id uuid,
    tenant_id uuid,
    type_id uuid NOT NULL,
    location_id uuid
);


ALTER TABLE public.virtualization_cluster OWNER TO nautobot;

--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_clustergroup (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO nautobot;

--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_clustertype (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO nautobot;

--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_virtualmachine (
    id uuid NOT NULL,
    created date,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    local_context_data jsonb,
    local_context_data_owner_object_id uuid,
    name character varying(64) NOT NULL,
    vcpus smallint,
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id uuid NOT NULL,
    local_context_data_owner_content_type_id integer,
    platform_id uuid,
    primary_ip4_id uuid,
    primary_ip6_id uuid,
    role_id uuid,
    status_id uuid,
    tenant_id uuid,
    local_context_schema_id uuid,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0)),
    CONSTRAINT virtualization_virtualmachine_vcpus_check CHECK ((vcpus >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO nautobot;

--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_vminterface (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    enabled boolean NOT NULL,
    mac_address character varying(18),
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    untagged_vlan_id uuid,
    virtual_machine_id uuid NOT NULL,
    status_id uuid,
    parent_interface_id uuid,
    bridge_id uuid,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO nautobot;

--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id bigint NOT NULL,
    vminterface_id uuid NOT NULL,
    vlan_id uuid NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO nautobot;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO nautobot;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: constance_config id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.constance_config ALTER COLUMN id SET DEFAULT nextval('public.constance_config_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_locationtype_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype_content_types ALTER COLUMN id SET DEFAULT nextval('public.dcim_locationtype_content_types_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_redundancy_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_redundancy_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_redundancy_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_dynamic_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_dynamic_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_dynamic_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_locations id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_locations ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_locations_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_jobbutton_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_jobbutton_content_types_id_seq'::regclass);


--
-- Name: extras_jobhook_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_jobhook_content_types_id_seq'::regclass);


--
-- Name: extras_status_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_status_content_types_id_seq'::regclass);


--
-- Name: extras_tag_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_content_types_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	18	add_permission
2	Can change permission	18	change_permission
3	Can delete permission	18	delete_permission
4	Can view permission	18	view_permission
5	Can add group	19	add_group
6	Can change group	19	change_group
7	Can delete group	19	delete_group
8	Can view group	19	view_group
9	Can change config	20	change_config
10	Can view config	20	view_config
11	Can add content type	21	add_contenttype
12	Can change content type	21	change_contenttype
13	Can delete content type	21	delete_contenttype
14	Can view content type	21	view_contenttype
15	Can add session	22	add_session
16	Can change session	22	change_session
17	Can delete session	22	delete_session
18	Can view session	22	view_session
19	Can add association	23	add_association
20	Can change association	23	change_association
21	Can delete association	23	delete_association
22	Can view association	23	view_association
23	Can add code	24	add_code
24	Can change code	24	change_code
25	Can delete code	24	delete_code
26	Can view code	24	view_code
27	Can add nonce	25	add_nonce
28	Can change nonce	25	change_nonce
29	Can delete nonce	25	delete_nonce
30	Can view nonce	25	view_nonce
31	Can add user social auth	26	add_usersocialauth
32	Can change user social auth	26	change_usersocialauth
33	Can delete user social auth	26	delete_usersocialauth
34	Can view user social auth	26	view_usersocialauth
35	Can add partial	27	add_partial
36	Can change partial	27	change_partial
37	Can delete partial	27	delete_partial
38	Can view partial	27	view_partial
39	Can add tag	28	add_tag
40	Can change tag	28	change_tag
41	Can delete tag	28	delete_tag
42	Can view tag	28	view_tag
43	Can add tagged item	29	add_taggeditem
44	Can change tagged item	29	change_taggeditem
45	Can delete tagged item	29	delete_taggeditem
46	Can view tagged item	29	view_taggeditem
47	Can add log entry	30	add_logentry
48	Can change log entry	30	change_logentry
49	Can delete log entry	30	delete_logentry
50	Can view log entry	30	view_logentry
51	Can add crontab	31	add_crontabschedule
52	Can change crontab	31	change_crontabschedule
53	Can delete crontab	31	delete_crontabschedule
54	Can view crontab	31	view_crontabschedule
55	Can add interval	32	add_intervalschedule
56	Can change interval	32	change_intervalschedule
57	Can delete interval	32	delete_intervalschedule
58	Can view interval	32	view_intervalschedule
59	Can add periodic task	33	add_periodictask
60	Can change periodic task	33	change_periodictask
61	Can delete periodic task	33	delete_periodictask
62	Can view periodic task	33	view_periodictask
63	Can add periodic tasks	34	add_periodictasks
64	Can change periodic tasks	34	change_periodictasks
65	Can delete periodic tasks	34	delete_periodictasks
66	Can view periodic tasks	34	view_periodictasks
67	Can add solar event	35	add_solarschedule
68	Can change solar event	35	change_solarschedule
69	Can delete solar event	35	delete_solarschedule
70	Can view solar event	35	view_solarschedule
71	Can add clocked	36	add_clockedschedule
72	Can change clocked	36	change_clockedschedule
73	Can delete clocked	36	delete_clockedschedule
74	Can view clocked	36	view_clockedschedule
75	Can add circuit	1	add_circuit
76	Can change circuit	1	change_circuit
77	Can delete circuit	1	delete_circuit
78	Can view circuit	1	view_circuit
79	Can add circuit termination	37	add_circuittermination
80	Can change circuit termination	37	change_circuittermination
81	Can delete circuit termination	37	delete_circuittermination
82	Can view circuit termination	37	view_circuittermination
83	Can add circuit type	38	add_circuittype
84	Can change circuit type	38	change_circuittype
85	Can delete circuit type	38	delete_circuittype
86	Can view circuit type	38	view_circuittype
87	Can add provider	39	add_provider
88	Can change provider	39	change_provider
89	Can delete provider	39	delete_provider
90	Can view provider	39	view_provider
91	Can add provider network	40	add_providernetwork
92	Can change provider network	40	change_providernetwork
93	Can delete provider network	40	delete_providernetwork
94	Can view provider network	40	view_providernetwork
95	Can add cable	2	add_cable
96	Can change cable	2	change_cable
97	Can delete cable	2	delete_cable
98	Can view cable	2	view_cable
99	Can add cable path	41	add_cablepath
100	Can change cable path	41	change_cablepath
101	Can delete cable path	41	delete_cablepath
102	Can view cable path	41	view_cablepath
103	Can add console port	42	add_consoleport
104	Can change console port	42	change_consoleport
105	Can delete console port	42	delete_consoleport
106	Can view console port	42	view_consoleport
107	Can add console port template	43	add_consoleporttemplate
108	Can change console port template	43	change_consoleporttemplate
109	Can delete console port template	43	delete_consoleporttemplate
110	Can view console port template	43	view_consoleporttemplate
111	Can add console server port	44	add_consoleserverport
112	Can change console server port	44	change_consoleserverport
113	Can delete console server port	44	delete_consoleserverport
114	Can view console server port	44	view_consoleserverport
115	Can add console server port template	45	add_consoleserverporttemplate
116	Can change console server port template	45	change_consoleserverporttemplate
117	Can delete console server port template	45	delete_consoleserverporttemplate
118	Can view console server port template	45	view_consoleserverporttemplate
119	Can add device	3	add_device
120	Can change device	3	change_device
121	Can delete device	3	delete_device
122	Can view device	3	view_device
123	Can add device bay	46	add_devicebay
124	Can change device bay	46	change_devicebay
125	Can delete device bay	46	delete_devicebay
126	Can view device bay	46	view_devicebay
127	Can add device bay template	47	add_devicebaytemplate
128	Can change device bay template	47	change_devicebaytemplate
129	Can delete device bay template	47	delete_devicebaytemplate
130	Can view device bay template	47	view_devicebaytemplate
131	Can add device role	48	add_devicerole
132	Can change device role	48	change_devicerole
133	Can delete device role	48	delete_devicerole
134	Can view device role	48	view_devicerole
135	Can add device type	49	add_devicetype
136	Can change device type	49	change_devicetype
137	Can delete device type	49	delete_devicetype
138	Can view device type	49	view_devicetype
139	Can add front port	50	add_frontport
140	Can change front port	50	change_frontport
141	Can delete front port	50	delete_frontport
142	Can view front port	50	view_frontport
143	Can add front port template	51	add_frontporttemplate
144	Can change front port template	51	change_frontporttemplate
145	Can delete front port template	51	delete_frontporttemplate
146	Can view front port template	51	view_frontporttemplate
147	Can add interface	4	add_interface
148	Can change interface	4	change_interface
149	Can delete interface	4	delete_interface
150	Can view interface	4	view_interface
151	Can add interface template	52	add_interfacetemplate
152	Can change interface template	52	change_interfacetemplate
153	Can delete interface template	52	delete_interfacetemplate
154	Can view interface template	52	view_interfacetemplate
155	Can add inventory item	53	add_inventoryitem
156	Can change inventory item	53	change_inventoryitem
157	Can delete inventory item	53	delete_inventoryitem
158	Can view inventory item	53	view_inventoryitem
159	Can add manufacturer	54	add_manufacturer
160	Can change manufacturer	54	change_manufacturer
161	Can delete manufacturer	54	delete_manufacturer
162	Can view manufacturer	54	view_manufacturer
163	Can add platform	55	add_platform
164	Can change platform	55	change_platform
165	Can delete platform	55	delete_platform
166	Can view platform	55	view_platform
167	Can add power feed	6	add_powerfeed
168	Can change power feed	6	change_powerfeed
169	Can delete power feed	6	delete_powerfeed
170	Can view power feed	6	view_powerfeed
171	Can add power outlet	56	add_poweroutlet
172	Can change power outlet	56	change_poweroutlet
173	Can delete power outlet	56	delete_poweroutlet
174	Can view power outlet	56	view_poweroutlet
175	Can add power outlet template	57	add_poweroutlettemplate
176	Can change power outlet template	57	change_poweroutlettemplate
177	Can delete power outlet template	57	delete_poweroutlettemplate
178	Can view power outlet template	57	view_poweroutlettemplate
179	Can add power panel	58	add_powerpanel
180	Can change power panel	58	change_powerpanel
181	Can delete power panel	58	delete_powerpanel
182	Can view power panel	58	view_powerpanel
183	Can add power port	59	add_powerport
184	Can change power port	59	change_powerport
185	Can delete power port	59	delete_powerport
186	Can view power port	59	view_powerport
187	Can add power port template	60	add_powerporttemplate
188	Can change power port template	60	change_powerporttemplate
189	Can delete power port template	60	delete_powerporttemplate
190	Can view power port template	60	view_powerporttemplate
191	Can add rack	7	add_rack
192	Can change rack	7	change_rack
193	Can delete rack	7	delete_rack
194	Can view rack	7	view_rack
195	Can add rack group	61	add_rackgroup
196	Can change rack group	61	change_rackgroup
197	Can delete rack group	61	delete_rackgroup
198	Can view rack group	61	view_rackgroup
199	Can add rack reservation	62	add_rackreservation
200	Can change rack reservation	62	change_rackreservation
201	Can delete rack reservation	62	delete_rackreservation
202	Can view rack reservation	62	view_rackreservation
203	Can add rack role	63	add_rackrole
204	Can change rack role	63	change_rackrole
205	Can delete rack role	63	delete_rackrole
206	Can view rack role	63	view_rackrole
207	Can add rear port	64	add_rearport
208	Can change rear port	64	change_rearport
209	Can delete rear port	64	delete_rearport
210	Can view rear port	64	view_rearport
211	Can add rear port template	65	add_rearporttemplate
212	Can change rear port template	65	change_rearporttemplate
213	Can delete rear port template	65	delete_rearporttemplate
214	Can view rear port template	65	view_rearporttemplate
215	Can add region	66	add_region
216	Can change region	66	change_region
217	Can delete region	66	delete_region
218	Can view region	66	view_region
219	Can add site	10	add_site
220	Can change site	10	change_site
221	Can delete site	10	delete_site
222	Can view site	10	view_site
223	Can add virtual chassis	67	add_virtualchassis
224	Can change virtual chassis	67	change_virtualchassis
225	Can delete virtual chassis	67	delete_virtualchassis
226	Can view virtual chassis	67	view_virtualchassis
227	Can add location type	68	add_locationtype
228	Can change location type	68	change_locationtype
229	Can delete location type	68	delete_locationtype
230	Can view location type	68	view_locationtype
231	Can add location	5	add_location
232	Can change location	5	change_location
233	Can delete location	5	delete_location
234	Can view location	5	view_location
235	Can add device redundancy group	8	add_deviceredundancygroup
236	Can change device redundancy group	8	change_deviceredundancygroup
237	Can delete device redundancy group	8	delete_deviceredundancygroup
238	Can view device redundancy group	8	view_deviceredundancygroup
239	Can add interface redundancy group	9	add_interfaceredundancygroup
240	Can change interface redundancy group	9	change_interfaceredundancygroup
241	Can delete interface redundancy group	9	delete_interfaceredundancygroup
242	Can view interface redundancy group	9	view_interfaceredundancygroup
243	Can add interface redundancy group association	69	add_interfaceredundancygroupassociation
244	Can change interface redundancy group association	69	change_interfaceredundancygroupassociation
245	Can delete interface redundancy group association	69	delete_interfaceredundancygroupassociation
246	Can view interface redundancy group association	69	view_interfaceredundancygroupassociation
247	Can add aggregate	70	add_aggregate
248	Can change aggregate	70	change_aggregate
249	Can delete aggregate	70	delete_aggregate
250	Can view aggregate	70	view_aggregate
251	Can add IP address	11	add_ipaddress
252	Can change IP address	11	change_ipaddress
253	Can delete IP address	11	delete_ipaddress
254	Can view IP address	11	view_ipaddress
255	Can add prefix	12	add_prefix
256	Can change prefix	12	change_prefix
257	Can delete prefix	12	delete_prefix
258	Can view prefix	12	view_prefix
259	Can add RIR	71	add_rir
260	Can change RIR	71	change_rir
261	Can delete RIR	71	delete_rir
262	Can view RIR	71	view_rir
263	Can add role	72	add_role
264	Can change role	72	change_role
265	Can delete role	72	delete_role
266	Can view role	72	view_role
267	Can add route target	73	add_routetarget
268	Can change route target	73	change_routetarget
269	Can delete route target	73	delete_routetarget
270	Can view route target	73	view_routetarget
271	Can add VRF	74	add_vrf
272	Can change VRF	74	change_vrf
273	Can delete VRF	74	delete_vrf
274	Can view VRF	74	view_vrf
275	Can add VLAN group	75	add_vlangroup
276	Can change VLAN group	75	change_vlangroup
277	Can delete VLAN group	75	delete_vlangroup
278	Can view VLAN group	75	view_vlangroup
279	Can add VLAN	13	add_vlan
280	Can change VLAN	13	change_vlan
281	Can delete VLAN	13	delete_vlan
282	Can view VLAN	13	view_vlan
283	Can add service	76	add_service
284	Can change service	76	change_service
285	Can delete service	76	delete_service
286	Can view service	76	view_service
287	Can add config context	77	add_configcontext
288	Can change config context	77	change_configcontext
289	Can delete config context	77	delete_configcontext
290	Can view config context	77	view_configcontext
291	Can add custom field	16	add_customfield
292	Can change custom field	16	change_customfield
293	Can delete custom field	16	delete_customfield
294	Can view custom field	16	view_customfield
295	Can add custom field choice	78	add_customfieldchoice
296	Can change custom field choice	78	change_customfieldchoice
297	Can delete custom field choice	78	delete_customfieldchoice
298	Can view custom field choice	78	view_customfieldchoice
299	Can add custom link	79	add_customlink
300	Can change custom link	79	change_customlink
301	Can delete custom link	79	delete_customlink
302	Can view custom link	79	view_customlink
303	Can add export template	80	add_exporttemplate
304	Can change export template	80	change_exporttemplate
305	Can delete export template	80	delete_exporttemplate
306	Can view export template	80	view_exporttemplate
307	Can add Git repository	81	add_gitrepository
308	Can change Git repository	81	change_gitrepository
309	Can delete Git repository	81	delete_gitrepository
310	Can view Git repository	81	view_gitrepository
311	Can add image attachment	82	add_imageattachment
312	Can change image attachment	82	change_imageattachment
313	Can delete image attachment	82	delete_imageattachment
314	Can view image attachment	82	view_imageattachment
315	Can add job result	83	add_jobresult
316	Can change job result	83	change_jobresult
317	Can delete job result	83	delete_jobresult
318	Can view job result	83	view_jobresult
319	Can add relationship	84	add_relationship
320	Can change relationship	84	change_relationship
321	Can delete relationship	84	delete_relationship
322	Can view relationship	84	view_relationship
323	Can add tag	85	add_tag
324	Can change tag	85	change_tag
325	Can delete tag	85	delete_tag
326	Can view tag	85	view_tag
327	Can add webhook	86	add_webhook
328	Can change webhook	86	change_webhook
329	Can delete webhook	86	delete_webhook
330	Can view webhook	86	view_webhook
331	Can add tagged item	87	add_taggeditem
332	Can change tagged item	87	change_taggeditem
333	Can delete tagged item	87	delete_taggeditem
334	Can view tagged item	87	view_taggeditem
335	Can add status	88	add_status
336	Can change status	88	change_status
337	Can delete status	88	delete_status
338	Can view status	88	view_status
339	Can add relationship association	89	add_relationshipassociation
340	Can change relationship association	89	change_relationshipassociation
341	Can delete relationship association	89	delete_relationshipassociation
342	Can view relationship association	89	view_relationshipassociation
343	Can add object change	90	add_objectchange
344	Can change object change	90	change_objectchange
345	Can delete object change	90	delete_objectchange
346	Can view object change	90	view_objectchange
347	Can add GraphQL query	91	add_graphqlquery
348	Can change GraphQL query	91	change_graphqlquery
349	Can delete GraphQL query	91	delete_graphqlquery
350	Can view GraphQL query	91	view_graphqlquery
351	Can add config context schema	92	add_configcontextschema
352	Can change config context schema	92	change_configcontextschema
353	Can delete config context schema	92	delete_configcontextschema
354	Can view config context schema	92	view_configcontextschema
355	Can add computed field	93	add_computedfield
356	Can change computed field	93	change_computedfield
357	Can delete computed field	93	delete_computedfield
358	Can view computed field	93	view_computedfield
359	Can add file attachment	94	add_fileattachment
360	Can change file attachment	94	change_fileattachment
361	Can delete file attachment	94	delete_fileattachment
362	Can view file attachment	94	view_fileattachment
363	Can add file proxy	95	add_fileproxy
364	Can change file proxy	95	change_fileproxy
365	Can delete file proxy	95	delete_fileproxy
366	Can view file proxy	95	view_fileproxy
367	Can add health check test model	96	add_healthchecktestmodel
368	Can change health check test model	96	change_healthchecktestmodel
369	Can delete health check test model	96	delete_healthchecktestmodel
370	Can view health check test model	96	view_healthchecktestmodel
371	Can add scheduled jobs	97	add_scheduledjobs
372	Can change scheduled jobs	97	change_scheduledjobs
373	Can delete scheduled jobs	97	delete_scheduledjobs
374	Can view scheduled jobs	97	view_scheduledjobs
375	Can add scheduled job	98	add_scheduledjob
376	Can change scheduled job	98	change_scheduledjob
377	Can delete scheduled job	98	delete_scheduledjob
378	Can view scheduled job	98	view_scheduledjob
379	Can add secret	99	add_secret
380	Can change secret	99	change_secret
381	Can delete secret	99	delete_secret
382	Can view secret	99	view_secret
383	Can add secrets group	100	add_secretsgroup
384	Can change secrets group	100	change_secretsgroup
385	Can delete secrets group	100	delete_secretsgroup
386	Can view secrets group	100	view_secretsgroup
387	Can add secrets group association	101	add_secretsgroupassociation
388	Can change secrets group association	101	change_secretsgroupassociation
389	Can delete secrets group association	101	delete_secretsgroupassociation
390	Can view secrets group association	101	view_secretsgroupassociation
391	Can add job log entry	102	add_joblogentry
392	Can change job log entry	102	change_joblogentry
393	Can delete job log entry	102	delete_joblogentry
394	Can view job log entry	102	view_joblogentry
395	Can add job	17	add_job
396	Can change job	17	change_job
397	Can delete job	17	delete_job
398	Can view job	17	view_job
399	Can add dynamic group	103	add_dynamicgroup
400	Can change dynamic group	103	change_dynamicgroup
401	Can delete dynamic group	103	delete_dynamicgroup
402	Can view dynamic group	103	view_dynamicgroup
403	Can add dynamic group membership	104	add_dynamicgroupmembership
404	Can change dynamic group membership	104	change_dynamicgroupmembership
405	Can delete dynamic group membership	104	delete_dynamicgroupmembership
406	Can view dynamic group membership	104	view_dynamicgroupmembership
407	Can add note	105	add_note
408	Can change note	105	change_note
409	Can delete note	105	delete_note
410	Can view note	105	view_note
411	Can add job hook	106	add_jobhook
412	Can change job hook	106	change_jobhook
413	Can delete job hook	106	delete_jobhook
414	Can view job hook	106	view_jobhook
415	Can add job button	107	add_jobbutton
416	Can change job button	107	change_jobbutton
417	Can delete job button	107	delete_jobbutton
418	Can view job button	107	view_jobbutton
419	Can add tenant group	108	add_tenantgroup
420	Can change tenant group	108	change_tenantgroup
421	Can delete tenant group	108	delete_tenantgroup
422	Can view tenant group	108	view_tenantgroup
423	Can add tenant	109	add_tenant
424	Can change tenant	109	change_tenant
425	Can delete tenant	109	delete_tenant
426	Can view tenant	109	view_tenant
427	Can add user	110	add_user
428	Can change user	110	change_user
429	Can delete user	110	delete_user
430	Can view user	110	view_user
431	Can add Group	111	add_admingroup
432	Can change Group	111	change_admingroup
433	Can delete Group	111	delete_admingroup
434	Can view Group	111	view_admingroup
435	Can add token	112	add_token
436	Can change token	112	change_token
437	Can delete token	112	delete_token
438	Can view token	112	view_token
439	Can add permission	113	add_objectpermission
440	Can change permission	113	change_objectpermission
441	Can delete permission	113	delete_objectpermission
442	Can view permission	113	view_objectpermission
443	Can add cluster	114	add_cluster
444	Can change cluster	114	change_cluster
445	Can delete cluster	114	delete_cluster
446	Can view cluster	114	view_cluster
447	Can add cluster group	115	add_clustergroup
448	Can change cluster group	115	change_clustergroup
449	Can delete cluster group	115	delete_clustergroup
450	Can view cluster group	115	view_clustergroup
451	Can add cluster type	116	add_clustertype
452	Can change cluster type	116	change_clustertype
453	Can delete cluster type	116	delete_clustertype
454	Can view cluster type	116	view_clustertype
455	Can add virtual machine	14	add_virtualmachine
456	Can change virtual machine	14	change_virtualmachine
457	Can delete virtual machine	14	delete_virtualmachine
458	Can view virtual machine	14	view_virtualmachine
459	Can add VM interface	15	add_vminterface
460	Can change VM interface	15	change_vminterface
461	Can delete VM interface	15	delete_vminterface
462	Can view VM interface	15	view_vminterface
463	Access admin page	117	view
464	Can add constance	118	add_constance
465	Can change constance	118	change_constance
466	Can delete constance	118	delete_constance
467	Can view constance	118	view_constance
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_user (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, id, config_data) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuit (id, created, last_updated, _custom_field_data, cid, install_date, commit_rate, description, comments, provider_id, status_id, tenant_id, type_id, termination_a_id, termination_z_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuittermination (id, _cable_peer_id, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _cable_peer_type_id, _path_id, cable_id, circuit_id, site_id, provider_network_id, _custom_field_data, created, last_updated, location_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuittype (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_provider (id, created, last_updated, _custom_field_data, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_providernetwork (id, created, last_updated, _custom_field_data, name, slug, description, comments, provider_id) FROM stdin;
\.


--
-- Data for Name: constance_config; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.constance_config (id, key, value) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_cable (id, created, last_updated, _custom_field_data, termination_a_id, termination_b_id, type, label, color, length, length_unit, _abs_length, _termination_a_device_id, _termination_b_device_id, status_id, termination_a_type_id, termination_b_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, _cable_peer_type_id, _path_id, cable_id, device_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleporttemplate (id, _custom_field_data, name, _name, label, description, type, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleserverport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, _cable_peer_type_id, _path_id, cable_id, device_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_consoleserverporttemplate (id, _custom_field_data, name, _name, label, description, type, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_device (id, created, last_updated, _custom_field_data, local_context_data, local_context_data_owner_object_id, name, _name, serial, asset_tag, "position", face, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, local_context_data_owner_content_type_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, status_id, tenant_id, virtual_chassis_id, local_context_schema_id, secrets_group_id, location_id, device_redundancy_group_priority, device_redundancy_group_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicebay (id, _custom_field_data, name, _name, label, description, device_id, installed_device_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicebaytemplate (id, _custom_field_data, name, _name, label, description, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_deviceredundancygroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_deviceredundancygroup (id, created, last_updated, _custom_field_data, name, slug, description, failover_strategy, comments, secrets_group_id, status_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicerole (id, created, last_updated, _custom_field_data, name, slug, color, vm_role, description) FROM stdin;
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicetype (id, created, last_updated, _custom_field_data, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id) FROM stdin;
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_frontport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, rear_port_position, _cable_peer_type_id, cable_id, device_id, rear_port_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_frontporttemplate (id, _custom_field_data, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interface (id, _custom_field_data, name, label, description, _cable_peer_id, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _cable_peer_type_id, _path_id, cable_id, device_id, lag_id, untagged_vlan_id, status_id, parent_interface_id, bridge_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfaceredundancygroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interfaceredundancygroup (id, last_updated, _custom_field_data, name, created, description, protocol, protocol_group_id, secrets_group_id, status_id, virtual_ip_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfaceredundancygroupassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interfaceredundancygroupassociation (id, created, last_updated, priority, interface_id, interface_redundancy_group_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interfacetemplate (id, _custom_field_data, name, label, description, _name, type, mgmt_only, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_inventoryitem (id, _custom_field_data, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_location (id, created, last_updated, _custom_field_data, name, _name, slug, description, location_type_id, parent_id, site_id, status_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_locationtype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_locationtype (id, created, last_updated, _custom_field_data, name, slug, description, parent_id, nestable) FROM stdin;
\.


--
-- Data for Name: dcim_locationtype_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_locationtype_content_types (id, locationtype_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_manufacturer (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_platform (id, created, last_updated, _custom_field_data, name, slug, napalm_driver, napalm_args, description, manufacturer_id, network_driver) FROM stdin;
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerfeed (id, created, last_updated, _custom_field_data, _cable_peer_id, name, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _cable_peer_type_id, _path_id, cable_id, power_panel_id, rack_id, status_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_poweroutlet (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, feed_leg, _cable_peer_type_id, _path_id, cable_id, device_id, power_port_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_poweroutlettemplate (id, _custom_field_data, name, _name, label, description, type, feed_leg, device_type_id, power_port_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerpanel (id, created, last_updated, _custom_field_data, name, rack_group_id, site_id, location_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, maximum_draw, allocated_draw, _cable_peer_type_id, _path_id, cable_id, device_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerporttemplate (id, _custom_field_data, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rack (id, created, last_updated, _custom_field_data, name, _name, facility_id, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, group_id, role_id, site_id, status_id, tenant_id, location_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackgroup (id, created, last_updated, _custom_field_data, name, slug, description, lft, rght, tree_id, level, parent_id, site_id, location_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackreservation (id, created, last_updated, _custom_field_data, units, description, rack_id, tenant_id, user_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackrole (id, created, last_updated, _custom_field_data, name, slug, color, description) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rearport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, positions, _cable_peer_type_id, cable_id, device_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rearporttemplate (id, _custom_field_data, name, _name, label, description, type, positions, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_region (id, created, last_updated, _custom_field_data, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_site (id, created, last_updated, _custom_field_data, name, _name, slug, facility, asn, time_zone, description, physical_address, shipping_address, latitude, longitude, contact_name, contact_phone, contact_email, comments, region_id, status_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_virtualchassis (id, created, last_updated, _custom_field_data, name, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	circuits	circuit
2	dcim	cable
3	dcim	device
4	dcim	interface
5	dcim	location
6	dcim	powerfeed
7	dcim	rack
8	dcim	deviceredundancygroup
9	dcim	interfaceredundancygroup
10	dcim	site
11	ipam	ipaddress
12	ipam	prefix
13	ipam	vlan
14	virtualization	virtualmachine
15	virtualization	vminterface
16	extras	customfield
17	extras	job
18	auth	permission
19	auth	group
20	constance	config
21	contenttypes	contenttype
22	sessions	session
23	social_django	association
24	social_django	code
25	social_django	nonce
26	social_django	usersocialauth
27	social_django	partial
28	taggit	tag
29	taggit	taggeditem
30	admin	logentry
31	django_celery_beat	crontabschedule
32	django_celery_beat	intervalschedule
33	django_celery_beat	periodictask
34	django_celery_beat	periodictasks
35	django_celery_beat	solarschedule
36	django_celery_beat	clockedschedule
37	circuits	circuittermination
38	circuits	circuittype
39	circuits	provider
40	circuits	providernetwork
41	dcim	cablepath
42	dcim	consoleport
43	dcim	consoleporttemplate
44	dcim	consoleserverport
45	dcim	consoleserverporttemplate
46	dcim	devicebay
47	dcim	devicebaytemplate
48	dcim	devicerole
49	dcim	devicetype
50	dcim	frontport
51	dcim	frontporttemplate
52	dcim	interfacetemplate
53	dcim	inventoryitem
54	dcim	manufacturer
55	dcim	platform
56	dcim	poweroutlet
57	dcim	poweroutlettemplate
58	dcim	powerpanel
59	dcim	powerport
60	dcim	powerporttemplate
61	dcim	rackgroup
62	dcim	rackreservation
63	dcim	rackrole
64	dcim	rearport
65	dcim	rearporttemplate
66	dcim	region
67	dcim	virtualchassis
68	dcim	locationtype
69	dcim	interfaceredundancygroupassociation
70	ipam	aggregate
71	ipam	rir
72	ipam	role
73	ipam	routetarget
74	ipam	vrf
75	ipam	vlangroup
76	ipam	service
77	extras	configcontext
78	extras	customfieldchoice
79	extras	customlink
80	extras	exporttemplate
81	extras	gitrepository
82	extras	imageattachment
83	extras	jobresult
84	extras	relationship
85	extras	tag
86	extras	webhook
87	extras	taggeditem
88	extras	status
89	extras	relationshipassociation
90	extras	objectchange
91	extras	graphqlquery
92	extras	configcontextschema
93	extras	computedfield
94	extras	fileattachment
95	extras	fileproxy
96	extras	healthchecktestmodel
97	extras	scheduledjobs
98	extras	scheduledjob
99	extras	secret
100	extras	secretsgroup
101	extras	secretsgroupassociation
102	extras	joblogentry
103	extras	dynamicgroup
104	extras	dynamicgroupmembership
105	extras	note
106	extras	jobhook
107	extras	jobbutton
108	tenancy	tenantgroup
109	tenancy	tenant
110	users	user
111	users	admingroup
112	users	token
113	users	objectpermission
114	virtualization	cluster
115	virtualization	clustergroup
116	virtualization	clustertype
117	django_rq	queue
118	database	constance
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-04-28 04:08:34.261112+00
2	contenttypes	0002_remove_content_type_name	2025-04-28 04:08:34.269667+00
3	auth	0001_initial	2025-04-28 04:08:34.308091+00
4	auth	0002_alter_permission_name_max_length	2025-04-28 04:08:34.313702+00
5	auth	0003_alter_user_email_max_length	2025-04-28 04:08:34.319046+00
6	auth	0004_alter_user_username_opts	2025-04-28 04:08:34.324165+00
7	auth	0005_alter_user_last_login_null	2025-04-28 04:08:34.329259+00
8	auth	0006_require_contenttypes_0002	2025-04-28 04:08:34.331005+00
9	auth	0007_alter_validators_add_error_messages	2025-04-28 04:08:34.336697+00
10	auth	0008_alter_user_username_max_length	2025-04-28 04:08:34.342714+00
11	auth	0009_alter_user_last_name_max_length	2025-04-28 04:08:34.34755+00
12	auth	0010_alter_group_name_max_length	2025-04-28 04:08:34.354736+00
13	auth	0011_update_proxy_permissions	2025-04-28 04:08:34.360015+00
14	auth	0012_alter_user_first_name_max_length	2025-04-28 04:08:34.364986+00
15	users	0001_initial	2025-04-28 04:08:34.464969+00
16	admin	0001_initial	2025-04-28 04:08:34.490343+00
17	admin	0002_logentry_remove_auto_add	2025-04-28 04:08:34.501133+00
18	admin	0003_logentry_add_action_flag_choices	2025-04-28 04:08:34.511146+00
19	extras	0001_initial_part_1	2025-04-28 04:08:34.761114+00
20	tenancy	0001_initial	2025-04-28 04:08:34.827087+00
21	dcim	0001_initial_part_1	2025-04-28 04:08:35.113101+00
22	dcim	0002_initial_part_2	2025-04-28 04:08:35.562769+00
23	ipam	0001_initial_part_1	2025-04-28 04:08:35.830945+00
24	extras	0002_initial_part_2	2025-04-28 04:08:36.167922+00
25	dcim	0003_initial_part_3	2025-04-28 04:08:39.500555+00
26	virtualization	0001_initial	2025-04-28 04:08:40.182915+00
27	dcim	0004_initial_part_4	2025-04-28 04:08:43.963333+00
28	extras	0003_initial_part_3	2025-04-28 04:08:45.231573+00
29	extras	0004_populate_default_status_records	2025-04-28 04:08:45.590078+00
30	extras	0005_configcontext_device_types	2025-04-28 04:08:45.67907+00
31	extras	0006_graphqlquery	2025-04-28 04:08:45.693241+00
32	extras	0007_configcontextschema	2025-04-28 04:08:46.054129+00
33	extras	0008_jobresult__custom_field_data	2025-04-28 04:08:46.095511+00
34	extras	0009_computedfield	2025-04-28 04:08:46.175505+00
35	extras	0010_change_cf_validation_max_min_field_to_bigint	2025-04-28 04:08:46.276253+00
36	extras	0011_fileattachment_fileproxy	2025-04-28 04:08:46.327591+00
37	extras	0012_healthchecktestmodel	2025-04-28 04:08:46.335305+00
38	extras	0013_default_fallback_value_computedfield	2025-04-28 04:08:46.371462+00
39	extras	0014_auto_slug	2025-04-28 04:08:46.764385+00
40	extras	0015_scheduled_job	2025-04-28 04:08:46.928153+00
41	extras	0016_secret	2025-04-28 04:08:47.239968+00
42	extras	0017_joblogentry	2025-04-28 04:08:47.320617+00
43	extras	0018_joblog_data_migration	2025-04-28 04:08:47.623453+00
44	extras	0019_joblogentry__meta_options__related_name	2025-04-28 04:08:47.702621+00
45	extras	0020_customfield_changelog	2025-04-28 04:08:47.790317+00
46	extras	0021_customfield_changelog_data	2025-04-28 04:08:47.868181+00
47	extras	0022_objectchange_object_datav2	2025-04-28 04:08:47.911101+00
48	extras	0023_job_model	2025-04-28 04:08:48.478056+00
49	extras	0024_job_data_migration	2025-04-28 04:08:48.558918+00
50	extras	0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship	2025-04-28 04:08:48.669074+00
51	extras	0026_job_add_gitrepository_fk	2025-04-28 04:08:48.838809+00
52	extras	0027_job_gitrepository_data_migration	2025-04-28 04:08:49.119073+00
53	extras	0028_job_reduce_source	2025-04-28 04:08:49.185575+00
54	extras	0029_dynamicgroup	2025-04-28 04:08:49.275828+00
55	extras	0030_webhook_alter_unique_together	2025-04-28 04:08:49.318507+00
56	extras	0031_tag_content_types	2025-04-28 04:08:49.405076+00
57	extras	0032_tag_content_types_data_migration	2025-04-28 04:08:49.491799+00
58	extras	0033_add__optimized_indexing	2025-04-28 04:08:50.418706+00
59	extras	0034_alter_fileattachment_mimetype	2025-04-28 04:08:50.42694+00
60	extras	0035_scheduledjob_crontab	2025-04-28 04:08:50.445417+00
61	extras	0036_job_add_has_sensitive_variables	2025-04-28 04:08:50.532998+00
62	extras	0037_configcontextschema__remove_name_unique__create_constraint_unique_name_owner	2025-04-28 04:08:50.824368+00
63	dcim	0005_device_local_context_schema	2025-04-28 04:08:50.913547+00
64	dcim	0006_auto_slug	2025-04-28 04:08:51.305161+00
65	dcim	0007_device_secrets_group	2025-04-28 04:08:51.65601+00
66	dcim	0008_increase_all_serial_lengths	2025-04-28 04:08:51.81467+00
67	dcim	0009_add_natural_indexing	2025-04-28 04:08:54.144332+00
68	dcim	0010_interface_status	2025-04-28 04:08:54.236963+00
69	dcim	0011_interface_status_data_migration	2025-04-28 04:08:54.330735+00
70	dcim	0012_interface_parent_bridge	2025-04-28 04:08:54.494465+00
71	dcim	0013_location_location_type	2025-04-28 04:08:55.471663+00
72	circuits	0001_initial_part_1	2025-04-28 04:08:55.513315+00
73	circuits	0002_initial_part_2	2025-04-28 04:08:56.904941+00
74	circuits	0003_auto_slug	2025-04-28 04:08:56.954875+00
75	circuits	0004_increase_provider_account_length	2025-04-28 04:08:57.001597+00
76	circuits	0005_providernetwork	2025-04-28 04:08:57.754458+00
77	circuits	0006_cache_circuit_terminations	2025-04-28 04:08:57.844676+00
78	circuits	0007_circuitterminations_primary_model	2025-04-28 04:08:58.305763+00
79	circuits	0008_add_natural_indexing	2025-04-28 04:08:58.357443+00
80	circuits	0009_circuittermination_location	2025-04-28 04:08:58.452072+00
81	database	0001_initial	2025-04-28 04:08:58.469102+00
82	database	0002_auto_20190129_2304	2025-04-28 04:08:58.477979+00
83	ipam	0002_initial_part_2	2025-04-28 04:09:00.81305+00
84	ipam	0003_remove_max_length	2025-04-28 04:09:01.426456+00
85	ipam	0004_fixup_p2p_broadcast	2025-04-28 04:09:01.523127+00
86	ipam	0005_auto_slug	2025-04-28 04:09:01.563923+00
87	ipam	0006_ipaddress_nat_outside_list	2025-04-28 04:09:01.670452+00
88	ipam	0007_add_natural_indexing	2025-04-28 04:09:02.391414+00
89	ipam	0008_prefix_vlan_vlangroup_location	2025-04-28 04:09:02.868954+00
90	ipam	0009_alter_vlan_name	2025-04-28 04:09:02.96253+00
91	extras	0038_configcontext_locations	2025-04-28 04:09:03.071975+00
92	extras	0039_objectchange__add_change_context	2025-04-28 04:09:03.17248+00
93	extras	0040_dynamicgroup__dynamicgroupmembership	2025-04-28 04:09:03.360339+00
94	extras	0041_jobresult_job_kwargs	2025-04-28 04:09:03.643505+00
95	extras	0042_job__add_is_job_hook_receiver	2025-04-28 04:09:03.699323+00
96	extras	0043_note	2025-04-28 04:09:03.809197+00
97	extras	0044_add_job_hook	2025-04-28 04:09:03.926262+00
98	extras	0045_add_custom_field_slug	2025-04-28 04:09:03.976097+00
99	extras	0046_populate_custom_field_slug_label	2025-04-28 04:09:04.068262+00
100	extras	0047_enforce_custom_field_slug	2025-04-28 04:09:04.123602+00
101	extras	0048_alter_objectchange_change_context_detail	2025-04-28 04:09:04.18006+00
102	extras	0049_alter_tag_slug	2025-04-28 04:09:04.489524+00
103	extras	0050_customfield_grouping	2025-04-28 04:09:04.540406+00
104	extras	0051_add_job_task_queues	2025-04-28 04:09:04.656045+00
105	dcim	0014_location_status_data_migration	2025-04-28 04:09:04.754769+00
106	dcim	0015_device_components__changeloggedmodel	2025-04-28 04:09:06.989917+00
107	dcim	0016_device_components__timestamp_data_migration	2025-04-28 04:09:07.101109+00
108	dcim	0017_locationtype_nestable	2025-04-28 04:09:07.151218+00
109	dcim	0018_device_redundancy_group	2025-04-28 04:09:07.450785+00
110	extras	0052_configcontext_device_redundancy_groups	2025-04-28 04:09:07.566144+00
111	extras	0053_relationship_required_on	2025-04-28 04:09:07.614995+00
112	extras	0054_scheduledjob_kwargs_request_user_change	2025-04-28 04:09:07.705523+00
113	extras	0055_configcontext_dynamic_groups	2025-04-28 04:09:08.251335+00
114	extras	0056_objectchange_add_reverse_time_idx	2025-04-28 04:09:08.307305+00
115	extras	0057_jobbutton	2025-04-28 04:09:08.482827+00
116	extras	0058_jobresult_add_time_status_idxs	2025-04-28 04:09:09.045153+00
117	dcim	0019_device_redundancy_group_data_migration	2025-04-28 04:09:09.146492+00
118	dcim	0020_increase_device_asset_tag_size_limit	2025-04-28 04:09:09.237099+00
119	dcim	0021_platform_network_driver	2025-04-28 04:09:09.25706+00
120	dcim	0022_interface_redundancy_group	2025-04-28 04:09:10.080838+00
121	dcim	0023_interface_redundancy_group_data_migration	2025-04-28 04:09:10.187335+00
122	django_celery_beat	0001_initial	2025-04-28 04:09:10.23315+00
123	django_celery_beat	0002_auto_20161118_0346	2025-04-28 04:09:10.252923+00
124	django_celery_beat	0003_auto_20161209_0049	2025-04-28 04:09:10.269137+00
125	django_celery_beat	0004_auto_20170221_0000	2025-04-28 04:09:10.277282+00
126	django_celery_beat	0005_add_solarschedule_events_choices	2025-04-28 04:09:10.285068+00
127	django_celery_beat	0006_auto_20180322_0932	2025-04-28 04:09:10.321592+00
128	django_celery_beat	0007_auto_20180521_0826	2025-04-28 04:09:10.338765+00
129	django_celery_beat	0008_auto_20180914_1922	2025-04-28 04:09:10.371216+00
130	django_celery_beat	0006_auto_20180210_1226	2025-04-28 04:09:10.391595+00
131	django_celery_beat	0006_periodictask_priority	2025-04-28 04:09:10.401313+00
132	django_celery_beat	0009_periodictask_headers	2025-04-28 04:09:10.413189+00
133	django_celery_beat	0010_auto_20190429_0326	2025-04-28 04:09:10.622447+00
134	django_celery_beat	0011_auto_20190508_0153	2025-04-28 04:09:10.645578+00
135	django_celery_beat	0012_periodictask_expire_seconds	2025-04-28 04:09:10.655783+00
136	django_celery_beat	0013_auto_20200609_0727	2025-04-28 04:09:10.664552+00
137	django_celery_beat	0014_remove_clockedschedule_enabled	2025-04-28 04:09:10.674055+00
138	django_celery_beat	0015_edit_solarschedule_events_choices	2025-04-28 04:09:10.681745+00
139	django_celery_beat	0016_alter_crontabschedule_timezone	2025-04-28 04:09:10.690099+00
140	django_celery_beat	0017_alter_crontabschedule_month_of_year	2025-04-28 04:09:10.698495+00
141	django_celery_beat	0018_improve_crontab_helptext	2025-04-28 04:09:10.706869+00
142	django_rq	0001_initial	2025-04-28 04:09:10.711559+00
143	sessions	0001_initial	2025-04-28 04:09:10.724419+00
144	default	0001_initial	2025-04-28 04:09:11.094227+00
145	social_auth	0001_initial	2025-04-28 04:09:11.096322+00
146	default	0002_add_related_name	2025-04-28 04:09:11.191531+00
147	social_auth	0002_add_related_name	2025-04-28 04:09:11.193326+00
148	default	0003_alter_email_max_length	2025-04-28 04:09:11.203503+00
149	social_auth	0003_alter_email_max_length	2025-04-28 04:09:11.205157+00
150	default	0004_auto_20160423_0400	2025-04-28 04:09:11.223692+00
151	social_auth	0004_auto_20160423_0400	2025-04-28 04:09:11.225505+00
152	social_auth	0005_auto_20160727_2333	2025-04-28 04:09:11.234149+00
153	social_django	0006_partial	2025-04-28 04:09:11.248635+00
154	social_django	0007_code_timestamp	2025-04-28 04:09:11.258549+00
155	social_django	0008_partial_timestamp	2025-04-28 04:09:11.269034+00
156	social_django	0009_auto_20191118_0520	2025-04-28 04:09:11.303887+00
157	social_django	0010_uid_db_index	2025-04-28 04:09:11.324919+00
158	social_django	0011_alter_id_fields	2025-04-28 04:09:11.424474+00
159	taggit	0001_initial	2025-04-28 04:09:11.550961+00
160	taggit	0002_auto_20150616_2121	2025-04-28 04:09:11.603258+00
161	taggit	0003_taggeditem_add_unique_index	2025-04-28 04:09:11.655127+00
162	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2025-04-28 04:09:12.073994+00
163	taggit	0005_auto_20220424_2025	2025-04-28 04:09:12.083536+00
164	tenancy	0002_auto_slug	2025-04-28 04:09:12.276579+00
165	users	0002_token_ordering_by_created	2025-04-28 04:09:12.296169+00
166	virtualization	0002_virtualmachine_local_context_schema	2025-04-28 04:09:12.401444+00
167	virtualization	0003_vminterface_verbose_name	2025-04-28 04:09:12.461905+00
168	virtualization	0004_auto_slug	2025-04-28 04:09:12.792315+00
169	virtualization	0005_add_natural_indexing	2025-04-28 04:09:12.99608+00
170	virtualization	0006_vminterface_status	2025-04-28 04:09:13.100057+00
171	virtualization	0007_vminterface_status_data_migration	2025-04-28 04:09:13.21556+00
172	virtualization	0008_vminterface_parent	2025-04-28 04:09:13.652926+00
173	virtualization	0009_cluster_location	2025-04-28 04:09:13.756549+00
174	social_django	0002_add_related_name	2025-04-28 04:09:13.761581+00
175	social_django	0003_alter_email_max_length	2025-04-28 04:09:13.763307+00
176	social_django	0004_auto_20160423_0400	2025-04-28 04:09:13.765055+00
177	social_django	0001_initial	2025-04-28 04:09:13.767155+00
178	social_django	0005_auto_20160727_2333	2025-04-28 04:09:13.769028+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: extras_computedfield; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_computedfield (id, created, last_updated, slug, label, description, template, fallback_value, weight, content_type_id, advanced_ui) FROM stdin;
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext (id, created, last_updated, name, owner_object_id, weight, description, is_active, data, owner_content_type_id, schema_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_redundancy_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_device_redundancy_groups (id, configcontext_id, deviceredundancygroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_dynamic_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_dynamic_groups (id, configcontext_id, dynamicgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_locations; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_locations (id, configcontext_id, location_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontextschema; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontextschema (id, created, last_updated, _custom_field_data, name, description, slug, data_schema, owner_object_id, owner_content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, created, last_updated, advanced_ui, slug, "grouping") FROM stdin;
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_customfieldchoice; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfieldchoice (id, value, weight, field_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customlink (id, created, last_updated, name, text, target_url, weight, group_name, button_class, new_window, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_dynamicgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_dynamicgroup (_custom_field_data, id, created, last_updated, name, slug, description, filter, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_dynamicgroupmembership; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_dynamicgroupmembership (id, operator, weight, group_id, parent_group_id) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_exporttemplate (id, created, last_updated, owner_object_id, name, description, template_code, mime_type, file_extension, content_type_id, owner_content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_fileattachment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_fileattachment (id, bytes, filename, mimetype) FROM stdin;
\.


--
-- Data for Name: extras_fileproxy; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_fileproxy (id, name, file, uploaded_at) FROM stdin;
\.


--
-- Data for Name: extras_gitrepository; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_gitrepository (id, created, last_updated, _custom_field_data, name, slug, remote_url, branch, current_head, _token, username, provided_contents, secrets_group_id) FROM stdin;
\.


--
-- Data for Name: extras_graphqlquery; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_graphqlquery (id, created, last_updated, name, slug, query, variables) FROM stdin;
\.


--
-- Data for Name: extras_healthchecktestmodel; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_healthchecktestmodel (id, title) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_job; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_job (id, created, last_updated, _custom_field_data, source, module_name, job_class_name, slug, "grouping", name, description, installed, enabled, commit_default, hidden, read_only, approval_required, soft_time_limit, time_limit, grouping_override, name_override, description_override, commit_default_override, hidden_override, read_only_override, approval_required_override, soft_time_limit_override, time_limit_override, git_repository_id, has_sensitive_variables, has_sensitive_variables_override, is_job_hook_receiver, task_queues, task_queues_override, is_job_button_receiver) FROM stdin;
\.


--
-- Data for Name: extras_jobbutton; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_jobbutton (id, created, last_updated, name, text, weight, group_name, button_class, confirmation, job_id) FROM stdin;
\.


--
-- Data for Name: extras_jobbutton_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_jobbutton_content_types (id, jobbutton_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_jobhook; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_jobhook (id, created, last_updated, _custom_field_data, enabled, name, slug, type_create, type_delete, type_update, job_id) FROM stdin;
\.


--
-- Data for Name: extras_jobhook_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_jobhook_content_types (id, jobhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_joblogentry; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_joblogentry (id, log_level, "grouping", message, created, log_object, absolute_url, job_result_id) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id, _custom_field_data, schedule_id, job_model_id, job_kwargs) FROM stdin;
\.


--
-- Data for Name: extras_note; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_note (id, created, last_updated, assigned_object_id, user_name, slug, note, assigned_object_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, object_data, changed_object_type_id, related_object_type_id, user_id, object_data_v2, change_context, change_context_detail) FROM stdin;
\.


--
-- Data for Name: extras_relationship; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_relationship (id, created, last_updated, name, slug, description, type, source_label, source_hidden, source_filter, destination_label, destination_hidden, destination_filter, destination_type_id, source_type_id, advanced_ui, required_on) FROM stdin;
\.


--
-- Data for Name: extras_relationshipassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_relationshipassociation (id, source_id, destination_id, destination_type_id, relationship_id, source_type_id) FROM stdin;
\.


--
-- Data for Name: extras_scheduledjob; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_scheduledjob (id, name, task, job_class, "interval", args, kwargs, queue, one_off, start_time, enabled, last_run_at, total_run_count, date_changed, description, approval_required, approved_at, approved_by_user_id, user_id, job_model_id, crontab) FROM stdin;
\.


--
-- Data for Name: extras_scheduledjobs; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_scheduledjobs (ident, last_update) FROM stdin;
\.


--
-- Data for Name: extras_secret; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secret (id, created, last_updated, _custom_field_data, name, slug, description, provider, parameters) FROM stdin;
\.


--
-- Data for Name: extras_secretsgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secretsgroup (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: extras_secretsgroupassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secretsgroupassociation (id, access_type, secret_type, group_id, secret_id) FROM stdin;
\.


--
-- Data for Name: extras_status; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_status (id, created, last_updated, _custom_field_data, name, color, slug, description) FROM stdin;
26318a0f-1205-463f-9635-d706b1743770	2025-04-28	2025-04-28 04:08:45.303721+00	{}	Planned	00bcd4	planned	Unit has been planned
c0ff12cf-4068-4fcb-8aed-588bebb79444	2025-04-28	2025-04-28 04:08:45.309569+00	{}	Provisioning	2196f3	provisioning	Circuit is being provisioned
d2385400-17cf-4046-b3f8-5607c8ebc0e3	2025-04-28	2025-04-28 04:08:45.3137+00	{}	Active	4caf50	active	Unit is active
5c4308f4-0289-4fc0-b1e4-8be1f8d4be76	2025-04-28	2025-04-28 04:08:45.317718+00	{}	Offline	ffc107	offline	Unit is offline
6f5482f0-857a-496c-9f03-596e5991a80b	2025-04-28	2025-04-28 04:08:45.321714+00	{}	Deprovisioning	ffc107	deprovisioning	Circuit is being deprovisioned
f54fa776-0a0d-44fd-8624-46777217092b	2025-04-28	2025-04-28 04:08:45.325641+00	{}	Decommissioned	9e9e9e	decommissioned	Circuit has been decommissioned
0119d0a5-ea81-42b5-8839-101f14a7b975	2025-04-28	2025-04-28 04:08:45.331893+00	{}	Connected	4caf50	connected	Cable is connected
b2600505-44a5-4bdb-b50c-0112c0eed458	2025-04-28	2025-04-28 04:08:45.339363+00	{}	Decommissioning	ffc107	decommissioning	Unit is being decommissioned
6be7f7ed-028a-487f-bfa6-d4e895cfacbb	2025-04-28	2025-04-28 04:08:45.355598+00	{}	Staged	2196f3	staged	Unit has been staged
1c010009-0a74-4faf-97b5-7a80230dc8d3	2025-04-28	2025-04-28 04:08:45.359596+00	{}	Failed	f44336	failed	Unit has failed
a2cf488a-80d3-48e4-8231-45f0098a101b	2025-04-28	2025-04-28 04:08:45.364493+00	{}	Inventory	9e9e9e	inventory	Device is in inventory
3c4e60ae-5891-486c-9b5e-c5d9ccccf081	2025-04-28	2025-04-28 04:08:45.386708+00	{}	Maintenance	9e9e9e	maintenance	Unit is under maintenance
1c867662-68d5-41f0-95cd-81c3cd8ee1b3	2025-04-28	2025-04-28 04:08:45.395999+00	{}	Staging	2196f3	staging	Site or Location is in the process of being staged
1afc2ff7-fb12-46c0-94bb-0e805ec4ac00	2025-04-28	2025-04-28 04:08:45.406484+00	{}	Retired	f44336	retired	Site or Location has been retired
4efd1f3b-0a01-4ae2-a26a-c861f32964e2	2025-04-28	2025-04-28 04:08:45.427884+00	{}	Reserved	00bcd4	reserved	Unit is reserved
fa175422-da54-4330-97ed-c45da8508b09	2025-04-28	2025-04-28 04:08:45.431936+00	{}	Available	4caf50	available	Unit is available
579c6d20-a1f9-4d5e-acbc-a3410511d530	2025-04-28	2025-04-28 04:08:45.442615+00	{}	Deprecated	f44336	deprecated	Unit has been deprecated
d3ec3f3e-9f3c-438a-b61c-4fabfe323665	2025-04-28	2025-04-28 04:08:45.513764+00	{}	DHCP	4caf50	dhcp	Dynamically assigned IPv4/IPv6 address
43289abb-7254-4925-86bd-d4ca6b2b902e	2025-04-28	2025-04-28 04:08:45.518065+00	{}	SLAAC	4caf50	slaac	Dynamically assigned IPv6 address
2425bd3d-63da-4c98-9c5b-999c6752d9ed	2025-04-28	2025-04-28 04:08:45.52415+00	{}	Container	9e9e9e	container	Network contains children
\.


--
-- Data for Name: extras_status_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_status_content_types (id, status_id, contenttype_id) FROM stdin;
1	26318a0f-1205-463f-9635-d706b1743770	1
2	c0ff12cf-4068-4fcb-8aed-588bebb79444	1
3	d2385400-17cf-4046-b3f8-5607c8ebc0e3	1
4	5c4308f4-0289-4fc0-b1e4-8be1f8d4be76	1
5	6f5482f0-857a-496c-9f03-596e5991a80b	1
6	f54fa776-0a0d-44fd-8624-46777217092b	1
7	0119d0a5-ea81-42b5-8839-101f14a7b975	2
8	26318a0f-1205-463f-9635-d706b1743770	2
9	b2600505-44a5-4bdb-b50c-0112c0eed458	2
10	5c4308f4-0289-4fc0-b1e4-8be1f8d4be76	3
11	d2385400-17cf-4046-b3f8-5607c8ebc0e3	3
12	26318a0f-1205-463f-9635-d706b1743770	3
13	6be7f7ed-028a-487f-bfa6-d4e895cfacbb	3
14	1c010009-0a74-4faf-97b5-7a80230dc8d3	3
15	a2cf488a-80d3-48e4-8231-45f0098a101b	3
16	b2600505-44a5-4bdb-b50c-0112c0eed458	3
17	26318a0f-1205-463f-9635-d706b1743770	4
18	1c010009-0a74-4faf-97b5-7a80230dc8d3	4
19	d2385400-17cf-4046-b3f8-5607c8ebc0e3	4
20	b2600505-44a5-4bdb-b50c-0112c0eed458	4
21	3c4e60ae-5891-486c-9b5e-c5d9ccccf081	4
22	26318a0f-1205-463f-9635-d706b1743770	5
23	1c867662-68d5-41f0-95cd-81c3cd8ee1b3	5
24	d2385400-17cf-4046-b3f8-5607c8ebc0e3	5
25	b2600505-44a5-4bdb-b50c-0112c0eed458	5
26	1afc2ff7-fb12-46c0-94bb-0e805ec4ac00	5
27	5c4308f4-0289-4fc0-b1e4-8be1f8d4be76	6
28	d2385400-17cf-4046-b3f8-5607c8ebc0e3	6
29	26318a0f-1205-463f-9635-d706b1743770	6
30	1c010009-0a74-4faf-97b5-7a80230dc8d3	6
31	4efd1f3b-0a01-4ae2-a26a-c861f32964e2	7
32	fa175422-da54-4330-97ed-c45da8508b09	7
33	26318a0f-1205-463f-9635-d706b1743770	7
34	d2385400-17cf-4046-b3f8-5607c8ebc0e3	7
35	579c6d20-a1f9-4d5e-acbc-a3410511d530	7
36	26318a0f-1205-463f-9635-d706b1743770	8
37	1c867662-68d5-41f0-95cd-81c3cd8ee1b3	8
38	d2385400-17cf-4046-b3f8-5607c8ebc0e3	8
39	b2600505-44a5-4bdb-b50c-0112c0eed458	8
40	1afc2ff7-fb12-46c0-94bb-0e805ec4ac00	8
41	26318a0f-1205-463f-9635-d706b1743770	9
42	1c867662-68d5-41f0-95cd-81c3cd8ee1b3	9
43	d2385400-17cf-4046-b3f8-5607c8ebc0e3	9
44	b2600505-44a5-4bdb-b50c-0112c0eed458	9
45	1afc2ff7-fb12-46c0-94bb-0e805ec4ac00	9
46	26318a0f-1205-463f-9635-d706b1743770	10
47	1c867662-68d5-41f0-95cd-81c3cd8ee1b3	10
48	d2385400-17cf-4046-b3f8-5607c8ebc0e3	10
49	b2600505-44a5-4bdb-b50c-0112c0eed458	10
50	1afc2ff7-fb12-46c0-94bb-0e805ec4ac00	10
51	d2385400-17cf-4046-b3f8-5607c8ebc0e3	11
52	4efd1f3b-0a01-4ae2-a26a-c861f32964e2	11
53	579c6d20-a1f9-4d5e-acbc-a3410511d530	11
54	d3ec3f3e-9f3c-438a-b61c-4fabfe323665	11
55	43289abb-7254-4925-86bd-d4ca6b2b902e	11
56	2425bd3d-63da-4c98-9c5b-999c6752d9ed	12
57	d2385400-17cf-4046-b3f8-5607c8ebc0e3	12
58	4efd1f3b-0a01-4ae2-a26a-c861f32964e2	12
59	579c6d20-a1f9-4d5e-acbc-a3410511d530	12
60	d2385400-17cf-4046-b3f8-5607c8ebc0e3	13
61	4efd1f3b-0a01-4ae2-a26a-c861f32964e2	13
62	579c6d20-a1f9-4d5e-acbc-a3410511d530	13
63	5c4308f4-0289-4fc0-b1e4-8be1f8d4be76	14
64	d2385400-17cf-4046-b3f8-5607c8ebc0e3	14
65	26318a0f-1205-463f-9635-d706b1743770	14
66	6be7f7ed-028a-487f-bfa6-d4e895cfacbb	14
67	1c010009-0a74-4faf-97b5-7a80230dc8d3	14
68	b2600505-44a5-4bdb-b50c-0112c0eed458	14
69	1c010009-0a74-4faf-97b5-7a80230dc8d3	15
70	d2385400-17cf-4046-b3f8-5607c8ebc0e3	15
71	b2600505-44a5-4bdb-b50c-0112c0eed458	15
72	3c4e60ae-5891-486c-9b5e-c5d9ccccf081	15
73	26318a0f-1205-463f-9635-d706b1743770	15
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_tag (name, slug, id, created, last_updated, _custom_field_data, color, description) FROM stdin;
\.


--
-- Data for Name: extras_tag_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_tag_content_types (id, tag_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_webhook (id, created, last_updated, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_aggregate (id, created, last_updated, _custom_field_data, network, broadcast, prefix_length, date_added, description, rir_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_ipaddress (id, created, last_updated, _custom_field_data, host, broadcast, prefix_length, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, status_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_prefix (id, created, last_updated, _custom_field_data, network, broadcast, prefix_length, is_pool, description, role_id, site_id, status_id, tenant_id, vlan_id, vrf_id, location_id) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_rir (id, created, last_updated, _custom_field_data, name, slug, is_private, description) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_role (id, created, last_updated, _custom_field_data, name, slug, weight, description) FROM stdin;
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_routetarget (id, created, last_updated, _custom_field_data, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_service (id, created, last_updated, _custom_field_data, name, protocol, ports, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlan (id, created, last_updated, _custom_field_data, vid, name, description, group_id, role_id, site_id, status_id, tenant_id, location_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlangroup (id, created, last_updated, _custom_field_data, name, slug, description, site_id, location_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf (id, created, last_updated, _custom_field_data, name, rd, enforce_unique, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id, created, modified) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.tenancy_tenant (id, created, last_updated, _custom_field_data, name, slug, description, comments, group_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.tenancy_tenantgroup (id, created, last_updated, _custom_field_data, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_cluster (id, created, last_updated, _custom_field_data, name, comments, group_id, site_id, tenant_id, type_id, location_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_clustergroup (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_clustertype (id, created, last_updated, _custom_field_data, name, slug, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_virtualmachine (id, created, last_updated, _custom_field_data, local_context_data, local_context_data_owner_object_id, name, vcpus, memory, disk, comments, cluster_id, local_context_data_owner_content_type_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, status_id, tenant_id, local_context_schema_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_vminterface (id, _custom_field_data, enabled, mac_address, mtu, mode, name, _name, description, untagged_vlan_id, virtual_machine_id, status_id, parent_interface_id, bridge_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 467, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: constance_config_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.constance_config_id_seq', 1, false);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_locationtype_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.dcim_locationtype_content_types_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 118, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 178, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_redundancy_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_device_redundancy_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_dynamic_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_dynamic_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_locations_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 1, false);


--
-- Name: extras_jobbutton_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_jobbutton_content_types_id_seq', 1, false);


--
-- Name: extras_jobhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_jobhook_content_types_id_seq', 1, false);


--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_status_content_types_id_seq', 73, true);


--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_tag_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_id_name_6f6610a0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_id_name_6f6610a0_uniq UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_name; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_name UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_slug_key UNIQUE (slug);


--
-- Name: constance_config constance_config_key_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_key_key UNIQUE (key);


--
-- Name: constance_config constance_config_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.constance_config
    ADD CONSTRAINT constance_config_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_deviceredundancygroup dcim_deviceredundancygroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_deviceredundancygroup
    ADD CONSTRAINT dcim_deviceredundancygroup_name_key UNIQUE (name);


--
-- Name: dcim_deviceredundancygroup dcim_deviceredundancygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_deviceredundancygroup
    ADD CONSTRAINT dcim_deviceredundancygroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_deviceredundancygroup dcim_deviceredundancygroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_deviceredundancygroup
    ADD CONSTRAINT dcim_deviceredundancygroup_slug_key UNIQUE (slug);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfaceredundancygroupassociation dcim_interfaceredundancy_interface_redundancy_gro_5aece630_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroupassociation
    ADD CONSTRAINT dcim_interfaceredundancy_interface_redundancy_gro_5aece630_uniq UNIQUE (interface_redundancy_group_id, interface_id);


--
-- Name: dcim_interfaceredundancygroup dcim_interfaceredundancygroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroup
    ADD CONSTRAINT dcim_interfaceredundancygroup_name_key UNIQUE (name);


--
-- Name: dcim_interfaceredundancygroup dcim_interfaceredundancygroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroup
    ADD CONSTRAINT dcim_interfaceredundancygroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfaceredundancygroupassociation dcim_interfaceredundancygroupassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroupassociation
    ADD CONSTRAINT dcim_interfaceredundancygroupassociation_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_parent_id_name_1e7c6218_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_name_1e7c6218_uniq UNIQUE (parent_id, name);


--
-- Name: dcim_location dcim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_slug_key UNIQUE (slug);


--
-- Name: dcim_locationtype_content_types dcim_locationtype_conten_locationtype_id_contentt_58938a25_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype_content_types
    ADD CONSTRAINT dcim_locationtype_conten_locationtype_id_contentt_58938a25_uniq UNIQUE (locationtype_id, contenttype_id);


--
-- Name: dcim_locationtype_content_types dcim_locationtype_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype_content_types
    ADD CONSTRAINT dcim_locationtype_content_types_pkey PRIMARY KEY (id);


--
-- Name: dcim_locationtype dcim_locationtype_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype
    ADD CONSTRAINT dcim_locationtype_name_key UNIQUE (name);


--
-- Name: dcim_locationtype dcim_locationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype
    ADD CONSTRAINT dcim_locationtype_pkey PRIMARY KEY (id);


--
-- Name: dcim_locationtype dcim_locationtype_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype
    ADD CONSTRAINT dcim_locationtype_slug_key UNIQUE (slug);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_group_id_facility_id_f16a53ae_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_facility_id_f16a53ae_uniq UNIQUE (group_id, facility_id);


--
-- Name: dcim_rack dcim_rack_group_id_name_846f3826_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_name_846f3826_uniq UNIQUE (group_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_name_c9bd921f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_name_c9bd921f_uniq UNIQUE (site_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_slug_7fbfd118_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_slug_7fbfd118_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_computedfield extras_computedfield_content_type_id_label_021486c8_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_content_type_id_label_021486c8_uniq UNIQUE (content_type_id, label);


--
-- Name: extras_computedfield extras_computedfield_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_pkey PRIMARY KEY (id);


--
-- Name: extras_computedfield extras_computedfield_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_slug_key UNIQUE (slug);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_redundancy_groups extras_configcontext_dev_configcontext_id_devicer_80f1d0b0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_redundancy_groups
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicer_80f1d0b0_uniq UNIQUE (configcontext_id, deviceredundancygroup_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_redundancy_groups extras_configcontext_device_redundancy_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_redundancy_groups
    ADD CONSTRAINT extras_configcontext_device_redundancy_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_dynamic_groups extras_configcontext_dyn_configcontext_id_dynamic_2eea3817_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_dynamic_groups
    ADD CONSTRAINT extras_configcontext_dyn_configcontext_id_dynamic_2eea3817_uniq UNIQUE (configcontext_id, dynamicgroup_id);


--
-- Name: extras_configcontext_dynamic_groups extras_configcontext_dynamic_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_dynamic_groups
    ADD CONSTRAINT extras_configcontext_dynamic_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_locations extras_configcontext_loc_configcontext_id_locatio_15d9b342_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_loc_configcontext_id_locatio_15d9b342_uniq UNIQUE (configcontext_id, location_id);


--
-- Name: extras_configcontext_locations extras_configcontext_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_locations_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_owner_content_type__c289e08f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_owner_content_type__c289e08f_uniq UNIQUE (name, owner_content_type_id, owner_object_id);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontextschema extras_configcontextschema_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontextschema_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_slug_ed27c4fe_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_slug_ed27c4fe_uniq UNIQUE (slug);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_field_id_value_f959a108_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_field_id_value_f959a108_uniq UNIQUE (field_id, value);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_dynamicgroup extras_dynamicgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_name_key UNIQUE (name);


--
-- Name: extras_dynamicgroup extras_dynamicgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_pkey PRIMARY KEY (id);


--
-- Name: extras_dynamicgroup extras_dynamicgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_slug_key UNIQUE (slug);


--
-- Name: extras_dynamicgroupmembership extras_dynamicgroupmembe_group_id_parent_group_id_0011d94d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroupmembership
    ADD CONSTRAINT extras_dynamicgroupmembe_group_id_parent_group_id_0011d94d_uniq UNIQUE (group_id, parent_group_id, operator, weight);


--
-- Name: extras_dynamicgroupmembership extras_dynamicgroupmembership_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroupmembership
    ADD CONSTRAINT extras_dynamicgroupmembership_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_own_3b6ea31b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_own_3b6ea31b_uniq UNIQUE (content_type_id, name, owner_content_type_id, owner_object_id);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_fileattachment extras_fileattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_fileattachment
    ADD CONSTRAINT extras_fileattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_fileproxy extras_fileproxy_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_fileproxy
    ADD CONSTRAINT extras_fileproxy_pkey PRIMARY KEY (id);


--
-- Name: extras_gitrepository extras_gitrepository_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_name_key UNIQUE (name);


--
-- Name: extras_gitrepository extras_gitrepository_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_pkey PRIMARY KEY (id);


--
-- Name: extras_gitrepository extras_gitrepository_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_slug_key UNIQUE (slug);


--
-- Name: extras_graphqlquery extras_graphqlquery_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_graphqlquery
    ADD CONSTRAINT extras_graphqlquery_name_key UNIQUE (name);


--
-- Name: extras_graphqlquery extras_graphqlquery_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_graphqlquery
    ADD CONSTRAINT extras_graphqlquery_pkey PRIMARY KEY (id);


--
-- Name: extras_graphqlquery extras_graphqlquery_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_graphqlquery
    ADD CONSTRAINT extras_graphqlquery_slug_key UNIQUE (slug);


--
-- Name: extras_healthchecktestmodel extras_healthchecktestmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_healthchecktestmodel
    ADD CONSTRAINT extras_healthchecktestmodel_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_job extras_job_grouping_name_8cbc9328_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_grouping_name_8cbc9328_uniq UNIQUE ("grouping", name);


--
-- Name: extras_job extras_job_source_git_repository_id_e6dfe58c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_source_git_repository_id_e6dfe58c_uniq UNIQUE (source, git_repository_id, module_name, job_class_name);


--
-- Name: extras_jobbutton_content_types extras_jobbutton_content_jobbutton_id_contenttype_058baab2_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton_content_types
    ADD CONSTRAINT extras_jobbutton_content_jobbutton_id_contenttype_058baab2_uniq UNIQUE (jobbutton_id, contenttype_id);


--
-- Name: extras_jobbutton_content_types extras_jobbutton_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton_content_types
    ADD CONSTRAINT extras_jobbutton_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_jobbutton extras_jobbutton_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton
    ADD CONSTRAINT extras_jobbutton_name_key UNIQUE (name);


--
-- Name: extras_jobbutton extras_jobbutton_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton
    ADD CONSTRAINT extras_jobbutton_pkey PRIMARY KEY (id);


--
-- Name: extras_jobhook_content_types extras_jobhook_content_t_jobhook_id_contenttype_i_c21a50f9_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook_content_types
    ADD CONSTRAINT extras_jobhook_content_t_jobhook_id_contenttype_i_c21a50f9_uniq UNIQUE (jobhook_id, contenttype_id);


--
-- Name: extras_jobhook_content_types extras_jobhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook_content_types
    ADD CONSTRAINT extras_jobhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_jobhook extras_jobhook_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook
    ADD CONSTRAINT extras_jobhook_name_key UNIQUE (name);


--
-- Name: extras_jobhook extras_jobhook_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook
    ADD CONSTRAINT extras_jobhook_pkey PRIMARY KEY (id);


--
-- Name: extras_jobhook extras_jobhook_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook
    ADD CONSTRAINT extras_jobhook_slug_key UNIQUE (slug);


--
-- Name: extras_joblogentry extras_joblogentry_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_joblogentry
    ADD CONSTRAINT extras_joblogentry_pkey PRIMARY KEY (id);


--
-- Name: extras_job extras_jobmodel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_jobmodel_pkey PRIMARY KEY (id);


--
-- Name: extras_job extras_jobmodel_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_jobmodel_slug_key UNIQUE (slug);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_note extras_note_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_note
    ADD CONSTRAINT extras_note_pkey PRIMARY KEY (id);


--
-- Name: extras_note extras_note_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_note
    ADD CONSTRAINT extras_note_slug_key UNIQUE (slug);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_relationship extras_relationship_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_name_key UNIQUE (name);


--
-- Name: extras_relationship extras_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_pkey PRIMARY KEY (id);


--
-- Name: extras_relationship extras_relationship_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_slug_key UNIQUE (slug);


--
-- Name: extras_relationshipassociation extras_relationshipassoc_relationship_id_source_t_6826a98b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipassoc_relationship_id_source_t_6826a98b_uniq UNIQUE (relationship_id, source_type_id, source_id, destination_type_id, destination_id);


--
-- Name: extras_relationshipassociation extras_relationshipassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipassociation_pkey PRIMARY KEY (id);


--
-- Name: extras_scheduledjob extras_scheduledjob_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_pkey PRIMARY KEY (id);


--
-- Name: extras_scheduledjobs extras_scheduledjobs_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjobs
    ADD CONSTRAINT extras_scheduledjobs_pkey PRIMARY KEY (ident);


--
-- Name: extras_secret extras_secret_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secret
    ADD CONSTRAINT extras_secret_name_key UNIQUE (name);


--
-- Name: extras_secret extras_secret_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secret
    ADD CONSTRAINT extras_secret_pkey PRIMARY KEY (id);


--
-- Name: extras_secret extras_secret_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secret
    ADD CONSTRAINT extras_secret_slug_key UNIQUE (slug);


--
-- Name: extras_secretsgroup extras_secretsgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroup
    ADD CONSTRAINT extras_secretsgroup_name_key UNIQUE (name);


--
-- Name: extras_secretsgroup extras_secretsgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroup
    ADD CONSTRAINT extras_secretsgroup_pkey PRIMARY KEY (id);


--
-- Name: extras_secretsgroup extras_secretsgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroup
    ADD CONSTRAINT extras_secretsgroup_slug_key UNIQUE (slug);


--
-- Name: extras_secretsgroupassociation extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq UNIQUE (group_id, access_type, secret_type);


--
-- Name: extras_secretsgroupassociation extras_secretsgroupassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupassociation_pkey PRIMARY KEY (id);


--
-- Name: extras_status_content_types extras_status_content_ty_status_id_contenttype_id_423e142c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_content_ty_status_id_contenttype_id_423e142c_uniq UNIQUE (status_id, contenttype_id);


--
-- Name: extras_status_content_types extras_status_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_status extras_status_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status
    ADD CONSTRAINT extras_status_name_key UNIQUE (name);


--
-- Name: extras_status extras_status_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status
    ADD CONSTRAINT extras_status_pkey PRIMARY KEY (id);


--
-- Name: extras_status extras_status_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status
    ADD CONSTRAINT extras_status_slug_key UNIQUE (slug);


--
-- Name: extras_tag_content_types extras_tag_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_tag_content_types extras_tag_content_types_tag_id_contenttype_id_726a20d6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_types_tag_id_contenttype_id_726a20d6_uniq UNIQUE (tag_id, contenttype_id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_name_a38e981b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_name_a38e981b_uniq UNIQUE (site_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_slug_6372a304_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_slug_6372a304_uniq UNIQUE (site_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: extras_configcontextschema unique_name_owner; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT unique_name_owner UNIQUE (name, owner_content_type_id, owner_object_id);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_status_id_6433793f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_status_id_6433793f ON public.circuits_circuit USING btree (status_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_cable_peer_type_id);


--
-- Name: circuits_circuittermination__path_id_6dfd8db0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination__path_id_6dfd8db0 ON public.circuits_circuittermination USING btree (_path_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_location_id_9896bd96; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_location_id_9896bd96 ON public.circuits_circuittermination USING btree (location_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_name_9d69fb4d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_name_9d69fb4d ON public.circuits_providernetwork USING btree (name);


--
-- Name: circuits_providernetwork_name_9d69fb4d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_name_9d69fb4d_like ON public.circuits_providernetwork USING btree (name varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: circuits_providernetwork_slug_7a769c16_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_providernetwork_slug_7a769c16_like ON public.circuits_providernetwork USING btree (slug varchar_pattern_ops);


--
-- Name: constance_config_key_baef3136_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX constance_config_key_baef3136_like ON public.constance_config USING btree (key varchar_pattern_ops);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_status_id_6a580869; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable_status_id_6a580869 ON public.dcim_cable USING btree (status_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleport__name_6ac60d99; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__name_6ac60d99 ON public.dcim_consoleport USING btree (_name);


--
-- Name: dcim_consoleport__name_6ac60d99_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__name_6ac60d99_like ON public.dcim_consoleport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleport_name_ef94d0d1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_name_ef94d0d1 ON public.dcim_consoleport USING btree (name);


--
-- Name: dcim_consoleport_name_ef94d0d1_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleport_name_ef94d0d1_like ON public.dcim_consoleport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleserverport__name_70f9317c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__name_70f9317c ON public.dcim_consoleserverport USING btree (_name);


--
-- Name: dcim_consoleserverport__name_70f9317c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__name_70f9317c_like ON public.dcim_consoleserverport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverport_name_2319aaf4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_name_2319aaf4 ON public.dcim_consoleserverport USING btree (name);


--
-- Name: dcim_consoleserverport_name_2319aaf4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverport_name_2319aaf4_like ON public.dcim_consoleserverport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device__name_a8ed2cdf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device__name_a8ed2cdf ON public.dcim_device USING btree (_name);


--
-- Name: dcim_device__name_a8ed2cdf_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device__name_a8ed2cdf_like ON public.dcim_device USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_redundancy_group_id_ca97f1fc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_redundancy_group_id_ca97f1fc ON public.dcim_device USING btree (device_redundancy_group_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_local_context_data_owner_content_type_id_5d06013b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_local_context_data_owner_content_type_id_5d06013b ON public.dcim_device USING btree (local_context_data_owner_content_type_id);


--
-- Name: dcim_device_local_context_schema_id_0ff8d657; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_local_context_schema_id_0ff8d657 ON public.dcim_device USING btree (local_context_schema_id);


--
-- Name: dcim_device_location_id_11a7bedb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_location_id_11a7bedb ON public.dcim_device USING btree (location_id);


--
-- Name: dcim_device_name_cfa61dd8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_name_cfa61dd8 ON public.dcim_device USING btree (name);


--
-- Name: dcim_device_name_cfa61dd8_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_name_cfa61dd8_like ON public.dcim_device USING btree (name varchar_pattern_ops);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_secrets_group_id_52d75f4a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_secrets_group_id_52d75f4a ON public.dcim_device USING btree (secrets_group_id);


--
-- Name: dcim_device_serial_9170722b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_serial_9170722b ON public.dcim_device USING btree (serial);


--
-- Name: dcim_device_serial_9170722b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_serial_9170722b_like ON public.dcim_device USING btree (serial varchar_pattern_ops);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_status_id_96d2fc6f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_status_id_96d2fc6f ON public.dcim_device USING btree (status_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay__name_d9f2bdd3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay__name_d9f2bdd3 ON public.dcim_devicebay USING btree (_name);


--
-- Name: dcim_devicebay__name_d9f2bdd3_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay__name_d9f2bdd3_like ON public.dcim_devicebay USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebay_name_ee470978; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay_name_ee470978 ON public.dcim_devicebay USING btree (name);


--
-- Name: dcim_devicebay_name_ee470978_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebay_name_ee470978_like ON public.dcim_devicebay USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_deviceredundancygroup_name_54930246_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_name_54930246_like ON public.dcim_deviceredundancygroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_deviceredundancygroup_secrets_group_id_19061ee9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_secrets_group_id_19061ee9 ON public.dcim_deviceredundancygroup USING btree (secrets_group_id);


--
-- Name: dcim_deviceredundancygroup_slug_a121420d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_slug_a121420d_like ON public.dcim_deviceredundancygroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_deviceredundancygroup_status_id_de1ca6f3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_status_id_de1ca6f3 ON public.dcim_deviceredundancygroup USING btree (status_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_cable_peer_type_id);


--
-- Name: dcim_frontport__name_273b2ca3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport__name_273b2ca3 ON public.dcim_frontport USING btree (_name);


--
-- Name: dcim_frontport__name_273b2ca3_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport__name_273b2ca3_like ON public.dcim_frontport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_name_8972111f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_name_8972111f ON public.dcim_frontport USING btree (name);


--
-- Name: dcim_frontport_name_8972111f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_name_8972111f_like ON public.dcim_frontport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_cable_peer_type_id);


--
-- Name: dcim_interface__name_8796fa61; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__name_8796fa61 ON public.dcim_interface USING btree (_name);


--
-- Name: dcim_interface__name_8796fa61_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__name_8796fa61_like ON public.dcim_interface USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_bridge_id_f2a8df85; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_bridge_id_f2a8df85 ON public.dcim_interface USING btree (bridge_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_name_bc4e48ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_name_bc4e48ab ON public.dcim_interface USING btree (name);


--
-- Name: dcim_interface_name_bc4e48ab_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_name_bc4e48ab_like ON public.dcim_interface USING btree (name varchar_pattern_ops);


--
-- Name: dcim_interface_parent_interface_id_dc46b61a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_parent_interface_id_dc46b61a ON public.dcim_interface USING btree (parent_interface_id);


--
-- Name: dcim_interface_status_id_5d68d3d6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_status_id_5d68d3d6 ON public.dcim_interface USING btree (status_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interfaceredundancygr_interface_redundancy_group_a12adcaa; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfaceredundancygr_interface_redundancy_group_a12adcaa ON public.dcim_interfaceredundancygroupassociation USING btree (interface_redundancy_group_id);


--
-- Name: dcim_interfaceredundancygroup_name_908bfaee_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfaceredundancygroup_name_908bfaee_like ON public.dcim_interfaceredundancygroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_interfaceredundancygroup_secrets_group_id_e31c9631; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfaceredundancygroup_secrets_group_id_e31c9631 ON public.dcim_interfaceredundancygroup USING btree (secrets_group_id);


--
-- Name: dcim_interfaceredundancygroup_status_id_751f2043; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfaceredundancygroup_status_id_751f2043 ON public.dcim_interfaceredundancygroup USING btree (status_id);


--
-- Name: dcim_interfaceredundancygroup_virtual_ip_id_14cbd633; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfaceredundancygroup_virtual_ip_id_14cbd633 ON public.dcim_interfaceredundancygroup USING btree (virtual_ip_id);


--
-- Name: dcim_interfaceredundancygroupassociation_interface_id_a2cd97e8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfaceredundancygroupassociation_interface_id_a2cd97e8 ON public.dcim_interfaceredundancygroupassociation USING btree (interface_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem__name_959f73cc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem__name_959f73cc ON public.dcim_inventoryitem USING btree (_name);


--
-- Name: dcim_inventoryitem__name_959f73cc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem__name_959f73cc_like ON public.dcim_inventoryitem USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_name_3e415949; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_name_3e415949 ON public.dcim_inventoryitem USING btree (name);


--
-- Name: dcim_inventoryitem_name_3e415949_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_name_3e415949_like ON public.dcim_inventoryitem USING btree (name varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_serial_9f53019e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_serial_9f53019e ON public.dcim_inventoryitem USING btree (serial);


--
-- Name: dcim_inventoryitem_serial_9f53019e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_serial_9f53019e_like ON public.dcim_inventoryitem USING btree (serial varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_location__name_09ea12a5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location__name_09ea12a5 ON public.dcim_location USING btree (_name);


--
-- Name: dcim_location__name_09ea12a5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location__name_09ea12a5_like ON public.dcim_location USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_location_location_type_id_511a9421; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_location_type_id_511a9421 ON public.dcim_location USING btree (location_type_id);


--
-- Name: dcim_location_name_da208275; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_name_da208275 ON public.dcim_location USING btree (name);


--
-- Name: dcim_location_name_da208275_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_name_da208275_like ON public.dcim_location USING btree (name varchar_pattern_ops);


--
-- Name: dcim_location_parent_id_d77f3318; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_parent_id_d77f3318 ON public.dcim_location USING btree (parent_id);


--
-- Name: dcim_location_site_id_b55e975f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_site_id_b55e975f ON public.dcim_location USING btree (site_id);


--
-- Name: dcim_location_slug_352c5472_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_slug_352c5472_like ON public.dcim_location USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_location_status_id_3d74f10a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_status_id_3d74f10a ON public.dcim_location USING btree (status_id);


--
-- Name: dcim_location_tenant_id_2c4df974; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_location_tenant_id_2c4df974 ON public.dcim_location USING btree (tenant_id);


--
-- Name: dcim_locationtype_content_types_contenttype_id_806c318e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_locationtype_content_types_contenttype_id_806c318e ON public.dcim_locationtype_content_types USING btree (contenttype_id);


--
-- Name: dcim_locationtype_content_types_locationtype_id_daa2005b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_locationtype_content_types_locationtype_id_daa2005b ON public.dcim_locationtype_content_types USING btree (locationtype_id);


--
-- Name: dcim_locationtype_name_1eab0ffa_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_locationtype_name_1eab0ffa_like ON public.dcim_locationtype USING btree (name varchar_pattern_ops);


--
-- Name: dcim_locationtype_parent_id_023ca1c8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_locationtype_parent_id_023ca1c8 ON public.dcim_locationtype USING btree (parent_id);


--
-- Name: dcim_locationtype_slug_f15ea070_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_locationtype_slug_f15ea070_like ON public.dcim_locationtype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_powerfeed_status_id_8c424cc3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerfeed_status_id_8c424cc3 ON public.dcim_powerfeed USING btree (status_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_cable_peer_type_id);


--
-- Name: dcim_poweroutlet__name_0ecdd374; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__name_0ecdd374 ON public.dcim_poweroutlet USING btree (_name);


--
-- Name: dcim_poweroutlet__name_0ecdd374_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__name_0ecdd374_like ON public.dcim_poweroutlet USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_name_98c8e7a2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_name_98c8e7a2 ON public.dcim_poweroutlet USING btree (name);


--
-- Name: dcim_poweroutlet_name_98c8e7a2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_name_98c8e7a2_like ON public.dcim_poweroutlet USING btree (name varchar_pattern_ops);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_location_id_474b60f8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_location_id_474b60f8 ON public.dcim_powerpanel USING btree (location_id);


--
-- Name: dcim_powerpanel_name_09946067; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_name_09946067 ON public.dcim_powerpanel USING btree (name);


--
-- Name: dcim_powerpanel_name_09946067_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_name_09946067_like ON public.dcim_powerpanel USING btree (name varchar_pattern_ops);


--
-- Name: dcim_powerpanel_rack_group_id_76467cc9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_rack_group_id_76467cc9 ON public.dcim_powerpanel USING btree (rack_group_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerport__name_cd2ccdac; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__name_cd2ccdac ON public.dcim_powerport USING btree (_name);


--
-- Name: dcim_powerport__name_cd2ccdac_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__name_cd2ccdac_like ON public.dcim_powerport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerport_name_8b95aa68; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_name_8b95aa68 ON public.dcim_powerport USING btree (name);


--
-- Name: dcim_powerport_name_8b95aa68_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerport_name_8b95aa68_like ON public.dcim_powerport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack__name_e3323581; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack__name_e3323581 ON public.dcim_rack USING btree (_name);


--
-- Name: dcim_rack__name_e3323581_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack__name_e3323581_like ON public.dcim_rack USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_group_id_44e90ea9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_group_id_44e90ea9 ON public.dcim_rack USING btree (group_id);


--
-- Name: dcim_rack_location_id_5f63ec31; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_location_id_5f63ec31 ON public.dcim_rack USING btree (location_id);


--
-- Name: dcim_rack_name_b74aa0b4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_name_b74aa0b4 ON public.dcim_rack USING btree (name);


--
-- Name: dcim_rack_name_b74aa0b4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_name_b74aa0b4_like ON public.dcim_rack USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_serial_d9cd7ac4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_serial_d9cd7ac4 ON public.dcim_rack USING btree (serial);


--
-- Name: dcim_rack_serial_d9cd7ac4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_serial_d9cd7ac4_like ON public.dcim_rack USING btree (serial varchar_pattern_ops);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_status_id_ee3dee3e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_status_id_ee3dee3e ON public.dcim_rack USING btree (status_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackgroup_location_id_5a6fdeac; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_location_id_5a6fdeac ON public.dcim_rackgroup USING btree (location_id);


--
-- Name: dcim_rackgroup_name_6a84593a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_name_6a84593a ON public.dcim_rackgroup USING btree (name);


--
-- Name: dcim_rackgroup_name_6a84593a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_name_6a84593a_like ON public.dcim_rackgroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackgroup_parent_id_cc315105; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_parent_id_cc315105 ON public.dcim_rackgroup USING btree (parent_id);


--
-- Name: dcim_rackgroup_site_id_13520e89; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_site_id_13520e89 ON public.dcim_rackgroup USING btree (site_id);


--
-- Name: dcim_rackgroup_slug_3f4582a7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7 ON public.dcim_rackgroup USING btree (slug);


--
-- Name: dcim_rackgroup_slug_3f4582a7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7_like ON public.dcim_rackgroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rackgroup_tree_id_9c2ad6f4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackgroup_tree_id_9c2ad6f4 ON public.dcim_rackgroup USING btree (tree_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_cable_peer_type_id);


--
-- Name: dcim_rearport__name_50f20c9e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport__name_50f20c9e ON public.dcim_rearport USING btree (_name);


--
-- Name: dcim_rearport__name_50f20c9e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport__name_50f20c9e_like ON public.dcim_rearport USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearport_name_2300a129; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_name_2300a129 ON public.dcim_rearport USING btree (name);


--
-- Name: dcim_rearport_name_2300a129_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearport_name_2300a129_like ON public.dcim_rearport USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site__name_6144ca75; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site__name_6144ca75 ON public.dcim_site USING btree (_name);


--
-- Name: dcim_site__name_6144ca75_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site__name_6144ca75_like ON public.dcim_site USING btree (_name varchar_pattern_ops);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_status_id_e6a50f56; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_status_id_e6a50f56 ON public.dcim_site USING btree (status_id);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_virtualchassis_name_7dcc237d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_virtualchassis_name_7dcc237d ON public.dcim_virtualchassis USING btree (name);


--
-- Name: dcim_virtualchassis_name_7dcc237d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_virtualchassis_name_7dcc237d_like ON public.dcim_virtualchassis USING btree (name varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_computedfield_content_type_id_def6603f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_computedfield_content_type_id_def6603f ON public.extras_computedfield USING btree (content_type_id);


--
-- Name: extras_computedfield_slug_3c4b9636_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_computedfield_slug_3c4b9636_like ON public.extras_computedfield USING btree (slug varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_devic_configcontext_id_72bfff9d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_devic_configcontext_id_72bfff9d ON public.extras_configcontext_device_redundancy_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_devic_deviceredundancygroup_id_d30c185c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_devic_deviceredundancygroup_id_d30c185c ON public.extras_configcontext_device_redundancy_groups USING btree (deviceredundancygroup_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_dynamic_groups_configcontext_id_3cdbc95f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_dynamic_groups_configcontext_id_3cdbc95f ON public.extras_configcontext_dynamic_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_dynamic_groups_dynamicgroup_id_05854998; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_dynamic_groups_dynamicgroup_id_05854998 ON public.extras_configcontext_dynamic_groups USING btree (dynamicgroup_id);


--
-- Name: extras_configcontext_locations_configcontext_id_cc629ec1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_locations_configcontext_id_cc629ec1 ON public.extras_configcontext_locations USING btree (configcontext_id);


--
-- Name: extras_configcontext_locations_location_id_9e19eac9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_locations_location_id_9e19eac9 ON public.extras_configcontext_locations USING btree (location_id);


--
-- Name: extras_configcontext_name_4bbfe25d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_name_4bbfe25d ON public.extras_configcontext USING btree (name);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_owner_content_type_id_af30e837; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_owner_content_type_id_af30e837 ON public.extras_configcontext USING btree (owner_content_type_id);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_schema_id_1a9d39fe; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_schema_id_1a9d39fe ON public.extras_configcontext USING btree (schema_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_configcontextschema_owner_content_type_id_0a0756bc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_owner_content_type_id_0a0756bc ON public.extras_configcontextschema USING btree (owner_content_type_id);


--
-- Name: extras_configcontextschema_slug_80083c21; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_slug_80083c21 ON public.extras_configcontextschema USING btree (slug);


--
-- Name: extras_configcontextschema_slug_80083c21_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_slug_80083c21_like ON public.extras_configcontextschema USING btree (slug varchar_pattern_ops);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_slug_ed27c4fe_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_slug_ed27c4fe_like ON public.extras_customfield USING btree (slug varchar_pattern_ops);


--
-- Name: extras_customfieldchoice_field_id_35006739; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfieldchoice_field_id_35006739 ON public.extras_customfieldchoice USING btree (field_id);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_dynamicgroup_content_type_id_1bed5de5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroup_content_type_id_1bed5de5 ON public.extras_dynamicgroup USING btree (content_type_id);


--
-- Name: extras_dynamicgroup_name_46a8d891_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroup_name_46a8d891_like ON public.extras_dynamicgroup USING btree (name varchar_pattern_ops);


--
-- Name: extras_dynamicgroup_slug_628154a6_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroup_slug_628154a6_like ON public.extras_dynamicgroup USING btree (slug varchar_pattern_ops);


--
-- Name: extras_dynamicgroupmembership_group_id_1616d7d6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroupmembership_group_id_1616d7d6 ON public.extras_dynamicgroupmembership USING btree (group_id);


--
-- Name: extras_dynamicgroupmembership_parent_group_id_f09f9b01; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_dynamicgroupmembership_parent_group_id_f09f9b01 ON public.extras_dynamicgroupmembership USING btree (parent_group_id);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_exporttemplate_owner_content_type_id_6bb67821; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_exporttemplate_owner_content_type_id_6bb67821 ON public.extras_exporttemplate USING btree (owner_content_type_id);


--
-- Name: extras_gitrepository_name_b85445c9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_gitrepository_name_b85445c9_like ON public.extras_gitrepository USING btree (name varchar_pattern_ops);


--
-- Name: extras_gitrepository_secrets_group_id_fd1fdceb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_gitrepository_secrets_group_id_fd1fdceb ON public.extras_gitrepository USING btree (secrets_group_id);


--
-- Name: extras_gitrepository_slug_a71da0ac_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_gitrepository_slug_a71da0ac_like ON public.extras_gitrepository USING btree (slug varchar_pattern_ops);


--
-- Name: extras_graphqlquery_name_53899a98_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_graphqlquery_name_53899a98_like ON public.extras_graphqlquery USING btree (name varchar_pattern_ops);


--
-- Name: extras_graphqlquery_slug_cbac99ad_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_graphqlquery_slug_cbac99ad_like ON public.extras_graphqlquery USING btree (slug varchar_pattern_ops);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_imageattachment_name_04f9d9dd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_name_04f9d9dd ON public.extras_imageattachment USING btree (name);


--
-- Name: extras_imageattachment_name_04f9d9dd_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_name_04f9d9dd_like ON public.extras_imageattachment USING btree (name varchar_pattern_ops);


--
-- Name: extras_imageattachment_object_id_f5308bf7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_imageattachment_object_id_f5308bf7 ON public.extras_imageattachment USING btree (object_id);


--
-- Name: extras_job_git_repository_id_9ee97baf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_git_repository_id_9ee97baf ON public.extras_job USING btree (git_repository_id);


--
-- Name: extras_job_grouping_692d2dc2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_grouping_692d2dc2 ON public.extras_job USING btree ("grouping");


--
-- Name: extras_job_grouping_692d2dc2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_grouping_692d2dc2_like ON public.extras_job USING btree ("grouping" varchar_pattern_ops);


--
-- Name: extras_job_hidden_f4b1d9d5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_hidden_f4b1d9d5 ON public.extras_job USING btree (hidden);


--
-- Name: extras_job_installed_9b043061; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_installed_9b043061 ON public.extras_job USING btree (installed);


--
-- Name: extras_job_job_class_name_d9c82b93; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_job_class_name_d9c82b93 ON public.extras_job USING btree (job_class_name);


--
-- Name: extras_job_job_class_name_d9c82b93_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_job_class_name_d9c82b93_like ON public.extras_job USING btree (job_class_name varchar_pattern_ops);


--
-- Name: extras_job_module_name_912a3dda; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_module_name_912a3dda ON public.extras_job USING btree (module_name);


--
-- Name: extras_job_module_name_912a3dda_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_module_name_912a3dda_like ON public.extras_job USING btree (module_name varchar_pattern_ops);


--
-- Name: extras_job_name_34d98c40; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_name_34d98c40 ON public.extras_job USING btree (name);


--
-- Name: extras_job_name_34d98c40_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_name_34d98c40_like ON public.extras_job USING btree (name varchar_pattern_ops);


--
-- Name: extras_job_slug_a6e32b86_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_slug_a6e32b86_like ON public.extras_job USING btree (slug varchar_pattern_ops);


--
-- Name: extras_job_source_2dddec01; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_source_2dddec01 ON public.extras_job USING btree (source);


--
-- Name: extras_job_source_2dddec01_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_source_2dddec01_like ON public.extras_job USING btree (source varchar_pattern_ops);


--
-- Name: extras_jobbutton_content_types_contenttype_id_b0c6bbc4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobbutton_content_types_contenttype_id_b0c6bbc4 ON public.extras_jobbutton_content_types USING btree (contenttype_id);


--
-- Name: extras_jobbutton_content_types_jobbutton_id_72bd14bf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobbutton_content_types_jobbutton_id_72bd14bf ON public.extras_jobbutton_content_types USING btree (jobbutton_id);


--
-- Name: extras_jobbutton_job_id_710e013a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobbutton_job_id_710e013a ON public.extras_jobbutton USING btree (job_id);


--
-- Name: extras_jobbutton_name_c1a7d587_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobbutton_name_c1a7d587_like ON public.extras_jobbutton USING btree (name varchar_pattern_ops);


--
-- Name: extras_jobhook_content_types_contenttype_id_42d2bda1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobhook_content_types_contenttype_id_42d2bda1 ON public.extras_jobhook_content_types USING btree (contenttype_id);


--
-- Name: extras_jobhook_content_types_jobhook_id_d994e51b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobhook_content_types_jobhook_id_d994e51b ON public.extras_jobhook_content_types USING btree (jobhook_id);


--
-- Name: extras_jobhook_job_id_cfcdb972; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobhook_job_id_cfcdb972 ON public.extras_jobhook USING btree (job_id);


--
-- Name: extras_jobhook_name_1d539c95_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobhook_name_1d539c95_like ON public.extras_jobhook USING btree (name varchar_pattern_ops);


--
-- Name: extras_jobhook_slug_08db0eec_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobhook_slug_08db0eec_like ON public.extras_jobhook USING btree (slug varchar_pattern_ops);


--
-- Name: extras_joblogentry_job_result_id_91e10d1a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_joblogentry_job_result_id_91e10d1a ON public.extras_joblogentry USING btree (job_result_id);


--
-- Name: extras_joblogentry_log_level_f8cfe898; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_joblogentry_log_level_f8cfe898 ON public.extras_joblogentry USING btree (log_level);


--
-- Name: extras_joblogentry_log_level_f8cfe898_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_joblogentry_log_level_f8cfe898_like ON public.extras_joblogentry USING btree (log_level varchar_pattern_ops);


--
-- Name: extras_jobresult_completed_41ca396b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_completed_41ca396b ON public.extras_jobresult USING btree (completed);


--
-- Name: extras_jobresult_created_bf3a3954; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_created_bf3a3954 ON public.extras_jobresult USING btree (created);


--
-- Name: extras_jobresult_job_model_id_d581ec7e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_job_model_id_d581ec7e ON public.extras_jobresult USING btree (job_model_id);


--
-- Name: extras_jobresult_name_3f143125; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_name_3f143125 ON public.extras_jobresult USING btree (name);


--
-- Name: extras_jobresult_name_3f143125_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_name_3f143125_like ON public.extras_jobresult USING btree (name varchar_pattern_ops);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_rcreated_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_rcreated_idx ON public.extras_jobresult USING btree (created DESC);


--
-- Name: extras_jobresult_schedule_id_24ce985a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_schedule_id_24ce985a ON public.extras_jobresult USING btree (schedule_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_jr_rcompleted_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jr_rcompleted_idx ON public.extras_jobresult USING btree (completed DESC);


--
-- Name: extras_jr_statrcompl_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jr_statrcompl_idx ON public.extras_jobresult USING btree (status, completed DESC);


--
-- Name: extras_jr_statrcreate_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jr_statrcreate_idx ON public.extras_jobresult USING btree (status, created DESC);


--
-- Name: extras_note_assigned_object_id_af6ced75; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_note_assigned_object_id_af6ced75 ON public.extras_note USING btree (assigned_object_id);


--
-- Name: extras_note_assigned_object_type_id_e15d3cda; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_note_assigned_object_type_id_e15d3cda ON public.extras_note USING btree (assigned_object_type_id);


--
-- Name: extras_note_slug_ef005da2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_note_slug_ef005da2_like ON public.extras_note USING btree (slug varchar_pattern_ops);


--
-- Name: extras_note_user_id_f11ab655; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_note_user_id_f11ab655 ON public.extras_note USING btree (user_id);


--
-- Name: extras_objectchange_change_context_8e03ae30; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_change_context_8e03ae30 ON public.extras_objectchange USING btree (change_context);


--
-- Name: extras_objectchange_change_context_8e03ae30_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_change_context_8e03ae30_like ON public.extras_objectchange USING btree (change_context varchar_pattern_ops);


--
-- Name: extras_objectchange_changed_object_id_efb1a943; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_changed_object_id_efb1a943 ON public.extras_objectchange USING btree (changed_object_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_double_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_double_idx ON public.extras_objectchange USING btree (request_id, changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_request_id_4ae21e90; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_request_id_4ae21e90 ON public.extras_objectchange USING btree (request_id);


--
-- Name: extras_objectchange_rtime_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_rtime_idx ON public.extras_objectchange USING btree ("time" DESC);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_triple_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_triple_idx ON public.extras_objectchange USING btree (request_id, changed_object_type_id, changed_object_id);


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_relationship_destination_type_id_fb7387c3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_destination_type_id_fb7387c3 ON public.extras_relationship USING btree (destination_type_id);


--
-- Name: extras_relationship_name_5f6f8ea2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_name_5f6f8ea2_like ON public.extras_relationship USING btree (name varchar_pattern_ops);


--
-- Name: extras_relationship_slug_e09b40f4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_slug_e09b40f4_like ON public.extras_relationship USING btree (slug varchar_pattern_ops);


--
-- Name: extras_relationship_source_type_id_21183ad6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_source_type_id_21183ad6 ON public.extras_relationship USING btree (source_type_id);


--
-- Name: extras_relationshipassociation_destination_id_83f811cb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_destination_id_83f811cb ON public.extras_relationshipassociation USING btree (destination_id);


--
-- Name: extras_relationshipassociation_destination_type_id_5ccb6728; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_destination_type_id_5ccb6728 ON public.extras_relationshipassociation USING btree (destination_type_id);


--
-- Name: extras_relationshipassociation_relationship_id_9a65ccc8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_relationship_id_9a65ccc8 ON public.extras_relationshipassociation USING btree (relationship_id);


--
-- Name: extras_relationshipassociation_source_id_cb8931c1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_source_id_cb8931c1 ON public.extras_relationshipassociation USING btree (source_id);


--
-- Name: extras_relationshipassociation_source_type_id_28c8df60; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationshipassociation_source_type_id_28c8df60 ON public.extras_relationshipassociation USING btree (source_type_id);


--
-- Name: extras_scheduledjob_approved_by_user_id_06b8fb0a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_approved_by_user_id_06b8fb0a ON public.extras_scheduledjob USING btree (approved_by_user_id);


--
-- Name: extras_scheduledjob_job_class_c1c4178e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_class_c1c4178e ON public.extras_scheduledjob USING btree (job_class);


--
-- Name: extras_scheduledjob_job_class_c1c4178e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_class_c1c4178e_like ON public.extras_scheduledjob USING btree (job_class varchar_pattern_ops);


--
-- Name: extras_scheduledjob_job_model_id_d4c0711e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_model_id_d4c0711e ON public.extras_scheduledjob USING btree (job_model_id);


--
-- Name: extras_scheduledjob_name_fcea52d7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_name_fcea52d7 ON public.extras_scheduledjob USING btree (name);


--
-- Name: extras_scheduledjob_name_fcea52d7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_name_fcea52d7_like ON public.extras_scheduledjob USING btree (name varchar_pattern_ops);


--
-- Name: extras_scheduledjob_queue_681f2627; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_queue_681f2627 ON public.extras_scheduledjob USING btree (queue);


--
-- Name: extras_scheduledjob_queue_681f2627_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_queue_681f2627_like ON public.extras_scheduledjob USING btree (queue varchar_pattern_ops);


--
-- Name: extras_scheduledjob_task_7eaf2d6d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_task_7eaf2d6d ON public.extras_scheduledjob USING btree (task);


--
-- Name: extras_scheduledjob_task_7eaf2d6d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_task_7eaf2d6d_like ON public.extras_scheduledjob USING btree (task varchar_pattern_ops);


--
-- Name: extras_scheduledjob_user_id_4d8034ff; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_user_id_4d8034ff ON public.extras_scheduledjob USING btree (user_id);


--
-- Name: extras_secret_name_5e2de97e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secret_name_5e2de97e_like ON public.extras_secret USING btree (name varchar_pattern_ops);


--
-- Name: extras_secret_slug_cf3c7c3c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secret_slug_cf3c7c3c_like ON public.extras_secret USING btree (slug varchar_pattern_ops);


--
-- Name: extras_secretsgroup_name_626cec38_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroup_name_626cec38_like ON public.extras_secretsgroup USING btree (name varchar_pattern_ops);


--
-- Name: extras_secretsgroup_slug_a523052e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroup_slug_a523052e_like ON public.extras_secretsgroup USING btree (slug varchar_pattern_ops);


--
-- Name: extras_secretsgroupassociation_group_id_68ca43f6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroupassociation_group_id_68ca43f6 ON public.extras_secretsgroupassociation USING btree (group_id);


--
-- Name: extras_secretsgroupassociation_secret_id_14d43d7e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroupassociation_secret_id_14d43d7e ON public.extras_secretsgroupassociation USING btree (secret_id);


--
-- Name: extras_status_content_types_contenttype_id_38503e74; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_content_types_contenttype_id_38503e74 ON public.extras_status_content_types USING btree (contenttype_id);


--
-- Name: extras_status_content_types_status_id_27c665c7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_content_types_status_id_27c665c7 ON public.extras_status_content_types USING btree (status_id);


--
-- Name: extras_status_name_d8897514_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_name_d8897514_like ON public.extras_status USING btree (name varchar_pattern_ops);


--
-- Name: extras_status_slug_6f38c09c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_status_slug_6f38c09c_like ON public.extras_status USING btree (slug varchar_pattern_ops);


--
-- Name: extras_tag_content_types_contenttype_id_5baa3bb5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_content_types_contenttype_id_5baa3bb5 ON public.extras_tag_content_types USING btree (contenttype_id);


--
-- Name: extras_tag_content_types_tag_id_34a8ca46; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_content_types_tag_id_34a8ca46 ON public.extras_tag_content_types USING btree (tag_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_broadcast_cff7c80e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_broadcast_cff7c80e ON public.ipam_aggregate USING btree (broadcast);


--
-- Name: ipam_aggregate_network_e8d5e036; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_network_e8d5e036 ON public.ipam_aggregate USING btree (network);


--
-- Name: ipam_aggregate_prefix_length_da6bd002; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_prefix_length_da6bd002 ON public.ipam_aggregate USING btree (prefix_length);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_ipaddress_assigned_object_id_cff64474; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_assigned_object_id_cff64474 ON public.ipam_ipaddress USING btree (assigned_object_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_broadcast_f3d0b760; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_broadcast_f3d0b760 ON public.ipam_ipaddress USING btree (broadcast);


--
-- Name: ipam_ipaddress_dns_name_d5c4f5d8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_dns_name_d5c4f5d8 ON public.ipam_ipaddress USING btree (dns_name);


--
-- Name: ipam_ipaddress_dns_name_d5c4f5d8_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_dns_name_d5c4f5d8_like ON public.ipam_ipaddress USING btree (dns_name varchar_pattern_ops);


--
-- Name: ipam_ipaddress_host_c1f8ad3e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_host_c1f8ad3e ON public.ipam_ipaddress USING btree (host);


--
-- Name: ipam_ipaddress_nat_inside_id_a45fb7c5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_nat_inside_id_a45fb7c5 ON public.ipam_ipaddress USING btree (nat_inside_id);


--
-- Name: ipam_ipaddress_prefix_length_f80d3663; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_prefix_length_f80d3663 ON public.ipam_ipaddress USING btree (prefix_length);


--
-- Name: ipam_ipaddress_role_ff25f462; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_role_ff25f462 ON public.ipam_ipaddress USING btree (role);


--
-- Name: ipam_ipaddress_role_ff25f462_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_role_ff25f462_like ON public.ipam_ipaddress USING btree (role varchar_pattern_ops);


--
-- Name: ipam_ipaddress_status_id_942778b7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_status_id_942778b7 ON public.ipam_ipaddress USING btree (status_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_prefix_broadcast_8e623832; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_broadcast_8e623832 ON public.ipam_prefix USING btree (broadcast);


--
-- Name: ipam_prefix_location_id_9a5c5f60; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_location_id_9a5c5f60 ON public.ipam_prefix USING btree (location_id);


--
-- Name: ipam_prefix_network_f7bac882; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_network_f7bac882 ON public.ipam_prefix USING btree (network);


--
-- Name: ipam_prefix_prefix_length_84660485; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_prefix_length_84660485 ON public.ipam_prefix USING btree (prefix_length);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_status_id_cffa56c0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_status_id_cffa56c0 ON public.ipam_prefix USING btree (status_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_name_7e839153; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_name_7e839153 ON public.ipam_service USING btree (name);


--
-- Name: ipam_service_name_7e839153_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_name_7e839153_like ON public.ipam_service USING btree (name varchar_pattern_ops);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_location_id_07dd65e4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_location_id_07dd65e4 ON public.ipam_vlan USING btree (location_id);


--
-- Name: ipam_vlan_name_a7671201; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_name_a7671201 ON public.ipam_vlan USING btree (name);


--
-- Name: ipam_vlan_name_a7671201_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_name_a7671201_like ON public.ipam_vlan USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_status_id_898aa317; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_status_id_898aa317 ON public.ipam_vlan USING btree (status_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_location_id_f239af79; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_location_id_f239af79 ON public.ipam_vlangroup USING btree (location_id);


--
-- Name: ipam_vlangroup_name_46bf02a4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_name_46bf02a4 ON public.ipam_vlangroup USING btree (name);


--
-- Name: ipam_vlangroup_name_46bf02a4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_name_46bf02a4_like ON public.ipam_vlangroup USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlangroup_site_id_264f36f6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_site_id_264f36f6 ON public.ipam_vlangroup USING btree (site_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_name_bf7146b0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_name_bf7146b0 ON public.ipam_vrf USING btree (name);


--
-- Name: ipam_vrf_name_bf7146b0_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_name_bf7146b0_like ON public.ipam_vrf USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_uid_796e51dc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc ON public.social_auth_usersocialauth USING btree (uid);


--
-- Name: social_auth_usersocialauth_uid_796e51dc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_usersocialauth_uid_796e51dc_like ON public.social_auth_usersocialauth USING btree (uid varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_location_id_fdcab7e6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_location_id_fdcab7e6 ON public.virtualization_cluster USING btree (location_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmach_local_context_data_owner_c_f760366b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmach_local_context_data_owner_c_f760366b ON public.virtualization_virtualmachine USING btree (local_context_data_owner_content_type_id);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_local_context_schema_id_d359876d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_local_context_schema_id_d359876d ON public.virtualization_virtualmachine USING btree (local_context_schema_id);


--
-- Name: virtualization_virtualmachine_name_266f6cdc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc ON public.virtualization_virtualmachine USING btree (name);


--
-- Name: virtualization_virtualmachine_name_266f6cdc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc_like ON public.virtualization_virtualmachine USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_status_id_ff17be20; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_status_id_ff17be20 ON public.virtualization_virtualmachine USING btree (status_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface__name_0052e83a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface__name_0052e83a ON public.virtualization_vminterface USING btree (_name);


--
-- Name: virtualization_vminterface__name_0052e83a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface__name_0052e83a_like ON public.virtualization_vminterface USING btree (_name varchar_pattern_ops);


--
-- Name: virtualization_vminterface_bridge_id_7462b91e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_bridge_id_7462b91e ON public.virtualization_vminterface USING btree (bridge_id);


--
-- Name: virtualization_vminterface_name_8b75a799; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_name_8b75a799 ON public.virtualization_vminterface USING btree (name);


--
-- Name: virtualization_vminterface_name_8b75a799_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_name_8b75a799_like ON public.virtualization_vminterface USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_vminterface_parent_interface_id_3532b142; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_parent_interface_id_3532b142 ON public.virtualization_vminterface USING btree (parent_interface_id);


--
-- Name: virtualization_vminterface_status_id_5f9104d8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_status_id_5f9104d8 ON public.virtualization_vminterface USING btree (status_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_status_id_6433793f_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_status_id_6433793f_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__path_id_6dfd8db0_fk_dcim_cabl FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_location_id_9896bd96_fk_dcim_loca; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_location_id_9896bd96_fk_dcim_loca FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_status_id_6a580869_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_status_id_6a580869_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi FOREIGN KEY (device_redundancy_group_id) REFERENCES public.dcim_deviceredundancygroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_local_context_data_o_5d06013b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_local_context_data_o_5d06013b_fk_django_co FOREIGN KEY (local_context_data_owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_local_context_schema_0ff8d657_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_local_context_schema_0ff8d657_fk_extras_co FOREIGN KEY (local_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_location_id_11a7bedb_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_11a7bedb_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_status_id_96d2fc6f_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_status_id_96d2fc6f_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_deviceredundancygroup dcim_deviceredundanc_secrets_group_id_19061ee9_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_deviceredundancygroup
    ADD CONSTRAINT dcim_deviceredundanc_secrets_group_id_19061ee9_fk_extras_se FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_deviceredundancygroup dcim_deviceredundanc_status_id_de1ca6f3_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_deviceredundancygroup
    ADD CONSTRAINT dcim_deviceredundanc_status_id_de1ca6f3_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_bridge_id_f2a8df85_fk_dcim_interface_id FOREIGN KEY (bridge_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_parent_interface_id_dc46b61a_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_parent_interface_id_dc46b61a_fk_dcim_inte FOREIGN KEY (parent_interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_status_id_5d68d3d6_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_status_id_5d68d3d6_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceredundancygroupassociation dcim_interfaceredund_interface_id_a2cd97e8_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroupassociation
    ADD CONSTRAINT dcim_interfaceredund_interface_id_a2cd97e8_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceredundancygroupassociation dcim_interfaceredund_interface_redundancy_a12adcaa_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroupassociation
    ADD CONSTRAINT dcim_interfaceredund_interface_redundancy_a12adcaa_fk_dcim_inte FOREIGN KEY (interface_redundancy_group_id) REFERENCES public.dcim_interfaceredundancygroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceredundancygroup dcim_interfaceredund_secrets_group_id_e31c9631_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroup
    ADD CONSTRAINT dcim_interfaceredund_secrets_group_id_e31c9631_fk_extras_se FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceredundancygroup dcim_interfaceredund_status_id_751f2043_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroup
    ADD CONSTRAINT dcim_interfaceredund_status_id_751f2043_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceredundancygroup dcim_interfaceredund_virtual_ip_id_14cbd633_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfaceredundancygroup
    ADD CONSTRAINT dcim_interfaceredund_virtual_ip_id_14cbd633_fk_ipam_ipad FOREIGN KEY (virtual_ip_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_location_type_id_511a9421_fk_dcim_locationtype_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_location_type_id_511a9421_fk_dcim_locationtype_id FOREIGN KEY (location_type_id) REFERENCES public.dcim_locationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_parent_id_d77f3318_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_d77f3318_fk_dcim_location_id FOREIGN KEY (parent_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_site_id_b55e975f_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_b55e975f_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_status_id_3d74f10a_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_status_id_3d74f10a_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_tenant_id_2c4df974_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_locationtype_content_types dcim_locationtype_co_contenttype_id_806c318e_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype_content_types
    ADD CONSTRAINT dcim_locationtype_co_contenttype_id_806c318e_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_locationtype_content_types dcim_locationtype_co_locationtype_id_daa2005b_fk_dcim_loca; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype_content_types
    ADD CONSTRAINT dcim_locationtype_co_locationtype_id_daa2005b_fk_dcim_loca FOREIGN KEY (locationtype_id) REFERENCES public.dcim_locationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_locationtype dcim_locationtype_parent_id_023ca1c8_fk_dcim_locationtype_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_locationtype
    ADD CONSTRAINT dcim_locationtype_parent_id_023ca1c8_fk_dcim_locationtype_id FOREIGN KEY (parent_id) REFERENCES public.dcim_locationtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_status_id_8c424cc3_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_status_id_8c424cc3_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id FOREIGN KEY (rack_group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_status_id_ee3dee3e_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_status_id_ee3dee3e_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_location_id_5a6fdeac_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_location_id_5a6fdeac_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_parent_id_cc315105_fk_dcim_rackgroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_13520e89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_13520e89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_status_id_e6a50f56_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_status_id_e6a50f56_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_computedfield extras_computedfield_content_type_id_def6603f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_computedfield
    ADD CONSTRAINT extras_computedfield_content_type_id_def6603f_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_dynamic_groups extras_configcontext_configcontext_id_3cdbc95f_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_dynamic_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_3cdbc95f_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_redundancy_groups extras_configcontext_configcontext_id_72bfff9d_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_redundancy_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_72bfff9d_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_locations extras_configcontext_configcontext_id_cc629ec1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_configcontext_id_cc629ec1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_redundancy_groups extras_configcontext_deviceredundancygrou_d30c185c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_redundancy_groups
    ADD CONSTRAINT extras_configcontext_deviceredundancygrou_d30c185c_fk_dcim_devi FOREIGN KEY (deviceredundancygroup_id) REFERENCES public.dcim_deviceredundancygroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_dynamic_groups extras_configcontext_dynamicgroup_id_05854998_fk_extras_dy; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_dynamic_groups
    ADD CONSTRAINT extras_configcontext_dynamicgroup_id_05854998_fk_extras_dy FOREIGN KEY (dynamicgroup_id) REFERENCES public.extras_dynamicgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_locations extras_configcontext_location_id_9e19eac9_fk_dcim_loca; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_locations
    ADD CONSTRAINT extras_configcontext_location_id_9e19eac9_fk_dcim_loca FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontextschema extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontext_owner_content_type_i_0a0756bc_fk_django_co FOREIGN KEY (owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext extras_configcontext_owner_content_type_i_af30e837_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_owner_content_type_i_af30e837_fk_django_co FOREIGN KEY (owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext extras_configcontext_schema_id_1a9d39fe_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_schema_id_1a9d39fe_fk_extras_co FOREIGN KEY (schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldchoice extras_customfieldch_field_id_35006739_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldch_field_id_35006739_fk_extras_cu FOREIGN KEY (field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_dynamicgroup extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroup
    ADD CONSTRAINT extras_dynamicgroup_content_type_id_1bed5de5_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_dynamicgroupmembership extras_dynamicgroupm_group_id_1616d7d6_fk_extras_dy; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroupmembership
    ADD CONSTRAINT extras_dynamicgroupm_group_id_1616d7d6_fk_extras_dy FOREIGN KEY (group_id) REFERENCES public.extras_dynamicgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_dynamicgroupmembership extras_dynamicgroupm_parent_group_id_f09f9b01_fk_extras_dy; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_dynamicgroupmembership
    ADD CONSTRAINT extras_dynamicgroupm_parent_group_id_f09f9b01_fk_extras_dy FOREIGN KEY (parent_group_id) REFERENCES public.extras_dynamicgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_owner_content_type_i_6bb67821_fk_django_co FOREIGN KEY (owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_gitrepository extras_gitrepository_secrets_group_id_fd1fdceb_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_gitrepository
    ADD CONSTRAINT extras_gitrepository_secrets_group_id_fd1fdceb_fk_extras_se FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_job extras_job_git_repository_id_9ee97baf_fk_extras_gi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_git_repository_id_9ee97baf_fk_extras_gi FOREIGN KEY (git_repository_id) REFERENCES public.extras_gitrepository(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobbutton_content_types extras_jobbutton_con_contenttype_id_b0c6bbc4_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton_content_types
    ADD CONSTRAINT extras_jobbutton_con_contenttype_id_b0c6bbc4_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobbutton_content_types extras_jobbutton_con_jobbutton_id_72bd14bf_fk_extras_jo; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton_content_types
    ADD CONSTRAINT extras_jobbutton_con_jobbutton_id_72bd14bf_fk_extras_jo FOREIGN KEY (jobbutton_id) REFERENCES public.extras_jobbutton(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobbutton extras_jobbutton_job_id_710e013a_fk_extras_job_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobbutton
    ADD CONSTRAINT extras_jobbutton_job_id_710e013a_fk_extras_job_id FOREIGN KEY (job_id) REFERENCES public.extras_job(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobhook_content_types extras_jobhook_conte_contenttype_id_42d2bda1_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook_content_types
    ADD CONSTRAINT extras_jobhook_conte_contenttype_id_42d2bda1_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobhook_content_types extras_jobhook_conte_jobhook_id_d994e51b_fk_extras_jo; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook_content_types
    ADD CONSTRAINT extras_jobhook_conte_jobhook_id_d994e51b_fk_extras_jo FOREIGN KEY (jobhook_id) REFERENCES public.extras_jobhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobhook extras_jobhook_job_id_cfcdb972_fk_extras_job_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobhook
    ADD CONSTRAINT extras_jobhook_job_id_cfcdb972_fk_extras_job_id FOREIGN KEY (job_id) REFERENCES public.extras_job(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_joblogentry extras_joblogentry_job_result_id_91e10d1a_fk_extras_jo; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_joblogentry
    ADD CONSTRAINT extras_joblogentry_job_result_id_91e10d1a_fk_extras_jo FOREIGN KEY (job_result_id) REFERENCES public.extras_jobresult(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_model_id_d581ec7e_fk_extras_job_id FOREIGN KEY (job_model_id) REFERENCES public.extras_job(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_schedule_id_24ce985a_fk_extras_scheduledjob_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_schedule_id_24ce985a_fk_extras_scheduledjob_id FOREIGN KEY (schedule_id) REFERENCES public.extras_scheduledjob(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_note extras_note_assigned_object_type_e15d3cda_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_note
    ADD CONSTRAINT extras_note_assigned_object_type_e15d3cda_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_note extras_note_user_id_f11ab655_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_note
    ADD CONSTRAINT extras_note_user_id_f11ab655_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationship extras_relationship_destination_type_id_fb7387c3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_destination_type_id_fb7387c3_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationship extras_relationship_source_type_id_21183ad6_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_source_type_id_21183ad6_fk_django_co FOREIGN KEY (source_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationshipassociation extras_relationshipa_destination_type_id_5ccb6728_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipa_destination_type_id_5ccb6728_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationshipassociation extras_relationshipa_relationship_id_9a65ccc8_fk_extras_re; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipa_relationship_id_9a65ccc8_fk_extras_re FOREIGN KEY (relationship_id) REFERENCES public.extras_relationship(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_relationshipassociation extras_relationshipa_source_type_id_28c8df60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationshipassociation
    ADD CONSTRAINT extras_relationshipa_source_type_id_28c8df60_fk_django_co FOREIGN KEY (source_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_scheduledjob extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_approved_by_user_id_06b8fb0a_fk_auth_user FOREIGN KEY (approved_by_user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_scheduledjob extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_job_model_id_d4c0711e_fk_extras_job_id FOREIGN KEY (job_model_id) REFERENCES public.extras_job(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_scheduledjob extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_user_id_4d8034ff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_secretsgroupassociation extras_secretsgroupa_group_id_68ca43f6_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupa_group_id_68ca43f6_fk_extras_se FOREIGN KEY (group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_secretsgroupassociation extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se FOREIGN KEY (secret_id) REFERENCES public.extras_secret(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_status_content_types extras_status_conten_contenttype_id_38503e74_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_conten_contenttype_id_38503e74_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_status_content_types extras_status_conten_status_id_27c665c7_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types
    ADD CONSTRAINT extras_status_conten_status_id_27c665c7_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_tag_content_types extras_tag_content_t_contenttype_id_5baa3bb5_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_t_contenttype_id_5baa3bb5_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_tag_content_types extras_tag_content_types_tag_id_34a8ca46_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types
    ADD CONSTRAINT extras_tag_content_types_tag_id_34a8ca46_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_status_id_942778b7_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_status_id_942778b7_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_location_id_9a5c5f60_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_location_id_9a5c5f60_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_status_id_cffa56c0_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_status_id_cffa56c0_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_location_id_07dd65e4_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_location_id_07dd65e4_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_status_id_898aa317_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_status_id_898aa317_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_location_id_f239af79_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_location_id_f239af79_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_local_context_data_o_f760366b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_local_context_data_o_f760366b_fk_django_co FOREIGN KEY (local_context_data_owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_local_context_schema_d359876d_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_local_context_schema_d359876d_fk_extras_co FOREIGN KEY (local_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_status_id_ff17be20_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_status_id_ff17be20_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_bridge_id_7462b91e_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_bridge_id_7462b91e_fk_virtualiz FOREIGN KEY (bridge_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_parent_interface_id_3532b142_fk_virtualiz FOREIGN KEY (parent_interface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_status_id_5f9104d8_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_status_id_5f9104d8_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

