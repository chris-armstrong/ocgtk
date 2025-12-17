# Phases 3-7: Widget Layer & Advanced Features

**Note**: Phase 3 now has a detailed plan. Phases 4-7 are outlined at a high level and will be detailed after completing Phase 3 and validating the approach.

---

## Phase 3: Base Widget Infrastructure (6-8 weeks)

**[→ See detailed Phase 3 plan](port-phase3.md)** ✨ **DETAILED SPEC AVAILABLE**

**Objective**: Implement the core GtkWidget infrastructure with GTK4's new rendering and event systems.

**Dependencies**: Phase 2 complete (GObject, Gdk, Pango working)

### Key Changes from GTK3

**Drawing System Transformation**:
- Replace `GtkWidget::draw` signal with `GtkWidget::snapshot` vfunc
- Implement `GtkSnapshot` API for rendering
- Provide Cairo compatibility via `gtk_snapshot_append_cairo()`

**Event System Redesign**:
- Replace event signals (`::button-press-event`, etc.) with event controllers
- Implement `GtkEventController` base and subclasses:
  - `GtkEventControllerKey` (keyboard)
  - `GtkEventControllerMotion` (mouse motion)
  - `GtkEventControllerScroll` (scrolling)
  - `GtkGestureClick` (was GtkGestureMultiPress)
  - `GtkGestureDrag`, `GtkGestureZoom`, etc.

**Widget Lifecycle**:
- Implement `root` and `unroot` vfuncs (new in GTK4)
- Update `realize`/`unrealize` for GTK4
- Handle default visibility (widgets visible by default)

**Focus Handling**:
- New `focusable` property (different from `can-focus`)
- Updated focus chain management

### Main Tasks

1. **Port gtk.ml/mli and ml_gtk.c**
   - Update GtkWidget bindings
   - Remove deprecated widget functions
   - Add new GTK4 widget methods

2. **Implement GObj module**
   - Port `GObj.widget` base class
   - Redesign `GObj.event_ops` for event controllers
   - Update `GObj.misc_ops` (show/hide, size allocation)
   - Implement new focus handling

3. **Implement snapshot rendering**
   - Create OCaml bindings for `GtkSnapshot`
   - Provide Cairo interop
   - Update custom widget example

4. **Create event controller bindings**
   - Implement controller base class
   - Add key, motion, scroll controllers
   - Add gesture recognizers
   - Create usage examples

5. **Testing**
   - Test widget creation and lifecycle
   - Test event controller attachment
   - Test custom widget rendering
   - Verify memory management

### Key Challenges

- Event controller API is entirely new - no direct GTK3 equivalent
- Snapshot rendering requires understanding scene graph approach
- Backward compatibility: old event signal pattern won't work
- Users will need significant code changes for event handling

### Success Criteria

- Can create custom widgets with snapshot rendering
- Event controllers work for keyboard/mouse input
- Focus handling works correctly
- Widget lifecycle (root/unroot) functions properly
- Example: simple button with click handler

---

## Phase 4: Container & Layout System (4-6 weeks)

**Objective**: Redesign container APIs without GtkContainer/GtkBin base classes.

**Dependencies**: Phase 3 complete (GtkWidget working)

### Key Changes from GTK3

**Container System Elimination**:
- `GtkContainer` abstract class removed
- `GtkBin` abstract class removed
- Generic `gtk_container_add()` / `gtk_container_remove()` gone
- Each container has specialized methods:
  - `GtkBox`: `gtk_box_append()`, `gtk_box_prepend()`, `gtk_box_remove()`
  - `GtkGrid`: `gtk_grid_attach()`, `gtk_grid_remove()`
  - `GtkNotebook`: `gtk_notebook_append_page()`, etc.

**Removed Widgets**:
- `GtkButtonBox` → use `GtkBox` instead
- `GtkLayout` → use `GtkFixed`

**New Features**:
- Constraint-based layout system (`GtkConstraintLayout`)
- Layout managers are now explicit objects

