#!/bin/bash

select_language() {
    template=$1
    echo "Please select a language you wish to use"

    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    PS3='Enter your choice as a number: '
    options=($(find "$SCRIPT_DIR/skeletons" -maxdepth 1 -type d -print | sed "s|$SCRIPT_DIR/skeletons/||" | tail -n +2))
    select opt in "${options[@]}"
     do
        if [ -n "$opt" ]; then
            echo "You selected '$opt', located at skeletons/$opt"
            create_branch_with_template "$template" "$opt"
            break
        else
            echo "Invalid option. Please try again."
        fi
    done

}

select_template() {
    echo "Please select a template folder from templates:"

    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    PS3='Enter your choice as a number: '
    options=($(find "$SCRIPT_DIR/templates" -maxdepth 1 -type d -print | sed "s|$SCRIPT_DIR/templates/||" | tail -n +2))
    select opt in "${options[@]}"
    do
        if [ -n "$opt" ]; then
            echo "You selected '$opt', located at templates/$opt"
            select_language $opt
            break
        else
            echo "Invalid option. Please try again."
        fi
    done
}

create_branch_with_template() {
    template=$1
    language=$2
    echo "Please enter a name for the new branch (this can be anything):"
    read branch_name

    # Check if the branch already exists
    if git rev-parse --verify "$template/$branch_name" > /dev/null 2>&1; then
        echo "Error: branch '$branch_name' already exists."
        exit 1
    else
        git checkout -b "$template/$branch_name"

        # Remove all contents except the 'templates' and 'skeleton' directory, the script and hidden files
        find . -mindepth 1 -maxdepth 1 ! -name 'templates' ! -name 'skeletons' ! -name '.git' ! -name '.idea' ! -name 'practice.sh' ! -name '.github'  ! -name '.gitignore' -exec rm -rf {} +

        # Copy the contents of the selected template into the project root
        cp -r "templates/$template/." .

        # Copy the contents of the selected template into the project root
        cp -r "skeletons/$language/." .

        # Remove the templates directory
        rm -rf templates

        # Remove the skeletons directory
        rm -rf skeletons

        # Add the new files to staging and commit
        git add .
        git commit -m "Initialize project with template: $template"
        echo "New branch '$branch_name' created with contents of template '$template'."
    fi
}

checkout_main() {
    git checkout main
    git pull origin main
    git clean -fdx
    echo "Switched to the main branch."
}

accept_changes() {
    current_branch=$(git branch --show-current)

    # Check if the current branch is 'main'. If so, exit the script.
    if [ "$current_branch" = "main" ]; then
        echo "Operation not permitted on the main branch."
        return 1 # Exit the function with an error status.
    fi

    new_branch="accepted/$current_branch"
    git checkout -b "$new_branch"

    # Assuming changes are already staged for commit
    git commit -m "Accepting changes from $current_branch"
    git push origin "$new_branch"

    echo "Changes accepted and pushed to $new_branch."
    echo "-----------------------------------"
    echo "-----------------------------------"
    echo "Waiting 30 seconds before returning you to the main branch to allow for github actions to execute"
    echo "If SUMMARY.md is not updated please check the github workflows and pull once the workflow has executed"
    echo "-----------------------------------"
    echo "-----------------------------------"
    sleep 30
    checkout_main
}

if [ "$#" -eq 1 ]; then
    case "$1" in
    "start")
        select_template
        ;;
    "main")
        checkout_main
        ;;
    "accept")
        accept_changes
        ;;
    *)
        echo "Invalid argument. Usage:"
        echo "./practice.sh start - Select a template"
        echo "./practice.sh main - Switch to the main branch"
        echo "./deliberate-practice.sh accept - Accept changes and push to a new branch"
        ;;
    esac
else
    echo "Usage:"
    echo "./practice.sh template - Select a template"
    echo "./practice.sh main - Switch to the main branch"
    echo "./practice.sh accept - Accept changes and push to a new branch"
fi