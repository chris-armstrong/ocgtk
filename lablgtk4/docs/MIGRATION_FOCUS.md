# Focus Handling Migration: GTK3 → GTK4

This guide covers changes to keyboard focus handling between LablGTK3 and LablGTK4.

## Executive Summary

GTK4 renamed the `can-focus` property to **`focusable`** and simplified focus handling.

### Key Changes

| GTK3 (LablGTK3) | GTK4 (LablGTK4) |
|-----------------|-----------------|
| `widget#misc#can_focus` | `widget#focusable` |
| `widget#misc#set_can_focus` | `widget#set_focusable` |
| `::focus-in-event` signal | Property notification or focus controller |
| `::focus-out-event` signal | Property notification or focus controller |

---

## Quick Migration

### Setting Focus Capability

#### ❌ GTK3 (OLD)

```ocaml
let button = GButton.button ~label:"Click me" () in
button#misc#set_can_focus true;
let can_receive_focus = button#misc#can_focus in
```

#### ✅ GTK4 (NEW)

```ocaml
let button = GButton.button ~label:"Click me" () in
button#set_focusable true;
let can_receive_focus = button#focusable in
```

**Changes:**
- ✅ Property renamed: `can_focus` → `focusable`
- ✅ Direct methods on widget (not via `misc`)

---

### Grabbing Focus

#### Both GTK3 and GTK4 (SAME)

```ocaml
widget#grab_focus ()
```

**No changes needed!**

---

### Checking Focus State

#### Both GTK3 and GTK4 (SAME)

```ocaml
if widget#has_focus then
  Printf.printf "Widget has keyboard focus\n"
```

**No changes needed!**

---

## Focus Events → Property Notifications

### Monitoring Focus Changes

#### ❌ GTK3 (OLD)

```ocaml
let entry = GEdit.entry () in

ignore (entry#event#connect#focus_in ~callback:(fun ev ->
  Printf.printf "Entry gained focus\n";
  false
));

ignore (entry#event#connect#focus_out ~callback:(fun ev ->
  Printf.printf "Entry lost focus\n";
  false
));
```

#### ✅ GTK4 Option 1: Property Notification (Recommended)

```ocaml
let entry = GEdit.entry () in

(* Use GObject property notification *)
ignore (entry#connect#notify_has_focus ~callback:(fun () ->
  if entry#has_focus then
    Printf.printf "Entry gained focus\n"
  else
    Printf.printf "Entry lost focus\n"
));
```

#### ✅ GTK4 Option 2: EventControllerFocus (Advanced)

```ocaml
let entry = GEdit.entry () in

let focus_controller = EventControllerFocus.new_ () in

ignore (EventControllerFocus.connect_enter focus_controller
  ~callback:(fun () ->
    Printf.printf "Entry gained focus\n"
  ));

ignore (EventControllerFocus.connect_leave focus_controller
  ~callback:(fun () ->
    Printf.printf "Entry lost focus\n"
  ));

entry#add_controller focus_controller;
```

**Recommendation**: Use property notifications for simplicity unless you need advanced focus event handling.

---

## Focus Navigation

### Tab Order

Focus navigation (Tab key) works the same way in GTK4:

```ocaml
(* Widgets automatically participate in tab order if focusable *)
entry1#set_focusable true;
entry2#set_focusable true;
button#set_focusable true;

(* Tab will cycle: entry1 → entry2 → button → entry1 *)
```

---

### Custom Tab Order

#### GTK3 and GTK4 (SAME)

```ocaml
(* Use focus chain in containers *)
container#set_focus_chain [entry1#coerce; button#coerce; entry2#coerce];
```

**Note**: Container focus chain API unchanged in GTK4.

---

## Programmatic Focus Control

### Moving Focus

```ocaml
(* Move to next widget *)
widget#activate_default ();

(* Move to specific widget *)
target_widget#grab_focus ();

(* Get focused widget in window *)
match window#get_focus with
| Some w -> Printf.printf "Widget %s has focus\n" w#name
| None -> Printf.printf "No widget focused\n"
```

**No changes from GTK3!**

---

## Focus Visibility

### Focus Rings/Indicators

GTK4 handles focus indicators via CSS:

```ocaml
(* Style focus ring via CSS *)
let provider = GtkCssProvider.new_ () in
GtkCssProvider.load_from_data provider {|
  entry:focus {
    outline: 2px solid blue;
    outline-offset: 2px;
  }
|};

(* Apply to widget *)
widget#get_style_context#add_provider provider
  ~priority:GTK_STYLE_PROVIDER_PRIORITY_USER;
```

---

## Common Patterns

### Making Custom Widget Focusable

```ocaml
class custom_widget () =
  let drawing_area = GMisc.drawing_area () in

  object (self)
    inherit GObj.widget_full drawing_area#as_widget

    initializer
      (* Make widget able to receive keyboard focus *)
      self#set_focusable true;

      (* Handle keyboard input when focused *)
      ignore (self#controllers#on_key_pressed
        ~callback:(fun ~keyval ~keycode ~state ->
          if self#has_focus then begin
            Printf.printf "Key pressed: %d\n" keyval;
            true  (* Handled *)
          end else
            false  (* Not handled *)
        ))

    method widget = drawing_area#coerce
  end
```

---

### Focus-Dependent Rendering

```ocaml
let entry = GEdit.entry () in

(* Redraw when focus changes *)
ignore (entry#connect#notify_has_focus ~callback:(fun () ->
  entry#queue_draw ()
));

(* In draw function, check focus *)
entry#set_draw_func (fun snapshot width height ->
  let focused = entry#has_focus in

  if focused then begin
    (* Draw with focus indicator *)
    let focus_color = Gdk.RGBA.make ~red:0.0 ~green:0.5 ~blue:1.0 ~alpha:1.0 in
    let border = Graphene.Rect.make ~x:0.0 ~y:0.0
      ~width:(float_of_int width) ~height:(float_of_int height) in
    GtkSnapshot.append_color snapshot ~color:focus_color ~bounds:border
  end;

  (* ... rest of drawing ... *)
);
```

---

## Migration Checklist

Properties:
- [ ] Replace `can_focus` → `focusable`
- [ ] Remove `misc#` accessor (use direct methods)
- [ ] Update property getters/setters

Events:
- [ ] Replace `::focus-in-event` with property notifications
- [ ] Replace `::focus-out-event` with property notifications
- [ ] Or use `EventControllerFocus` for advanced cases

Methods:
- [ ] `grab_focus()` - no changes
- [ ] `has_focus` - no changes
- [ ] Tab navigation - no changes

---

## Quick Reference

### Property Changes

```ocaml
(* GTK3 *)
widget#misc#set_can_focus true
widget#misc#can_focus

(* GTK4 *)
widget#set_focusable true
widget#focusable
```

### Focus Event Changes

```ocaml
(* GTK3 *)
widget#event#connect#focus_in
widget#event#connect#focus_out

(* GTK4 - Option 1 *)
widget#connect#notify_has_focus

(* GTK4 - Option 2 *)
let ctrl = EventControllerFocus.new_ () in
EventControllerFocus.connect_enter ctrl ...
EventControllerFocus.connect_leave ctrl ...
widget#add_controller ctrl
```

---

## See Also

- `MIGRATION_EVENTS.md` - Event handling migration
- `MIGRATION_RENDERING.md` - Drawing and snapshot migration
- `MIGRATION_CSS.md` - CSS class API changes
- [GTK4 Focus Documentation](https://docs.gtk.org/gtk4/focus.html)
