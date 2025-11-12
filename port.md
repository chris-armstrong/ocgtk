# LablGTK3 to LablGTK4 Migration Plan

## Executive Summary

### Overview

This document outlines a comprehensive, phased approach to porting LablGTK3 (OCaml bindings for GTK+ 3.x) to GTK 4. The migration represents a major architectural shift affecting all layers of the binding infrastructure, from low-level C FFI to high-level OCaml APIs.

### Scope and Scale

**Current State (LablGTK3):**
- 83 C stub files (~20,000 lines of C)
- 60+ OCaml modules (~21,500 lines of OCaml)
- 15 property definition files (`.props`)
- 6 enumeration definition files (`.var`)
- 4 optional extension libraries (SourceView3, GooCanvas2, GtkSpell3, RSVG2)
- 30+ example applications

**Migration Complexity:**
- **High Impact**: GTK 4 is a complete API/ABI break from GTK 3
- **Estimated Effort**: 6-12 months for experienced developers
- **Risk Level**: High - requires deep understanding of both GTK internals and OCaml FFI

### Critical Breaking Changes

The GTK 3 → GTK 4 transition introduces fundamental architectural changes that impact every layer of LablGTK:

1. **Container System Elimination** (CRITICAL)
   - `GtkContainer` and `GtkBin` abstract classes removed
   - Generic `gtk_container_add()` / `gtk_container_remove()` eliminated
   - Each container now has specialized APIs (e.g., `gtk_box_append()`, `gtk_grid_attach()`)
   - **Impact**: Complete redesign of `GContainer`, `GBin`, and all container widgets

2. **Event System Redesign** (CRITICAL)
   - Event signals (`::button-press-event`, `::key-press-event`) replaced by event controllers
   - `GtkEventBox` removed (all widgets now receive events)
   - Grabs eliminated in favor of modal dialogs and autohide
   - **Impact**: Major changes to `GObj.event_ops`, signal handling infrastructure

3. **Drawing System Transformation** (CRITICAL)
   - `GtkWidget::draw` signal removed
   - Replaced with `GtkWidget::snapshot` vfunc using `GtkSnapshot` API
   - Direct Cairo drawing still possible via `gtk_snapshot_append_cairo()`
   - **Impact**: Fundamental changes to `GDraw` module and custom widget rendering

4. **Widget API Changes** (HIGH)
   - Many widgets removed: `GtkMenu`, `GtkMenuBar`, `GtkMenuItem`, `GtkToolbar`, `GtkRadioButton`, `GtkButtonBox`
   - Replacements: `GtkPopoverMenu`, `GtkPopoverMenuBar`, grouped `GtkCheckButton`
   - **Impact**: Significant API redesign in `GMenu`, `GButton`, `GPack` modules

5. **GdkWindow → GdkSurface Rename** (MEDIUM)
   - All `GdkWindow` APIs renamed to `GdkSurface`
   - Root window concept removed
   - **Impact**: Updates throughout `Gdk` module and all window-related code

6. **Clipboard System Replacement** (MEDIUM)
   - `GtkClipboard` completely replaced by `GdkClipboard`
   - New API uses `GValue` and `GType` instead of opaque identifiers
   - **Impact**: Complete rewrite of clipboard handling

7. **CSS and Styling Changes** (MEDIUM)
   - Non-standard CSS properties removed (`-gtk-gradient`, `-gtk-icon-theme`)
   - Style context APIs simplified
   - `gtk_style_context_add_class()` moved to `gtk_widget_add_css_class()`
   - **Impact**: Updates to CSS handling and widget styling APIs

### Recommended Approach: Parallel Development

Rather than attempting an in-place migration, we recommend creating **lablgtk4** as a separate package that can coexist with lablgtk3:

**Advantages:**
- Allows applications to migrate incrementally
- Reduces risk of breaking existing lablgtk3 users
- Enables A/B testing and gradual adoption
- Maintains backward compatibility during transition period

**Package Structure:**
```
lablgtk4/                    # New GTK4 bindings
├── src/                     # Core GTK4 bindings
├── src-sourceview5/         # GtkSourceView 5 (GTK4 version)
├── examples/                # GTK4 examples
└── lablgtk4.opam

lablgtk3/                    # Existing GTK3 bindings (maintenance mode)
└── (existing structure)
```

### Migration Phases Overview

The migration is structured into 7 phases over an estimated 6-12 month timeline:

**Phase 1: Foundation & Infrastructure** (4.5-6.5 weeks)
- Reorganize repository (move lablgtk3 to subfolder)
- Set up build system for GTK4
- Update code generation tools (varcc, propcc)
- Create new enumeration bindings
- Establish testing framework

**Phase 2: Core Layer Migration** (6-8 weeks)
- Port GLib, GObject, GdkPixbuf (minimal changes)
- Migrate Gdk (GdkWindow → GdkSurface)
- Update Pango bindings
- Implement new GdkClipboard

**Phase 3: Base Widget Infrastructure** (6-8 weeks)
- Port GtkWidget with new snapshot rendering
- Implement event controller system
- Create new focus handling
- Update widget lifecycle management

**Phase 4: Container & Layout System** (4-6 weeks)
- Redesign container APIs (no GtkContainer/GtkBin)
- Update GtkBox, GtkGrid, GtkFixed
- Port packing and layout widgets
- Implement new constraint system

**Phase 5: High-Level Widgets** (8-12 weeks)
- Port buttons, entries, ranges, misc widgets
- Migrate GtkText (text view/buffer)
- Update GtkTree (list/tree views)
- Implement new menu system (GtkPopoverMenu)

