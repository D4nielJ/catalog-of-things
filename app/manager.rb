class Manager
  attr_accessor :actions

  def initialize(obs, actions)
    obs.add_observer(self)
    @actions = actions
  end

  def update(msg)
    actions.each do |action|
      action.respond_to?(msg) && action.send(msg)
    end
  end
end
