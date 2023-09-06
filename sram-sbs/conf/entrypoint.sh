#!/bin/sh
# Do things we need to do before running CMD
ln -s /opt/config/config.yml      /opt/sbs/server/config/config.yml
rm -f /opt/sbs/server/migrations/alembic.ini
ln -s /opt/config/alembic.ini     /opt/sbs/server/migrations/alembic.ini
ln -s /opt/config/saml            /opt/sbs/server/config/saml
ln -s /opt/config/disclaimer.css  /opt/sbs/client/build/static/disclaimer.css

# Hand off to the CMD
exec $@
