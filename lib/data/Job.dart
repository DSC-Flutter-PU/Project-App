class Job {
  int id;
  String name;
  int count; // Number of people who have seen the job
  String creationDate;

  // Getters and setters
  int addCount() {
    this.count = addSeen(this).count;

    return this.count;
  }

  // Constructors
  Job({
    String name,
    int count,
  }) {
    if (name == "" || name == null) {
      return;
    }

    this.name = name;
    this.count = count;
    this.creationDate = DateTime.now().toString();
  }

  // helper methods
  Job addSeen(Job job) {
    job.count += 1;

    return job;
  }
}
