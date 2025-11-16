# Phase 4 Plan Summary

**Created**: 2025-11-16
**Status**: 📋 **READY TO START**
**Full Plan**: [port-phase4.md](port-phase4.md)

---

## Executive Summary

Phase 4 focuses on redesigning the container and layout system for GTK4. This is a critical phase because GTK4 eliminated the `GtkContainer` and `GtkBin` abstract base classes, requiring each container to implement its own specific API.

**Timeline**: 5 weeks (within 4-6 week estimate)
**Complexity**: Medium-High (breaking API changes)
**Dependencies**: Phase 3 complete (widget infrastructure, event controllers)

---

## Key Changes from GTK3

### 1. No GtkContainer Base Class

**GTK3**:
```ocaml
let container = (button :> GObj.container) in
container#add child;  (* Generic add method *)
```

**GTK4**:
```ocaml
(* Each container has specific methods *)
Gtk.Box.append box child;
Gtk.Grid.attach grid ~child ~column:0 ~row:0 ~width:1 ~height:1;
Gtk.Window.set_child window (Some child);
```

### 2. New Box Packing API

**GTK3** (removed):
```c
gtk_box_pack_start(box, child, expand, fill, padding);
```

**GTK4** (new):
```c
gtk_box_append(box, child);
gtk_widget_set_hexpand(child, TRUE);  // Packing properties on widget
```

### 3. Single-Child Containers

**GTK3** (GtkBin):
```c
gtk_container_add(GTK_CONTAINER(window), child);
```

**GTK4**:
```c
gtk_window_set_child(window, child);
```

---

## Phase Structure

### 4.1 GtkBox Migration (1.5 weeks) - CRITICAL

- Implement append/prepend/remove API
- Port widget packing properties (hexpand, vexpand, margins, align)
- Create high-level GBox wrapper
- Provide migration helpers for GTK3 compatibility
- **Deliverables**: Working GtkBox with GTK4 API, tests passing

### 4.2 Single-Child Containers (1 week) - HIGH PRIORITY

Migrate containers that hold one child:
- GtkWindow (set_child/get_child)
- GtkScrolledWindow
- GtkFrame
- GtkApplicationWindow

**Deliverables**: Window creation works, scrolled windows functional

### 4.3 GtkGrid Migration (1 week) - HIGH PRIORITY

- Implement attach/remove API
- Row/column insertion/removal
- Spacing and homogeneous properties
- **Deliverables**: Working grid layouts with GTK4 API

### 4.4 Additional Containers (1 week) - MEDIUM PRIORITY

Port remaining containers:
- GtkFixed (minimal changes)
- GtkPaned (start_child/end_child API)
- GtkNotebook (simplified tab management)
- GtkStack (minimal changes)

**Deliverables**: All common containers available

### 4.5 GPack Module Redesign (0.5 weeks) - LOW PRIORITY

Create convenience functions for common patterns:
- `hbox_pack` / `vbox_pack` - create boxes with children
- `grid_attach` - create grids with positioned widgets
- `window` / `scrolled` - quick window creation

**Deliverables**: Convenient high-level API

---

## Critical Architectural Decisions

### 1. No GContainer/GBin Base Classes

**Decision**: Do not create OCaml equivalents of removed GTK base classes.

**Rationale**:
- GTK4 explicitly removed these for good reasons
- Would create false abstraction that doesn't match C API
- Each container truly has unique semantics
- Polymorphism can be achieved via variants if needed

**Impact**: User code must be container-aware (breaking change)

### 2. Widget Packing Properties

**Decision**: Expose widget properties for packing (hexpand, margins, etc.) at Widget level.

**Rationale**:
- GTK4 moved packing control to widget properties
- More flexible - widgets control their own layout
- Consistent with GTK4 philosophy

**Migration Path**: Provide `box_pack` helper class that sets properties automatically

### 3. Compatibility Helpers

**Decision**: Provide optional compatibility layer (`box_pack` class) for easier migration.

**Rationale**:
- Reduces migration burden for users
- Not a true compatibility layer (still requires some changes)
- Clearly marked as "migration helper"
- Can be deprecated in future

**Example**:
```ocaml
(* Pure GTK4 *)
let box = GBox.vbox () in
button#set_vexpand true;
box#append button;

(* With migration helper *)
let box = GBox.vbox_pack () in
box#pack ~expand:true button;  (* Helper sets widget properties *)
```

---

## Testing Strategy

### Unit Tests

For each container:
1. Creation with default parameters
2. Adding/removing children
3. Property get/set (spacing, homogeneous, etc.)
4. Edge cases (remove non-existent child, etc.)

