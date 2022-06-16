#!/bin/bash

# help menu: 
# -h print the help menu
# -o output file name and directory
# -h get the host name
# -i the key/ permission file
# -k password for become/sudo user


################################################################################
################################################################################
################################################################################

################################################################################
# Help                                                                         #
################################################################################
Help()
{
   # Display Help
   echo "Automate the check for CloudSight server"
   echo
   echo "Syntax: ./execute_automate.sh [-h|-d]"
   echo "options:"
   echo "h     Print this Help."
   echo "d     With database for security."
   echo
}

################################################################################
################################################################################
# Main program                                                                 #
################################################################################
################################################################################
################################################################################
# Process the input options. Add options as needed.                            #
################################################################################
# Get the options

#default values: 
systemctl stop kamailio
use_database=0

while getopts ':h:d' OPTION; do
    case "$OPTION" in
        h)
            # Print username
            Help
            exit 1 ;;
        d)
            # Get the password
            use_database=1 ;;
        *)
            # Print helping message for providing wrong options
            Help >&2
            # Terminate from the script
            exit 1 ;;
    esac
done


if [[ $use_database -eq 0 ]]
    then
        cp kamailio.cfg /etc/kamailio/kamailio.cfg
        cp kamctlrc /etc/kamailio/kamctlrc
    else 
        cp kamailio_database.cfg /etc/kamailio/kamailio.cfg
        cp kamctlrc_database /etc/kamailio/kamctlrc
fi

systemctl start kamailio
systemctl status kamailio

