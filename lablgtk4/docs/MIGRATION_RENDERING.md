# Rendering Migration: GTK3 → GTK4

This guide helps you migrate drawing and rendering code from LablGTK3 to LablGTK4.

## Executive Summary

GTK4 replaced the `::draw` signal with the **GtkSnapshot** API. Instead of receiving a Cairo context directly, widgets now receive a `GtkSnapshot` object and build a render tree.

### Key Changes

| GTK3 (LablGTK3) | GTK4 (LablGTK4) |
|-----------------|-----------------|
| `::draw` signal receives Cairo context | `set_draw_func` callback with GtkSnapshot |
| Direct Cairo drawing | Build render node tree via snapshot |
| `cairo_t` owned by GTK | Use `GtkSnapshot.append_cairo` for Cairo |
| Manual double-buffering sometimes needed | Automatic scene graph optimization |

---

## Quick Migration

### Simple Cairo Drawing

#### ❌ GTK3 (OLD)

```ocaml
let drawing_area = GMisc.drawing_area ~width:400 ~height:300 () in

ignore (drawing_area#event#connect#draw ~callback:(fun cr ->
  (* cr is Cairo context, ready to use *)
  Cairo.set_source_rgb cr 1.0 0.0 0.0;
  Cairo.rectangle cr 50.0 50.0 100.0 100.0;
  Cairo.fill cr;
  true  (* true = handled *)
));
```

#### ✅ GTK4 (NEW)

```ocaml
let drawing_area = GMisc.drawing_area ~width:400 ~height:300 () in

drawing_area#set_draw_func (fun snapshot width height ->
  (* Get Cairo context from snapshot *)
  let cr = GtkSnapshot.append_cairo snapshot
    ~width:(float_of_int width)
    ~height:(float_of_int height) in

  (* Now use Cairo as before *)
  Cairo.set_source_rgb cr 1.0 0.0 0.0;
  Cairo.rectangle cr 50.0 50.0 100.0 100.0;
  Cairo.fill cr
  (* No return value needed *)
);
```

**Changes:**
- ✅ Use `set_draw_func` method instead of `::draw` signal
- ✅ Get Cairo context via `GtkSnapshot.append_cairo`
- ✅ No return value needed
- ✅ Width and height passed as parameters

---

## Understanding GtkSnapshot

### The Snapshot Concept

GTK4 builds a **render tree** instead of drawing directly:

```
GtkSnapshot (records operations)
    ↓
GskRenderNode tree
    ↓
GPU-accelerated rendering
```

**Benefits:**
- Scene graph optimization
- Better GPU utilization
- Easier debugging (inspect render tree)
- Potential for caching/reuse

### Cairo Compatibility

For gradual migration, **use `append_cairo`** to keep existing Cairo code:

```ocaml
(* This creates a Cairo node in the render tree *)
let cr = GtkSnapshot.append_cairo snapshot ~width ~height in
(* ... use Cairo normally ... *)
```

---

## Advanced Snapshot API

### Drawing Colored Rectangles

Instead of using Cairo for simple shapes, use snapshot directly:

```ocaml
drawing_area#set_draw_func (fun snapshot width height ->
  (* Define color *)
  let red = Gdk.RGBA.make ~red:1.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in

  (* Define bounds *)
  let rect = Graphene.Rect.make ~x:50.0 ~y:50.0 ~width:100.0 ~height:100.0 in

  (* Append color node - much faster than Cairo! *)
  GtkSnapshot.append_color snapshot ~color:red ~bounds:rect
);
```

**Benefits over Cairo:**
- ✅ Faster (no Cairo overhead)
- ✅ GPU-friendly
- ✅ Cleaner code for simple shapes

---

### Transformations

