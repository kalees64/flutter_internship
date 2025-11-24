# flutter_internship

A new Flutter project.

# DAY - 1

## Goal: Understand when to use each, lifecycle, and build UI with both.

### What is a widget?

Widgets are the building blocks of a Flutter app's user interface, and each widget is an immutable declaration of part of the user interface. Widgets are used to describe all aspects of a user interface, including physical aspects such as text and buttons to lay out effects like padding and alignment.

Widgets form a hierarchy based on composition. Each widget nests inside its parent and can receive context from the parent.

### Difference between Stateless & Stateful

🔵 Stateless

A Stateless widget/component does NOT hold or manage any data that changes over time.

UI does not change automatically.

All values are final / fixed.

If you want to update UI, you must rebuild it from outside.

✔ Examples of Stateless:

Text

Icons

Buttons (without internal behavior)

Static screens

Logo, images

✔ When to use Stateless:

When UI never updates after it is drawn.

When all values come from constructor or parent component.

---

🟠 Stateful

A Stateful widget/component remembers data and updates UI automatically when data changes.

Can store values inside state.

Can modify UI using:

setState() (Flutter)

Best for dynamic, interactive UI.

✔ Examples of Stateful:

Forms

Counters

Animations

TextFields

Toggle buttons

API-loaded screens

✔ When to use Stateful:

When data changes over time (text input, user interaction)

When UI must update automatically

#### 🧠 Memory Trick

⭐ Stateless = “Just Display”
⭐ Stateful = “Display + Update”

### build() method

`build()` is a method that creates and returns the UI (Widget tree).
`build()` can run many times; it must be pure + fast.

✔ When is it called?

When the widget is created

When setState() is called

When screen rotates

When parent widget rebuilds

```
@override
Widget build(BuildContext context) {
  return Text("Hello");
}
```

### initState, setState, dispose

#### ✔ What is initState()?

Called only once when the Stateful widget is first created.

✔ When to use initState()?

API calls

Initialize variables

Start animations

Start listeners (Streams, Controllers)

```
@override
void initState() {
  super.initState();
  print("Widget Initialized");
}
```

---

#### ✔ What is setState()?

Used to update the UI by notifying Flutter:

“Something changed — rebuild the widget.”

✔ Rules

Should be used inside `Stateful widgets` only

Should update local state variables

Causes build() to run again

```
setState(() {
  count++;
});
```

---

#### ✔ What is dispose()?

Called when the widget is removed from the screen.

✔ When to use it?

To clean up memory:

Dispose controllers

Close streams

Stop timers

Remove listeners

✔ Why?

Prevents memory leaks.

```
@override
void dispose() {
  myController.dispose();
  super.dispose();
}
```

---

### 🔥 Lifecycle Order

When widget first loads:

1️⃣ `initState()`
2️⃣ `build()`

When UI updates:

➡️ `setState()` → `build()`

When widget is removed:

➡️ `dispose()`

### Hands-on (1 hr)

    • Create 2 screens:
        ○ A Stateless counter display
        ○ A Stateful increment counter
        ○ Change colors & text dynamically

### Mini Exercise (30 min)

        • Create a Toggle button using Stateful widget
        • Press it → change background + text
