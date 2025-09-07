# Laravel Installation Guide for The Nextalent Automotive Report

This guide provides detailed instructions for integrating the Automotive-Deep Tech report into your Laravel application.

## Prerequisites

- Laravel 8.0+ installed
- Basic knowledge of Laravel file structure
- Access to your server's file system

## Installation Steps

### Method 1: Static HTML File (Recommended)

This method serves the HTML file directly without Laravel processing, preserving the exact structure and appearance.

#### Step 1: Create the Directory Structure

```bash
# Navigate to your Laravel project root
cd /path/to/your/laravel/project

# Create the reports directory in public folder
mkdir -p public/reports

# Create the assets directory structure
mkdir -p public/assets/charts
```

#### Step 2: Copy the Files

```bash
# Copy the HTML file
cp /path/from/repo/automotive-deeptech-report.html public/reports/automotive-deeptech-2025-2030.html

# Copy all chart images
cp -r /path/from/repo/assets/charts/* public/assets/charts/
```

#### Step 3: Verify Installation

Access your report at:
```
https://yourdomain.com/reports/automotive-deeptech-2025-2030.html
```

### Method 2: Laravel Blade Template

Use this method if you need to add dynamic content or integrate with Laravel features.

#### Step 1: Create the Directory Structure

```bash
# Navigate to your Laravel project root
cd /path/to/your/laravel/project

# Create the reports directory in views folder
mkdir -p resources/views/reports

# Create the assets directory structure
mkdir -p public/assets/charts
```

#### Step 2: Copy the Files

```bash
# Copy the HTML file as a blade template
cp /path/from/repo/automotive-deeptech-report.html resources/views/reports/automotive-deeptech.blade.php

# Copy all chart images
cp -r /path/from/repo/assets/charts/* public/assets/charts/
```

#### Step 3: Create a Route

Add the following to your `routes/web.php` file:

```php
Route::get('/reports/automotive-deeptech-2025-2030', function () {
    return view('reports.automotive-deeptech');
});
```

#### Step 4: Verify Installation

Access your report at:
```
https://yourdomain.com/reports/automotive-deeptech-2025-2030
```

## Troubleshooting

### Images Not Loading

If images aren't loading correctly:

1. Check that all images were copied to the correct location
2. Verify file permissions (should be readable by web server)
3. Check for path issues in the HTML file

### 404 Errors

If you're getting 404 errors:

1. Make sure your web server is configured to serve the Laravel public directory
2. Check that the route is defined correctly (for blade template method)
3. Verify that the file exists in the expected location

### Styling Issues

If the report doesn't look right:

1. Make sure all external resources (fonts, CSS) are loading correctly
2. Check browser console for any errors
3. Verify that your server isn't blocking any external resources

## Advanced Configuration

### Custom Domain or Subdomain

To serve the report on a custom domain or subdomain:

1. Configure your web server (Apache/Nginx) to point to your Laravel public directory
2. Update your Laravel routes if necessary
3. Update any absolute URLs in the HTML file

### Caching

For better performance, consider adding caching headers:

```php
// In your routes/web.php for the blade template method
Route::get('/reports/automotive-deeptech-2025-2030', function () {
    return response()
        ->view('reports.automotive-deeptech')
        ->header('Cache-Control', 'public, max-age=86400');
});
```

For the static HTML method, add caching directives to your web server configuration.

## Security Considerations

The report is a static HTML file with no user input processing, so security risks are minimal. However:

1. Ensure your Laravel installation is up-to-date
2. Use HTTPS for all URLs
3. Keep your server and dependencies updated

## Support

For any issues or questions, please contact info@thenextalent.com