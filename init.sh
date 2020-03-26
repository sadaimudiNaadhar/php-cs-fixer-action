#!/bin/sh
php-cs-fixer fix . --dry-run -v --show-progress=dots --diff
