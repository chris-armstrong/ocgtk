/* GENERATED CODE - DO NOT EDIT */
/* C bindings for EmojiChooser */

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


CAMLexport CAMLprim value ml_gtk_emoji_chooser_new(value unit)
{
CAMLparam1(unit);
GtkEmojiChooser *obj = gtk_emoji_chooser_new();
CAMLreturn(Val_GtkEmojiChooser(obj));
}
