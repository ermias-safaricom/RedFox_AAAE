# Leave Management System - Screen Documentation

## Screen Layouts

This document describes the visual layout and components of each screen in the leave management system.

---

## 1. Login Screen (`login_screen.dart`)

### Layout Structure
```
┌─────────────────────────────┐
│                             │
│         [Logo Icon]         │
│       (Account Circle)      │
│                             │
│         Welcome!            │
│     Sign in to continue     │
│                             │
│  ┌───────────────────────┐  │
│  │ 👤 Username          │  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │ 🔒 Password      👁️  │  │
│  └───────────────────────┘  │
│                             │
│  ┌───────────────────────┐  │
│  │       Login           │  │
│  └───────────────────────┘  │
│                             │
│   © 2024 Leave Management   │
│      All rights reserved    │
│                             │
└─────────────────────────────┘
```

### Features
- Centered layout with large logo icon
- Large "Welcome!" heading (36px, bold)
- Two text fields with icons:
  - Username field with person icon
  - Password field with lock icon and visibility toggle
- Purple primary button with loading state
- Footer copyright text
- Form validation

### Color Scheme
- Background: White
- Primary (buttons): Purple (#6C5CE7)
- Text: Dark gray (#2D3436)
- Icons: Gray (#636E72)

---

## 2. Home Screen (`home_screen.dart`)

### Layout Structure
```
┌─────────────────────────────┐
│ HOME            🔔  ⎋       │ ← AppBar
├─────────────────────────────┤
│  ┌─────────────────────────┐│
│  │ ℹ️  Quick Access        ││ ← Top Banner
│  │ Manage your leave...    ││
│  └─────────────────────────┘│
│                             │
│  ┌────────┬────────┬────────┐│
│  │📅      │🕐      │📊      ││
│  │Leave   │Leave   │Reports ││
│  │Request │History │        ││
│  ├────────┼────────┼────────┤│
│  │👥      │⚙️      │❓      ││ ← Menu Grid
│  │Team    │Settings│Help    ││
│  │        │        │        ││
│  └────────┴────────┴────────┘│
│                             │
└─────────────────────────────┘
```

### Features
- Purple app bar with title "HOME"
- Notification and logout icons in app bar
- Top banner with light purple background
- Responsive grid menu (2-4 columns based on screen width):
  - Leave Request (navigates to leave request screen)
  - Leave History (placeholder)
  - Reports (placeholder)
  - Team (placeholder)
  - Settings (placeholder)
  - Help (placeholder)
- Cards with shadow, rounded corners, icons, and labels
- Toast messages for unimplemented features

### Responsive Breakpoints
- < 600px: 2 columns
- 600-900px: 3 columns
- > 900px: 4 columns

---

## 3. Leave Request Screen (`leave_request_screen.dart`)

### Layout Structure
```
┌─────────────────────────────┐
│ ← Leave Request  [Request Leave] │ ← AppBar
├─────────────────────────────┤
│ Leave │ FH │ Days │ Date Range │ Action │ ← Header
├──────────────────────────────┤
│Annual │FH1 │  5   │01/12-05/12 │[Cancel]│
├──────────────────────────────┤
│Sick   │FH2 │  2   │10/12-11/12 │[Cancel]│
├──────────────────────────────┤
│Casual │FH1 │  3   │15/12-17/12 │[Cancel]│
├──────────────────────────────┤
│Annual │FH3 │  7   │20/12-27/12 │[Cancel]│
├──────────────────────────────┤
│Sick   │FH2 │  1   │   28/12    │[Cancel]│
├──────────────────────────────┤
│Casual │FH1 │  4   │01/01-04/01 │[Cancel]│
└─────────────────────────────┘
```

### Features
- App bar with back button and title
- "Request Leave" button in app bar (purple)
- Table header with column labels
- Scrollable list of leave entries
- Alternating row background colors (white/light gray)
- Each row displays:
  - Leave name
  - FH (First Half/Full)
  - Number of days
  - Date range
  - Cancel button (red, rounded)
- Empty state with icon when no leave requests
- Cancel confirmation dialog

### Color Scheme
- Header: Light purple background with purple border
- Even rows: White
- Odd rows: Light gray (#F5F5F5)
- Cancel button: Red (#FF6B6B)

---

## 4. Request Leave Dialog (`request_leave_dialog.dart`)

### Layout Structure
```
┌─────────────────────────────┐
│ Request Leave            ✕  │
├─────────────────────────────┤
│                             │
│  Leave Type                 │
│  ┌─────────────────────────┐│
│  │ Annual Leave        ▼   ││
│  └─────────────────────────┘│
│                             │
│  Days                       │
│  ┌─────────────────────────┐│
│  │ 0                       ││
│  └─────────────────────────┘│
│                             │
│  Leave State                │
│  ┌─────────────────────────┐│
│  │ Full Day            ▼   ││
│  └─────────────────────────┘│
│                             │
│  From Date                  │
│  ┌─────────────────────────┐│
│  │ DD/MM/YYYY          📅  ││
│  └─────────────────────────┘│
│                             │
│  ┌─────────────────────────┐│
│  │       SUBMIT            ││
│  └─────────────────────────┘│
│                             │
└─────────────────────────────┘
```

### Features
- Modal dialog with rounded corners
- Close button (X) in top-right
- Form fields:
  - **Leave Type**: Dropdown with options:
    - Annual Leave
    - Sick Leave
    - Casual Leave
    - Maternity Leave
    - Paternity Leave
  - **Days**: Number input
  - **Leave State**: Dropdown with options:
    - Full Day
    - Half Day
    - Quarter Day
  - **From Date**: Date picker with calendar icon
- Submit button (purple, full width)
- Form validation (all fields required)
- Success/error toast messages
- Material date picker with purple theme

---

## Reusable Components

### 1. CustomTextField
- Outlined input with rounded corners
- Support for prefix/suffix icons
- Password visibility toggle
- Form validation
- Focus/error states with color changes

### 2. AuthButton
- Primary and outlined variants
- Loading state with spinner
- Disabled state
- Optional icon
- Customizable colors and size

### 3. GridMenuCard
- White card with shadow
- Large icon (48px)
- Label text
- Tap ripple effect
- Rounded corners (12px)

### 4. LeaveListItem
- Row layout with flex columns
- Alternating background colors
- Cancel button
- Border bottom divider

### 5. TopBanner
- Light purple background
- Optional icon and text
- Rounded corners with shadow
- Flexible content layout

---

## Design System

### Colors
```
Primary:      #6C5CE7 (Purple)
Secondary:    #00B894 (Teal)
Accent:       #FF6B6B (Red)
Background:   #F5F5F5 (Light Gray)
Card:         #FFFFFF (White)
Banner:       #E8E4FF (Light Purple)
Text Primary: #2D3436 (Dark Gray)
Text Secondary: #636E72 (Gray)
Border:       #DFE6E9 (Light Gray)
```

### Typography
```
Heading Large:  32px, Bold
Heading Medium: 24px, Bold
Heading Small:  18px, SemiBold
Body Large:     16px, Regular
Body Medium:    14px, Regular
Body Small:     12px, Regular
Caption:        11px, Regular
Button:         16px, SemiBold
```

### Spacing
```
Unit: 8dp
Small:    8dp
Medium:   16dp
Large:    24dp
XLarge:   32dp
XXLarge:  40dp
```

### Border Radius
```
Small:  8dp
Medium: 12dp
Large:  16dp
```

### Elevation/Shadow
```
Card:   2dp (subtle shadow)
Dialog: 8dp (prominent shadow)
```

---

## Navigation Flow

```
Login Screen
    ↓ (tap Login)
Home Screen
    ↓ (tap Leave Request card)
Leave Request Screen
    ↓ (tap Request Leave button)
Request Leave Dialog
    ↓ (tap SUBMIT)
Leave Request Screen (updated)
```

### Route Names
- `/` - Login Screen
- `/home` - Home Screen
- `/leave-request` - Leave Request Screen

---

## Sample Data

The screens use mock data for demonstration:
- Login accepts any username/password
- Home has 6 menu items (1 functional, 5 placeholders)
- Leave Request shows 6 sample leave entries
- Dialog has predefined dropdown options

---

## Accessibility

- Semantic labels on all interactive elements
- Color contrast meets WCAG AA standards
- Touch targets minimum 48x48dp
- Keyboard navigation support
- Screen reader compatible
- Form validation with error messages

---

## Responsive Design

All screens adapt to different screen sizes:
- **Small (< 600px)**: Mobile phones, 2-column grid
- **Medium (600-900px)**: Tablets, 3-column grid
- **Large (> 900px)**: Desktops, 4-column grid

Padding and margins scale appropriately.

---

## Testing

Each screen has widget tests covering:
- Widget rendering
- User interactions
- Navigation
- Form validation
- Dialog display

Run tests with:
```bash
flutter test test/test_login_and_navigation.dart
```

---

## Future Enhancements

1. **Backend Integration**
   - API calls for authentication
   - Fetch real leave data
   - Submit leave requests

2. **Enhanced Features**
   - Calendar view
   - Leave balance display
   - Approval workflow
   - Notifications
   - Search and filters

3. **UI Improvements**
   - Animations and transitions
   - Pull-to-refresh
   - Pagination
   - Dark mode
   - Localization

4. **Accessibility**
   - High contrast mode
   - Font scaling
   - Voice commands
