class ProjectList
  def intialize
    @project = []
  end

  def projects=(list)
    @project = list.map(&:upcase)
  end

  def [](offset)
    @project[offset]
  end
end

list = ProjectList.new
list.projects = %w{ hi there hello world }
print list[2]
