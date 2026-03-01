# OHWR Mobile - Flutter App Architecture Guide

## 🎯 Quick Start

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Check code quality
flutter analyze
```

---

## 📚 Project Overview

This is a production-ready Flutter mobile application converted from a React Figma prototype. It's a solar energy management system with:

- **Real-time monitoring** of system performance
- **AI-powered optimization** recommendations
- **Alert management** with severity levels
- **Performance reports** and analytics
- **Bottom navigation** with 5 main screens

**No hardcoded values | Clean architecture | Null-safe | Responsive design**

---

## 🏗️ Folder Structure Explanation

### `lib/core/`
**Purpose:** Shared business logic and configuration

```
core/
├── theme/
│   └── app_theme.dart              # Colors, fonts, component styles
└── models/
    ├── navigation_tab.dart         # Screen routing enum
    ├── realtime_data.dart          # System metrics model
    ├── recommendation.dart         # AI recommendation model
    └── report.dart                 # Monthly report model
```

**Key Concept:** Models contain **data structure + mock data generator**
- No business logic in UI widgets
- Models are easily replaceable with API calls
- Mock constructors enable testing

---

### `lib/features/`
**Purpose:** Screen-specific code (one folder = one screen)

```
features/
├── dashboard/                      # Overview screen
├── monitoring/                     # Real-time metrics screen
├── optimization/                   # AI recommendations screen
├── alerts/                         # Alert management screen
└── reports/                        # Performance reports screen
```

**Why this structure?**
- Easy to find code for specific screens
- Scales well as app grows
- Clear responsibility separation

---

### `lib/shared/widgets/`
**Purpose:** Reusable UI components used across multiple screens

```
shared/
└── widgets/
    ├── metric_card.dart            # Value + trend display
    ├── status_badge.dart           # Animated status indicator
    ├── screen_header.dart          # Gradient header (appears on all screens)
    ├── gauge_indicator.dart        # Progress gauge
    ├── ai_insight_card.dart        # Recommendation card
    ├── bottom_navigation.dart      # Tab navigation
    └── main_app_shell.dart         # Navigation routing
```

**Golden Rule:** If a widget appears on 2+ screens, put it in `shared/`

---

## 🎨 Using AppTheme

All colors and fonts are centralized in `core/theme/app_theme.dart`:

```dart
// ✅ CORRECT - Uses theme
Text(
  'Production',
  style: TextStyle(
    color: AppTheme.textDark,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
)

// ❌ WRONG - Hardcoded color
Text(
  'Production',
  style: TextStyle(color: Color(0xFF1E293B)),
)
```

**Available tokens:**
- Colors: `primaryBlue`, `emeraldGreen`, `warningOrange`, `criticalRed`, `textDark`, `textMedium`, `bgWhite`, `bgLight`
- Fonts: Use `Theme.of(context).textTheme.headlineSmall` etc.

---

## 🧩 Creating Reusable Widgets

### Step 1: Identify repeated patterns
```dart
// ❌ Repeated across multiple screens
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: AppTheme.bgWhite,
    border: Border.all(color: Color(0xFFE2E8F0)),
    borderRadius: BorderRadius.circular(16),
  ),
  child: Column(...),
)
```

### Step 2: Extract to widget
```dart
// ✅ In lib/shared/widgets/my_card.dart
class MyCard extends StatelessWidget {
  final Widget child;
  const MyCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.bgWhite,
        border: Border.all(color: Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
```

### Step 3: Reuse everywhere
```dart
MyCard(
  child: Text('Content'),
)
```

---

## 📊 Working with Models

### Creating a Model with Mock Data

```dart
// lib/core/models/my_model.dart
class MyData {
  final String name;
  final double value;
  
  const MyData({
    required this.name,
    required this.value,
  });
  
  // Mock data generator
  static MyData getMockData() {
    return const MyData(
      name: 'Sample',
      value: 42.0,
    );
  }
}
```

### Using in Screen

```dart
// lib/features/my_feature/my_feature_screen.dart
class MyFeatureScreen extends StatefulWidget {
  @override
  State<MyFeatureScreen> createState() => _MyFeatureScreenState();
}

class _MyFeatureScreenState extends State<MyFeatureScreen> {
  late MyData _data;

  @override
  void initState() {
    super.initState();
    // Start with mock data
    _data = MyData.getMockData();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_data.name);
  }
}
```

### Later: Replace Mock Data with API

```dart
@override
void initState() {
  super.initState();
  // Replace with real API call
  _data = await _apiService.fetchData();
}
```

---

## 🔄 Navigation Flow

The app uses simple imperative navigation via `MainAppShell`:

```dart
// lib/shared/widgets/main_app_shell.dart
class MainAppShell extends StatefulWidget {
  final Widget Function(NavigationTab) screenBuilder;
  
