/**************************************************************************/
/*                ocgtk - OCaml bindings for GTK4                         */
/*                                                                        */
/*    This program is free software; you can redistribute it              */
/*    and/or modify it under the terms of the GNU Library General         */
/*    Public License version 2, as published by the           */
/*    Free Software Foundation with the exception described in file       */
/*    COPYING which comes with the library.                               */
/*                                                                        */
/*    Based on lablgtk3 /https://github.com/garrigue/lablgtk/             */
/*                                                                        */
/**************************************************************************/

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"

#define GtkWidget_val(val) ((GtkWidget*)ext_of_val(val))
#define Val_GtkWidget(obj) ((value)(val_of_ext(obj)))

/* Widget type conversions are defined in wrappers.h */


/* ========== Destruction ========== */

/* Note: In GTK4, gtk_widget_destroy is deprecated.
 * Widgets are destroyed via container removal or reference counting.
 * We provide this for API compatibility but issue a warning. */
CAMLprim value ml_gtk_widget_destroy(value widget)
{
  CAMLparam1(widget);
  GtkWidget *w = GtkWidget_val(widget);
  GtkWidget *parent;

  /* Security: Check for NULL pointer */
  if (w == NULL) {
    CAMLreturn(Val_unit);
  }

  parent = gtk_widget_get_parent(w);
  if (parent) {
    /* GTK4: widget removal requires container-specific API
     * For now, just unparent if possible */
    gtk_widget_unparent(w);
  }

  CAMLreturn(Val_unit);
}

/* ========== Initialization and Main Loop ========== */

/* GTK4 Note: gtk_init_check() no longer takes argc/argv parameters.
 * Command-line argument parsing is now handled by GtkApplication.
 * We keep the argv parameter for API compatibility but just return it unchanged. */
CAMLprim value ml_gtk_init(value argv)
{
  CAMLparam1(argv);

  /* GTK4: gtk_init_check has signature: gboolean gtk_init_check(void) */
  if (!gtk_init_check()) {
    caml_failwith("GTK initialization failed");
  }

  /* Return argv unchanged (GTK4 doesn't process it) */
  CAMLreturn(argv);
}

/* GTK4 Note: gtk_main/gtk_main_quit were removed.
 * For testing, we use GLib's main loop directly.
 * Production apps should use GtkApplication (Phase 6.2). */

static GMainLoop *main_loop = NULL;

CAMLprim value ml_gtk_main(value unit)
{
  CAMLparam1(unit);

  if (main_loop == NULL) {
    main_loop = g_main_loop_new(NULL, FALSE);
  }

  g_main_loop_run(main_loop);

  CAMLreturn(Val_unit);
}


/* ========== Main Loop ========== */

CAMLprim value ml_gtk_main_quit(value unit)
{
  CAMLparam1(unit);

  if (main_loop != NULL) {
    g_main_loop_quit(main_loop);
  }

  CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_main_iteration_do(value block)
{
  CAMLparam1(block);
  GMainContext *context = g_main_context_default();
  gboolean result = g_main_context_iteration(context, Bool_val(block));
  CAMLreturn(Val_bool(result));
}
