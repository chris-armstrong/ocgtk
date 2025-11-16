# Event System Migration: GTK3 → GTK4

This guide helps you migrate event handling code from LablGTK3 to LablGTK4.

## Executive Summary

**GTK4 removed all event signals** (`::button-press-event`, `::key-press-event`, etc.) and replaced them with **Event Controllers**. This is the most significant breaking change in the GTK3→GTK4 migration.

### Key Changes

| GTK3 (LablGTK3) | GTK4 (LablGTK4) |
|-----------------|-----------------|
| Event signals via `widget#event#connect` | Event controllers via `widget#controllers` |
| Single callback receives `GdkEvent` | Separate controllers for different event types |
| Return `bool` to control propagation | Different return types per controller |
| Event masks required | No event masks needed |

---

## Quick Migration Examples

### Mouse Click Events

#### ❌ GTK3 (OLD - REMOVED)

```ocaml
let button = GButton.button ~label:"Click me" () in
ignore (button#event#connect#button_press ~callback:(fun ev ->
  let x = GdkEvent.Button.x ev in
  let y = GdkEvent.Button.y ev in
  Printf.printf "Button pressed at %f, %f\n" x y;
  false  (* false = propagate event *)
));
```

#### ✅ GTK4 (NEW)

```ocaml
let button = GButton.button ~label:"Click me" () in
ignore (button#controllers#on_click ~callback:(fun ~n_press ~x ~y ->
  Printf.printf "Button clicked at %f, %f (click count: %d)\n" x y n_press
));
```

**Changes:**
- ✅ Simpler API - coordinates passed directly as named parameters
- ✅ Automatic click count (`n_press`: 1=single, 2=double, 3=triple)
- ✅ No return value needed (doesn't control propagation)

---

### Keyboard Events

#### ❌ GTK3 (OLD - REMOVED)

```ocaml
let entry = GEdit.entry () in
ignore (entry#event#connect#key_press ~callback:(fun ev ->
  let keyval = GdkEvent.Key.keyval ev in
  let state = GdkEvent.Key.state ev in
  if keyval = GdkKeysyms._Return then begin
    Printf.printf "Enter pressed\n";
    true  (* true = stop propagation *)
  end else
    false
));
```

#### ✅ GTK4 (NEW)

```ocaml
let entry = GEdit.entry () in
ignore (entry#controllers#on_key_pressed
  ~callback:(fun ~keyval ~keycode ~state ->
    if keyval = GdkKeysyms._Return then begin
      Printf.printf "Enter pressed\n";
      true  (* true = handled, stop propagation *)
    end else
      false  (* false = not handled, continue *)
  ));
```

**Changes:**
- ✅ Direct parameters instead of event object
- ✅ Same return behavior (bool controls propagation)
- ✅ Additional `keycode` parameter (hardware key code)

---

### Mouse Motion Events

#### ❌ GTK3 (OLD - REMOVED)

```ocaml
let drawing_area = GMisc.drawing_area ~width:400 ~height:300 () in
ignore (drawing_area#event#connect#motion_notify ~callback:(fun ev ->
  let x = GdkEvent.Motion.x ev in
  let y = GdkEvent.Motion.y ev in
  Printf.printf "Mouse at %f, %f\n" x y;
  false
));

(* Also need to set event mask! *)
drawing_area#misc#set_events [`POINTER_MOTION_MASK];
```

#### ✅ GTK4 (NEW)

```ocaml
let drawing_area = GMisc.drawing_area ~width:400 ~height:300 () in
ignore (drawing_area#controllers#on_motion ~callback:(fun ~x ~y ->
  Printf.printf "Mouse at %f, %f\n" x y
));

