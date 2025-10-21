# Calley - Automatic Call Dialer Mobile App

A Flutter-based mobile application for the Calley Automatic Call Dialer system.

## Features

- ✅ User Registration with Email
- ✅ Email OTP Verification
- ✅ User Login
- ✅ Dashboard with Call Lists
- ✅ Call Statistics with Interactive Pie Chart
- ✅ Side Menu Navigation
- ✅ Complete API Integration

## Setup Instructions

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Android Studio or VS Code
- Android device or emulator
- Git

### Step 1: Clone or Create Project

```bash
# Create new Flutter project
flutter create calley_app
cd calley_app
```

### Step 2: Replace Files

Replace the following files with the provided code:

1. **lib/main.dart** - Main application code
2. **pubspec.yaml** - Dependencies file
3. **android/app/src/main/AndroidManifest.xml** - Android permissions

### Step 3: Install Dependencies

```bash
flutter pub get
```

### Step 4: Run the Application

```bash
# For Android device/emulator
flutter run

# For release build
flutter build apk --release
```

The release APK will be generated at: `build/app/outputs/flutter-apk/app-release.apk`

## Project Structure

```
lib/
└── main.dart                    # Complete app with all screens
    ├── LanguageSelectionScreen  # Language selection (English only)
    ├── RegisterScreen           # User registration
    ├── OtpVerificationScreen    # Email OTP verification
    ├── LoginScreen              # User login
    ├── WelcomeScreen            # Welcome with YouTube placeholder
    ├── DashboardScreen          # Main dashboard
    ├── CallStatsScreen          # Call statistics with pie chart
    └── AppDrawer                # Side navigation menu
```

## API Endpoints Used

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/api/auth/register` | POST | Register new user |
| `/api/auth/send-otp` | POST | Send OTP to email |
| `/api/auth/verify-otp` | POST | Verify OTP code |
| `/api/auth/login` | POST | User login |
| `/api/list?userId=` | GET | Get user's call lists |
| `/api/list/{listId}` | GET | Get call statistics |

Base URL: `https://mock-api.calleyacd.com`

## Flow Diagram

```
Language Selection
    ↓
Register (username, email, password)
    ↓
OTP Verification (email)
    ↓
Login (email, password)
    ↓
Welcome Screen (YouTube placeholder)
    ↓
Dashboard
    ↓
Select Test List (bottom sheet)
    ↓
Call Statistics (pie chart with pending/called/rescheduled)
```

## Building APK

### Debug APK
```bash
flutter build apk --debug
```

### Release APK
```bash
flutter build apk --release
```

The APK will be located at: `build/app/outputs/flutter-apk/app-release.apk`

### Build App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

## Testing

### Test Credentials

You can use any email for testing:
- Username: TestUser
- Email: test@yopmail.com
- Password: 123

The OTP will be sent to the email. Check your email for the 6-digit code.

## Video Demo

To create a video demo:

1. Install the app on your Android phone
2. Use screen recording software (built-in Android screen recorder)
3. Record the following flow:
   - Language selection
   - Registration
   - OTP verification
   - Login
   - Welcome screen
   - Dashboard
   - Opening bottom sheet
   - Viewing call statistics with pie chart

## Deliverables Checklist

- ✅ **Video of app running on Android phone** (record using screen recorder)
- ✅ **Debug APK** (`build/app/outputs/flutter-apk/app-debug.apk`)
- ✅ **Source code on GitHub** (create repository and push code)

## GitHub Setup

```bash
# Initialize git repository
git init

# Add files
git add .

# Commit
git commit -m "Initial commit - Calley App"

# Add remote (create repository on GitHub first)
git remote add origin https://github.com/yourusername/calley-app.git

# Push to GitHub
git branch -M main
git push -u origin main

# Add collaborator (info@cstech.in) in GitHub repository settings
```

## Dependencies

- **http**: ^1.1.0 - HTTP requests for API calls
- **shared_preferences**: ^2.2.2 - Local data storage
- **fl_chart**: ^0.65.0 - Pie chart visualization

## Troubleshooting

### Common Issues

**Issue**: "Failed to connect to API"
- **Solution**: Check internet connection and ensure device can access the API URL

**Issue**: "Build failed"
- **Solution**: Run `flutter clean` then `flutter pub get`

**Issue**: "OTP not received"
- **Solution**: Check email spam folder or use resend OTP option

**Issue**: "App crashes on startup"
- **Solution**: Ensure all dependencies are installed with `flutter pub get`

## Support

For any issues or questions, contact: info@cstech.in

## License

This project is proprietary software developed for Calley ACD.

---

**Version**: 1.0.1+52  
**Last Updated**: 2025