### Main Tasks

1. **Redesign container module structure**
   - No `GContainer` or `GBin` base classes
   - Each container is independent
   - Update OCaml class hierarchy

2. **Port GtkBox** (most common container)
   - Implement `gtk_box_append()` / `gtk_box_prepend()`
   - Remove old `gtk_box_pack_start()` / `pack_end()`
   - Update packing properties

3. **Port GtkGrid**
   - Update to GTK4 attach APIs
   - Handle layout properties

4. **Port other containers**
   - `GtkFixed`
   - `GtkPaned`
   - `GtkNotebook`
   - `GtkStack`
   - `GtkScrolledWindow` (now a widget, not bin)

5. **Update GPack module**
   - Redesign high-level packing API
   - No generic container operations
   - Provide helper functions

6. **Implement GtkConstraintLayout bindings** (optional)
   - New constraint-based layout
   - May defer to later phase

### Key Challenges

- Breaking change for all user code using containers
- Packing API is completely different
- No common base class for containers
- Need clear migration path for users

### Success Criteria

- Can create boxes and pack widgets
- Grid layout works
- Notebook with pages works
- Scrolled windows work
- Example: multi-widget layout with box/grid

---

## Phase 5: High-Level Widgets (8-12 weeks)

**Objective**: Port all essential widgets and implement new GTK4 widget replacements.

**Dependencies**: Phase 4 complete (containers working)

### Widget Categories

#### 5.1 Button Widgets (GButton module)

**Changes**:
- `GtkRadioButton` removed → use grouped `GtkCheckButton`
- `GtkToggleButton` simplified

**Widgets**:
- `GtkButton`
- `GtkCheckButton` (with grouping for radio behavior)
- `GtkLinkButton`
- `GtkMenuButton`
- `GtkSwitch`

#### 5.2 Entry Widgets (GEdit module)

**Minimal changes**:
- `GtkEntry`
- `GtkSearchEntry`
- `GtkSpinButton`
- `GtkEditable` interface

#### 5.3 Text Widgets (GText module)

**Changes**:
- `GtkTextView` / `GtkTextBuffer` still present
- Some API refinements
- Update tag handling

**Widgets**:
- `GtkTextView`
- `GtkTextBuffer`
- `GtkTextTag`
- `GtkTextMark`

#### 5.4 Range Widgets (GRange module)

**Changes**:
- `GtkScale` property defaults changed
- `GtkScrollbar` updated

**Widgets**:
- `GtkScale`
- `GtkScrollbar`
- `GtkProgressBar`
- `GtkLevelBar`

#### 5.5 Tree/List Widgets (GTree module)

**Major changes**:
- Traditional `GtkTreeView` still available but deprecated for new code
- New list widgets recommended: `GtkListView`, `GtkColumnView`, `GtkGridView`
- Uses `GListModel` instead of `GtkTreeModel`

**Decision needed**:
- Port old `GtkTreeView` API (easier for users)
- AND/OR implement new list widget API (future-proof)

#### 5.6 Misc Widgets (GMisc module)

**Changes**:
- `GtkImage` sizing changed
- `GtkSeparator` simplified

**Widgets**:
- `GtkLabel`
- `GtkImage`
- `GtkSeparator`
- `GtkSpinner`
- `GtkStatusbar`
- `GtkInfoBar`

#### 5.7 Window Widgets (GWindow module)

**Changes**:
- `GtkWindow` properties changed
- `GtkDialog` no longer has `gtk_dialog_run()`
- `GtkApplicationWindow` preferred

**Widgets**:
- `GtkWindow`
- `GtkApplicationWindow`
- `GtkDialog`
- `GtkMessageDialog`
- `GtkAboutDialog`

#### 5.8 Menu System (GMenu module - MAJOR REDESIGN)

