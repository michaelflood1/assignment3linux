#!/bin/bash

set -euo pipefail

# this is the generate_index script
# you shouldn't have to edit this script

# Variables
KERNEL_RELEASE=$(uname -r)
OS_NAME=$(grep '^PRETTY_NAME' /etc/os-release | cut -d '=' -f2 | tr -d '"')
DATE=$(date +"%d/%m/%Y")
PACKAGE_COUNT=$(pacman -Q | wc -l)
OUTPUT_DIR="/var/lib/webgen/HTML"
OUTPUT_FILE="$OUTPUT_DIR/index.html"

# Ensure the target directory exists
if [[ ! -d "$OUTPUT_DIR" ]]; then
    echo "Error: Failed to create or access directory $OUTPUT_DIR." >&2
    exit 1
fi

# Create the index.html file
cat <<EOF > "$OUTPUT_FILE"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Information</title>
    <style>
        html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
        body {
            height: 100vh; 
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0; 
            display: flex; 
            overflow: hidden;
            justify-content: center; 
            align-items: center; 
        }

        .container {
            max-width: 200px; /* Set your desired width */
            padding: 20px;
            text-align: center;
            align-self: center;
            opacity: 0.8;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #4CAF50;
            text-align: center;
            font-size: 2.5em;
        }

        p {
            font-size: 1.2em;
            line-height: 1.5;
            margin: 10px 0;
        }

        strong {
            color: #007BFF;
        }


        .info-card {
            opacity: 0.8;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .info-card p {
            margin: 5px 0;
        }

        footer {
            text-align: center;
            margin-top: 40px;
            font-size: 0.9em;
            color: #777;
        }
        img {
            position: absolute;
            left: 0;
            top: 0;
            height: 100vh;
            width: 100vw;
            opacity: 0.7;
            z-index: -1;
            cursor:default;
            pointer-events: none;
            
        }

        .readme {
            max-height: 800px;
            max-width: 1000px; /* Set your desired width */
            
            
            opacity: 0.9;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

            
        }
       
    </style>
</head>
<body>
    <div class="container">
        <h1>System Information</h1>
        <div class="info-card">
            <p><strong>Kernel Release:</strong> $KERNEL_RELEASE</p>
            <p><strong>Operating System:</strong> $OS_NAME</p>
            <p><strong>Date:</strong> $DATE</p>
            <p><strong>Number of Installed Packages:</strong> $PACKAGE_COUNT</p>
            <a href=“https://github.com/michaelflood1/assignment3linux”>
        </div>
    </div>

    <div class="readme">
        <script src="https://gist.github.com/michaelflood1/6be9ac669189ab1d0a75089d27653546.js"></script>
    </div>

   

        <img src="https://media.tenor.com/Hoo34ly0rZwAAAAM/futurama-toad.gif" alt="gradesplz">
</body>
</html>
EOF

# Check if the file was created successfully
if [ $? -eq 0 ]; then
    echo "Success: File created at $OUTPUT_FILE."
else
    echo "Error: Failed to create the file at $OUTPUT_FILE." >&2
    exit 1
fi
