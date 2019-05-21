CONTAINER_NAME=app
PRE_CMD=docker-compose run ${CONTAINER_NAME} bundle exec hanami

# Precompile assets for deployment
assets_precompile:
	${PRE_CMD} assets precompile

# Starts Hanami console
console:
	${PRE_CMD} console

# Migrate, dump the SQL schema, and delete the migrations (experimental)
db_apply:
	${PRE_CMD} db apply

# Starts a database console
db_console:
	${PRE_CMD} db console

# Create the database (only for development/test)
db_create:
	${PRE_CMD} db create

# Drop the database (only for development/test)
db_drop:
	${PRE_CMD} db drop

# Migrate the database
db_migrate:
	@read -p "if you need migrete version input version: " version; \
	${PRE_CMD} db migrate $$version

# Drop, create, and migrate the database (only for development/test)
db_prepare:
	${PRE_CMD} db prepare

# Rollback migrations by steps
db_rollback:
	@read -p "if you need rollback steps input steps: " steps; \
	${PRE_CMD} db rollback $$steps

# Print the current migrated version
db_version:
	${PRE_CMD} db version

# Destroy an action from app
destroy_action:
	@read -p "input destroy action belong to app: " app; \
	@read -p "input destroy action : " action; \
	${PRE_CMD} destroy action $$app $$action

# Destroy an app
destroy_app:
	@read -p "input destroy app : " app; \
	${PRE_CMD} destroy app $app

# Destroy a mailer
destroy_mailer:
	@read -p "input destroy app : " mailer; \
	${PRE_CMD} destroy mailer $$mailer

# Destroy a migration
destroy_migration:
	@read -p "input destroy migration : " migration; \
	${PRE_CMD} destroy migration $$migration

# Destroy a model
destroy_model:
	@read -p "input destroy model : " model; \
	${PRE_CMD} destroy model $$model

# Generate an action for app
generate_action:
	@read -p "input generate action belong to app: " app; \
	@read -p "input generate action : " action; \
	${PRE_CMD} generate action $app $$action

# Generate an app
generate_app:
	@read -p "input generate app : " app; \
	${PRE_CMD} generate app $$app

# Generate a mailer
generate_mailer:
	@read -p "input generate mailer : " mailer; \
	${PRE_CMD} generate mailer $$mailer

# Generate a migration
generate_migration:
	@read -p "input generate migration : " migration; \
	${PRE_CMD} generate migration $$migration

# Generate a model
generate_model:
	@read -p "input generate model : " model; \
	${PRE_CMD} generate model $$model

# Generate session secret
generate_secret:
	@read -p "input generate secret app : " app; \
	${PRE_CMD} generate secret $$app

# Prints routes
routes:
	${PRE_CMD} routes

# Start Hanami server (only for development)
server:
	${PRE_CMD} server

# Print Hanami version
version:
	${PRE_CMD} version

ash:
	docker-compose run ${CONTAINER_NAME} -it /bin/ash
