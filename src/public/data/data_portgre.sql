PGDMP  3                     |            web    16.2    16.2 +               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16398    web    DATABASE     ~   CREATE DATABASE web WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE web;
                postgres    false            �            1255    16451 %   restore_stock_quantity_for_products()    FUNCTION       CREATE FUNCTION public.restore_stock_quantity_for_products() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity + old.quantity
    WHERE product_id = old.product_id;
    
    RETURN old;
END;
$$;
 <   DROP FUNCTION public.restore_stock_quantity_for_products();
       public          postgres    false            �            1255    16449 "   restore_stock_quantity_for_sales()    FUNCTION     �   CREATE FUNCTION public.restore_stock_quantity_for_sales() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE sales
    SET quantity_sold = quantity_sold  + old.quantity
    WHERE product_id = old.product_id;
    
    RETURN old;
END;
$$;
 9   DROP FUNCTION public.restore_stock_quantity_for_sales();
       public          postgres    false            �            1255    16445 $   update_stock_quantity_for_products()    FUNCTION       CREATE FUNCTION public.update_stock_quantity_for_products() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
    
    RETURN NEW;
END;
$$;
 ;   DROP FUNCTION public.update_stock_quantity_for_products();
       public          postgres    false            �            1255    16447 !   update_stock_quantity_for_sales()    FUNCTION     �   CREATE FUNCTION public.update_stock_quantity_for_sales() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE sales
    SET quantity_sold = quantity_sold  - NEW.quantity
    WHERE product_id = NEW.product_id;
    
    RETURN NEW;
