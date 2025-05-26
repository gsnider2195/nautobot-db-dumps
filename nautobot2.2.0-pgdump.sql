--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21
-- Dumped by pg_dump version 13.21

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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    cid character varying(255) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(255) NOT NULL,
    comments text NOT NULL,
    provider_id uuid NOT NULL,
    status_id uuid NOT NULL,
    tenant_id uuid,
    circuit_type_id uuid NOT NULL,
    circuit_termination_a_id uuid,
    circuit_termination_z_id uuid,
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
    xconnect_id character varying(255) NOT NULL,
    pp_info character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    circuit_id uuid NOT NULL,
    provider_network_id uuid,
    _custom_field_data jsonb NOT NULL,
    created timestamp with time zone,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO nautobot;

--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.circuits_provider (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    asn bigint,
    account character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    termination_a_id uuid NOT NULL,
    termination_b_id uuid NOT NULL,
    type character varying(50) NOT NULL,
    label character varying(255) NOT NULL,
    color character varying(6) NOT NULL,
    length smallint,
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id uuid,
    _termination_b_device_id uuid,
    status_id uuid NOT NULL,
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
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleport OWNER TO nautobot;

--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO nautobot;

--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleserverport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleserverport OWNER TO nautobot;

--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO nautobot;

--
-- Name: dcim_controller; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_controller (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    controller_device_id uuid,
    controller_device_redundancy_group_id uuid,
    external_integration_id uuid,
    location_id uuid NOT NULL,
    platform_id uuid,
    role_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.dcim_controller OWNER TO nautobot;

--
-- Name: dcim_controllermanageddevicegroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_controllermanageddevicegroup (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    weight integer NOT NULL,
    controller_id uuid NOT NULL,
    parent_id uuid,
    CONSTRAINT dcim_controllermanageddevicegroup_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.dcim_controllermanageddevicegroup OWNER TO nautobot;

--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_device (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    local_config_context_data jsonb,
    local_config_context_data_owner_object_id uuid,
    name character varying(255),
    _name character varying(255),
    serial character varying(255) NOT NULL,
    asset_tag character varying(255),
    "position" smallint,
    face character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id uuid,
    device_type_id uuid NOT NULL,
    local_config_context_data_owner_content_type_id integer,
    platform_id uuid,
    primary_ip4_id uuid,
    primary_ip6_id uuid,
    rack_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid,
    virtual_chassis_id uuid,
    local_config_context_schema_id uuid,
    secrets_group_id uuid,
    location_id uuid NOT NULL,
    device_redundancy_group_priority smallint,
    device_redundancy_group_id uuid,
    role_id uuid NOT NULL,
    software_version_id uuid,
    controller_managed_device_group_id uuid,
    CONSTRAINT dcim_device_device_redundancy_group_priority_check CHECK ((device_redundancy_group_priority >= 0)),
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO nautobot;

--
-- Name: dcim_device_software_image_files; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_device_software_image_files (
    id bigint NOT NULL,
    device_id uuid NOT NULL,
    softwareimagefile_id uuid NOT NULL
);


ALTER TABLE public.dcim_device_software_image_files OWNER TO nautobot;

--
-- Name: dcim_device_software_image_files_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.dcim_device_software_image_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_software_image_files_id_seq OWNER TO nautobot;

--
-- Name: dcim_device_software_image_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.dcim_device_software_image_files_id_seq OWNED BY public.dcim_device_software_image_files.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicebay (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    device_id uuid NOT NULL,
    installed_device_id uuid,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_devicebay OWNER TO nautobot;

--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicebaytemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    device_type_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO nautobot;

--
-- Name: dcim_devicefamily; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicefamily (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.dcim_devicefamily OWNER TO nautobot;

--
-- Name: dcim_deviceredundancygroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_deviceredundancygroup (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    failover_strategy character varying(50) NOT NULL,
    comments text NOT NULL,
    secrets_group_id uuid,
    status_id uuid NOT NULL
);


ALTER TABLE public.dcim_deviceredundancygroup OWNER TO nautobot;

--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicetype (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    model character varying(255) NOT NULL,
    part_number character varying(255) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id uuid NOT NULL,
    device_family_id uuid,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO nautobot;

--
-- Name: dcim_devicetypetosoftwareimagefile; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_devicetypetosoftwareimagefile (
    id uuid NOT NULL,
    device_type_id uuid NOT NULL,
    software_image_file_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_devicetypetosoftwareimagefile OWNER TO nautobot;

--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_frontport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id uuid,
    device_id uuid NOT NULL,
    rear_port_id uuid NOT NULL,
    created timestamp with time zone,
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
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id uuid NOT NULL,
    rear_port_template_id uuid NOT NULL,
    created timestamp with time zone,
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
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    enabled boolean NOT NULL,
    mac_address character varying(18) NOT NULL,
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    lag_id uuid,
    untagged_vlan_id uuid,
    status_id uuid NOT NULL,
    parent_interface_id uuid,
    bridge_id uuid,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    vrf_id uuid,
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
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    description character varying(255) NOT NULL,
    protocol character varying(50) NOT NULL,
    protocol_group_id character varying(255) NOT NULL,
    secrets_group_id uuid,
    status_id uuid NOT NULL,
    virtual_ip_id uuid
);


ALTER TABLE public.dcim_interfaceredundancygroup OWNER TO nautobot;

--
-- Name: dcim_interfaceredundancygroupassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interfaceredundancygroupassociation (
    id uuid NOT NULL,
    last_updated timestamp with time zone,
    priority smallint NOT NULL,
    interface_id uuid NOT NULL,
    interface_redundancy_group_id uuid NOT NULL,
    created timestamp with time zone,
    CONSTRAINT dcim_interfaceredundancygroupassociation_priority_check CHECK ((priority >= 0))
);


ALTER TABLE public.dcim_interfaceredundancygroupassociation OWNER TO nautobot;

--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_interfacetemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO nautobot;

--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_inventoryitem (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    part_id character varying(255) NOT NULL,
    serial character varying(255) NOT NULL,
    asset_tag character varying(255),
    discovered boolean NOT NULL,
    device_id uuid NOT NULL,
    manufacturer_id uuid,
    parent_id uuid,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    software_version_id uuid
);


ALTER TABLE public.dcim_inventoryitem OWNER TO nautobot;

--
-- Name: dcim_inventoryitem_software_image_files; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_inventoryitem_software_image_files (
    id bigint NOT NULL,
    inventoryitem_id uuid NOT NULL,
    softwareimagefile_id uuid NOT NULL
);


ALTER TABLE public.dcim_inventoryitem_software_image_files OWNER TO nautobot;

--
-- Name: dcim_inventoryitem_software_image_files_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.dcim_inventoryitem_software_image_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitem_software_image_files_id_seq OWNER TO nautobot;

--
-- Name: dcim_inventoryitem_software_image_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.dcim_inventoryitem_software_image_files_id_seq OWNED BY public.dcim_inventoryitem_software_image_files.id;


--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_location (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    location_type_id uuid NOT NULL,
    parent_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid,
    asn bigint,
    comments text NOT NULL,
    contact_email character varying(254) NOT NULL,
    contact_name character varying(255) NOT NULL,
    contact_phone character varying(255) NOT NULL,
    facility character varying(255) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    physical_address text NOT NULL,
    shipping_address text NOT NULL,
    time_zone character varying(63) NOT NULL
);


ALTER TABLE public.dcim_location OWNER TO nautobot;

--
-- Name: dcim_locationtype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_locationtype (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO nautobot;

--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_platform (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    napalm_driver character varying(255) NOT NULL,
    napalm_args jsonb,
    description character varying(255) NOT NULL,
    manufacturer_id uuid,
    network_driver character varying(255) NOT NULL
);


ALTER TABLE public.dcim_platform OWNER TO nautobot;

--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerfeed (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    _cable_peer_id uuid,
    name character varying(255) NOT NULL,
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
    status_id uuid NOT NULL,
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
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    power_port_id uuid,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_poweroutlet OWNER TO nautobot;

--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_poweroutlettemplate (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id uuid NOT NULL,
    power_port_template_id uuid,
    created timestamp with time zone,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO nautobot;

--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerpanel (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    rack_group_id uuid,
    location_id uuid NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO nautobot;

--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_powerport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _cable_peer_type_id integer,
    _path_id uuid,
    cable_id uuid,
    device_id uuid NOT NULL,
    created timestamp with time zone,
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
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id uuid NOT NULL,
    created timestamp with time zone,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    facility_id character varying(50),
    serial character varying(255) NOT NULL,
    asset_tag character varying(255),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    rack_group_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid,
    location_id uuid NOT NULL,
    role_id uuid,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    parent_id uuid,
    location_id uuid NOT NULL
);


ALTER TABLE public.dcim_rackgroup OWNER TO nautobot;

--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rackreservation (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    units jsonb NOT NULL,
    description character varying(255) NOT NULL,
    rack_id uuid NOT NULL,
    tenant_id uuid,
    user_id uuid NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO nautobot;

--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_rearport (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    _cable_peer_id uuid,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id uuid,
    device_id uuid NOT NULL,
    created timestamp with time zone,
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
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO nautobot;

--
-- Name: dcim_softwareimagefile; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_softwareimagefile (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    image_file_name character varying(255) NOT NULL,
    image_file_checksum character varying(256) NOT NULL,
    hashing_algorithm character varying(255) NOT NULL,
    image_file_size bigint,
    download_url character varying(200) NOT NULL,
    default_image boolean NOT NULL,
    software_version_id uuid NOT NULL,
    status_id uuid NOT NULL,
    CONSTRAINT dcim_softwareimagefile_image_file_size_check CHECK ((image_file_size >= 0))
);


ALTER TABLE public.dcim_softwareimagefile OWNER TO nautobot;

--
-- Name: dcim_softwareversion; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_softwareversion (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    version character varying(255) NOT NULL,
    alias character varying(255) NOT NULL,
    release_date date,
    end_of_support_date date,
    documentation_url character varying(200) NOT NULL,
    long_term_support boolean NOT NULL,
    pre_release boolean NOT NULL,
    platform_id uuid NOT NULL,
    status_id uuid NOT NULL
);


ALTER TABLE public.dcim_softwareversion OWNER TO nautobot;

--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.dcim_virtualchassis (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    domain character varying(255) NOT NULL,
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
-- Name: django_celery_results_chordcounter; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_results_chordcounter (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    sub_tasks text NOT NULL,
    count integer NOT NULL,
    CONSTRAINT django_celery_results_chordcounter_count_check CHECK ((count >= 0))
);


ALTER TABLE public.django_celery_results_chordcounter OWNER TO nautobot;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_results_chordcounter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_chordcounter_id_seq OWNER TO nautobot;

--
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_results_chordcounter_id_seq OWNED BY public.django_celery_results_chordcounter.id;


--
-- Name: django_celery_results_groupresult; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_results_groupresult (
    id integer NOT NULL,
    group_id character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_done timestamp with time zone NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text
);


ALTER TABLE public.django_celery_results_groupresult OWNER TO nautobot;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_results_groupresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_groupresult_id_seq OWNER TO nautobot;

--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_results_groupresult_id_seq OWNED BY public.django_celery_results_groupresult.id;


--
-- Name: django_celery_results_taskresult; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.django_celery_results_taskresult (
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    status character varying(50) NOT NULL,
    content_type character varying(128) NOT NULL,
    content_encoding character varying(64) NOT NULL,
    result text,
    date_done timestamp with time zone NOT NULL,
    traceback text,
    meta text,
    task_args text,
    task_kwargs text,
    task_name character varying(255),
    worker character varying(100),
    date_created timestamp with time zone NOT NULL,
    periodic_task_name character varying(255)
);


ALTER TABLE public.django_celery_results_taskresult OWNER TO nautobot;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.django_celery_results_taskresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_celery_results_taskresult_id_seq OWNER TO nautobot;

--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.django_celery_results_taskresult_id_seq OWNED BY public.django_celery_results_taskresult.id;


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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    key character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    owner_object_id uuid,
    weight smallint NOT NULL,
    description character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    owner_content_type_id integer,
    config_context_schema_id uuid,
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
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_configcontext_roles (
    id bigint NOT NULL,
    configcontext_id uuid NOT NULL,
    role_id uuid NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO nautobot;

--
-- Name: extras_configcontext_new_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_configcontext_new_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_new_roles_id_seq OWNER TO nautobot;

--
-- Name: extras_configcontext_new_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_configcontext_new_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    data_schema jsonb NOT NULL,
    owner_object_id uuid,
    owner_content_type_id integer
);


ALTER TABLE public.extras_configcontextschema OWNER TO nautobot;

--
-- Name: extras_contact; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_contact (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    address text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.extras_contact OWNER TO nautobot;

--
-- Name: extras_contactassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_contactassociation (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    associated_object_id uuid NOT NULL,
    associated_object_type_id integer,
    contact_id uuid,
    role_id uuid NOT NULL,
    status_id uuid NOT NULL,
    team_id uuid
);


ALTER TABLE public.extras_contactassociation OWNER TO nautobot;

--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customfield (
    id uuid NOT NULL,
    type character varying(50) NOT NULL,
    label character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum bigint,
    validation_maximum bigint,
    validation_regex character varying(500) NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    advanced_ui boolean NOT NULL,
    key character varying(255) NOT NULL,
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
    value character varying(255) NOT NULL,
    weight smallint NOT NULL,
    custom_field_id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customfieldchoice_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfieldchoice OWNER TO nautobot;

--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_customlink (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    text character varying(500) NOT NULL,
    target_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    owner_object_id uuid,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(255) NOT NULL,
    file_extension character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    owner_content_type_id integer
);


ALTER TABLE public.extras_exporttemplate OWNER TO nautobot;

--
-- Name: extras_externalintegration; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_externalintegration (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    remote_url character varying(500) NOT NULL,
    verify_ssl boolean NOT NULL,
    timeout integer NOT NULL,
    extra_config jsonb,
    secrets_group_id uuid,
    ca_file_path character varying(255) NOT NULL,
    headers jsonb,
    http_method character varying(10) NOT NULL
);


ALTER TABLE public.extras_externalintegration OWNER TO nautobot;

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
    uploaded_at timestamp with time zone NOT NULL,
    job_result_id uuid
);


ALTER TABLE public.extras_fileproxy OWNER TO nautobot;

--
-- Name: extras_gitrepository; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_gitrepository (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    remote_url character varying(255) NOT NULL,
    branch character varying(255) NOT NULL,
    current_head character varying(48) NOT NULL,
    provided_contents jsonb NOT NULL,
    secrets_group_id uuid
);


ALTER TABLE public.extras_gitrepository OWNER TO nautobot;

--
-- Name: extras_graphqlquery; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_graphqlquery (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    query text NOT NULL,
    variables jsonb NOT NULL
);


ALTER TABLE public.extras_graphqlquery OWNER TO nautobot;

--
-- Name: extras_healthchecktestmodel; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_healthchecktestmodel (
    id uuid NOT NULL,
    title character varying(255) NOT NULL
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
    name character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    module_name character varying(100) NOT NULL,
    job_class_name character varying(100) NOT NULL,
    "grouping" character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    installed boolean NOT NULL,
    enabled boolean NOT NULL,
    dryrun_default boolean NOT NULL,
    hidden boolean NOT NULL,
    read_only boolean NOT NULL,
    approval_required boolean NOT NULL,
    soft_time_limit double precision NOT NULL,
    time_limit double precision NOT NULL,
    grouping_override boolean NOT NULL,
    name_override boolean NOT NULL,
    description_override boolean NOT NULL,
    dryrun_default_override boolean NOT NULL,
    hidden_override boolean NOT NULL,
    approval_required_override boolean NOT NULL,
    soft_time_limit_override boolean NOT NULL,
    time_limit_override boolean NOT NULL,
    has_sensitive_variables boolean NOT NULL,
    has_sensitive_variables_override boolean NOT NULL,
    is_job_hook_receiver boolean NOT NULL,
    task_queues jsonb NOT NULL,
    task_queues_override boolean NOT NULL,
    is_job_button_receiver boolean NOT NULL,
    supports_dryrun boolean NOT NULL
);


ALTER TABLE public.extras_job OWNER TO nautobot;

--
-- Name: extras_jobbutton; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobbutton (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    text character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(255) NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    enabled boolean NOT NULL,
    name character varying(255) NOT NULL,
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
    log_object character varying(200) NOT NULL,
    absolute_url character varying(255) NOT NULL,
    job_result_id uuid NOT NULL
);


ALTER TABLE public.extras_joblogentry OWNER TO nautobot;

--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_jobresult (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_done timestamp with time zone,
    status character varying(30) NOT NULL,
    result jsonb,
    user_id uuid,
    _custom_field_data jsonb NOT NULL,
    scheduled_job_id uuid,
    job_model_id uuid,
    task_args jsonb NOT NULL,
    meta jsonb,
    task_kwargs jsonb NOT NULL,
    task_name character varying(255),
    traceback text,
    worker character varying(100),
    celery_kwargs jsonb NOT NULL
);


ALTER TABLE public.extras_jobresult OWNER TO nautobot;

--
-- Name: extras_note; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_note (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    assigned_object_id uuid NOT NULL,
    user_name character varying(150) NOT NULL,
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
    changed_object_type_id integer,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    label character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    type character varying(50) NOT NULL,
    source_label character varying(255) NOT NULL,
    source_hidden boolean NOT NULL,
    source_filter jsonb,
    destination_label character varying(255) NOT NULL,
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
-- Name: extras_role; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_role (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(255) NOT NULL,
    weight smallint,
    CONSTRAINT extras_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_role OWNER TO nautobot;

--
-- Name: extras_role_content_types; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_role_content_types (
    id bigint NOT NULL,
    role_id uuid NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_role_content_types OWNER TO nautobot;

--
-- Name: extras_role_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_role_content_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_role_content_types_id_seq OWNER TO nautobot;

--
-- Name: extras_role_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_role_content_types_id_seq OWNED BY public.extras_role_content_types.id;


--
-- Name: extras_scheduledjob; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_scheduledjob (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    task character varying(201) NOT NULL,
    "interval" character varying(255) NOT NULL,
    args jsonb NOT NULL,
    kwargs jsonb NOT NULL,
    queue character varying(255) NOT NULL,
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
    celery_kwargs jsonb NOT NULL,
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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    provider character varying(255) NOT NULL,
    parameters jsonb NOT NULL
);


ALTER TABLE public.extras_secret OWNER TO nautobot;

--
-- Name: extras_secretsgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secretsgroup (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.extras_secretsgroup OWNER TO nautobot;

--
-- Name: extras_secretsgroupassociation; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_secretsgroupassociation (
    id uuid NOT NULL,
    access_type character varying(32) NOT NULL,
    secret_type character varying(32) NOT NULL,
    secrets_group_id uuid NOT NULL,
    secret_id uuid NOT NULL
);


ALTER TABLE public.extras_secretsgroupassociation OWNER TO nautobot;

--
-- Name: extras_status; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_status (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(255) NOT NULL
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
    name character varying(255) NOT NULL,
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(255) NOT NULL
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
-- Name: extras_team; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_team (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    address text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.extras_team OWNER TO nautobot;

--
-- Name: extras_team_contacts; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_team_contacts (
    id bigint NOT NULL,
    team_id uuid NOT NULL,
    contact_id uuid NOT NULL
);


ALTER TABLE public.extras_team_contacts OWNER TO nautobot;

--
-- Name: extras_team_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.extras_team_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_team_contacts_id_seq OWNER TO nautobot;

--
-- Name: extras_team_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.extras_team_contacts_id_seq OWNED BY public.extras_team_contacts.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.extras_webhook (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    name character varying(255) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(255) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096) NOT NULL
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
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_ipaddress (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    host bytea NOT NULL,
    mask_length integer NOT NULL,
    dns_name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    nat_inside_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid,
    role_id uuid,
    ip_version integer NOT NULL,
    parent_id uuid,
    type character varying(50) NOT NULL
);


ALTER TABLE public.ipam_ipaddress OWNER TO nautobot;

--
-- Name: ipam_ipaddresstointerface; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_ipaddresstointerface (
    id uuid NOT NULL,
    is_source boolean NOT NULL,
    is_destination boolean NOT NULL,
    is_default boolean NOT NULL,
    is_preferred boolean NOT NULL,
    is_primary boolean NOT NULL,
    is_secondary boolean NOT NULL,
    is_standby boolean NOT NULL,
    interface_id uuid,
    ip_address_id uuid NOT NULL,
    vm_interface_id uuid
);


ALTER TABLE public.ipam_ipaddresstointerface OWNER TO nautobot;

--
-- Name: ipam_namespace; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_namespace (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    location_id uuid
);


ALTER TABLE public.ipam_namespace OWNER TO nautobot;

--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_prefix (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    network bytea NOT NULL,
    broadcast bytea NOT NULL,
    prefix_length integer NOT NULL,
    description character varying(255) NOT NULL,
    status_id uuid NOT NULL,
    tenant_id uuid,
    vlan_id uuid,
    role_id uuid,
    type character varying(50) NOT NULL,
    date_allocated timestamp with time zone,
    rir_id uuid,
    ip_version integer NOT NULL,
    namespace_id uuid NOT NULL,
    parent_id uuid
);


ALTER TABLE public.ipam_prefix OWNER TO nautobot;

--
-- Name: ipam_prefixlocationassignment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_prefixlocationassignment (
    id uuid NOT NULL,
    location_id uuid NOT NULL,
    prefix_id uuid NOT NULL
);


ALTER TABLE public.ipam_prefixlocationassignment OWNER TO nautobot;

--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_rir (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO nautobot;

--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_routetarget (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(255) NOT NULL,
    tenant_id uuid
);


ALTER TABLE public.ipam_routetarget OWNER TO nautobot;

--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_service (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports jsonb NOT NULL,
    description character varying(255) NOT NULL,
    device_id uuid,
    virtual_machine_id uuid
);


ALTER TABLE public.ipam_service OWNER TO nautobot;

--
-- Name: ipam_service_ip_addresses; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_service_ip_addresses (
    id bigint NOT NULL,
    service_id uuid NOT NULL,
    ipaddress_id uuid NOT NULL
);


ALTER TABLE public.ipam_service_ip_addresses OWNER TO nautobot;

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

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ip_addresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlan (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    vid smallint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    vlan_group_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid,
    role_id uuid,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO nautobot;

--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlangroup (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    location_id uuid
);


ALTER TABLE public.ipam_vlangroup OWNER TO nautobot;

--
-- Name: ipam_vlanlocationassignment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vlanlocationassignment (
    id uuid NOT NULL,
    location_id uuid NOT NULL,
    vlan_id uuid NOT NULL
);


ALTER TABLE public.ipam_vlanlocationassignment OWNER TO nautobot;

--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrf (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    rd character varying(21),
    description character varying(255) NOT NULL,
    tenant_id uuid,
    namespace_id uuid NOT NULL
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
-- Name: ipam_vrfdeviceassignment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrfdeviceassignment (
    id uuid NOT NULL,
    rd character varying(21),
    name character varying(255) NOT NULL,
    device_id uuid,
    virtual_machine_id uuid,
    vrf_id uuid NOT NULL
);


ALTER TABLE public.ipam_vrfdeviceassignment OWNER TO nautobot;

--
-- Name: ipam_vrfprefixassignment; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.ipam_vrfprefixassignment (
    id uuid NOT NULL,
    prefix_id uuid NOT NULL,
    vrf_id uuid NOT NULL
);


ALTER TABLE public.ipam_vrfprefixassignment OWNER TO nautobot;

--
-- Name: silk_profile; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.silk_profile (
    id integer NOT NULL,
    name character varying(300) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    time_taken double precision,
    file_path character varying(300) NOT NULL,
    line_num integer,
    end_line_num integer,
    func_name character varying(300) NOT NULL,
    exception_raised boolean NOT NULL,
    dynamic boolean NOT NULL,
    request_id character varying(36)
);


ALTER TABLE public.silk_profile OWNER TO nautobot;

--
-- Name: silk_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.silk_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.silk_profile_id_seq OWNER TO nautobot;

--
-- Name: silk_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.silk_profile_id_seq OWNED BY public.silk_profile.id;


--
-- Name: silk_profile_queries; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.silk_profile_queries (
    id bigint NOT NULL,
    profile_id integer NOT NULL,
    sqlquery_id integer NOT NULL
);


ALTER TABLE public.silk_profile_queries OWNER TO nautobot;

--
-- Name: silk_profile_queries_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.silk_profile_queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.silk_profile_queries_id_seq OWNER TO nautobot;

--
-- Name: silk_profile_queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.silk_profile_queries_id_seq OWNED BY public.silk_profile_queries.id;


--
-- Name: silk_request; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.silk_request (
    id character varying(36) NOT NULL,
    path character varying(190) NOT NULL,
    query_params text NOT NULL,
    raw_body text NOT NULL,
    body text NOT NULL,
    method character varying(10) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    view_name character varying(190),
    end_time timestamp with time zone,
    time_taken double precision,
    encoded_headers text NOT NULL,
    meta_time double precision,
    meta_num_queries integer,
    meta_time_spent_queries double precision,
    pyprofile text NOT NULL,
    num_sql_queries integer NOT NULL,
    prof_file character varying(300) NOT NULL
);


ALTER TABLE public.silk_request OWNER TO nautobot;

--
-- Name: silk_response; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.silk_response (
    id character varying(36) NOT NULL,
    status_code integer NOT NULL,
    raw_body text NOT NULL,
    body text NOT NULL,
    encoded_headers text NOT NULL,
    request_id character varying(36) NOT NULL
);


ALTER TABLE public.silk_response OWNER TO nautobot;

--
-- Name: silk_sqlquery; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.silk_sqlquery (
    id integer NOT NULL,
    query text NOT NULL,
    start_time timestamp with time zone,
    end_time timestamp with time zone,
    time_taken double precision,
    traceback text NOT NULL,
    request_id character varying(36),
    identifier integer NOT NULL,
    analysis text
);


ALTER TABLE public.silk_sqlquery OWNER TO nautobot;

--
-- Name: silk_sqlquery_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.silk_sqlquery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.silk_sqlquery_id_seq OWNER TO nautobot;

--
-- Name: silk_sqlquery_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.silk_sqlquery_id_seq OWNED BY public.silk_sqlquery.id;


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
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    comments text NOT NULL,
    tenant_group_id uuid
);


ALTER TABLE public.tenancy_tenant OWNER TO nautobot;

--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.tenancy_tenantgroup (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    parent_id uuid
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO nautobot;

--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.users_objectpermission (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    actions jsonb NOT NULL,
    constraints jsonb,
    created timestamp with time zone,
    last_updated timestamp with time zone
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
    description character varying(255) NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.users_token OWNER TO nautobot;

--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_cluster (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    comments text NOT NULL,
    cluster_group_id uuid,
    tenant_id uuid,
    cluster_type_id uuid NOT NULL,
    location_id uuid
);


ALTER TABLE public.virtualization_cluster OWNER TO nautobot;

--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_clustergroup (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO nautobot;

--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_clustertype (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO nautobot;

--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_virtualmachine (
    id uuid NOT NULL,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    _custom_field_data jsonb NOT NULL,
    local_config_context_data jsonb,
    local_config_context_data_owner_object_id uuid,
    name character varying(255) NOT NULL,
    vcpus smallint,
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id uuid NOT NULL,
    local_config_context_data_owner_content_type_id integer,
    platform_id uuid,
    primary_ip4_id uuid,
    primary_ip6_id uuid,
    status_id uuid NOT NULL,
    tenant_id uuid,
    local_config_context_schema_id uuid,
    role_id uuid,
    software_version_id uuid,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0)),
    CONSTRAINT virtualization_virtualmachine_vcpus_check CHECK ((vcpus >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO nautobot;

--
-- Name: virtualization_virtualmachine_software_image_files; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_virtualmachine_software_image_files (
    id bigint NOT NULL,
    virtualmachine_id uuid NOT NULL,
    softwareimagefile_id uuid NOT NULL
);


ALTER TABLE public.virtualization_virtualmachine_software_image_files OWNER TO nautobot;

--
-- Name: virtualization_virtualmachine_software_image_files_id_seq; Type: SEQUENCE; Schema: public; Owner: nautobot
--

CREATE SEQUENCE public.virtualization_virtualmachine_software_image_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_software_image_files_id_seq OWNER TO nautobot;

--
-- Name: virtualization_virtualmachine_software_image_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nautobot
--

ALTER SEQUENCE public.virtualization_virtualmachine_software_image_files_id_seq OWNED BY public.virtualization_virtualmachine_software_image_files.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: nautobot
--

CREATE TABLE public.virtualization_vminterface (
    id uuid NOT NULL,
    _custom_field_data jsonb NOT NULL,
    enabled boolean NOT NULL,
    mac_address character varying(18) NOT NULL,
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(255) NOT NULL,
    _name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    untagged_vlan_id uuid,
    virtual_machine_id uuid NOT NULL,
    status_id uuid NOT NULL,
    parent_interface_id uuid,
    bridge_id uuid,
    created timestamp with time zone,
    last_updated timestamp with time zone,
    vrf_id uuid,
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
-- Name: dcim_device_software_image_files id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device_software_image_files ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_software_image_files_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_inventoryitem_software_image_files id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem_software_image_files ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitem_software_image_files_id_seq'::regclass);


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
-- Name: django_celery_results_chordcounter id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_chordcounter ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_chordcounter_id_seq'::regclass);


--
-- Name: django_celery_results_groupresult id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_groupresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_groupresult_id_seq'::regclass);


--
-- Name: django_celery_results_taskresult id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_taskresult ALTER COLUMN id SET DEFAULT nextval('public.django_celery_results_taskresult_id_seq'::regclass);


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
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_new_roles_id_seq'::regclass);


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
-- Name: extras_role_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_role_content_types_id_seq'::regclass);


--
-- Name: extras_status_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_status_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_status_content_types_id_seq'::regclass);


--
-- Name: extras_tag_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_tag_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_content_types_id_seq'::regclass);


--
-- Name: extras_team_contacts id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team_contacts ALTER COLUMN id SET DEFAULT nextval('public.extras_team_contacts_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_service_ip_addresses id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ip_addresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: silk_profile id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile ALTER COLUMN id SET DEFAULT nextval('public.silk_profile_id_seq'::regclass);


--
-- Name: silk_profile_queries id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile_queries ALTER COLUMN id SET DEFAULT nextval('public.silk_profile_queries_id_seq'::regclass);


--
-- Name: silk_sqlquery id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_sqlquery ALTER COLUMN id SET DEFAULT nextval('public.silk_sqlquery_id_seq'::regclass);


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
-- Name: virtualization_virtualmachine_software_image_files id; Type: DEFAULT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine_software_image_files ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_software_image_files_id_seq'::regclass);


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
1	Can add permission	27	add_permission
2	Can change permission	27	change_permission
3	Can delete permission	27	delete_permission
4	Can view permission	27	view_permission
5	Can add group	28	add_group
6	Can change group	28	change_group
7	Can delete group	28	delete_group
8	Can view group	28	view_group
9	Can change config	29	change_config
10	Can view config	29	view_config
11	Can add content type	30	add_contenttype
12	Can change content type	30	change_contenttype
13	Can delete content type	30	delete_contenttype
14	Can view content type	30	view_contenttype
15	Can add session	31	add_session
16	Can change session	31	change_session
17	Can delete session	31	delete_session
18	Can view session	31	view_session
19	Can add association	32	add_association
20	Can change association	32	change_association
21	Can delete association	32	delete_association
22	Can view association	32	view_association
23	Can add code	33	add_code
24	Can change code	33	change_code
25	Can delete code	33	delete_code
26	Can view code	33	view_code
27	Can add nonce	34	add_nonce
28	Can change nonce	34	change_nonce
29	Can delete nonce	34	delete_nonce
30	Can view nonce	34	view_nonce
31	Can add user social auth	35	add_usersocialauth
32	Can change user social auth	35	change_usersocialauth
33	Can delete user social auth	35	delete_usersocialauth
34	Can view user social auth	35	view_usersocialauth
35	Can add partial	36	add_partial
36	Can change partial	36	change_partial
37	Can delete partial	36	delete_partial
38	Can view partial	36	view_partial
39	Can add tag	37	add_tag
40	Can change tag	37	change_tag
41	Can delete tag	37	delete_tag
42	Can view tag	37	view_tag
43	Can add tagged item	38	add_taggeditem
44	Can change tagged item	38	change_taggeditem
45	Can delete tagged item	38	delete_taggeditem
46	Can view tagged item	38	view_taggeditem
47	Can add log entry	39	add_logentry
48	Can change log entry	39	change_logentry
49	Can delete log entry	39	delete_logentry
50	Can view log entry	39	view_logentry
51	Can add crontab	40	add_crontabschedule
52	Can change crontab	40	change_crontabschedule
53	Can delete crontab	40	delete_crontabschedule
54	Can view crontab	40	view_crontabschedule
55	Can add interval	41	add_intervalschedule
56	Can change interval	41	change_intervalschedule
57	Can delete interval	41	delete_intervalschedule
58	Can view interval	41	view_intervalschedule
59	Can add periodic task	42	add_periodictask
60	Can change periodic task	42	change_periodictask
61	Can delete periodic task	42	delete_periodictask
62	Can view periodic task	42	view_periodictask
63	Can add periodic tasks	43	add_periodictasks
64	Can change periodic tasks	43	change_periodictasks
65	Can delete periodic tasks	43	delete_periodictasks
66	Can view periodic tasks	43	view_periodictasks
67	Can add solar event	44	add_solarschedule
68	Can change solar event	44	change_solarschedule
69	Can delete solar event	44	delete_solarschedule
70	Can view solar event	44	view_solarschedule
71	Can add clocked	45	add_clockedschedule
72	Can change clocked	45	change_clockedschedule
73	Can delete clocked	45	delete_clockedschedule
74	Can view clocked	45	view_clockedschedule
75	Can add task result	46	add_taskresult
76	Can change task result	46	change_taskresult
77	Can delete task result	46	delete_taskresult
78	Can view task result	46	view_taskresult
79	Can add chord counter	47	add_chordcounter
80	Can change chord counter	47	change_chordcounter
81	Can delete chord counter	47	delete_chordcounter
82	Can view chord counter	47	view_chordcounter
83	Can add group result	48	add_groupresult
84	Can change group result	48	change_groupresult
85	Can delete group result	48	delete_groupresult
86	Can view group result	48	view_groupresult
87	Can add circuit	1	add_circuit
88	Can change circuit	1	change_circuit
89	Can delete circuit	1	delete_circuit
90	Can view circuit	1	view_circuit
91	Can add circuit termination	49	add_circuittermination
92	Can change circuit termination	49	change_circuittermination
93	Can delete circuit termination	49	delete_circuittermination
94	Can view circuit termination	49	view_circuittermination
95	Can add circuit type	50	add_circuittype
96	Can change circuit type	50	change_circuittype
97	Can delete circuit type	50	delete_circuittype
98	Can view circuit type	50	view_circuittype
99	Can add provider	51	add_provider
100	Can change provider	51	change_provider
101	Can delete provider	51	delete_provider
102	Can view provider	51	view_provider
103	Can add provider network	52	add_providernetwork
104	Can change provider network	52	change_providernetwork
105	Can delete provider network	52	delete_providernetwork
106	Can view provider network	52	view_providernetwork
107	Can add cable	2	add_cable
108	Can change cable	2	change_cable
109	Can delete cable	2	delete_cable
110	Can view cable	2	view_cable
111	Can add cable path	53	add_cablepath
112	Can change cable path	53	change_cablepath
113	Can delete cable path	53	delete_cablepath
114	Can view cable path	53	view_cablepath
115	Can add console port	54	add_consoleport
116	Can change console port	54	change_consoleport
117	Can delete console port	54	delete_consoleport
118	Can view console port	54	view_consoleport
119	Can add console port template	55	add_consoleporttemplate
120	Can change console port template	55	change_consoleporttemplate
121	Can delete console port template	55	delete_consoleporttemplate
122	Can view console port template	55	view_consoleporttemplate
123	Can add console server port	56	add_consoleserverport
124	Can change console server port	56	change_consoleserverport
125	Can delete console server port	56	delete_consoleserverport
126	Can view console server port	56	view_consoleserverport
127	Can add console server port template	57	add_consoleserverporttemplate
128	Can change console server port template	57	change_consoleserverporttemplate
129	Can delete console server port template	57	delete_consoleserverporttemplate
130	Can view console server port template	57	view_consoleserverporttemplate
131	Can add device	3	add_device
132	Can change device	3	change_device
133	Can delete device	3	delete_device
134	Can view device	3	view_device
135	Can add device bay	58	add_devicebay
136	Can change device bay	58	change_devicebay
137	Can delete device bay	58	delete_devicebay
138	Can view device bay	58	view_devicebay
139	Can add device bay template	59	add_devicebaytemplate
140	Can change device bay template	59	change_devicebaytemplate
141	Can delete device bay template	59	delete_devicebaytemplate
142	Can view device bay template	59	view_devicebaytemplate
143	Can add device type	60	add_devicetype
144	Can change device type	60	change_devicetype
145	Can delete device type	60	delete_devicetype
146	Can view device type	60	view_devicetype
147	Can add front port	61	add_frontport
148	Can change front port	61	change_frontport
149	Can delete front port	61	delete_frontport
150	Can view front port	61	view_frontport
151	Can add front port template	62	add_frontporttemplate
152	Can change front port template	62	change_frontporttemplate
153	Can delete front port template	62	delete_frontporttemplate
154	Can view front port template	62	view_frontporttemplate
155	Can add interface	13	add_interface
156	Can change interface	13	change_interface
157	Can delete interface	13	delete_interface
158	Can view interface	13	view_interface
159	Can add interface template	63	add_interfacetemplate
160	Can change interface template	63	change_interfacetemplate
161	Can delete interface template	63	delete_interfacetemplate
162	Can view interface template	63	view_interfacetemplate
163	Can add inventory item	64	add_inventoryitem
164	Can change inventory item	64	change_inventoryitem
165	Can delete inventory item	64	delete_inventoryitem
166	Can view inventory item	64	view_inventoryitem
167	Can add manufacturer	65	add_manufacturer
168	Can change manufacturer	65	change_manufacturer
169	Can delete manufacturer	65	delete_manufacturer
170	Can view manufacturer	65	view_manufacturer
171	Can add platform	66	add_platform
172	Can change platform	66	change_platform
173	Can delete platform	66	delete_platform
174	Can view platform	66	view_platform
175	Can add power feed	4	add_powerfeed
176	Can change power feed	4	change_powerfeed
177	Can delete power feed	4	delete_powerfeed
178	Can view power feed	4	view_powerfeed
179	Can add power outlet	67	add_poweroutlet
180	Can change power outlet	67	change_poweroutlet
181	Can delete power outlet	67	delete_poweroutlet
182	Can view power outlet	67	view_poweroutlet
183	Can add power outlet template	68	add_poweroutlettemplate
184	Can change power outlet template	68	change_poweroutlettemplate
185	Can delete power outlet template	68	delete_poweroutlettemplate
186	Can view power outlet template	68	view_poweroutlettemplate
187	Can add power panel	69	add_powerpanel
188	Can change power panel	69	change_powerpanel
189	Can delete power panel	69	delete_powerpanel
190	Can view power panel	69	view_powerpanel
191	Can add power port	70	add_powerport
192	Can change power port	70	change_powerport
193	Can delete power port	70	delete_powerport
194	Can view power port	70	view_powerport
195	Can add power port template	71	add_powerporttemplate
196	Can change power port template	71	change_powerporttemplate
197	Can delete power port template	71	delete_powerporttemplate
198	Can view power port template	71	view_powerporttemplate
199	Can add rack	5	add_rack
200	Can change rack	5	change_rack
201	Can delete rack	5	delete_rack
202	Can view rack	5	view_rack
203	Can add rack group	72	add_rackgroup
204	Can change rack group	72	change_rackgroup
205	Can delete rack group	72	delete_rackgroup
206	Can view rack group	72	view_rackgroup
207	Can add rack reservation	73	add_rackreservation
208	Can change rack reservation	73	change_rackreservation
209	Can delete rack reservation	73	delete_rackreservation
210	Can view rack reservation	73	view_rackreservation
211	Can add rear port	74	add_rearport
212	Can change rear port	74	change_rearport
213	Can delete rear port	74	delete_rearport
214	Can view rear port	74	view_rearport
215	Can add rear port template	75	add_rearporttemplate
216	Can change rear port template	75	change_rearporttemplate
217	Can delete rear port template	75	delete_rearporttemplate
218	Can view rear port template	75	view_rearporttemplate
219	Can add virtual chassis	76	add_virtualchassis
220	Can change virtual chassis	76	change_virtualchassis
221	Can delete virtual chassis	76	delete_virtualchassis
222	Can view virtual chassis	76	view_virtualchassis
223	Can add location type	77	add_locationtype
224	Can change location type	77	change_locationtype
225	Can delete location type	77	delete_locationtype
226	Can view location type	77	view_locationtype
227	Can add location	14	add_location
228	Can change location	14	change_location
229	Can delete location	14	delete_location
230	Can view location	14	view_location
231	Can add device redundancy group	19	add_deviceredundancygroup
232	Can change device redundancy group	19	change_deviceredundancygroup
233	Can delete device redundancy group	19	delete_deviceredundancygroup
234	Can view device redundancy group	19	view_deviceredundancygroup
235	Can add interface redundancy group	20	add_interfaceredundancygroup
236	Can change interface redundancy group	20	change_interfaceredundancygroup
237	Can delete interface redundancy group	20	delete_interfaceredundancygroup
238	Can view interface redundancy group	20	view_interfaceredundancygroup
239	Can add interface redundancy group association	78	add_interfaceredundancygroupassociation
240	Can change interface redundancy group association	78	change_interfaceredundancygroupassociation
241	Can delete interface redundancy group association	78	delete_interfaceredundancygroupassociation
242	Can view interface redundancy group association	78	view_interfaceredundancygroupassociation
243	Can add device family	79	add_devicefamily
244	Can change device family	79	change_devicefamily
245	Can delete device family	79	delete_devicefamily
246	Can view device family	79	view_devicefamily
247	Can add software version	25	add_softwareversion
248	Can change software version	25	change_softwareversion
249	Can delete software version	25	delete_softwareversion
250	Can view software version	25	view_softwareversion
251	Can add software image file	24	add_softwareimagefile
252	Can change software image file	24	change_softwareimagefile
253	Can delete software image file	24	delete_softwareimagefile
254	Can view software image file	24	view_softwareimagefile
255	Can add device type to software image file mapping	80	add_devicetypetosoftwareimagefile
256	Can change device type to software image file mapping	80	change_devicetypetosoftwareimagefile
257	Can delete device type to software image file mapping	80	delete_devicetypetosoftwareimagefile
258	Can view device type to software image file mapping	80	view_devicetypetosoftwareimagefile
259	Can add controller	26	add_controller
260	Can change controller	26	change_controller
261	Can delete controller	26	delete_controller
262	Can view controller	26	view_controller
263	Can add controller managed device group	81	add_controllermanageddevicegroup
264	Can change controller managed device group	81	change_controllermanageddevicegroup
265	Can delete controller managed device group	81	delete_controllermanageddevicegroup
266	Can view controller managed device group	81	view_controllermanageddevicegroup
267	Can add IP address	6	add_ipaddress
268	Can change IP address	6	change_ipaddress
269	Can delete IP address	6	delete_ipaddress
270	Can view IP address	6	view_ipaddress
271	Can add prefix	7	add_prefix
272	Can change prefix	7	change_prefix
273	Can delete prefix	7	delete_prefix
274	Can view prefix	7	view_prefix
275	Can add RIR	82	add_rir
276	Can change RIR	82	change_rir
277	Can delete RIR	82	delete_rir
278	Can view RIR	82	view_rir
279	Can add route target	83	add_routetarget
280	Can change route target	83	change_routetarget
281	Can delete route target	83	delete_routetarget
282	Can view route target	83	view_routetarget
283	Can add VRF	84	add_vrf
284	Can change VRF	84	change_vrf
285	Can delete VRF	84	delete_vrf
286	Can view VRF	84	view_vrf
287	Can add VLAN group	85	add_vlangroup
479	Can add tenant	128	add_tenant
288	Can change VLAN group	85	change_vlangroup
289	Can delete VLAN group	85	delete_vlangroup
290	Can view VLAN group	85	view_vlangroup
291	Can add VLAN	8	add_vlan
292	Can change VLAN	8	change_vlan
293	Can delete VLAN	8	delete_vlan
294	Can view VLAN	8	view_vlan
295	Can add service	86	add_service
296	Can change service	86	change_service
297	Can delete service	86	delete_service
298	Can view service	86	view_service
299	Can add IP Address Assignment	87	add_ipaddresstointerface
300	Can change IP Address Assignment	87	change_ipaddresstointerface
301	Can delete IP Address Assignment	87	delete_ipaddresstointerface
302	Can view IP Address Assignment	87	view_ipaddresstointerface
303	Can add vrf prefix assignment	88	add_vrfprefixassignment
304	Can change vrf prefix assignment	88	change_vrfprefixassignment
305	Can delete vrf prefix assignment	88	delete_vrfprefixassignment
306	Can view vrf prefix assignment	88	view_vrfprefixassignment
307	Can add vrf device assignment	89	add_vrfdeviceassignment
308	Can change vrf device assignment	89	change_vrfdeviceassignment
309	Can delete vrf device assignment	89	delete_vrfdeviceassignment
310	Can view vrf device assignment	89	view_vrfdeviceassignment
311	Can add namespace	90	add_namespace
312	Can change namespace	90	change_namespace
313	Can delete namespace	90	delete_namespace
314	Can view namespace	90	view_namespace
315	Can add vlan location assignment	91	add_vlanlocationassignment
316	Can change vlan location assignment	91	change_vlanlocationassignment
317	Can delete vlan location assignment	91	delete_vlanlocationassignment
318	Can view vlan location assignment	91	view_vlanlocationassignment
319	Can add prefix location assignment	92	add_prefixlocationassignment
320	Can change prefix location assignment	92	change_prefixlocationassignment
321	Can delete prefix location assignment	92	delete_prefixlocationassignment
322	Can view prefix location assignment	92	view_prefixlocationassignment
323	Can add config context	93	add_configcontext
324	Can change config context	93	change_configcontext
325	Can delete config context	93	delete_configcontext
326	Can view config context	93	view_configcontext
327	Can add custom field	10	add_customfield
328	Can change custom field	10	change_customfield
329	Can delete custom field	10	delete_customfield
330	Can view custom field	10	view_customfield
331	Can add custom field choice	94	add_customfieldchoice
332	Can change custom field choice	94	change_customfieldchoice
333	Can delete custom field choice	94	delete_customfieldchoice
334	Can view custom field choice	94	view_customfieldchoice
335	Can add custom link	95	add_customlink
336	Can change custom link	95	change_customlink
337	Can delete custom link	95	delete_customlink
338	Can view custom link	95	view_customlink
339	Can add export template	96	add_exporttemplate
340	Can change export template	96	change_exporttemplate
341	Can delete export template	96	delete_exporttemplate
342	Can view export template	96	view_exporttemplate
343	Can add Git repository	97	add_gitrepository
344	Can change Git repository	97	change_gitrepository
345	Can delete Git repository	97	delete_gitrepository
346	Can view Git repository	97	view_gitrepository
347	Can add image attachment	98	add_imageattachment
348	Can change image attachment	98	change_imageattachment
349	Can delete image attachment	98	delete_imageattachment
350	Can view image attachment	98	view_imageattachment
351	Can add job result	99	add_jobresult
352	Can change job result	99	change_jobresult
353	Can delete job result	99	delete_jobresult
354	Can view job result	99	view_jobresult
355	Can add relationship	100	add_relationship
356	Can change relationship	100	change_relationship
357	Can delete relationship	100	delete_relationship
358	Can view relationship	100	view_relationship
359	Can add tag	101	add_tag
360	Can change tag	101	change_tag
361	Can delete tag	101	delete_tag
362	Can view tag	101	view_tag
363	Can add webhook	102	add_webhook
364	Can change webhook	102	change_webhook
365	Can delete webhook	102	delete_webhook
366	Can view webhook	102	view_webhook
367	Can add tagged item	103	add_taggeditem
368	Can change tagged item	103	change_taggeditem
369	Can delete tagged item	103	delete_taggeditem
370	Can view tagged item	103	view_taggeditem
371	Can add status	104	add_status
372	Can change status	104	change_status
373	Can delete status	104	delete_status
374	Can view status	104	view_status
375	Can add relationship association	105	add_relationshipassociation
376	Can change relationship association	105	change_relationshipassociation
377	Can delete relationship association	105	delete_relationshipassociation
378	Can view relationship association	105	view_relationshipassociation
379	Can add object change	106	add_objectchange
380	Can change object change	106	change_objectchange
381	Can delete object change	106	delete_objectchange
382	Can view object change	106	view_objectchange
383	Can add GraphQL query	107	add_graphqlquery
384	Can change GraphQL query	107	change_graphqlquery
385	Can delete GraphQL query	107	delete_graphqlquery
386	Can view GraphQL query	107	view_graphqlquery
387	Can add config context schema	108	add_configcontextschema
388	Can change config context schema	108	change_configcontextschema
389	Can delete config context schema	108	delete_configcontextschema
390	Can view config context schema	108	view_configcontextschema
391	Can add computed field	109	add_computedfield
392	Can change computed field	109	change_computedfield
393	Can delete computed field	109	delete_computedfield
394	Can view computed field	109	view_computedfield
395	Can add file attachment	110	add_fileattachment
396	Can change file attachment	110	change_fileattachment
397	Can delete file attachment	110	delete_fileattachment
398	Can view file attachment	110	view_fileattachment
399	Can add file proxy	111	add_fileproxy
400	Can change file proxy	111	change_fileproxy
401	Can delete file proxy	111	delete_fileproxy
402	Can view file proxy	111	view_fileproxy
403	Can add health check test model	112	add_healthchecktestmodel
404	Can change health check test model	112	change_healthchecktestmodel
405	Can delete health check test model	112	delete_healthchecktestmodel
406	Can view health check test model	112	view_healthchecktestmodel
407	Can add scheduled jobs	113	add_scheduledjobs
408	Can change scheduled jobs	113	change_scheduledjobs
409	Can delete scheduled jobs	113	delete_scheduledjobs
410	Can view scheduled jobs	113	view_scheduledjobs
411	Can add scheduled job	114	add_scheduledjob
412	Can change scheduled job	114	change_scheduledjob
413	Can delete scheduled job	114	delete_scheduledjob
414	Can view scheduled job	114	view_scheduledjob
415	Can add secret	115	add_secret
416	Can change secret	115	change_secret
417	Can delete secret	115	delete_secret
418	Can view secret	115	view_secret
419	Can add secrets group	116	add_secretsgroup
420	Can change secrets group	116	change_secretsgroup
421	Can delete secrets group	116	delete_secretsgroup
422	Can view secrets group	116	view_secretsgroup
423	Can add secrets group association	117	add_secretsgroupassociation
424	Can change secrets group association	117	change_secretsgroupassociation
425	Can delete secrets group association	117	delete_secretsgroupassociation
426	Can view secrets group association	117	view_secretsgroupassociation
427	Can add job log entry	118	add_joblogentry
428	Can change job log entry	118	change_joblogentry
429	Can delete job log entry	118	delete_joblogentry
430	Can view job log entry	118	view_joblogentry
431	Can add job	11	add_job
432	Can change job	11	change_job
433	Can delete job	11	delete_job
434	Can view job	11	view_job
435	Can add dynamic group	119	add_dynamicgroup
436	Can change dynamic group	119	change_dynamicgroup
437	Can delete dynamic group	119	delete_dynamicgroup
438	Can view dynamic group	119	view_dynamicgroup
439	Can add dynamic group membership	120	add_dynamicgroupmembership
440	Can change dynamic group membership	120	change_dynamicgroupmembership
441	Can delete dynamic group membership	120	delete_dynamicgroupmembership
442	Can view dynamic group membership	120	view_dynamicgroupmembership
443	Can add note	121	add_note
444	Can change note	121	change_note
445	Can delete note	121	delete_note
446	Can view note	121	view_note
447	Can add job hook	122	add_jobhook
448	Can change job hook	122	change_jobhook
449	Can delete job hook	122	delete_jobhook
450	Can view job hook	122	view_jobhook
451	Can add job button	123	add_jobbutton
452	Can change job button	123	change_jobbutton
453	Can delete job button	123	delete_jobbutton
454	Can view job button	123	view_jobbutton
455	Can add role	16	add_role
456	Can change role	16	change_role
457	Can delete role	16	delete_role
458	Can view role	16	view_role
459	Can add external integration	124	add_externalintegration
460	Can change external integration	124	change_externalintegration
461	Can delete external integration	124	delete_externalintegration
462	Can view external integration	124	view_externalintegration
463	Can add contact	125	add_contact
464	Can change contact	125	change_contact
465	Can delete contact	125	delete_contact
466	Can view contact	125	view_contact
467	Can add team	126	add_team
468	Can change team	126	change_team
469	Can delete team	126	delete_team
470	Can view team	126	view_team
471	Can add contact association	23	add_contactassociation
472	Can change contact association	23	change_contactassociation
473	Can delete contact association	23	delete_contactassociation
474	Can view contact association	23	view_contactassociation
475	Can add tenant group	127	add_tenantgroup
476	Can change tenant group	127	change_tenantgroup
477	Can delete tenant group	127	delete_tenantgroup
478	Can view tenant group	127	view_tenantgroup
480	Can change tenant	128	change_tenant
481	Can delete tenant	128	delete_tenant
482	Can view tenant	128	view_tenant
483	Can add user	129	add_user
484	Can change user	129	change_user
485	Can delete user	129	delete_user
486	Can view user	129	view_user
487	Can add Group	130	add_admingroup
488	Can change Group	130	change_admingroup
489	Can delete Group	130	delete_admingroup
490	Can view Group	130	view_admingroup
491	Can add token	131	add_token
492	Can change token	131	change_token
493	Can delete token	131	delete_token
494	Can view token	131	view_token
495	Can add permission	132	add_objectpermission
496	Can change permission	132	change_objectpermission
497	Can delete permission	132	delete_objectpermission
498	Can view permission	132	view_objectpermission
499	Can add cluster	133	add_cluster
500	Can change cluster	133	change_cluster
501	Can delete cluster	133	delete_cluster
502	Can view cluster	133	view_cluster
503	Can add cluster group	134	add_clustergroup
504	Can change cluster group	134	change_clustergroup
505	Can delete cluster group	134	delete_clustergroup
506	Can view cluster group	134	view_clustergroup
507	Can add cluster type	135	add_clustertype
508	Can change cluster type	135	change_clustertype
509	Can delete cluster type	135	delete_clustertype
510	Can view cluster type	135	view_clustertype
511	Can add virtual machine	9	add_virtualmachine
512	Can change virtual machine	9	change_virtualmachine
513	Can delete virtual machine	9	delete_virtualmachine
514	Can view virtual machine	9	view_virtualmachine
515	Can add VM interface	12	add_vminterface
516	Can change VM interface	12	change_vminterface
517	Can delete VM interface	12	delete_vminterface
518	Can view VM interface	12	view_vminterface
519	Can add constance	136	add_constance
520	Can change constance	136	change_constance
521	Can delete constance	136	delete_constance
522	Can view constance	136	view_constance
523	Can add profile	137	add_profile
524	Can change profile	137	change_profile
525	Can delete profile	137	delete_profile
526	Can view profile	137	view_profile
527	Can add request	138	add_request
528	Can change request	138	change_request
529	Can delete request	138	delete_request
530	Can view request	138	view_request
531	Can add response	139	add_response
532	Can change response	139	change_response
533	Can delete response	139	delete_response
534	Can view response	139	view_response
535	Can add sql query	140	add_sqlquery
536	Can change sql query	140	change_sqlquery
537	Can delete sql query	140	delete_sqlquery
538	Can view sql query	140	view_sqlquery
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

COPY public.circuits_circuit (id, created, last_updated, _custom_field_data, cid, install_date, commit_rate, description, comments, provider_id, status_id, tenant_id, circuit_type_id, circuit_termination_a_id, circuit_termination_z_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuittermination (id, _cable_peer_id, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _cable_peer_type_id, _path_id, cable_id, circuit_id, provider_network_id, _custom_field_data, created, last_updated, location_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_circuittype (id, created, last_updated, _custom_field_data, name, description) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_provider (id, created, last_updated, _custom_field_data, name, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.circuits_providernetwork (id, created, last_updated, _custom_field_data, name, description, comments, provider_id) FROM stdin;
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
-- Data for Name: dcim_controller; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_controller (id, created, last_updated, _custom_field_data, name, description, controller_device_id, controller_device_redundancy_group_id, external_integration_id, location_id, platform_id, role_id, status_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_controllermanageddevicegroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_controllermanageddevicegroup (id, created, last_updated, _custom_field_data, name, weight, controller_id, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_device (id, created, last_updated, _custom_field_data, local_config_context_data, local_config_context_data_owner_object_id, name, _name, serial, asset_tag, "position", face, vc_position, vc_priority, comments, cluster_id, device_type_id, local_config_context_data_owner_content_type_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, status_id, tenant_id, virtual_chassis_id, local_config_context_schema_id, secrets_group_id, location_id, device_redundancy_group_priority, device_redundancy_group_id, role_id, software_version_id, controller_managed_device_group_id) FROM stdin;
\.


--
-- Data for Name: dcim_device_software_image_files; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_device_software_image_files (id, device_id, softwareimagefile_id) FROM stdin;
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
-- Data for Name: dcim_devicefamily; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicefamily (id, created, last_updated, _custom_field_data, name, description) FROM stdin;
\.


--
-- Data for Name: dcim_deviceredundancygroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_deviceredundancygroup (id, created, last_updated, _custom_field_data, name, description, failover_strategy, comments, secrets_group_id, status_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicetype (id, created, last_updated, _custom_field_data, model, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id, device_family_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicetypetosoftwareimagefile; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_devicetypetosoftwareimagefile (id, device_type_id, software_image_file_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_frontport (id, _custom_field_data, name, _name, label, description, _cable_peer_id, type, rear_port_position, _cable_peer_type_id, cable_id, device_id, rear_port_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_frontporttemplate (id, _custom_field_data, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_template_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interface (id, _custom_field_data, name, label, description, _cable_peer_id, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _cable_peer_type_id, _path_id, cable_id, device_id, lag_id, untagged_vlan_id, status_id, parent_interface_id, bridge_id, created, last_updated, vrf_id) FROM stdin;
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

COPY public.dcim_interfaceredundancygroupassociation (id, last_updated, priority, interface_id, interface_redundancy_group_id, created) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_interfacetemplate (id, _custom_field_data, name, label, description, _name, type, mgmt_only, device_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_inventoryitem (id, _custom_field_data, name, _name, label, description, part_id, serial, asset_tag, discovered, device_id, manufacturer_id, parent_id, created, last_updated, software_version_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem_software_image_files; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_inventoryitem_software_image_files (id, inventoryitem_id, softwareimagefile_id) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_location (id, created, last_updated, _custom_field_data, name, _name, description, location_type_id, parent_id, status_id, tenant_id, asn, comments, contact_email, contact_name, contact_phone, facility, latitude, longitude, physical_address, shipping_address, time_zone) FROM stdin;
\.


--
-- Data for Name: dcim_locationtype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_locationtype (id, created, last_updated, _custom_field_data, name, description, parent_id, nestable) FROM stdin;
\.


--
-- Data for Name: dcim_locationtype_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_locationtype_content_types (id, locationtype_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_manufacturer (id, created, last_updated, _custom_field_data, name, description) FROM stdin;
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_platform (id, created, last_updated, _custom_field_data, name, napalm_driver, napalm_args, description, manufacturer_id, network_driver) FROM stdin;
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

COPY public.dcim_poweroutlettemplate (id, _custom_field_data, name, _name, label, description, type, feed_leg, device_type_id, power_port_template_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_powerpanel (id, created, last_updated, _custom_field_data, name, rack_group_id, location_id) FROM stdin;
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

COPY public.dcim_rack (id, created, last_updated, _custom_field_data, name, _name, facility_id, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, rack_group_id, status_id, tenant_id, location_id, role_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackgroup (id, created, last_updated, _custom_field_data, name, description, parent_id, location_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_rackreservation (id, created, last_updated, _custom_field_data, units, description, rack_id, tenant_id, user_id) FROM stdin;
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
-- Data for Name: dcim_softwareimagefile; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_softwareimagefile (id, created, last_updated, _custom_field_data, image_file_name, image_file_checksum, hashing_algorithm, image_file_size, download_url, default_image, software_version_id, status_id) FROM stdin;
\.


--
-- Data for Name: dcim_softwareversion; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.dcim_softwareversion (id, created, last_updated, _custom_field_data, version, alias, release_date, end_of_support_date, documentation_url, long_term_support, pre_release, platform_id, status_id) FROM stdin;
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
-- Data for Name: django_celery_results_chordcounter; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_results_chordcounter (id, group_id, sub_tasks, count) FROM stdin;
\.


--
-- Data for Name: django_celery_results_groupresult; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_results_groupresult (id, group_id, date_created, date_done, content_type, content_encoding, result) FROM stdin;
\.


--
-- Data for Name: django_celery_results_taskresult; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_celery_results_taskresult (id, task_id, status, content_type, content_encoding, result, date_done, traceback, meta, task_args, task_kwargs, task_name, worker, date_created, periodic_task_name) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	circuits	circuit
2	dcim	cable
3	dcim	device
4	dcim	powerfeed
5	dcim	rack
6	ipam	ipaddress
7	ipam	prefix
8	ipam	vlan
9	virtualization	virtualmachine
10	extras	customfield
11	extras	job
12	virtualization	vminterface
13	dcim	interface
14	dcim	location
15	dcim	devicerole
16	extras	role
17	dcim	rackrole
18	ipam	role
19	dcim	deviceredundancygroup
20	dcim	interfaceredundancygroup
21	dcim	site
22	ipam	aggregate
23	extras	contactassociation
24	dcim	softwareimagefile
25	dcim	softwareversion
26	dcim	controller
27	auth	permission
28	auth	group
29	constance	config
30	contenttypes	contenttype
31	sessions	session
32	social_django	association
33	social_django	code
34	social_django	nonce
35	social_django	usersocialauth
36	social_django	partial
37	taggit	tag
38	taggit	taggeditem
39	admin	logentry
40	django_celery_beat	crontabschedule
41	django_celery_beat	intervalschedule
42	django_celery_beat	periodictask
43	django_celery_beat	periodictasks
44	django_celery_beat	solarschedule
45	django_celery_beat	clockedschedule
46	django_celery_results	taskresult
47	django_celery_results	chordcounter
48	django_celery_results	groupresult
49	circuits	circuittermination
50	circuits	circuittype
51	circuits	provider
52	circuits	providernetwork
53	dcim	cablepath
54	dcim	consoleport
55	dcim	consoleporttemplate
56	dcim	consoleserverport
57	dcim	consoleserverporttemplate
58	dcim	devicebay
59	dcim	devicebaytemplate
60	dcim	devicetype
61	dcim	frontport
62	dcim	frontporttemplate
63	dcim	interfacetemplate
64	dcim	inventoryitem
65	dcim	manufacturer
66	dcim	platform
67	dcim	poweroutlet
68	dcim	poweroutlettemplate
69	dcim	powerpanel
70	dcim	powerport
71	dcim	powerporttemplate
72	dcim	rackgroup
73	dcim	rackreservation
74	dcim	rearport
75	dcim	rearporttemplate
76	dcim	virtualchassis
77	dcim	locationtype
78	dcim	interfaceredundancygroupassociation
79	dcim	devicefamily
80	dcim	devicetypetosoftwareimagefile
81	dcim	controllermanageddevicegroup
82	ipam	rir
83	ipam	routetarget
84	ipam	vrf
85	ipam	vlangroup
86	ipam	service
87	ipam	ipaddresstointerface
88	ipam	vrfprefixassignment
89	ipam	vrfdeviceassignment
90	ipam	namespace
91	ipam	vlanlocationassignment
92	ipam	prefixlocationassignment
93	extras	configcontext
94	extras	customfieldchoice
95	extras	customlink
96	extras	exporttemplate
97	extras	gitrepository
98	extras	imageattachment
99	extras	jobresult
100	extras	relationship
101	extras	tag
102	extras	webhook
103	extras	taggeditem
104	extras	status
105	extras	relationshipassociation
106	extras	objectchange
107	extras	graphqlquery
108	extras	configcontextschema
109	extras	computedfield
110	extras	fileattachment
111	extras	fileproxy
112	extras	healthchecktestmodel
113	extras	scheduledjobs
114	extras	scheduledjob
115	extras	secret
116	extras	secretsgroup
117	extras	secretsgroupassociation
118	extras	joblogentry
119	extras	dynamicgroup
120	extras	dynamicgroupmembership
121	extras	note
122	extras	jobhook
123	extras	jobbutton
124	extras	externalintegration
125	extras	contact
126	extras	team
127	tenancy	tenantgroup
128	tenancy	tenant
129	users	user
130	users	admingroup
131	users	token
132	users	objectpermission
133	virtualization	cluster
134	virtualization	clustergroup
135	virtualization	clustertype
136	database	constance
137	silk	profile
138	silk	request
139	silk	response
140	silk	sqlquery
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2025-05-26 04:11:30.849359+00
2	contenttypes	0002_remove_content_type_name	2025-05-26 04:11:30.856082+00
3	auth	0001_initial	2025-05-26 04:11:30.89029+00
4	auth	0002_alter_permission_name_max_length	2025-05-26 04:11:30.894608+00
5	auth	0003_alter_user_email_max_length	2025-05-26 04:11:30.899491+00
6	auth	0004_alter_user_username_opts	2025-05-26 04:11:30.903666+00
7	auth	0005_alter_user_last_login_null	2025-05-26 04:11:30.908784+00
8	auth	0006_require_contenttypes_0002	2025-05-26 04:11:30.910285+00
9	auth	0007_alter_validators_add_error_messages	2025-05-26 04:11:30.914616+00
10	auth	0008_alter_user_username_max_length	2025-05-26 04:11:30.919971+00
11	auth	0009_alter_user_last_name_max_length	2025-05-26 04:11:30.925242+00
12	auth	0010_alter_group_name_max_length	2025-05-26 04:11:30.932488+00
13	auth	0011_update_proxy_permissions	2025-05-26 04:11:30.937744+00
14	auth	0012_alter_user_first_name_max_length	2025-05-26 04:11:30.942305+00
15	users	0001_initial	2025-05-26 04:11:31.048591+00
16	admin	0001_initial	2025-05-26 04:11:31.069835+00
17	admin	0002_logentry_remove_auto_add	2025-05-26 04:11:31.077854+00
18	admin	0003_logentry_add_action_flag_choices	2025-05-26 04:11:31.085938+00
19	extras	0001_initial_part_1	2025-05-26 04:11:31.292412+00
20	tenancy	0001_initial	2025-05-26 04:11:31.333329+00
21	dcim	0001_initial_part_1	2025-05-26 04:11:31.590076+00
22	dcim	0002_initial_part_2	2025-05-26 04:11:31.956414+00
23	ipam	0001_initial_part_1	2025-05-26 04:11:32.185691+00
24	extras	0002_initial_part_2	2025-05-26 04:11:32.63375+00
25	dcim	0003_initial_part_3	2025-05-26 04:11:35.314501+00
26	virtualization	0001_initial	2025-05-26 04:11:35.919044+00
27	dcim	0004_initial_part_4	2025-05-26 04:11:39.202617+00
28	extras	0003_initial_part_3	2025-05-26 04:11:40.444266+00
29	ipam	0002_initial_part_2	2025-05-26 04:11:41.941201+00
30	circuits	0001_initial_part_1	2025-05-26 04:11:41.978284+00
31	circuits	0002_initial_part_2	2025-05-26 04:11:43.110765+00
32	extras	0004_populate_default_status_records	2025-05-26 04:11:43.30715+00
33	extras	0005_configcontext_device_types	2025-05-26 04:11:43.389473+00
34	extras	0006_graphqlquery	2025-05-26 04:11:43.403036+00
35	extras	0007_configcontextschema	2025-05-26 04:11:43.726185+00
36	virtualization	0002_virtualmachine_local_context_schema	2025-05-26 04:11:43.797289+00
37	virtualization	0003_vminterface_verbose_name	2025-05-26 04:11:43.838402+00
38	virtualization	0004_auto_slug	2025-05-26 04:11:43.904736+00
39	virtualization	0005_add_natural_indexing	2025-05-26 04:11:44.044014+00
40	extras	0008_jobresult__custom_field_data	2025-05-26 04:11:44.080568+00
41	extras	0009_computedfield	2025-05-26 04:11:44.340873+00
42	extras	0010_change_cf_validation_max_min_field_to_bigint	2025-05-26 04:11:44.435964+00
43	extras	0011_fileattachment_fileproxy	2025-05-26 04:11:44.483771+00
44	extras	0012_healthchecktestmodel	2025-05-26 04:11:44.489893+00
45	extras	0013_default_fallback_value_computedfield	2025-05-26 04:11:44.523486+00
46	extras	0014_auto_slug	2025-05-26 04:11:44.70066+00
47	extras	0015_scheduled_job	2025-05-26 04:11:44.847845+00
48	extras	0016_secret	2025-05-26 04:11:45.338177+00
49	extras	0017_joblogentry	2025-05-26 04:11:45.420374+00
50	extras	0018_joblog_data_migration	2025-05-26 04:11:45.488594+00
51	extras	0019_joblogentry__meta_options__related_name	2025-05-26 04:11:45.739076+00
52	extras	0020_customfield_changelog	2025-05-26 04:11:45.820047+00
53	extras	0021_customfield_changelog_data	2025-05-26 04:11:45.892151+00
54	extras	0022_objectchange_object_datav2	2025-05-26 04:11:45.930529+00
55	extras	0023_job_model	2025-05-26 04:11:46.449718+00
56	extras	0024_job_data_migration	2025-05-26 04:11:46.522634+00
57	extras	0025_add_advanced_ui_boolean_to_customfield_conputedfield_and_relationship	2025-05-26 04:11:46.623395+00
58	extras	0026_job_add_gitrepository_fk	2025-05-26 04:11:46.779904+00
59	extras	0027_job_gitrepository_data_migration	2025-05-26 04:11:47.029138+00
60	extras	0028_job_reduce_source	2025-05-26 04:11:47.094287+00
61	extras	0029_dynamicgroup	2025-05-26 04:11:47.176915+00
62	extras	0030_webhook_alter_unique_together	2025-05-26 04:11:47.214532+00
63	extras	0031_tag_content_types	2025-05-26 04:11:47.295275+00
64	extras	0032_tag_content_types_data_migration	2025-05-26 04:11:47.375646+00
65	extras	0033_add__optimized_indexing	2025-05-26 04:11:48.39058+00
66	virtualization	0006_vminterface_status	2025-05-26 04:11:48.468039+00
67	virtualization	0007_vminterface_status_data_migration	2025-05-26 04:11:48.561271+00
68	virtualization	0008_vminterface_parent	2025-05-26 04:11:48.710535+00
69	extras	0034_alter_fileattachment_mimetype	2025-05-26 04:11:48.71727+00
70	extras	0035_scheduledjob_crontab	2025-05-26 04:11:48.733261+00
71	extras	0036_job_add_has_sensitive_variables	2025-05-26 04:11:48.817516+00
72	extras	0037_configcontextschema__remove_name_unique__create_constraint_unique_name_owner	2025-05-26 04:11:48.891733+00
73	dcim	0005_device_local_context_schema	2025-05-26 04:11:49.189308+00
74	dcim	0006_auto_slug	2025-05-26 04:11:49.563541+00
75	dcim	0007_device_secrets_group	2025-05-26 04:11:49.841482+00
76	dcim	0008_increase_all_serial_lengths	2025-05-26 04:11:49.996632+00
77	dcim	0009_add_natural_indexing	2025-05-26 04:11:52.150892+00
78	dcim	0010_interface_status	2025-05-26 04:11:52.238079+00
79	dcim	0011_interface_status_data_migration	2025-05-26 04:11:52.333806+00
80	dcim	0012_interface_parent_bridge	2025-05-26 04:11:52.797245+00
81	dcim	0013_location_location_type	2025-05-26 04:11:53.536099+00
82	virtualization	0009_cluster_location	2025-05-26 04:11:53.616453+00
83	virtualization	0010_vminterface_mac_address_data_migration	2025-05-26 04:11:53.689786+00
84	virtualization	0011_alter_vminterface_mac_address	2025-05-26 04:11:53.737577+00
85	extras	0038_configcontext_locations	2025-05-26 04:11:53.834154+00
86	extras	0039_objectchange__add_change_context	2025-05-26 04:11:54.115098+00
87	extras	0040_dynamicgroup__dynamicgroupmembership	2025-05-26 04:11:54.278825+00
88	extras	0041_jobresult_job_kwargs	2025-05-26 04:11:54.324132+00
89	extras	0042_job__add_is_job_hook_receiver	2025-05-26 04:11:54.37148+00
90	extras	0043_note	2025-05-26 04:11:54.469149+00
91	extras	0044_add_job_hook	2025-05-26 04:11:54.572773+00
92	extras	0045_add_custom_field_slug	2025-05-26 04:11:54.803121+00
93	extras	0046_populate_custom_field_slug_label	2025-05-26 04:11:54.87953+00
94	extras	0047_enforce_custom_field_slug	2025-05-26 04:11:54.925905+00
95	extras	0048_alter_objectchange_change_context_detail	2025-05-26 04:11:54.971365+00
96	extras	0049_alter_tag_slug	2025-05-26 04:11:55.046589+00
97	extras	0050_customfield_grouping	2025-05-26 04:11:55.086988+00
98	extras	0051_add_job_task_queues	2025-05-26 04:11:55.179553+00
99	dcim	0014_location_status_data_migration	2025-05-26 04:11:55.469427+00
100	dcim	0015_device_components__changeloggedmodel	2025-05-26 04:11:57.191502+00
101	dcim	0016_device_components__timestamp_data_migration	2025-05-26 04:11:57.285523+00
102	dcim	0017_locationtype_nestable	2025-05-26 04:11:57.329096+00
103	dcim	0018_device_redundancy_group	2025-05-26 04:11:57.835125+00
104	extras	0052_configcontext_device_redundancy_groups	2025-05-26 04:11:57.93518+00
105	extras	0053_relationship_required_on	2025-05-26 04:11:57.977855+00
106	extras	0054_scheduledjob_kwargs_request_user_change	2025-05-26 04:11:58.057017+00
107	extras	0055_configcontext_dynamic_groups	2025-05-26 04:11:58.157161+00
108	extras	0056_objectchange_add_reverse_time_idx	2025-05-26 04:11:58.205652+00
109	extras	0057_jobbutton	2025-05-26 04:11:58.357828+00
110	extras	0058_jobresult_add_time_status_idxs	2025-05-26 04:11:59.003829+00
111	extras	0059_joblogentry_scheduledjob_webhook_data_migration	2025-05-26 04:11:59.235367+00
112	extras	0060_alter_joblogentry_scheduledjob_webhook_fields	2025-05-26 04:11:59.504815+00
113	extras	0061_role_and_alter_status	2025-05-26 04:11:59.653792+00
114	extras	0062_collect_roles_from_related_apps_roles	2025-05-26 04:11:59.777458+00
115	virtualization	0012_alter_virtualmachine_role_add_new_role	2025-05-26 04:11:59.941617+00
116	virtualization	0013_migrate_virtualmachine_role_data	2025-05-26 04:12:00.203711+00
117	virtualization	0014_rename_virtualmachine_roles	2025-05-26 04:12:00.366548+00
118	extras	0063_alter_role_options	2025-05-26 04:12:00.410022+00
119	extras	0064_alter_configcontext_and_add_new_role	2025-05-26 04:12:00.583171+00
120	extras	0065_configcontext_data_migrations	2025-05-26 04:12:00.849181+00
121	extras	0066_rename_configcontext_role	2025-05-26 04:12:01.019418+00
122	virtualization	0015_rename_foreignkey_fields	2025-05-26 04:12:01.82652+00
123	ipam	0003_remove_max_length	2025-05-26 04:12:02.366677+00
124	ipam	0004_fixup_p2p_broadcast	2025-05-26 04:12:02.454834+00
125	ipam	0005_auto_slug	2025-05-26 04:12:02.490619+00
126	ipam	0006_ipaddress_nat_outside_list	2025-05-26 04:12:02.594272+00
127	ipam	0007_add_natural_indexing	2025-05-26 04:12:03.439129+00
128	ipam	0008_prefix_vlan_vlangroup_location	2025-05-26 04:12:03.697972+00
129	ipam	0009_alter_vlan_name	2025-05-26 04:12:03.78606+00
130	ipam	0010_alter_ipam_role_add_new_role	2025-05-26 04:12:04.467184+00
131	ipam	0011_migrate_ipam_role_data	2025-05-26 04:12:04.561144+00
132	ipam	0012_rename_ipam_roles	2025-05-26 04:12:05.415907+00
133	ipam	0013_delete_role	2025-05-26 04:12:05.424188+00
134	ipam	0014_rename_foreign_keys_and_related_names	2025-05-26 04:12:05.68304+00
135	ipam	0015_prefix_add_type	2025-05-26 04:12:05.736088+00
136	dcim	0019_device_redundancy_group_data_migration	2025-05-26 04:12:05.8348+00
137	dcim	0020_increase_device_asset_tag_size_limit	2025-05-26 04:12:06.110885+00
138	dcim	0021_platform_network_driver	2025-05-26 04:12:06.128883+00
139	dcim	0022_interface_redundancy_group	2025-05-26 04:12:06.841077+00
140	dcim	0023_interface_redundancy_group_data_migration	2025-05-26 04:12:06.941148+00
141	dcim	0024_move_site_fields_to_location_model	2025-05-26 04:12:07.686841+00
142	dcim	0025_mptt_to_tree_queries	2025-05-26 04:12:08.750189+00
143	dcim	0026_interface_mac_address_data_migration	2025-05-26 04:12:08.832488+00
144	dcim	0027_alter_interface_mac_address	2025-05-26 04:12:08.937334+00
145	dcim	0028_alter_device_and_rack_role_add_new_role	2025-05-26 04:12:09.556228+00
146	dcim	0029_device_and_rack_roles_data_migrations	2025-05-26 04:12:09.644914+00
147	dcim	0030_rename_device_and_rack_role	2025-05-26 04:12:10.176174+00
148	dcim	0031_remove_device_role_and_rack_role	2025-05-26 04:12:10.188498+00
149	dcim	0032_rename_foreignkey_fields	2025-05-26 04:12:10.871819+00
150	circuits	0003_auto_slug	2025-05-26 04:12:10.927082+00
151	circuits	0004_increase_provider_account_length	2025-05-26 04:12:10.977075+00
152	circuits	0005_providernetwork	2025-05-26 04:12:11.744424+00
153	circuits	0006_cache_circuit_terminations	2025-05-26 04:12:11.830045+00
154	circuits	0007_circuitterminations_primary_model	2025-05-26 04:12:12.269554+00
155	circuits	0008_add_natural_indexing	2025-05-26 04:12:12.322999+00
156	circuits	0009_circuittermination_location	2025-05-26 04:12:12.420346+00
157	dcim	0033_add_tree_managers_and_foreign_keys_pre_data_migration	2025-05-26 04:12:12.914546+00
158	dcim	0034_migrate_region_and_site_data_to_locations	2025-05-26 04:12:13.001021+00
159	virtualization	0016_remove_site_foreign_key_from_cluster_class	2025-05-26 04:12:13.092304+00
160	virtualization	0017_created_datetime	2025-05-26 04:12:13.56415+00
161	extras	0067_migrate_job_result_status	2025-05-26 04:12:13.653937+00
162	extras	0068_jobresult__add_celery_fields	2025-05-26 04:12:15.188343+00
163	extras	0069_created_datetime	2025-05-26 04:12:17.040063+00
164	virtualization	0018_related_name_changes	2025-05-26 04:12:17.713603+00
165	ipam	0016_prefix_type_data_migration	2025-05-26 04:12:17.805903+00
166	ipam	0017_prefix_remove_is_pool	2025-05-26 04:12:17.862175+00
167	tenancy	0002_auto_slug	2025-05-26 04:12:18.027202+00
168	tenancy	0003_mptt_to_tree_queries	2025-05-26 04:12:18.335011+00
169	tenancy	0004_change_tree_manager_on_tree_models	2025-05-26 04:12:18.348564+00
170	tenancy	0005_rename_foreign_keys_and_related_names	2025-05-26 04:12:18.486625+00
171	dcim	0035_rename_path_end_point_related_name	2025-05-26 04:12:19.17847+00
172	dcim	0036_remove_site_foreign_key_from_dcim_models	2025-05-26 04:12:20.701548+00
173	ipam	0018_remove_site_foreign_key_from_ipam_models	2025-05-26 04:12:21.274874+00
174	ipam	0019_created_datetime	2025-05-26 04:12:22.059616+00
175	ipam	0020_related_name_changes	2025-05-26 04:12:22.767668+00
176	ipam	0021_prefix_add_rir_and_date_allocated	2025-05-26 04:12:23.202788+00
177	ipam	0022_aggregate_to_prefix_data_migration	2025-05-26 04:12:23.305804+00
178	ipam	0023_delete_aggregate	2025-05-26 04:12:23.316332+00
179	extras	0070_remove_site_and_region_attributes_from_config_context	2025-05-26 04:12:23.687085+00
180	django_celery_results	0001_initial	2025-05-26 04:12:23.703795+00
181	django_celery_results	0002_add_task_name_args_kwargs	2025-05-26 04:12:23.717394+00
182	django_celery_results	0003_auto_20181106_1101	2025-05-26 04:12:23.722596+00
183	django_celery_results	0004_auto_20190516_0412	2025-05-26 04:12:23.777087+00
184	django_celery_results	0005_taskresult_worker	2025-05-26 04:12:23.791197+00
185	django_celery_results	0006_taskresult_date_created	2025-05-26 04:12:23.88055+00
186	tenancy	0006_created_datetime	2025-05-26 04:12:24.064271+00
187	dcim	0037_created_datetime	2025-05-26 04:12:26.902453+00
188	dcim	0038_fixup_fks_and_related_names	2025-05-26 04:12:32.106584+00
189	dcim	0039_related_name_changes	2025-05-26 04:12:33.496369+00
190	circuits	0010_rename_foreign_keys_and_related_names	2025-05-26 04:12:34.013367+00
191	circuits	0011_remove_site_foreign_key_from_circuit_termination_class	2025-05-26 04:12:34.103944+00
192	dcim	0040_remove_region_and_site	2025-05-26 04:12:34.642146+00
193	ipam	0024_interface_to_ipaddress_m2m	2025-05-26 04:12:34.738739+00
194	virtualization	0019_vminterface_ip_addresses_m2m	2025-05-26 04:12:34.821754+00
195	virtualization	0020_remove_clustergroup_clustertype_slug	2025-05-26 04:12:34.840045+00
196	tenancy	0007_remove_tenant_tenantgroup_slug	2025-05-26 04:12:34.89934+00
197	ipam	0025_interface_ipaddress_m2m_data_migration	2025-05-26 04:12:34.981389+00
198	ipam	0026_ipaddress_remove_assigned_object	2025-05-26 04:12:35.323932+00
199	ipam	0027_remove_rir_slug	2025-05-26 04:12:35.333225+00
200	extras	0071_replace_related_names	2025-05-26 04:12:37.488321+00
201	extras	0072_rename_model_fields	2025-05-26 04:12:37.96368+00
202	extras	0073_job__unique_name_data_migration	2025-05-26 04:12:38.20485+00
203	extras	0074_job__unique_name	2025-05-26 04:12:38.717139+00
204	extras	0075_remove_gitrepository_fields	2025-05-26 04:12:38.809545+00
205	extras	0076_rename_slug_to_key_for_custom_field	2025-05-26 04:12:38.936624+00
206	extras	0077_migrate_custom_field_data	2025-05-26 04:12:39.032227+00
207	extras	0078_remove_name_field_and_make_label_field_non_nullable	2025-05-26 04:12:39.344253+00
208	dcim	0041_interface_ip_addresses_m2m	2025-05-26 04:12:39.430813+00
209	dcim	0042_alter_location_managers	2025-05-26 04:12:39.480879+00
210	dcim	0043_remove_slug	2025-05-26 04:12:39.553722+00
211	circuits	0012_created_datetime	2025-05-26 04:12:39.825794+00
212	circuits	0013_alter_circuittermination__path	2025-05-26 04:12:40.126716+00
213	circuits	0014_related_name_changes	2025-05-26 04:12:40.209895+00
214	circuits	0015_remove_circuittype_provider_slug	2025-05-26 04:12:40.261506+00
215	extras	0079_remove_slug	2025-05-26 04:12:40.46249+00
216	extras	0080_tagsfield	2025-05-26 04:12:40.951351+00
217	extras	0081_rename_relationship_slug_to_key	2025-05-26 04:12:40.993692+00
218	extras	0082_rename_relationship_name_to_label	2025-05-26 04:12:41.113983+00
219	extras	0083_ensure_relationship_keys_are_unique	2025-05-26 04:12:41.192507+00
220	extras	0084_rename_computed_field_slug_to_key	2025-05-26 04:12:41.27453+00
221	circuits	0016_tagsfield	2025-05-26 04:12:41.786923+00
222	circuits	0017_fixup_null_statuses	2025-05-26 04:12:41.868351+00
223	circuits	0018_status_nonnullable	2025-05-26 04:12:42.143505+00
224	circuits	0019_remove_providernetwork_slug	2025-05-26 04:12:42.191116+00
225	circuits	0020_update_all_charfields_max_length_to_255	2025-05-26 04:12:42.858233+00
226	database	0001_initial	2025-05-26 04:12:42.870968+00
227	database	0002_auto_20190129_2304	2025-05-26 04:12:42.878114+00
228	tenancy	0008_tagsfield	2025-05-26 04:12:42.957575+00
229	tenancy	0009_update_all_charfields_max_length_to_255	2025-05-26 04:12:43.491407+00
230	extras	0085_taggeditem_cleanup	2025-05-26 04:12:43.572441+00
231	extras	0086_taggeditem_uniqueness	2025-05-26 04:12:43.714212+00
232	extras	0087_job__celery_task_fields__dryrun_support	2025-05-26 04:12:44.406694+00
233	extras	0088_job__commit_default_data_migration	2025-05-26 04:12:44.486392+00
234	extras	0089_joblogentry__log_level_default	2025-05-26 04:12:44.497752+00
235	extras	0090_joblogentry__log_level_data_migration	2025-05-26 04:12:44.577944+00
236	extras	0091_scheduledjob__data_migration	2025-05-26 04:12:44.853146+00
237	extras	0092_uniqueness_data_migration	2025-05-26 04:12:45.012779+00
238	extras	0093_uniqueness_fixup	2025-05-26 04:12:45.584407+00
239	extras	0094_alter_objectchange_unique_together	2025-05-26 04:12:45.637347+00
240	extras	0095_ensure_note_timestamps_are_unique	2025-05-26 04:12:45.721927+00
241	extras	0096_remove_slugs	2025-05-26 04:12:45.873388+00
242	extras	0097_alter_job_result_remove_result	2025-05-26 04:12:45.910352+00
243	extras	0098_rename_data_jobresult_result	2025-05-26 04:12:45.92976+00
244	extras	0099_remove_dangling_note_objects	2025-05-26 04:12:46.008808+00
245	extras	0100_fileproxy_job_result	2025-05-26 04:12:46.323346+00
246	extras	0101_externalintegration	2025-05-26 04:12:46.413696+00
247	extras	0102_set_null_objectchange_contenttype	2025-05-26 04:12:46.579484+00
248	extras	0103_add_db_indexes_to_object_change	2025-05-26 04:12:46.807479+00
249	extras	0104_contact_contactassociation_team	2025-05-26 04:12:47.39616+00
250	extras	0105_update_all_charfields_max_length_to_255	2025-05-26 04:12:50.953593+00
251	extras	0106_populate_default_statuses_and_roles_for_contact_associations	2025-05-26 04:12:51.254208+00
252	dcim	0044_tagsfield	2025-05-26 04:12:53.384555+00
253	dcim	0045_ipam__namespaces	2025-05-26 04:12:53.474621+00
254	dcim	0046_fixup_null_statuses	2025-05-26 04:12:53.833367+00
255	dcim	0047_status_nonnullable	2025-05-26 04:12:54.750009+00
256	dcim	0048_ensure_virtual_chassis_names_are_unique_and_add_uniqueness_constraint	2025-05-26 04:12:55.083828+00
257	dcim	0049_remove_slugs_and_change_device_primary_ip_fields	2025-05-26 04:12:55.542515+00
258	dcim	0050_fix_interface_redundancy_group_association_created	2025-05-26 04:12:55.750731+00
259	dcim	0051_interface_redundancy_group_nullable_status	2025-05-26 04:12:55.917568+00
260	dcim	0052_fix_interface_redundancy_group_created	2025-05-26 04:12:56.366124+00
261	dcim	0053_create_device_family_model	2025-05-26 04:12:56.548559+00
262	dcim	0054_softwareimage_softwareversion	2025-05-26 04:12:57.492158+00
263	dcim	0055_softwareimage_softwareversion_data_migration	2025-05-26 04:12:57.785142+00
264	dcim	0056_update_all_charfields_max_length_to_255	2025-05-26 04:13:05.746191+00
265	dcim	0057_controller_models	2025-05-26 04:13:06.079723+00
266	dcim	0058_controller_data_migration	2025-05-26 04:13:06.188386+00
267	django_celery_beat	0001_initial	2025-05-26 04:13:06.227774+00
268	django_celery_beat	0002_auto_20161118_0346	2025-05-26 04:13:06.244148+00
269	django_celery_beat	0003_auto_20161209_0049	2025-05-26 04:13:06.256146+00
270	django_celery_beat	0004_auto_20170221_0000	2025-05-26 04:13:06.263224+00
271	django_celery_beat	0005_add_solarschedule_events_choices	2025-05-26 04:13:06.269528+00
272	django_celery_beat	0006_auto_20180322_0932	2025-05-26 04:13:06.304384+00
273	django_celery_beat	0007_auto_20180521_0826	2025-05-26 04:13:06.318565+00
274	django_celery_beat	0008_auto_20180914_1922	2025-05-26 04:13:06.347792+00
275	django_celery_beat	0006_auto_20180210_1226	2025-05-26 04:13:06.366409+00
276	django_celery_beat	0006_periodictask_priority	2025-05-26 04:13:06.374927+00
277	django_celery_beat	0009_periodictask_headers	2025-05-26 04:13:06.38353+00
278	django_celery_beat	0010_auto_20190429_0326	2025-05-26 04:13:06.556591+00
279	django_celery_beat	0011_auto_20190508_0153	2025-05-26 04:13:06.5744+00
280	django_celery_beat	0012_periodictask_expire_seconds	2025-05-26 04:13:06.582824+00
281	django_celery_beat	0013_auto_20200609_0727	2025-05-26 04:13:06.590416+00
282	django_celery_beat	0014_remove_clockedschedule_enabled	2025-05-26 04:13:06.596982+00
283	django_celery_beat	0015_edit_solarschedule_events_choices	2025-05-26 04:13:06.603544+00
284	django_celery_beat	0016_alter_crontabschedule_timezone	2025-05-26 04:13:06.610721+00
285	django_celery_beat	0017_alter_crontabschedule_month_of_year	2025-05-26 04:13:06.626367+00
286	django_celery_beat	0018_improve_crontab_helptext	2025-05-26 04:13:06.6351+00
287	django_celery_results	0007_remove_taskresult_hidden	2025-05-26 04:13:06.641455+00
288	django_celery_results	0008_chordcounter	2025-05-26 04:13:06.653662+00
289	django_celery_results	0009_groupresult	2025-05-26 04:13:06.765627+00
290	django_celery_results	0010_remove_duplicate_indices	2025-05-26 04:13:06.779085+00
291	django_celery_results	0011_taskresult_periodic_task_name	2025-05-26 04:13:06.785057+00
292	virtualization	0021_tagsfield_and_vminterface_to_primarymodel	2025-05-26 04:13:07.434992+00
293	virtualization	0022_vminterface_timestamps_data_migration	2025-05-26 04:13:07.709573+00
294	ipam	0028_tagsfield	2025-05-26 04:13:08.418764+00
295	ipam	0029_ip_address_to_interface_uniqueness_constraints	2025-05-26 04:13:08.447612+00
296	ipam	0030_ipam__namespaces	2025-05-26 04:13:10.456915+00
297	virtualization	0023_ipam__namespaces	2025-05-26 04:13:10.55348+00
298	virtualization	0024_fixup_null_statuses	2025-05-26 04:13:10.64946+00
299	virtualization	0025_status_nonnullable	2025-05-26 04:13:11.05966+00
300	ipam	0031_ipam___data_migrations	2025-05-26 04:13:11.276074+00
301	ipam	0032_ipam__namespaces_finish	2025-05-26 04:13:12.442464+00
302	ipam	0033_fixup_null_statuses	2025-05-26 04:13:12.540184+00
303	ipam	0034_status_nonnullable	2025-05-26 04:13:13.024751+00
304	ipam	0035_ensure_all_services_fit_uniqueness_constraint	2025-05-26 04:13:13.119653+00
305	ipam	0036_add_uniqueness_constraints_to_service	2025-05-26 04:13:13.236744+00
306	ipam	0037_data_migration_vlan_group_name_uniqueness	2025-05-26 04:13:13.329038+00
307	ipam	0038_vlan_group_name_unique_remove_slug	2025-05-26 04:13:13.418354+00
308	ipam	0039_alter_ipaddresstointerface_ip_address	2025-05-26 04:13:13.698194+00
309	ipam	0040_vlan_prefix_locations	2025-05-26 04:13:14.26488+00
310	ipam	0041_vlan_prefix_locations_data_migration	2025-05-26 04:13:14.362661+00
311	ipam	0042_remove_location_from_vlan_and_prefix	2025-05-26 04:13:14.614936+00
312	ipam	0043_fixup_null_ip_version	2025-05-26 04:13:14.909144+00
313	ipam	0044_ip_version_nonnullable	2025-05-26 04:13:15.09566+00
314	ipam	0045_alter_vlangroup_options	2025-05-26 04:13:15.12378+00
315	ipam	0046_update_all_charfields_max_length_to_255	2025-05-26 04:13:16.364711+00
316	sessions	0001_initial	2025-05-26 04:13:16.378631+00
317	silk	0001_initial	2025-05-26 04:13:16.463277+00
318	silk	0002_auto_update_uuid4_id_field	2025-05-26 04:13:16.479047+00
319	silk	0003_request_prof_file	2025-05-26 04:13:16.486931+00
320	silk	0004_request_prof_file_storage	2025-05-26 04:13:16.495015+00
321	silk	0005_increase_request_prof_file_length	2025-05-26 04:13:16.504328+00
322	silk	0006_fix_request_prof_file_blank	2025-05-26 04:13:16.513707+00
323	silk	0007_sqlquery_identifier	2025-05-26 04:13:16.522425+00
324	silk	0008_sqlquery_analysis	2025-05-26 04:13:16.530465+00
325	default	0001_initial	2025-05-26 04:13:16.67727+00
326	social_auth	0001_initial	2025-05-26 04:13:16.678903+00
327	default	0002_add_related_name	2025-05-26 04:13:16.771019+00
328	social_auth	0002_add_related_name	2025-05-26 04:13:16.772675+00
329	default	0003_alter_email_max_length	2025-05-26 04:13:16.782962+00
330	social_auth	0003_alter_email_max_length	2025-05-26 04:13:16.784314+00
331	default	0004_auto_20160423_0400	2025-05-26 04:13:16.800456+00
332	social_auth	0004_auto_20160423_0400	2025-05-26 04:13:16.801791+00
333	social_auth	0005_auto_20160727_2333	2025-05-26 04:13:16.810417+00
334	social_django	0006_partial	2025-05-26 04:13:16.823666+00
335	social_django	0007_code_timestamp	2025-05-26 04:13:16.833112+00
336	social_django	0008_partial_timestamp	2025-05-26 04:13:16.842515+00
337	social_django	0009_auto_20191118_0520	2025-05-26 04:13:16.873688+00
338	social_django	0010_uid_db_index	2025-05-26 04:13:16.893388+00
339	social_django	0011_alter_id_fields	2025-05-26 04:13:16.994552+00
340	taggit	0001_initial	2025-05-26 04:13:17.30069+00
341	taggit	0002_auto_20150616_2121	2025-05-26 04:13:17.345813+00
342	taggit	0003_taggeditem_add_unique_index	2025-05-26 04:13:17.390599+00
343	taggit	0004_alter_taggeditem_content_type_alter_taggeditem_tag	2025-05-26 04:13:17.569152+00
344	taggit	0005_auto_20220424_2025	2025-05-26 04:13:17.577214+00
345	users	0002_token_ordering_by_created	2025-05-26 04:13:17.593306+00
346	users	0003_alter_user_options	2025-05-26 04:13:17.608211+00
347	users	0004_alter_user_managers	2025-05-26 04:13:17.624784+00
348	users	0005_ensure_object_permission_names_are_unique	2025-05-26 04:13:17.911648+00
349	users	0006_make_object_permission_name_globally_unique	2025-05-26 04:13:17.966338+00
350	users	0007_alter_objectpermission_object_types	2025-05-26 04:13:18.058517+00
351	users	0008_make_object_permission_a_changelogged_model	2025-05-26 04:13:18.154343+00
352	users	0009_update_all_charfields_max_length_to_255	2025-05-26 04:13:18.268112+00
353	virtualization	0026_change_virtualmachine_primary_ip_fields	2025-05-26 04:13:18.705734+00
354	virtualization	0027_virtualmachine_software_image	2025-05-26 04:13:18.91828+00
355	virtualization	0028_update_all_charfields_max_length_to_255	2025-05-26 04:13:19.67265+00
356	social_django	0003_alter_email_max_length	2025-05-26 04:13:19.678658+00
357	social_django	0002_add_related_name	2025-05-26 04:13:19.680117+00
358	social_django	0005_auto_20160727_2333	2025-05-26 04:13:19.681486+00
359	social_django	0004_auto_20160423_0400	2025-05-26 04:13:19.682899+00
360	social_django	0001_initial	2025-05-26 04:13:19.684421+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: extras_computedfield; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_computedfield (id, created, last_updated, key, label, description, template, fallback_value, weight, content_type_id, advanced_ui) FROM stdin;
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext (id, created, last_updated, name, owner_object_id, weight, description, is_active, data, owner_content_type_id, config_context_schema_id) FROM stdin;
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
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_configcontext_roles (id, configcontext_id, role_id) FROM stdin;
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

COPY public.extras_configcontextschema (id, created, last_updated, _custom_field_data, name, description, data_schema, owner_object_id, owner_content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_contact; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_contact (id, created, last_updated, _custom_field_data, name, phone, email, address, comments) FROM stdin;
\.


--
-- Data for Name: extras_contactassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_contactassociation (id, created, last_updated, _custom_field_data, associated_object_id, associated_object_type_id, contact_id, role_id, status_id, team_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfield (id, type, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, created, last_updated, advanced_ui, key, "grouping") FROM stdin;
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: extras_customfieldchoice; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customfieldchoice (id, value, weight, custom_field_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_customlink (id, created, last_updated, name, text, target_url, weight, group_name, button_class, new_window, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_dynamicgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_dynamicgroup (_custom_field_data, id, created, last_updated, name, description, filter, content_type_id) FROM stdin;
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
-- Data for Name: extras_externalintegration; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_externalintegration (id, created, last_updated, _custom_field_data, name, remote_url, verify_ssl, timeout, extra_config, secrets_group_id, ca_file_path, headers, http_method) FROM stdin;
\.


--
-- Data for Name: extras_fileattachment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_fileattachment (id, bytes, filename, mimetype) FROM stdin;
\.


--
-- Data for Name: extras_fileproxy; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_fileproxy (id, name, file, uploaded_at, job_result_id) FROM stdin;
\.


--
-- Data for Name: extras_gitrepository; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_gitrepository (id, created, last_updated, _custom_field_data, name, slug, remote_url, branch, current_head, provided_contents, secrets_group_id) FROM stdin;
\.


--
-- Data for Name: extras_graphqlquery; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_graphqlquery (id, created, last_updated, name, query, variables) FROM stdin;
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

COPY public.extras_job (id, created, last_updated, _custom_field_data, module_name, job_class_name, "grouping", name, description, installed, enabled, dryrun_default, hidden, read_only, approval_required, soft_time_limit, time_limit, grouping_override, name_override, description_override, dryrun_default_override, hidden_override, approval_required_override, soft_time_limit_override, time_limit_override, has_sensitive_variables, has_sensitive_variables_override, is_job_hook_receiver, task_queues, task_queues_override, is_job_button_receiver, supports_dryrun) FROM stdin;
493e0e5d-024d-4a4d-b1f1-b86ff1ffbe67	2025-05-26 04:13:20.034416+00	2025-05-26 04:13:20.035623+00	{}	nautobot.core.jobs	ExportObjectList	System Jobs	Export Object List		t	t	f	f	f	f	1800	2000	f	f	f	f	f	f	f	f	f	f	f	[]	f	f	f
29d2df14-b460-4bd8-9f24-1fd5feebc1ae	2025-05-26 04:13:20.039116+00	2025-05-26 04:13:20.039817+00	{}	nautobot.core.jobs	GitRepositorySync	System Jobs	Git Repository: Sync		t	t	f	f	f	f	0	0	f	f	f	f	f	f	f	f	f	f	f	[]	f	f	f
7161f9de-a139-4646-9604-151ddefbcb11	2025-05-26 04:13:20.043171+00	2025-05-26 04:13:20.043871+00	{}	nautobot.core.jobs	GitRepositoryDryRun	System Jobs	Git Repository: Dry-Run		t	t	f	f	f	f	0	0	f	f	f	f	f	f	f	f	f	f	f	[]	f	f	f
2f6963a3-2e80-4447-bc9c-5691b7ea7785	2025-05-26 04:13:20.047638+00	2025-05-26 04:13:20.048357+00	{}	nautobot.core.jobs	ImportObjects	System Jobs	Import Objects		t	t	f	f	f	f	1800	2000	f	f	f	f	f	f	f	f	f	f	f	[]	f	f	f
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

COPY public.extras_jobhook (id, created, last_updated, _custom_field_data, enabled, name, type_create, type_delete, type_update, job_id) FROM stdin;
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

COPY public.extras_jobresult (id, name, date_created, date_done, status, result, user_id, _custom_field_data, scheduled_job_id, job_model_id, task_args, meta, task_kwargs, task_name, traceback, worker, celery_kwargs) FROM stdin;
\.


--
-- Data for Name: extras_note; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_note (id, created, last_updated, assigned_object_id, user_name, note, assigned_object_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, object_data, changed_object_type_id, related_object_type_id, user_id, object_data_v2, change_context, change_context_detail) FROM stdin;
\.


--
-- Data for Name: extras_relationship; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_relationship (id, created, last_updated, label, key, description, type, source_label, source_hidden, source_filter, destination_label, destination_hidden, destination_filter, destination_type_id, source_type_id, advanced_ui, required_on) FROM stdin;
\.


--
-- Data for Name: extras_relationshipassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_relationshipassociation (id, source_id, destination_id, destination_type_id, relationship_id, source_type_id) FROM stdin;
\.


--
-- Data for Name: extras_role; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_role (id, created, last_updated, _custom_field_data, name, color, description, weight) FROM stdin;
f3ea1039-6843-40c6-88b6-bc805289cf9d	2025-05-26 00:00:00+00	2025-05-26 04:11:59.752318+00	{}	Loopback	9e9e9e		\N
7c0028d8-4d87-403d-bd2e-eeaaf0b4a769	2025-05-26 00:00:00+00	2025-05-26 04:11:59.753873+00	{}	Secondary	2196f3		\N
88e56e23-e647-43f0-b9d0-8d43e80d3059	2025-05-26 00:00:00+00	2025-05-26 04:11:59.755276+00	{}	Anycast	ffc107		\N
11dd2c6f-2fed-42ff-990c-39855ee2d8c8	2025-05-26 00:00:00+00	2025-05-26 04:11:59.756621+00	{}	VIP	4caf50		\N
7170cba8-d17a-4744-8d11-62bc1fbda1d4	2025-05-26 00:00:00+00	2025-05-26 04:11:59.757988+00	{}	VRRP	4caf50		\N
a2c538f5-79ca-4806-abc1-70b28dadb059	2025-05-26 00:00:00+00	2025-05-26 04:11:59.759356+00	{}	HSRP	4caf50		\N
d25ebdb6-720a-4ce9-82bb-08d465aee00e	2025-05-26 00:00:00+00	2025-05-26 04:11:59.760685+00	{}	GLBP	4caf50		\N
cf64959e-4b92-4697-99b2-447acd8de08f	2025-05-26 00:00:00+00	2025-05-26 04:11:59.762059+00	{}	CARP	4caf50		\N
47d78b60-8650-4f80-b28f-2e83baddf3d6	2025-05-26 04:12:51.239486+00	2025-05-26 04:12:51.239497+00	{}	Administrative	2196f3	Unit plays an administrative role	\N
86ef500d-adb9-42d4-96cc-531a372b2d9d	2025-05-26 04:12:51.243758+00	2025-05-26 04:12:51.243769+00	{}	Billing	4caf50	Unit plays a billing role	\N
129781d8-8378-4db3-9713-04183385d019	2025-05-26 04:12:51.247239+00	2025-05-26 04:12:51.24725+00	{}	Support	ffeb3b	Unit plays a support role	\N
2ae77bd8-0486-493a-b73b-78944cc5f22f	2025-05-26 04:12:51.250543+00	2025-05-26 04:12:51.250554+00	{}	On Site	111111	Unit plays an on site role	\N
\.


--
-- Data for Name: extras_role_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_role_content_types (id, role_id, contenttype_id) FROM stdin;
1	88e56e23-e647-43f0-b9d0-8d43e80d3059	6
2	cf64959e-4b92-4697-99b2-447acd8de08f	6
3	d25ebdb6-720a-4ce9-82bb-08d465aee00e	6
4	a2c538f5-79ca-4806-abc1-70b28dadb059	6
5	f3ea1039-6843-40c6-88b6-bc805289cf9d	6
6	7c0028d8-4d87-403d-bd2e-eeaaf0b4a769	6
7	11dd2c6f-2fed-42ff-990c-39855ee2d8c8	6
8	7170cba8-d17a-4744-8d11-62bc1fbda1d4	6
9	47d78b60-8650-4f80-b28f-2e83baddf3d6	23
10	86ef500d-adb9-42d4-96cc-531a372b2d9d	23
11	129781d8-8378-4db3-9713-04183385d019	23
12	2ae77bd8-0486-493a-b73b-78944cc5f22f	23
\.


--
-- Data for Name: extras_scheduledjob; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_scheduledjob (id, name, task, "interval", args, kwargs, queue, one_off, start_time, enabled, last_run_at, total_run_count, date_changed, description, approval_required, approved_at, approved_by_user_id, user_id, job_model_id, crontab, celery_kwargs) FROM stdin;
\.


--
-- Data for Name: extras_scheduledjobs; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_scheduledjobs (ident, last_update) FROM stdin;
\.


--
-- Data for Name: extras_secret; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secret (id, created, last_updated, _custom_field_data, name, description, provider, parameters) FROM stdin;
\.


--
-- Data for Name: extras_secretsgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secretsgroup (id, created, last_updated, _custom_field_data, name, description) FROM stdin;
\.


--
-- Data for Name: extras_secretsgroupassociation; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_secretsgroupassociation (id, access_type, secret_type, secrets_group_id, secret_id) FROM stdin;
\.


--
-- Data for Name: extras_status; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_status (id, created, last_updated, _custom_field_data, name, color, description) FROM stdin;
ef4646d4-9ae1-4aff-a9d2-c95738fceb25	2025-05-26 00:00:00+00	2025-05-26 04:11:43.175737+00	{}	Planned	00bcd4	Unit has been planned
b89097ea-7f50-41b1-a770-9dcac5ec212a	2025-05-26 00:00:00+00	2025-05-26 04:11:43.181899+00	{}	Provisioning	2196f3	Circuit is being provisioned
78a7f9b3-f694-4fbc-b22e-51db020c4d58	2025-05-26 00:00:00+00	2025-05-26 04:11:43.185141+00	{}	Active	4caf50	Unit is active
7a51b4fa-c79e-41f0-ba21-48f76465e519	2025-05-26 00:00:00+00	2025-05-26 04:11:43.18839+00	{}	Offline	ffc107	Unit is offline
c8257954-8209-4b21-9ef1-928901f26cff	2025-05-26 00:00:00+00	2025-05-26 04:11:43.191644+00	{}	Deprovisioning	ffc107	Circuit is being deprovisioned
1967025a-f711-4cf9-9bd9-dc0846bd0efe	2025-05-26 00:00:00+00	2025-05-26 04:11:43.194851+00	{}	Decommissioned	9e9e9e	Circuit has been decommissioned
930b6676-5e2e-4ed6-a177-32478d7cac5f	2025-05-26 00:00:00+00	2025-05-26 04:11:43.199968+00	{}	Connected	4caf50	Cable is connected
391dcde6-5632-48f0-9e30-bc3e7eab101b	2025-05-26 00:00:00+00	2025-05-26 04:11:43.20589+00	{}	Decommissioning	ffc107	Unit is being decommissioned
bba39184-28a3-4803-a689-520ea55d0815	2025-05-26 00:00:00+00	2025-05-26 04:11:43.219016+00	{}	Staged	2196f3	Unit has been staged
c82267e7-b538-445d-bc21-e0f70414faa8	2025-05-26 00:00:00+00	2025-05-26 04:11:43.222236+00	{}	Failed	f44336	Unit has failed
8b49123e-34d9-4efb-82fd-63471a01daed	2025-05-26 00:00:00+00	2025-05-26 04:11:43.225414+00	{}	Inventory	9e9e9e	Device is in inventory
d4cbae12-fba8-430d-91a5-64843b15d310	2025-05-26 00:00:00+00	2025-05-26 04:11:43.245523+00	{}	Reserved	00bcd4	Unit is reserved
cbb35a3b-f2bc-4df1-9069-09aad57119e9	2025-05-26 00:00:00+00	2025-05-26 04:11:43.248668+00	{}	Available	4caf50	Unit is available
42cb9f46-6a55-40c9-a7db-6fb628bd2112	2025-05-26 00:00:00+00	2025-05-26 04:11:43.25704+00	{}	Deprecated	f44336	Unit has been deprecated
e1bad3be-2881-47c4-9a73-d6ba82d0ec2f	2025-05-26 00:00:00+00	2025-05-26 04:11:48.551426+00	{}	Maintenance	9e9e9e	Unit is under maintenance
f0ab6750-82df-4243-a513-0cc73892ad62	2025-05-26 00:00:00+00	2025-05-26 04:11:55.454077+00	{}	Staging	2196f3	Location is in the process of being staged
0e7d61be-9f6c-41b9-be9c-3063d5cbfa60	2025-05-26 00:00:00+00	2025-05-26 04:11:55.464989+00	{}	Retired	f44336	Location has been retired
41f9c5f5-ee3c-401a-8cfd-45cb637b0750	2025-05-26 04:12:51.227517+00	2025-05-26 04:12:51.227535+00	{}	Primary	2196f3	Unit is primary
f9239948-4a88-4095-8437-a88e2f7429d1	2025-05-26 04:12:51.231982+00	2025-05-26 04:12:51.231994+00	{}	Secondary	ffeb3b	Unit is secondary
9bd5ada2-9904-4f25-8f26-a524b14e7ab0	2025-05-26 04:12:57.768641+00	2025-05-26 04:12:57.768658+00	{}	Extended Support	00bcd4	Software is in extended support
8b581b33-f1d1-4a82-8209-badf7a7472ca	2025-05-26 04:12:57.771916+00	2025-05-26 04:12:57.771927+00	{}	End-of-Life	f44336	Unit has reached end-of-life
\.


--
-- Data for Name: extras_status_content_types; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_status_content_types (id, status_id, contenttype_id) FROM stdin;
1	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	1
2	b89097ea-7f50-41b1-a770-9dcac5ec212a	1
3	78a7f9b3-f694-4fbc-b22e-51db020c4d58	1
4	7a51b4fa-c79e-41f0-ba21-48f76465e519	1
5	c8257954-8209-4b21-9ef1-928901f26cff	1
6	1967025a-f711-4cf9-9bd9-dc0846bd0efe	1
7	930b6676-5e2e-4ed6-a177-32478d7cac5f	2
8	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	2
9	391dcde6-5632-48f0-9e30-bc3e7eab101b	2
10	7a51b4fa-c79e-41f0-ba21-48f76465e519	3
11	78a7f9b3-f694-4fbc-b22e-51db020c4d58	3
12	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	3
13	bba39184-28a3-4803-a689-520ea55d0815	3
14	c82267e7-b538-445d-bc21-e0f70414faa8	3
15	8b49123e-34d9-4efb-82fd-63471a01daed	3
16	391dcde6-5632-48f0-9e30-bc3e7eab101b	3
17	7a51b4fa-c79e-41f0-ba21-48f76465e519	4
18	78a7f9b3-f694-4fbc-b22e-51db020c4d58	4
19	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	4
20	c82267e7-b538-445d-bc21-e0f70414faa8	4
21	d4cbae12-fba8-430d-91a5-64843b15d310	5
22	cbb35a3b-f2bc-4df1-9069-09aad57119e9	5
23	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	5
24	78a7f9b3-f694-4fbc-b22e-51db020c4d58	5
25	42cb9f46-6a55-40c9-a7db-6fb628bd2112	5
26	78a7f9b3-f694-4fbc-b22e-51db020c4d58	6
27	d4cbae12-fba8-430d-91a5-64843b15d310	6
28	42cb9f46-6a55-40c9-a7db-6fb628bd2112	6
29	78a7f9b3-f694-4fbc-b22e-51db020c4d58	7
30	d4cbae12-fba8-430d-91a5-64843b15d310	7
31	42cb9f46-6a55-40c9-a7db-6fb628bd2112	7
32	78a7f9b3-f694-4fbc-b22e-51db020c4d58	8
33	d4cbae12-fba8-430d-91a5-64843b15d310	8
34	42cb9f46-6a55-40c9-a7db-6fb628bd2112	8
35	7a51b4fa-c79e-41f0-ba21-48f76465e519	9
36	78a7f9b3-f694-4fbc-b22e-51db020c4d58	9
37	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	9
38	bba39184-28a3-4803-a689-520ea55d0815	9
39	c82267e7-b538-445d-bc21-e0f70414faa8	9
40	391dcde6-5632-48f0-9e30-bc3e7eab101b	9
41	c82267e7-b538-445d-bc21-e0f70414faa8	12
42	78a7f9b3-f694-4fbc-b22e-51db020c4d58	12
43	391dcde6-5632-48f0-9e30-bc3e7eab101b	12
44	e1bad3be-2881-47c4-9a73-d6ba82d0ec2f	12
45	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	12
46	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	13
47	c82267e7-b538-445d-bc21-e0f70414faa8	13
48	78a7f9b3-f694-4fbc-b22e-51db020c4d58	13
49	391dcde6-5632-48f0-9e30-bc3e7eab101b	13
50	e1bad3be-2881-47c4-9a73-d6ba82d0ec2f	13
51	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	14
52	f0ab6750-82df-4243-a513-0cc73892ad62	14
53	78a7f9b3-f694-4fbc-b22e-51db020c4d58	14
54	391dcde6-5632-48f0-9e30-bc3e7eab101b	14
55	0e7d61be-9f6c-41b9-be9c-3063d5cbfa60	14
56	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	19
57	f0ab6750-82df-4243-a513-0cc73892ad62	19
58	78a7f9b3-f694-4fbc-b22e-51db020c4d58	19
59	391dcde6-5632-48f0-9e30-bc3e7eab101b	19
60	0e7d61be-9f6c-41b9-be9c-3063d5cbfa60	19
61	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	20
62	f0ab6750-82df-4243-a513-0cc73892ad62	20
63	78a7f9b3-f694-4fbc-b22e-51db020c4d58	20
64	391dcde6-5632-48f0-9e30-bc3e7eab101b	20
65	0e7d61be-9f6c-41b9-be9c-3063d5cbfa60	20
66	41f9c5f5-ee3c-401a-8cfd-45cb637b0750	23
67	f9239948-4a88-4095-8437-a88e2f7429d1	23
68	78a7f9b3-f694-4fbc-b22e-51db020c4d58	23
69	78a7f9b3-f694-4fbc-b22e-51db020c4d58	24
70	9bd5ada2-9904-4f25-8f26-a524b14e7ab0	24
71	8b581b33-f1d1-4a82-8209-badf7a7472ca	24
72	78a7f9b3-f694-4fbc-b22e-51db020c4d58	25
73	9bd5ada2-9904-4f25-8f26-a524b14e7ab0	25
74	8b581b33-f1d1-4a82-8209-badf7a7472ca	25
75	7a51b4fa-c79e-41f0-ba21-48f76465e519	26
76	78a7f9b3-f694-4fbc-b22e-51db020c4d58	26
77	ef4646d4-9ae1-4aff-a9d2-c95738fceb25	26
78	bba39184-28a3-4803-a689-520ea55d0815	26
79	c82267e7-b538-445d-bc21-e0f70414faa8	26
80	8b49123e-34d9-4efb-82fd-63471a01daed	26
81	391dcde6-5632-48f0-9e30-bc3e7eab101b	26
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_tag (name, id, created, last_updated, _custom_field_data, color, description) FROM stdin;
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
-- Data for Name: extras_team; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_team (id, created, last_updated, _custom_field_data, name, phone, email, address, comments) FROM stdin;
\.


--
-- Data for Name: extras_team_contacts; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.extras_team_contacts (id, team_id, contact_id) FROM stdin;
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
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_ipaddress (id, created, last_updated, _custom_field_data, host, mask_length, dns_name, description, nat_inside_id, status_id, tenant_id, role_id, ip_version, parent_id, type) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddresstointerface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_ipaddresstointerface (id, is_source, is_destination, is_default, is_preferred, is_primary, is_secondary, is_standby, interface_id, ip_address_id, vm_interface_id) FROM stdin;
\.


--
-- Data for Name: ipam_namespace; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_namespace (id, created, last_updated, _custom_field_data, name, description, location_id) FROM stdin;
fb81b1f2-721b-47c9-a6d4-82f9bc430818	2025-05-26 04:13:09.070141+00	2025-05-26 04:13:09.070166+00	{}	Global	Default Global namespace. Created by Nautobot.	\N
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_prefix (id, created, last_updated, _custom_field_data, network, broadcast, prefix_length, description, status_id, tenant_id, vlan_id, role_id, type, date_allocated, rir_id, ip_version, namespace_id, parent_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefixlocationassignment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_prefixlocationassignment (id, location_id, prefix_id) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_rir (id, created, last_updated, _custom_field_data, name, is_private, description) FROM stdin;
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
-- Data for Name: ipam_service_ip_addresses; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_service_ip_addresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlan (id, created, last_updated, _custom_field_data, vid, name, description, vlan_group_id, status_id, tenant_id, role_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlangroup (id, created, last_updated, _custom_field_data, name, description, location_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlanlocationassignment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vlanlocationassignment (id, location_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrf (id, created, last_updated, _custom_field_data, name, rd, description, tenant_id, namespace_id) FROM stdin;
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
-- Data for Name: ipam_vrfdeviceassignment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrfdeviceassignment (id, rd, name, device_id, virtual_machine_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrfprefixassignment; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.ipam_vrfprefixassignment (id, prefix_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: silk_profile; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.silk_profile (id, name, start_time, end_time, time_taken, file_path, line_num, end_line_num, func_name, exception_raised, dynamic, request_id) FROM stdin;
\.


--
-- Data for Name: silk_profile_queries; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.silk_profile_queries (id, profile_id, sqlquery_id) FROM stdin;
\.


--
-- Data for Name: silk_request; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.silk_request (id, path, query_params, raw_body, body, method, start_time, view_name, end_time, time_taken, encoded_headers, meta_time, meta_num_queries, meta_time_spent_queries, pyprofile, num_sql_queries, prof_file) FROM stdin;
\.


--
-- Data for Name: silk_response; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.silk_response (id, status_code, raw_body, body, encoded_headers, request_id) FROM stdin;
\.


--
-- Data for Name: silk_sqlquery; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.silk_sqlquery (id, query, start_time, end_time, time_taken, traceback, request_id, identifier, analysis) FROM stdin;
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

COPY public.tenancy_tenant (id, created, last_updated, _custom_field_data, name, description, comments, tenant_group_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.tenancy_tenantgroup (id, created, last_updated, _custom_field_data, name, description, parent_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints, created, last_updated) FROM stdin;
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

COPY public.virtualization_cluster (id, created, last_updated, _custom_field_data, name, comments, cluster_group_id, tenant_id, cluster_type_id, location_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_clustergroup (id, created, last_updated, _custom_field_data, name, description) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_clustertype (id, created, last_updated, _custom_field_data, name, description) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_virtualmachine (id, created, last_updated, _custom_field_data, local_config_context_data, local_config_context_data_owner_object_id, name, vcpus, memory, disk, comments, cluster_id, local_config_context_data_owner_content_type_id, platform_id, primary_ip4_id, primary_ip6_id, status_id, tenant_id, local_config_context_schema_id, role_id, software_version_id) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine_software_image_files; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_virtualmachine_software_image_files (id, virtualmachine_id, softwareimagefile_id) FROM stdin;
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: nautobot
--

COPY public.virtualization_vminterface (id, _custom_field_data, enabled, mac_address, mtu, mode, name, _name, description, untagged_vlan_id, virtual_machine_id, status_id, parent_interface_id, bridge_id, created, last_updated, vrf_id) FROM stdin;
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

SELECT pg_catalog.setval('public.auth_permission_id_seq', 538, true);


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
-- Name: dcim_device_software_image_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.dcim_device_software_image_files_id_seq', 1, false);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_inventoryitem_software_image_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.dcim_inventoryitem_software_image_files_id_seq', 1, false);


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
-- Name: django_celery_results_chordcounter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_results_chordcounter_id_seq', 1, false);


--
-- Name: django_celery_results_groupresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_results_groupresult_id_seq', 1, false);


--
-- Name: django_celery_results_taskresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_celery_results_taskresult_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 140, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 360, true);


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
-- Name: extras_configcontext_new_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_new_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


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
-- Name: extras_role_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_role_content_types_id_seq', 12, true);


--
-- Name: extras_status_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_status_content_types_id_seq', 81, true);


--
-- Name: extras_tag_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_tag_content_types_id_seq', 1, false);


--
-- Name: extras_team_contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.extras_team_contacts_id_seq', 1, false);


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
-- Name: silk_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.silk_profile_id_seq', 1, false);


--
-- Name: silk_profile_queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.silk_profile_queries_id_seq', 1, false);


--
-- Name: silk_sqlquery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.silk_sqlquery_id_seq', 1, false);


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
-- Name: virtualization_virtualmachine_software_image_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nautobot
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_software_image_files_id_seq', 1, false);


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
-- Name: dcim_controller dcim_controller_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_name_key UNIQUE (name);


--
-- Name: dcim_controller dcim_controller_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_pkey PRIMARY KEY (id);


--
-- Name: dcim_controllermanageddevicegroup dcim_controllermanageddevicegroup_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controllermanageddevicegroup
    ADD CONSTRAINT dcim_controllermanageddevicegroup_name_key UNIQUE (name);


--
-- Name: dcim_controllermanageddevicegroup dcim_controllermanageddevicegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controllermanageddevicegroup
    ADD CONSTRAINT dcim_controllermanageddevicegroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_location_id_tenant_id_name_2259bd02_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_tenant_id_name_2259bd02_uniq UNIQUE (location_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device_software_image_files dcim_device_software_ima_device_id_softwareimagef_70442b46_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device_software_image_files
    ADD CONSTRAINT dcim_device_software_ima_device_id_softwareimagef_70442b46_uniq UNIQUE (device_id, softwareimagefile_id);


--
-- Name: dcim_device_software_image_files dcim_device_software_image_files_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device_software_image_files
    ADD CONSTRAINT dcim_device_software_image_files_pkey PRIMARY KEY (id);


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
-- Name: dcim_devicefamily dcim_devicefamily_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicefamily
    ADD CONSTRAINT dcim_devicefamily_name_key UNIQUE (name);


--
-- Name: dcim_devicefamily dcim_devicefamily_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicefamily
    ADD CONSTRAINT dcim_devicefamily_pkey PRIMARY KEY (id);


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
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicetypetosoftwareimagefile dcim_devicetypetosoftwar_device_type_id_software__35e2e1a8_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetypetosoftwareimagefile
    ADD CONSTRAINT dcim_devicetypetosoftwar_device_type_id_software__35e2e1a8_uniq UNIQUE (device_type_id, software_image_file_id);


--
-- Name: dcim_devicetypetosoftwareimagefile dcim_devicetypetosoftwareimagefile_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetypetosoftwareimagefile
    ADD CONSTRAINT dcim_devicetypetosoftwareimagefile_pkey PRIMARY KEY (id);


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
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_template_id, rear_port_position);


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
-- Name: dcim_inventoryitem_software_image_files dcim_inventoryitem_softw_inventoryitem_id_softwar_1e7b0b5c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem_software_image_files
    ADD CONSTRAINT dcim_inventoryitem_softw_inventoryitem_id_softwar_1e7b0b5c_uniq UNIQUE (inventoryitem_id, softwareimagefile_id);


--
-- Name: dcim_inventoryitem_software_image_files dcim_inventoryitem_software_image_files_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem_software_image_files
    ADD CONSTRAINT dcim_inventoryitem_software_image_files_pkey PRIMARY KEY (id);


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
-- Name: dcim_powerpanel dcim_powerpanel_location_id_name_682403ca_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_name_682403ca_uniq UNIQUE (location_id, name);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


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
    ADD CONSTRAINT dcim_rack_group_id_facility_id_f16a53ae_uniq UNIQUE (rack_group_id, facility_id);


--
-- Name: dcim_rack dcim_rack_group_id_name_846f3826_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_name_846f3826_uniq UNIQUE (rack_group_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_location_id_name_8555e7b1_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_location_id_name_8555e7b1_uniq UNIQUE (location_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


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
-- Name: dcim_softwareimagefile dcim_softwareimagefile_image_file_name_software_9887bb4c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareimagefile
    ADD CONSTRAINT dcim_softwareimagefile_image_file_name_software_9887bb4c_uniq UNIQUE (image_file_name, software_version_id);


--
-- Name: dcim_softwareimagefile dcim_softwareimagefile_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareimagefile
    ADD CONSTRAINT dcim_softwareimagefile_pkey PRIMARY KEY (id);


--
-- Name: dcim_softwareversion dcim_softwareversion_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareversion
    ADD CONSTRAINT dcim_softwareversion_pkey PRIMARY KEY (id);


--
-- Name: dcim_softwareversion dcim_softwareversion_platform_id_version_34b58c7b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareversion
    ADD CONSTRAINT dcim_softwareversion_platform_id_version_34b58c7b_uniq UNIQUE (platform_id, version);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_name_7dcc237d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_name_7dcc237d_uniq UNIQUE (name);


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
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_group_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_chordcounter django_celery_results_chordcounter_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_chordcounter
    ADD CONSTRAINT django_celery_results_chordcounter_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_group_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_group_id_key UNIQUE (group_id);


--
-- Name: django_celery_results_groupresult django_celery_results_groupresult_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_groupresult
    ADD CONSTRAINT django_celery_results_groupresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_pkey PRIMARY KEY (id);


--
-- Name: django_celery_results_taskresult django_celery_results_taskresult_task_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.django_celery_results_taskresult
    ADD CONSTRAINT django_celery_results_taskresult_task_id_key UNIQUE (task_id);


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
    ADD CONSTRAINT extras_computedfield_slug_key UNIQUE (key);


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
-- Name: extras_configcontext extras_configcontext_name_4bbfe25d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_4bbfe25d_uniq UNIQUE (name);


--
-- Name: extras_configcontext_roles extras_configcontext_new_configcontext_id_role_id_66046ad0_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_new_configcontext_id_role_id_66046ad0_uniq UNIQUE (configcontext_id, role_id);


--
-- Name: extras_configcontext_roles extras_configcontext_new_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_new_roles_pkey PRIMARY KEY (id);


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
-- Name: extras_configcontextschema extras_configcontextschema_name_e2a3ef7b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontextschema_name_e2a3ef7b_uniq UNIQUE (name);


--
-- Name: extras_configcontextschema extras_configcontextschema_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontextschema
    ADD CONSTRAINT extras_configcontextschema_pkey PRIMARY KEY (id);


--
-- Name: extras_contact extras_contact_name_phone_email_aba1cb5c_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contact
    ADD CONSTRAINT extras_contact_name_phone_email_aba1cb5c_uniq UNIQUE (name, phone, email);


--
-- Name: extras_contact extras_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contact
    ADD CONSTRAINT extras_contact_pkey PRIMARY KEY (id);


--
-- Name: extras_contactassociation extras_contactassociatio_contact_id_associated_ob_e743dc3a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassociatio_contact_id_associated_ob_e743dc3a_uniq UNIQUE (contact_id, associated_object_type_id, associated_object_id, role_id);


--
-- Name: extras_contactassociation extras_contactassociatio_team_id_associated_objec_e8ebb4d5_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassociatio_team_id_associated_objec_e8ebb4d5_uniq UNIQUE (team_id, associated_object_type_id, associated_object_id, role_id);


--
-- Name: extras_contactassociation extras_contactassociation_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassociation_pkey PRIMARY KEY (id);


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
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_slug_ed27c4fe_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_slug_ed27c4fe_uniq UNIQUE (key);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_field_id_value_f959a108_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_field_id_value_f959a108_uniq UNIQUE (custom_field_id, value);


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
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_externalintegration extras_externalintegration_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_externalintegration
    ADD CONSTRAINT extras_externalintegration_name_key UNIQUE (name);


--
-- Name: extras_externalintegration extras_externalintegration_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_externalintegration
    ADD CONSTRAINT extras_externalintegration_pkey PRIMARY KEY (id);


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
-- Name: extras_job extras_job_module_name_job_class_name_b531472b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_module_name_job_class_name_b531472b_uniq UNIQUE (module_name, job_class_name);


--
-- Name: extras_job extras_job_name_34d98c40_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_job
    ADD CONSTRAINT extras_job_name_34d98c40_uniq UNIQUE (name);


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
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_note extras_note_assigned_object_type_id__e1504524_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_note
    ADD CONSTRAINT extras_note_assigned_object_type_id__e1504524_uniq UNIQUE (assigned_object_type_id, assigned_object_id, user_name, created);


--
-- Name: extras_note extras_note_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_note
    ADD CONSTRAINT extras_note_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_time_request_id_changed__f5f870cc_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_time_request_id_changed__f5f870cc_uniq UNIQUE ("time", request_id, changed_object_type_id, changed_object_id);


--
-- Name: extras_relationship extras_relationship_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_name_key UNIQUE (label);


--
-- Name: extras_relationship extras_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_pkey PRIMARY KEY (id);


--
-- Name: extras_relationship extras_relationship_slug_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_relationship
    ADD CONSTRAINT extras_relationship_slug_key UNIQUE (key);


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
-- Name: extras_role_content_types extras_role_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role_content_types
    ADD CONSTRAINT extras_role_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_role_content_types extras_role_content_types_role_id_contenttype_id_ff2e3d23_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role_content_types
    ADD CONSTRAINT extras_role_content_types_role_id_contenttype_id_ff2e3d23_uniq UNIQUE (role_id, contenttype_id);


--
-- Name: extras_role extras_role_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role
    ADD CONSTRAINT extras_role_name_key UNIQUE (name);


--
-- Name: extras_role extras_role_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role
    ADD CONSTRAINT extras_role_pkey PRIMARY KEY (id);


--
-- Name: extras_scheduledjob extras_scheduledjob_name_fcea52d7_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_scheduledjob
    ADD CONSTRAINT extras_scheduledjob_name_fcea52d7_uniq UNIQUE (name);


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
-- Name: extras_secretsgroupassociation extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupassoc_group_id_access_type_sec_1b1e944a_uniq UNIQUE (secrets_group_id, access_type, secret_type);


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
-- Name: extras_taggeditem extras_taggeditem_content_type_id_object_i_fb5205e9_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_object_i_fb5205e9_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_team_contacts extras_team_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team_contacts
    ADD CONSTRAINT extras_team_contacts_pkey PRIMARY KEY (id);


--
-- Name: extras_team_contacts extras_team_contacts_team_id_contact_id_6e32675e_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team_contacts
    ADD CONSTRAINT extras_team_contacts_team_id_contact_id_6e32675e_uniq UNIQUE (team_id, contact_id);


--
-- Name: extras_team extras_team_name_phone_email_943ce106_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team
    ADD CONSTRAINT extras_team_name_phone_email_943ce106_uniq UNIQUE (name, phone, email);


--
-- Name: extras_team extras_team_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team
    ADD CONSTRAINT extras_team_pkey PRIMARY KEY (id);


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
-- Name: ipam_ipaddress ipam_ipaddress_parent_id_host_89330d7e_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_parent_id_host_89330d7e_uniq UNIQUE (parent_id, host);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddresstointerface ipam_ipaddresstointerfac_ip_address_id_interface__b15a8b31_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddresstointerface
    ADD CONSTRAINT ipam_ipaddresstointerfac_ip_address_id_interface__b15a8b31_uniq UNIQUE (ip_address_id, interface_id);


--
-- Name: ipam_ipaddresstointerface ipam_ipaddresstointerfac_ip_address_id_vm_interfa_be84a621_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddresstointerface
    ADD CONSTRAINT ipam_ipaddresstointerfac_ip_address_id_vm_interfa_be84a621_uniq UNIQUE (ip_address_id, vm_interface_id);


--
-- Name: ipam_ipaddresstointerface ipam_ipaddresstointerface_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddresstointerface
    ADD CONSTRAINT ipam_ipaddresstointerface_pkey PRIMARY KEY (id);


--
-- Name: ipam_namespace ipam_namespace_name_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_namespace
    ADD CONSTRAINT ipam_namespace_name_key UNIQUE (name);


--
-- Name: ipam_namespace ipam_namespace_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_namespace
    ADD CONSTRAINT ipam_namespace_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_namespace_id_network_prefix_length_b2dd8b57_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_namespace_id_network_prefix_length_b2dd8b57_uniq UNIQUE (namespace_id, network, prefix_length);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefixlocationassignment ipam_prefixlocationassig_prefix_id_location_id_66100e12_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefixlocationassignment
    ADD CONSTRAINT ipam_prefixlocationassig_prefix_id_location_id_66100e12_uniq UNIQUE (prefix_id, location_id);


--
-- Name: ipam_prefixlocationassignment ipam_prefixlocationassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefixlocationassignment
    ADD CONSTRAINT ipam_prefixlocationassignment_pkey PRIMARY KEY (id);


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
-- Name: ipam_service_ip_addresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ip_addresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ip_addresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ip_addresses
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
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (vlan_group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (vlan_group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_name_46bf02a4_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_name_46bf02a4_uniq UNIQUE (name);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlanlocationassignment ipam_vlanlocationassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlanlocationassignment
    ADD CONSTRAINT ipam_vlanlocationassignment_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlanlocationassignment ipam_vlanlocationassignment_vlan_id_location_id_847361ab_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlanlocationassignment
    ADD CONSTRAINT ipam_vlanlocationassignment_vlan_id_location_id_847361ab_uniq UNIQUE (vlan_id, location_id);


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
-- Name: ipam_vrf ipam_vrf_namespace_id_rd_ddfc14fc_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_namespace_id_rd_ddfc14fc_uniq UNIQUE (namespace_id, rd);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrfdeviceassignment ipam_vrfdeviceassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfdeviceassignment
    ADD CONSTRAINT ipam_vrfdeviceassignment_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrfdeviceassignment ipam_vrfdeviceassignment_vrf_id_device_id_6c9f7b7d_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfdeviceassignment
    ADD CONSTRAINT ipam_vrfdeviceassignment_vrf_id_device_id_6c9f7b7d_uniq UNIQUE (vrf_id, device_id);


--
-- Name: ipam_vrfdeviceassignment ipam_vrfdeviceassignment_vrf_id_virtual_machine_i_0799c2cc_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfdeviceassignment
    ADD CONSTRAINT ipam_vrfdeviceassignment_vrf_id_virtual_machine_i_0799c2cc_uniq UNIQUE (vrf_id, virtual_machine_id);


--
-- Name: ipam_vrfprefixassignment ipam_vrfprefixassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfprefixassignment
    ADD CONSTRAINT ipam_vrfprefixassignment_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrfprefixassignment ipam_vrfprefixassignment_vrf_id_prefix_id_8123b1c4_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfprefixassignment
    ADD CONSTRAINT ipam_vrfprefixassignment_vrf_id_prefix_id_8123b1c4_uniq UNIQUE (vrf_id, prefix_id);


--
-- Name: silk_profile silk_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile
    ADD CONSTRAINT silk_profile_pkey PRIMARY KEY (id);


--
-- Name: silk_profile_queries silk_profile_queries_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile_queries
    ADD CONSTRAINT silk_profile_queries_pkey PRIMARY KEY (id);


--
-- Name: silk_profile_queries silk_profile_queries_profile_id_sqlquery_id_b2403d9b_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile_queries
    ADD CONSTRAINT silk_profile_queries_profile_id_sqlquery_id_b2403d9b_uniq UNIQUE (profile_id, sqlquery_id);


--
-- Name: silk_request silk_request_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_request
    ADD CONSTRAINT silk_request_pkey PRIMARY KEY (id);


--
-- Name: silk_response silk_response_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_response
    ADD CONSTRAINT silk_response_pkey PRIMARY KEY (id);


--
-- Name: silk_response silk_response_request_id_key; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_response
    ADD CONSTRAINT silk_response_request_id_key UNIQUE (request_id);


--
-- Name: silk_sqlquery silk_sqlquery_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_sqlquery
    ADD CONSTRAINT silk_sqlquery_pkey PRIMARY KEY (id);


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
-- Name: ipam_service unique_device_service_name; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT unique_device_service_name UNIQUE (name, device_id);


--
-- Name: ipam_service unique_virtual_machine_service_name; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT unique_virtual_machine_service_name UNIQUE (name, virtual_machine_id);


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
-- Name: users_objectpermission users_objectpermission_name_8d7a5900_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_name_8d7a5900_uniq UNIQUE (name);


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
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine_software_image_files virtualization_virtualma_virtualmachine_id_softwa_98924fb6_uniq; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine_software_image_files
    ADD CONSTRAINT virtualization_virtualma_virtualmachine_id_softwa_98924fb6_uniq UNIQUE (virtualmachine_id, softwareimagefile_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine_software_image_files virtualization_virtualmachine_software_image_files_pkey; Type: CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine_software_image_files
    ADD CONSTRAINT virtualization_virtualmachine_software_image_files_pkey PRIMARY KEY (id);


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
-- Name: changed_object_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX changed_object_idx ON public.extras_objectchange USING btree (changed_object_type_id, changed_object_id);


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

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (circuit_termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (circuit_termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (circuit_type_id);


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
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


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
-- Name: dcim_controller_controller_device_id_ac4051d9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_controller_device_id_ac4051d9 ON public.dcim_controller USING btree (controller_device_id);


--
-- Name: dcim_controller_controller_device_redundancy_group_id_1689f27b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_controller_device_redundancy_group_id_1689f27b ON public.dcim_controller USING btree (controller_device_redundancy_group_id);


--
-- Name: dcim_controller_external_integration_id_656fb857; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_external_integration_id_656fb857 ON public.dcim_controller USING btree (external_integration_id);


--
-- Name: dcim_controller_location_id_e3518103; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_location_id_e3518103 ON public.dcim_controller USING btree (location_id);


--
-- Name: dcim_controller_name_5a5a3a60_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_name_5a5a3a60_like ON public.dcim_controller USING btree (name varchar_pattern_ops);


--
-- Name: dcim_controller_platform_id_86f63411; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_platform_id_86f63411 ON public.dcim_controller USING btree (platform_id);


--
-- Name: dcim_controller_role_id_0593bbde; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_role_id_0593bbde ON public.dcim_controller USING btree (role_id);


--
-- Name: dcim_controller_status_id_d9fb93f5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_status_id_d9fb93f5 ON public.dcim_controller USING btree (status_id);


--
-- Name: dcim_controller_tenant_id_5cc9817a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controller_tenant_id_5cc9817a ON public.dcim_controller USING btree (tenant_id);


--
-- Name: dcim_controllermanageddevicegroup_controller_id_ca2df71d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controllermanageddevicegroup_controller_id_ca2df71d ON public.dcim_controllermanageddevicegroup USING btree (controller_id);


--
-- Name: dcim_controllermanageddevicegroup_name_750978a6_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controllermanageddevicegroup_name_750978a6_like ON public.dcim_controllermanageddevicegroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_controllermanageddevicegroup_parent_id_567b18e0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_controllermanageddevicegroup_parent_id_567b18e0 ON public.dcim_controllermanageddevicegroup USING btree (parent_id);


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
-- Name: dcim_device_controller_managed_device_group_id_81d03712; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_controller_managed_device_group_id_81d03712 ON public.dcim_device USING btree (controller_managed_device_group_id);


--
-- Name: dcim_device_device_redundancy_group_id_ca97f1fc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_redundancy_group_id_ca97f1fc ON public.dcim_device USING btree (device_redundancy_group_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_local_context_data_owner_content_type_id_5d06013b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_local_context_data_owner_content_type_id_5d06013b ON public.dcim_device USING btree (local_config_context_data_owner_content_type_id);


--
-- Name: dcim_device_local_context_schema_id_0ff8d657; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_local_context_schema_id_0ff8d657 ON public.dcim_device USING btree (local_config_context_schema_id);


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
-- Name: dcim_device_new_role_id_edcafe36; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_new_role_id_edcafe36 ON public.dcim_device USING btree (role_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_primary_ip4_id_2ccd943a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_primary_ip4_id_2ccd943a ON public.dcim_device USING btree (primary_ip4_id);


--
-- Name: dcim_device_primary_ip6_id_d180fe91; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_primary_ip6_id_d180fe91 ON public.dcim_device USING btree (primary_ip6_id);


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
-- Name: dcim_device_software_image_files_device_id_54aaa8f9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_software_image_files_device_id_54aaa8f9 ON public.dcim_device_software_image_files USING btree (device_id);


--
-- Name: dcim_device_software_image_files_softwareimagefile_id_41a541f0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_software_image_files_softwareimagefile_id_41a541f0 ON public.dcim_device_software_image_files USING btree (softwareimagefile_id);


--
-- Name: dcim_device_software_version_id_5bc284cc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_device_software_version_id_5bc284cc ON public.dcim_device USING btree (software_version_id);


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
-- Name: dcim_devicefamily_name_80adb85c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicefamily_name_80adb85c_like ON public.dcim_devicefamily USING btree (name varchar_pattern_ops);


--
-- Name: dcim_deviceredundancygroup_name_54930246_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_name_54930246_like ON public.dcim_deviceredundancygroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_deviceredundancygroup_secrets_group_id_19061ee9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_secrets_group_id_19061ee9 ON public.dcim_deviceredundancygroup USING btree (secrets_group_id);


--
-- Name: dcim_deviceredundancygroup_status_id_de1ca6f3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_deviceredundancygroup_status_id_de1ca6f3 ON public.dcim_deviceredundancygroup USING btree (status_id);


--
-- Name: dcim_devicetype_device_family_id_e02e7c53; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_device_family_id_e02e7c53 ON public.dcim_devicetype USING btree (device_family_id);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetypetosoftwarei_software_image_file_id_ce1ed3c6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetypetosoftwarei_software_image_file_id_ce1ed3c6 ON public.dcim_devicetypetosoftwareimagefile USING btree (software_image_file_id);


--
-- Name: dcim_devicetypetosoftwareimagefile_device_type_id_74d7511c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_devicetypetosoftwareimagefile_device_type_id_74d7511c ON public.dcim_devicetypetosoftwareimagefile USING btree (device_type_id);


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

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_template_id);


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
-- Name: dcim_interface_vrf_id_a92e59b2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_interface_vrf_id_a92e59b2 ON public.dcim_interface USING btree (vrf_id);


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
-- Name: dcim_inventoryitem_softwar_inventoryitem_id_f580bb3c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_softwar_inventoryitem_id_f580bb3c ON public.dcim_inventoryitem_software_image_files USING btree (inventoryitem_id);


--
-- Name: dcim_inventoryitem_softwar_softwareimagefile_id_6c5e374d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_softwar_softwareimagefile_id_6c5e374d ON public.dcim_inventoryitem_software_image_files USING btree (softwareimagefile_id);


--
-- Name: dcim_inventoryitem_software_version_id_0e33b2f2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_inventoryitem_software_version_id_0e33b2f2 ON public.dcim_inventoryitem USING btree (software_version_id);


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
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


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

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_template_id);


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

CREATE INDEX dcim_rack_group_id_44e90ea9 ON public.dcim_rack USING btree (rack_group_id);


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
-- Name: dcim_rack_new_role_id_dfa62b13; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_new_role_id_dfa62b13 ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_serial_d9cd7ac4; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_serial_d9cd7ac4 ON public.dcim_rack USING btree (serial);


--
-- Name: dcim_rack_serial_d9cd7ac4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_rack_serial_d9cd7ac4_like ON public.dcim_rack USING btree (serial varchar_pattern_ops);


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
-- Name: dcim_softwareimagefile_software_version_id_a143fbd3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_softwareimagefile_software_version_id_a143fbd3 ON public.dcim_softwareimagefile USING btree (software_version_id);


--
-- Name: dcim_softwareimagefile_status_id_5288600b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_softwareimagefile_status_id_5288600b ON public.dcim_softwareimagefile USING btree (status_id);


--
-- Name: dcim_softwareversion_platform_id_dcac6ff8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_softwareversion_platform_id_dcac6ff8 ON public.dcim_softwareversion USING btree (platform_id);


--
-- Name: dcim_softwareversion_status_id_e167dc1f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX dcim_softwareversion_status_id_e167dc1f ON public.dcim_softwareversion USING btree (status_id);


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
-- Name: django_cele_date_cr_bd6c1d_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_date_cr_bd6c1d_idx ON public.django_celery_results_groupresult USING btree (date_created);


--
-- Name: django_cele_date_cr_f04a50_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_date_cr_f04a50_idx ON public.django_celery_results_taskresult USING btree (date_created);


--
-- Name: django_cele_date_do_caae0e_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_date_do_caae0e_idx ON public.django_celery_results_groupresult USING btree (date_done);


--
-- Name: django_cele_date_do_f59aad_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_date_do_f59aad_idx ON public.django_celery_results_taskresult USING btree (date_done);


--
-- Name: django_cele_status_9b6201_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_status_9b6201_idx ON public.django_celery_results_taskresult USING btree (status);


--
-- Name: django_cele_task_na_08aec9_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_task_na_08aec9_idx ON public.django_celery_results_taskresult USING btree (task_name);


--
-- Name: django_cele_worker_d54dd8_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_cele_worker_d54dd8_idx ON public.django_celery_results_taskresult USING btree (worker);


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
-- Name: django_celery_results_chordcounter_group_id_1f70858c_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_results_chordcounter_group_id_1f70858c_like ON public.django_celery_results_chordcounter USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_groupresult_group_id_a085f1a9_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_results_groupresult_group_id_a085f1a9_like ON public.django_celery_results_groupresult USING btree (group_id varchar_pattern_ops);


--
-- Name: django_celery_results_taskresult_task_id_de0d95bf_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX django_celery_results_taskresult_task_id_de0d95bf_like ON public.django_celery_results_taskresult USING btree (task_id varchar_pattern_ops);


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

CREATE INDEX extras_computedfield_slug_3c4b9636_like ON public.extras_computedfield USING btree (key varchar_pattern_ops);


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
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_new_roles_configcontext_id_7b11e08b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_new_roles_configcontext_id_7b11e08b ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_new_roles_role_id_597e3d84; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_new_roles_role_id_597e3d84 ON public.extras_configcontext_roles USING btree (role_id);


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
-- Name: extras_configcontext_schema_id_1a9d39fe; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontext_schema_id_1a9d39fe ON public.extras_configcontext USING btree (config_context_schema_id);


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
-- Name: extras_configcontextschema_name_e2a3ef7b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_name_e2a3ef7b_like ON public.extras_configcontextschema USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontextschema_owner_content_type_id_0a0756bc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_configcontextschema_owner_content_type_id_0a0756bc ON public.extras_configcontextschema USING btree (owner_content_type_id);


--
-- Name: extras_contact_email_cda6017a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contact_email_cda6017a ON public.extras_contact USING btree (email);


--
-- Name: extras_contact_email_cda6017a_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contact_email_cda6017a_like ON public.extras_contact USING btree (email varchar_pattern_ops);


--
-- Name: extras_contact_name_93e7728d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contact_name_93e7728d ON public.extras_contact USING btree (name);


--
-- Name: extras_contact_name_93e7728d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contact_name_93e7728d_like ON public.extras_contact USING btree (name varchar_pattern_ops);


--
-- Name: extras_contact_phone_17e0a2f8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contact_phone_17e0a2f8 ON public.extras_contact USING btree (phone);


--
-- Name: extras_contact_phone_17e0a2f8_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contact_phone_17e0a2f8_like ON public.extras_contact USING btree (phone varchar_pattern_ops);


--
-- Name: extras_contactassociation_associated_object_id_e117d769; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contactassociation_associated_object_id_e117d769 ON public.extras_contactassociation USING btree (associated_object_id);


--
-- Name: extras_contactassociation_associated_object_type_id_b9f32adb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contactassociation_associated_object_type_id_b9f32adb ON public.extras_contactassociation USING btree (associated_object_type_id);


--
-- Name: extras_contactassociation_contact_id_1aa5b58c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contactassociation_contact_id_1aa5b58c ON public.extras_contactassociation USING btree (contact_id);


--
-- Name: extras_contactassociation_role_id_64bf7e21; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contactassociation_role_id_64bf7e21 ON public.extras_contactassociation USING btree (role_id);


--
-- Name: extras_contactassociation_status_id_8678ca28; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contactassociation_status_id_8678ca28 ON public.extras_contactassociation USING btree (status_id);


--
-- Name: extras_contactassociation_team_id_23dabd4a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_contactassociation_team_id_23dabd4a ON public.extras_contactassociation USING btree (team_id);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_slug_ed27c4fe_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfield_slug_ed27c4fe_like ON public.extras_customfield USING btree (key varchar_pattern_ops);


--
-- Name: extras_customfieldchoice_field_id_35006739; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_customfieldchoice_field_id_35006739 ON public.extras_customfieldchoice USING btree (custom_field_id);


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
-- Name: extras_externalintegration_name_07b45240_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_externalintegration_name_07b45240_like ON public.extras_externalintegration USING btree (name varchar_pattern_ops);


--
-- Name: extras_externalintegration_secrets_group_id_2f744e5c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_externalintegration_secrets_group_id_2f744e5c ON public.extras_externalintegration USING btree (secrets_group_id);


--
-- Name: extras_fileproxy_job_result_id_dfce512c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_fileproxy_job_result_id_dfce512c ON public.extras_fileproxy USING btree (job_result_id);


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
-- Name: extras_job_name_34d98c40_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_job_name_34d98c40_like ON public.extras_job USING btree (name varchar_pattern_ops);


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

CREATE INDEX extras_jobresult_completed_41ca396b ON public.extras_jobresult USING btree (date_done);


--
-- Name: extras_jobresult_created_bf3a3954; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_created_bf3a3954 ON public.extras_jobresult USING btree (date_created);


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
-- Name: extras_jobresult_rcreated_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_rcreated_idx ON public.extras_jobresult USING btree (date_created DESC);


--
-- Name: extras_jobresult_schedule_id_24ce985a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_schedule_id_24ce985a ON public.extras_jobresult USING btree (scheduled_job_id);


--
-- Name: extras_jobresult_status_2659cbae; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_status_2659cbae ON public.extras_jobresult USING btree (status);


--
-- Name: extras_jobresult_status_2659cbae_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_status_2659cbae_like ON public.extras_jobresult USING btree (status varchar_pattern_ops);


--
-- Name: extras_jobresult_task_name_05e4b9b2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_task_name_05e4b9b2 ON public.extras_jobresult USING btree (task_name);


--
-- Name: extras_jobresult_task_name_05e4b9b2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_task_name_05e4b9b2_like ON public.extras_jobresult USING btree (task_name varchar_pattern_ops);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_jr_rdone_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jr_rdone_idx ON public.extras_jobresult USING btree (date_done DESC);


--
-- Name: extras_jr_statrcreate_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jr_statrcreate_idx ON public.extras_jobresult USING btree (status, date_created DESC);


--
-- Name: extras_jr_statrdone_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_jr_statrdone_idx ON public.extras_jobresult USING btree (status, date_done DESC);


--
-- Name: extras_note_assigned_object_id_af6ced75; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_note_assigned_object_id_af6ced75 ON public.extras_note USING btree (assigned_object_id);


--
-- Name: extras_note_assigned_object_type_id_e15d3cda; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_note_assigned_object_type_id_e15d3cda ON public.extras_note USING btree (assigned_object_type_id);


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
-- Name: extras_objectchange_user_name_4ef4fac7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_user_name_4ef4fac7 ON public.extras_objectchange USING btree (user_name);


--
-- Name: extras_objectchange_user_name_4ef4fac7_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_objectchange_user_name_4ef4fac7_like ON public.extras_objectchange USING btree (user_name varchar_pattern_ops);


--
-- Name: extras_relationship_destination_type_id_fb7387c3; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_destination_type_id_fb7387c3 ON public.extras_relationship USING btree (destination_type_id);


--
-- Name: extras_relationship_name_5f6f8ea2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_name_5f6f8ea2_like ON public.extras_relationship USING btree (label varchar_pattern_ops);


--
-- Name: extras_relationship_slug_e09b40f4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_relationship_slug_e09b40f4_like ON public.extras_relationship USING btree (key varchar_pattern_ops);


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
-- Name: extras_role_content_types_contenttype_id_b8004814; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_role_content_types_contenttype_id_b8004814 ON public.extras_role_content_types USING btree (contenttype_id);


--
-- Name: extras_role_content_types_role_id_1db5d29d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_role_content_types_role_id_1db5d29d ON public.extras_role_content_types USING btree (role_id);


--
-- Name: extras_role_name_fa7c1d4b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_role_name_fa7c1d4b_like ON public.extras_role USING btree (name varchar_pattern_ops);


--
-- Name: extras_scheduledjob_approved_by_user_id_06b8fb0a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_approved_by_user_id_06b8fb0a ON public.extras_scheduledjob USING btree (approved_by_user_id);


--
-- Name: extras_scheduledjob_job_model_id_d4c0711e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_scheduledjob_job_model_id_d4c0711e ON public.extras_scheduledjob USING btree (job_model_id);


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
-- Name: extras_secretsgroup_name_626cec38_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroup_name_626cec38_like ON public.extras_secretsgroup USING btree (name varchar_pattern_ops);


--
-- Name: extras_secretsgroupassociation_group_id_68ca43f6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_secretsgroupassociation_group_id_68ca43f6 ON public.extras_secretsgroupassociation USING btree (secrets_group_id);


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
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_team_contacts_contact_id_98c0e1d5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_contacts_contact_id_98c0e1d5 ON public.extras_team_contacts USING btree (contact_id);


--
-- Name: extras_team_contacts_team_id_4696917a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_contacts_team_id_4696917a ON public.extras_team_contacts USING btree (team_id);


--
-- Name: extras_team_email_f8003440; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_email_f8003440 ON public.extras_team USING btree (email);


--
-- Name: extras_team_email_f8003440_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_email_f8003440_like ON public.extras_team USING btree (email varchar_pattern_ops);


--
-- Name: extras_team_name_1e27beab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_name_1e27beab ON public.extras_team USING btree (name);


--
-- Name: extras_team_name_1e27beab_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_name_1e27beab_like ON public.extras_team USING btree (name varchar_pattern_ops);


--
-- Name: extras_team_phone_f55ffc6f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_phone_f55ffc6f ON public.extras_team USING btree (phone);


--
-- Name: extras_team_phone_f55ffc6f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX extras_team_phone_f55ffc6f_like ON public.extras_team USING btree (phone varchar_pattern_ops);


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
-- Name: ipam_ipaddress_ip_version_ce3b626f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_ip_version_ce3b626f ON public.ipam_ipaddress USING btree (ip_version);


--
-- Name: ipam_ipaddress_nat_inside_id_a45fb7c5; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_nat_inside_id_a45fb7c5 ON public.ipam_ipaddress USING btree (nat_inside_id);


--
-- Name: ipam_ipaddress_new_role_id_93bf5f61; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_new_role_id_93bf5f61 ON public.ipam_ipaddress USING btree (role_id);


--
-- Name: ipam_ipaddress_parent_id_085a7a43; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_parent_id_085a7a43 ON public.ipam_ipaddress USING btree (parent_id);


--
-- Name: ipam_ipaddress_prefix_length_f80d3663; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_prefix_length_f80d3663 ON public.ipam_ipaddress USING btree (mask_length);


--
-- Name: ipam_ipaddress_status_id_942778b7; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_status_id_942778b7 ON public.ipam_ipaddress USING btree (status_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddresstointerface_interface_id_035d6540; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddresstointerface_interface_id_035d6540 ON public.ipam_ipaddresstointerface USING btree (interface_id);


--
-- Name: ipam_ipaddresstointerface_ip_address_id_7437efa0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddresstointerface_ip_address_id_7437efa0 ON public.ipam_ipaddresstointerface USING btree (ip_address_id);


--
-- Name: ipam_ipaddresstointerface_vm_interface_id_9ffb75a8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_ipaddresstointerface_vm_interface_id_9ffb75a8 ON public.ipam_ipaddresstointerface USING btree (vm_interface_id);


--
-- Name: ipam_namespace_location_id_0ee18237; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_namespace_location_id_0ee18237 ON public.ipam_namespace USING btree (location_id);


--
-- Name: ipam_namespace_name_63ca21f2_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_namespace_name_63ca21f2_like ON public.ipam_namespace USING btree (name varchar_pattern_ops);


--
-- Name: ipam_prefix_broadcast_8e623832; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_broadcast_8e623832 ON public.ipam_prefix USING btree (broadcast);


--
-- Name: ipam_prefix_ip_version_85fe83ba; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_ip_version_85fe83ba ON public.ipam_prefix USING btree (ip_version);


--
-- Name: ipam_prefix_namespace_id_aaf034e9; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_namespace_id_aaf034e9 ON public.ipam_prefix USING btree (namespace_id);


--
-- Name: ipam_prefix_namespace_id_network_bro_a2f7797d_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_namespace_id_network_bro_a2f7797d_idx ON public.ipam_prefix USING btree (namespace_id, network, broadcast, prefix_length);


--
-- Name: ipam_prefix_network_broadcast_prefix_length_cac86426_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_network_broadcast_prefix_length_cac86426_idx ON public.ipam_prefix USING btree (network, broadcast, prefix_length);


--
-- Name: ipam_prefix_network_f7bac882; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_network_f7bac882 ON public.ipam_prefix USING btree (network);


--
-- Name: ipam_prefix_new_role_id_528afd96; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_new_role_id_528afd96 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_parent_id_93c2aef8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_parent_id_93c2aef8 ON public.ipam_prefix USING btree (parent_id);


--
-- Name: ipam_prefix_prefix_length_84660485; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_prefix_length_84660485 ON public.ipam_prefix USING btree (prefix_length);


--
-- Name: ipam_prefix_rir_id_a009797a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefix_rir_id_a009797a ON public.ipam_prefix USING btree (rir_id);


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
-- Name: ipam_prefixlocationassignment_location_id_49531b36; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefixlocationassignment_location_id_49531b36 ON public.ipam_prefixlocationassignment USING btree (location_id);


--
-- Name: ipam_prefixlocationassignment_prefix_id_93a70640; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_prefixlocationassignment_prefix_id_93a70640 ON public.ipam_prefixlocationassignment USING btree (prefix_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


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

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ip_addresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ip_addresses USING btree (service_id);


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

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (vlan_group_id);


--
-- Name: ipam_vlan_name_a7671201; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_name_a7671201 ON public.ipam_vlan USING btree (name);


--
-- Name: ipam_vlan_name_a7671201_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_name_a7671201_like ON public.ipam_vlan USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlan_new_role_id_980649ea; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlan_new_role_id_980649ea ON public.ipam_vlan USING btree (role_id);


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
-- Name: ipam_vlangroup_name_46bf02a4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlangroup_name_46bf02a4_like ON public.ipam_vlangroup USING btree (name varchar_pattern_ops);


--
-- Name: ipam_vlanlocationassignment_location_id_452fe170; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlanlocationassignment_location_id_452fe170 ON public.ipam_vlanlocationassignment USING btree (location_id);


--
-- Name: ipam_vlanlocationassignment_vlan_id_9591c78f; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vlanlocationassignment_vlan_id_9591c78f ON public.ipam_vlanlocationassignment USING btree (vlan_id);


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
-- Name: ipam_vrf_namespace_id_8835a4df; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_namespace_id_8835a4df ON public.ipam_vrf USING btree (namespace_id);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: ipam_vrfdeviceassignment_device_id_b79a12ce; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrfdeviceassignment_device_id_b79a12ce ON public.ipam_vrfdeviceassignment USING btree (device_id);


--
-- Name: ipam_vrfdeviceassignment_virtual_machine_id_2b9c3e80; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrfdeviceassignment_virtual_machine_id_2b9c3e80 ON public.ipam_vrfdeviceassignment USING btree (virtual_machine_id);


--
-- Name: ipam_vrfdeviceassignment_vrf_id_de560201; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrfdeviceassignment_vrf_id_de560201 ON public.ipam_vrfdeviceassignment USING btree (vrf_id);


--
-- Name: ipam_vrfprefixassignment_prefix_id_808d8301; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrfprefixassignment_prefix_id_808d8301 ON public.ipam_vrfprefixassignment USING btree (prefix_id);


--
-- Name: ipam_vrfprefixassignment_vrf_id_d9496635; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX ipam_vrfprefixassignment_vrf_id_d9496635 ON public.ipam_vrfprefixassignment USING btree (vrf_id);


--
-- Name: related_object_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX related_object_idx ON public.extras_objectchange USING btree (related_object_type_id, related_object_id);


--
-- Name: silk_profile_queries_profile_id_a3d76db8; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_profile_queries_profile_id_a3d76db8 ON public.silk_profile_queries USING btree (profile_id);


--
-- Name: silk_profile_queries_sqlquery_id_155df455; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_profile_queries_sqlquery_id_155df455 ON public.silk_profile_queries USING btree (sqlquery_id);


--
-- Name: silk_profile_request_id_7b81bd69; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_profile_request_id_7b81bd69 ON public.silk_profile USING btree (request_id);


--
-- Name: silk_profile_request_id_7b81bd69_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_profile_request_id_7b81bd69_like ON public.silk_profile USING btree (request_id varchar_pattern_ops);


--
-- Name: silk_request_id_5a356c4f_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_request_id_5a356c4f_like ON public.silk_request USING btree (id varchar_pattern_ops);


--
-- Name: silk_request_path_9f3d798e; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_request_path_9f3d798e ON public.silk_request USING btree (path);


--
-- Name: silk_request_path_9f3d798e_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_request_path_9f3d798e_like ON public.silk_request USING btree (path varchar_pattern_ops);


--
-- Name: silk_request_start_time_1300bc58; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_request_start_time_1300bc58 ON public.silk_request USING btree (start_time);


--
-- Name: silk_request_view_name_68559f7b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_request_view_name_68559f7b ON public.silk_request USING btree (view_name);


--
-- Name: silk_request_view_name_68559f7b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_request_view_name_68559f7b_like ON public.silk_request USING btree (view_name varchar_pattern_ops);


--
-- Name: silk_response_id_dda88710_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_response_id_dda88710_like ON public.silk_response USING btree (id varchar_pattern_ops);


--
-- Name: silk_response_request_id_1e8e2776_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_response_request_id_1e8e2776_like ON public.silk_response USING btree (request_id varchar_pattern_ops);


--
-- Name: silk_sqlquery_request_id_6f8f0527; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_sqlquery_request_id_6f8f0527 ON public.silk_sqlquery USING btree (request_id);


--
-- Name: silk_sqlquery_request_id_6f8f0527_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX silk_sqlquery_request_id_6f8f0527_like ON public.silk_sqlquery USING btree (request_id varchar_pattern_ops);


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

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (tenant_group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: user_changed_object_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX user_changed_object_idx ON public.extras_objectchange USING btree (user_id, changed_object_type_id, changed_object_id);


--
-- Name: user_name_changed_object_idx; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX user_name_changed_object_idx ON public.extras_objectchange USING btree (user_name, changed_object_type_id, changed_object_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_name_8d7a5900_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX users_objectpermission_name_8d7a5900_like ON public.users_objectpermission USING btree (name varchar_pattern_ops);


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

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (cluster_group_id);


--
-- Name: virtualization_cluster_location_id_fdcab7e6; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_location_id_fdcab7e6 ON public.virtualization_cluster USING btree (location_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (cluster_type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_virtualmach_local_context_data_owner_c_f760366b; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmach_local_context_data_owner_c_f760366b ON public.virtualization_virtualmachine USING btree (local_config_context_data_owner_content_type_id);


--
-- Name: virtualization_virtualmach_softwareimagefile_id_cf541719; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmach_softwareimagefile_id_cf541719 ON public.virtualization_virtualmachine_software_image_files USING btree (softwareimagefile_id);


--
-- Name: virtualization_virtualmach_virtualmachine_id_6722bc07; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmach_virtualmachine_id_6722bc07 ON public.virtualization_virtualmachine_software_image_files USING btree (virtualmachine_id);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_local_context_schema_id_d359876d; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_local_context_schema_id_d359876d ON public.virtualization_virtualmachine USING btree (local_config_context_schema_id);


--
-- Name: virtualization_virtualmachine_name_266f6cdc; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc ON public.virtualization_virtualmachine USING btree (name);


--
-- Name: virtualization_virtualmachine_name_266f6cdc_like; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc_like ON public.virtualization_virtualmachine USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_new_role_id_73370f1c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_new_role_id_73370f1c ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_primary_ip4_id_942e42ae; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_primary_ip4_id_942e42ae ON public.virtualization_virtualmachine USING btree (primary_ip4_id);


--
-- Name: virtualization_virtualmachine_primary_ip6_id_b7904e73; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_primary_ip6_id_b7904e73 ON public.virtualization_virtualmachine USING btree (primary_ip6_id);


--
-- Name: virtualization_virtualmachine_software_version_id_44a299cb; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_virtualmachine_software_version_id_44a299cb ON public.virtualization_virtualmachine USING btree (software_version_id);


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
-- Name: virtualization_vminterface_vrf_id_4b570a8c; Type: INDEX; Schema: public; Owner: nautobot
--

CREATE INDEX virtualization_vminterface_vrf_id_4b570a8c ON public.virtualization_vminterface USING btree (vrf_id);


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
-- Name: circuits_circuit circuits_circuit_circuit_termination__498b110c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_circuit_termination__498b110c_fk_circuits_ FOREIGN KEY (circuit_termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_circuit_termination__ef74b54e_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_circuit_termination__ef74b54e_fk_circuits_ FOREIGN KEY (circuit_termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_circuit_type_id_8b659c7a_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_circuit_type_id_8b659c7a_fk_circuits_ FOREIGN KEY (circuit_type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_controller dcim_controller_controller_device_id_ac4051d9_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_controller_device_id_ac4051d9_fk_dcim_device_id FOREIGN KEY (controller_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_controller_device_re_1689f27b_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_controller_device_re_1689f27b_fk_dcim_devi FOREIGN KEY (controller_device_redundancy_group_id) REFERENCES public.dcim_deviceredundancygroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_external_integration_656fb857_fk_extras_ex; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_external_integration_656fb857_fk_extras_ex FOREIGN KEY (external_integration_id) REFERENCES public.extras_externalintegration(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_location_id_e3518103_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_location_id_e3518103_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_platform_id_86f63411_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_platform_id_86f63411_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_role_id_0593bbde_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_role_id_0593bbde_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_status_id_d9fb93f5_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_status_id_d9fb93f5_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controller dcim_controller_tenant_id_5cc9817a_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controller
    ADD CONSTRAINT dcim_controller_tenant_id_5cc9817a_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controllermanageddevicegroup dcim_controllermanag_controller_id_ca2df71d_fk_dcim_cont; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controllermanageddevicegroup
    ADD CONSTRAINT dcim_controllermanag_controller_id_ca2df71d_fk_dcim_cont FOREIGN KEY (controller_id) REFERENCES public.dcim_controller(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_controllermanageddevicegroup dcim_controllermanag_parent_id_567b18e0_fk_dcim_cont; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_controllermanageddevicegroup
    ADD CONSTRAINT dcim_controllermanag_parent_id_567b18e0_fk_dcim_cont FOREIGN KEY (parent_id) REFERENCES public.dcim_controllermanageddevicegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_controller_managed_d_81d03712_fk_dcim_cont; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_controller_managed_d_81d03712_fk_dcim_cont FOREIGN KEY (controller_managed_device_group_id) REFERENCES public.dcim_controllermanageddevicegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_redundancy_gr_ca97f1fc_fk_dcim_devi FOREIGN KEY (device_redundancy_group_id) REFERENCES public.dcim_deviceredundancygroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_local_config_context_433299af_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_local_config_context_433299af_fk_django_co FOREIGN KEY (local_config_context_data_owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_local_config_context_a4c083a4_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_local_config_context_a4c083a4_fk_extras_co FOREIGN KEY (local_config_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_device dcim_device_role_id_61edcc33_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_role_id_61edcc33_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_secrets_group_id_52d75f4a_fk_extras_secretsgroup_id FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device_software_image_files dcim_device_software_device_id_54aaa8f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device_software_image_files
    ADD CONSTRAINT dcim_device_software_device_id_54aaa8f9_fk_dcim_devi FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device_software_image_files dcim_device_software_softwareimagefile_id_41a541f0_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device_software_image_files
    ADD CONSTRAINT dcim_device_software_softwareimagefile_id_41a541f0_fk_dcim_soft FOREIGN KEY (softwareimagefile_id) REFERENCES public.dcim_softwareimagefile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_software_version_id_5bc284cc_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_software_version_id_5bc284cc_fk_dcim_soft FOREIGN KEY (software_version_id) REFERENCES public.dcim_softwareversion(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_devicetype dcim_devicetype_device_family_id_e02e7c53_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_device_family_id_e02e7c53_fk_dcim_devi FOREIGN KEY (device_family_id) REFERENCES public.dcim_devicefamily(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetypetosoftwareimagefile dcim_devicetypetosof_device_type_id_74d7511c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetypetosoftwareimagefile
    ADD CONSTRAINT dcim_devicetypetosof_device_type_id_74d7511c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetypetosoftwareimagefile dcim_devicetypetosof_software_image_file__ce1ed3c6_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_devicetypetosoftwareimagefile
    ADD CONSTRAINT dcim_devicetypetosof_software_image_file__ce1ed3c6_fk_dcim_soft FOREIGN KEY (software_image_file_id) REFERENCES public.dcim_softwareimagefile(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_template_i_d6a910d0_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_template_i_d6a910d0_fk_dcim_rear FOREIGN KEY (rear_port_template_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_interface dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_vrf_id_a92e59b2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_inventoryitem_software_image_files dcim_inventoryitem_s_inventoryitem_id_f580bb3c_fk_dcim_inve; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem_software_image_files
    ADD CONSTRAINT dcim_inventoryitem_s_inventoryitem_id_f580bb3c_fk_dcim_inve FOREIGN KEY (inventoryitem_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem_software_image_files dcim_inventoryitem_s_softwareimagefile_id_6c5e374d_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem_software_image_files
    ADD CONSTRAINT dcim_inventoryitem_s_softwareimagefile_id_6c5e374d_fk_dcim_soft FOREIGN KEY (softwareimagefile_id) REFERENCES public.dcim_softwareimagefile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_software_version_id_0e33b2f2_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_software_version_id_0e33b2f2_fk_dcim_soft FOREIGN KEY (software_version_id) REFERENCES public.dcim_softwareversion(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_template__fd11e222_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_template__fd11e222_fk_dcim_powe FOREIGN KEY (power_port_template_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_rack_group_id_70309130_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_rack_group_id_70309130_fk_dcim_rackgroup_id FOREIGN KEY (rack_group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: dcim_softwareimagefile dcim_softwareimagefi_software_version_id_a143fbd3_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareimagefile
    ADD CONSTRAINT dcim_softwareimagefi_software_version_id_a143fbd3_fk_dcim_soft FOREIGN KEY (software_version_id) REFERENCES public.dcim_softwareversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_softwareimagefile dcim_softwareimagefile_status_id_5288600b_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareimagefile
    ADD CONSTRAINT dcim_softwareimagefile_status_id_5288600b_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_softwareversion dcim_softwareversion_platform_id_dcac6ff8_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareversion
    ADD CONSTRAINT dcim_softwareversion_platform_id_dcac6ff8_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_softwareversion dcim_softwareversion_status_id_e167dc1f_fk_extras_status_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.dcim_softwareversion
    ADD CONSTRAINT dcim_softwareversion_status_id_e167dc1f_fk_extras_status_id FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_configcontext extras_configcontext_config_context_schem_1e242da5_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_config_context_schem_1e242da5_fk_extras_co FOREIGN KEY (config_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_7b11e08b_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_7b11e08b_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_configcontext_roles extras_configcontext_role_id_597e3d84_fk_extras_ro; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_role_id_597e3d84_fk_extras_ro FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_contactassociation extras_contactassoci_associated_object_ty_b9f32adb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassoci_associated_object_ty_b9f32adb_fk_django_co FOREIGN KEY (associated_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_contactassociation extras_contactassoci_contact_id_1aa5b58c_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassoci_contact_id_1aa5b58c_fk_extras_co FOREIGN KEY (contact_id) REFERENCES public.extras_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_contactassociation extras_contactassoci_status_id_8678ca28_fk_extras_st; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassoci_status_id_8678ca28_fk_extras_st FOREIGN KEY (status_id) REFERENCES public.extras_status(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_contactassociation extras_contactassociation_role_id_64bf7e21_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassociation_role_id_64bf7e21_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_contactassociation extras_contactassociation_team_id_23dabd4a_fk_extras_team_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_contactassociation
    ADD CONSTRAINT extras_contactassociation_team_id_23dabd4a_fk_extras_team_id FOREIGN KEY (team_id) REFERENCES public.extras_team(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_customfieldchoice extras_customfieldch_custom_field_id_d57e0f43_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldch_custom_field_id_d57e0f43_fk_extras_cu FOREIGN KEY (custom_field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_externalintegration extras_externalinteg_secrets_group_id_2f744e5c_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_externalintegration
    ADD CONSTRAINT extras_externalinteg_secrets_group_id_2f744e5c_fk_extras_se FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_fileproxy extras_fileproxy_job_result_id_dfce512c_fk_extras_jobresult_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_fileproxy
    ADD CONSTRAINT extras_fileproxy_job_result_id_dfce512c_fk_extras_jobresult_id FOREIGN KEY (job_result_id) REFERENCES public.extras_jobresult(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_jobresult extras_jobresult_scheduled_job_id_0921f94c_fk_extras_sc; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_scheduled_job_id_0921f94c_fk_extras_sc FOREIGN KEY (scheduled_job_id) REFERENCES public.extras_scheduledjob(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_role_content_types extras_role_content__contenttype_id_b8004814_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role_content_types
    ADD CONSTRAINT extras_role_content__contenttype_id_b8004814_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_role_content_types extras_role_content_types_role_id_1db5d29d_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_role_content_types
    ADD CONSTRAINT extras_role_content_types_role_id_1db5d29d_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_secretsgroupassociation extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupa_secret_id_14d43d7e_fk_extras_se FOREIGN KEY (secret_id) REFERENCES public.extras_secret(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_secretsgroupassociation extras_secretsgroupa_secrets_group_id_cf96162e_fk_extras_se; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_secretsgroupassociation
    ADD CONSTRAINT extras_secretsgroupa_secrets_group_id_cf96162e_fk_extras_se FOREIGN KEY (secrets_group_id) REFERENCES public.extras_secretsgroup(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: extras_team_contacts extras_team_contacts_contact_id_98c0e1d5_fk_extras_contact_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team_contacts
    ADD CONSTRAINT extras_team_contacts_contact_id_98c0e1d5_fk_extras_contact_id FOREIGN KEY (contact_id) REFERENCES public.extras_contact(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_team_contacts extras_team_contacts_team_id_4696917a_fk_extras_team_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.extras_team_contacts
    ADD CONSTRAINT extras_team_contacts_team_id_4696917a_fk_extras_team_id FOREIGN KEY (team_id) REFERENCES public.extras_team(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_parent_id_085a7a43_fk_ipam_prefix_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_parent_id_085a7a43_fk_ipam_prefix_id FOREIGN KEY (parent_id) REFERENCES public.ipam_prefix(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_role_id_719761b6_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_role_id_719761b6_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: ipam_ipaddresstointerface ipam_ipaddresstointe_interface_id_035d6540_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddresstointerface
    ADD CONSTRAINT ipam_ipaddresstointe_interface_id_035d6540_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddresstointerface ipam_ipaddresstointe_ip_address_id_7437efa0_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddresstointerface
    ADD CONSTRAINT ipam_ipaddresstointe_ip_address_id_7437efa0_fk_ipam_ipad FOREIGN KEY (ip_address_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddresstointerface ipam_ipaddresstointe_vm_interface_id_9ffb75a8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_ipaddresstointerface
    ADD CONSTRAINT ipam_ipaddresstointe_vm_interface_id_9ffb75a8_fk_virtualiz FOREIGN KEY (vm_interface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_namespace ipam_namespace_location_id_0ee18237_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_namespace
    ADD CONSTRAINT ipam_namespace_location_id_0ee18237_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_namespace_id_aaf034e9_fk_ipam_namespace_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_namespace_id_aaf034e9_fk_ipam_namespace_id FOREIGN KEY (namespace_id) REFERENCES public.ipam_namespace(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_parent_id_93c2aef8_fk_ipam_prefix_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_parent_id_93c2aef8_fk_ipam_prefix_id FOREIGN KEY (parent_id) REFERENCES public.ipam_prefix(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_rir_id_a009797a_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_rir_id_a009797a_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: ipam_prefixlocationassignment ipam_prefixlocationa_location_id_49531b36_fk_dcim_loca; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefixlocationassignment
    ADD CONSTRAINT ipam_prefixlocationa_location_id_49531b36_fk_dcim_loca FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefixlocationassignment ipam_prefixlocationa_prefix_id_93a70640_fk_ipam_pref; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_prefixlocationassignment
    ADD CONSTRAINT ipam_prefixlocationa_prefix_id_93a70640_fk_ipam_pref FOREIGN KEY (prefix_id) REFERENCES public.ipam_prefix(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: ipam_service_ip_addresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ip_addresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ip_addresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service_ip_addresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_extras_role_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_extras_role_id FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: ipam_vlan ipam_vlan_vlan_group_id_a59c4d3f_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_vlan_group_id_a59c4d3f_fk_ipam_vlangroup_id FOREIGN KEY (vlan_group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_location_id_f239af79_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_location_id_f239af79_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlanlocationassignment ipam_vlanlocationass_location_id_452fe170_fk_dcim_loca; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlanlocationassignment
    ADD CONSTRAINT ipam_vlanlocationass_location_id_452fe170_fk_dcim_loca FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlanlocationassignment ipam_vlanlocationassignment_vlan_id_9591c78f_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vlanlocationassignment
    ADD CONSTRAINT ipam_vlanlocationassignment_vlan_id_9591c78f_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: ipam_vrf ipam_vrf_namespace_id_8835a4df_fk_ipam_namespace_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_namespace_id_8835a4df_fk_ipam_namespace_id FOREIGN KEY (namespace_id) REFERENCES public.ipam_namespace(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrfdeviceassignment ipam_vrfdeviceassign_virtual_machine_id_2b9c3e80_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfdeviceassignment
    ADD CONSTRAINT ipam_vrfdeviceassign_virtual_machine_id_2b9c3e80_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrfdeviceassignment ipam_vrfdeviceassignment_device_id_b79a12ce_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfdeviceassignment
    ADD CONSTRAINT ipam_vrfdeviceassignment_device_id_b79a12ce_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrfdeviceassignment ipam_vrfdeviceassignment_vrf_id_de560201_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfdeviceassignment
    ADD CONSTRAINT ipam_vrfdeviceassignment_vrf_id_de560201_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrfprefixassignment ipam_vrfprefixassignment_prefix_id_808d8301_fk_ipam_prefix_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfprefixassignment
    ADD CONSTRAINT ipam_vrfprefixassignment_prefix_id_808d8301_fk_ipam_prefix_id FOREIGN KEY (prefix_id) REFERENCES public.ipam_prefix(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrfprefixassignment ipam_vrfprefixassignment_vrf_id_d9496635_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.ipam_vrfprefixassignment
    ADD CONSTRAINT ipam_vrfprefixassignment_vrf_id_d9496635_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: silk_profile_queries silk_profile_queries_profile_id_a3d76db8_fk_silk_profile_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile_queries
    ADD CONSTRAINT silk_profile_queries_profile_id_a3d76db8_fk_silk_profile_id FOREIGN KEY (profile_id) REFERENCES public.silk_profile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: silk_profile_queries silk_profile_queries_sqlquery_id_155df455_fk_silk_sqlquery_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile_queries
    ADD CONSTRAINT silk_profile_queries_sqlquery_id_155df455_fk_silk_sqlquery_id FOREIGN KEY (sqlquery_id) REFERENCES public.silk_sqlquery(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: silk_profile silk_profile_request_id_7b81bd69_fk_silk_request_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_profile
    ADD CONSTRAINT silk_profile_request_id_7b81bd69_fk_silk_request_id FOREIGN KEY (request_id) REFERENCES public.silk_request(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: silk_response silk_response_request_id_1e8e2776_fk_silk_request_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_response
    ADD CONSTRAINT silk_response_request_id_1e8e2776_fk_silk_request_id FOREIGN KEY (request_id) REFERENCES public.silk_request(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: silk_sqlquery silk_sqlquery_request_id_6f8f0527_fk_silk_request_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.silk_sqlquery
    ADD CONSTRAINT silk_sqlquery_request_id_6f8f0527_fk_silk_request_id FOREIGN KEY (request_id) REFERENCES public.silk_request(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: tenancy_tenant tenancy_tenant_tenant_group_id_bb4557b9_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_tenant_group_id_bb4557b9_fk_tenancy_t FOREIGN KEY (tenant_group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: virtualization_cluster virtualization_clust_cluster_group_id_fec59c40_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_cluster_group_id_fec59c40_fk_virtualiz FOREIGN KEY (cluster_group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_cluster_type_id_d4889bbe_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_cluster_type_id_d4889bbe_fk_virtualiz FOREIGN KEY (cluster_type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_location_id_fdcab7e6_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: virtualization_virtualmachine virtualization_virtu_local_config_context_a233267f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_local_config_context_a233267f_fk_django_co FOREIGN KEY (local_config_context_data_owner_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_local_config_context_bec5cdf8_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_local_config_context_bec5cdf8_fk_extras_co FOREIGN KEY (local_config_context_schema_id) REFERENCES public.extras_configcontextschema(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_extras_ro; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_extras_ro FOREIGN KEY (role_id) REFERENCES public.extras_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_software_version_id_44a299cb_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_software_version_id_44a299cb_fk_dcim_soft FOREIGN KEY (software_version_id) REFERENCES public.dcim_softwareversion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine_software_image_files virtualization_virtu_softwareimagefile_id_cf541719_fk_dcim_soft; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine_software_image_files
    ADD CONSTRAINT virtualization_virtu_softwareimagefile_id_cf541719_fk_dcim_soft FOREIGN KEY (softwareimagefile_id) REFERENCES public.dcim_softwareimagefile(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: virtualization_virtualmachine_software_image_files virtualization_virtu_virtualmachine_id_6722bc07_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_virtualmachine_software_image_files
    ADD CONSTRAINT virtualization_virtu_virtualmachine_id_6722bc07_fk_virtualiz FOREIGN KEY (virtualmachine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: virtualization_vminterface virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: nautobot
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_vrf_id_4b570a8c_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

