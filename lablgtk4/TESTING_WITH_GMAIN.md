# Testing with GMain.init()

## Overview

As of commit 00c51d6, basic GTK initialization is available through the `GMain` module. This allows runtime testing of Phase 3.3/3.4 features instead of waiting until Phase 6.2 (GtkApplication).

## Basic Usage

```ocaml
let () =
  (* Initialize GTK *)
  let _args = GMain.init () in

  (* Now you can create and test GTK objects *)
  let controller = EventControllerKey.new_ () in

  (* Test event controller functionality *)
  Printf.printf "Controller created successfully!\\n"
```

## Example: Testing Event Controllers

```ocaml
open Printf

let test_event_controller () =
  (* Initialize GTK first *)
  let _ = GMain.init () in

  (* Create an event controller *)
  let ctrl = EventControllerKey.new_ () in

  (* Connect a signal *)
  let _handler_id = EventControllerKey.connect_key_pressed ctrl
    ~callback:(fun ~keyval ~keycode ~state ->
      printf "Key pressed: %d\\n" keyval;
      false  (* Don't stop propagation *)
    ) in

  printf "Event controller test: SUCCESS\\n"

let () = test_event_controller ()
```

## Example: Testing GObj Wrapper

```ocaml
(* Note: This will work once we have a concrete widget type.
   For now, controller_ops can be tested with mock widgets. *)

let test_controller_ops () =
  let _ = GMain.init () in

  (* Will work once we have GtkButton or similar widget *)
  (* let button = GtkButton.new_ () in *)
  (* let ops = new GObj.controller_ops button#as_widget in *)
  (*  *)
  (* ops#on_click ~button:1 ~callback:(fun ~n_press ~x ~y -> *)
  (*   printf "Clicked at (%.0f, %.0f)\\n" x y *)
  (* ) *)

  printf "Controller ops test: READY (needs widget types from Phase 4/5)\\n"

let () = test_controller_ops ()
```

## Running Tests with Display

Tests that call `GMain.init()` require an X display server. In development:

```bash
# On Linux with X11
$ dune exec ./my_test.exe

# In Docker/CI without display - use xvfb
$ xvfb-run dune exec ./my_test.exe

# Or set up virtual display
$ Xvfb :99 -screen 0 1024x768x24 &
$ export DISPLAY=:99
$ dune exec ./my_test.exe
```

## Test Pattern

For tests in the test suite, use this pattern:

```ocaml
open Alcotest

let test_with_gtk () =
  try
    let _ = GMain.init () in
    (* Your test code here *)
    check bool "test passed" true true
  with
  | GMain.Error _ ->
      (* Skip test if no display available *)
      skip ()

let () =
  run "My Tests" [
    "gtk_tests", [
      test_case "my test" `Quick test_with_gtk;
    ];
  ]
```

## GTK4 Differences

**Important:** GMain is a minimal implementation for testing only.

### What Changed in GTK4:

1. **gtk_init_check()** no longer processes command-line arguments
   - GTK3: `gtk_init_check(&argc, &argv)`
   - GTK4: `gtk_init_check(void)`
   - Arguments now handled by GtkApplication

2. **gtk_main()** removed
   - GTK3: `gtk_main()` / `gtk_main_quit()`
   - GTK4: Use GtkApplication or GLib's main loop directly
   - GMain uses `g_main_loop_*` for compatibility

3. **Production apps should use GtkApplication** (Phase 6.2)
   - Better lifecycle management
   - DBus integration
   - Modern GTK4 patterns

## What You Can Test Now

✅ **Available for testing:**
- Event controller creation (EventControllerKey, EventControllerMotion, GestureClick)
- Signal connection
- Controller properties
- GObj class instantiation (once widgets available)

❌ **Not yet available:**
- Actual widgets (need Phase 4: Containers, Phase 5: Widgets)
- Window creation
- User interaction
- Event triggering

## Next Steps

1. **Phase 4**: Add container widgets (GtkBox, GtkGrid)
2. **Phase 5**: Add basic widgets (GtkButton, GtkLabel)
3. **Then**: Full integration tests with real user interaction
4. **Phase 6.2**: Replace GMain with GtkApplication for production

## Example Test Files

See:
- `tests/test_gtk_init.ml` - Basic GMain API tests
- Future: `tests/test_event_controller_runtime.ml` - Full controller tests with GTK init
- Future: `tests/test_gobj_runtime.ml` - Full GObj tests with real widgets
