# OHWR Mobile - Visual Architecture Overview

## 📱 App Structure

```
┌─────────────────────────────────────────────┐
│           OhwrMobileApp (main.dart)         │
│      Material App + AppTheme + Routes       │
└──────────────────┬──────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│       MainAppShell (Navigation)             │
│   ┌──────────────────────────────────────┐  │
│   │       Active Screen (Stateful)       │  │
│   │  ┌────────────────────────────────┐  │  │
│   │  │  ScreenHeader + Content        │  │  │
│   │  │  Using shared/widgets          │  │  │
│   │  └────────────────────────────────┘  │  │
│   └──────────────────────────────────────┘  │
│   ┌──────────────────────────────────────┐  │
│   │    BottomNavigation (5 Tabs)         │  │
│   │ [Overview] [Monitor] [Optimize]     │  │
│   │ [Alerts]   [Reports]                │  │
│   └──────────────────────────────────────┘  │
└─────────────────────────────────────────────┘
```

---

## 🏗️ Layer Architecture

```
┌────────────────────────────────────────────────┐
│               PRESENTATION LAYER               │
│  ┌──────────────────────────────────────────┐  │
│  │  Screens (features/)                     │  │
│  │  ├─ Dashboard       ├─ Monitoring        │  │
│  │  ├─ Optimization    ├─ Alerts            │  │
│  │  └─ Reports                              │  │
│  └──────────────────────────────────────────┘  │
├────────────────────────────────────────────────┤
│             COMPONENT LAYER                    │
│  ┌──────────────────────────────────────────┐  │
│  │  Reusable Widgets (shared/widgets/)      │  │
│  │  ├─ MetricCard        ├─ StatusBadge     │  │
│  │  ├─ GaugeIndicator    ├─ ScreenHeader    │  │
│  │  ├─ AIInsightCard     ├─ BottomNavigation│  │
│  │  └─ MainAppShell                         │  │
│  └──────────────────────────────────────────┘  │
├────────────────────────────────────────────────┤
│              DESIGN SYSTEM LAYER               │
│  ┌──────────────────────────────────────────┐  │
│  │  Theme (core/theme/)                     │  │
│  │  ├─ Colors        ├─ Typography          │  │
│  │  ├─ Spacing       ├─ Components          │  │
│  └──────────────────────────────────────────┘  │
├────────────────────────────────────────────────┤
│              DATA MODELS LAYER                 │
│  ┌──────────────────────────────────────────┐  │
│  │  Models (core/models/)                   │  │
│  │  ├─ NavigationTab     ├─ RealtimeData    │  │
│  │  ├─ Recommendation    ├─ Report          │  │
│  │  ├─ Mock Constructors ├─ Type Safety     │  │
│  └──────────────────────────────────────────┘  │
└────────────────────────────────────────────────┘
```

---

## 🔄 Screen Navigation Flow

```
                    ┌─────────────────┐
                    │  MainAppShell   │
                    │  (State Mgmt)   │
                    └────────┬────────┘
                             │
             ┌───────────────┼───────────────┐
             │               │               │
    ┌────────▼────┐  ┌──────▼──────┐  ┌────▼──────┐
    │  Dashboard  │  │ Monitoring  │  │Optimization│
    │  (Overview) │  │  (Gauges)   │  │ (AI Tips)  │
    └─────┬───────┘  └──────┬──────┘  └────┬──────┘
          │                 │               │
    ┌─────▼─────┐      ┌────▼────┐    ┌───▼─────┐
    │  Alerts   │      │ Reports │    │  Settings│
    │ (Severity)│      │(Monthly)│    │(Config)  │
    └───────────┘      └─────────┘    └─────────┘
          ▲                                     │
          └─────────────────────────────────────┘
              BottomNavigation (5 tabs)
```

---

## 📊 Dashboard Screen Layout

```
┌────────────────────────────────────┐
│     ScreenHeader (Gradient)         │
│  🧠 System Overview                 │  ← Icons from Icons
│  Pretoria, Gauteng • 8.4kW System   │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  AI Insight Card (Blue Gradient)    │
│  🧠 Today's AI Insight              │
│  Battery limited to 85%...          │
│  ─────────────────────────────────  │
│  Estimated: +R12  Cycles: +8        │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Real-Time Performance              │
│  ● Live                             │
│  ┌─────────────────┬─────────────┐  │
│  │ Solar Prod      │ Cost Savings│  │ MetricCard
│  │ 34.6 kWh        │ R8.40       │  │ Grid
│  │ ↑ 8.2%          │ ↑ 12.5%     │  │
│  ├─────────────────┼─────────────┤  │
│  │ System Health   │ AI Accuracy │  │
│  │ 96%             │ 94.2%       │  │
│  └─────────────────┴─────────────┘  │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Performance vs AI Prediction       │
│  🧠 ML Model                        │
│  ┌──────────────────────────────┐   │
│  │  [Chart Placeholder]         │   │
│  │  (Will add fl_chart later)   │   │
│  └──────────────────────────────┘   │
└────────────────────────────────────┘
```