END;
$$;
 8   DROP FUNCTION public.update_stock_quantity_for_sales();
       public          postgres    false            �            1259    16433    orderdetail    TABLE     �   CREATE TABLE public.orderdetail (
    id integer NOT NULL,
    product_id integer,
    order_id integer,
    quantity integer,
    total_amout integer
);
    DROP TABLE public.orderdetail;
       public         heap    postgres    false            �            1259    16432    orderdetail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orderdetail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orderdetail_id_seq;
       public          postgres    false    222                       0    0    orderdetail_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orderdetail_id_seq OWNED BY public.orderdetail.id;
          public          postgres    false    221            �            1259    16400 	   portfolio    TABLE     e   CREATE TABLE public.portfolio (
    id_port integer NOT NULL,
    name_port character varying(50)
);
    DROP TABLE public.portfolio;
       public         heap    postgres    false            �            1259    16399    portfolio_id_port_seq    SEQUENCE     �   CREATE SEQUENCE public.portfolio_id_port_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.portfolio_id_port_seq;
       public          postgres    false    216                       0    0    portfolio_id_port_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.portfolio_id_port_seq OWNED BY public.portfolio.id_port;
          public          postgres    false    215            �            1259    16407    products    TABLE     7  CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100),
    description text,
    price numeric(10,2),
    stock_quantity integer,
    img_top character varying(100),
    img_mid character varying(100),
    img_bot character varying(100),
    id_port integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    16406    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          postgres    false    218                       0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          postgres    false    217            �            1259    16421    sales    TABLE     �   CREATE TABLE public.sales (
    sale_id integer NOT NULL,
    product_id integer,
    quantity_sold integer,
    sale_date date,
    discount double precision
);
    DROP TABLE public.sales;
       public         heap    postgres    false            �            1259    16420    sales_sale_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sales_sale_id_seq;
       public          postgres    false    220                       0    0    sales_sale_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;
          public          postgres    false    219            f           2604    16436    orderdetail id    DEFAULT     p   ALTER TABLE ONLY public.orderdetail ALTER COLUMN id SET DEFAULT nextval('public.orderdetail_id_seq'::regclass);
 =   ALTER TABLE public.orderdetail ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            c           2604    16403    portfolio id_port    DEFAULT     v   ALTER TABLE ONLY public.portfolio ALTER COLUMN id_port SET DEFAULT nextval('public.portfolio_id_port_seq'::regclass);
 @   ALTER TABLE public.portfolio ALTER COLUMN id_port DROP DEFAULT;
       public          postgres    false    216    215    216            d           2604    16410    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    218    217    218            e           2604    16424    sales sale_id    DEFAULT     n   ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);
 <   ALTER TABLE public.sales ALTER COLUMN sale_id DROP DEFAULT;
       public          postgres    false    220    219    220                      0    16433    orderdetail 
   TABLE DATA           V   COPY public.orderdetail (id, product_id, order_id, quantity, total_amout) FROM stdin;
    public          postgres    false    222   5                 0    16400 	   portfolio 
   TABLE DATA           7   COPY public.portfolio (id_port, name_port) FROM stdin;
    public          postgres    false    216   /5                 0    16407    products 
   TABLE DATA           �   COPY public.products (product_id, product_name, description, price, stock_quantity, img_top, img_mid, img_bot, id_port) FROM stdin;
    public          postgres    false    218   {5       
          0    16421    sales 
   TABLE DATA           X   COPY public.sales (sale_id, product_id, quantity_sold, sale_date, discount) FROM stdin;
    public          postgres    false    220   E6                  0    0    orderdetail_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orderdetail_id_seq', 1, false);
          public          postgres    false    221                       0    0    portfolio_id_port_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.portfolio_id_port_seq', 4, true);
          public          postgres    false    215                       0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 4, true);
          public          postgres    false    217                       0    0    sales_sale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sales_sale_id_seq', 1, false);
          public          postgres    false    219            n           2606    16438    orderdetail orderdetail_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.orderdetail
    ADD CONSTRAINT orderdetail_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.orderdetail DROP CONSTRAINT orderdetail_pkey;
       public            postgres    false    222            h           2606    16405    portfolio portfolio_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.portfolio
    ADD CONSTRAINT portfolio_pkey PRIMARY KEY (id_port);
 B   ALTER TABLE ONLY public.portfolio DROP CONSTRAINT portfolio_pkey;
       public            postgres    false    216            j           2606    16414    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    218            l           2606    16426    sales sales_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            postgres    false    220            r           2620    16452 .   orderdetail restore_stock_trigger_for_products    TRIGGER     �   CREATE TRIGGER restore_stock_trigger_for_products AFTER DELETE ON public.orderdetail FOR EACH ROW EXECUTE FUNCTION public.restore_stock_quantity_for_products();
 G   DROP TRIGGER restore_stock_trigger_for_products ON public.orderdetail;
       public          postgres    false    222    226            s           2620    16450 +   orderdetail restore_stock_trigger_for_sales    TRIGGER     �   CREATE TRIGGER restore_stock_trigger_for_sales AFTER DELETE ON public.orderdetail FOR EACH ROW EXECUTE FUNCTION public.restore_stock_quantity_for_sales();
 D   DROP TRIGGER restore_stock_trigger_for_sales ON public.orderdetail;
       public          postgres    false    225    222            t           2620    16446 -   orderdetail update_stock_trigger_for_products    TRIGGER     �   CREATE TRIGGER update_stock_trigger_for_products AFTER INSERT ON public.orderdetail FOR EACH ROW EXECUTE FUNCTION public.update_stock_quantity_for_products();
 F   DROP TRIGGER update_stock_trigger_for_products ON public.orderdetail;
       public          postgres    false    222    223            u           2620    16448 *   orderdetail update_stock_trigger_for_sales    TRIGGER     �   CREATE TRIGGER update_stock_trigger_for_sales AFTER INSERT ON public.orderdetail FOR EACH ROW EXECUTE FUNCTION public.update_stock_quantity_for_sales();
 C   DROP TRIGGER update_stock_trigger_for_sales ON public.orderdetail;
       public          postgres    false    222    224            q           2606    16439 '   orderdetail orderdetail_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderdetail
    ADD CONSTRAINT orderdetail_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 Q   ALTER TABLE ONLY public.orderdetail DROP CONSTRAINT orderdetail_product_id_fkey;
       public          postgres    false    4714    222    218            o           2606    16415    products products_id_port_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_id_port_fkey FOREIGN KEY (id_port) REFERENCES public.portfolio(id_port);
 H   ALTER TABLE ONLY public.products DROP CONSTRAINT products_id_port_fkey;
       public          postgres    false    218    216    4712            p           2606    16427    sales sales_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 E   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_product_id_fkey;
       public          postgres    false    220    218    4714                  x������ � �         <   x�3��8�)/]�;����.#�HS�1���p�r.N��r�2�nO����� �4         �   x�3�t�x�k�Bp~Z������B�/�Uy�{��_F��Uy�1~���&�@�g`�id����n_�_ a�f�@I�%��\F���6<�=7/]�/����H��2��eh�h3�f��(c.c���#�Z^��0�@#�یMAڍa�4�h10�h`����|4��޴��e�߬=... I�q
      
      x������ � �     