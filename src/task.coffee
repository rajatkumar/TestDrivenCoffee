class Task
  constructor : (@name) ->
    #@name = name
    @status = 'incomplete'

  complete : ()->
    if @parent? and @parent.status isnt 'complete'
      return "Dependent task '#{@parent.name}' is not completed."
    @status = 'complete'
    return true

  dependsOn: (@parent) ->
    @parent.child = @
    @status = 'dependent'


class TaskList
  constructor: () ->
    @tasks = []
    @length = 0

  add: (task) ->
    if typeof task is 'string'
      @tasks.push new Task task
    else
      @tasks.push task
    @length = @tasks.length

  remove: (task) ->
    i = @tasks.indexOf task
    @tasks = @tasks[0...i].concat @tasks[i + 1..] if i > -1
    @length = @tasks.length

  print: ->
    str = "Tasks\n\n"
    for task in @tasks
      str += "- #{task.name}"
      str += " (depends on '#{task.parent.name}')" if task.parent?
      str += ' (complete)' if task.status is 'complete'
      str += "\n"
    str


module.exports = {Task, TaskList}