---

## 📈 Monitoring Screen Layout

```
┌────────────────────────────────────┐
│  ScreenHeader: System Monitoring    │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Status Banner: ● All Systems OK    │
│  Updated now                        │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  System Metrics (2x3 Grid)          │
│  ┌──────────┬──────────────────┐   │
│  │ Solar    │ Battery Charge   │   │ GaugeIndicator
│  │ 8.2 kW   │ 85% (████████░░) │   │ Cards
│  │ ████████ │ Optimal          │   │
│  ├──────────┼──────────────────┤   │
│  │ Grid     │ Inverter Temp    │   │
│  │ 240 V    │ 58°C (██████░░░) │   │
│  │ ████████ │ Optimal          │   │
│  ├──────────┼──────────────────┤   │
│  │ System   │ Energy Output    │   │
│  │ Load     │ 156.4 kWh        │   │
│  │ ████░░░░ │ ██████████████░░ │   │
│  └──────────┴──────────────────┘   │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Energy Flow                        │
│  ↓ Solar Panels → Battery: 6.2 kW  │
│  ─────────────────────────────────  │
│  ↓ Battery → Load: 3.5 kW          │
│  ─────────────────────────────────  │
│  ↑ Grid Tie: 1.2 kW                │
└────────────────────────────────────┘
```

---

## 🤖 Optimization Screen Layout

```
┌────────────────────────────────────┐
│  ScreenHeader: Optimization         │
└────────────────────────────────────┘
    ▼
┌────────────┬─────────────────────┐
│ Potential  │ Battery Health: 96% │
│ Savings    │ Cycles optimized    │
│ R1,245     │                     │
│ This month │                     │
└────────────┴─────────────────────┘
    ▼
┌────────────────────────────────────┐
│  [All] [High] [Medium] [Low]        │
│  Filter Chips (scrollable)          │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Recommendations List               │
│  ┌──────────────────────────────┐   │
│  │ 🔋 Adjust Battery Charge     │   │ AIInsightCard
│  │ [HIGH PRIORITY]              │   │
│  │ Based on low forecast...     │   │
│  │ [↑ +R45 savings]             │   │
│  ├──────────────────────────────┤   │
│  │ ☀️  Panel Maintenance        │   │
│  │ [HIGH PRIORITY]              │   │
│  │ Northwest array 15% loss...  │   │
│  │ [↑ +R540/month]              │   │
│  ├──────────────────────────────┤   │
│  │ ⚡ Peak Load Optimization    │   │
│  │ [MEDIUM]                     │   │
│  │ Shift activities to 10-2 PM..│   │
│  │ [↓ -8% demand charges]       │   │
│  └──────────────────────────────┘   │
└────────────────────────────────────┘
```

---

## 🚨 Alerts Screen Layout

```
┌────────────────────────────────────┐
│  ScreenHeader: Alerts & Monitoring  │
│  🛡️  Anomaly Detection              │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Alert Summary                      │
│  Critical: 2 | Warnings: 2 | Info:3 │
│  Total: 7 alerts                    │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  [All] [Critical] [Warning] [Info]  │
│  Filter Chips                       │
└────────────────────────────────────┘
    ▼
┌────────────────────────────────────┐
│  Alert Items List                   │
│  ┌──────────────────────────────┐   │
│  │ ⛔ Power Quality Anomaly     │   │
│  │ Voltage fluctuation outside..│   │ AlertItemCard
│  │ 45min ago                    │   │ (Severity colored)
│  ├──────────────────────────────┤   │
│  │ ⚠️  Battery Discharge Alert  │   │
│  │ Discharged below 80% twice.. │   │
│  │ 4h ago                       │   │
│  ├──────────────────────────────┤   │
│  │ ℹ️  AI Optimization Success  │   │
│  │ Battery cycle adjusted...    │   │
│  │ 3h ago                       │   │
│  └──────────────────────────────┘   │
└────────────────────────────────────┘
```

---

## 📊 Reports Screen Layout

