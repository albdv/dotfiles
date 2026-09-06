function unzipd --description "Unzip archive into a folder of the same name"
    for file in $argv
        if test -f $file
            set -l dest (string replace -r '\.zip$' '' $file)
            unzip -d $dest $file
        else
            echo "File not found: $file"
        end
    end
end