**Phase 6: Advanced Features** (4-6 weeks)
- Port GtkBuilder (with UI file migration)
- Update action system
- Migrate file chooser to GFile API
- Port drag-and-drop to new controllers

**Phase 7: Extensions & Polish** (4-6 weeks)
- Port GtkSourceView 5
- Update/remove other extensions (GooCanvas2 may not have GTK4 version)
- Migrate all examples
- Documentation and migration guide

### Success Criteria

The migration will be considered successful when:

1. **Core Functionality**: All essential GTK4 widgets have OCaml bindings
2. **API Consistency**: High-level API maintains similar patterns to lablgtk3 where possible
3. **Examples Working**: Key examples (buttons, text editor, tree view, cairo) compile and run
4. **Build System**: Dune build with GTK4 dependencies works cleanly
5. **Documentation**: Migration guide for lablgtk3 → lablgtk4 users completed
6. **Test Coverage**: Basic test suite validates core functionality

### Risk Mitigation

**Technical Risks:**
- **GTK4 API instability**: Mitigate by targeting GTK 4.10+ (current stable)
- **Breaking user code**: Mitigate with parallel package approach
- **Incomplete bindings**: Prioritize most-used widgets; mark others as TODO
- **Performance regressions**: Benchmark against GTK3 version

**Resource Risks:**
- **Maintainer bandwidth**: Phase approach allows for incremental progress
- **Community adoption**: Clear migration guide and examples essential
- **Dependency availability**: Verify GTK4 availability on target platforms

### Next Steps

1. **Community Feedback**: Share this plan with lablgtk maintainers and users
2. **Repository Setup**: Create lablgtk4 repository with basic structure
3. **Proof of Concept**: Implement Phase 1 foundation to validate approach
4. **Continuous Integration**: Set up CI for GTK4 builds
5. **Phase 1 Execution**: Begin foundation work per detailed plan below

---

## Detailed Phase Plans

### Phase 1: Foundation & Infrastructure (4.5-6.5 weeks)

**[→ See detailed Phase 1 plan](port-phase1.md)**

**Objective**: Reorganize repository structure and establish the build system, development environment, and code generation infrastructure required for GTK4 bindings.

**Key deliverables:**
- Repository reorganized with lablgtk3/ and lablgtk4/ subfolders
- lablgtk4 directory with Dune build system
- Updated varcc and propcc code generation tools
- GTK4 enumeration bindings (5 .var files)
- Basic C FFI infrastructure (wrappers.c/h)
- Test framework with CI pipeline for both versions


---

### Phase 2: Core Layer Migration (6-8 weeks)

**[→ See detailed Phase 2 plan](port-phase2.md)**

**Objective**: Port the foundational GLib, GObject, GdkPixbuf, Gdk, and Pango modules to GTK4.

**Key deliverables:**
- GLib module (minimal changes from GTK3)
- GObject module (property/signal system)
- GdkPixbuf module (image handling)
- Gdk module (GdkWindow → GdkSurface migration)
- Pango module (text layout)
- New GdkClipboard implementation

---

### Phases 3-7: Widget Layer & Advanced Features (30-38 weeks)

**[→ See high-level overview for Phases 3-7](port-phase3-7.md)**

These phases will be detailed after Phases 1-2 are complete and validated.

**Phase 3: Base Widget Infrastructure** (6-8 weeks)
- GtkWidget with snapshot rendering
- Event controller system
- Focus and lifecycle management

**Phase 4: Container & Layout System** (4-6 weeks)
- Redesigned container APIs (no GtkContainer/GtkBin)
- GtkBox, GtkGrid, and other containers
- Constraint-based layouts

**Phase 5: High-Level Widgets** (8-12 weeks)
- All essential widgets (buttons, entries, text, trees, etc.)
- New menu system (GtkPopoverMenu)
- Dialog async patterns

**Phase 6: Advanced Features** (4-6 weeks)
- GtkBuilder and GtkApplication
- File chooser with GFile API
- Drag-and-drop controllers
- Keyboard shortcuts

**Phase 7: Extensions & Polish** (4-6 weeks)
- GtkSourceView 5
- Example migration
- Documentation and release

---

## Appendix

### GTK3 to GTK4 API Mapping Reference

See [GTK4 Migration Guide](https://docs.gtk.org/gtk4/migrating-3to4.html) for complete details.

**Removed APIs:**
- `GtkContainer` / `GtkBin` → Container-specific methods
- `GtkMenu` / `GtkMenuBar` → `GtkPopoverMenu` / `GtkPopoverMenuBar`
- `GtkRadioButton` → Grouped `GtkCheckButton`
- `GtkToolbar` → `GtkBox` with "toolbar" CSS class
- Event signals → Event controllers
- `gtk_widget_show_all()` → Widgets visible by default
- `gtk_dialog_run()` → Modal dialogs with callbacks

**Renamed APIs:**
- `GdkWindow` → `GdkSurface`
- `GdkScreen` → Removed (use `GdkDisplay`)
- `GDK_MOD1_MASK` → `GDK_ALT_MASK`
- `GDK_MOD2_MASK` → `GDK_META_MASK`

**New GTK4 Features:**
- Event controllers (`GtkEventController` family)
- Snapshot rendering (`GtkSnapshot` API)
- Constraint-based layouts
- `GtkShortcutController` for keyboard shortcuts
- Improved list widgets with model-based design
