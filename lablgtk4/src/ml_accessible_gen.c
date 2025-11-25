/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Accessible */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkAccessible */
#ifndef Val_GtkAccessible
#define GtkAccessible_val(val) ((GtkAccessible*)ext_of_val(val))
#define Val_GtkAccessible(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkAccessible */


CAMLexport CAMLprim value ml_gtk_accessible_update_next_accessible_sibling(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_accessible_update_next_accessible_sibling(GtkAccessible_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_set_accessible_parent(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_accessible_set_accessible_parent(GtkAccessible_val(self), (Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL), (Is_some(arg2) ? GtkWidget_val(Some_val(arg2)) : NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_accessible_reset_state(GtkAccessible_val(self), GtkAccessibleState_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_relation(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_accessible_reset_relation(GtkAccessible_val(self), GtkAccessibleRelation_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_reset_property(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_accessible_reset_property(GtkAccessible_val(self), GtkAccessibleProperty_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_get_platform_state(value self, value arg1)
{
CAMLparam2(self, arg1);

gboolean result = gtk_accessible_get_platform_state(GtkAccessible_val(self), GtkAccessiblePlatformState_val(arg1));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_next_accessible_sibling(value self)
{
CAMLparam1(self);

GtkAccessible* result = gtk_accessible_get_next_accessible_sibling(GtkAccessible_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_first_accessible_child(value self)
{
CAMLparam1(self);

GtkAccessible* result = gtk_accessible_get_first_accessible_child(GtkAccessible_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_at_context(value self)
{
CAMLparam1(self);

GtkATContext* result = gtk_accessible_get_at_context(GtkAccessible_val(self));
CAMLreturn(Val_GtkATContext(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_accessible_role(value self)
{
CAMLparam1(self);

GtkAccessibleRole result = gtk_accessible_get_accessible_role(GtkAccessible_val(self));
CAMLreturn(Val_GtkAccessibleRole(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_get_accessible_parent(value self)
{
CAMLparam1(self);

GtkAccessible* result = gtk_accessible_get_accessible_parent(GtkAccessible_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_accessible_announce(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_accessible_announce(GtkAccessible_val(self), String_val(arg1), GtkAccessibleAnnouncementPriority_val(arg2));
CAMLreturn(Val_unit);
}
