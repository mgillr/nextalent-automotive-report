# The Nextalent Automotive-Deep Tech Report

This repository contains the static HTML report for "Automotive-Deep Tech Crossroads 2025-2030: Strategic Advantage" by The Nextalent.

## Contents

- `automotive-deeptech-report.html` - The main HTML report file
- `assets/charts/` - Directory containing all chart images used in the report

## How to Deploy in Laravel

### Option 1: Serve as a Static HTML File (Recommended)

This approach preserves the exact HTML structure without any Laravel processing.

1. **Copy the HTML file to your Laravel public directory:**

```bash
# Create a reports directory in your Laravel public folder
mkdir -p /path/to/your/laravel/public/reports

# Copy the HTML file
cp automotive-deeptech-report.html /path/to/your/laravel/public/reports/automotive-deeptech-2025-2030.html
```

2. **Copy the assets directory:**

```bash
# Create the assets directory
mkdir -p /path/to/your/laravel/public/assets

# Copy the charts
cp -r assets/charts /path/to/your/laravel/public/assets/
```

3. **Access the report:**

The report will be available at:
```
https://thenextalent.com/reports/automotive-deeptech-2025-2030.html
```

### Option 2: Integrate as a Laravel Blade Template

If you need to add dynamic content or integrate with Laravel features:

1. **Create a new blade template:**

```bash
# Create a reports directory in your Laravel views folder
mkdir -p /path/to/your/laravel/resources/views/reports

# Copy the HTML content to a new blade file
cp automotive-deeptech-report.html /path/to/your/laravel/resources/views/reports/automotive-deeptech.blade.php
```

2. **Create a route in `routes/web.php`:**

```php
Route::get('/reports/automotive-deeptech-2025-2030', function () {
    return view('reports.automotive-deeptech');
});
```

3. **Copy the assets:**

```bash
mkdir -p /path/to/your/laravel/public/assets
cp -r assets/charts /path/to/your/laravel/public/assets/
```

## Customization

### Updating URLs

If you need to update the sharing URLs or other links in the report, search for:

- LinkedIn company URL: `https://www.linkedin.com/company/108364694`
- LinkedIn personal URL: `https://www.linkedin.com/in/ryang1983/`
- Email sharing links: `mailto:?subject=Automotive-Deep...`
- LinkedIn sharing links: `https://www.linkedin.com/sharing/share-offsite/...`

### Updating Content

The HTML file is well-structured and includes comments to help you identify different sections. Major sections include:

- Header section with title and sharing buttons
- Executive Summary
- Market Overview
- Talent Demand Forecast
- Deep Tech Integration
- Employer Strategies
- Conclusion
- References

## Technical Details

### External Dependencies

The report uses the following external resources:

- Google Fonts (Montserrat and Open Sans)
- Font Awesome 6.0.0-beta3 for icons

### Browser Compatibility

The report has been tested and works well in:
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Support

For any questions or issues, please contact info@thenextalent.com