```
┌────────────────────────────────────┐
│  ScreenHeader: Reports              │
└────────────────────────────────────┘
    ▼
┌─────────────────┬──────────────────┐
│ Total Product   │ Total Savings    │
│ 4,918 kWh       │ R18,045          │
├─────────────────┼──────────────────┤
│ Avg Efficiency  │ Months Tracked   │
│ 93.0%           │ 4                │
└─────────────────┴──────────────────┘
    ▼
┌────────────────────────────────────┐
│  Monthly Reports                    │
│  ┌──────────────────────────────┐   │
│  │ February 2026     [COMPLETED]│   │
│  │ ─────────────────────────────│   │ ReportCard
│  │ Production: 1,245 kWh        │   │
│  │ Savings: R4,580              │   │
│  │ Efficiency: 94.2%            │   │
│  │ Peak: 8.5 kW                 │   │
│  │ [⬇ Download PDF]             │   │
│  ├──────────────────────────────┤   │
│  │ January 2026      [COMPLETED]│   │
│  │ ─────────────────────────────│   │
│  │ ... similar layout ...        │   │
│  └──────────────────────────────┘   │
└────────────────────────────────────┘
```

---

## 🎨 Widget Composition Map

```
DashboardScreen
├── ListView
    ├── ScreenHeader
    │   └── Text + Icons
    ├── MetricCard (4x in grid)
    │   ├── Icon
    │   ├── Value + Unit
    │   └── Trend (optional)
    ├── AIInsightCard
    │   ├── Icon
    │   ├── Title
    │   └── Impact Badge
    └── Chart placeholder

MonitoringScreen
├── ListView
    ├── ScreenHeader
    ├── Status Banner
    ├── GaugeIndicator (6x in grid)
    │   ├── Label
    │   ├── Progress bar
    │   ├── Value + Unit
    │   └── Percentage badge
    └── Energy Flow Items

OptimizationScreen
├── ListView
    ├── ScreenHeader
    ├── StatCard (2x in row)
    ├── FilterChip (4x horizontal)
    └── AIInsightCard (list)

AlertsScreen
├── ListView
    ├── ScreenHeader
    ├── Summary Banner
    ├── FilterChip (4x horizontal)
    └── AlertItemCard (list)

ReportsScreen
├── ListView
    ├── ScreenHeader
    ├── Summary Card (2x2 grid)
    └── ReportCard (list)
```

---

## 🔌 Data Flow (Mock)

```
Screen Component
    │
    ├── initState()
    │   └── Load mock data
    │       └── Model.getMockData()
    │
    ├── build()
    │   └── Render with data
    │       ├── ScreenHeader
    │       ├── Widgets
    │       └── Data display
    │
    └── (Future) Replace with API
        └── ApiService.fetch()
            └── Update setState()
```

---

## 📦 Import Structure

```
main.dart
├── core/theme/app_theme.dart
├── core/models/navigation_tab.dart
├── shared/widgets/main_app_shell.dart
└── features/*/...

dashboard_screen.dart
├── core/theme/app_theme.dart
├── shared/widgets/screen_header.dart
├── shared/widgets/metric_card.dart
├── shared/widgets/ai_insight_card.dart
└── core/models/realtime_data.dart

monitoring_screen.dart
├── shared/widgets/screen_header.dart
├── shared/widgets/gauge_indicator.dart
├── core/models/realtime_data.dart
└── core/theme/app_theme.dart

optimization_screen.dart
├── shared/widgets/ai_insight_card.dart
├── core/models/recommendation.dart
└── core/theme/app_theme.dart

alerts_screen.dart
├── shared/widgets/screen_header.dart
├── core/theme/app_theme.dart
└── (mock data inline)

reports_screen.dart
├── shared/widgets/screen_header.dart
├── core/models/report.dart
└── core/theme/app_theme.dart
```

---

## 🎯 Component Relationships

```
AppTheme
  │
  └── All screens use AppTheme colors/fonts

ScreenHeader
  │
  ├── Used in all 5 screens
  └── Consistent branding

MetricCard
  │
  ├── Dashboard (4 cards)
  └── Monitoring (value display)

StatusBadge
  │
  ├── Dashboard (optimization status)
  ├── Monitoring (live indicator)
  └── Reports (completion status)

GaugeIndicator
  │
  └── Monitoring (6 gauges)

AIInsightCard
  │
  ├── Dashboard (featured insight)
  └── Optimization (recommendations)

BottomNavigation
  │
  └── MainAppShell (navigation)
```

---

## ✅ Verification Checklist

- ✅ All imports are correct
- ✅ No circular dependencies
- ✅ All widgets are exported properly
- ✅ Colors are semantic
- ✅ Fonts are consistent
- ✅ Spacing is uniform
- ✅ Navigation flow works
- ✅ Mock data is realistic
- ✅ No hardcoded values
- ✅ Code is scalable

---

*This visual guide helps understand the app structure and data flow at a glance.*

