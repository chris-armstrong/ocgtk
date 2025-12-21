/* GENERATED CODE - DO NOT EDIT */
/* C bindings for SignalListItemFactory */

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
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkSignalListItemFactory */
#ifndef Val_GtkSignalListItemFactory
#define GtkSignalListItemFactory_val(val) ((GtkSignalListItemFactory*)ext_of_val(val))
#define Val_GtkSignalListItemFactory(obj) ((value)(val_of_ext(obj)))
#endif /* Val_GtkSignalListItemFactory */


CAMLexport CAMLprim value ml_gtk_signal_list_item_factory_new(value unit)
{
CAMLparam1(unit);
GtkSignalListItemFactory *obj = gtk_signal_list_item_factory_new();
CAMLreturn(Val_GtkSignalListItemFactory(obj));
}
