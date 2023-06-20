# NEXTJS

npx create-next-app@latest

- to run:
  npm run dev

# PRISMA

npm install prisma --save-dev
npx prisma init --datasource-provider mysql

### INTROESPECT EXISTING DB ( PREVIUSLY CREATED MANUALLY OR BY SCRIPT)

https://www.prisma.io/docs/getting-started/setup-prisma/add-to-existing-project/relational-databases/introspection-typescript-postgresql

- command : npx prisma db pull

## STUDIO BROWSWER

npx prisma studio

# CLIENTE PARA NODE (REACT, NEXT.JS ...)

npm install @prisma/client  
npx prisma generate ( genera el cliente correspondiente con la conexion del schema)

ESTA NOSE
npm install -D @prisma/client
