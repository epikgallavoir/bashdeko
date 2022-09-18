#!/bin/sh

# Legend:
# (A) - Database related operations
# (B) - Aliases related operations
# (C) - Strings related operations

root=$(pwd)

cd nedakoc/

# build
export DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet restore -f --no-cache
dotnet build nedakoc/src/NadekoBot/NadekoBot.csproj -c Release -o output/

# go back
cd "$root"

# move creds from old to new
mv -f nedakod_old/output/creds.yml nedakod/output/creds.yml 1>/dev/null 2>&1
# also copy credentials.json for migration purposes
mv -f nedakod_old/output/credentials.json nedakod/output/credentials.json 1>/dev/null 2>&1

# on update, strings will be new version, user will have to manually re-add his strings after each update
# as updates may cause big number of strings to become obsolete, changed, etc
# however, old user's strings will be backed up to strings_old

# (C) backup new strings to reverse rewrite
rm -rf nedakod/output/data/strings_new 1>/dev/null 2>&1
mv -fT nedakod/output/data/strings nedakod/output/data/strings_new 1>/dev/null 2>&1
# (C) delete old strings backup
rm -rf nedakod_old/output/data/strings_old 1>/dev/null 2>&1
rm -rf nedakod_old/output/data/strings_new 1>/dev/null 2>&1

# (B) backup new aliases to reverse rewrite
mv -f nedakod/output/data/aliases.yml nedakod/output/data/aliases_new.yml 1>/dev/null 2>&1

# (A) move old database
mv -f nedakod_old/output/data/NadekoBot.db nedakod/output/data/NadekoBot.db 1>/dev/null 2>&1

# move old data folder contents (and overwrite)
cp -RT nedakod_old/output/data/ nedakod/output/data 1>/dev/null 2>&1

# (B) backup old aliases
mv -f nedakod/output/data/aliases.yml nedakod/output/data/aliases_old.yml 1>/dev/null 2>&1
# (B) restore new aliases
mv -f nedakod/output/data/aliases_new.yml nedakod/output/data/aliases.yml 1>/dev/null 2>&1

# (C) backup old strings
mv -f nedakod/output/data/strings nedakod/output/data/strings_old 1>/dev/null 2>&1
# (C) restore new strings
mv -f nedakod/output/data/strings_new nedakod/output/data/strings 1>/dev/null 2>&1

rm "$root/rebuild.sh"
exit 0