```ocaml
drawing_area#set_draw_func (fun snapshot width height ->
  (* Save transformation state *)
  GtkSnapshot.save snapshot;

  (* Translate *)
  let point = Graphene.Point.make ~x:100.0 ~y:100.0 in
  GtkSnapshot.translate snapshot ~point;

  (* Rotate (in degrees) *)
  GtkSnapshot.rotate snapshot ~angle:45.0;

  (* Scale *)
  GtkSnapshot.scale snapshot ~factor_x:1.5 ~factor_y:1.5;

  (* Draw something transformed *)
  let rect = Graphene.Rect.make ~x:0.0 ~y:0.0 ~width:50.0 ~height:50.0 in
  let blue = Gdk.RGBA.make ~red:0.0 ~green:0.0 ~blue:1.0 ~alpha:1.0 in
  GtkSnapshot.append_color snapshot ~color:blue ~bounds:rect;

  (* Restore transformation state *)
  GtkSnapshot.restore snapshot
);
```

---

### Clipping

```ocaml
drawing_area#set_draw_func (fun snapshot width height ->
  (* Define clip region *)
  let clip_rect = Graphene.Rect.make ~x:50.0 ~y:50.0 ~width:200.0 ~height:200.0 in
  GtkSnapshot.push_clip snapshot ~bounds:clip_rect;

  (* Draw something - will be clipped *)
  let large_rect = Graphene.Rect.make ~x:0.0 ~y:0.0 ~width:400.0 ~height:400.0 in
  let green = Gdk.RGBA.make ~red:0.0 ~green:1.0 ~blue:0.0 ~alpha:1.0 in
  GtkSnapshot.append_color snapshot ~color:green ~bounds:large_rect;

  (* Pop clip region *)
  GtkSnapshot.pop snapshot
);
```

---

### Opacity

```ocaml
drawing_area#set_draw_func (fun snapshot width height ->
  (* Apply 50% opacity *)
  GtkSnapshot.push_opacity snapshot ~opacity:0.5;

  (* Draw semi-transparent content *)
  let rect = Graphene.Rect.make ~x:50.0 ~y:50.0 ~width:100.0 ~height:100.0 in
  let red = Gdk.RGBA.make ~red:1.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in
  GtkSnapshot.append_color snapshot ~color:red ~bounds:rect;

  (* Pop opacity *)
  GtkSnapshot.pop snapshot
);
```

---

## Complete Migration Example

### GTK3 Custom Widget

```ocaml
class custom_widget () =
  let drawing_area = GMisc.drawing_area ~width:400 ~height:300 () in

  object (self)
    inherit GObj.widget drawing_area#as_widget

    val mutable points = []

    initializer
      ignore (drawing_area#event#connect#draw ~callback:(fun cr ->
        (* Clear background *)
        Cairo.set_source_rgb cr 1.0 1.0 1.0;
        Cairo.paint cr;

        (* Draw points *)
        Cairo.set_source_rgb cr 0.0 0.0 0.0;
        List.iter (fun (x, y) ->
          Cairo.arc cr x y 3.0 0.0 (2.0 *. Float.pi);
          Cairo.fill cr
        ) points;

        true
      ));

      (* Mouse handling *)
      drawing_area#misc#set_events [`BUTTON_PRESS_MASK];
      ignore (drawing_area#event#connect#button_press ~callback:(fun ev ->
        let x = GdkEvent.Button.x ev in
        let y = GdkEvent.Button.y ev in
        points <- (x, y) :: points;
        drawing_area#misc#queue_draw ();
        false
      ))

    method widget = drawing_area#coerce
  end
```

### GTK4 Custom Widget

```ocaml
class custom_widget () =
  let drawing_area = GMisc.drawing_area ~width:400 ~height:300 () in

  object (self)
    inherit GObj.widget drawing_area#as_widget

    val mutable points = []

    initializer
      (* Set draw function *)
      drawing_area#set_draw_func (fun snapshot width height ->
        (* Get Cairo context *)
        let cr = GtkSnapshot.append_cairo snapshot
          ~width:(float_of_int width)
          ~height:(float_of_int height) in

        (* Clear background *)
        Cairo.set_source_rgb cr 1.0 1.0 1.0;
        Cairo.paint cr;

        (* Draw points *)
        Cairo.set_source_rgb cr 0.0 0.0 0.0;
        List.iter (fun (x, y) ->
          Cairo.arc cr x y 3.0 0.0 (2.0 *. Float.pi);
          Cairo.fill cr
        ) points
      );

      (* Mouse handling - no event mask needed! *)
      ignore (drawing_area#controllers#on_click ~callback:(fun ~n_press ~x ~y ->
        points <- (x, y) :: points;
        drawing_area#queue_draw ()
      ))

    method widget = drawing_area#coerce
  end
