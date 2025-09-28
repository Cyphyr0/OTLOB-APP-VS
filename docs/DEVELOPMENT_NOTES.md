# Development Notes

## Package Migration Notes

### Google Sign-In Migration (v6 to v7)
- Version 7.x introduces significant API changes
- Key changes:
  - `GoogleSignIn()` constructor replaced with `GoogleSignIn.instance`
  - Authentication flow changes from `signIn()` to `authenticate()`
  - New authorization model using `authorizationClient`
  - Currently facing compatibility issues with the new API
  - **Decision**: Temporarily staying on v6.1.5 until better documentation/stability

### Package Version Updates (September 2025)
1. **Major Version Updates**:
   - flutter_bloc: 8.x → 9.x
   - bloc: 8.x → 9.x
   - go_router: 10.x → 16.x
   - location: 5.x → 8.x
   - get_it: 7.x → 8.x
   - flutter_dotenv: 5.x → 6.x

2. **SDK Requirements**:
   - Updated from `>=2.17.0 <3.0.0` to `>=3.0.0 <4.0.0`

## Common Issues & Solutions

### Google Sign-In Implementation (v6.1.5)
```dart
Future<void> signInWithGoogle() async {
  final googleUser = await _googleSignInClient.signIn();
  if (googleUser == null) {
    throw Exception('Google sign-in was cancelled');
  }
  
  final googleAuth = await googleUser.authentication;
  
  // Use these tokens for backend authentication
  final idToken = googleAuth.idToken;
  final accessToken = googleAuth.accessToken;
}
```

### Package Dependencies Resolution
- When facing dependency conflicts:
  1. Check `flutter pub outdated` for detailed version info
  2. Update SDK constraints first
  3. Update major versions one at a time
  4. Test thoroughly after each major update

## Testing Checklist

### After Package Updates
1. [ ] Google Sign-In flow
   - [ ] Sign in process
   - [ ] Token retrieval
   - [ ] Error handling
2. [ ] Navigation (go_router)
   - [ ] Route transitions
   - [ ] Deep linking
   - [ ] Navigation guards
3. [ ] Location Features
   - [ ] Permission handling
   - [ ] Location updates
   - [ ] Geocoding
4. [ ] State Management (bloc)
   - [ ] Event handling
   - [ ] State updates
   - [ ] Side effects

## Useful Commands

```bash
# Check outdated packages
flutter pub outdated

# Update packages within constraints
flutter pub upgrade

# Update to latest versions (may break constraints)
flutter pub upgrade --major-versions

# Run analyzer
flutter analyze

# Clean and rebuild
flutter clean
flutter pub get
```

---
Note: This document will be updated as we discover more useful information during development.