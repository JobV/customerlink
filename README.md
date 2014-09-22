# Customerlink

[ ![Codeship Status for JobV/customerlink](https://www.codeship.io/projects/4a525530-2479-0132-1117-12e55c6fdf6c/status)](https://www.codeship.io/projects/36867)

All rights reserved, Job van der Voort

# Development

### 1. Work in a feature branch

1. `git checkout -b featurename`
2. push your branch to github and create a pull request once done
3. assign the pull request to someone to review it

### 2. Use TDD

1. write a failing test
2. write the code to make the test pass
3. refactor your code
4. rinse and repeat

### 3. Be efficient

- if you get stuck, ask someone to help you
- be reasonable. We're not striving for 100% test coverage
- Tests do not need to be super fast, but try not to do the same thing 10x
- work on something that you feel comfortable doing, if it's too hard, ask for help

# Dependencies

- Ruby 2.1.2 or higher
- Postgres 9.3 or higher

To get Postgres (9.3) running on Mac:
- Install postgres.app from http://postgresapp.com/
- run `gem install pg -- --with-pg-config=/Applications/Postgres.app/Contents/Versions/9.3/bin/pg_config`
- open psql command line (from the app)
- run `CREATE USER job SUPERUSER;`
- from your shell command line run `bin/rake db:create db:migrate`

# Tests

`bundle exec guard`