**Critical changes**:
- `GtkMenu`, `GtkMenuBar`, `GtkMenuItem` removed
- Replaced with `GtkPopoverMenu` and `GtkPopoverMenuBar`
- Uses `GMenuModel` for menu structure

**New approach**:
```ocaml
(* Old GTK3 style - REMOVED *)
let menu = GMenu.menu ()
let item = GMenu.menu_item ~label:"Open" ()
menu#append item

(* New GTK4 style *)
let menu_model = GMenu.create_model () in
GMenu.append menu_model ~label:"Open" ~action:"app.open"
let popover = GtkPopoverMenu.new_from_model menu_model
```

This is a substantial API redesign requiring careful thought.

### Key Challenges

- Radio button replacement (grouped check buttons)
- Menu system complete redesign
- Dialog run() removal (async dialogs)
- Tree/List widget dual approach decision
- Large surface area - many widgets to port

### Success Criteria

- All common widgets have bindings
- Menu system works with GMenuModel
- Dialogs work with async/callback pattern
- Tree view (old or new) works
- Examples for each widget category

---

## Phase 6: Advanced Features (4-6 weeks)

**Objective**: Port advanced GTK features and application infrastructure.

**Dependencies**: Phase 5 complete (widgets working)

### Main Areas

#### 6.1 GtkBuilder & UI Files

**Changes**:
- UI files need migration (use `gtk4-builder-tool simplify --3to4`)
- Signal auto-connection now default
- Some properties renamed

**Tasks**:
- Port GtkBuilder bindings
- Create UI file migration guide
- Test with example UI files

#### 6.2 GtkApplication & Actions

**Changes**:
- `GtkApplication` now preferred over `gtk_main()`
- Action system refined
- `GMenuModel` integration

**Tasks**:
- Port GtkApplication bindings
- Port GAction/GActionGroup
- Integrate with menu system
- Application lifecycle management

#### 6.3 File Chooser

**Major changes**:
- GFile-based API (not strings/URIs)
- `GtkFileChooserButton` removed
- `GtkFileChooserDialog` updated
- Custom widgets/preview removed

**Tasks**:
- Port to GFile API
- Update dialog interface
- Provide helpers for path/URI conversion

#### 6.4 Drag and Drop

**Complete redesign**:
- Event signals removed
- New controller-based API:
  - `GtkDragSource`
  - `GtkDropTarget`
- Content providers/receivers

**Tasks**:
- Implement drag source bindings
- Implement drop target bindings
- Create DnD examples
- This is a significant new API

#### 6.5 Keyboard Shortcuts

**Changes**:
- `GtkAccelGroup` removed
- New `GtkShortcutController` system
- More flexible and powerful

**Tasks**:
- Port shortcut controller
- Port shortcut trigger/action
- Update examples

### Key Challenges

- GtkApplication changes workflow from gtk_main()
- File chooser GFile API requires GIO knowledge
- Drag-and-drop is entirely new architecture
- Shortcuts system complete rewrite

### Success Criteria

- Can load UI files
- GtkApplication-based app works
- File chooser opens and returns files
- Basic drag-and-drop works
- Keyboard shortcuts functional

---

## Phase 7: Extensions & Polish (4-6 weeks)

**Objective**: Port extensions, examples, and complete documentation.

**Dependencies**: Phase 6 complete (core features done)

### Main Tasks

#### 7.1 GtkSourceView 5

**Status**: GtkSourceView 5 is the GTK4 version

**Tasks**:
- Create `src-sourceview5/` directory
- Port GtkSourceView bindings to v5 API
- Update syntax highlighting
- Port code editor examples

**Estimate**: 1.5 weeks

#### 7.2 Other Extensions

**GooCanvas**:
- Research: Does GooCanvas support GTK4?
- If not: mark as deprecated, recommend alternatives
- Consider removing from lablgtk4

**GtkSpell**:
- Check GTK4 compatibility
- Port if available
- Otherwise remove or mark deprecated

**RSVG2**:
- Should work unchanged (separate library)
- Verify and test

