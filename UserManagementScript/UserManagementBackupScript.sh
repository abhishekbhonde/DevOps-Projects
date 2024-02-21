## THIS IS A SCRIPT FOR THE USER MANAGEMENT.


#!/bin/bash

# User Management and Backup Script

# Functions
add_user() {
    read -p "Enter username: " username
    echo "DEBUG: You entered username: $username"
    sudo useradd $username
    echo "User $username added successfully."
}


delete_user() {
    read -p "Enter username to delete: " username
    sudo userdel -r $username
    echo "User $username deleted successfully."
}

modify_user() {
    read -p "Enter username to modify: " username
    sudo usermod -aG sudo $username  # Add user to sudo group as an example
    echo "User $username modified successfully."
}

create_backup() {
    read -p "Enter backup destination directory: " backup_dir
    backup_filename="backup_$(date +'%Y%m%d_%H%M%S').tar.gz"
    sudo tar -czvf $backup_dir/$backup_filename /etc /home  # Customize directories to backup
    echo "Backup created successfully: $backup_dir/$backup_filename"
}

# Main Menu
while true; do
    echo "1. Add User"
    echo "2. Delete User"
    echo "3. Modify User"
    echo "4. Create Backup"
    echo "5. Exit"
    
    read -p "Enter your choice (1-5): " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) modify_user ;;
        4) create_backup ;;
        5)
            echo "Exiting script. Goodbye!"
            exit 0
            ;;
        *) echo "Invalid choice. Please enter a number between 1 and 5." ;;
    esac
done
