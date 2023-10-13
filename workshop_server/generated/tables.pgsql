--
-- Class Cart as table cart
--

CREATE TABLE "cart" (
  "id" serial,
  "cartId" text NOT NULL,
  "userId" text NOT NULL,
  "productId" text NOT NULL,
  "productName" text NOT NULL,
  "quantity" integer NOT NULL,
  "totalAmount" double precision NOT NULL
);

ALTER TABLE ONLY "cart"
  ADD CONSTRAINT cart_pkey PRIMARY KEY (id);

CREATE INDEX cart_id_idx ON "cart" USING btree ("cartId");


--
-- Class Product as table product
--

CREATE TABLE "product" (
  "id" serial,
  "productId" text NOT NULL,
  "name" text NOT NULL,
  "image" text NOT NULL,
  "description" text NOT NULL,
  "price" double precision NOT NULL
);

ALTER TABLE ONLY "product"
  ADD CONSTRAINT product_pkey PRIMARY KEY (id);

CREATE INDEX product_id_idx ON "product" USING btree ("productId");


--
-- Class Users as table users
--

CREATE TABLE "users" (
  "id" serial,
  "userId" text NOT NULL,
  "name" text NOT NULL,
  "email" text NOT NULL,
  "password" text NOT NULL,
  "token" text NOT NULL
);

ALTER TABLE ONLY "users"
  ADD CONSTRAINT users_pkey PRIMARY KEY (id);

CREATE INDEX user_id_idx ON "users" USING btree ("userId");


