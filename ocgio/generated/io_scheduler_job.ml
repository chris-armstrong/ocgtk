class type io_scheduler_job_t = object
  method as_io_scheduler_job : Io_scheduler_job.t
end

(* High-level class for IOSchedulerJob *)
class io_scheduler_job (obj : Io_scheduler_job.t) : io_scheduler_job_t =
  object (self)
    method as_io_scheduler_job = obj
  end
