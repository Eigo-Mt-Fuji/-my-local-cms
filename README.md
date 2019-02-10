# MylocalCms

## [Gigalixir](https://gigalixir.readthedocs.io/en/latest/main.html#getting-started-guide)

```
sudo pip install gigalixir --ignore-installed six
gigalixir login
export APP_NAME=$(gigalixir create)
gigalixir apps
git remote add gigalixir https://efg.river%40gmail.com:be1b4906-3af2-4eee-8b3c-95e28a730336@git.gigalixir.com/grouchy-crowded-asianelephant.git
git fetch gigalixir
git checkout -b gigalixir
git push gigalixir HEAD:master
gigalixir pg:create --free
gigalixir config:set POOL_SIZE=2 # gigalixir free only allow 2 db connections at the same time.
gigalixir config:set PORT=4000
gigalixir config:set APP_NAME=$APP_NAME
gigalixir config:set SECRET_KEY_BASE=$(mix phx.gen.secret)
gigalixir config # expected configs above all key/value, and DATABASE_URL automatically generated by pg:create command.
gigalixir run mix ecto.migrate # make table
git push gigalixir HEAD:master # WITH clean cache option and force push, if needed: git -c http.extraheader="GIGALIXIR-CLEAN: true" push -f gigalixir HEAD:master
```

## Data Restore

```
pg_dump -h localhost -U postgres -d mylocal_cms_dev -a -F p > my_local_cms.dmp 
gigalixir pg
psql -h ${GIGALIXIR_DB_HOST} -U ${GIGALIXIR_DB_USERNAME} -d ${GIGALIXIR_DB_NAME} -f ./my_local_cms.dmp # input password , ignore duplicate key value violates unique constraint "schema_migrations_pkey
```

## Basic

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