(* No event mask needed! *)
```

**Changes:**
- ✅ No event mask required
- ✅ Simpler callback signature (no return value)
- ✅ Automatic motion tracking

---

### Mouse Enter/Leave Events

#### ❌ GTK3 (OLD - REMOVED)

```ocaml
let button = GButton.button () in
ignore (button#event#connect#enter_notify ~callback:(fun ev ->
  Printf.printf "Mouse entered\n";
  false
));
ignore (button#event#connect#leave_notify ~callback:(fun ev ->
  Printf.printf "Mouse left\n";
  false
));
```

#### ✅ GTK4 (NEW)

```ocaml
let button = GButton.button () in
ignore (button#controllers#on_enter ~callback:(fun ~x ~y ->
  Printf.printf "Mouse entered at %f, %f\n" x y
));
ignore (button#controllers#on_leave ~callback:(fun () ->
  Printf.printf "Mouse left\n"
));
```

**Changes:**
- ✅ Separate methods for enter/leave
- ✅ Enter callback receives coordinates
- ✅ No return value needed

---

### Focus Events

#### ❌ GTK3 (OLD - REMOVED)

```ocaml
let entry = GEdit.entry () in
ignore (entry#event#connect#focus_in ~callback:(fun ev ->
  Printf.printf "Gained focus\n";
  false
));
ignore (entry#event#connect#focus_out ~callback:(fun ev ->
  Printf.printf "Lost focus\n";
  false
));
```

#### ✅ GTK4 (NEW)

```ocaml
(* Focus is now a property, not an event *)
let entry = GEdit.entry () in

(* Use notify signal on focusable property *)
ignore (entry#connect#notify_has_focus ~callback:(fun () ->
  if entry#has_focus then
    Printf.printf "Gained focus\n"
  else
    Printf.printf "Lost focus\n"
));
```

**Changes:**
- ⚠️ Focus is now handled via property notifications
- ⚠️ Different API pattern (signals on properties, not events)

---

## Advanced Usage: Direct Controller Creation

For more control, you can create and configure controllers manually:

### Configuring Button Sensitivity

```ocaml
(* Listen for right-clicks only *)
let gesture = GestureClick.new_ () in
GestureClick.set_button gesture 3;  (* 3 = right button *)
ignore (GestureClick.connect_pressed gesture
  ~callback:(fun ~n_press ~x ~y ->
    Printf.printf "Right-clicked at %f, %f\n" x y
  ));
widget#add_controller gesture;
```

### Event Propagation Control

```ocaml
let controller = EventControllerKey.new_ () in

(* Set propagation phase *)
EventController.Base.set_propagation_phase controller `CAPTURE;
(* `CAPTURE = intercept on way down, `BUBBLE = catch on way up *)

ignore (EventControllerKey.connect_key_pressed controller
  ~callback:(fun ~keyval ~keycode ~state ->
    (* Handle key... *)
    true  (* Stop propagation *)
  ));

widget#add_controller controller;
```

---

## Event Propagation Model Changes

### GTK3 Event Propagation
```
Window → Container → Widget
      ↓         ↓       ↓
   (signals fired on each level)

Return false = continue propagation
Return true = stop propagation
```

### GTK4 Event Propagation

```
         CAPTURE PHASE (top-down)
              ↓
Window → Container → Widget
              ↑
         BUBBLE PHASE (bottom-up)

Different controllers can listen at different phases:
- `CAPTURE: Intercept events before target
- `TARGET: Handle at target widget
- `BUBBLE: Catch events bubbling up
```

**Set phase with:**
```ocaml
EventController.Base.set_propagation_phase controller `CAPTURE;
```

---

## Complete Migration Example

### GTK3 Drawing Application

```ocaml
let drawing_area = GMisc.drawing_area ~width:640 ~height:480 () in

(* Set up drawing *)
ignore (drawing_area#event#connect#expose ~callback:(fun _ ->
  let cr = Cairo_gtk.create drawing_area#misc#window in
  (* ... draw with Cairo ... *)
  true
));

(* Set up mouse handling *)
drawing_area#misc#set_events [
  `BUTTON_PRESS_MASK;
  `BUTTON_RELEASE_MASK;
  `POINTER_MOTION_MASK;
];

let drawing = ref false in
ignore (drawing_area#event#connect#button_press ~callback:(fun ev ->
  drawing := true;
  false
));

ignore (drawing_area#event#connect#button_release ~callback:(fun ev ->
  drawing := false;
  false
));

ignore (drawing_area#event#connect#motion_notify ~callback:(fun ev ->
  if !drawing then begin
    let x = GdkEvent.Motion.x ev in
    let y = GdkEvent.Motion.y ev in
    (* ... draw point ... *)
    drawing_area#misc#queue_draw ()
  end;
  false
));
```

### GTK4 Drawing Application

```ocaml
let drawing_area = GMisc.drawing_area ~width:640 ~height:480 () in

