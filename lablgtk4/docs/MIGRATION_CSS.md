# CSS Styling Migration: GTK3 → GTK4

This guide covers changes to CSS and widget styling between LablGTK3 and LablGTK4.

## Executive Summary

GTK4 made CSS classes **first-class citizens** with direct widget methods, replacing the GTK3 style context approach.

### Key Changes

| GTK3 (LablGTK3) | GTK4 (LablGTK4) |
|-----------------|-----------------|
| `widget#misc#get_style_context` | Direct methods on widget |
| `style_context#add_class` | `widget#add_css_class` |
| `style_context#remove_class` | `widget#remove_css_class` |
| `style_context#has_class` | `widget#has_css_class` |
| Style properties (deprecated) | CSS only |

---

## Quick Migration

### Adding/Removing CSS Classes

#### ❌ GTK3 (OLD)

```ocaml
let button = GButton.button ~label:"Click me" () in

(* Get style context *)
let ctx = button#misc#get_style_context in

(* Add CSS class *)
ctx#add_class "primary";
ctx#add_class "large";

(* Check if has class *)
if ctx#has_class "primary" then
  Printf.printf "Button has primary style\n";

(* Remove CSS class *)
ctx#remove_class "large";
```

#### ✅ GTK4 (NEW)

```ocaml
let button = GButton.button ~label:"Click me" () in

(* Add CSS class - directly on widget! *)
button#add_css_class "primary";
button#add_css_class "large";

(* Check if has class *)
if button#has_css_class "primary" then
  Printf.printf "Button has primary style\n";

(* Remove CSS class *)
button#remove_css_class "large";
```

**Changes:**
- ✅ No `get_style_context` needed
- ✅ Direct methods on widget
- ✅ Simpler, cleaner API

---

### Getting All CSS Classes

#### ❌ GTK3 (OLD)

```ocaml
let ctx = widget#misc#get_style_context in
let classes = ctx#list_classes in  (* Returns string list *)
List.iter (fun cls ->
  Printf.printf "Class: %s\n" cls
) classes;
```

#### ✅ GTK4 (NEW)

```ocaml
let classes = widget#css_classes in  (* Returns string list *)
List.iter (fun cls ->
  Printf.printf "Class: %s\n" cls
) classes;
```

**Changes:**
- ✅ Single method call
- ✅ No style context indirection

---

## Loading Custom CSS

### From String

```ocaml
(* Create CSS provider *)
let provider = GtkCssProvider.new_ () in

(* Load CSS from string *)
GtkCssProvider.load_from_data provider {|
  .primary {
    background-color: #007bff;
    color: white;
    padding: 12px 24px;
    border-radius: 4px;
  }

  .primary:hover {
    background-color: #0056b3;
  }

  .primary:active {
    background-color: #004085;
  }
|};

(* Add to default display *)
match Gdk.Display.get_default () with
| Some display ->
    GtkStyleContext.add_provider_for_display
      display
      provider
      ~priority:GTK_STYLE_PROVIDER_PRIORITY_USER
| None -> ()
```

---

### From File

```ocaml
let provider = GtkCssProvider.new_ () in

(* Load from file *)
GtkCssProvider.load_from_path provider "styles.css";

(* Apply globally *)
match Gdk.Display.get_default () with
| Some display ->
    GtkStyleContext.add_provider_for_display
      display
      provider
      ~priority:GTK_STYLE_PROVIDER_PRIORITY_USER
| None -> ()
```

---

## Common CSS Classes

### Standard GTK4 Classes

```ocaml
(* Suggested buttons *)
button#add_css_class "suggested-action";  (* Blue/primary *)
button#add_css_class "destructive-action"; (* Red/warning *)

(* Button styles *)
button#add_css_class "flat";              (* No background *)
button#add_css_class "pill";              (* Rounded ends *)
button#add_css_class "circular";          (* Round button *)

(* Text styles *)
label#add_css_class "title";              (* Large title *)
label#add_css_class "heading";            (* Section heading *)
label#add_css_class "caption";            (* Small caption *)
label#add_css_class "dim-label";          (* Dimmed/secondary *)

(* Lists *)
list_item#add_css_class "activatable";    (* Can be activated *)

(* Containers *)
box#add_css_class "linked";               (* Linked widgets *)
box#add_css_class "toolbar";              (* Toolbar style *)

(* Cards *)
frame#add_css_class "card";               (* Card-like container *)
```

---

## Theming Widgets

### Custom Widget Styling

```ocaml
class styled_button ~label () =
  let button = GButton.button ~label () in

  object (self)
    inherit GObj.widget button#as_widget

    initializer
      (* Add custom CSS classes *)
      self#add_css_class "custom-button";
      self#add_css_class "primary";

      (* Optionally load custom CSS for this widget *)
      let provider = GtkCssProvider.new_ () in
      GtkCssProvider.load_from_data provider {|
        .custom-button {
          min-width: 120px;
          min-height: 40px;
          font-weight: bold;
        }

        .custom-button.primary {
          background: linear-gradient(to bottom, #3498db, #2980b9);
          color: white;
        }

        .custom-button.primary:hover {
          background: linear-gradient(to bottom, #5dade2, #3498db);
        }
      |};

      (* Apply to this widget's style context *)
      let ctx = button#get_style_context in
      ctx#add_provider provider ~priority:GTK_STYLE_PROVIDER_PRIORITY_USER

    method button = button
    method widget = button#coerce
  end
```

---

## State-Dependent Styling

### Pseudo-Classes

CSS pseudo-classes work in GTK4:

