PGDMP                         y            clinica    10.4    12.3 1    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    24702    clinica    DATABASE     ?   CREATE DATABASE clinica WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';
    DROP DATABASE clinica;
                postgres    false            ?            1259    24713    clientes    TABLE     '  CREATE TABLE public.clientes (
    id_clientes integer NOT NULL,
    funcionarios_idfuncionarios integer,
    nome character varying(145) NOT NULL,
    data_nascimento date NOT NULL,
    telefone character varying(45) NOT NULL,
    senha character varying(45) NOT NULL,
    sexo character(1)
);
    DROP TABLE public.clientes;
       public            postgres    false            ?            1259    24711    clientes_id_clientes_seq    SEQUENCE     ?   CREATE SEQUENCE public.clientes_id_clientes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.clientes_id_clientes_seq;
       public          postgres    false    199            ,           0    0    clientes_id_clientes_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.clientes_id_clientes_seq OWNED BY public.clientes.id_clientes;
          public          postgres    false    198            ?            1259    32988 	   consultas    TABLE       CREATE TABLE public.consultas (
    id_consulta integer NOT NULL,
    id_medico integer,
    data_consulta date NOT NULL,
    hora_consulta time without time zone NOT NULL,
    id_clientes integer NOT NULL,
    status character varying(10) NOT NULL,
    registrada integer NOT NULL
);
    DROP TABLE public.consultas;
       public            postgres    false            ?            1259    32986    consultas_id_consulta_seq    SEQUENCE     ?   CREATE SEQUENCE public.consultas_id_consulta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.consultas_id_consulta_seq;
       public          postgres    false    205            -           0    0    consultas_id_consulta_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.consultas_id_consulta_seq OWNED BY public.consultas.id_consulta;
          public          postgres    false    204            ?            1259    24788    especializacao    TABLE     o   CREATE TABLE public.especializacao (
    espe_id integer NOT NULL,
    nome character varying(150) NOT NULL
);
 "   DROP TABLE public.especializacao;
       public            postgres    false            ?            1259    24786    especializacao_espe_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.especializacao_espe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.especializacao_espe_id_seq;
       public          postgres    false    203            .           0    0    especializacao_espe_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.especializacao_espe_id_seq OWNED BY public.especializacao.espe_id;
          public          postgres    false    202            ?            1259    24705    funcionarios    TABLE     ?   CREATE TABLE public.funcionarios (
    id_funcionarios integer NOT NULL,
    nome character varying(145) NOT NULL,
    cargo character varying(45) NOT NULL,
    senha character varying(45) NOT NULL
);
     DROP TABLE public.funcionarios;
       public            postgres    false            ?            1259    24703     funcionarios_id_funcionarios_seq    SEQUENCE     ?   CREATE SEQUENCE public.funcionarios_id_funcionarios_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.funcionarios_id_funcionarios_seq;
       public          postgres    false    197            /           0    0     funcionarios_id_funcionarios_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.funcionarios_id_funcionarios_seq OWNED BY public.funcionarios.id_funcionarios;
          public          postgres    false    196            ?            1259    33013    horario    TABLE     ?   CREATE TABLE public.horario (
    id_horario integer NOT NULL,
    "10:00" character varying(50),
    "11:00" integer,
    "13:00" integer,
    "14:00" integer
);
    DROP TABLE public.horario;
       public            postgres    false            ?            1259    33011    horario_id_horario_seq    SEQUENCE     ?   CREATE SEQUENCE public.horario_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.horario_id_horario_seq;
       public          postgres    false    207            0           0    0    horario_id_horario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.horario_id_horario_seq OWNED BY public.horario.id_horario;
          public          postgres    false    206            ?            1259    24752    medicos    TABLE        CREATE TABLE public.medicos (
    id_medico integer NOT NULL,
    nome character varying(150),
    espe_id integer NOT NULL
);
    DROP TABLE public.medicos;
       public            postgres    false            ?            1259    24750    medicos_id_medico_seq    SEQUENCE     ?   CREATE SEQUENCE public.medicos_id_medico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.medicos_id_medico_seq;
       public          postgres    false    201            1           0    0    medicos_id_medico_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.medicos_id_medico_seq OWNED BY public.medicos.id_medico;
          public          postgres    false    200            ?
           2604    24716    clientes id_clientes    DEFAULT     |   ALTER TABLE ONLY public.clientes ALTER COLUMN id_clientes SET DEFAULT nextval('public.clientes_id_clientes_seq'::regclass);
 C   ALTER TABLE public.clientes ALTER COLUMN id_clientes DROP DEFAULT;
       public          postgres    false    198    199    199            ?
           2604    32991    consultas id_consulta    DEFAULT     ~   ALTER TABLE ONLY public.consultas ALTER COLUMN id_consulta SET DEFAULT nextval('public.consultas_id_consulta_seq'::regclass);
 D   ALTER TABLE public.consultas ALTER COLUMN id_consulta DROP DEFAULT;
       public          postgres    false    205    204    205            ?
           2604    24791    especializacao espe_id    DEFAULT     ?   ALTER TABLE ONLY public.especializacao ALTER COLUMN espe_id SET DEFAULT nextval('public.especializacao_espe_id_seq'::regclass);
 E   ALTER TABLE public.especializacao ALTER COLUMN espe_id DROP DEFAULT;
       public          postgres    false    203    202    203            ?
           2604    24708    funcionarios id_funcionarios    DEFAULT     ?   ALTER TABLE ONLY public.funcionarios ALTER COLUMN id_funcionarios SET DEFAULT nextval('public.funcionarios_id_funcionarios_seq'::regclass);
 K   ALTER TABLE public.funcionarios ALTER COLUMN id_funcionarios DROP DEFAULT;
       public          postgres    false    196    197    197            ?
           2604    33016    horario id_horario    DEFAULT     x   ALTER TABLE ONLY public.horario ALTER COLUMN id_horario SET DEFAULT nextval('public.horario_id_horario_seq'::regclass);
 A   ALTER TABLE public.horario ALTER COLUMN id_horario DROP DEFAULT;
       public          postgres    false    206    207    207            ?
           2604    24755    medicos id_medico    DEFAULT     v   ALTER TABLE ONLY public.medicos ALTER COLUMN id_medico SET DEFAULT nextval('public.medicos_id_medico_seq'::regclass);
 @   ALTER TABLE public.medicos ALTER COLUMN id_medico DROP DEFAULT;
       public          postgres    false    201    200    201                      0    24713    clientes 
   TABLE DATA           z   COPY public.clientes (id_clientes, funcionarios_idfuncionarios, nome, data_nascimento, telefone, senha, sexo) FROM stdin;
    public          postgres    false    199   ?8       #          0    32988 	   consultas 
   TABLE DATA           z   COPY public.consultas (id_consulta, id_medico, data_consulta, hora_consulta, id_clientes, status, registrada) FROM stdin;
    public          postgres    false    205   *9       !          0    24788    especializacao 
   TABLE DATA           7   COPY public.especializacao (espe_id, nome) FROM stdin;
    public          postgres    false    203   ?9                 0    24705    funcionarios 
   TABLE DATA           K   COPY public.funcionarios (id_funcionarios, nome, cargo, senha) FROM stdin;
    public          postgres    false    197   ?9       %          0    33013    horario 
   TABLE DATA           Q   COPY public.horario (id_horario, "10:00", "11:00", "13:00", "14:00") FROM stdin;
    public          postgres    false    207   *:                 0    24752    medicos 
   TABLE DATA           ;   COPY public.medicos (id_medico, nome, espe_id) FROM stdin;
    public          postgres    false    201   G:       2           0    0    clientes_id_clientes_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.clientes_id_clientes_seq', 1, true);
          public          postgres    false    198            3           0    0    consultas_id_consulta_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.consultas_id_consulta_seq', 20, true);
          public          postgres    false    204            4           0    0    especializacao_espe_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.especializacao_espe_id_seq', 2, true);
          public          postgres    false    202            5           0    0     funcionarios_id_funcionarios_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.funcionarios_id_funcionarios_seq', 1, true);
          public          postgres    false    196            6           0    0    horario_id_horario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.horario_id_horario_seq', 1, false);
          public          postgres    false    206            7           0    0    medicos_id_medico_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.medicos_id_medico_seq', 4, true);
          public          postgres    false    200            ?
           2606    24718    clientes clientes_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_clientes);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public            postgres    false    199            ?
           2606    32993    consultas consultas_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT consultas_pkey PRIMARY KEY (id_consulta);
 B   ALTER TABLE ONLY public.consultas DROP CONSTRAINT consultas_pkey;
       public            postgres    false    205            ?
           2606    24793 "   especializacao especializacao_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.especializacao
    ADD CONSTRAINT especializacao_pkey PRIMARY KEY (espe_id);
 L   ALTER TABLE ONLY public.especializacao DROP CONSTRAINT especializacao_pkey;
       public            postgres    false    203            ?
           2606    24710    funcionarios funcionarios_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id_funcionarios);
 H   ALTER TABLE ONLY public.funcionarios DROP CONSTRAINT funcionarios_pkey;
       public            postgres    false    197            ?
           2606    33018    horario horario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.horario
    ADD CONSTRAINT horario_pkey PRIMARY KEY (id_horario);
 >   ALTER TABLE ONLY public.horario DROP CONSTRAINT horario_pkey;
       public            postgres    false    207            ?
           2606    24757    medicos medicos_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT medicos_pkey PRIMARY KEY (id_medico);
 >   ALTER TABLE ONLY public.medicos DROP CONSTRAINT medicos_pkey;
       public            postgres    false    201            ?
           2606    24794    medicos fk_especializacao    FK CONSTRAINT     ?   ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT fk_especializacao FOREIGN KEY (espe_id) REFERENCES public.especializacao(espe_id);
 C   ALTER TABLE ONLY public.medicos DROP CONSTRAINT fk_especializacao;
       public          postgres    false    201    203    2713            ?
           2606    24719    clientes fk_funcionarios    FK CONSTRAINT     ?   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT fk_funcionarios FOREIGN KEY (funcionarios_idfuncionarios) REFERENCES public.funcionarios(id_funcionarios);
 B   ALTER TABLE ONLY public.clientes DROP CONSTRAINT fk_funcionarios;
       public          postgres    false    197    199    2707            ?
           2606    32999    consultas fk_medico    FK CONSTRAINT     }   ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_medico FOREIGN KEY (id_medico) REFERENCES public.medicos(id_medico);
 =   ALTER TABLE ONLY public.consultas DROP CONSTRAINT fk_medico;
       public          postgres    false    2711    205    201               7   x?3?4??M,?LT??/N?4?4??50?50?46?4?002?4426?t?????? t	?      #   w   x?uα?0???/A?iK?L֊??*Y3??????Dɋ?O:+?*??O???6??M??n+??????5????K??4? ;T??c??).L??(\?P????HH???}:": zB3m      !   -   x?3?tN,J????O?L?2?t?9?6/39Q???? ????? ??         ,   x?3?t+J?K?,N?W??/N??/H-JL?/?4426?????? ?(
N      %      x?????? ? ?         S   x??1
?  ?9yE^P??Nvt?J??5??u???]??-gxAj?ʔy?#B?????"???M?t?x??>m?s ???     