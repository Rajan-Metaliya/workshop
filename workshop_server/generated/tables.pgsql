--
-- Class Cart as table cart
--

CREATE TABLE "cart" (
  "id" serial,
  "userId" integer NOT NULL,
  "productId" integer NOT NULL,
  "productName" text NOT NULL,
  "quantity" integer NOT NULL,
  "totalAmount" double precision NOT NULL
);

ALTER TABLE ONLY "cart"
  ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- Class Product as table product
--

CREATE TABLE "product" (
  "id" serial,
  "name" text NOT NULL,
  "image" text NOT NULL,
  "description" text NOT NULL,
  "price" double precision NOT NULL
);

ALTER TABLE ONLY "product"
  ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Class Users as table users
--

CREATE TABLE "users" (
  "id" serial,
  "name" text NOT NULL,
  "email" text NOT NULL,
  "password" text NOT NULL,
  "token" text NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);


