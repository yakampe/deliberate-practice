generate_md_table() {
    REPO_URL=$1
    SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
    TEMPLATE_DIR=$(dirname "$SCRIPT_DIR")/templates
    HISTORY_DIR=$(dirname "$SCRIPT_DIR")/data/history
    SUMMARY_FILE=$(dirname "$SCRIPT_DIR")/SUMMARY.MD


    total_practices=0
    completed_practices=0
    total_attempts=0

    # Buffer for the table content
    table_content=""

    options=($(find "$TEMPLATE_DIR" -maxdepth 1 -type d -print | sed "s|$TEMPLATE_DIR/||" | tail -n +2))
    for opt in "${options[@]}"
    do
        if [ -d "$HISTORY_DIR/$opt" ]; then
            tick="✔"
            completed_practices=$((completed_practices + 1))

            attempts=0
            timestamps=""
            for file in $(ls "$HISTORY_DIR/$opt"/*.md); do
                filename=$(basename "$file" .md)
                url="$REPO_URL/blob/main/data/history/$opt/$filename.md"
                timestamps+="$filename [🔗]($url)<br>"
                attempts=$((attempts + 1))
            done
            total_attempts=$((total_attempts + attempts))
        else
            timestamps=""
            tick="❌"
        fi

        total_practices=$((total_practices + 1))

        table_content+="$opt | $tick | $timestamps |\n"
    done

    percent=0
    attempts_per_practice=0
    if [ $total_practices -gt 0 ]; then
        percent=$((completed_practices * 100 / total_practices))
        if [ $completed_practices -gt 0 ]; then
            attempts_per_practice=$(awk "BEGIN {printf \"%.2f\", ${total_attempts}/${completed_practices}}")
        fi
    fi

    {
        echo "# Completion Summary <br>"
        echo "![Progress Bar](https://progress-bar.dev/$percent/?title=completion&width=400)"
        echo ""
        echo "![Practices Completed](https://img.shields.io/badge/practices_completed-$completed_practices%2F$total_practices-blue)"
        echo "![Average Attempts](https://img.shields.io/badge/average_attempts-$attempts_per_practice-green)"
        echo ""
        echo "<details><summary><b>Completion Table</b></summary><br>"
        echo ""
        echo "| Practice Name | Completed | Accepted Attempts |"
        echo "|---------------|:---------:|-------------------:|"
        echo -e "$table_content"
        echo "</details>"
    } > "$SUMMARY_FILE"

    echo "Summary table generated in $SUMMARY_FILE"
}
generate_md_table $1