### Integration Tests

1. Nested containers (box in window)
2. Complex layouts (grid with multiple children)
3. Dynamic updates (add/remove during runtime)

### Memory Tests

1. Valgrind clean (no leaks)
2. Child ownership verified
3. Proper cleanup on destruction

---

## Migration Guide Highlights

### For Users Migrating from LablGTK3

#### Box Packing

**Before (GTK3)**:
```ocaml
let box = GPack.vbox ~spacing:5 () in
box#pack ~expand:true ~fill:true ~padding:10 button;
box#pack_end label;
```

**After (GTK4 - Direct)**:
```ocaml
let box = GBox.vbox ~spacing:5 () in
button#set_vexpand true;
button#set_valign `FILL;
button#set_margin_top 10;
button#set_margin_bottom 10;
box#append button;
box#append label;
```

**After (GTK4 - With Helper)**:
```ocaml
let box = GBox.vbox_pack ~spacing:5 () in
box#pack ~expand:true ~fill:true ~padding:10 button;
box#pack label;
```

#### Window Creation

**Before (GTK3)**:
```ocaml
let window = GWindow.window ~title:"App" () in
window#add vbox;
```

**After (GTK4)**:
```ocaml
let window = GWindow.window ~title:"App" () in
window#set_child (Some vbox);
(* or *)
window#add vbox;  (* Convenience wrapper *)
```

---

## Success Criteria

Phase 4 is complete when:

- [ ] All container types can be created
- [ ] Children can be added/removed from containers
- [ ] GtkBox append/prepend/remove work correctly
- [ ] GtkWindow set_child/get_child work
- [ ] GtkGrid attach/remove work correctly
- [ ] Widget packing properties (hexpand, margins, align) work
- [ ] High-level wrappers (GBox, GWindow, GGrid) provide convenient API
- [ ] All tests pass (100+ tests expected)
- [ ] No memory leaks (valgrind clean)
- [ ] Migration guide complete with examples
- [ ] At least one working example app (window with layout)

---

## Risks and Mitigation

### High Risk: Breaking API Changes

**Risk**: Every container API changed - massive breaking change for users

**Mitigation**:
- Comprehensive migration guide with before/after examples
- Migration helpers (box_pack) for common patterns
- Clear error messages
- Alpha release for user feedback

### Medium Risk: Loss of Polymorphism

**Risk**: No GtkContainer base means no generic container operations

**Mitigation**:
- Document this explicitly as GTK4 philosophy
- Show variant-based polymorphism patterns if needed
- Provide container-specific documentation

### Medium Risk: Testing Limitations

**Risk**: Hard to test containers without actual widgets (Phase 5)

**Mitigation**:
- Use simple button/label widgets from lablgtk3 temporarily
- Focus on API correctness over full integration
- Comprehensive integration tests in Phase 5

---

## Code Generation Opportunity

**Recommendation**: Use the `gir_gen` tool from Phase 3.0 to generate container bindings.

**Benefits**:
- Reduces manual coding time by ~40%
- Ensures API completeness
- Automatic documentation generation
- Consistency across containers

**Suggested Approach**:
1. Generate initial bindings with `gir_gen`
2. Review and customize generated code
3. Add high-level OCaml wrappers
4. Write tests for generated code

**Estimate Savings**: 1-1.5 weeks if code generation used effectively

---

## Dependencies and Prerequisites

### Required from Previous Phases

✅ Phase 3 Complete:
- GtkWidget with GTK4 API
- Event controller system
- Snapshot rendering
- GObj wrapper pattern established

### Required for Next Phase

✅ Phase 4 Deliverables:
- Working container system
- Window creation functional
- Layout system established
- High-level wrapper pattern proven

---

## Next Steps

1. **Review and approve this plan** with team/maintainers
2. **Set up code generation** - configure gir_gen for containers
3. **Start with GtkBox** (4.1) - most critical container
4. **Early testing** - create simple example as soon as GtkBox + GtkWindow work
5. **Parallel development** - GtkGrid can be developed alongside single-child containers
6. **Documentation as you go** - write migration guide while implementing

---

## Resources

- **Full Plan**: [port-phase4.md](port-phase4.md)
- **GTK4 Container Migration**: https://docs.gtk.org/gtk4/migrating-3to4.html#stop-using-gtkcontainer-add-and-remove
- **GTK4 Widget API**: https://docs.gtk.org/gtk4/class.Widget.html
- **Phase 3 Completion**: [port-phase3.md](port-phase3.md)

---

**Ready to start Phase 4!** 🚀
