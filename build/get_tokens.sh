#!/bin/bash

# Configuration
API_URL="https://test.deribit.com/api/v2/public/auth"
CLIENT_ID="6AvPr_gn"
CLIENT_SECRET="CHM6Zs1IKZ_xp6l7yJGFD2g_hCqZ8uOSKh6_mv8iBDg"
GRANT_TYPE="client_credentials"

# Output file paths
BASE_DIR="/home/bhatideepak599/PROJECTS/GoQuantAssignment/Deribit_GoQuant/build"
ACCESS_TOKEN_FILE="$BASE_DIR/access_token.txt"
REFRESH_TOKEN_FILE="$BASE_DIR/refresh_token.txt"

# Ensure output directory exists
mkdir -p "$BASE_DIR"

# Make API request
response=$(curl -s -X GET "$API_URL?client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&grant_type=$GRANT_TYPE" \
    -H "Content-Type: application/json")

# Extract tokens using grep and sed
access_token=$(echo "$response" | grep -o '"access_token":"[^"]*' | sed 's/"access_token":"//')
refresh_token=$(echo "$response" | grep -o '"refresh_token":"[^"]*' | sed 's/"refresh_token":"//')

# Validate response and save tokens
if [[ -n "$access_token" && -n "$refresh_token" ]]; then
    echo "$access_token" > "$ACCESS_TOKEN_FILE"
    echo "$refresh_token" > "$REFRESH_TOKEN_FILE"
    echo "✅ Tokens saved successfully!"
else
    echo "❌ Error: Failed to retrieve tokens. Response:"
    echo "$response"
    exit 1
fi
`
