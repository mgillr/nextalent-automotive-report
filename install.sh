#!/bin/bash

# The Nextalent Automotive Report Installation Script
# This script installs the Automotive-Deep Tech report into a Laravel application

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if a Laravel project path was provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide the path to your Laravel project.${NC}"
    echo "Usage: ./install.sh /path/to/your/laravel/project [static|blade]"
    exit 1
fi

LARAVEL_PATH=$1
INSTALL_TYPE=${2:-static}

# Validate the Laravel path
if [ ! -d "$LARAVEL_PATH" ]; then
    echo -e "${RED}Error: The directory $LARAVEL_PATH does not exist.${NC}"
    exit 1
fi

if [ ! -f "$LARAVEL_PATH/artisan" ]; then
    echo -e "${RED}Error: The directory $LARAVEL_PATH does not appear to be a Laravel project.${NC}"
    exit 1
fi

echo -e "${GREEN}Installing The Nextalent Automotive Report...${NC}"

# Get the script directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ "$INSTALL_TYPE" = "static" ]; then
    echo -e "${YELLOW}Installing as static HTML file...${NC}"
    
    # Create directories
    mkdir -p "$LARAVEL_PATH/public/reports"
    mkdir -p "$LARAVEL_PATH/public/assets/charts"
    
    # Copy files
    cp "$SCRIPT_DIR/automotive-deeptech-report.html" "$LARAVEL_PATH/public/reports/automotive-deeptech-2025-2030.html"
    cp -r "$SCRIPT_DIR/assets/charts/"* "$LARAVEL_PATH/public/assets/charts/"
    
    echo -e "${GREEN}Installation complete!${NC}"
    echo -e "The report is now available at: ${YELLOW}https://yourdomain.com/reports/automotive-deeptech-2025-2030.html${NC}"
    
elif [ "$INSTALL_TYPE" = "blade" ]; then
    echo -e "${YELLOW}Installing as Laravel Blade template...${NC}"
    
    # Create directories
    mkdir -p "$LARAVEL_PATH/resources/views/reports"
    mkdir -p "$LARAVEL_PATH/public/assets/charts"
    
    # Copy files
    cp "$SCRIPT_DIR/automotive-deeptech-report.html" "$LARAVEL_PATH/resources/views/reports/automotive-deeptech.blade.php"
    cp -r "$SCRIPT_DIR/assets/charts/"* "$LARAVEL_PATH/public/assets/charts/"
    
    # Check if routes/web.php exists
    if [ -f "$LARAVEL_PATH/routes/web.php" ]; then
        # Add route to web.php if it doesn't already exist
        if ! grep -q "reports/automotive-deeptech-2025-2030" "$LARAVEL_PATH/routes/web.php"; then
            echo "
// The Nextalent Automotive Report Route
Route::get('/reports/automotive-deeptech-2025-2030', function () {
    return view('reports.automotive-deeptech');
});" >> "$LARAVEL_PATH/routes/web.php"
            echo -e "${GREEN}Route added to routes/web.php${NC}"
        else
            echo -e "${YELLOW}Route already exists in routes/web.php${NC}"
        fi
    else
        echo -e "${RED}Warning: Could not find routes/web.php. You will need to add the route manually.${NC}"
    fi
    
    echo -e "${GREEN}Installation complete!${NC}"
    echo -e "The report is now available at: ${YELLOW}https://yourdomain.com/reports/automotive-deeptech-2025-2030${NC}"
    
else
    echo -e "${RED}Error: Invalid installation type. Use 'static' or 'blade'.${NC}"
    echo "Usage: ./install.sh /path/to/your/laravel/project [static|blade]"
    exit 1
fi

echo -e "\n${GREEN}Thank you for using The Nextalent Automotive Report!${NC}"
echo -e "For more information, please refer to the README.md and LARAVEL_INSTALLATION.md files."