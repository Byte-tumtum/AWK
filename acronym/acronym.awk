BEGIN {
  FS = "[ \t-]+"
}

{
    # 1. Remove all punctuation except whitespace and hyphens
    # This regex keeps alphanumeric characters, spaces, and hyphens
    gsub(/[^a-zA-Z0-9 \t-]/, "", $0)

    acronym = ""

    # 2. Iterate through each word (field)
    for (i = 1; i <= NF; i++) {
        # 3. Take the first character of the word and capitalize it
        if ($i != "") {
            acronym = acronym toupper(substr($i, 1, 1))
        }
    }

    print acronym
}


