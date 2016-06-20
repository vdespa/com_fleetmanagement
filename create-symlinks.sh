#!/bin/bash

# Helper
check_symlink_valid () {
if [ ! -e $1 ]; then
  echo "=> Folder / file $1 doesn't exist. Aborting."
  exit 255;
else
    echo "=> Symlink $1 created.";
fi
}

#
# Configuration
#

# Define the component name
COMPONENT_NAME="com_fleetmanagement"
COMPONENT_NAME_WITHOUT_PREFIX="fleetmanagement"

# Save the source location
SOURCE_FULL="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE=$(python -c "import os.path; print os.path.relpath('$SOURCE_FULL', '.')")

# Define the Joomla root. Expects to be 3 levels below the bash script executed
JOOMLA_ROOT="$( cd "../../../$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
JOOMLA_ROOT=$(python -c "import os.path; print os.path.relpath('$JOOMLA_ROOT', '.')")

echo "---- Creating symlinks for $COMPONENT_NAME -----"

# Administrator files
JOOMLA_ADMIN_COMPONENT_SOURCE="$JOOMLA_ROOT/administrator/components/$COMPONENT_NAME"
JOOMLA_ADMIN_COMPONENTS="$JOOMLA_ROOT/administrator/components/"
SOURCE_RELATIVE_TO_JOOMLA_ADMIN=$(python -c "import os.path; print os.path.relpath('./admin', '$JOOMLA_ADMIN_COMPONENTS')")

rm -f $JOOMLA_ADMIN_COMPONENT_SOURCE
ln -s $SOURCE_RELATIVE_TO_JOOMLA_ADMIN $JOOMLA_ADMIN_COMPONENT_SOURCE
check_symlink_valid $JOOMLA_ADMIN_COMPONENT_SOURCE

# Site files
JOOMLA_SITE_COMPONENT_SOURCE="$JOOMLA_ROOT/components/$COMPONENT_NAME"
SOURCE_RELATIVE_TO_JOOMLA_SITE=$(python -c "import os.path; print os.path.relpath('./site', '$JOOMLA_ROOT/components')")

rm -f $JOOMLA_SITE_COMPONENT_SOURCE
ln -s $SOURCE_RELATIVE_TO_JOOMLA_SITE $JOOMLA_SITE_COMPONENT_SOURCE
check_symlink_valid $JOOMLA_SITE_COMPONENT_SOURCE

# Media
JOOMLA_MEDIA_COMPONENT_SOURCE="$JOOMLA_ROOT/media/$COMPONENT_NAME"
SOURCE_RELATIVE_TO_JOOMLA_MEDIA=$(python -c "import os.path; print os.path.relpath('./media', '$JOOMLA_ROOT/media')")

rm -f $JOOMLA_MEDIA_COMPONENT_SOURCE
ln -s $SOURCE_RELATIVE_TO_JOOMLA_MEDIA $JOOMLA_MEDIA_COMPONENT_SOURCE
check_symlink_valid $JOOMLA_MEDIA_COMPONENT_SOURCE

# Languages
JOOMLA_ADMIN_LANG1="$JOOMLA_ROOT/administrator/language/en-GB/en-GB.$COMPONENT_NAME.ini"
SOURCE_RELATIVE_TO_JOOMLA_ADMIN_LANG1=$(python -c "import os.path; print os.path.relpath('./admin/language/en-GB/en-GB.$COMPONENT_NAME.ini', '$JOOMLA_ROOT/administrator/language/en-GB')")

rm -f $JOOMLA_ADMIN_LANG1
ln -s $SOURCE_RELATIVE_TO_JOOMLA_ADMIN_LANG1 $JOOMLA_ADMIN_LANG1
check_symlink_valid $JOOMLA_ADMIN_LANG1


JOOMLA_SITE_LANG1="$JOOMLA_ROOT/language/en-GB/en-GB.$COMPONENT_NAME.ini"
SOURCE_RELATIVE_TO_JOOMLA_SITE_LANG1=$(python -c "import os.path; print os.path.relpath('./site/language/en-GB/en-GB.$COMPONENT_NAME.ini', '$JOOMLA_ROOT/language/en-GB')")

rm -f $JOOMLA_SITE_LANG1
ln -s $SOURCE_RELATIVE_TO_JOOMLA_SITE_LANG1 $JOOMLA_SITE_LANG1
check_symlink_valid $JOOMLA_SITE_LANG1

# Done.
echo "~~~ Finished creating symlinks ~~~"



