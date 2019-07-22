class BugWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    bugs = Bug.where("id=?", args[0])
    bugs.update_all(status: args[1].to_i)
  end
end
