 #!/usr/bin/env bash

echo "***************************************************"
echo "Init in path for app: cd /app/web"

LINE_TO_ADD="cd /app/web"

check_if_line_exists()
{
    # grep wont care if one or both files dont exist.
    grep -qsFx "$LINE_TO_ADD" ~/.profile ~/.bash_profile
}

add_line_to_profile()
{
    profile=~/.profile
    [ -w "$profile" ] || profile=~/.bash_profile
    printf "%s\n" "$LINE_TO_ADD" >> "$profile"
}

check_if_line_exists || add_line_to_profile

echo 'OK'

echo "***************************************************"
echo "Set ruby version"
source $HOME/.rvm/scripts/rvm || source /etc/profile.d/rvm.sh
rvm use --default 2.4.2@global
rvm rvmrc warning ignore allGemfiles
echo "***************************************************"
echo 'OK'