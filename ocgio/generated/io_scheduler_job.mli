(** Opaque class for defining and scheduling IO jobs.

    Its methods, signals and properties are on {!class-type-io_scheduler_job_t}.
    The functions it is built on are in {!Ocgio.Raw.Io_scheduler_job}. *)

(** The methods, signals and properties of a [IOSchedulerJob]. *)
class type io_scheduler_job_t = object
  method as_io_scheduler_job : Raw.Io_scheduler_job.t
end

class io_scheduler_job : Raw.Io_scheduler_job.t -> io_scheduler_job_t
(** Wraps a raw handle of {!Ocgio.Raw.Io_scheduler_job.t}. *)