  // When user taps a nav item, setState rebuilds with new screen
}
```

**To add a new screen:**

1. Create `lib/features/my_screen/my_screen.dart`
2. Add to `NavigationTab` enum in `core/models/navigation_tab.dart`
3. Add case in `main.dart` `_buildScreen()` method
4. Add nav item in `bottom_navigation.dart`

---

## ✨ Component Guidelines

### MetricCard - For Displaying Values
```dart
MetricCard(
  label: 'Solar Production',
  value: '34.6',
  unit: 'kWh',
  icon: Icons.wb_sunny,
  iconColor: Colors.amber,
  variant: MetricVariant.success,
  trend: (value: 8.2, isPositive: true), // Optional
)
```

**Use when:** You need to display a single metric with optional trend

---

### StatusBadge - For Status Indicators
```dart
StatusBadge(
  status: AlertStatus.healthy,
  animate: true, // Optional pulsing animation
)
```

**Use when:** You need a small status indicator (8x8 dot + label)

---

### ScreenHeader - For All Screens
```dart
ScreenHeader(
  title: 'My Screen',
  subtitle: 'Subtitle text',
  leadingIcon: Icons.star,
  backgroundColor: AppTheme.primaryBlue,
  showGradient: true,
)
```

**Use when:** Every screen needs a consistent header. Appears at top.

---

### GaugeIndicator - For Progress/Percentage
```dart
GaugeIndicator(
  label: 'Battery Charge',
  value: '85',
  unit: '%',
  percentage: 85,
  status: 'optimal', // 'optimal', 'warning', 'critical'
)
```

**Use when:** You need to show progress/percentage with visual gauge

---

### AIInsightCard - For Recommendations
```dart
AIInsightCard(
  title: 'Adjust Battery',
  description: 'Based on forecast...',
  impact: '+R45 savings',
  category: 'battery', // 'battery', 'solar', 'grid', 'efficiency'
  priority: 'high', // 'high', 'medium', 'low'
  onTap: () => {},
)
```

**Use when:** Showing actionable AI recommendations

---

## 📱 Responsive Design

The app is mobile-first. All screens use:

- **Fixed width content:** `Padding(padding: EdgeInsets.symmetric(horizontal: 16))`
- **ListViews for scrolling:** Prevents overflow on small screens
- **Flexible/Expanded for layouts:** Adapts to screen size
- **SizedBox for spacing:** All multiples of 4px

**Test on different screen sizes:**
```bash
flutter devices  # List available devices
flutter run -d <device_id>
```

---

## 🐛 Debugging Tips

### See widget boundaries
```dart
// In main.dart, add to MaterialApp
debugShowCheckedModeBanner: false,
debugShowMaterialGrid: true, // Shows grid
```

### Hot Reload vs Hot Restart
```bash
# Hot Reload (keeps state) - fails if models change
r

# Hot Restart (rebuilds everything) - use after model changes
R
```

### Common Issues

| Problem | Solution |
|---------|----------|
| Text overflowing | Wrap in Expanded or use `maxLines: 2; overflow: ellipsis` |
| Widget not updating | Use `setState()` or check if using `const` for mutable widgets |
| Layout breaking | Add constraints with `SizedBox` or `Expanded` |
| Colors wrong | Check `AppTheme` - never use `Color(0xFF...)` directly |

---

## 🧪 Testing

### Running Tests
```bash
flutter test

# Single test file
flutter test test/widget_test.dart

# With coverage
flutter test --coverage
```

### Writing Tests

```dart
// lib/features/dashboard/dashboard_screen_test.dart
void main() {
  testWidgets('Dashboard renders without error', (tester) async {
    await tester.pumpWidget(const OhwrMobileApp());
    expect(find.byType(DashboardScreen), findsOneWidget);
  });
}
```

---

## 📈 Performance Optimization

### Key Practices

1. **Use `const` constructors** - Prevents unnecessary rebuilds
   ```dart
   const MetricCard(...) // Good
   MetricCard(...)       // Rebuilds every time
   ```

2. **Extract child widgets** - Limits rebuild scope
   ```dart
   // ❌ Rebuilds entire Column
   Column(children: [ExpensiveWidget()])
   
   // ✅ Only ExpensiveWidget rebuilds
   class MyWidget extends StatelessWidget {
     build() => ExpensiveWidget();
   }
   Column(children: [MyWidget()])
   ```

3. **Use PageView for screen transitions** - Maintains state
   ```dart
   PageView(
     children: [Screen1(), Screen2()],
   )
   ```

4. **Lazy load data** - Don't load everything at once
   ```dart
   ListView.builder(
     itemBuilder: (context, index) => Item(index),
   )
   ```

---

## 🚀 Deployment Checklist

- [ ] All `flutter analyze` errors fixed
- [ ] All UI tested on small (320px) and large (600px) screens
- [ ] Mock data replaced with real API calls
- [ ] Error handling added for network failures
- [ ] Analytics events tracked
- [ ] Push notifications working
- [ ] Local data persisted (if needed)
- [ ] App icon and splash screen updated
- [ ] Signing keys configured
- [ ] Version bumped in `pubspec.yaml`

---

## 📞 Common Commands

```bash
# Setup
flutter pub get
flutter pub outdated

# Development
flutter run
flutter run -v  # Verbose
flutter run -d web  # Run on web

# Quality
flutter analyze
flutter format lib/
flutter test

# Deployment
flutter build apk
flutter build ios
flutter pub publish
```

---

## 🔗 Resources

- [Flutter Docs](https://flutter.dev/docs)
- [Material Design](https://material.io/design)
- [Dart Language](https://dart.dev)
- [Flutter Widget Catalog](https://flutter.dev/docs/development/ui/widgets)

---

**Questions? Check the code comments or run `flutter doc <ClassName>`**