```css
/* Normal state */
button {
  background-color: #e0e0e0;
}

/* Hover */
button:hover {
  background-color: #d0d0d0;
}

/* Active (pressed) */
button:active {
  background-color: #c0c0c0;
}

/* Focused */
button:focus {
  outline: 2px solid #007bff;
  outline-offset: 2px;
}

/* Disabled */
button:disabled {
  opacity: 0.5;
}

/* Checked (togglebuttons, checkboxes) */
checkbutton:checked {
  background-color: #007bff;
}
```

---

### Programmatic State Classes

```ocaml
(* Add state-specific classes *)
let button = GButton.button () in

(* On hover enter *)
button#add_css_class "hovered";

(* On hover leave *)
button#remove_css_class "hovered";

(* Toggle active state *)
if is_active then
  button#add_css_class "active"
else
  button#remove_css_class "active";
```

**Note**: Prefer CSS pseudo-classes (`:hover`, `:active`) over manual class management when possible.

---

## Color Schemes

### Dark Mode Support

```ocaml
(* Check if dark mode is preferred *)
let settings = GtkSettings.get_default () in
let dark_mode = settings#get_prefer_dark_theme in

(* Or use CSS to respond automatically *)
let provider = GtkCssProvider.new_ () in
GtkCssProvider.load_from_data provider {|
  /* Light theme (default) */
  window {
    background-color: white;
    color: black;
  }

  /* Dark theme */
  @media (prefers-color-scheme: dark) {
    window {
      background-color: #2b2b2b;
      color: white;
    }
  }
|};
```

---

## Complete Example

### Styled Application

```ocaml
let () =
  let app = GtkApplication.new_ ~application_id:"com.example.styled" () in

  ignore (app#connect#activate ~callback:(fun () ->
    (* Create window *)
    let window = GtkApplicationWindow.new_ ~application:app () in
    window#set_title "Styled Application";
    window#set_default_size ~width:400 ~height:300;

    (* Load global CSS *)
    let provider = GtkCssProvider.new_ () in
    GtkCssProvider.load_from_data provider {|
      /* Window styling *)
      window {
        background-color: #f5f5f5;
      }

      /* Custom button style */
      .action-button {
        min-width: 100px;
        min-height: 40px;
        margin: 8px;
        padding: 8px 16px;
        font-weight: bold;
        border-radius: 4px;
      }

      .action-button.primary {
        background: linear-gradient(to bottom, #007bff, #0056b3);
        color: white;
        border: none;
      }

      .action-button.primary:hover {
        background: linear-gradient(to bottom, #0069d9, #0056b3);
      }

      .action-button.secondary {
        background-color: #6c757d;
        color: white;
      }

      /* Title styling */
      .app-title {
        font-size: 24px;
        font-weight: bold;
        margin: 16px;
      }
    |};

    (* Apply globally *)
    match Gdk.Display.get_default () with
    | Some display ->
        GtkStyleContext.add_provider_for_display
          display
          provider
          ~priority:GTK_STYLE_PROVIDER_PRIORITY_USER
    | None -> ();

    (* Create UI *)
    let vbox = GtkBox.new_ `VERTICAL ~spacing:10 () in
    window#set_child (Some vbox);

    (* Title label *)
    let title = GtkLabel.new_ ~text:"Styled Application" () in
    title#add_css_class "app-title";
    vbox#append title;

    (* Primary button *)
    let btn_primary = GtkButton.new_with_label ~label:"Primary Action" () in
    btn_primary#add_css_class "action-button";
    btn_primary#add_css_class "primary";
    vbox#append btn_primary;

    (* Secondary button *)
    let btn_secondary = GtkButton.new_with_label ~label:"Secondary Action" () in
    btn_secondary#add_css_class "action-button";
    btn_secondary#add_css_class "secondary";
    vbox#append btn_secondary;

    window#present ()
  ));

  let status = app#run () in
  exit status
```

---

## CSS Selectors in GTK4

### Widget Type Selectors

```css
/* Select all buttons */
button { }

/* Select all labels */
label { }

/* Select all entries */
entry { }
```

### Class Selectors

```css
/* Select by CSS class */
.primary { }
.large { }
.warning { }
```

### ID Selectors

```css
/* Select by widget name */
#main-button { }
#sidebar { }
```

```ocaml
(* Set widget name in OCaml *)
button#set_name "main-button";
```

### Descendant Selectors

```css
/* Button inside box */
box button { }

/* Label in primary button */
button.primary label { }
```

### State Selectors

```css
/* Pseudo-classes */
button:hover { }
button:active { }
button:focus { }
button:disabled { }
checkbutton:checked { }
```

---

## Migration Checklist

CSS Classes:
- [ ] Replace `style_context#add_class` → `widget#add_css_class`
- [ ] Replace `style_context#remove_class` → `widget#remove_css_class`
- [ ] Replace `style_context#has_class` → `widget#has_css_class`
- [ ] Replace `style_context#list_classes` → `widget#css_classes`

CSS Loading:
- [ ] Update CSS provider code to GTK4 API
- [ ] Use `add_provider_for_display` for global styles
- [ ] Use `add_provider` for widget-specific styles

Styling:
- [ ] Remove deprecated style properties
- [ ] Use CSS for all styling
- [ ] Test with both light and dark themes
- [ ] Use standard GTK4 CSS classes where appropriate

---

## See Also

- `MIGRATION_EVENTS.md` - Event handling migration
- `MIGRATION_RENDERING.md` - Drawing and snapshot migration
- `MIGRATION_FOCUS.md` - Focus handling changes
- [GTK4 CSS Overview](https://docs.gtk.org/gtk4/css-overview.html)
- [GTK4 CSS Properties](https://docs.gtk.org/gtk4/css-properties.html)