(* Set up drawing - now uses snapshot, not expose *)
drawing_area#set_draw_func (fun snapshot width height ->
  let cr = GtkSnapshot.append_cairo snapshot ~width ~height in
  (* ... draw with Cairo ... *)
);

(* Set up mouse handling - no event masks needed! *)
let drawing = ref false in

ignore (drawing_area#controllers#on_click
  ~callback:(fun ~n_press ~x ~y ->
    drawing := true
  ));

ignore (drawing_area#controllers#on_click_released
  ~callback:(fun ~n_press ~x ~y ->
    drawing := false
  ));

ignore (drawing_area#controllers#on_motion ~callback:(fun ~x ~y ->
  if !drawing then begin
    (* ... draw point ... *)
    drawing_area#queue_draw ()
  end
));
```

**Key differences:**
1. Drawing uses `snapshot` instead of `expose` event
2. No event masks required
3. Simpler coordinate access
4. Cleaner separation of concerns

---

## Reference: Event Signal Mapping

### Mouse Events

| GTK3 Signal | GTK4 Controller | Method |
|-------------|-----------------|--------|
| `::button-press-event` | `GestureClick` | `#controllers#on_click` |
| `::button-release-event` | `GestureClick` | `#controllers#on_click_released` |
| `::motion-notify-event` | `EventControllerMotion` | `#controllers#on_motion` |
| `::enter-notify-event` | `EventControllerMotion` | `#controllers#on_enter` |
| `::leave-notify-event` | `EventControllerMotion` | `#controllers#on_leave` |
| `::scroll-event` | `EventControllerScroll` | *(Phase 4)* |

### Keyboard Events

| GTK3 Signal | GTK4 Controller | Method |
|-------------|-----------------|--------|
| `::key-press-event` | `EventControllerKey` | `#controllers#on_key_pressed` |
| `::key-release-event` | `EventControllerKey` | `#controllers#on_key_released` |

### Focus Events

| GTK3 Signal | GTK4 Approach |
|-------------|---------------|
| `::focus-in-event` | Property notification: `notify_has_focus` |
| `::focus-out-event` | Property notification: `notify_has_focus` |

### Drawing Events

| GTK3 Signal | GTK4 Approach |
|-------------|---------------|
| `::draw` / `::expose-event` | Snapshot function: `set_draw_func` |
| `::configure-event` | Size allocation changes |

---

## Common Pitfalls

### ❌ DON'T: Try to use event signals

```ocaml
(* This will NOT work - removed in GTK4! *)
widget#event#connect#button_press ~callback:...  (* REMOVED *)
```

### ✅ DO: Use controller_ops helper

```ocaml
widget#controllers#on_click ~callback:...
```

---

### ❌ DON'T: Set event masks

```ocaml
(* Not needed in GTK4 - controllers handle this *)
widget#misc#set_events [`BUTTON_PRESS_MASK]  (* REMOVED *)
```

### ✅ DO: Just attach controllers

```ocaml
(* Event controllers automatically register for needed events *)
widget#controllers#on_click ~callback:...
```

---

### ❌ DON'T: Extract event details from GdkEvent

```ocaml
(* Old GTK3 pattern - GdkEvent no longer used this way *)
let x = GdkEvent.Button.x ev in
let y = GdkEvent.Button.y ev in
```

### ✅ DO: Use named callback parameters

```ocaml
~callback:(fun ~n_press ~x ~y -> ...)
```

---

## Migration Checklist

- [ ] Replace all `widget#event#connect#*` calls with controller methods
- [ ] Remove all `widget#misc#set_events` calls
- [ ] Update drawing from `::draw` signal to `set_draw_func`
- [ ] Change focus events to property notifications
- [ ] Update event coordinate extraction to use named parameters
- [ ] Test event propagation behavior
- [ ] Remove any `GdkEvent.*` type pattern matches
- [ ] Update can_focus → focusable property usage

---

## Getting Help

- **LablGTK4 API docs**: See module signatures in `lablgtk4/src/*.mli`
- **GTK4 documentation**: https://docs.gtk.org/gtk4/migrating-3to4.html
- **Event controller guide**: https://docs.gtk.org/gtk4/event-controllers.html

---

## See Also

- `MIGRATION_RENDERING.md` - Drawing and snapshot system migration
- `MIGRATION_FOCUS.md` - Focus handling changes (can_focus → focusable)
- `MIGRATION_CSS.md` - CSS class API changes