**Estimate**: 1 week

#### 7.3 Example Migration

**Tasks**:
- Migrate all 30+ examples to GTK4
- Priority examples:
  - `buttons.ml` - basic button demo
  - `custom_widget.ml` - custom drawing
  - `editor.ml` - text editor
  - `tree_view.ml` - tree/list demo
  - `menu.ml` - menu system demo
  - `application.ml` - GtkApplication template
- Create new examples:
  - Event controller usage
  - Constraint layout
  - New list widgets
  - Drag-and-drop

**Estimate**: 1.5 weeks

#### 7.4 Documentation

**User migration guide** (`MIGRATING.md`):
- API changes summary
- Widget-by-widget migration notes
- Event handling migration (signals → controllers)
- Container API changes
- Menu system redesign
- Code examples (before/after)

**API documentation**:
- Generate ocamldoc
- Publish to GitHub pages
- Cross-reference with GTK4 C docs

**Developer guide**:
- How to add new widget bindings
- Code generation workflow
- Testing guidelines

**Estimate**: 1.5 weeks

#### 7.5 Release Preparation

**Tasks**:
- Version numbering (4.0.0-beta1?)
- OPAM package metadata
- CI/CD for releases
- Deprecation warnings for removed APIs
- Performance testing vs lablgtk3
- Announce to community

**Estimate**: 0.5 weeks

### Success Criteria

- GtkSourceView 5 works for code editing
- All examples compile and run
- Migration guide complete
- API docs published
- Beta release tagged

---

## Overall Timeline Summary

| Phase | Duration | Cumulative | Milestone |
|-------|----------|------------|-----------|
| Phase 1: Foundation | 4.5-6.5 weeks | 1.5 months | Repo reorganized, build system ready |
| Phase 2: Core Layer | 6-8 weeks | 3.5 months | GObject/Gdk working |
| Phase 3: Widget Base | 6-8 weeks | 5.5 months | Event controllers, rendering |
| Phase 4: Containers | 4-6 weeks | 7 months | Layout system working |
| Phase 5: Widgets | 8-12 weeks | 10 months | All widgets ported |
| Phase 6: Advanced | 4-6 weeks | 11.5 months | Full feature set |
| Phase 7: Polish | 4-6 weeks | 13 months | Release ready |

**Total estimated time**: 9.5-13.5 months for full migration (with 0.5 week added for repository reorganization)

### Risk Factors

**Technical risks**:
- Event controller system is entirely new (Phase 3)
- Menu system redesign may be complex (Phase 5)
- Drag-and-drop API completely different (Phase 6)
- User code migration will be extensive

**Mitigation**:
- Phase 1-2 validation before committing to full migration
- Early examples to prove architecture works
- Incremental releases (beta1, beta2, etc.)
- Community feedback loop

**Resource risks**:
- Single maintainer: 13 months full-time
- Part-time: 18-24 months
- Multiple contributors: can parallelize some phases

### Incremental Release Strategy

Rather than waiting 13 months, consider incremental releases:

- **Alpha 1** (after Phase 2): Core modules only, no widgets
- **Alpha 2** (after Phase 3): Basic widget infrastructure
- **Beta 1** (after Phase 4): Containers + simple widgets
- **Beta 2** (after Phase 5): All widgets
- **RC 1** (after Phase 6): Full feature set
- **1.0** (after Phase 7): Production ready

This allows early adopters to test and provide feedback.

---

## Next Steps After Phase 2

Once Phases 1-2 are complete and validated:

1. **Review and refine Phase 3-7 plans** based on learnings
2. **Create detailed Phase 3 plan** (similar to Phase 1-2 detail level)
3. **Decide on API design questions**:
   - Event controller wrapper API design
   - Container API without GtkContainer base
   - Menu system API redesign
   - Tree/List widget strategy (old vs new)
4. **Gather community feedback** on API changes
5. **Begin Phase 3 implementation**
