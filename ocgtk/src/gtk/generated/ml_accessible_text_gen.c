/* GENERATED CODE - DO NOT EDIT */
/* C bindings for AccessibleText */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include library-specific type conversions and forward declarations */
#include "gtk_decls.h"

#if GTK_CHECK_VERSION(4,14,0)


CAMLexport CAMLprim value ml_gtk_accessible_text_update_selection_bound(value self)
{
CAMLparam1(self);

gtk_accessible_text_update_selection_bound(GtkAccessibleText_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_contents(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_accessible_text_update_contents(GtkAccessibleText_val(self), GtkAccessibleTextContentChange_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_accessible_text_update_caret_position(value self)
{
CAMLparam1(self);

gtk_accessible_text_update_caret_position(GtkAccessibleText_val(self));
CAMLreturn(Val_unit);
}

#else


CAMLexport CAMLprim value ml_gtk_accessible_text_update_caret_position(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("AccessibleText requires GTK >= 4.14");
return Val_unit;
}


CAMLexport CAMLprim value ml_gtk_accessible_text_update_contents(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);
(void)self;
(void)arg1;
(void)arg2;
(void)arg3;
caml_failwith("AccessibleText requires GTK >= 4.14");
return Val_unit;
}


CAMLexport CAMLprim value ml_gtk_accessible_text_update_selection_bound(value self)
{
CAMLparam1(self);
(void)self;
caml_failwith("AccessibleText requires GTK >= 4.14");
return Val_unit;
}


#endif