```

**Key differences:**
1. `set_draw_func` instead of `::draw` signal
2. Get Cairo via `GtkSnapshot.append_cairo`
3. No event masks
4. Cleaner controller-based events
5. No return value from draw function

---

## Performance Optimization

### Use Native Snapshot Operations

For best performance, avoid Cairo when possible:

#### ❌ Slower (Cairo)

```ocaml
let cr = GtkSnapshot.append_cairo snapshot ~width ~height in
Cairo.set_source_rgb cr 1.0 0.0 0.0;
Cairo.rectangle cr x y w h;
Cairo.fill cr
```

#### ✅ Faster (Native Snapshot)

```ocaml
let color = Gdk.RGBA.make ~red:1.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in
let rect = Graphene.Rect.make ~x ~y ~width:w ~height:h in
GtkSnapshot.append_color snapshot ~color ~bounds:rect
```

**When to use each:**

- **Native snapshot**: Simple shapes, colors, transformations
- **Cairo**: Complex paths, gradients, text rendering, custom drawing

---

## Color Management

### Using Gdk.RGBA

```ocaml
(* Create colors *)
let red = Gdk.RGBA.make ~red:1.0 ~green:0.0 ~blue:0.0 ~alpha:1.0 in

(* Or use predefined *)
let black = Gdk.RGBA.black in
let white = Gdk.RGBA.white in
let transparent = Gdk.RGBA.transparent in

(* Parse from string *)
let color = match Gdk.RGBA.parse "rgb(255, 128, 0)" with
  | Some c -> c
  | None -> Gdk.RGBA.black
in

(* Convert to string *)
let str = Gdk.RGBA.to_string color in
```

---

## Geometry Management

### Using Graphene Types

```ocaml
(* Points *)
let point = Graphene.Point.make ~x:100.0 ~y:200.0 in

(* Rectangles *)
let rect = Graphene.Rect.make ~x:10.0 ~y:20.0 ~width:100.0 ~height:50.0 in

(* Sizes *)
let size = Graphene.Size.make ~width:640.0 ~height:480.0 in

(* Access fields *)
let x = point.Graphene.Point.x in
let width = rect.Graphene.Rect.width in
```

---

## Common Patterns

### Invalidating Drawing

```ocaml
(* GTK3 *)
widget#misc#queue_draw ()

(* GTK4 - same! *)
widget#queue_draw ()
```

### Getting Widget Size

```ocaml
(* In draw function - passed as parameters *)
drawing_area#set_draw_func (fun snapshot width height ->
  (* width and height are ints *)
  ...
)

(* Outside draw function *)
let w = widget#width in
let h = widget#height in
```

---

## Migration Checklist

Drawing:
- [ ] Replace `::draw` signal with `set_draw_func`
- [ ] Use `GtkSnapshot.append_cairo` to get Cairo context
- [ ] Remove return value from draw callback
- [ ] Use width/height parameters instead of querying widget

Colors:
- [ ] Use `Gdk.RGBA.make` instead of Cairo color functions
- [ ] Consider using native `append_color` for simple shapes

Geometry:
- [ ] Use `Graphene.Rect`, `Graphene.Point` for snapshot operations
- [ ] Keep using Cairo paths for complex shapes

Optimization:
- [ ] Identify opportunities to use native snapshot operations
- [ ] Use `append_cairo` only when necessary

---

## See Also

- `MIGRATION_EVENTS.md` - Event handling migration
- `MIGRATION_FOCUS.md` - Focus handling changes
- `MIGRATION_CSS.md` - CSS class API changes
- [GTK4 Snapshot API](https://docs.gtk.org/gtk4/class.Snapshot.html)
- [GTK4 Render Nodes](https://docs.gtk.org/gsk4/class.RenderNode.html)
